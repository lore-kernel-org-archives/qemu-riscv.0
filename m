Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CFDC83F01
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 11:01:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbfQ3-0006ke-KL; Thu, 31 Aug 2023 07:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbfQ1-0006je-08
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 07:00:57 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbfPx-0007Ly-OM
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 07:00:56 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9a21b6d105cso75271066b.3
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 04:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693479651; x=1694084451; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k9WbQJo8R/rKJAdJtcTKlX1Tt7tf+C9DxhqO5Qvimc4=;
 b=pNyhpCd/Wrabeyv9kb98gIvF/WuR1aecDS1k2Kz21Vu7UNcwGrw2ZEvsqHTbtqieVD
 qepRT0hd2/Awspb0q4IoIb/U8cKHn67ZvYhGcbGFM7hslOzW1JcuE1LN2ZosxgiYxtYH
 yxNhCIRrGljW6wGUBj0h22cV8KUEYHCuxtMhX6h8Iez7I82EyXHEU1arvBCyGi8mo7Hf
 1zRhEzB29hvLwhsnSQCPqHv38CG/I5Wo9MGCCEEbLmO+6hfR2bxuTLLqZ5/6VDOAIkB7
 glb27k3iNmACWoyNBM/ONt9LJHRPBwGBfuqyRJKOBlY9wp1ELex2MrPgUHVpWPNa6R5D
 DlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693479651; x=1694084451;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k9WbQJo8R/rKJAdJtcTKlX1Tt7tf+C9DxhqO5Qvimc4=;
 b=iG/Bwjz0kvykEmp7MjEtsc/YJjwBzcR4x7QJi6LNtX8qyTyQ1sq36PS63tx4yv2diO
 +RG9MuZWQbWyB+2kYktViQrv4EprVnXaoSpYmr58EiJwAroD8YHQSDI3Bx8qeZiMaGRQ
 p08EymXWSensTbdSrSV2UABSbrc11RdTRC4txo3kswevc5wyBk5NvVh515HwMIqka0kj
 9QPQ1s1ZKDOyaTx7SKa1DEb8W0Ygq0sy4bq6dR16IRhQ+SMoFByJNsHf8AwMbe5r4o8J
 f077YY5TTrh28SDw0li0OCxYS3HnPQl4h9AtXKwlqjt6mpWY4lTEx0xkTfFVnh/oae7T
 8Wqw==
X-Gm-Message-State: AOJu0YxwS8e2rgQNvgK82RaoHobYB1XMPFl60kM9U/mmxvtvXyut8iPl
 3zw8k9a0kznDt/ZS6/2qrx4+5A==
X-Google-Smtp-Source: AGHT+IH4PgtIkdl2tyrRMxp1JJC8NsD+yxbhJ+KYqcH1a/8fRE01rblrY3lkob7dmw26IQSLqKpOVQ==
X-Received: by 2002:a17:906:5a6b:b0:9a5:9305:8402 with SMTP id
 my43-20020a1709065a6b00b009a593058402mr3566621ejc.51.1693479650733; 
 Thu, 31 Aug 2023 04:00:50 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 cf20-20020a170906b2d400b00988dbbd1f7esm622505ejb.213.2023.08.31.04.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 04:00:50 -0700 (PDT)
Date: Thu, 31 Aug 2023 13:00:49 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 07/20] target/riscv/cpu.c: add .instance_post_init()
Message-ID: <20230831-863a8334e34c5248fa71d7bf@orel>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-8-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825130853.511782-8-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Aug 25, 2023 at 10:08:40AM -0300, Daniel Henrique Barboza wrote:
> All generic CPUs call riscv_cpu_add_user_properties(). The 'max' CPU
> calls riscv_init_max_cpu_extensions(). Both can be moved to a common
> instance_post_init() callback, implemented in riscv_cpu_post_init(),
> called by all CPUs. The call order then becomes:
> 
> riscv_cpu_init() -> cpu_init() of each CPU -> .instance_post_init()
> 
> A CPU class that wants to add user flags will let us know via the
> 'user_extension_properties' property. Likewise, 'cfg.max_features' will
> determine if any given CPU, regardless of being the 'max' CPU or not,
> wants to enable the maximum amount of extensions.
> 
> In the near future riscv_cpu_post_init() will call the init() function
> of the current accelerator, providing a hook for KVM and TCG accel
> classes to change the init() process of the CPU.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c35d58c64b..f67b782675 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -430,8 +430,6 @@ static void riscv_max_cpu_init(Object *obj)
>      mlx = MXL_RV32;
>  #endif
>      set_misa(env, mlx, 0);
> -    riscv_cpu_add_user_properties(obj);
> -    riscv_init_max_cpu_extensions(obj);
>      env->priv_ver = PRIV_VERSION_LATEST;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), mlx == MXL_RV32 ?
> @@ -445,7 +443,6 @@ static void rv64_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV64, 0);
> -    riscv_cpu_add_user_properties(obj);
>      /* Set latest version of privileged specification */
>      env->priv_ver = PRIV_VERSION_LATEST;
>  #ifndef CONFIG_USER_ONLY
> @@ -569,7 +566,6 @@ static void rv128_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV128, 0);
> -    riscv_cpu_add_user_properties(obj);
>      /* Set latest version of privileged specification */
>      env->priv_ver = PRIV_VERSION_LATEST;
>  #ifndef CONFIG_USER_ONLY
> @@ -582,7 +578,6 @@ static void rv32_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV32, 0);
> -    riscv_cpu_add_user_properties(obj);
>      /* Set latest version of privileged specification */
>      env->priv_ver = PRIV_VERSION_LATEST;
>  #ifndef CONFIG_USER_ONLY
> @@ -1212,6 +1207,20 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>  }
>  #endif /* CONFIG_USER_ONLY */
>  
> +static void riscv_cpu_post_init(Object *obj)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    RISCVCPUClass *rcc = RISCV_CPU_GET_CLASS(cpu);
> +
> +    if (rcc->user_extension_properties) {

It's not yet clear to me why we need 'user_extension_properties'. Can't we
just do the 'object_dynamic_cast(obj, TYPE_RISCV_DYNAMIC_CPU) != NULL'
check here?

> +        riscv_cpu_add_user_properties(obj);
> +    }
> +
> +    if (cpu->cfg.max_features) {

It's also not yet clear why we need max_features. I can't think of any
other models that want max_features besides 'max'. Checking the cpu type
here should be sufficient, no?

> +        riscv_init_max_cpu_extensions(obj);
> +    }
> +}
> +
>  static void riscv_cpu_init(Object *obj)
>  {
>      RISCVCPU *cpu = RISCV_CPU(obj);
> @@ -2019,6 +2028,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>          .instance_size = sizeof(RISCVCPU),
>          .instance_align = __alignof__(RISCVCPU),
>          .instance_init = riscv_cpu_init,
> +        .instance_post_init = riscv_cpu_post_init,
>          .abstract = true,
>          .class_size = sizeof(RISCVCPUClass),
>          .class_init = riscv_cpu_class_init,
> -- 
> 2.41.0
> 
>

Thanks,
drew

