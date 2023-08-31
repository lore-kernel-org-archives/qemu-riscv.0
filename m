Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A95C83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 11:56:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbgHh-0001Oz-Ni; Thu, 31 Aug 2023 07:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbgHf-0001Jx-C8
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 07:56:23 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbgHb-0004TR-Lz
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 07:56:22 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99c93638322so142076466b.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 04:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693482978; x=1694087778; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ff5VxIKUgHjy3va+52dhuLkGuxAmVMrDdyNWUC2cX0s=;
 b=I3yNjnyXowB+3ka7toEiO8428WlnE93bKACmYhiqamr4M0ltJ7jql9d0Nl6Nm/eTHK
 wb5DraSSEEf/e0e7NyJ6amtgbqKWX9iEgL6ybfam9x2jEEb9ALzYZAM/4LnaWv2MFzN2
 8MOJARptD4SVhjqbtSZXGwBsUJNtccjAs8Y6Qo0Iooq/2KkMVRNvjDDBmA3T19njA4W8
 JPRkqSxlblTU1anmSCmyhXNw2HY3P6JJitQozUUjH+3JAfv926NeT8u7nO1EHjvwdHno
 At0dDQeK/jTYmAsNPX0AubF/NuO3okulVL2sJKaiDrcbW5aHuNbTsK2HO8ftoH3s9r9t
 M9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693482978; x=1694087778;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ff5VxIKUgHjy3va+52dhuLkGuxAmVMrDdyNWUC2cX0s=;
 b=ah3RSYSXt/Ri1CyQaBB+lyhWvGXPtPnRk2vXSfIJPIrV0F93jLhs+kddr37tpfdEMx
 FW/4jnwmkb6YsrKT89U5xSKIDczKaxxCbAwe4o5QuoWR7LpSWwEiHX05Mtc4pii9UyLo
 UrzEZU1ALIWNt7x1SVyqkIPtzyTCE+fzDsZAEliKp+hqYWRRdgluifJFZKYzjQTFXaFe
 Ixcn/K9H1vubq2bZ//Sh3QSoemK95HlPKcKVXiGw69qxFXzbuJMB+QwIyw/JzrFEt9my
 heRPxZtxTtSOXH2HVmCXfN2pIE/FZ3bxR2a94UU0an1pBY7gSzMR91A1cradrkaTrVov
 wsgg==
X-Gm-Message-State: AOJu0Ywr2MWvogxD62J4zH1/fb7QBoPenmuRep9/fvLNBYYOodHp78of
 eQjzxolL0bxFQOQ1OZe93LK6jA==
X-Google-Smtp-Source: AGHT+IGHy66gktIi7ORl6+SKMOzYdI9Yafwh7uuUDvPMveBNFj1OVwYo8Rdz/hlEhjSBzxY8sMb5RQ==
X-Received: by 2002:a17:907:c204:b0:9a1:ee8c:7f3b with SMTP id
 ti4-20020a170907c20400b009a1ee8c7f3bmr2031958ejc.7.1693482977747; 
 Thu, 31 Aug 2023 04:56:17 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a170906131600b0099d9b50d786sm679873ejb.199.2023.08.31.04.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 04:56:17 -0700 (PDT)
Date: Thu, 31 Aug 2023 13:56:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 15/20] target/riscv/tcg: introduce tcg_cpu_instance_init()
Message-ID: <20230831-c2588a8c877bce76cfa55994@orel>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-16-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825130853.511782-16-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x633.google.com
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

