Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F08EB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 03:10:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK9CW-0004IG-RU; Thu, 13 Jul 2023 23:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK9CT-0004HD-KK; Thu, 13 Jul 2023 23:10:33 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK9CQ-0003Hk-5x; Thu, 13 Jul 2023 23:10:32 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-48137f8b118so1603753e0c.0; 
 Thu, 13 Jul 2023 20:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689304228; x=1691896228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=egAJlZsCaebrNr9CT4FfzfMm0iauuG3KKJtLB89mRLk=;
 b=LnvsvVUBRx5lorlYuVCWR+zZWgmZKaRKjA0EyanRk8Qrs+zW+7+ji0bxKG/33acMbS
 ORSAbMD4RhaSufGhKFIQD+0kSas+eMM/amqesKA6sECXXjJI9YXMkJF1L3lsOrAdYGmw
 kJzWhxjudrZDtCl9ny2q5on88675bXBuKGxFqqHV9vJJCe4lbHDVOYVMj3i+yZmsQvO+
 0pAyUrSc6jPnRvSetU1uBXXfdnlGZSJ5fR4uggKdugQ97zt5By5jle2fdS4hMsdHZ4QQ
 85+AJ8Krz6sdWlCDhUjzgGMzZon1G7AZscZdoeQh457Rfs69J9eQH6afhCYnVsZK8qCz
 kxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689304228; x=1691896228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=egAJlZsCaebrNr9CT4FfzfMm0iauuG3KKJtLB89mRLk=;
 b=H1+hgiksphVo1oy7L84LUpRTSKojfUTwL6jQsi9jYS33D5pWWcKez/TUS5mUeQSh3V
 Zo9v8b1dfPnV+6Z4OvN1KxiX/5sqBdoGU1s6KAZSYQYuGlj0g6XyZ3QOHwvZrFVVFtaM
 6h4J8qwOAWi4Fztp/wH2LucIIwx4bn8FmcwLn5Vb9F18d3SYsbkc1pRuohXVhcf5y26m
 KOoid5bximwZdLAPAQPUGprIRhdwZZRX/1k2b4U7ey/D8zw/ARRTjnZ6eJ2APrNc0s9u
 Ox8O/MgdlExfGKJXrQtjRNw8qo3QzirmaTU9cgf8O4f4wKENvgNnq8jhTqa+qDYvImsc
 LJhg==
X-Gm-Message-State: ABy/qLaKdVY4So4DaeWhxR9eS+RZpN7K+Nj6AhLzby8KGhRVRFQCad2O
 bLzzIFyfTzKk/KuJ1DAp2cK2WKoud1Zj6VgYU9g=
X-Google-Smtp-Source: APBJJlEgd0xUjHu2C8Jn0b7Ulb0ZEAkTr9iafWL2xEjmQZ78rfwY4RiIhKar/IbR6TXSlv2L9/viX0MWYW8V6ZZMLdQ=
X-Received: by 2002:a1f:5ed4:0:b0:47e:838:a704 with SMTP id
 s203-20020a1f5ed4000000b0047e0838a704mr468552vkb.6.1689304228446; Thu, 13 Jul
 2023 20:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230712205748.446931-1-dbarboza@ventanamicro.com>
 <20230712205748.446931-7-dbarboza@ventanamicro.com>
In-Reply-To: <20230712205748.446931-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Jul 2023 13:10:02 +1000
Message-ID: <CAKmqyKNPo1bZULzaAF+5a6w=Qaz6aG7WkAGRXK0FVGG8fxTP6w@mail.gmail.com>
Subject: Re: [PATCH for-8.2 v2 6/7] target/riscv: add 'max' CPU type
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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

