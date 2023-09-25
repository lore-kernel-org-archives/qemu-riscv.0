Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868FDCE7A89
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 09:17:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkhiy-00043S-UW; Mon, 25 Sep 2023 05:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkhif-000428-Ae
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 05:17:41 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkhiX-00057l-Lb
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 05:17:27 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6907e44665bso5286892b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 02:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695633444; x=1696238244; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p4AVMozzVKHtqFjbbyEXqwh+nM0oon7wjeyCZz6t5l4=;
 b=kpSF4R94+z3X9YnYyyXqrOyeWgE1hcMvbgQQDHVLnRy4AdvNxilXHzjFiCk+W0Ajye
 Zg1CaS3zLOz/zJEQut4n5Edmk1QJcNvuc1K6SRo5Kvs5f9qWfNIJi/GfiHp6gFhTa+3j
 IaKFqU1YOXTgCgTgklVNBqUo+Qok8JHi8bKWi3SluK9LmEg2UpxF0JoHN8p8FpSrlTeV
 z+xn5qJQ9FOH6ZfKgG4mX/yM2YsTAHPqsUvsAiDR3REKl2bbcbneCXZogBTFc6G9VmrX
 M3UvtSnV8ta0ZlwUlUAidKlAQ3/kqJhHPTeG3leB2IQi5BdUsKWnuZECYYwcm9JOY/dX
 xgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695633444; x=1696238244;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p4AVMozzVKHtqFjbbyEXqwh+nM0oon7wjeyCZz6t5l4=;
 b=GW+esrwCe2dQLo7C3GAyWEgZHG4WvzTG1mo85wphXgBAzOWQV1dCKDqq8V8+H7/rg4
 VNznhLbQriSUYAC2eRg6Z43AhIXY2f2oXYmoFf0N7oPvXKE8p6x+F9R63kfZ8JcT+fmg
 WBV/EK2nrtobmQ5FhrX74K1k3UbZMFpFQLnjSMTMk4LHuq+y+JWAB5diM7YnmQmL0jlh
 hYUv/vxxFp3voO/yFa1kvi6ystwoneDzjJME2kl1734lG6KsBN+SnD9oIbh3v54xNLpI
 Fgr2chMUeR/ARCCR3XCWs/BZtq+NxP9ziyUX8i5kmOIO1o9HnQvY/Td6gy7RSfZdxDW8
 WmyA==
X-Gm-Message-State: AOJu0Yy5PRWKmOKC8hrtBH6QFcECOcAkmo1u4MTzyETR8MUdVQDX1ovN
 SehOI0uSshzSSqySCxUiBEYYFw==
X-Google-Smtp-Source: AGHT+IGrjFRQx78fiKPu72mV8lBZ4fQtUpmf61kZxybhnF/h9R8h8KoXuo/VcQazeBafdkTAVH5qHg==
X-Received: by 2002:a05:6a21:4843:b0:121:e573:3680 with SMTP id
 au3-20020a056a21484300b00121e5733680mr6067770pzc.62.1695633444008; 
 Mon, 25 Sep 2023 02:17:24 -0700 (PDT)
Received: from [192.168.68.107] ([177.94.42.59])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a170902b58900b001c46d04d001sm733465pls.87.2023.09.25.02.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 02:17:23 -0700 (PDT)
Message-ID: <68e7c41d-07b9-e265-6d3c-5f7b644ed0ca@ventanamicro.com>
Date: Mon, 25 Sep 2023 06:17:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 02/19] target/riscv: move riscv_cpu_realize_tcg() to
 TCG::cpu_realizefn()
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-3-dbarboza@ventanamicro.com>
 <CAKmqyKMArWjph7iMuUteWseiXgX1QbdvYWarRT=Qoa5kbXNErA@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKMArWjph7iMuUteWseiXgX1QbdvYWarRT=Qoa5kbXNErA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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