On Fri, Aug 25, 2023 at 10:08:48AM -0300, Daniel Henrique Barboza wrote:
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
> ---
>  target/riscv/cpu.c         | 141 +------------------------------------
>  target/riscv/cpu.h         |   2 +-
>  target/riscv/tcg/tcg-cpu.c | 138 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 140 insertions(+), 141 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f9aea6a80a..89b09a7e89 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -162,9 +162,6 @@ static const struct isa_ext_data isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(xventanacondops, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
>  };
>  
> -/* Hash that stores user set extensions */
> -static GHashTable *multi_ext_user_opts;
> -
>  bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset)
>  {
>      bool *ext_enabled = (void *)&cpu->cfg + ext_offset;
> @@ -195,12 +192,6 @@ int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
>      return PRIV_VERSION_1_10_0;
>  }
>  
> -bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
> -{
> -    return g_hash_table_contains(multi_ext_user_opts,
> -                                 GUINT_TO_POINTER(ext_offset));
> -}
> -
>  const char * const riscv_int_regnames[] = {
>      "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
>      "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
> @@ -281,9 +272,6 @@ static const char * const riscv_intr_names[] = {
>      "reserved"
>  };
>  
> -static void riscv_cpu_add_user_properties(Object *obj);
> -static void riscv_init_max_cpu_extensions(Object *obj);
> -
>  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>  {
>      if (async) {
> @@ -295,7 +283,7 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>      }
>  }
>  
> -static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
> +void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
>  {
>      env->misa_mxl_max = env->misa_mxl = mxl;
>      env->misa_ext_mask = env->misa_ext = ext;
> @@ -1198,18 +1186,7 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>  
>  static void riscv_cpu_post_init(Object *obj)
>  {
> -    RISCVCPU *cpu = RISCV_CPU(obj);
> -    RISCVCPUClass *rcc = RISCV_CPU_GET_CLASS(cpu);
> -
>      accel_cpu_instance_init(CPU(obj));
> -
> -    if (rcc->user_extension_properties) {
> -        riscv_cpu_add_user_properties(obj);
> -    }
> -
> -    if (cpu->cfg.max_features) {
> -        riscv_init_max_cpu_extensions(obj);
> -    }
>  }
>  
>  static void riscv_cpu_init(Object *obj)
> @@ -1222,8 +1199,6 @@ static void riscv_cpu_init(Object *obj)
>      qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
>                        IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
>  #endif /* CONFIG_USER_ONLY */
> -
> -    multi_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
>  }
>  
>  typedef struct RISCVCPUMisaExtConfig {
> @@ -1503,120 +1478,6 @@ Property riscv_cpu_options[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> -static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
> -                                  void *opaque, Error **errp)
> -{
> -    const RISCVCPUMultiExtConfig *multi_ext_cfg = opaque;
> -    bool value;
> -
> -    if (!visit_type_bool(v, name, &value, errp)) {
> -        return;
> -    }
> -
> -    isa_ext_update_enabled(RISCV_CPU(obj), multi_ext_cfg->offset, value);
> -
> -    g_hash_table_insert(multi_ext_user_opts,
> -                        GUINT_TO_POINTER(multi_ext_cfg->offset),
> -                        (gpointer)value);
> -}
> -
> -static void cpu_get_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
> -                                  void *opaque, Error **errp)
> -{
> -    const RISCVCPUMultiExtConfig *multi_ext_cfg = opaque;
> -    bool value = isa_ext_is_enabled(RISCV_CPU(obj), multi_ext_cfg->offset);
> -
> -    visit_type_bool(v, name, &value, errp);
> -}
> -
> -static void cpu_add_multi_ext_prop(Object *cpu_obj,
> -                                   const RISCVCPUMultiExtConfig *multi_cfg)
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
> -                                        const RISCVCPUMultiExtConfig *array)
> -{
> -    const RISCVCPUMultiExtConfig *prop;
> -
> -    for (prop = array; prop && prop->name; prop++) {
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
> -    if (kvm_enabled()) {
> -        return;
> -    }
> -    riscv_add_satp_mode_properties(obj);
> -#endif
> -
> -    riscv_cpu_add_misa_properties(obj);
> -
> -    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_extensions);
> -    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_vendor_exts);
> -    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_experimental_exts);
> -
> -    for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
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
> -    RISCVCPU *cpu = RISCV_CPU(obj);
> -    CPURISCVState *env = &cpu->env;
> -    const RISCVCPUMultiExtConfig *prop;
> -
> -    /* Enable RVG, RVJ and RVV that are disabled by default */
> -    set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
> -
> -    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> -        isa_ext_update_enabled(cpu, prop->offset, true);
> -    }
> -
> -    /* set vector version */
> -    env->vext_ver = VEXT_VERSION_1_00_0;
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
> -    if (env->misa_mxl != MXL_RV32) {
> -        isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcf), false);
> -    }
> -}
> -
>  static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>  
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 9ec3b98bd2..74fbb33e09 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -710,9 +710,9 @@ enum riscv_pmu_event_idx {
>  
>  /* used by tcg/tcg-cpu.c*/
>  void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en);
> -bool cpu_cfg_ext_is_user_set(uint32_t ext_offset);
>  bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset);
>  int cpu_cfg_ext_get_min_version(uint32_t ext_offset);
> +void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext);

