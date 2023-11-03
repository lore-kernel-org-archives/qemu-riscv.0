Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E155EC4332F
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 08:37:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qypg5-0004V9-UQ; Fri, 03 Nov 2023 04:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qypg3-0004Ub-Ml
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 04:37:15 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qypg0-0006eH-3g
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 04:37:14 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507e85ebf50so2187287e87.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 01:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699000628; x=1699605428; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sWbyJPiWj/6RAN7BO5vb8iTksoyPvRj7VcNW0Pa/HFA=;
 b=ELyjZS/QkrlztnmG6PILoptkjOIQOAqVVQPBU8d6K6AwGLgnGCdh2tfUbqGSv+CD7F
 NEop6XdCRTICSa0pqdzgBdcBhCWM4o8RFrD55NLPnO5HrBWa8oQL4qCplJY/v42xQaE6
 BamFTz8w/jTGjbn6XB2qd5OOgUB407UzggDqzxuhz0FwmkH/Ritlp0UumS0kCu/Jycky
 1DOVdhXy9bKiVvTmEPIfW73fnlmJJOR9sdPB8RKC8W/fWf5OCY7+fEBtcXbgdPqh6TmW
 /9bI8KawnlrfgpDaom2EEl1pOsvr3IiwdQ1QQelVikFDKEZgvOqc8TTkuHQS+Tqrm18C
 J2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699000628; x=1699605428;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sWbyJPiWj/6RAN7BO5vb8iTksoyPvRj7VcNW0Pa/HFA=;
 b=rM65HofCIko2aUVfxvgcmhlY9p4QUPem0VubfL0TBiYeA5BtRxyZGJJIQovjCKzxNE
 r6EJ+dWMmyWODJHdev0V1YUW0PxD37MwlwIE/7zs+Ay1de5HCgADu2tOdNnc3yXb0Acc
 ZAlqvvGcKO4gG48P1xpUzqq8oeWkGIjuHsQ5pOj8ykF2G+YGXDcUkPf6sm+zlb+iqQ+u
 9gQEKTfF/WaC6J8g7+2pRkwsg1nE0CriKDeEwGAEKScwYFSwpPYNxGxI/eZ3uMasvk90
 B1cVINISPjuPHsRpFDi9YKFS6+a2UK7YcJAxl1M0j0sTNzA//dEYPm328zDsNcpl/GrR
 b7nQ==
X-Gm-Message-State: AOJu0YwNZm0IGoZoyB8YWCDUnV3GEM1uqBUvO3wMYD/tVmAv10JhNoiJ
 MS19e3zEy036R57TLhreupqfNA==
X-Google-Smtp-Source: AGHT+IH/3tYFopSaUEOzFTkCRGrOEoGt5p7Z8lrpR4IFqUP++fFFaiZ804YG9eSB39948m3qzZisEw==
X-Received: by 2002:a05:6512:3051:b0:509:459b:13ae with SMTP id
 b17-20020a056512305100b00509459b13aemr4700772lfb.53.1699000627378; 
 Fri, 03 Nov 2023 01:37:07 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a7bc4d7000000b004063cd8105csm1665244wmk.22.2023.11.03.01.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 01:37:06 -0700 (PDT)
Date: Fri, 3 Nov 2023 09:37:06 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v9 04/19] target/riscv: add rv64i CPU
Message-ID: <20231103-0ac85c2ba4e027f69f87f6b3@orel>
References: <20231102224445.527355-1-dbarboza@ventanamicro.com>
 <20231102224445.527355-5-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102224445.527355-5-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=ajones@ventanamicro.com; helo=mail-lf1-x136.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Nov 02, 2023 at 07:44:30PM -0300, Daniel Henrique Barboza wrote:
