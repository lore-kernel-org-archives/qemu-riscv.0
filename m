Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2188C7EE43
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 19:24:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8n9Y-0008KS-0R; Mon, 12 Jun 2023 15:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q8n9X-0008K7-97
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 15:24:35 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q8n9T-0003wb-66
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 15:24:35 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-19a427d7b57so2393342fac.2
 for <qemu-riscv@nongnu.org>; Mon, 12 Jun 2023 12:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686597858; x=1689189858;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mtxzXrH3Pc/VkJOoK3n7+8YcQLMH9TI4Stm6s5e7O7w=;
 b=AkZJfgiy19xhCN6oX/4BKjZWWWkHVeTBxVCgIXXSoYhvFeWAl8EJkrb/KpmvaEj6ca
 yTiCe8VT7J6K+huTqPWpyxdTj4j8O/IfFxQIVicm1SbNbpOQ59OAs1OTKqYabhpU0dHg
 XWzurxAotCuUVjLHBrkDQqZF6zHIatgr+C0glSx7JyIOzADfiuX5ZIOGgkmWIZjywJkW
 x6jJ8kA5RT9+ksr/cigQV1kFt49h07B6fk3QEhXIZmi2rajX+zOHv7yH2vCfGKJYbzG+
 VlrVQAVSB1IagApatVvo6fOHkNlNu2LGgPrsdr4H7wGKE/3Si89Nl73Wd8I21AV7Wy0Y
 eLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686597858; x=1689189858;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mtxzXrH3Pc/VkJOoK3n7+8YcQLMH9TI4Stm6s5e7O7w=;
 b=kmZNLmdHOEPfb1AnmphRCbBBSLfMp0CcExpg4k3K1Qhc2+PxD4sQKNlDOCBVVhYBnS
 Dhu1l7u1u0wJYQcCzGtCpIRmng9mWhMEH6Jur6yr/Y154lmmUO+X901tI3mgWPpoFm6p
 RVzZleQbSNt5a48GKGYwIDPR9G54edad2Jy0rqqjmLpQaJW5VsOdjh2w17Isd/yGMf9f
 krNvrSYIgMRIgTHTweyXX/TukiAlyzcao++5yi+o7aum+0q7oCLi7CW9wC6NJIqC46ZJ
 /KPUXlaIOl0b0J2s9wjlX/CBBIl6Xzvh6JjKYJJsz/hK2wD2L9FCqv5ScVtWY9wNvR19
 t98g==
X-Gm-Message-State: AC+VfDxQqXisdpsX3hVUaHafLnw2CozOrrtgMg8X+7fttIiGTZFiAwBp
 /WLwF8mDpTB3mnaiyHrQbgll3A==
X-Google-Smtp-Source: ACHHUZ6LtMhOJYRrtA/e2tVTSO8XK0XFuOwbdlT6Ja0WqzwMQKBDtDzaz3kCrSe3ZZThYn2n/X2cOQ==
X-Received: by 2002:a05:6870:e493:b0:19e:eca6:7e20 with SMTP id
 v19-20020a056870e49300b0019eeca67e20mr6892400oag.45.1686597858137; 
 Mon, 12 Jun 2023 12:24:18 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a4ae0ce000000b0055afd810b50sm3435887oot.44.2023.06.12.12.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 12:24:17 -0700 (PDT)
Message-ID: <ff3e57bb-ec46-aca4-b941-fdd4993a4d45@ventanamicro.com>
Date: Mon, 12 Jun 2023 16:24:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 13/16] target/riscv/kvm.c: add multi-letter extension KVM
 properties
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-14-dbarboza@ventanamicro.com>
 <20230607-9a499522ac7de9ebcf0c8699@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230607-9a499522ac7de9ebcf0c8699@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
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