On Thu, Jul 13, 2023 at 7:00=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The 'max' CPU type is used by tooling to determine what's the most
> capable CPU a current QEMU version implements. Other archs such as ARM
> implements this type. Let's add it to RISC-V.
>
> What we consider "most capable CPU" in this context are related to
> ratified, non-vendor extensions. This means that we want the 'max' CPU
> to enable all (possible) ratified extensions by default. The reasoning
> behind this design is (1) vendor extensions can conflict with each other
> and we won't play favorities deciding which one is default or not and
> (2) non-ratified extensions are always prone to changes, not being
> stable enough to be enabled by default.
>
> All this said, we're still not able to enable all ratified extensions
> due to conflicts between them. Zfinx and all its dependencies aren't
> enabled because of a conflict with RVF. zce, zcmp and zcmt are also
> disabled due to RVD conflicts. When running with 64 bits we're also
> disabling zcf.
>
> MISA bits RVG, RVJ and RVV are also being set manually since they're
> default disabled.
>
> This is the resulting 'riscv,isa' DT for this new CPU:
>
> rv64imafdcvh_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_
> zfh_zfhmin_zca_zcb_zcd_zba_zbb_zbc_zbkb_zbkc_zbkx_zbs_zk_zkn_zknd_
> zkne_zknh_zkr_zks_zksed_zksh_zkt_zve32f_zve64f_zve64d_
> smstateen_sscofpmf_sstc_svadu_svinval_svnapot_svpbmt
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu-qom.h |  1 +
>  target/riscv/cpu.c     | 53 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
>
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 04af50983e..f3fbe37a2c 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -30,6 +30,7 @@
>  #define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
>
>  #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
> +#define TYPE_RISCV_CPU_MAX              RISCV_CPU_TYPE_NAME("max")

From memory the "any" CPU was supposed to do this, so we might want to remo=
ve it

Alistair

>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
>  #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b61465c8c4..5172566cda 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -248,6 +248,7 @@ static const char * const riscv_intr_names[] =3D {
>  };
>
>  static void riscv_cpu_add_user_properties(Object *obj);
> +static void riscv_init_max_cpu_extensions(Object *obj);
>
>  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>  {
> @@ -374,6 +375,25 @@ static void riscv_any_cpu_init(Object *obj)
>      cpu->cfg.pmp =3D true;
>  }
>
> +static void riscv_max_cpu_init(Object *obj)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    CPURISCVState *env =3D &cpu->env;
> +    RISCVMXL mlx =3D MXL_RV64;
> +
> +#ifdef TARGET_RISCV32
> +    mlx =3D MXL_RV32;
> +#endif
> +    set_misa(env, mlx, 0);
> +    riscv_cpu_add_user_properties(obj);
> +    riscv_init_max_cpu_extensions(obj);
> +    env->priv_ver =3D PRIV_VERSION_LATEST;
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(RISCV_CPU(obj), mlx =3D=3D MXL_RV32 ?
> +                                VM_1_10_SV32 : VM_1_10_SV57);
> +#endif
> +}
> +
>  #if defined(TARGET_RISCV64)
>  static void rv64_base_cpu_init(Object *obj)
>  {
> @@ -1934,6 +1954,38 @@ static void riscv_cpu_add_user_properties(Object *=
obj)
>      ADD_CPU_PROPERTIES_ARRAY(dev, riscv_cpu_experimental_exts);
>  }
>
> +/*
> + * The 'max' type CPU will have all possible ratified
> + * non-vendor extensions enabled.
> + */
> +static void riscv_init_max_cpu_extensions(Object *obj)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    CPURISCVState *env =3D &cpu->env;
> +    Property *prop;
> +
> +    /* Enable RVG, RVJ and RVV that are disabled by default */
> +    set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
> +
> +    for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) {
> +        object_property_set_bool(obj, prop->name, true, NULL);
> +    }
> +
> +    /* Zfinx is not compatible with F. Disable it */
> +    object_property_set_bool(obj, "zfinx", false, NULL);
> +    object_property_set_bool(obj, "zdinx", false, NULL);
> +    object_property_set_bool(obj, "zhinx", false, NULL);
> +    object_property_set_bool(obj, "zhinxmin", false, NULL);
> +
> +    object_property_set_bool(obj, "zce", false, NULL);
> +    object_property_set_bool(obj, "zcmp", false, NULL);
> +    object_property_set_bool(obj, "zcmt", false, NULL);
> +
> +    if (env->misa_mxl !=3D MXL_RV32) {
> +        object_property_set_bool(obj, "zcf", false, NULL);
> +    }
> +}
> +
>  static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>
> @@ -2272,6 +2324,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>          .abstract =3D true,
>      },
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX,      riscv_max_cpu_init),
>  #if defined(CONFIG_KVM)
>      DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
>  #endif
> --
> 2.41.0
>
>

