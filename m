Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4586C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 09:09:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qy78L-00054w-CJ; Wed, 01 Nov 2023 05:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qy77K-0004Kb-Bc
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 05:02:27 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qy77D-000753-M5
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 05:02:26 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c514cbbe7eso90918341fa.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Nov 2023 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698829337; x=1699434137; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BbWy+GHxZi9qc46hpzl9C/c05pgvIqcP+LMqFuEtn40=;
 b=U8Q9i3RVPIudvdMg2/vpNc3x9Sq1CVMN3Mf7oDWzAmWt0BZEdfhpLLSAgxjvuYm2ik
 SuknkYRwpdkKxRJszUUFvHUiycOjxKMjyx42bNm5u3vszPR0Yr8/eCiD3VUKfOD1L9dv
 J6BRkJG23f3yMcLQba6pqc5Rt1SAfDHxSch1J8UVESB2Cn/QEYh9nJzk6Ig5CnjvOAx1
 Lxbm/JAoWjTrj04NeCvhEyIS4aB4dQVSj8kolFzWku9WgQOgZ4bKCCV3iB9d9NdwrKQs
 oo9r9qLOsx1FEgzKkZmHJKZ9qucsAv0w3amcrIMzefFaFXC3Rzf4eEQA1aUsqpX5yLsL
 Bd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698829337; x=1699434137;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BbWy+GHxZi9qc46hpzl9C/c05pgvIqcP+LMqFuEtn40=;
 b=X7omIQ8Jb9ED8EKxxYazQCPBRzd8bWDIh2HlJETzVoontShCcOuq18XKu0ybHvtu8Q
 bU/lRdk1CgkbI+d/U7j839HsGd3628krF3JyfpeEJASRtlHlAjwM081m8j0EjSG2hjEw
 OpnUf5a1CXANlhXA3d+KAdH6jOWknoSPoremq2bYqFpQ7RML0Nas+lcik0AMQjr7G74L
 BPlnx+bc+lANxSl7BqxnMiaC6iuuErBfdQADBOZ+aPQyv3NgzNP0oVm1NeiYCYQrmngr
 JAk0tWghJ4q7f+ZGG6WiHf6/zN7iK0LhYINDsWQ6kXcL/Ot+Io1CyPlZEPbCGUTEvs8x
 OCaw==
X-Gm-Message-State: AOJu0YzR+lCbKpRUHHWmYiQltweu93gtzfwtJF3u2CmxhuAHI5avAGG1
 uyuIsFRtDmYDJyRaMkm1g0w7TA==
X-Google-Smtp-Source: AGHT+IG7KGt/Bdh1CQjPm9VzjCUwPjFG5ZEiiMZpOBrCcfT8XfSjB6lTlFhlITi2Vf9eCZaRV4jnOQ==
X-Received: by 2002:ac2:4463:0:b0:503:9eb:47f0 with SMTP id
 y3-20020ac24463000000b0050309eb47f0mr10574513lfl.59.1698829337183; 
 Wed, 01 Nov 2023 02:02:17 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c4f8200b003fefaf299b6sm854409wmq.38.2023.11.01.02.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 02:02:16 -0700 (PDT)
Date: Wed, 1 Nov 2023 10:02:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v7 03/16] target/riscv: add rv64i CPU
Message-ID: <20231101-f72b888f87063028f40c6e7a@orel>
References: <20231031203916.197332-1-dbarboza@ventanamicro.com>
 <20231031203916.197332-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031203916.197332-4-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x233.google.com
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

On Tue, Oct 31, 2023 at 05:39:03PM -0300, Daniel Henrique Barboza wrote:
> We don't have any form of a 'bare bones' CPU. rv64, our default CPUs,
> comes with a lot of defaults. This is fine for most regular uses but
> it's not suitable when more control of what is actually loaded in the
> CPU is required.
> 
> A bare-bones CPU would be annoying to deal with if not by profile
> support, a way to load a multitude of extensions with a single flag. Profile
> support is going to be implemented shortly, so let's add a CPU for it.
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
>     -cpu rv64i,g=true,c=true,s=true,u=true
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
>  target/riscv/cpu.c     | 25 +++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
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
> index 822970345c..98b2a4061a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -544,6 +544,18 @@ static void rv128_base_cpu_init(Object *obj)
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>  #endif
>  }
> +
> +static void rv64i_bare_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    riscv_cpu_set_misa(env, MXL_RV64, RVI);
> +
> +    /* Set latest version of privileged specification */
> +    env->priv_ver = PRIV_VERSION_LATEST;

The beauty of rv64i is we'll finally know exactly what we're configuring
when we select it and some set of extensions. With that in mind I think
we should also be explicit about which version of the priv spec is
implemented, but we can't just pick a version now, since we may need to
update it later. I think we have the following options:

 1. Expose priv version properties (v1_10_0, ...) and either require the
    user to select one or default to the latest. (Any versions we don't
    want to support for rv64i would error out if selected.)

 2. Add multiple rv64i base cpu types where the version is also specified
    in the name, e.g. rv64i_1_12_0, and then maybe have an rv64i alias
    which always points at the latest.

A nice thing about (1) is that we can expose the boolean version
properties in cpu model expansion. A nice thing about (2) is that the user
will either be forced to select an explicit version or, if we have the
alias, libvirt will convert 'rv64i' into its full name when storing it
in the XML. But, we can force the user to select a version with (1) too by
not providing a default. While that adds a burden of always having to
provide a version, it's not a big deal for a barebones cpu, since all
extensions necessary to create a useful cpu are also required. And,
profiles alleviate the burden. For example, rva22s64 mandates Ss1p12, so
that profile will automatically set the v1_12_0 property.

I think we should implement (1) without a default.

> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);

I think we should require the user provide one of sv39, sv48, ... rather
than have a default for this too. S-mode profiles will again automatically
set this to what it mandates, relieving the burden.

> +#endif
> +}
>  #else
>  static void rv32_base_cpu_init(Object *obj)
>  {
> @@ -1732,6 +1744,13 @@ void riscv_cpu_list(void)
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
> @@ -1754,6 +1773,11 @@ static const TypeInfo riscv_cpu_type_infos[] = {
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
> @@ -1770,6 +1794,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
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

