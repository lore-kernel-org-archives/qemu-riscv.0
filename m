Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111ACCD54AF
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 11:27:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiYsc-0001Cz-Uo; Tue, 19 Sep 2023 07:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiYsb-0001Bx-UD; Tue, 19 Sep 2023 07:26:57 -0400
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiYsX-0000gU-J3; Tue, 19 Sep 2023 07:26:57 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VsRHrBH_1695122799; 
Received: from 30.221.108.237(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VsRHrBH_1695122799) by smtp.aliyun-inc.com;
 Tue, 19 Sep 2023 19:26:40 +0800
Message-ID: <3c2dd310-f924-bdae-6597-9d83232e03d1@linux.alibaba.com>
Date: Tue, 19 Sep 2023 19:25:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 08/19] target/riscv: move
 riscv_cpu_add_kvm_properties() to kvm.c
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com, ajones@ventanamicro.com,
 philmd@linaro.org
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
 <20230906091647.1667171-9-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230906091647.1667171-9-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.99;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-99.freemail.mail.aliyun.com
X-Spam_score_int: -113
X-Spam_score: -11.4
X-Spam_bar: -----------
X-Spam_report: (-11.4 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2023/9/6 17:16, Daniel Henrique Barboza wrote:
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

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> ---
>   target/riscv/cpu.c       | 89 +++-------------------------------------
>   target/riscv/cpu.h       | 14 +++++++
>   target/riscv/kvm.c       | 68 +++++++++++++++++++++++++++++-
>   target/riscv/kvm_riscv.h |  2 +-
>   4 files changed, 88 insertions(+), 85 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 50c2819d68..0dc9b3201d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1370,7 +1370,7 @@ static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
>    * change MISA bits during realize() (RVG enables MISA
>    * bits but the user is warned about it).
>    */
> -static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> +void riscv_cpu_add_misa_properties(Object *cpu_obj)
>   {
>       int i;
>   
> @@ -1397,17 +1397,11 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>       }
>   }
>   
> -typedef struct RISCVCPUMultiExtConfig {
> -    const char *name;
> -    uint32_t offset;
> -    bool enabled;
> -} RISCVCPUMultiExtConfig;
> -
>   #define MULTI_EXT_CFG_BOOL(_name, _prop, _defval) \
>       {.name = _name, .offset = CPU_CFG_OFFSET(_prop), \
>        .enabled = _defval}
>   
> -static const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
> +const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>       /* Defaults for standard extensions */
>       MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
>       MULTI_EXT_CFG_BOOL("Zifencei", ext_ifencei, true),
> @@ -1469,7 +1463,7 @@ static const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> -static const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
> +const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
>       MULTI_EXT_CFG_BOOL("xtheadba", ext_xtheadba, false),
>       MULTI_EXT_CFG_BOOL("xtheadbb", ext_xtheadbb, false),
>       MULTI_EXT_CFG_BOOL("xtheadbs", ext_xtheadbs, false),
> @@ -1487,7 +1481,7 @@ static const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
>   };
>   
>   /* These are experimental so mark with 'x-' */
> -static const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
> +const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>       /* ePMP 0.9.3 */
>       MULTI_EXT_CFG_BOOL("x-epmp", epmp, false),
>       MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
> @@ -1513,7 +1507,7 @@ static const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> -static Property riscv_cpu_options[] = {
> +Property riscv_cpu_options[] = {
>       DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>   
>       DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> @@ -1574,25 +1568,6 @@ static void cpu_add_multi_ext_prop(Object *cpu_obj,
>                              multi_cfg->enabled);
>   }
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
>   static void riscv_cpu_add_multiext_prop_array(Object *obj,
>                                           const RISCVCPUMultiExtConfig *array)
>   {
> @@ -1605,58 +1580,6 @@ static void riscv_cpu_add_multiext_prop_array(Object *obj,
>       }
>   }
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
> -    g_assert(array);
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
>   /*
>    * Add CPU properties with user-facing flags.
>    *
> @@ -1669,7 +1592,7 @@ static void riscv_cpu_add_user_properties(Object *obj)
>       riscv_add_satp_mode_properties(obj);
>   
>       if (kvm_enabled()) {
> -        riscv_cpu_add_kvm_properties(obj);
> +        kvm_riscv_cpu_add_kvm_properties(obj);
>           return;
>       }
>   #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 2ac00a0304..b9c4bea3f7 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -22,6 +22,7 @@
>   
>   #include "hw/core/cpu.h"
>   #include "hw/registerfields.h"
> +#include "hw/qdev-properties.h"
>   #include "exec/cpu-defs.h"
>   #include "qemu/cpu-float.h"
>   #include "qom/object.h"
> @@ -713,6 +714,19 @@ bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset);
>   int cpu_cfg_ext_get_min_version(uint32_t ext_offset);
>   void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu);
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
>   /* CSR function table */
>   extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
>   
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index b4d8d7a46c..7dac01374f 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -343,6 +343,52 @@ static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
>       }
>   }
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
> +    g_assert(array);
> +
> +    for (prop = array; prop && prop->name; prop++) {
> +        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
> +    }
> +}
> +
>   static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>   {
>       int i;
> @@ -752,7 +798,7 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>       }
>   }
>   
> -void kvm_riscv_init_user_properties(Object *cpu_obj)
> +static void riscv_init_user_properties(Object *cpu_obj)
>   {
>       RISCVCPU *cpu = RISCV_CPU(cpu_obj);
>       KVMScratchCPU kvmcpu;
> @@ -1228,6 +1274,26 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>       kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
>   }
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
>   static void riscv_host_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index de8c209ebc..f6501e68e2 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -19,7 +19,7 @@
>   #ifndef QEMU_KVM_RISCV_H
>   #define QEMU_KVM_RISCV_H
>   
> -void kvm_riscv_init_user_properties(Object *cpu_obj);
> +void kvm_riscv_cpu_add_kvm_properties(Object *obj);
>   void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>   void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
>   void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,