On 9/22/23 02:29, Alistair Francis wrote:
> On Wed, Sep 20, 2023 at 9:24 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> riscv_cpu_realize_tcg() was added to allow TCG cpus to have a different
>> realize() path during the common riscv_cpu_realize(), making it a good
>> choice to start moving TCG exclusive code to tcg-cpu.c.
>>
>> Rename it to tcg_cpu_realizefn() and assign it as a implementation of
>> accel::cpu_realizefn(). tcg_cpu_realizefn() will then be called during
>> riscv_cpu_realize() via cpu_exec_realizefn(). We'll use a similar
>> approach with KVM in the near future.
>>
>> riscv_cpu_validate_set_extensions() is too big and with too many
>> dependencies to be moved in this same patch. We'll do that next.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> ---
>>   target/riscv/cpu.c         | 128 -----------------------------------
>>   target/riscv/tcg/tcg-cpu.c | 133 +++++++++++++++++++++++++++++++++++++
>>   2 files changed, 133 insertions(+), 128 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index e72c49c881..030629294f 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -23,9 +23,7 @@
>>   #include "qemu/log.h"
>>   #include "cpu.h"
>>   #include "cpu_vendorid.h"
>> -#include "pmu.h"
>>   #include "internals.h"
>> -#include "time_helper.h"
>>   #include "exec/exec-all.h"
>>   #include "qapi/error.h"
>>   #include "qapi/visitor.h"
>> @@ -1064,29 +1062,6 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
>>       }
>>   }
>>
>> -static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
>> -{
>> -    CPURISCVState *env = &cpu->env;
>> -    int priv_version = -1;
>> -
>> -    if (cpu->cfg.priv_spec) {
>> -        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
>> -            priv_version = PRIV_VERSION_1_12_0;
>> -        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
>> -            priv_version = PRIV_VERSION_1_11_0;
>> -        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
>> -            priv_version = PRIV_VERSION_1_10_0;
>> -        } else {
>> -            error_setg(errp,
>> -                       "Unsupported privilege spec version '%s'",
>> -                       cpu->cfg.priv_spec);
>> -            return;
>> -        }
>> -
>> -        env->priv_ver = priv_version;
>> -    }
>> -}
>> -
>>   static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>>   {
>>       CPURISCVState *env = &cpu->env;
>> @@ -1111,33 +1086,6 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>>       }
>>   }
>>
>> -static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>> -{
>> -    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>> -    CPUClass *cc = CPU_CLASS(mcc);
>> -    CPURISCVState *env = &cpu->env;
>> -
>> -    /* Validate that MISA_MXL is set properly. */
>> -    switch (env->misa_mxl_max) {
>> -#ifdef TARGET_RISCV64
>> -    case MXL_RV64:
>> -    case MXL_RV128:
>> -        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
>> -        break;
>> -#endif
>> -    case MXL_RV32:
>> -        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
>> -        break;
>> -    default:
>> -        g_assert_not_reached();
>> -    }
>> -
>> -    if (env->misa_mxl_max != env->misa_mxl) {
>> -        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
>> -        return;
>> -    }
>> -}
>> -
>>   /*
>>    * Check consistency between chosen extensions while setting
>>    * cpu->cfg accordingly.
>> @@ -1511,74 +1459,6 @@ static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
>>   #endif
>>   }
>>
>> -static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
>> -{
>> -    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) {
>> -        error_setg(errp, "H extension requires priv spec 1.12.0");
>> -        return;
>> -    }
>> -}
>> -
>> -static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
>> -{
>> -    RISCVCPU *cpu = RISCV_CPU(dev);
>> -    CPURISCVState *env = &cpu->env;
>> -    Error *local_err = NULL;
>> -
>> -    if (object_dynamic_cast(OBJECT(dev), TYPE_RISCV_CPU_HOST)) {
>> -        error_setg(errp, "'host' CPU is not compatible with TCG acceleration");
>> -        return;
>> -    }
>> -
>> -    riscv_cpu_validate_misa_mxl(cpu, &local_err);
>> -    if (local_err != NULL) {
>> -        error_propagate(errp, local_err);
>> -        return;
>> -    }
>> -
>> -    riscv_cpu_validate_priv_spec(cpu, &local_err);
>> -    if (local_err != NULL) {
>> -        error_propagate(errp, local_err);
>> -        return;
>> -    }
>> -
>> -    riscv_cpu_validate_misa_priv(env, &local_err);
>> -    if (local_err != NULL) {
>> -        error_propagate(errp, local_err);
>> -        return;
>> -    }
>> -
>> -    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
>> -        /*
>> -         * Enhanced PMP should only be available
>> -         * on harts with PMP support
>> -         */
>> -        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
>> -        return;
>> -    }
>> -
>> -    riscv_cpu_validate_set_extensions(cpu, &local_err);
>> -    if (local_err != NULL) {
>> -        error_propagate(errp, local_err);
>> -        return;
>> -    }
>> -
>> -#ifndef CONFIG_USER_ONLY
>> -    CPU(dev)->tcg_cflags |= CF_PCREL;
>> -
>> -    if (cpu->cfg.ext_sstc) {
>> -        riscv_timer_init(cpu);
>> -    }
>> -
>> -    if (cpu->cfg.pmu_num) {
>> -        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
>> -            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>> -                                          riscv_pmu_timer_cb, cpu);
>> -        }
>> -     }
>> -#endif
>> -}
>> -
>>   static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>   {
>>       CPUState *cs = CPU(dev);
>> @@ -1597,14 +1477,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>           return;
>>       }
>>
>> -    if (tcg_enabled()) {
>> -        riscv_cpu_realize_tcg(dev, &local_err);
>> -        if (local_err != NULL) {
>> -            error_propagate(errp, local_err);
>> -            return;
>> -        }
>> -    }
>> -
>>       riscv_cpu_finalize_features(cpu, &local_err);
>>       if (local_err != NULL) {
>>           error_propagate(errp, local_err);
>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>> index 0326cead0d..f47dc2064f 100644
>> --- a/target/riscv/tcg/tcg-cpu.c
>> +++ b/target/riscv/tcg/tcg-cpu.c
>> @@ -18,10 +18,142 @@
>>    */
> 
> I do think we should keep the Copyright statements from cpu.c in this
> new file as you are now copying across the majority of code from there

I don't mind keeping the copyright statements from cpu.c here. Feel free to change it
in tree (or let me know if you want me to re-send).


Thanks,


Daniel

> 
> Alistair
> 
>>
>>   #include "qemu/osdep.h"
>> +#include "exec/exec-all.h"
>>   #include "cpu.h"
>> +#include "pmu.h"
>> +#include "time_helper.h"
>> +#include "qapi/error.h"
>>   #include "qemu/accel.h"
>>   #include "hw/core/accel-cpu.h"
>>
>> +
>> +static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
>> +{
>> +    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) {
>> +        error_setg(errp, "H extension requires priv spec 1.12.0");
>> +        return;
>> +    }
>> +}
>> +
>> +static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>> +{
>> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>> +    CPUClass *cc = CPU_CLASS(mcc);
>> +    CPURISCVState *env = &cpu->env;
>> +
>> +    /* Validate that MISA_MXL is set properly. */
>> +    switch (env->misa_mxl_max) {
>> +#ifdef TARGET_RISCV64
>> +    case MXL_RV64:
>> +    case MXL_RV128:
>> +        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
>> +        break;
>> +#endif
>> +    case MXL_RV32:
>> +        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
>> +        break;
>> +    default:
>> +        g_assert_not_reached();
>> +    }
>> +
>> +    if (env->misa_mxl_max != env->misa_mxl) {
>> +        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
>> +        return;
>> +    }
>> +}
>> +
>> +static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
>> +{
>> +    CPURISCVState *env = &cpu->env;
>> +    int priv_version = -1;
>> +
>> +    if (cpu->cfg.priv_spec) {
>> +        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
>> +            priv_version = PRIV_VERSION_1_12_0;
>> +        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
>> +            priv_version = PRIV_VERSION_1_11_0;
>> +        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
>> +            priv_version = PRIV_VERSION_1_10_0;
>> +        } else {
>> +            error_setg(errp,
>> +                       "Unsupported privilege spec version '%s'",
>> +                       cpu->cfg.priv_spec);
>> +            return;
>> +        }
>> +
>> +        env->priv_ver = priv_version;
>> +    }
>> +}
>> +
>> +/*
>> + * We'll get here via the following path:
>> + *
>> + * riscv_cpu_realize()
>> + *   -> cpu_exec_realizefn()
>> + *      -> tcg_cpu_realizefn() (via accel_cpu_realizefn())
>> + */
>> +static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
>> +{
>> +    RISCVCPU *cpu = RISCV_CPU(cs);
>> +    CPURISCVState *env = &cpu->env;
>> +    Error *local_err = NULL;
>> +
>> +    if (object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
>> +        error_setg(errp, "'host' CPU is not compatible with TCG acceleration");
>> +        return false;
>> +    }
>> +
>> +    riscv_cpu_validate_misa_mxl(cpu, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return false;
>> +    }
>> +
>> +    riscv_cpu_validate_priv_spec(cpu, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return false;
>> +    }
>> +
>> +    riscv_cpu_validate_misa_priv(env, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return false;
>> +    }
>> +
>> +    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
>> +        /*
>> +         * Enhanced PMP should only be available
>> +         * on harts with PMP support
>> +         */
>> +        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
>> +        return false;
>> +    }
>> +
>> +    riscv_cpu_validate_set_extensions(cpu, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return false;
>> +    }
>> +
>> +#ifndef CONFIG_USER_ONLY
>> +    CPU(cs)->tcg_cflags |= CF_PCREL;
>> +
>> +    if (cpu->cfg.ext_sstc) {
>> +        riscv_timer_init(cpu);
>> +    }
>> +
>> +    if (cpu->cfg.pmu_num) {
>> +        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
>> +            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>> +                                          riscv_pmu_timer_cb, cpu);
>> +        }
>> +     }
>> +#endif
>> +
>> +    return true;
>> +}
>> +
>>   static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
>>   {
>>       /*
>> @@ -41,6 +173,7 @@ static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
>>       AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
>>
>>       acc->cpu_class_init = tcg_cpu_class_init;
>> +    acc->cpu_realizefn = tcg_cpu_realizefn;
>>   }
>>
>>   static const TypeInfo tcg_cpu_accel_type_info = {
>> --
>> 2.41.0
>>
>>

