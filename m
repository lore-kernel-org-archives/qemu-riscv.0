Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nu826-0008K3-KO
	for mharc-qemu-riscv@gnu.org; Thu, 26 May 2022 03:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nu81r-0008Hb-M4
 for qemu-riscv@nongnu.org; Thu, 26 May 2022 03:35:34 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:44774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nu81o-0000E5-6P
 for qemu-riscv@nongnu.org; Thu, 26 May 2022 03:35:29 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id q184so1533912ybg.11
 for <qemu-riscv@nongnu.org>; Thu, 26 May 2022 00:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lq2mT/z36TTERjhSMQY/YGBnpj+e+SOGoCr8PZ2RBeY=;
 b=TmyGdGayBn+WaAftSvipCS+g4FXfDR0ivQcC+55KtZ5VrthH4CNpsL5enX52geX0UN
 hwYFx2Myv8czw25tHI2IIOQn+Y3bamb/l0WCPbSkRXSgbMZOv1gUVk9V3w8ji48caEwG
 +R0OwJ7NAMLDjMbkhfAsCUBJ1DBIyPL9EI1Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lq2mT/z36TTERjhSMQY/YGBnpj+e+SOGoCr8PZ2RBeY=;
 b=m76c4TPxUsiLrSbl1G99Ae6UQH9iWHBKUGJIgDW8N6vB0HsPcvYusczzJZLNMpnHQa
 P9vQsFrxlHAJUBuLx7JZa453c3yC+i1xwysUi7MySFfZH5Q0gIA7nQm33BXmeC0APKby
 MF+OgSQnMjslKgXrXhv+VA4O0dLT1l0062ziiCXJhlVUrz6BVKu01ALI9JAhYPzYkOqW
 ntzP87cRkx/C3azmBx6fTvnP/MNXyEmpFq6PAxyINGdpY0FUKX4X1LXRFAlkV50m5c5t
 kRYkkewNZK98S4wRQU30oSjzhMrRgBjcFOCCmM5y67bww+V+ri8yGKiQlw2B00T/hDF3
 ZwcA==
X-Gm-Message-State: AOAM530kgyqbJYd1eb6a5W0D4pcWvAWLYbWTSa7TPZmYeigStJ8uKqI5
 ryHV2MpHuaa7qBMKsBnsJLpWsGqmD9rTXvv+bNTx
X-Google-Smtp-Source: ABdhPJzbHFPaT1uxINBkv0WQDLx8ufC4x17Ec2dg8FMYgsPPHvim7AMTvfOvUCddwHDAdzCImkVO89rWZ6u7JhmYlII=
X-Received: by 2002:a25:316:0:b0:654:a65f:def4 with SMTP id
 22-20020a250316000000b00654a65fdef4mr9863793ybd.429.1653550527091; Thu, 26
 May 2022 00:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220523235057.123882-1-atishp@rivosinc.com>
 <20220523235057.123882-10-atishp@rivosinc.com>
 <CANzO1D3o2iMV45hJW3-xWFtXW9g-iOO2EsrSUFzm_wDdMBNBSw@mail.gmail.com>
In-Reply-To: <CANzO1D3o2iMV45hJW3-xWFtXW9g-iOO2EsrSUFzm_wDdMBNBSw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 26 May 2022 00:35:16 -0700
Message-ID: <CAOnJCUL0_R18GY3b00tcW3Pez49McuYBL0+Lan2h-w7x1LuOYA@mail.gmail.com>
Subject: Re: [PATCH v9 09/12] target/riscv: Simplify counter predicate function
To: Frank Chang <frank.chang@sifive.com>
Cc: Atish Patra <atishp@rivosinc.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 26 May 2022 07:35:39 -0000

