Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB900C83F01
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 11:23:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbfkx-0002JH-39; Thu, 31 Aug 2023 07:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbfkw-0002J1-J6
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 07:22:34 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbfkr-0005Jf-Pl
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 07:22:34 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99df431d4bfso76847566b.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693480948; x=1694085748; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w/k6Au5C8/FKBkpNQcE3ekamxe3jv4nAMQkQipfGfLA=;
 b=iCe3RxsxVdriRx8hqJ6R2U+ginyiIXOSqhCMAis3ra+mrJ5yREdfqtPqDjrnaDfhnY
 JWrryrUewQQrLBrW+h88FnbGQCQNy92MQC0smRqhp0KCwVqKpy8bpk7ZAxxRJxj+DJPq
 Nxizz1nmUXzPEbZ86qLs1KUGHQ8Zp7Th7cyAgrlCgCZEK6RKWZeOlbkljMZvyN8U5sMV
 7e+eSqgkuj+V9spJoMEjDZYOdMtf1CPz5RywlDqEMaPO4fA+i6BvGd8POSpyT1qBU0kU
 /Zb64xy2GwEaNUjZihycl2Z8YL/9YWKicWgs/BDoBaOqNJbOOSfzNfrumxIZxJVsVcW6
 LnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693480948; x=1694085748;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/k6Au5C8/FKBkpNQcE3ekamxe3jv4nAMQkQipfGfLA=;
 b=Wa1StGBNrGNrP4c4ixyvGsCFO0m4cAsvLxtjg0Bnhs2P/b1H99bt41Ic9EN2U30WKH
 M/8109pCWfYtiAn5STyQkXiTKGF9c1BQHGNzUDpA2YT3GTk5N3k/6nL0rbovjRM2bdvW
 xeZGUKycEB2YaY2b6GDETJyCSCbWEPUd9QbtEeWg8bLH+RIAz8VleZ49gZ/migMW6tMt
 RGMfsj7zi+Pd1bCBnekQVkZ/rgz9wDcY/0wCiMvwi9z4wgQRr5bA9mwF4catmsqZtpXt
 a0Uhn9/cSeKtj3EXqLrxEYrMEv7fkGpCKFazZx84dFKmkiQlZk+R6YX1fnqaQK7TVVo3
 CwQQ==
X-Gm-Message-State: AOJu0Yw3820tveGk1IJyG1xTMc3JsenUl0zJ2AIJVbE9QP3Pqy9ge86H
 PXIelR1y0nPJ7gB+ZjhRvZ7LAQ==
X-Google-Smtp-Source: AGHT+IHMk4b1Ly+wNMhtJLsn4WFnbP7GXdQTUk6TiNY/6sbY7Q7ripF/RsbmHaVjK+8zgkiOhgqlLA==
X-Received: by 2002:a17:906:844e:b0:9a1:c00e:60cb with SMTP id
 e14-20020a170906844e00b009a1c00e60cbmr2979349ejy.10.1693480948073; 
 Thu, 31 Aug 2023 04:22:28 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 oz19-20020a170906cd1300b0098e42bef736sm655034ejb.176.2023.08.31.04.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 04:22:27 -0700 (PDT)
Date: Thu, 31 Aug 2023 13:22:21 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 10/20] target/riscv: move riscv_cpu_add_kvm_properties()
 to kvm.c
Message-ID: <20230831-838968c64dc3a2afa65e69bb@orel>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-11-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825130853.511782-11-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x632.google.com
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

