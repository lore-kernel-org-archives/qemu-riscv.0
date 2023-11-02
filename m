Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68FEC4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 10:00:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyUUb-0007NP-IL; Thu, 02 Nov 2023 06:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qyUUY-0007HD-KR
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 05:59:58 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qyUUW-0008MC-RN
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 05:59:58 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53e08b60febso1226289a12.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 02:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698919194; x=1699523994; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Rfex9AqMqvm0D0GVBj+NeYrHK1dfWjvlKEgYspPRf18=;
 b=nDKQumlP3sramqdv9+62+gvAlBvTfLc24HktLgpFw8Y8JROyAh3eLv2xBjpGfFWrMu
 wR1PbotFHWYjXMrMXNT3mTrJkmp4VdcYErNTU9Tcrm9hBqtlC++ZSuMSVYjXXb4rx8Uf
 OC7J6P2lXGqlZm96sM00S/xbfpfXBV9cfcIsCCdFpk69qW7Swq2pMxsxOB0Unq/oTy4F
 wDsIttDs969tAOfOL7yh7NN8gqUThOjzMBUjcpmmdcatEuOho79z0m4dGm1eR++wcip1
 wUanZvs57M2aHtq9vMKawlvSBDktU9zZjvkbynOELfSII9capwKq31hqc0M5GGWb+yD0
 yoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698919194; x=1699523994;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rfex9AqMqvm0D0GVBj+NeYrHK1dfWjvlKEgYspPRf18=;
 b=dUzmrIhYB2LtK4DphvW9HJyanD8YP00IHp2w68EB7Rdwdn2JX0rJsxBPLCBpEfTk++
 +/OYx1w9Af3b50dzKshSiH9wyWHMZLD0zMaSf2PwotKAdO8F5rKo76kumLdB+IQ3F4LF
 D38SuhgQ9IfXMsOQDMExt/thslKR/AFgk7ctlu0WQhESLiNDKRd2QDt2x0EzGrgxBg1Z
 tRzpoHvQdWpM2I/Wiv9KNYESr8Hz6VK0iLSkJ+6ne5m4pS/xiOth5s5vXlUaT7/PIOlm
 rewOnlEzpHRYl7KxCC9ZPo7ktHyn44zHm8YVmd3GpxM/xwhXgypkgxg8BIQtY6jIp2NO
 OqOg==
X-Gm-Message-State: AOJu0YyXosiW72PmToRlDlHHOaI9OFNbFDVwePvxjraz/eRaZe2xk6n2
 Z8mHIY9XijtChCggM+Y2NvVrzw==
X-Google-Smtp-Source: AGHT+IFsZ/02ekFiQ2q9pb6JUJVZnaT0TAhr/lWklSXXoqJGFaBNQg2Dd3/7LX+BhEerZvy558uexA==
X-Received: by 2002:a17:906:478b:b0:9c7:4e5d:12bc with SMTP id
 cw11-20020a170906478b00b009c74e5d12bcmr3917656ejc.51.1698919194089; 
 Thu, 02 Nov 2023 02:59:54 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 lu12-20020a170906facc00b009875a6d28b0sm920688ejb.51.2023.11.02.02.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 02:59:53 -0700 (PDT)
Date: Thu, 2 Nov 2023 10:59:52 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v8 06/19] target/riscv: add rv64i CPU
Message-ID: <20231102-c79d19ccf4a301e3e8fc0ebd@orel>
References: <20231101204204.345470-1-dbarboza@ventanamicro.com>
 <20231101204204.345470-7-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101204204.345470-7-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x536.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Nov 01, 2023 at 05:41:51PM -0300, Daniel Henrique Barboza wrote:
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
> ---
>  target/riscv/cpu-qom.h |  2 ++
>  target/riscv/cpu.c     | 23 +++++++++++++++++++++++
>  2 files changed, 25 insertions(+)
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
> index f7c1989d14..4a6e544eaf 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -544,6 +544,16 @@ static void rv128_base_cpu_init(Object *obj)
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

Good catch since v1, but having to do this is a bit gross. I'd prefer the
parent class not enable any extensions. Each CPU type that needs these
can just set them themselves.

> +}
>  #else
>  static void rv32_base_cpu_init(Object *obj)
>  {
> @@ -1753,6 +1763,13 @@ void riscv_cpu_list(void)
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
> @@ -1775,6 +1792,11 @@ static const TypeInfo riscv_cpu_type_infos[] = {
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
> @@ -1791,6 +1813,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
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

We'll probably need to bring back the satp supported mode setting, as
suggested on a previous patch, but otherwise

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

