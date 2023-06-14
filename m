Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65518EB64D9
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 09:19:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9Mec-0004ui-LH; Wed, 14 Jun 2023 05:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9Meb-0004uG-5C
 for qemu-riscv@nongnu.org; Wed, 14 Jun 2023 05:19:01 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9MeZ-0000Hr-DE
 for qemu-riscv@nongnu.org; Wed, 14 Jun 2023 05:19:00 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-39c84863e7cso3796179b6e.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Jun 2023 02:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686734336; x=1689326336;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SqAbzZep/a8AXhsUZSxukYHEf/p1Y4KwxvXcGYLVHqg=;
 b=RbDUErBYo6FBQ/Vlql7AZVdFjtDFwqbxrHjyPzVdsor3hKt+Fox1tV0/IN1NBYjKlz
 0JygA8uzJMAJwcOboFQtRiBxYM7MbbdPXj7HlI32YMUQswZrN7AFRy0e2H5gAE2ECnrp
 jbDgjJv4kF20Ougckc/8TWzZ9zX2qjKyecR0xbWulV5HpMAW0Fg1+sjxVMvK3ZnJOx3A
 Q3AuVM3qo7q7UY3j8tTsQBu2Y4wQBlR2+t/veyH06dO3e7ZLVVb9+i70G6e7A2DdSpt8
 ZZZ5ayjvkJNu0JRMvkY9TnkTiWZ9asfmVQR1bOZtI8zsZNd6DC4F/xlEx5DYc2WFDM3f
 1ocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686734336; x=1689326336;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SqAbzZep/a8AXhsUZSxukYHEf/p1Y4KwxvXcGYLVHqg=;
 b=XPXpVYVAe55dMuP4Ki3/SjMBaKTMZ2AxeQd22rQgvZ42/r7/qJ6NsCOPaAwlhNfJuH
 lq607MnnuAk6X/FM5W1qiLaFdNpVsav2zVwqx1RBImD9bWe36vwyxM+mi1dbMVd/AWsG
 Xig7VJyp+UZmf9QNk7AiL367ZZqa2J06TDxnSeMK7gU9CeZoHee4PCrAai8dPHtW3KeI
 thvXuC/5H5W2hY7SyBAyijdJaw0OhOXDG45WyEYBW8sZndXncou0JZAKR8iA8lQC4A4a
 D4cDamD6in4eAPnpE89gTQ8gKlABSvqerTxooMgSLLfRxs6WMlOU/HOMpnfxxj5Iwm5V
 d+Jg==
X-Gm-Message-State: AC+VfDyNAIKMuSdir8ae5yEa4DHlMOYksOEoU0XED9PFGwuyVR4AshOl
 9wItmrN70koZiOGxC30nTm8waQ==
X-Google-Smtp-Source: ACHHUZ71Q4+N4MEqb4B3fPPpgGOhERetEnfnWucz2pB2rgAayGQlvrVjgvQ1tKCbB2j3WvOKj2m9fw==
X-Received: by 2002:a05:6808:d4e:b0:398:2cfa:85e7 with SMTP id
 w14-20020a0568080d4e00b003982cfa85e7mr11235165oik.11.1686734336105; 
 Wed, 14 Jun 2023 02:18:56 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.210])
 by smtp.gmail.com with ESMTPSA id
 o127-20020acad785000000b0039c8a62cadasm6030018oig.19.2023.06.14.02.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 02:18:55 -0700 (PDT)
Message-ID: <1efee8f3-7c16-d33e-950d-c919ff0befd1@ventanamicro.com>
Date: Wed, 14 Jun 2023 06:18:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] target/riscv: Add additional xlen for address when
 MPRV=1
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230614032547.35895-1-liweiwei@iscas.ac.cn>
 <20230614032547.35895-2-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230614032547.35895-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 6/14/23 00:25, Weiwei Li wrote:
