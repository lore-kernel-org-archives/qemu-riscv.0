Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C45DC4706F
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 04:12:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLF5F-0005fV-0F; Wed, 03 Jan 2024 23:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLF5C-0005df-Oy; Wed, 03 Jan 2024 23:11:51 -0500
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLF5A-00051b-TZ; Wed, 03 Jan 2024 23:11:50 -0500
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-4b7e4a2808bso45401e0c.1; 
 Wed, 03 Jan 2024 20:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704341507; x=1704946307; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xhV3hlDa4CzYCUwbsAUlhfw2e0nCG4GpxpC5K9kdoew=;
 b=iIAaMJlctzpZhjdDcpA3PG3Z5hHQZ7YFXn7gTvPwLwtKUWliBP/pYHSq9caONsDbPK
 Kswp5njIhybSYM4fRnvjJ+kSmEUxxYtzD50caWNAmjIkrkuPgv7Eqcp6yhB2EcviGTEO
 MQGKUvB5V/ecsj7xQMIxOZs/9/toUhkwvhGyszx/uZr9mDSQ/k5xf5dTU1bQxH/GStBn
 M0ULMTCE/C+PhzJq/bafXD4hwto2YPnZSI0zwk1apvyl0IzVazdlukDrPezOjDWm2jG2
 9oQCTGp3/WOSVLCa4gy7tvPyeY1tpT7JWQYkvcr81DDslGUUw8yEFAeNTI5M7v4geuXY
 JCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704341507; x=1704946307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xhV3hlDa4CzYCUwbsAUlhfw2e0nCG4GpxpC5K9kdoew=;
 b=agbBUWpE/IEc8v5ODh7vVU7NCqjudTE3Z8wFJAmiRMe8wkgI515MgM3kPZJ8oPytBP
 oA5kVq7smtl2ue+OpQbYJeOYMvenpJ6FjVrgXzv6WHtrKTwYhFTWTPuwL1ssPSFVPayl
 4a5mvT4lHsKg86N5hp2HXNupcs/rvEgkkP3TRc7iYFiH48nJCn0eT9UpcrDnm8lDTIdX
 ItKu9lGEOMDC6MCC8q34gHbyFEWVF/a6VSxrPAdkmPxTBYIUsv2Cf8NCodLiE+byclrI
 Hv6FQoU5t+ab/DwvbpNv2UkkEOf+Q7VQqEt6QSJ8Z23+Dw+sF9Uy9XBmqe/UUr2oJPHn
 Mt/Q==
X-Gm-Message-State: AOJu0Yxsb7Ag6I9O3z9ltLuybIwiiz6wKjc2IsGHX/nUg3VKzydUUEh4
 k0eTtJjI21JFO3xb4I2iUslF1m9eGqPekYBeIu8=
X-Google-Smtp-Source: AGHT+IHV0Ub4xq6WfrQ0phayPDQvbeA032ZFgu1u87tYz573iVArusI9MOEMpWxJtFFGCKHrqC9YlktYVIL7ZPSS5N8=
X-Received: by 2002:ac5:c932:0:b0:4b6:bccc:7a8a with SMTP id
 u18-20020ac5c932000000b004b6bccc7a8amr15724vkl.27.1704341507250; Wed, 03 Jan
 2024 20:11:47 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-5-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Jan 2024 14:11:21 +1000
Message-ID: <CAKmqyKNBrgMv7Yf5ZcbNHktWUmKE-fsVijG=keR7Ku0r930aAA@mail.gmail.com>
Subject: Re: [PATCH v13 04/26] target/riscv: add rv64i CPU
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Mon, Dec 18, 2023 at 10:56=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
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
>     -cpu rv64i,sv39=3Dtrue,g=3Dtrue,c=3Dtrue,s=3Dtrue,u=3Dtrue
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu-qom.h |  2 ++
>  target/riscv/cpu.c     | 46 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
>
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index ca7dd509e3..4d1aa54311 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -24,6 +24,7 @@
>  #define TYPE_RISCV_CPU "riscv-cpu"
>  #define TYPE_RISCV_DYNAMIC_CPU "riscv-dynamic-cpu"
>  #define TYPE_RISCV_VENDOR_CPU "riscv-vendor-cpu"
> +#define TYPE_RISCV_BARE_CPU "riscv-bare-cpu"
>
>  #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
>  #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
> @@ -33,6 +34,7 @@
>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
>  #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
> +#define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibe=
x")
>  #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31"=
)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index bb91bcacee..34102f6869 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -370,6 +370,17 @@ static void set_satp_mode_max_supported(RISCVCPU *cp=
u,
>  /* Set the satp mode to the max supported */
>  static void set_satp_mode_default_map(RISCVCPU *cpu)
>  {
> +    /*
> +     * Bare CPUs do not default to the max available.
> +     * Users must set a valid satp_mode in the command
> +     * line.
> +     */
> +    if (object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_BARE_CPU) !=3D NULL)=
 {
> +        warn_report("No satp mode set. Defaulting to 'bare'");
> +        cpu->cfg.satp_mode.map =3D (1 << VM_1_10_MBARE);
> +        return;
> +    }
> +
>      cpu->cfg.satp_mode.map =3D cpu->cfg.satp_mode.supported;
>  }
>  #endif
> @@ -552,6 +563,28 @@ static void rv128_base_cpu_init(Object *obj)
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>  #endif
>  }
> +
> +static void rv64i_bare_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +    riscv_cpu_set_misa(env, MXL_RV64, RVI);
> +
> +    /* Remove the defaults from the parent class */
> +    RISCV_CPU(obj)->cfg.ext_zicntr =3D false;
> +    RISCV_CPU(obj)->cfg.ext_zihpm =3D false;
> +
> +    /* Set to QEMU's first supported priv version */
> +    env->priv_ver =3D PRIV_VERSION_1_10_0;
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
> @@ -1785,6 +1818,13 @@ void riscv_cpu_list(void)
>          .instance_init =3D initfn              \
>      }
>
> +#define DEFINE_BARE_CPU(type_name, initfn) \
> +    {                                      \
> +        .name =3D type_name,                 \
> +        .parent =3D TYPE_RISCV_BARE_CPU,     \
> +        .instance_init =3D initfn            \
> +    }
> +
>  static const TypeInfo riscv_cpu_type_infos[] =3D {
>      {
>          .name =3D TYPE_RISCV_CPU,
> @@ -1807,6 +1847,11 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>          .parent =3D TYPE_RISCV_CPU,
>          .abstract =3D true,
>      },
> +    {
> +        .name =3D TYPE_RISCV_BARE_CPU,
> +        .parent =3D TYPE_RISCV_CPU,
> +        .abstract =3D true,
> +    },
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX,      riscv_max_cpu_init),
>  #if defined(TARGET_RISCV32)
> @@ -1823,6 +1868,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>      DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_THEAD_C906,  rv64_thead_c906_cpu_in=
it),
>      DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,   rv64_veyron_v1_cpu_ini=
t),
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
> +    DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
>  #endif
>  };
>
> --
> 2.43.0
>
>

