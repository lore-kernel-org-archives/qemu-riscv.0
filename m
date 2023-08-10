Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4A2C001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:56:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU9tu-0006JA-OJ; Thu, 10 Aug 2023 13:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9ts-0006IS-Lf; Thu, 10 Aug 2023 13:56:44 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9tq-0007LE-VD; Thu, 10 Aug 2023 13:56:44 -0400
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-79aa01cc971so415327241.0; 
 Thu, 10 Aug 2023 10:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691690201; x=1692295001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UhOHcjP2PKtcFWjF0WGyRWVbPASsjfcRR41q56R0DUs=;
 b=TO0CLPcufsyhm/NKMuCDwxs2HZqy2ZvV1JEg79zKAE/MQxNY+ip1ikMaZ18O1m2QR2
 wmFMQCyxvAHQszQhQKhBBhZigZ4+CL9/DRtX2Oekd1tckq4baOqjV/C/hGYVklZ8zzfL
 z45DczT2H3KIal6f5D8nklLkvNcg2U3a15jdvHIcA+ESR592h3BpmcB323NBi+8/Ne3Y
 6Adkkyt0dwJ3yjd3t/2mqL0C5lDT+8f7fxthK3PLRKBu4aL5YYYvZb4cbIBF26lCWwxc
 9EzjF/v+fNot3TIuN1OvnaTz2AY0LcWoiXByR2DHbHYtsnm9pcg2yXBxeOuL0mL0zbsF
 vntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691690201; x=1692295001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UhOHcjP2PKtcFWjF0WGyRWVbPASsjfcRR41q56R0DUs=;
 b=HXYP3tln94JKRi/BMr1Ej2CyBsXxIqvBZLyQORx9X3cb4A2GBlPk+ZdDEfd9gUgxmx
 7naAnbgRFJH7bvSNHIaDfw1LYPJMmq9hkYdZ1ZKHL00dFzqKwlFqQqsYSsT/ZMFbq3Ks
 729DbRXa4NsIjj/0n2TsZrEMBTPMx7AUznuivM2tujRMLLtdgxN4Ctz1/lgdMN0iuEAr
 XaiFWdly94Zv/q8TOu1KnzTW7PbiI/vaqPkuz4ppAjnpN/D3xykgz2bL6ZnbXtyDJf/A
 8qeFc/WshT0T2ogaVX5m5cseBBq8YG4o3jjDYIsmmaV/yOPlq1Lb0732WgAZmOywQZNZ
 nILg==
X-Gm-Message-State: AOJu0YyXfeCNGBAStDVG2+dghBsjDvKQkRRHfSolOoi999U4J8CCZ8IC
 I+CM9ViEAV0kJA0qsV7go2w0F2klHXm3ZQUYHjs=
X-Google-Smtp-Source: AGHT+IHDy/XOe9UvxzKeW1e7i0B0R+iw6svX5rEUzkcYTVNiPkmiWKWRY33c6EOPzxqR78clEHmAFJSDYTTwP9lfEgE=
X-Received: by 2002:a67:f7d6:0:b0:444:ca02:98fb with SMTP id
 a22-20020a67f7d6000000b00444ca0298fbmr2501755vsp.21.1691690201569; Thu, 10
 Aug 2023 10:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230727220927.62950-1-dbarboza@ventanamicro.com>
 <20230727220927.62950-11-dbarboza@ventanamicro.com>
In-Reply-To: <20230727220927.62950-11-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 13:56:15 -0400
Message-ID: <CAKmqyKOZpVa-ZYViS8crJ44Wc_7iaOD7M3Uxr4jex_+ixNUkOQ@mail.gmail.com>
Subject: Re: [PATCH v6 10/12] target/riscv: add 'max' CPU type
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Thu, Jul 27, 2023 at 6:53=E2=80=AFPM Daniel Henrique Barboza
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
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu-qom.h |  1 +
>  target/riscv/cpu.c     | 56 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)
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
>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
>  #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 01b0d228f5..3e840f1a20 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -250,6 +250,7 @@ static const char * const riscv_intr_names[] =3D {
>  };
>
>  static void riscv_cpu_add_user_properties(Object *obj);
> +static void riscv_init_max_cpu_extensions(Object *obj);
>
>  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>  {
> @@ -376,6 +377,25 @@ static void riscv_any_cpu_init(Object *obj)
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
> @@ -1961,6 +1981,41 @@ static void riscv_cpu_add_user_properties(Object *=
obj)
>      ADD_CPU_QDEV_PROPERTIES_ARRAY(dev, riscv_cpu_experimental_exts);
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
> +
> +    /* Enable RVG, RVJ and RVV that are disabled by default */
> +    set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
> +
> +    for (int i =3D 0; i < ARRAY_SIZE(riscv_cpu_extensions); i++) {
> +        object_property_set_bool(obj, riscv_cpu_extensions[i].name,
> +                                 true, NULL);
> +    }
> +
> +    /* set vector version */
> +    env->vext_ver =3D VEXT_VERSION_1_00_0;
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
> @@ -2299,6 +2354,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
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

