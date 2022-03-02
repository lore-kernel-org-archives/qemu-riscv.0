Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPXjC-0008Ql-2M
	for mharc-qemu-riscv@gnu.org; Wed, 02 Mar 2022 17:45:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nPXj8-0008PN-3J; Wed, 02 Mar 2022 17:45:46 -0500
Received: from [2607:f8b0:4864:20::d29] (port=42880
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nPXj5-00076r-L7; Wed, 02 Mar 2022 17:45:45 -0500
Received: by mail-io1-xd29.google.com with SMTP id r8so3739110ioj.9;
 Wed, 02 Mar 2022 14:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ak/P3IEFtw8n5LgpQF7kecus2FJnsPRFErIoAK848iI=;
 b=PcC4WG03EAc+LNA5bmE8X1RoNAjTZ8pwOogpwsYT8M6pp6ktuu/Rhdq+S+6OTptvb3
 UlzOBMIQNVrWB5RDc7qJRv6b36UOqWMjkd7XDVMsv/PUm8UO1KfTJdxZ7I61nNAckofY
 IKvfPULmWEmAeVqc9nc6qhUqvUMevJaPFdSiRCeiPXNZQjRZh85Ow79gjPpHVHvIhR4i
 lM/Ev8zfJ6B39LyPrX36VZiaAX3GoBX4jky92yxeHkb6eecMWMIqcl8msga9iCtvrZLH
 5+GFf91W/gRPGtSZfLcwk3K4ipkuSW7/1ezmeplgrvhXLDzZcDZDIhsNn8u5prGQT0A3
 SsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ak/P3IEFtw8n5LgpQF7kecus2FJnsPRFErIoAK848iI=;
 b=bLeIVmWizlxrMF/lJGfVGeQY/odVLeSKdXgNr/sB4pgjb7Ytx46f12vDnG9XjQ1MX0
 jZVk0xbUtF9O8B+pFVeIG1h562eJDUMGO/8DfuHJz3XVHAXuruXCzxmQXg5JMagciu5D
 0ROukB//OnGd51W4w/prImygE03IlIwo5Xv4IdjjQejK9+4JYOTLTSTC0Zho6WD4FLrV
 fO6jrHAt5Tov/I+oP7kTlTI8908CPchcc0fTLXbKub0+80tl2VZdJ7+hLs1ceBZRZZkf
 aEtF53YBbH7t5Kzdz0XA8i8gQwullLa+moR6waZM3RZYb19g0slYUmikDaElRhdH6D3d
 uiMQ==
X-Gm-Message-State: AOAM531W227FOoKzmG9JVIafvV+axqzWM89D3FbJ/GSqMPHXMP6sKBP/
 zjp39SjN1wgstEqXLabCRjHRCCyg8DixNsQeSJ4=
X-Google-Smtp-Source: ABdhPJwg+wr0Hl9FCXjlIrREyIYnBtdmLQw7jaMcQHRo9KYiwh1Y/+8PdPp+/8gGZeTHlispIOmrvppSkHXYOSq3Flo=
X-Received: by 2002:a6b:e707:0:b0:640:7c3f:e93d with SMTP id
 b7-20020a6be707000000b006407c3fe93dmr24586127ioh.114.1646261142197; Wed, 02
 Mar 2022 14:45:42 -0800 (PST)
MIME-Version: 1.0
References: <20220219002518.1936806-1-atishp@rivosinc.com>
 <20220219002518.1936806-10-atishp@rivosinc.com>
In-Reply-To: <20220219002518.1936806-10-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 3 Mar 2022 08:45:15 +1000
Message-ID: <CAKmqyKPwSf3f1pj6WK6NSqaEkwn0R88pVYHk2+eXooK7HKQtjw@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] target/riscv: Simplify counter predicate function
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 02 Mar 2022 22:45:47 -0000

On Sat, Feb 19, 2022 at 10:37 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
> as a unified counter. Thus, the predicate function doesn't need handle each
> case separately.
>
> Simplify the predicate function so that we just handle things differently
> between RV32/RV64 and S/HS mode.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 111 ++++-----------------------------------------
>  1 file changed, 10 insertions(+), 101 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0071b13bc50f..54966a770672 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -113,6 +113,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>      CPUState *cs = env_cpu(env);
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      int ctr_index;
> +    target_ulong ctr_mask;
>      int base_csrno = CSR_CYCLE;
>      bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
>
> @@ -121,122 +122,30 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
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
>  #endif
> --
> 2.30.2
>
>