On Wed, May 25, 2022 at 3:24 AM Frank Chang <frank.chang@sifive.com> wrote:
>
> On Tue, May 24, 2022 at 8:02 AM Atish Patra <atishp@rivosinc.com> wrote:
>>
>> All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
>> as a unified counter. Thus, the predicate function doesn't need handle each
>> case separately.
>>
>> Simplify the predicate function so that we just handle things differently
>> between RV32/RV64 and S/HS mode.
>>
>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>  target/riscv/csr.c | 111 ++++-----------------------------------------
>>  1 file changed, 10 insertions(+), 101 deletions(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 723b52d836d3..e229f53c674d 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>>      CPUState *cs = env_cpu(env);
>>      RISCVCPU *cpu = RISCV_CPU(cs);
>>      int ctr_index;
>> +    target_ulong ctr_mask;
>>      int base_csrno = CSR_CYCLE;
>>      bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
>>
>> @@ -82,122 +83,30 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>>          base_csrno += 0x80;
>>      }
>>      ctr_index = csrno - base_csrno;
>> +    ctr_mask = BIT(ctr_index);
>>
>>      if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
>>          (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
>>          goto skip_ext_pmu_check;
>>      }
>>
>> -    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
>> +    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & ctr_mask))) {
>>          /* No counter is enabled in PMU or the counter is out of range */
>>          return RISCV_EXCP_ILLEGAL_INST;
>>      }
>>
>>  skip_ext_pmu_check:
>>
>> -    if (env->priv == PRV_S) {
>> -        switch (csrno) {
>> -        case CSR_CYCLE:
>> -            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
>> -                return RISCV_EXCP_ILLEGAL_INST;
>> -            }
>> -            break;
>> -        case CSR_TIME:
>> -            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
>> -                return RISCV_EXCP_ILLEGAL_INST;
>> -            }
>> -            break;
>> -        case CSR_INSTRET:
>> -            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
>> -                return RISCV_EXCP_ILLEGAL_INST;
>> -            }
>> -            break;
>> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
>> -            if (!get_field(env->mcounteren, 1 << ctr_index)) {
>> -                return RISCV_EXCP_ILLEGAL_INST;
>> -            }
>> -            break;
>> -        }
>> -        if (rv32) {
>> -            switch (csrno) {
>> -            case CSR_CYCLEH:
>> -                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
>> -                    return RISCV_EXCP_ILLEGAL_INST;
>> -                }
>> -                break;
>> -            case CSR_TIMEH:
>> -                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
>> -                    return RISCV_EXCP_ILLEGAL_INST;
>> -                }
>> -                break;
>> -            case CSR_INSTRETH:
>> -                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
>> -                    return RISCV_EXCP_ILLEGAL_INST;
>> -                }
>> -                break;
>> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
>> -                if (!get_field(env->mcounteren, 1 << ctr_index)) {
>> -                    return RISCV_EXCP_ILLEGAL_INST;
>> -                }
>> -                break;
>> -            }
>> -        }
>> +    if ((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) {
>
>
> Should we also check PRV_U against env->scounteren here?
>

Ahh yes. That's required while hpmcounter is being accessed from the
userspace. Good catch. Thanks. Will fix it.

> Regards,
> Frank Chang
>
>>
>> +        return RISCV_EXCP_ILLEGAL_INST;
>>      }
>>
>>      if (riscv_cpu_virt_enabled(env)) {
>> -        switch (csrno) {
>> -        case CSR_CYCLE:
>> -            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
>> -                get_field(env->mcounteren, COUNTEREN_CY)) {
>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -            }
>> -            break;
>> -        case CSR_TIME:
>> -            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
>> -                get_field(env->mcounteren, COUNTEREN_TM)) {
>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -            }
>> -            break;
>> -        case CSR_INSTRET:
>> -            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
>> -                get_field(env->mcounteren, COUNTEREN_IR)) {
>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -            }
>> -            break;
>> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
>> -            if (!get_field(env->hcounteren, 1 << ctr_index) &&
>> -                 get_field(env->mcounteren, 1 << ctr_index)) {
>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -            }
>> -            break;
>> -        }
>> -        if (rv32) {
>> -            switch (csrno) {
>> -            case CSR_CYCLEH:
>> -                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
>> -                    get_field(env->mcounteren, COUNTEREN_CY)) {
>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -                }
>> -                break;
>> -            case CSR_TIMEH:
>> -                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
>> -                    get_field(env->mcounteren, COUNTEREN_TM)) {
>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -                }
>> -                break;
>> -            case CSR_INSTRETH:
>> -                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
>> -                    get_field(env->mcounteren, COUNTEREN_IR)) {
>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -                }
>> -                break;
>> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
>> -                if (!get_field(env->hcounteren, 1 << ctr_index) &&
>> -                     get_field(env->mcounteren, 1 << ctr_index)) {
>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -                }
>> -                break;
>> -            }
>> +        if (!get_field(env->mcounteren, ctr_mask)) {
>> +            /* The bit must be set in mcountern for HS mode access */
>> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> +        } else if (!get_field(env->hcounteren, ctr_mask)) {
>> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>          }
>>      }
>>  #endif
>> --
>> 2.25.1
>>
>>


-- 
Regards,
Atish