On 6/7/23 08:48, Andrew Jones wrote:
> On Tue, May 30, 2023 at 04:46:20PM -0300, Daniel Henrique Barboza wrote:
>> Let's add KVM user properties for the multi-letter extensions that KVM
>> currently supports: zicbom, zicboz, zihintpause, zbb, ssaia, sstc,
>> svinval and svpbmt.
>>
>> As with the recently added MISA properties we're also going to add a
>> 'user_set' flag in each of them. The flag will be set only if the user
>> chose an option that's different from the host and will require extra
>> handling from the KVM driver.
>>
>> However, multi-letter CPUs have more cases to cover than MISA
>> extensions, so we're adding an extra 'supported' flag as well. This flag
>> will reflect if a given extension is supported by KVM, i.e. KVM knows
>> how to handle it. This is determined during KVM extension discovery in
>> kvm_riscv_init_multiext_cfg(), where we test for EINVAL errors. Any
>> other error different from EINVAL will cause an abort.
> 
> I wish that was ENOENT, but I suppose that ship sailed.
> 
>>
>> The 'supported' flag will then be used later on to give an exception for
>> users that are disabling multi-letter extensions that are unknown to
>> KVM.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/kvm.c | 136 +++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 136 insertions(+)
>>
>> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
>> index bb1dafe263..b4193a10d8 100644
>> --- a/target/riscv/kvm.c
>> +++ b/target/riscv/kvm.c
>> @@ -202,6 +202,99 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
>>       }
>>   }
>>   
>> +typedef struct RISCVCPUMultiExtConfig {
>> +    const char *name;
> 
> No description? I'd prefer we use the same cfg struct for single-letter
> and multi-letter extensions. We can use a union to overlap cpu_cfg_offset
> and misa_bit.
> 
>> +    int kvm_reg_id;
>> +    int cpu_cfg_offset;
>> +    bool supported;
>> +    bool user_set;
>> +} RISCVCPUMultiExtConfig;
>> +
>> +#define CPUCFG(_prop) offsetof(struct RISCVCPUConfig, _prop)
>> +
>> +/*
>> + * KVM ISA Multi-letter extensions. We care about the order
>> + * since it'll be used to create the ISA string later on.
>> + * We follow the same ordering rules of isa_edata_arr[]
>> + * from target/riscv/cpu.c.
>> + */
>> +static RISCVCPUMultiExtConfig kvm_multi_ext_cfgs[] = {
>> +    {.name = "zicbom", .kvm_reg_id = KVM_RISCV_ISA_EXT_ZICBOM,
>> +     .cpu_cfg_offset = CPUCFG(ext_icbom)},
>> +    {.name = "zicboz", .kvm_reg_id = KVM_RISCV_ISA_EXT_ZICBOZ,
>> +     .cpu_cfg_offset = CPUCFG(ext_icboz)},
>> +    {.name = "zihintpause", .kvm_reg_id = KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>> +     .cpu_cfg_offset = CPUCFG(ext_zihintpause)},
>> +    {.name = "zbb", .kvm_reg_id = KVM_RISCV_ISA_EXT_ZBB,
>> +     .cpu_cfg_offset = CPUCFG(ext_zbb)},
>> +    {.name = "ssaia", .kvm_reg_id = KVM_RISCV_ISA_EXT_SSAIA,
>> +     .cpu_cfg_offset = CPUCFG(ext_ssaia)},
>> +    {.name = "sstc", .kvm_reg_id = KVM_RISCV_ISA_EXT_SSTC,
>> +     .cpu_cfg_offset = CPUCFG(ext_sstc)},
>> +    {.name = "svinval", .kvm_reg_id = KVM_RISCV_ISA_EXT_SVINVAL,
>> +     .cpu_cfg_offset = CPUCFG(ext_svinval)},
>> +    {.name = "svpbmt", .kvm_reg_id = KVM_RISCV_ISA_EXT_SVPBMT,
>> +     .cpu_cfg_offset = CPUCFG(ext_svpbmt)},
> 
> As pointed out in the last patch, it'd be nice to share names (and
> descriptions) with TCG.
> 
>> +};
>> +
>> +static void kvm_cpu_cfg_set(RISCVCPU *cpu, RISCVCPUMultiExtConfig *multi_ext,
>> +                            uint32_t val)
>> +{
>> +    int cpu_cfg_offset = multi_ext->cpu_cfg_offset;
>> +    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
>> +
>> +    *ext_enabled = val;
>> +}
>> +
>> +static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
>> +                                RISCVCPUMultiExtConfig *multi_ext)
>> +{
>> +    int cpu_cfg_offset = multi_ext->cpu_cfg_offset;
>> +    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
>> +
>> +    return *ext_enabled;
>> +}
>> +
>> +static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
>> +                                      const char *name,
>> +                                      void *opaque, Error **errp)
>> +{
>> +    RISCVCPUMultiExtConfig *multi_ext_cfg = opaque;
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>> +    bool value, host_val;
>> +
>> +    if (!visit_type_bool(v, name, &value, errp)) {
>> +        return;
>> +    }
>> +
>> +    host_val = kvm_cpu_cfg_get(cpu, multi_ext_cfg);
>> +
>> +    /*
>> +     * Ignore if the user is setting the same value
>> +     * as the host.
>> +     */
>> +    if (value == host_val) {
>> +        return;
>> +    }
>> +
>> +    if (!multi_ext_cfg->supported) {
>> +        /*
>> +         * Error out if the user is trying to enable an
>> +         * extension that KVM doesn't support. Ignore
>> +         * option otherwise.
>> +         */
>> +        if (value) {
>> +            error_setg(errp, "KVM does not support disabling extension %s",
>> +                       multi_ext_cfg->name);
>> +        }
>> +
>> +        return;
>> +    }
>> +
>> +    multi_ext_cfg->user_set = true;
>> +    kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
>> +}
>> +
>>   static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>>   {
>>       int i;
>> @@ -216,6 +309,15 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>>           object_property_set_description(cpu_obj, misa_cfg->name,
>>                                           misa_cfg->description);
>>       }
>> +
>> +    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
>> +        RISCVCPUMultiExtConfig *multi_cfg = &kvm_multi_ext_cfgs[i];
>> +
>> +        object_property_add(cpu_obj, multi_cfg->name, "bool",
>> +                            NULL,
> 
> You have a getter function, so we might as well set it here, no?

I was going back to do this change then realized that we don't have a get() for
this case. We have kvm_cpu_cfg_get(), which is a way of retrieving the value of
cpu->cfg.<attr>. It's not the same as a get() impl for object_property_add().


Thanks,


Daniel



> 
>> +                            kvm_cpu_set_multi_ext_cfg,
>> +                            NULL, multi_cfg);
>> +    }
>>   }
>>   
>>   static int kvm_riscv_get_regs_core(CPUState *cs)
>> @@ -531,6 +633,39 @@ static void kvm_riscv_init_misa_ext_mask(RISCVCPU *cpu,
>>       env->misa_ext = env->misa_ext_mask;
>>   }
>>   
>> +static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>> +{
>> +    CPURISCVState *env = &cpu->env;
>> +    uint64_t val;
>> +    int i, ret;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
>> +        RISCVCPUMultiExtConfig *multi_ext_cfg = &kvm_multi_ext_cfgs[i];
>> +        struct kvm_one_reg reg;
>> +
>> +        reg.id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
>> +                                  multi_ext_cfg->kvm_reg_id);
>> +        reg.addr = (uint64_t)&val;
>> +        ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
>> +        if (ret != 0) {
>> +            if (ret == -EINVAL) {
>> +                /* Silently default to 'false' if KVM does not support it. */
>> +                multi_ext_cfg->supported = false;
>> +                val = false;
>> +            } else {
>> +                error_report("Unable to read ISA_EXT KVM register %s, "
>> +                             "error %d", multi_ext_cfg->name, ret);
>> +                kvm_riscv_destroy_scratch_vcpu(kvmcpu);
> 
> I don't think we usually bother cleaning up when exiting, we just let exit
> do it, but OK.
> 
>> +                exit(EXIT_FAILURE);
>> +            }
>> +        } else {
>> +            multi_ext_cfg->supported = true;
>> +        }
>> +
>> +        kvm_cpu_cfg_set(cpu, multi_ext_cfg, val);
>> +    }
>> +}
>> +
>>   void kvm_riscv_init_user_properties(Object *cpu_obj)
>>   {
>>       RISCVCPU *cpu = RISCV_CPU(cpu_obj);
>> @@ -543,6 +678,7 @@ void kvm_riscv_init_user_properties(Object *cpu_obj)
>>       kvm_riscv_add_cpu_user_properties(cpu_obj);
>>       kvm_riscv_init_machine_ids(cpu, &kvmcpu);
>>       kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
>> +    kvm_riscv_init_multiext_cfg(cpu, &kvmcpu);
>>   
>>       kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
>>   }
>> -- 
>> 2.40.1
>>
>>
> 
> Thanks,
> drew