> We don't have any form of a 'bare bones' CPU. rv64, our default CPUs,
> comes with a lot of defaults. This is fine for most regular uses but
> it's not suitable when more control of what is actually loaded in the
> CPU is required.
> 
> A bare-bones CPU would be annoying to deal with if not by profile
> support, a way to load a multitude of extensions with a single flag.
> Profile support is going to be implemented shortly, so let's add a CPU
> for it.
> 
> The new 'rv64i' CPU will have only RVI loaded. It is inspired in the
> profile specification that dictates, for RVA22U64 [1]:
> 
> "RVA22U64 Mandatory Base
>  RV64I is the mandatory base ISA for RVA22U64"
> 
> And so it seems that RV64I is the mandatory base ISA for all profiles
> listed in [1], making it an ideal CPU to use with profile support.
> 
> rv64i is a CPU of type TYPE_RISCV_BARE_CPU. It has a mix of features
> from pre-existent CPUs:
> 
> - it allows extensions to be enabled, like generic CPUs;
> - it will not inherit extension defaults, like vendor CPUs.
> 
> This is the minimum extension set to boot OpenSBI and buildroot using
> rv64i:
> 
> ./build/qemu-system-riscv64 -nographic -M virt \
>     -cpu rv64i,sv39=true,g=true,c=true,s=true,u=true
> 
> Our minimal riscv,isa in this case will be:
> 
>  # cat /proc/device-tree/cpus/cpu@0/riscv,isa
> rv64imafdc_zicntr_zicsr_zifencei_zihpm_zca_zcd#
> 
> [1] https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  target/riscv/cpu-qom.h |  2 ++
>  target/riscv/cpu.c     | 49 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 7831e86d37..ea9a752280 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -25,6 +25,7 @@
>  #define TYPE_RISCV_CPU "riscv-cpu"
>  #define TYPE_RISCV_DYNAMIC_CPU "riscv-dynamic-cpu"
>  #define TYPE_RISCV_VENDOR_CPU "riscv-vendor-cpu"
> +#define TYPE_RISCV_BARE_CPU "riscv-bare-cpu"
>  
>  #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
>  #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
> @@ -35,6 +36,7 @@
>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
>  #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
> +#define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>  #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4bb677275c..e9be0c7dae 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -370,6 +370,17 @@ static void set_satp_mode_max_supported(RISCVCPU *cpu,
>  /* Set the satp mode to the max supported */
>  static void set_satp_mode_default_map(RISCVCPU *cpu)
>  {
> +    /*
> +     * Bare CPUs does not default to the max available.

Bare CPUs do not

> +     * Users must set a valid satp_mode in the command
> +     * line.
> +     */
> +    if (object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_BARE_CPU) != NULL) {
> +        warn_report("No satp mode set. Defaulting to 'bare'");
> +        cpu->cfg.satp_mode.map = (1 << VM_1_10_MBARE);
> +        return;
> +    }
> +
>      cpu->cfg.satp_mode.map = cpu->cfg.satp_mode.supported;
>  }
>  #endif
> @@ -552,6 +563,31 @@ static void rv128_base_cpu_init(Object *obj)
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>  #endif
>  }
> +
> +static void rv64i_bare_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    riscv_cpu_set_misa(env, MXL_RV64, RVI);
> +
> +    /* Remove the defaults from the parent class */
> +    RISCV_CPU(obj)->cfg.ext_zicntr = false;
> +    RISCV_CPU(obj)->cfg.ext_zihpm = false;
> +
> +    /*
> +     * Set 1.10 instead of leaving it blank, which
> +     * defaults to 1.10 anyway.
> +     */

I'd either write "Set to QEMU's first supported priv version" or just drop
the comment.

> +    env->priv_ver = PRIV_VERSION_1_10_0;
> +
> +    /*
> +     * Support all available satp_mode settings. The default
> +     * value will be set to MBARE if the user doesn't set
> +     * satp_mode manually (see set_satp_mode_default()).
> +     */
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV64);
> +#endif
> +}
>  #else
>  static void rv32_base_cpu_init(Object *obj)
>  {
> @@ -1748,6 +1784,13 @@ void riscv_cpu_list(void)
>          .instance_init = initfn              \
>      }
>  
> +#define DEFINE_BARE_CPU(type_name, initfn) \
> +    {                                      \
> +        .name = type_name,                 \
> +        .parent = TYPE_RISCV_BARE_CPU,     \
> +        .instance_init = initfn            \
> +    }
> +
>  static const TypeInfo riscv_cpu_type_infos[] = {
>      {
>          .name = TYPE_RISCV_CPU,
> @@ -1770,6 +1813,11 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>          .parent = TYPE_RISCV_CPU,
>          .abstract = true,
>      },
> +    {
> +        .name = TYPE_RISCV_BARE_CPU,
> +        .parent = TYPE_RISCV_CPU,
> +        .abstract = true,
> +    },
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX,      riscv_max_cpu_init),
>  #if defined(TARGET_RISCV32)
> @@ -1786,6 +1834,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_THEAD_C906,  rv64_thead_c906_cpu_init),
>      DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,   rv64_veyron_v1_cpu_init),
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
> +    DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
>  #endif
>  };
>  
> -- 
> 2.41.0
>

Thanks,
drew

