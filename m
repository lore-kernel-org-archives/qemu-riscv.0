Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMST7-0000sm-2z
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 07:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oMSSq-0000ms-3F
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 07:04:29 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oMSSf-0003eM-Si
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 07:04:19 -0400
Received: by mail-ej1-x62b.google.com with SMTP id tl27so1446055ejc.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 04:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=ygCcGWTvLWfrRDKfwA3TKExTQ1B1b7l3ix6u1KRE/Js=;
 b=edBgCrKaTIK3psjWnLJBpaN7zQDNir1LRo7wPWem75K7lDzEX+BaWnHN/OxnnrVRUg
 PGjXyEBz9BwBGDC9NNjUiiDVZzcGQVEdlDLYdQen+Taw68QzpRZ/ig5MriXuvle8XG6y
 lHkK8/MM47Z06nwQVCGVCnT/xot3kBof5Hk36CAA5UrjwpyvnZhO0z3PKtvl/aRyIvpV
 GUN8qJJpzPr17arwUHNaP3hMKZFHu4aqZJY+73E1Q4XJn+Be6Nk0d74FYkvk5y3EtUiU
 B36G0zM+330YJGxFERwoGgc+rNueLv0F4GGziVBZn1y0510QJcm+IMrxA2f9d+m+Hpuc
 Qd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=ygCcGWTvLWfrRDKfwA3TKExTQ1B1b7l3ix6u1KRE/Js=;
 b=U3GBJUMTqEwYU8+4hMM/0qdeA9P+7GkIBMZrYdkacqwVUCuRojb9S+acEtfFQdStxc
 P8Pv2e3yqiLe4pyg1z+W7uuzWoRV5zlZECYRPO1o3KN/vc59jbONdP/E/9kY1sONxv2z
 4ZxDUwZluRC7y1lJJ8btSYbVB//Sr8D0B/1VMXaoYBIk292ju9DHGucL2S0xBV9dg/hH
 vzIINH276tJJrmNWY5IDlI9j/LGRjmtLbq6jhuttBuMmEUO7oA6dMPP5l8H9WnwAGADB
 5D6AotVAElaBLRp6WiUK7XtTxUmyh78YwomIbdjpZ3+Jk8vrDAGfrvo0/JPdeItZkHXE
 sBEA==
X-Gm-Message-State: ACgBeo2IlIQ7SIXlRHWzCD5QKSutqL18XDdwKs/n+U1Usx8uMkgP7UIW
 AMWiLxh/Hc14IVOICo9iAuxHdA==
X-Google-Smtp-Source: AA6agR5P2wW6O0DDEb+QynlyBn6S1TQF46ARxW5RFNV+RQB7Vd9WtG4FJ8fo8rI/nWeHaoPFgvsq4A==
X-Received: by 2002:a17:907:96a1:b0:730:e0bd:1420 with SMTP id
 hd33-20020a17090796a100b00730e0bd1420mr2340613ejc.83.1660302252878; 
 Fri, 12 Aug 2022 04:04:12 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 q19-20020a17090676d300b0072fa24c2ecbsm679279ejn.94.2022.08.12.04.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 04:04:12 -0700 (PDT)
Date: Fri, 12 Aug 2022 13:04:11 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Furquan Shaikh <furquan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
Message-ID: <20220812110411.b3yx5yojrdrux6pd@kamzik>
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62b.google.com
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
X-List-Received-Date: Fri, 12 Aug 2022 11:04:36 -0000