> As specified in privilege spec:"When MPRV=1, load and store memory
> addresses are treated as though the current XLEN were set to MPP’s
> XLEN". So the xlen for address may be different from current xlen.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.h        | 49 +++++++++++++++++++++++++++++++++------
>   target/riscv/cpu_helper.c |  1 +
>   target/riscv/translate.c  | 13 ++++++++++-
>   3 files changed, 55 insertions(+), 8 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e3e08d315f..cc20ee25a7 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -498,6 +498,7 @@ FIELD(TB_FLAGS, ITRIGGER, 22, 1)
>   /* Virtual mode enabled */
>   FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
>   FIELD(TB_FLAGS, PRIV, 24, 2)
> +FIELD(TB_FLAGS, AXL, 26, 2)
>   
>   #ifdef TARGET_RISCV32
>   #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> @@ -514,13 +515,20 @@ static inline const RISCVCPUConfig *riscv_cpu_cfg(CPURISCVState *env)
>       return &env_archcpu(env)->cfg;
>   }
>   
> -#if defined(TARGET_RISCV32)
> -#define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
> -#else
> -static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
> +#if !defined(CONFIG_USER_ONLY)
> +static inline int cpu_address_mode(CPURISCVState *env)
> +{
> +    int mode = env->priv;
> +
> +    if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
> +        mode = get_field(env->mstatus, MSTATUS_MPP);
> +    }
> +    return mode;
> +}
> +
> +static inline RISCVMXL cpu_get_xl(CPURISCVState *env, target_ulong mode)
>   {
>       RISCVMXL xl = env->misa_mxl;
> -#if !defined(CONFIG_USER_ONLY)
>       /*
>        * When emulating a 32-bit-only cpu, use RV32.
>        * When emulating a 64-bit cpu, and MXL has been reduced to RV32,
> @@ -528,7 +536,7 @@ static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
>        * back to RV64 for lower privs.
>        */
>       if (xl != MXL_RV32) {
> -        switch (env->priv) {
> +        switch (mode) {
>           case PRV_M:
>               break;
>           case PRV_U:
> @@ -539,11 +547,38 @@ static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
>               break;
>           }
>       }
> -#endif
>       return xl;
>   }
>   #endif
>   
> +#if defined(TARGET_RISCV32)
> +#define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
> +#else
> +static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
> +{
> +#if !defined(CONFIG_USER_ONLY)
> +    return cpu_get_xl(env, env->priv);
> +#else
> +    return env->misa_mxl;
> +#endif
> +}
> +#endif
> +
> +#if defined(TARGET_RISCV32)
> +#define cpu_address_xl(env)  ((void)(env), MXL_RV32)
> +#else
> +static inline RISCVMXL cpu_address_xl(CPURISCVState *env)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    return env->xl;
> +#else
> +    int mode = cpu_address_mode(env);
> +
> +    return cpu_get_xl(env, mode);
> +#endif
> +}
> +#endif
> +
>   static inline int riscv_cpu_xlen(CPURISCVState *env)
>   {
>       return 16 << env->xl;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 90cef9856d..f85113a3db 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -134,6 +134,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>       flags = FIELD_DP32(flags, TB_FLAGS, FS, fs);
>       flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
>       flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
> +    flags = FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
>       if (env->cur_pmmask != 0) {
>           flags = FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
>       }
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 8a33da811e..4bf61766b6 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -64,6 +64,7 @@ typedef struct DisasContext {
>       target_ulong priv_ver;
>       RISCVMXL misa_mxl_max;
>       RISCVMXL xl;
> +    RISCVMXL address_xl;
>       uint32_t misa_ext;
>       uint32_t opcode;
>       RISCVExtStatus mstatus_fs;
> @@ -152,6 +153,14 @@ MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
>   #define get_xl(ctx)    ((ctx)->xl)
>   #endif
>   
> +#ifdef TARGET_RISCV32
> +#define get_address_xl(ctx)    MXL_RV32
> +#elif defined(CONFIG_USER_ONLY)
> +#define get_address_xl(ctx)    MXL_RV64
> +#else
> +#define get_address_xl(ctx)    ((ctx)->address_xl)
> +#endif
> +
>   /* The word size for this machine mode. */
>   static inline int __attribute__((unused)) get_xlen(DisasContext *ctx)
>   {
> @@ -598,12 +607,13 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
>       tcg_gen_addi_tl(addr, src1, imm);
>       if (ctx->pm_mask_enabled) {
>           tcg_gen_andc_tl(addr, addr, pm_mask);
> -    } else if (get_xl(ctx) == MXL_RV32) {
> +    } else if (get_address_xl(ctx) == MXL_RV32) {
>           tcg_gen_ext32u_tl(addr, addr);
>       }
>       if (ctx->pm_base_enabled) {
>           tcg_gen_or_tl(addr, addr, pm_base);
>       }
> +
>       return addr;
>   }
>   
> @@ -1200,6 +1210,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
>       ctx->misa_mxl_max = env->misa_mxl_max;
>       ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
> +    ctx->address_xl = FIELD_EX32(tb_flags, TB_FLAGS, AXL);
>       ctx->cs = cs;
>       ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
>       ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);

