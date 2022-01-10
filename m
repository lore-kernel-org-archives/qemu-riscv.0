Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6q1i-0001JJ-JM
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 03:27:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n6q1S-0001G8-R4; Mon, 10 Jan 2022 03:27:24 -0500
Received: from [2607:f8b0:4864:20::b31] (port=39489
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n6q1G-0003Vl-U7; Mon, 10 Jan 2022 03:27:22 -0500
Received: by mail-yb1-xb31.google.com with SMTP id d1so35886063ybh.6;
 Mon, 10 Jan 2022 00:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fnoiSlihgKzYJPgj/QeJ+deaGITy/G4IJaquhUuLYL0=;
 b=ZxsdqHzqOgmqwvI8alc64enUlQeaKvLVJTDxzi/4L1J4d6kBfDLYNixMfQsSlXZ2lk
 dBO3jL/SLsya5vwSdxGsvt89nf77mhUtoJSG4KXXk5rlQOvE52yX7IgQFfrm5kB7N+O7
 ClVIhR2svn6e+4d1OWYAp+Y1msNAC3tBQASArrvsacQnRydMscKkC7nauchM81ykK+GV
 yWAQgCKMQVXOKl4yrOClcISGluDvv+3Az9cgTT/VStQyHAT7afNC/oCP00EBnLQ76knn
 XuJ/XkzvGDThQxF/CQ/NbPrkEoehsfo275I3QLL5a+g85wFNTBLwzNu64YekEXbPFovJ
 RZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fnoiSlihgKzYJPgj/QeJ+deaGITy/G4IJaquhUuLYL0=;
 b=zxjwZgPMWX3uvFRX4v0uZO8nXlpvW68Lt73Z4GujJxV8FM5YchbRMwsE0a7ZWUuqIr
 452LlFx1JRoou8oKBtQK7gevn68kDCuzjpMGAYy5tRzBFyGsSnr9nKTO4LO0wD+ykIDD
 cHr7LlsqNoZSqqwYjKav35CAnRXb6yw6psT0n0mPgRPnkJJIMBeecH55JW2LGUII/fA1
 7ZrDi0XqeVlo3ahOegBDniQPdah/5i9t9gjgWHHuqswGVqkikHdNlCjUJCmg9DXTOQo3
 c541UJWQopGCRFGKEALiynututn+FBXP3g15dFnpdt9ZMhBvBfOmN9XAJwQH8Vto+GbQ
 MSJQ==
X-Gm-Message-State: AOAM533aBqSxVlKp2WC5r3SorZSGiLJFsCN4x9Ti11bTamo4j79GQI+m
 dfYuhSDMp74ivv0bTYSJ4vQPpEqpt4JEDNFEaN8=
X-Google-Smtp-Source: ABdhPJwbQxu0aEf7qM3ZyP0ucfJI0/DULm56XjOcr1Ky7makdonOwNJv2rN/KptGSBAA+j3IlchHHlSWACUCPuEuxP4=
X-Received: by 2002:a25:9012:: with SMTP id s18mr2148034ybl.148.1641803221908; 
 Mon, 10 Jan 2022 00:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20220107004846.378859-1-atishp@rivosinc.com>
 <20220107004846.378859-10-atishp@rivosinc.com>
In-Reply-To: <20220107004846.378859-10-atishp@rivosinc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 10 Jan 2022 16:26:50 +0800
Message-ID: <CAEUhbmUmdQxFmn8r1gNNrD8+QGP85=_P_Hqw5ocerbUzti-r4A@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] target/riscv: Simplify counter predicate function
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jan 2022 08:27:30 -0000

On Fri, Jan 7, 2022 at 10:22 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
> as a unified counter. Thus, the predicate function doesn't need handle each
> case separately.
>
> Simplify the predicate function so that we just handle things differently
> between RV32/RV64 and S/HS mode.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/csr.c | 111 ++++-----------------------------------------
>  1 file changed, 10 insertions(+), 101 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d3a8bba6a518..feb053eb3f7b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -109,6 +109,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>      CPUState *cs = env_cpu(env);
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      int ctr_index;
> +    uint64_t ctr_mask;

Use target_ulong should be enough?

>      int base_csrno = CSR_CYCLE;
>      bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
>
> @@ -117,122 +118,30 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>          base_csrno += 0x80;
>      }
>      ctr_index = csrno - base_csrno;
> +    ctr_mask = BIT(ctr_index);
>
>      if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
>          (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
>          goto skip_ext_pmu_check;
>      }
>
> -    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
> +    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & ctr_mask))) {
>          /* No counter is enabled in PMU or the counter is out of range */
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
>  skip_ext_pmu_check:
>
> -    if (env->priv == PRV_S) {
> -        switch (csrno) {
> -        case CSR_CYCLE:
> -            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_TIME:
> -            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_INSTRET:
> -            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            if (!get_field(env->mcounteren, 1 << ctr_index)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        }
> -        if (rv32) {
> -            switch (csrno) {
> -            case CSR_CYCLEH:
> -                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_TIMEH:
> -                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_INSTRETH:
> -                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                if (!get_field(env->mcounteren, 1 << ctr_index)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            }
> -        }
> +    if ((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) {
> +        return RISCV_EXCP_ILLEGAL_INST;
>      }
>
>      if (riscv_cpu_virt_enabled(env)) {
> -        switch (csrno) {
> -        case CSR_CYCLE:
> -            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> -                get_field(env->mcounteren, COUNTEREN_CY)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_TIME:
> -            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> -                get_field(env->mcounteren, COUNTEREN_TM)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_INSTRET:
> -            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> -                get_field(env->mcounteren, COUNTEREN_IR)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            if (!get_field(env->hcounteren, 1 << ctr_index) &&
> -                 get_field(env->mcounteren, 1 << ctr_index)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        }
> -        if (rv32) {
> -            switch (csrno) {
> -            case CSR_CYCLEH:
> -                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> -                    get_field(env->mcounteren, COUNTEREN_CY)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_TIMEH:
> -                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> -                    get_field(env->mcounteren, COUNTEREN_TM)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_INSTRETH:
> -                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> -                    get_field(env->mcounteren, COUNTEREN_IR)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                if (!get_field(env->hcounteren, 1 << ctr_index) &&
> -                     get_field(env->mcounteren, 1 << ctr_index)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            }
> +        if (!get_field(env->mcounteren, ctr_mask)) {
> +            /* The bit must be set in mcountern for HS mode access */
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        } else if (!get_field(env->hcounteren, ctr_mask)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
>      }

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

