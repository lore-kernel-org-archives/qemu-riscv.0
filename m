Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9244E7D0CB
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 05:56:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qjZ9S-0004Up-3O; Fri, 22 Sep 2023 01:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjZ9Q-0004Uc-MY; Fri, 22 Sep 2023 01:56:28 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qjZ9O-0001Lh-MX; Fri, 22 Sep 2023 01:56:28 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-495c10cec8aso740574e0c.1; 
 Thu, 21 Sep 2023 22:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695362185; x=1695966985; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uo49X8C9x0ODt/3VCNXzriSh6X4E4oMMK6Q7h3jLy8Q=;
 b=bbimJ/XZYxErkv/rek4Y5TIGFHtv4xcXpJYj6uQmmlTV3vXhOVWmO2Sprd2ZQGoPeJ
 q7FhVHYoq2By+5cs2Ksj2eleRLnXuHI6srgjOSEb2q0QWsYdf5saL8V7PZDQ+TVpuXvK
 fnU2cGLU5Z1Y9YMsT0rx7CNoXO7l2Jtf8LMs7JrhFDVzVMMxojq86eVEc3M+R/1V35Ai
 mH0fNP0gsjSQsDEctRbXtEOrwmoyoE+5UtfgdZ8ZE2RYFGKrvs/B/ZyeQgpwj9ybgZ1E
 9rEoOCbOisF3mdwNh9kkBZVWoQQNf9PoQGVDs27wQn2ouvZV4Z9CfTv9jRWlO/mXxQ6G
 GySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695362185; x=1695966985;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uo49X8C9x0ODt/3VCNXzriSh6X4E4oMMK6Q7h3jLy8Q=;
 b=HzEyFRm1m8qGmR8/OJ9JOzkFG25Azroo+d0uNpH1b5QbRskrqsU7YC9a46a8I/x0Ev
 RsZh3B+r8dnOgdIaAW4zP0t4tAqmEJt28W1IZdXLNdIcLGhYRYr9vSGCtEKZVogkWd1k
 nuBRV6iMIH8lvUfIJkH3YAG7Erbxyca/h9sTusEs1gcu7ov+8cr33OLs91C2bNq5Ueuh
 D8yYCiZJDCZh+VRzPljt6siF50dNqVqDVgtcAaZFG5W+HyJX8QKoji4API13yhm9c/1v
 cDRlDLTDwtlD3ooxTW9bg+Mpttd4u4u3tlgvZLRcqwkQ2gZelZzmJPvRgm07Y9uSjUE4
 fppg==
X-Gm-Message-State: AOJu0YygsNKt893TCRMIZ7EygaqKSv42vqDxVAti9j7e90mj/RyiKT5S
 lABeaDJGwFC5W3x8rTfaOramCafhZOt0bIPbHmQ=
X-Google-Smtp-Source: AGHT+IGglWkjunbcRL+kLijWZOjwAOkP13ZE6IJrr81GvCTYBpdYCSraZApwM6MlR6aV5nmvvr+td5JJkpqd/RjZl9U=
X-Received: by 2002:a1f:d541:0:b0:48f:280a:1d58 with SMTP id
 m62-20020a1fd541000000b0048f280a1d58mr10191483vkg.5.1695362184739; Thu, 21
 Sep 2023 22:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-9-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-9-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Sep 2023 15:55:58 +1000
Message-ID: <CAKmqyKPea-1c4nBC8d6FutsvtdTAOzR4iXbd5=7ohBDotZzkAg@mail.gmail.com>
Subject: Re: [PATCH v3 08/19] target/riscv: move riscv_cpu_add_kvm_properties()
 to kvm.c
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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

