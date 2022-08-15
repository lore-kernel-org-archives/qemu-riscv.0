Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNUvm-0004KJ-Jj
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 03:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oNUva-0004H6-VD
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 03:54:29 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oNUvZ-0004qL-79
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 03:54:26 -0400
Received: by mail-ed1-x529.google.com with SMTP id f22so8622675edc.7
 for <qemu-riscv@nongnu.org>; Mon, 15 Aug 2022 00:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=/zOrrl41ZeMxZPte40wc8fLDGbwTVlgATQ/g681F1CE=;
 b=aTp/h0+nfG0naQZkU5OtwdlwZEjjbHE+ZQ8irrpa+NyAiqBbKeHNlGT0hf1YKqx1Bu
 kpJQeM0YA2gTFO1G1JzCwDxaMPMMkjbfLC4aFyJdXPI56b4bx2hsCCBXSym12BRLcwV9
 Rt/ivsnt2LtEwAuypE5LF2oxou0f7K28XCEfAlL3yeKP6fP6Cd00mt9ye7Xl0abswF+8
 0vREhlZcI55qh8FWrzs5fsK62oKMwF5VSd3+zYebT8SavMMMSUjno2Fu2C64Q1H2KTVb
 h0mZjZXbRCdK3B7/QdIthwDNXoajGzTmhogS9C/s5pjQBh8/95uKBDUyZ4icmH8Gd1LA
 hNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=/zOrrl41ZeMxZPte40wc8fLDGbwTVlgATQ/g681F1CE=;
 b=KidqMp17h9tCKvkw70bcZqO96vbvX4NPXnQCLgK8O6KFll4ku6Qd9IH4Sh2WPsDJU2
 YBbVvc+ipcUS8NBscPyDE2J61UP83iAIhYSkVUTGSKK3xBsVw3LgyvrBrx+7OcYHesB7
 DxpSaQO4Rn8maAjo5S0eSDyWv8yy3Jy7iuAV0F97CA+eqV/Z2oVhgmJuG8zRaXj5ZGh/
 oAMN9WzwjP1Ef4TSxk07RDxrlmExZKQQ2sLETzSZSwijCgHAS/58GBqS6d8omrRguU2f
 bEvm5mDpRqfp5+8sPecZrh4dZkEdnVOkdJGHwr8S85oWR0+QRXirqKpi1fuwcPK6WDE7
 041Q==
X-Gm-Message-State: ACgBeo3mDQzjcVQp0oNJchwEpRnRbGDWEsdKrhpfRh53ZeQb6lRE9ULn
 PJ1R6W8kqlp7J4GMiYKP2FwfNA==
X-Google-Smtp-Source: AA6agR6kGYPK8htRY2VSKi0AOlT50CquFrkZCforcWTbmthD3J/BfGRQJmjiYHvN4b/IlE7GuO1HhQ==
X-Received: by 2002:a05:6402:184:b0:442:fd54:2a21 with SMTP id
 r4-20020a056402018400b00442fd542a21mr13364467edv.129.1660550059781; 
 Mon, 15 Aug 2022 00:54:19 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 gq17-20020a170906e25100b00730e5397057sm3729169ejb.185.2022.08.15.00.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 00:54:18 -0700 (PDT)
Date: Mon, 15 Aug 2022 09:54:17 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH v12 2/6] target/riscv: Simplify counter predicate function
Message-ID: <20220815075417.nhfdzw3b5ysygct3@kamzik>
References: <20220802233307.2106839-1-atishp@rivosinc.com>
 <20220802233307.2106839-3-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802233307.2106839-3-atishp@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 15 Aug 2022 07:54:34 -0000

On Tue, Aug 02, 2022 at 04:33:03PM -0700, Atish Patra wrote:
> All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
> as a unified counter. Thus, the predicate function doesn't need handle each
> case separately.
> 
> Simplify the predicate function so that we just handle things differently
> between RV32/RV64 and S/HS mode.
> 
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/csr.c | 110 ++++-----------------------------------------
>  1 file changed, 9 insertions(+), 101 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9b45c49ab45f..6690b72ea0e7 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>      CPUState *cs = env_cpu(env);
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      int ctr_index;
> +    target_ulong ctr_mask;
>      int base_csrno = CSR_CYCLE;
>      bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
>  
> @@ -82,122 +83,29 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
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
> +    if (!(cpu->pmu_avail_ctrs & ctr_mask)) {
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
> +    if (((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) ||
> +       ((env->priv == PRV_U) && (!get_field(env->scounteren, ctr_mask)))) {
    ^ there should be another space here

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
> +        if (!get_field(env->hcounteren, ctr_mask) &&
> +           get_field(env->mcounteren, ctr_mask)) {
     ^ and here
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
>      }
>  #endif
> -- 
> 2.25.1
> 
>

Thanks,
drew