On Thu, Aug 11, 2022 at 01:41:04PM -0700, Furquan Shaikh wrote:
> Unlike ARM, RISC-V does not define a separate breakpoint type for
> semihosting. Instead, it is entirely ABI. Thus, we need an option
> to allow users to configure what the ebreak behavior should be for
> different privilege levels - M, S, U, VS, VU. As per the RISC-V
> privilege specification[1], ebreak traps into the execution
> environment. However, RISC-V debug specification[2] provides
> ebreak{m,s,u,vs,vu} configuration bits to allow ebreak behavior to
> be configured to trap into debug mode instead. This change adds
> settable properties for RISC-V CPUs - `ebreakm`, `ebreaks`, `ebreaku`,
> `ebreakvs` and `ebreakvu` to allow user to configure whether qemu
> should treat ebreak as semihosting traps or trap according to the
> privilege specification.
> 
> [1] https://github.com/riscv/riscv-isa-manual/releases/download/draft-20220723-10eea63/riscv-privileged.pdf
> [2] https://github.com/riscv/riscv-debug-spec/blob/release/riscv-debug-release.pdf
> 
> Signed-off-by: Furquan Shaikh <furquan@rivosinc.com>
> ---
>  target/riscv/cpu.c        |  8 ++++++++
>  target/riscv/cpu.h        |  7 +++++++
>  target/riscv/cpu_helper.c | 26 +++++++++++++++++++++++++-
>  3 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac6f82ebd0..082194652b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -953,6 +953,14 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("short-isa-string", RISCVCPU,
> cfg.short_isa_string, false),
> 
>      DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
> +
> +    /* Debug spec */
> +    DEFINE_PROP_BOOL("ebreakm", RISCVCPU, cfg.ebreakm, true),
> +    DEFINE_PROP_BOOL("ebreaks", RISCVCPU, cfg.ebreaks, false),
> +    DEFINE_PROP_BOOL("ebreaku", RISCVCPU, cfg.ebreaku, false),
> +    DEFINE_PROP_BOOL("ebreakvs", RISCVCPU, cfg.ebreakvs, false),
> +    DEFINE_PROP_BOOL("ebreakvu", RISCVCPU, cfg.ebreakvu, false),
> +
>      DEFINE_PROP_END_OF_LIST(),
>  };
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5c7acc055a..eee8e487a6 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -454,6 +454,13 @@ struct RISCVCPUConfig {
>      bool epmp;
>      bool aia;
>      bool debug;
> +
> +    /* Debug spec */
> +    bool ebreakm;
> +    bool ebreaks;
> +    bool ebreaku;
> +    bool ebreakvs;
> +    bool ebreakvu;

There's only five of these, so having each separate probably makes the
most sense, but I wanted to point out that we could keep the properties
independent booleans, as we should, but still consolidate the values
into a single bitmap like we did for the sve vq bitmap for arm (see
cpu_arm_get/set_vq). Maybe worth considering?

>      uint64_t resetvec;
> 
>      bool short_isa_string;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 59b3680b1b..be09abbe27 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1314,6 +1314,30 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr
> address, int size,
> 
>      return true;
>  }
> +
> +static bool semihosting_enabled(RISCVCPU *cpu)
> +{
> +    CPURISCVState *env = &cpu->env;
> +
> +    switch (env->priv) {
> +    case PRV_M:
> +        return cpu->cfg.ebreakm;
> +    case PRV_S:
> +        if (riscv_cpu_virt_enabled(env)) {
> +            return cpu->cfg.ebreakvs;
> +        } else {
> +            return cpu->cfg.ebreaks;
> +        }
> +    case PRV_U:
> +        if (riscv_cpu_virt_enabled(env)) {
> +            return cpu->cfg.ebreakvu;
> +        } else {
> +            return cpu->cfg.ebreaku;
> +        }
> +    }
> +
> +    return false;
> +}
>  #endif /* !CONFIG_USER_ONLY */
> 
>  /*
> @@ -1342,7 +1366,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong mtval2 = 0;
> 
>      if  (cause == RISCV_EXCP_SEMIHOST) {
> -        if (env->priv >= PRV_S) {
> +        if (semihosting_enabled(cpu)) {
>              do_common_semihosting(cs);
>              env->pc += 4;
>              return;
> --
> 2.34.1
>

Bitmap or no bitmap,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