riscv_cpu_set_misa() ?

>  void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu);
>  
>  typedef struct RISCVCPUMultiExtConfig {
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 2024c98793..68ce3cbcb9 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -23,12 +23,22 @@
>  #include "pmu.h"
>  #include "time_helper.h"
>  #include "qapi/error.h"
> +#include "qapi/visitor.h"
>  #include "qemu/accel.h"
>  #include "qemu/error-report.h"
>  #include "hw/core/accel-cpu.h"
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
> @@ -564,6 +574,133 @@ static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
>      return true;
>  }
>  
> +static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
> +                                  void *opaque, Error **errp)
> +{
> +    const RISCVCPUMultiExtConfig *multi_ext_cfg = opaque;
> +    bool value;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    isa_ext_update_enabled(RISCV_CPU(obj), multi_ext_cfg->offset, value);
> +
> +    g_hash_table_insert(multi_ext_user_opts,
> +                        GUINT_TO_POINTER(multi_ext_cfg->offset),
> +                        (gpointer)value);
> +}
> +
> +static void cpu_get_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
> +                                  void *opaque, Error **errp)
> +{
> +    const RISCVCPUMultiExtConfig *multi_ext_cfg = opaque;
> +    bool value = isa_ext_is_enabled(RISCV_CPU(obj), multi_ext_cfg->offset);
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static void cpu_add_multi_ext_prop(Object *cpu_obj,
> +                                   const RISCVCPUMultiExtConfig *multi_cfg)
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
> +                                        const RISCVCPUMultiExtConfig *array)
> +{
> +    const RISCVCPUMultiExtConfig *prop;
> +
> +    for (prop = array; prop && prop->name; prop++) {
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
> +    for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
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
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    CPURISCVState *env = &cpu->env;
> +    const RISCVCPUMultiExtConfig *prop;
> +
> +    /* Enable RVG, RVJ and RVV that are disabled by default */
> +    set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
> +
> +    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> +        isa_ext_update_enabled(cpu, prop->offset, true);
> +    }
> +
> +    /* set vector version */
> +    env->vext_ver = VEXT_VERSION_1_00_0;
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
> +    if (env->misa_mxl != MXL_RV32) {
> +        isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcf), false);
> +    }
> +}
> +
> +static void tcg_cpu_instance_init(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    Object *obj = OBJECT(cpu);
> +    RISCVCPUClass *rcc = RISCV_CPU_GET_CLASS(obj);
> +
> +    if (rcc->user_extension_properties) {
> +        multi_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
> +        riscv_cpu_add_user_properties(obj);
> +    }
> +
> +    if (cpu->cfg.max_features) {
> +        riscv_init_max_cpu_extensions(obj);
> +    }
> +}
> +
>  static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
>  {
>      /*
> @@ -583,6 +720,7 @@ static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
>      AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
>  
>      acc->cpu_class_init = tcg_cpu_class_init;
> +    acc->cpu_instance_init = tcg_cpu_instance_init;
>      acc->cpu_realizefn = tcg_cpu_realizefn;
>  }
>  
> -- 
> 2.41.0
> 
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