On Fri, Aug 25, 2023 at 10:08:43AM -0300, Daniel Henrique Barboza wrote:
> We'll introduce the KVM accelerator class with a 'cpu_instance_init'
> implementation that is going to be invoked during the common
> riscv_cpu_post_init() (via accel_cpu_instance_init()). This
> instance_init will execute KVM exclusive code that TCG doesn't care
> about, such as adding KVM specific properties, initing registers using a
> KVM scratch CPU and so on.
> 
> The core of the forementioned cpu_instance_init impl is the current
> riscv_cpu_add_kvm_properties() that is being used by the common code via
> riscv_cpu_add_user_properties() in cpu.c. Move it to kvm.c, together
> will all the relevant artifacts, exporting and renaming it to
> kvm_riscv_cpu_add_kvm_properties() so cpu.c can keep using it for now.
> 
> To make this work we'll need to export riscv_cpu_extensions,
> riscv_cpu_vendor_exts and riscv_cpu_experimental_exts from cpu.c as
> well. The TCG accelerator will also need to access those in the near
> future so this export will benefit us in the long run.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c       | 87 +++-------------------------------------
>  target/riscv/cpu.h       | 14 +++++++
>  target/riscv/kvm.c       | 66 +++++++++++++++++++++++++++++-
>  target/riscv/kvm_riscv.h |  2 +-
>  4 files changed, 86 insertions(+), 83 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4eda853f1d..58b0ef2af8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1344,7 +1344,7 @@ static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
>      MISA_CFG(RVG, false),
>  };
>  
> -static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> +void riscv_cpu_add_misa_properties(Object *cpu_obj)
>  {
>      int i;
>  
> @@ -1371,17 +1371,11 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>      }
>  }
>  
> -typedef struct RISCVCPUMultiExtConfig {
> -    const char *name;
> -    uint32_t offset;
> -    bool enabled;
> -} RISCVCPUMultiExtConfig;
> -
>  #define MULTI_EXT_CFG_BOOL(_name, _prop, _defval) \
>      {.name = _name, .offset = CPU_CFG_OFFSET(_prop), \
>       .enabled = _defval}
>  
> -static const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
> +const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>      /* Defaults for standard extensions */
>      MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
>      MULTI_EXT_CFG_BOOL("Zifencei", ext_ifencei, true),
> @@ -1441,7 +1435,7 @@ static const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> -static const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
> +const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
>      MULTI_EXT_CFG_BOOL("xtheadba", ext_xtheadba, false),
>      MULTI_EXT_CFG_BOOL("xtheadbb", ext_xtheadbb, false),
>      MULTI_EXT_CFG_BOOL("xtheadbs", ext_xtheadbs, false),
> @@ -1459,7 +1453,7 @@ static const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
>  };
>  
>  /* These are experimental so mark with 'x-' */
> -static const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
> +const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>      MULTI_EXT_CFG_BOOL("x-zicond", ext_zicond, false),
>  
>      /* ePMP 0.9.3 */
> @@ -1487,7 +1481,7 @@ static const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> -static Property riscv_cpu_options[] = {
> +Property riscv_cpu_options[] = {
>      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>  
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> @@ -1548,25 +1542,6 @@ static void cpu_add_multi_ext_prop(Object *cpu_obj,
>                             multi_cfg->enabled);
>  }
>  
> -#ifndef CONFIG_USER_ONLY
> -static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
> -                                    const char *name,
> -                                    void *opaque, Error **errp)
> -{
> -    const char *propname = opaque;
> -    bool value;
> -
> -    if (!visit_type_bool(v, name, &value, errp)) {
> -        return;
> -    }
> -
> -    if (value) {
> -        error_setg(errp, "extension %s is not available with KVM",
> -                   propname);
> -    }
> -}
> -#endif
> -
>  static void riscv_cpu_add_multiext_prop_array(Object *obj,
>                                          const RISCVCPUMultiExtConfig *array)
>  {
> @@ -1577,56 +1552,6 @@ static void riscv_cpu_add_multiext_prop_array(Object *obj,
>      }
>  }
>  
> -#ifndef CONFIG_USER_ONLY
> -static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
> -{
> -    /* Check if KVM created the property already */
> -    if (object_property_find(obj, prop_name)) {
> -        return;
> -    }
> -
> -    /*
> -     * Set the default to disabled for every extension
> -     * unknown to KVM and error out if the user attempts
> -     * to enable any of them.
> -     */
> -    object_property_add(obj, prop_name, "bool",
> -                        NULL, cpu_set_cfg_unavailable,
> -                        NULL, (void *)prop_name);
> -}
> -
> -static void riscv_cpu_add_kvm_unavail_prop_array(Object *obj,
> -                                        const RISCVCPUMultiExtConfig *array)
> -{
> -    const RISCVCPUMultiExtConfig *prop;
> -
> -    for (prop = array; prop && prop->name; prop++) {
> -        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
> -    }
> -}
> -
> -static void riscv_cpu_add_kvm_properties(Object *obj)
> -{
> -    Property *prop;
> -    DeviceState *dev = DEVICE(obj);
> -
> -    kvm_riscv_init_user_properties(obj);
> -    riscv_cpu_add_misa_properties(obj);
> -
> -    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
> -    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
> -    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_exts);
> -
> -    for (prop = riscv_cpu_options; prop && prop->name; prop++) {
> -        /* Check if KVM created the property already */
> -        if (object_property_find(obj, prop->name)) {
> -            continue;
> -        }
> -        qdev_property_add_static(dev, prop);
> -    }
> -}
> -#endif
> -
>  /*
>   * Add CPU properties with user-facing flags.
>   *
> @@ -1639,7 +1564,7 @@ static void riscv_cpu_add_user_properties(Object *obj)
>      riscv_add_satp_mode_properties(obj);
>  
>      if (kvm_enabled()) {
> -        riscv_cpu_add_kvm_properties(obj);
> +        kvm_riscv_cpu_add_kvm_properties(obj);
>          return;
>      }
>  #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 2ac00a0304..b9c4bea3f7 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -22,6 +22,7 @@
>  
>  #include "hw/core/cpu.h"
>  #include "hw/registerfields.h"
> +#include "hw/qdev-properties.h"
>  #include "exec/cpu-defs.h"
>  #include "qemu/cpu-float.h"
>  #include "qom/object.h"
> @@ -713,6 +714,19 @@ bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset);
>  int cpu_cfg_ext_get_min_version(uint32_t ext_offset);
>  void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu);
>  
> +typedef struct RISCVCPUMultiExtConfig {
> +    const char *name;
> +    uint32_t offset;
> +    bool enabled;
> +} RISCVCPUMultiExtConfig;
> +
> +extern const RISCVCPUMultiExtConfig riscv_cpu_extensions[];
> +extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
> +extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
> +extern Property riscv_cpu_options[];
> +
> +void riscv_cpu_add_misa_properties(Object *cpu_obj);
> +
>  /* CSR function table */
>  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
>  
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 59004caa8e..7e67121456 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -338,6 +338,50 @@ static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
>      }
>  }
>  
> +static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
> +                                    const char *name,
> +                                    void *opaque, Error **errp)
> +{
> +    const char *propname = opaque;
> +    bool value;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (value) {
> +        error_setg(errp, "extension %s is not available with KVM",
> +                   propname);
> +    }
> +}
> +
> +static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
> +{
> +    /* Check if KVM created the property already */
> +    if (object_property_find(obj, prop_name)) {
> +        return;
> +    }
> +
> +    /*
> +     * Set the default to disabled for every extension
> +     * unknown to KVM and error out if the user attempts
> +     * to enable any of them.
> +     */
> +    object_property_add(obj, prop_name, "bool",
> +                        NULL, cpu_set_cfg_unavailable,
> +                        NULL, (void *)prop_name);
> +}
> +
> +static void riscv_cpu_add_kvm_unavail_prop_array(Object *obj,
> +                                        const RISCVCPUMultiExtConfig *array)
> +{
> +    const RISCVCPUMultiExtConfig *prop;
> +
> +    for (prop = array; prop && prop->name; prop++) {
> +        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
> +    }
> +}
> +
>  static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>  {
>      int i;
> @@ -747,7 +791,7 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>      }
>  }
>  
> -void kvm_riscv_init_user_properties(Object *cpu_obj)
> +static void riscv_init_user_properties(Object *cpu_obj)
>  {
>      RISCVCPU *cpu = RISCV_CPU(cpu_obj);
>      KVMScratchCPU kvmcpu;
> @@ -1218,6 +1262,26 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>      kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
>  }
>  
> +void kvm_riscv_cpu_add_kvm_properties(Object *obj)
> +{
> +    DeviceState *dev = DEVICE(obj);
> +
> +    riscv_init_user_properties(obj);
> +    riscv_cpu_add_misa_properties(obj);
> +
> +    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
> +    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
> +    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_exts);
> +
> +    for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
> +        /* Check if KVM created the property already */
> +        if (object_property_find(obj, prop->name)) {
> +            continue;
> +        }
> +        qdev_property_add_static(dev, prop);
> +    }
> +}
> +
>  static void riscv_host_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index 7d4b7c60e2..81e08b8359 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -19,7 +19,7 @@
>  #ifndef QEMU_KVM_RISCV_H
>  #define QEMU_KVM_RISCV_H
>  
> -void kvm_riscv_init_user_properties(Object *cpu_obj);
> +void kvm_riscv_cpu_add_kvm_properties(Object *obj);
>  void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>  void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
>  void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
> -- 
> 2.41.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

