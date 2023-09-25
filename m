Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFFDCE7A91
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 01:57:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkaqZ-0003B8-OQ; Sun, 24 Sep 2023 21:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkaqY-0003Ab-38; Sun, 24 Sep 2023 21:57:14 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkaqV-0000nE-PB; Sun, 24 Sep 2023 21:57:13 -0400
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7abb93528e2so283912241.0; 
 Sun, 24 Sep 2023 18:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695607030; x=1696211830; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IKBiV4EqTxs/MdEd0nRdyVJqwZ17KxARK43TuZ2t24E=;
 b=Hsxzqj2ve5RWLRop/l8UeZBnwRLOitAbP4GEgBszF8NI+2k7asbxqW//3PdqDjl5Bp
 a7lRMLVQNz7Os7HIeDBT4J5QqemMGK6ot3JWXaCN4EECKs5rysFtKwrWdvyE+B1J+pEi
 YYVkq7MY1TG9uUyWui6GVqIV+y+m8bEzUEyvabCgWiZhFah55JI5M+uXQUNd6Bd36Yti
 e4JfjweYz2mxJN+9CbT3GVQt8N1GfkYPBxtD/CGBn5fUC2p5MajT7X0RQSnDnSLzQwh1
 SiAUz8z2sjTfTKpj0jB1NxM0+YXQKYZCcHHE91CsmnnSOkr4vEc0zUwfB4Z1fjYkRWsc
 IWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695607030; x=1696211830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IKBiV4EqTxs/MdEd0nRdyVJqwZ17KxARK43TuZ2t24E=;
 b=Td8Z9ZJ/0i796ZsffC2mY62O6FhNZ/pc65yELtZ7aPmlg/mV2ta8IEsxdgpJHgw4OT
 qL0rtDtsDfrAHF6eogBoXpnovsVRjxi/z9cHgjSKvazuQbBthQZArDDoDQQQJyDvZz3X
 DrYjyKr1v5YyQPm+kX0fYojkqO2yICr/o/7s9BZth2FjuKSjWaB4uOZe7Lhql7QNG6wD
 lNGJEfRAivpRSOPgMM+hMt24L2GQv3hpl4psz3qT4AFlVg27PBBznPNeoI84vuLKo1nR
 h8GRROKK5WFG1mhOy9crtChiItVFxSc1das2awWdn+IwmwGcOSz9am6hAtGauhFdfnLr
 cInw==
X-Gm-Message-State: AOJu0Yx4tGmIGSt6aIuFzNwXTtSUhUb5mcQMxtxwJEJA9uMB0cKqgxBD
 mQ5/EI+aF8i646XCsIZhF05ksPdn98kxZDf8fik=
X-Google-Smtp-Source: AGHT+IFgpKIf8lWqH92jrlsMpvbn06kfjMR3/u+ULdBu3u6jG0aGcHfYXBI1CDouQMDU8IvD6Un/pvgMNYZCjrKOOjY=
X-Received: by 2002:a05:6102:3545:b0:452:8422:1318 with SMTP id
 e5-20020a056102354500b0045284221318mr2816772vss.27.1695607029495; Sun, 24 Sep
 2023 18:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-16-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-16-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Sep 2023 11:56:42 +1000
Message-ID: <CAKmqyKPv24s7xB_X8M50bGofkbvELuuv5USFjXDkt_pYNqy2TQ@mail.gmail.com>
Subject: Re: [PATCH v3 15/19] target/riscv/tcg: introduce
 tcg_cpu_instance_init()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Wed, Sep 20, 2023 at 9:23=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> tcg_cpu_instance_init() will be the 'cpu_instance_init' impl for the TCG
