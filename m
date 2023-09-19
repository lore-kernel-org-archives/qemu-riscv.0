Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB51CD54AB
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 09:55:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiXRr-0003gB-PQ; Tue, 19 Sep 2023 05:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiXRp-0003fe-M3; Tue, 19 Sep 2023 05:55:13 -0400
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiXRm-0001kU-1t; Tue, 19 Sep 2023 05:55:13 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R861e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VsR1k6F_1695117301; 
Received: from 30.221.108.237(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VsR1k6F_1695117301) by smtp.aliyun-inc.com;
 Tue, 19 Sep 2023 17:55:02 +0800
Message-ID: <fae56dea-55e2-eaae-3be2-d73138895ec3@linux.alibaba.com>
Date: Tue, 19 Sep 2023 17:54:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 02/19] target/riscv: move riscv_cpu_realize_tcg() to
 TCG::cpu_realizefn()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com, ajones@ventanamicro.com,
 philmd@linaro.org
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
 <20230906091647.1667171-3-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230906091647.1667171-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.111;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-111.freemail.mail.aliyun.com
X-Spam_score_int: -113
X-Spam_score: -11.4
X-Spam_bar: -----------
X-Spam_report: (-11.4 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
> riscv_cpu_realize_tcg() was added to allow TCG cpus to have a different
> realize() path during the common riscv_cpu_realize(), making it a good
> choice to start moving TCG exclusive code to tcg-cpu.c.
>
> Rename it to tcg_cpu_realizefn() and assign it as a implementation of
> accel::cpu_realizefn(). tcg_cpu_realizefn() will then be called during
> riscv_cpu_realize() via cpu_exec_realizefn(). We'll use a similar
> approach with KVM in the near future.
>
> riscv_cpu_validate_set_extensions() is too big and with too many
> dependencies to be moved in this same patch. We'll do that next.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> ---
>   target/riscv/cpu.c         | 128 -----------------------------------
>   target/riscv/tcg/tcg-cpu.c | 132 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 132 insertions(+), 128 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2c6972fa0d..59785f5d9a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -23,9 +23,7 @@
>   #include "qemu/log.h"
>   #include "cpu.h"
>   #include "cpu_vendorid.h"
> -#include "pmu.h"
>   #include "internals.h"
> -#include "time_helper.h"
>   #include "exec/exec-all.h"
>   #include "qapi/error.h"
>   #include "qapi/visitor.h"
> @@ -1064,29 +1062,6 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
>       }
>   }
>   
> -static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
> -{
> -    CPURISCVState *env = &cpu->env;
> -    int priv_version = -1;
> -
> -    if (cpu->cfg.priv_spec) {
> -        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
> -            priv_version = PRIV_VERSION_1_12_0;
> -        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
> -            priv_version = PRIV_VERSION_1_11_0;
> -        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
> -            priv_version = PRIV_VERSION_1_10_0;
> -        } else {
> -            error_setg(errp,
> -                       "Unsupported privilege spec version '%s'",
> -                       cpu->cfg.priv_spec);
> -            return;
> -        }
> -
> -        env->priv_ver = priv_version;
> -    }
> -}
> -
>   static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>   {
>       CPURISCVState *env = &cpu->env;
> @@ -1111,33 +1086,6 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>       }
>   }
>   
> -static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
> -{
> -    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
> -    CPUClass *cc = CPU_CLASS(mcc);
> -    CPURISCVState *env = &cpu->env;
> -
> -    /* Validate that MISA_MXL is set properly. */
> -    switch (env->misa_mxl_max) {
> -#ifdef TARGET_RISCV64
> -    case MXL_RV64:
> -    case MXL_RV128:
> -        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
> -        break;
> -#endif
> -    case MXL_RV32:
> -        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -
> -    if (env->misa_mxl_max != env->misa_mxl) {
> -        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
> -        return;
> -    }
> -}
> -
>   /*
>    * Check consistency between chosen extensions while setting
>    * cpu->cfg accordingly.
> @@ -1511,74 +1459,6 @@ static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
>   #endif
>   }
>   
> -static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
> -{
> -    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) {
> -        error_setg(errp, "H extension requires priv spec 1.12.0");
> -        return;
> -    }
> -}
> -
> -static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
> -{
> -    RISCVCPU *cpu = RISCV_CPU(dev);
> -    CPURISCVState *env = &cpu->env;
> -    Error *local_err = NULL;
> -
> -    if (object_dynamic_cast(OBJECT(dev), TYPE_RISCV_CPU_HOST)) {
> -        error_setg(errp, "'host' CPU is not compatible with TCG acceleration");
> -        return;
> -    }
> -
> -    riscv_cpu_validate_misa_mxl(cpu, &local_err);
> -    if (local_err != NULL) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
> -    riscv_cpu_validate_priv_spec(cpu, &local_err);
> -    if (local_err != NULL) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
> -    riscv_cpu_validate_misa_priv(env, &local_err);
> -    if (local_err != NULL) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
> -    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
> -        /*
> -         * Enhanced PMP should only be available
> -         * on harts with PMP support
> -         */
> -        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
> -        return;
> -    }
> -
> -    riscv_cpu_validate_set_extensions(cpu, &local_err);
> -    if (local_err != NULL) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
> -#ifndef CONFIG_USER_ONLY
> -    CPU(dev)->tcg_cflags |= CF_PCREL;
> -
> -    if (cpu->cfg.ext_sstc) {
> -        riscv_timer_init(cpu);
> -    }
> -
> -    if (cpu->cfg.pmu_num) {
> -        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
> -            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> -                                          riscv_pmu_timer_cb, cpu);
> -        }
> -     }
> -#endif
> -}
> -
>   static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>   {
>       CPUState *cs = CPU(dev);
> @@ -1597,14 +1477,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -    if (tcg_enabled()) {
> -        riscv_cpu_realize_tcg(dev, &local_err);
> -        if (local_err != NULL) {
> -            error_propagate(errp, local_err);
> -            return;
> -        }
> -    }
> -
>       riscv_cpu_finalize_features(cpu, &local_err);
>       if (local_err != NULL) {
>           error_propagate(errp, local_err);
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 0326cead0d..84ad6f1daf 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -19,9 +19,140 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> +#include "pmu.h"
> +#include "time_helper.h"
> +#include "qapi/error.h"
>   #include "qemu/accel.h"
>   #include "hw/core/accel-cpu.h"
>   
> +
> +static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
> +{
> +    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) {
> +        error_setg(errp, "H extension requires priv spec 1.12.0");
> +        return;
> +    }
> +}
> +
> +static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
> +{
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
> +    CPUClass *cc = CPU_CLASS(mcc);
> +    CPURISCVState *env = &cpu->env;
> +
> +    /* Validate that MISA_MXL is set properly. */
> +    switch (env->misa_mxl_max) {
> +#ifdef TARGET_RISCV64
> +    case MXL_RV64:
> +    case MXL_RV128:
> +        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
> +        break;
> +#endif
> +    case MXL_RV32:
> +        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    if (env->misa_mxl_max != env->misa_mxl) {
> +        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
> +        return;
> +    }
> +}
> +
> +static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    int priv_version = -1;
> +
> +    if (cpu->cfg.priv_spec) {
> +        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
> +            priv_version = PRIV_VERSION_1_12_0;
> +        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
> +            priv_version = PRIV_VERSION_1_11_0;
> +        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
> +            priv_version = PRIV_VERSION_1_10_0;
> +        } else {
> +            error_setg(errp,
> +                       "Unsupported privilege spec version '%s'",
> +                       cpu->cfg.priv_spec);
> +            return;
> +        }
> +
> +        env->priv_ver = priv_version;
> +    }
> +}
> +
> +/*
> + * We'll get here via the following path:
> + *
> + * riscv_cpu_realize()
> + *   -> cpu_exec_realizefn()
> + *      -> tcg_cpu_realizefn() (via accel_cpu_realizefn())
> + */
> +static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    Error *local_err = NULL;
> +
> +    if (object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
> +        error_setg(errp, "'host' CPU is not compatible with TCG acceleration");
> +        return false;
> +    }
> +
> +    riscv_cpu_validate_misa_mxl(cpu, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return false;
> +    }
> +
> +    riscv_cpu_validate_priv_spec(cpu, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return false;
> +    }
> +
> +    riscv_cpu_validate_misa_priv(env, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return false;
> +    }
> +
> +    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
> +        /*
> +         * Enhanced PMP should only be available
> +         * on harts with PMP support
> +         */
> +        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
> +        return false;
> +    }
> +
> +    riscv_cpu_validate_set_extensions(cpu, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return false;
> +    }
> +
> +#ifndef CONFIG_USER_ONLY
> +    CPU(cs)->tcg_cflags |= CF_PCREL;
> +
> +    if (cpu->cfg.ext_sstc) {
> +        riscv_timer_init(cpu);
> +    }
> +
> +    if (cpu->cfg.pmu_num) {
> +        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
> +            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                          riscv_pmu_timer_cb, cpu);
> +        }
> +     }
> +#endif
> +
> +    return true;
> +}
> +
>   static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
>   {
>       /*
> @@ -41,6 +172,7 @@ static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
>       AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
>   
>       acc->cpu_class_init = tcg_cpu_class_init;
> +    acc->cpu_realizefn = tcg_cpu_realizefn;
>   }
>   
>   static const TypeInfo tcg_cpu_accel_type_info = {

