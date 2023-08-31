Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A1CC83F10
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 11:04:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbfTm-0003Mp-8k; Thu, 31 Aug 2023 07:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbfTh-00037r-IY
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 07:04:46 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbfTf-0008U9-7Q
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 07:04:45 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so12023431fa.2
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 04:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693479881; x=1694084681; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6ww4osCt0njPiHNPQD1DnS+ZMcMdcxexUx3/KYvtAMM=;
 b=Pm+pmcjYtcK/p4FXqoVlTurGal3KYIWr3PZTB6FZfgVoKrBJN0PymkqiOKJkIBz9vY
 t73tdG2EzCleFVElBnX7SOyglgDoexf3b9eBnC6uJ0q88+r9QUcDiIKE4T4+inR3WryY
 xK2ysRsrKmsX8VCoh4CTRMJA1rFQpnFGY83CfH00ZshbHXRU3yQr1Jmrb6EWXR+IkTQO
 Z5WOHweU9rPrcZRpwCFJO5/k+2ze05hkaglCd1CMYtwHX8T/FuVBOGYyIyzf3cfvUlSP
 B5I+VkeHR6NagkT+VcgZUlcBCsKYl+nM3IR9/q0ut0JkHVp31KLIZedsPmruW6F1KP8X
 AUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693479881; x=1694084681;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ww4osCt0njPiHNPQD1DnS+ZMcMdcxexUx3/KYvtAMM=;
 b=ZFDN8hc/+HAbBBBzkqYTAXJOuouUXoW1QAi/je04yCqVJbIY0PAahRgf7Ac8YH2Owg
 xi6RfdEVYX7STloxjfePuYnX6Po+Pd1Eun4zWDs6t7ZsfI9/wdtsJ+zjQgRj9EnVPIf9
 Q3jvrPkC63ULDe1gZiJSbqcujAgy1Cz/MqUx9zSPzVigNRXzs/B1iuPk66sQCWPHjB4N
 fIcaS/tXU2jQDG5ycqOmETQ1CnfmgrgLloQ/pxzVkae9DSSR1WB+Lfypc9QnjOnnV5XS
 0c93U0i76TQUzGNlyX6xAkwLKatsCZg9SIcl8SRqowWE8zIJ4s3XoZdBmK9NcgCkjn/Z
 OJuw==
X-Gm-Message-State: AOJu0YyN4eCbez93WXdoO10QlWyW3bcjSCgORTJAyZhWRybHNNgiw8TP
 bdWJnDKbumOjtvk4V8wftRnkUw==
X-Google-Smtp-Source: AGHT+IFGLNFNGzwaPEOReiIXBuJL3mEVhbi6I0Dl5PZ+e0EJozAHQpnxodcZiAG3X1J64qUwfWVJJQ==
X-Received: by 2002:a2e:9409:0:b0:2bc:df66:5ff2 with SMTP id
 i9-20020a2e9409000000b002bcdf665ff2mr4194938ljh.9.1693479881129; 
 Thu, 31 Aug 2023 04:04:41 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 lc25-20020a170906dff900b0099329b3ab67sm639389ejc.71.2023.08.31.04.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 04:04:40 -0700 (PDT)
Date: Thu, 31 Aug 2023 13:04:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 08/20] target/riscv: move 'host' CPU declaration to kvm.c
Message-ID: <20230831-093f68315462c2a8af5c8099@orel>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-9-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825130853.511782-9-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Aug 25, 2023 at 10:08:41AM -0300, Daniel Henrique Barboza wrote:
> This CPU only exists if we're compiling with KVM so move it to the kvm
> specific file. While we're at it, change its class_init() to enable the
> user_extensions_flag class property, sparing us from having to execute
> riscv_cpu_add_user_properties() by hand and letting the post_init() hook
> do the work.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 23 -----------------------
>  target/riscv/kvm.c | 29 +++++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+), 23 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f67b782675..dbf81796d2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -655,19 +655,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>  }
>  #endif
>  
> -#if defined(CONFIG_KVM)
> -static void riscv_host_cpu_init(Object *obj)
> -{
> -    CPURISCVState *env = &RISCV_CPU(obj)->env;
> -#if defined(TARGET_RISCV32)
> -    set_misa(env, MXL_RV32, 0);
> -#elif defined(TARGET_RISCV64)
> -    set_misa(env, MXL_RV64, 0);
> -#endif
> -    riscv_cpu_add_user_properties(obj);
> -}
> -#endif /* CONFIG_KVM */
> -
>  static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
>  {
>      ObjectClass *oc;
> @@ -2000,13 +1987,6 @@ static void riscv_vendor_cpu_class_init(ObjectClass *c, void *data)
>      rcc->user_extension_properties = false;
>  }
>  
> -#define DEFINE_CPU(type_name, initfn)      \
> -    {                                      \
> -        .name = type_name,                 \
> -        .parent = TYPE_RISCV_CPU,          \
> -        .instance_init = initfn            \
> -    }
> -
>  #define DEFINE_DYNAMIC_CPU(type_name, initfn) \
>      {                                         \
>          .name = type_name,                    \
> @@ -2047,9 +2027,6 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      },
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX,      riscv_max_cpu_init),
> -#if defined(CONFIG_KVM)
> -    DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
> -#endif
>  #if defined(TARGET_RISCV32)
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE32,   rv32_base_cpu_init),
>      DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 7c6dec05e3..59004caa8e 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -1217,3 +1217,32 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>  
>      kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
>  }
> +
> +static void riscv_host_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +
> +#if defined(TARGET_RISCV32)
> +    env->misa_mxl_max = env->misa_mxl = MXL_RV32;
> +#elif defined(TARGET_RISCV64)
> +    env->misa_mxl_max = env->misa_mxl = MXL_RV64;
> +#endif
> +}
> +
> +static void riscv_kvm_cpu_class_init(ObjectClass *c, void *data)
> +{
> +    RISCVCPUClass *rcc = RISCV_CPU_CLASS(c);
> +
> +    rcc->user_extension_properties = true;
> +}
> +
> +static const TypeInfo riscv_kvm_cpu_type_infos[] = {
> +    {
> +        .name = TYPE_RISCV_CPU_HOST,
> +        .parent = TYPE_RISCV_CPU,
> +        .instance_init = riscv_host_cpu_init,
> +        .class_init = riscv_kvm_cpu_class_init,
> +    }
> +};
> +
> +DEFINE_TYPES(riscv_kvm_cpu_type_infos)
> -- 
> 2.41.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