On Wed, Sep 20, 2023 at 10:47=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
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
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c       | 85 +++-------------------------------------
>  target/riscv/cpu.h       | 14 +++++++
>  target/riscv/kvm.c       | 68 +++++++++++++++++++++++++++++++-
>  target/riscv/kvm_riscv.h |  3 --
>  4 files changed, 86 insertions(+), 84 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 048a2dbc77..0dc9b3201d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1370,7 +1370,7 @@ static RISCVCPUMisaExtConfig misa_ext_cfgs[] =3D {
>   * change MISA bits during realize() (RVG enables MISA
>   * bits but the user is warned about it).
>   */
> -static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> +void riscv_cpu_add_misa_properties(Object *cpu_obj)
>  {
>      int i;
>
> @@ -1397,17 +1397,11 @@ static void riscv_cpu_add_misa_properties(Object =
*cpu_obj)
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
>      {.name =3D _name, .offset =3D CPU_CFG_OFFSET(_prop), \
>       .enabled =3D _defval}
>
> -static const RISCVCPUMultiExtConfig riscv_cpu_extensions[] =3D {
> +const RISCVCPUMultiExtConfig riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
>      MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
>      MULTI_EXT_CFG_BOOL("Zifencei", ext_ifencei, true),
> @@ -1469,7 +1463,7 @@ static const RISCVCPUMultiExtConfig riscv_cpu_exten=
sions[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> -static const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] =3D {
> +const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] =3D {
>      MULTI_EXT_CFG_BOOL("xtheadba", ext_xtheadba, false),
>      MULTI_EXT_CFG_BOOL("xtheadbb", ext_xtheadbb, false),
>      MULTI_EXT_CFG_BOOL("xtheadbs", ext_xtheadbs, false),
> @@ -1487,7 +1481,7 @@ static const RISCVCPUMultiExtConfig riscv_cpu_vendo=
r_exts[] =3D {
>  };
>
>  /* These are experimental so mark with 'x-' */
> -static const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] =3D {
> +const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] =3D {
>      /* ePMP 0.9.3 */
>      MULTI_EXT_CFG_BOOL("x-epmp", epmp, false),
>      MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
> @@ -1513,7 +1507,7 @@ static const RISCVCPUMultiExtConfig riscv_cpu_exper=
imental_exts[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> -static Property riscv_cpu_options[] =3D {
> +Property riscv_cpu_options[] =3D {
>      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> @@ -1586,75 +1580,6 @@ static void riscv_cpu_add_multiext_prop_array(Obje=
ct *obj,
>      }
>  }
>
> -#ifdef CONFIG_KVM
> -static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
> -                                    const char *name,
> -                                    void *opaque, Error **errp)
> -{
> -    const char *propname =3D opaque;
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
> -
> -static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop=
_name)
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
> -                                        const RISCVCPUMultiExtConfig *ar=
ray)
> -{
> -    const RISCVCPUMultiExtConfig *prop;
> -
> -    g_assert(array);
> -
> -    for (prop =3D array; prop && prop->name; prop++) {
> -        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
> -    }
> -}
> -
> -void kvm_riscv_cpu_add_kvm_properties(Object *obj)
> -{
> -    Property *prop;
> -    DeviceState *dev =3D DEVICE(obj);
> -
> -    kvm_riscv_init_user_properties(obj);
> -    riscv_cpu_add_misa_properties(obj);
> -
> -    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
> -    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
> -    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_ext=
s);
> -
> -    for (prop =3D riscv_cpu_options; prop && prop->name; prop++) {
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
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index b2e558f730..9dc4113812 100644
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
> @@ -713,6 +714,19 @@ bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_=
offset);
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
> index 31d2ede4b6..e682a70311 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -345,6 +345,52 @@ static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCP=
U *cpu, CPUState *cs)
>      }
>  }
>
> +static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
> +                                    const char *name,
> +                                    void *opaque, Error **errp)
> +{
> +    const char *propname =3D opaque;
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
> +static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop=
_name)
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
> +                                        const RISCVCPUMultiExtConfig *ar=
ray)
> +{
> +    const RISCVCPUMultiExtConfig *prop;
> +
> +    g_assert(array);
> +
> +    for (prop =3D array; prop && prop->name; prop++) {
> +        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
> +    }
> +}
> +
>  static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>  {
>      int i;
> @@ -754,7 +800,7 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu=
, KVMScratchCPU *kvmcpu)
>      }
>  }
>
> -void kvm_riscv_init_user_properties(Object *cpu_obj)
> +static void riscv_init_user_properties(Object *cpu_obj)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cpu_obj);
>      KVMScratchCPU kvmcpu;
> @@ -1272,6 +1318,26 @@ void kvm_riscv_aia_create(MachineState *machine, u=
int64_t group_shift,
>      kvm_msi_via_irqfd_allowed =3D kvm_irqfds_enabled();
>  }
>
> +void kvm_riscv_cpu_add_kvm_properties(Object *obj)
> +{
> +    DeviceState *dev =3D DEVICE(obj);
> +
> +    riscv_init_user_properties(obj);
> +    riscv_cpu_add_misa_properties(obj);
> +
> +    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
> +    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
> +    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_ext=
s);
> +
> +    for (Property *prop =3D riscv_cpu_options; prop && prop->name; prop+=
+) {
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
>      CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index 44b850a046..da9630c4af 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -19,10 +19,7 @@
>  #ifndef QEMU_KVM_RISCV_H
>  #define QEMU_KVM_RISCV_H
>
> -/* Temporarily implemented in cpu.c */
>  void kvm_riscv_cpu_add_kvm_properties(Object *obj);
> -
> -void kvm_riscv_init_user_properties(Object *cpu_obj);
>  void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>  void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
>  void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
> --
> 2.41.0
>
>

