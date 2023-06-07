Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1A1C77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 19:59:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6zJK-00045A-5G; Wed, 07 Jun 2023 15:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6zJJ-00044a-44
 for qemu-riscv@nongnu.org; Wed, 07 Jun 2023 15:59:13 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6zJF-0006lw-0W
 for qemu-riscv@nongnu.org; Wed, 07 Jun 2023 15:59:12 -0400
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-38ede2e0e69so5006987b6e.2
 for <qemu-riscv@nongnu.org>; Wed, 07 Jun 2023 12:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686167947; x=1688759947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mhgmzQt8w0PITpRWMgDJ2rxugHkfaO7sJTwKaiss8GI=;
 b=XvSTqCQm8ReknOxbr/6xYrxXbsTZDD52JXYVouiIml0HG0QJMSN4nm1DHrZ6hwgOFM
 /fQrPcBPri4kiihagB+qeEbyS6ue56WN8QGH0Z3op1t4X0AulXQ/mfDt78iSbT1fn2x6
 W+hUPXuO79c+RiEuoktI3LsVjSKw+RXKz1PfQ329CZ70rcJjp9ZM1NYWSYxcD6K+E3rN
 xcWU0HKJtiw4tpXbEpCATiCvnSDXN4YKJkweZPCHraPiwFXmDNNrtI9QEsZuFSxeuZFL
 xG8kAqVNNMPCQR6MJJ361NZnPhvP3tad7INQpUDelgbeGOIXLdDkvNCRouoH+lAWI6Om
 cNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686167947; x=1688759947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mhgmzQt8w0PITpRWMgDJ2rxugHkfaO7sJTwKaiss8GI=;
 b=HyR03Lz+5JdXFFt04vy0IiMs5jkBB6ppNWDi3LlcMh1DHb5ylv/PDkixBLyLp2PiQ2
 wMeEEV8I5q4oFu+XLxWC0cMLnlEKEyKX0JndTchCwfc1MSne2uvatlvws2VPIzbb6gDR
 Ms74sk00i/DlUmDgH25npyxmn4OGuT90EM0DtgnBpTg4Kn7hfEa59xRYzTTIOD6H/6eN
 o/ahqfUIIsibPmp/JL4EzEhtCAMb+2AQYlvpGn1B75ajM7EwvpiX/9WNiJj02UxNsice
 XLzNWTOK6a4wAst/+Iy2OecLxs7zU5NVmjOTJOCHClH7PAGUL5FmNI4MHkZRB3xLR2jL
 Nqgg==
X-Gm-Message-State: AC+VfDx3p8rbL880AsTeJlqCeS3Rpyau3ZZH1mlC5F+DIe0cpamIuIIS
 UhPF78vF3da2nOsZCvgVruNoRg==
X-Google-Smtp-Source: ACHHUZ4aA5LGk2DB4phbPYPJ/dZRVMhnnmpIz7Cic1fJ6c1ZrCNhgXUg3FKKUJdQ5s5ek61gCpfQfQ==
X-Received: by 2002:aca:2219:0:b0:397:fa01:cd4 with SMTP id
 b25-20020aca2219000000b00397fa010cd4mr3976460oic.34.1686167947457; 
 Wed, 07 Jun 2023 12:59:07 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 v205-20020aca61d6000000b0039aa9c89fe8sm4354235oib.43.2023.06.07.12.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 12:59:07 -0700 (PDT)
Message-ID: <fb74c3a0-9762-92c2-4a1c-9544af822c5a@ventanamicro.com>
Date: Wed, 7 Jun 2023 16:59:02 -0300
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

multi-letter extensions don't have a 'description' field in TCG. Nothing
prevents us from adding for KVM though.

And yes, I'll create a single struct to handle both MISA and multi-letter
extensions. We just need to have different getters/setters for each
category.

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

I believe it's ok to do that for the MISA bits since it's a handful of entries.

But I'd rather deal with a little code duplication for multi-letter extensions
for now. We have 73 multi-letters extensions in TCG. Adding a description for
each one, change how the properties are being created and so on seems too
much for this series.

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

Yep, might as well set the get() callback in the property.


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