> accelerator. It'll be called from within riscv_cpu_post_init(), via
> accel_cpu_instance_init(), similar to what happens with KVM. In fact, to
> preserve behavior, the implementation will be similar to what
> riscv_cpu_post_init() already does.
>
> In this patch we'll move riscv_cpu_add_user_properties() and
> riscv_init_max_cpu_extensions() and all their dependencies to tcg-cpu.c.
> All multi-extension properties code was moved. The 'multi_ext_user_opts'
> hash table was also moved to tcg-cpu.c since it's a TCG only structure,
> meaning that we won't have to worry about initializing a TCG hash table
> when running a KVM CPU anymore.
>
> riscv_cpu_add_user_properties() will remain in cpu.c for now due to how
> much code it requires to be moved at the same time. We'll do that in the
> next patch.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 150 -------------------------------------
>  target/riscv/cpu.h         |   1 -
>  target/riscv/tcg/tcg-cpu.c | 149 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 149 insertions(+), 151 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cf191d576e..8616c9e2f5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -162,9 +162,6 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(xventanacondops, PRIV_VERSION_1_12_0, ext_XVentan=
aCondOps),
>  };
>
> -/* Hash that stores user set extensions */
> -static GHashTable *multi_ext_user_opts;
> -
>  bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset)
>  {
>      bool *ext_enabled =3D (void *)&cpu->cfg + ext_offset;
> @@ -194,12 +191,6 @@ int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
>      g_assert_not_reached();
>  }
>
> -bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
> -{
> -    return g_hash_table_contains(multi_ext_user_opts,
> -                                 GUINT_TO_POINTER(ext_offset));
> -}
> -
>  const char * const riscv_int_regnames[] =3D {
>      "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1=
",
>      "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a=
3",
> @@ -280,9 +271,6 @@ static const char * const riscv_intr_names[] =3D {
>      "reserved"
>  };
>
> -static void riscv_cpu_add_user_properties(Object *obj);
> -static void riscv_init_max_cpu_extensions(Object *obj);
> -
>  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>  {
>      if (async) {
> @@ -1206,32 +1194,9 @@ static bool riscv_cpu_is_dynamic(Object *cpu_obj)
>      return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) !=3D NUL=
L;
>  }
>
> -static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
> -{
> -    return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) !=3D NULL;
> -}
> -
> -static bool riscv_cpu_has_user_properties(Object *cpu_obj)
> -{
> -    if (kvm_enabled() &&
> -        object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_HOST) !=3D NULL) {
> -        return true;
> -    }
> -
> -    return riscv_cpu_is_dynamic(cpu_obj);
> -}
> -
>  static void riscv_cpu_post_init(Object *obj)
>  {
>      accel_cpu_instance_init(CPU(obj));
> -
> -    if (tcg_enabled() && riscv_cpu_has_user_properties(obj)) {
> -        riscv_cpu_add_user_properties(obj);
> -    }
> -
> -    if (riscv_cpu_has_max_extensions(obj)) {
> -        riscv_init_max_cpu_extensions(obj);
> -    }
>  }
>
>  static void riscv_cpu_init(Object *obj)
> @@ -1244,8 +1209,6 @@ static void riscv_cpu_init(Object *obj)
>      qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
>                        IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
>  #endif /* CONFIG_USER_ONLY */
> -
> -    multi_ext_user_opts =3D g_hash_table_new(NULL, g_direct_equal);
>  }
>
>  typedef struct RISCVCPUMisaExtConfig {
> @@ -1531,119 +1494,6 @@ Property riscv_cpu_options[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> -static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *n=
ame,
> -                                  void *opaque, Error **errp)
> -{
> -    const RISCVCPUMultiExtConfig *multi_ext_cfg =3D opaque;
> -    bool value;
> -
> -    if (!visit_type_bool(v, name, &value, errp)) {
> -        return;
> -    }
> -
> -    isa_ext_update_enabled(RISCV_CPU(obj), multi_ext_cfg->offset, value)=
;
> -
> -    g_hash_table_insert(multi_ext_user_opts,
> -                        GUINT_TO_POINTER(multi_ext_cfg->offset),
> -                        (gpointer)value);
> -}
> -
> -static void cpu_get_multi_ext_cfg(Object *obj, Visitor *v, const char *n=
ame,
> -                                  void *opaque, Error **errp)
> -{
> -    const RISCVCPUMultiExtConfig *multi_ext_cfg =3D opaque;
> -    bool value =3D isa_ext_is_enabled(RISCV_CPU(obj), multi_ext_cfg->off=
set);
> -
> -    visit_type_bool(v, name, &value, errp);
> -}
> -
> -static void cpu_add_multi_ext_prop(Object *cpu_obj,
> -                                   const RISCVCPUMultiExtConfig *multi_c=
fg)
> -{
> -    object_property_add(cpu_obj, multi_cfg->name, "bool",
> -                        cpu_get_multi_ext_cfg,
> -                        cpu_set_multi_ext_cfg,
> -                        NULL, (void *)multi_cfg);
> -
> -    /*
> -     * Set def val directly instead of using
> -     * object_property_set_bool() to save the set()
> -     * callback hash for user inputs.
> -     */
> -    isa_ext_update_enabled(RISCV_CPU(cpu_obj), multi_cfg->offset,
> -                           multi_cfg->enabled);
> -}
> -
> -static void riscv_cpu_add_multiext_prop_array(Object *obj,
> -                                        const RISCVCPUMultiExtConfig *ar=
ray)
> -{
> -    const RISCVCPUMultiExtConfig *prop;
> -
> -    g_assert(array);
> -
> -    for (prop =3D array; prop && prop->name; prop++) {
> -        cpu_add_multi_ext_prop(obj, prop);
> -    }
> -}
> -
> -/*
> - * Add CPU properties with user-facing flags.
> - *
> - * This will overwrite existing env->misa_ext values with the
> - * defaults set via riscv_cpu_add_misa_properties().
> - */
> -static void riscv_cpu_add_user_properties(Object *obj)
> -{
> -#ifndef CONFIG_USER_ONLY
> -    riscv_add_satp_mode_properties(obj);
> -#endif
> -
> -    riscv_cpu_add_misa_properties(obj);
> -
> -    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_extensions);
> -    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_vendor_exts);
> -    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_experimental_exts);
> -
> -    for (Property *prop =3D riscv_cpu_options; prop && prop->name; prop+=
+) {
> -        qdev_property_add_static(DEVICE(obj), prop);
> -    }
> -}
> -
> -/*
> - * The 'max' type CPU will have all possible ratified
> - * non-vendor extensions enabled.
> - */
> -static void riscv_init_max_cpu_extensions(Object *obj)
> -{
> -    RISCVCPU *cpu =3D RISCV_CPU(obj);
> -    CPURISCVState *env =3D &cpu->env;
> -    const RISCVCPUMultiExtConfig *prop;
> -
> -    /* Enable RVG, RVJ and RVV that are disabled by default */
> -    riscv_cpu_set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | R=
VV);
> -
> -    for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) {
> -        isa_ext_update_enabled(cpu, prop->offset, true);
> -    }
> -
> -    /* set vector version */
> -    env->vext_ver =3D VEXT_VERSION_1_00_0;
> -
> -    /* Zfinx is not compatible with F. Disable it */
> -    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zfinx), false);
> -    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zdinx), false);
> -    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinx), false);
> -    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinxmin), false);
> -
> -    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zce), false);
> -    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmp), false);
> -    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmt), false);
> -
> -    if (env->misa_mxl !=3D MXL_RV32) {
> -        isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcf), false);
> -    }
> -}
> -
>  static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 9ec0805596..01cbcbe119 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -710,7 +710,6 @@ enum riscv_pmu_event_idx {
>
>  /* used by tcg/tcg-cpu.c*/
>  void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en)=
;
> -bool cpu_cfg_ext_is_user_set(uint32_t ext_offset);
>  bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset);
>  int cpu_cfg_ext_get_min_version(uint32_t ext_offset);
>  void riscv_cpu_set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext);
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index e480b9f726..5d71ff2cce 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -24,6 +24,7 @@
>  #include "pmu.h"
>  #include "time_helper.h"
>  #include "qapi/error.h"
> +#include "qapi/visitor.h"
>  #include "qemu/accel.h"
>  #include "qemu/error-report.h"
>  #include "qemu/log.h"
> @@ -31,6 +32,15 @@
>  #include "hw/core/tcg-cpu-ops.h"
>  #include "tcg/tcg.h"
>
> +/* Hash that stores user set extensions */
> +static GHashTable *multi_ext_user_opts;
> +
> +static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
> +{
> +    return g_hash_table_contains(multi_ext_user_opts,
> +                                 GUINT_TO_POINTER(ext_offset));
> +}
> +
>  static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>                                            const TranslationBlock *tb)
>  {
> @@ -570,6 +580,144 @@ static bool tcg_cpu_realizefn(CPUState *cs, Error *=
*errp)
>      return true;
>  }
>
> +static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *n=
ame,
> +                                  void *opaque, Error **errp)
> +{
> +    const RISCVCPUMultiExtConfig *multi_ext_cfg =3D opaque;
> +    bool value;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    isa_ext_update_enabled(RISCV_CPU(obj), multi_ext_cfg->offset, value)=
;
> +
> +    g_hash_table_insert(multi_ext_user_opts,
> +                        GUINT_TO_POINTER(multi_ext_cfg->offset),
> +                        (gpointer)value);
> +}
> +
> +static void cpu_get_multi_ext_cfg(Object *obj, Visitor *v, const char *n=
ame,
> +                                  void *opaque, Error **errp)
> +{
> +    const RISCVCPUMultiExtConfig *multi_ext_cfg =3D opaque;
> +    bool value =3D isa_ext_is_enabled(RISCV_CPU(obj), multi_ext_cfg->off=
set);
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static void cpu_add_multi_ext_prop(Object *cpu_obj,
> +                                   const RISCVCPUMultiExtConfig *multi_c=
fg)
> +{
> +    object_property_add(cpu_obj, multi_cfg->name, "bool",
> +                        cpu_get_multi_ext_cfg,
> +                        cpu_set_multi_ext_cfg,
> +                        NULL, (void *)multi_cfg);
> +
> +    /*
> +     * Set def val directly instead of using
> +     * object_property_set_bool() to save the set()
> +     * callback hash for user inputs.
> +     */
> +    isa_ext_update_enabled(RISCV_CPU(cpu_obj), multi_cfg->offset,
> +                           multi_cfg->enabled);
> +}
> +
> +static void riscv_cpu_add_multiext_prop_array(Object *obj,
> +                                        const RISCVCPUMultiExtConfig *ar=
ray)
> +{
> +    const RISCVCPUMultiExtConfig *prop;
> +
> +    g_assert(array);
> +
> +    for (prop =3D array; prop && prop->name; prop++) {
> +        cpu_add_multi_ext_prop(obj, prop);
> +    }
> +}
> +
> +/*
> + * Add CPU properties with user-facing flags.
> + *
> + * This will overwrite existing env->misa_ext values with the
> + * defaults set via riscv_cpu_add_misa_properties().
> + */
> +static void riscv_cpu_add_user_properties(Object *obj)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    riscv_add_satp_mode_properties(obj);
> +#endif
> +
> +    riscv_cpu_add_misa_properties(obj);
> +
> +    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_extensions);
> +    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_vendor_exts);
> +    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_experimental_exts);
> +
> +    for (Property *prop =3D riscv_cpu_options; prop && prop->name; prop+=
+) {
> +        qdev_property_add_static(DEVICE(obj), prop);
> +    }
> +}
> +
> +/*
> + * The 'max' type CPU will have all possible ratified
> + * non-vendor extensions enabled.
> + */
> +static void riscv_init_max_cpu_extensions(Object *obj)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    CPURISCVState *env =3D &cpu->env;
> +    const RISCVCPUMultiExtConfig *prop;
> +
> +    /* Enable RVG, RVJ and RVV that are disabled by default */
> +    riscv_cpu_set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | R=
VV);
> +
> +    for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) {
> +        isa_ext_update_enabled(cpu, prop->offset, true);
> +    }
> +
> +    /* set vector version */
> +    env->vext_ver =3D VEXT_VERSION_1_00_0;
> +
> +    /* Zfinx is not compatible with F. Disable it */
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zfinx), false);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zdinx), false);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinx), false);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinxmin), false);
> +
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zce), false);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmp), false);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmt), false);
> +
> +    if (env->misa_mxl !=3D MXL_RV32) {
> +        isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcf), false);
> +    }
> +}
> +
> +static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
> +{
> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) !=3D NULL;
> +}
> +
> +static bool riscv_cpu_has_user_properties(Object *cpu_obj)
> +{
> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) !=3D NUL=
L;
> +}
> +
> +static void tcg_cpu_instance_init(CPUState *cs)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    Object *obj =3D OBJECT(cpu);
> +
> +    if (riscv_cpu_has_user_properties(obj)) {
> +        multi_ext_user_opts =3D g_hash_table_new(NULL, g_direct_equal);
> +        riscv_cpu_add_user_properties(obj);
> +    }
> +
> +    if (riscv_cpu_has_max_extensions(obj)) {
> +        riscv_init_max_cpu_extensions(obj);
> +    }
> +}
> +
>  static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
>  {
>      /*
> @@ -588,6 +736,7 @@ static void tcg_cpu_accel_class_init(ObjectClass *oc,=
 void *data)
>      AccelCPUClass *acc =3D ACCEL_CPU_CLASS(oc);
>
>      acc->cpu_class_init =3D tcg_cpu_class_init;
> +    acc->cpu_instance_init =3D tcg_cpu_instance_init;
>      acc->cpu_realizefn =3D tcg_cpu_realizefn;
>  }
>
> --
> 2.41.0
>
>

