Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40560EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 19:48:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qH8Tv-0004jk-4Y; Wed, 05 Jul 2023 15:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qH8Ts-0004ix-0l
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 15:48:04 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qH8Tn-00052h-Go
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 15:48:03 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1b0138963ffso73223fac.0
 for <qemu-riscv@nongnu.org>; Wed, 05 Jul 2023 12:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688586477; x=1691178477;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QzdbadadIkTLaAZAmscgKDJCeQqOXFtZjJTrbJWpJkk=;
 b=GQXbEgeX+67LZ+qdai2/zaGKq4r0ahqfstDYFe/fOXGSmHc6ugszRKibr89Ngx9SYU
 f4G8RAOx9bqMdYv6tdGL8qto9ZH2LJoOiKuveH40pgVSzIsxg0t8zURnpPgFdCavqxh1
 Q/ZVIKXLog/jXIsCRM0rufBx6IVzygWGU+reXFj6u4AC2uZLfr3/gNwMDX6N5N1V+ajp
 OXQqSJrqT2ht0YiXKmY1GLnXtych0OOcQm/Y9+IqOKpLJ8RtlpvNUUqGsE/UD5PaQF7b
 ZHz2EGP8tNfgMEMGj7hBtqI/8P165cVG+2RFd9kJB5eVbpc5q8eoBSrvMYyVZYEo3UR4
 +oNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688586477; x=1691178477;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QzdbadadIkTLaAZAmscgKDJCeQqOXFtZjJTrbJWpJkk=;
 b=awqmei1sfJSnDtikAjLK+BP+U0DGusAEnniIA9nGmB0rUHueA336EaB2rREYJYiCr/
 PWw3YWlQUQ+d9ml3v6ibHj8iCY3hmh+kHutlshfIG52fDLWHitVKUDwAkj4tpkJZa74y
 K3ds4VIoJzy14SeMjFxvnRJ99NEfTDjbltoTrgsxWXdFRXYxSaOYcfNc4Kbr3/ProUm+
 7czY5lGvICEdJczQiwS1+YTMa1OChCUKHGmZmk3+RQ2/VwU+bh8Zacq2EMH/GXZIZl61
 hkJ9v1fSbp7N/YE8uLxtLNhU8lTaBY+TCaPmZtdKVCpiymykuGPQX8VgbliYwi0hQZ92
 2Qqw==
X-Gm-Message-State: ABy/qLasKg+MMLTd4ryzcHvSohTm0uCNV1yTSNi5KDUd23I5YXXCzqqO
 SnX1CwJeIlT1pCsqOsQVnLZDyQ==
X-Google-Smtp-Source: APBJJlECU8TqeNyJDlkGTqD7HcS2VXMHcFOiSHT4i32d424cwRufwx47t3hHAajBvgR/3n60GH00Wg==
X-Received: by 2002:a05:6871:285:b0:1b0:1b2b:7e0b with SMTP id
 i5-20020a056871028500b001b01b2b7e0bmr19048707oae.30.1688586477371; 
 Wed, 05 Jul 2023 12:47:57 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 gp4-20020a0568701fc400b001aa25cad017sm15611603oac.55.2023.07.05.12.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 12:47:56 -0700 (PDT)
Message-ID: <6f5a778f-776c-fd12-fe8b-cc138a71f986@ventanamicro.com>
Date: Wed, 5 Jul 2023 16:47:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 14/20] target/riscv/kvm.c: add multi-letter extension
 KVM properties
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, philmd@linaro.org
References: <20230630100811.287315-1-dbarboza@ventanamicro.com>
 <20230630100811.287315-15-dbarboza@ventanamicro.com>
 <20230705-091906904fcc54a4ce96e625@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230705-091906904fcc54a4ce96e625@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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



On 7/5/23 10:41, Andrew Jones wrote:
> On Fri, Jun 30, 2023 at 07:08:05AM -0300, Daniel Henrique Barboza wrote:
>> Let's add KVM user properties for the multi-letter extensions that KVM
>> currently supports: zicbom, zicboz, zihintpause, zbb, ssaia, sstc,
>> svinval and svpbmt.
>>
>> As with MISA extensions, we're using the KVMCPUConfig type to hold
>> information about the state of each extension. However, multi-letter
>> extensions have more cases to cover than MISA extensions, so we're
>> adding an extra 'supported' flag as well. This flag will reflect if a
>> given extension is supported by KVM, i.e. KVM knows how to handle it.
>> This is determined during KVM extension discovery in
>> kvm_riscv_init_multiext_cfg(), where we test for EINVAL errors. Any
>> other error different from EINVAL will cause an abort.
>>
>> The use of the 'user_set' is similar to what we already do with MISA
>> extensions: the flag set only if the user is changing the extension
>> state.
>>
>> The 'supported' flag will be used later on to make an exception for
>> users that are disabling multi-letter extensions that are unknown to
>> KVM.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c |   8 +++
>>   target/riscv/kvm.c | 119 +++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 127 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index a9df61c9b4..f348424170 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1778,6 +1778,14 @@ static void riscv_cpu_add_user_properties(Object *obj)
>>       riscv_cpu_add_misa_properties(obj);
>>   
>>       for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
>> +#ifndef CONFIG_USER_ONLY
>> +        if (kvm_enabled()) {
>> +            /* Check if KVM created the property already */
>> +            if (object_property_find(obj, prop->name)) {
>> +                continue;
>> +            }
>> +        }
>> +#endif
>>           qdev_property_add_static(dev, prop);
>>       }
>>   
>> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
>> index 7afd6024e6..6ef81a6825 100644
>> --- a/target/riscv/kvm.c
>> +++ b/target/riscv/kvm.c
>> @@ -113,6 +113,7 @@ typedef struct KVMCPUConfig {
>>       target_ulong offset;
>>       int kvm_reg_id;
>>       bool user_set;
>> +    bool supported;
>>   } KVMCPUConfig;
>>   
>>   #define KVM_MISA_CFG(_bit, _reg_id) \
>> @@ -197,6 +198,81 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
>>       }
>>   }
>>   
>> +#define CPUCFG(_prop) offsetof(struct RISCVCPUConfig, _prop)
>> +
>> +#define KVM_EXT_CFG(_name, _prop, _reg_id) \
>> +    {.name = _name, .offset = CPUCFG(_prop), \
>> +     .kvm_reg_id = _reg_id}
>> +
>> +static KVMCPUConfig kvm_multi_ext_cfgs[] = {
>> +    KVM_EXT_CFG("zicbom", ext_icbom, KVM_RISCV_ISA_EXT_ZICBOM),
>> +    KVM_EXT_CFG("zicboz", ext_icboz, KVM_RISCV_ISA_EXT_ZICBOZ),
>> +    KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINTPAUSE),
>> +    KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
>> +    KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
>> +    KVM_EXT_CFG("sstc", ext_sstc, KVM_RISCV_ISA_EXT_SSTC),
>> +    KVM_EXT_CFG("svinval", ext_svinval, KVM_RISCV_ISA_EXT_SVINVAL),
>> +    KVM_EXT_CFG("svpbmt", ext_svpbmt, KVM_RISCV_ISA_EXT_SVPBMT),
>> +};
>> +
>> +static void kvm_cpu_cfg_set(RISCVCPU *cpu, KVMCPUConfig *multi_ext,
>> +                            uint32_t val)
>> +{
>> +    int cpu_cfg_offset = multi_ext->offset;
>> +    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
>> +
>> +    *ext_enabled = val;
>> +}
>> +
>> +static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
>> +                                KVMCPUConfig *multi_ext)
>> +{
>> +    int cpu_cfg_offset = multi_ext->offset;
>> +    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
>> +
>> +    return *ext_enabled;
>> +}
>> +
>> +static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
>> +                                      const char *name,
>> +                                      void *opaque, Error **errp)
>> +{
>> +    KVMCPUConfig *multi_ext_cfg = opaque;
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
>> @@ -215,6 +291,15 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>>           object_property_set_description(cpu_obj, misa_cfg->name,
>>                                           misa_cfg->description);
>>       }
>> +
>> +    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
>> +        KVMCPUConfig *multi_cfg = &kvm_multi_ext_cfgs[i];
>> +
>> +        object_property_add(cpu_obj, multi_cfg->name, "bool",
>> +                            NULL,
>> +                            kvm_cpu_set_multi_ext_cfg,
>> +                            NULL, multi_cfg);
>> +    }
>>   }
>>   
>>   static int kvm_riscv_get_regs_core(CPUState *cs)
>> @@ -530,6 +615,39 @@ static void kvm_riscv_init_misa_ext_mask(RISCVCPU *cpu,
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
>> +        KVMCPUConfig *multi_ext_cfg = &kvm_multi_ext_cfgs[i];
>> +        struct kvm_one_reg reg;
>> +
>> +        reg.id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
>> +                                  multi_ext_cfg->kvm_reg_id);
>> +        reg.addr = (uint64_t)&val;
>> +        ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
>> +        if (ret != 0) {
> 
> As discussed internally on Slack, since we can't use kvm_vcpu_ioctl() here
> we need to properly check 'if (ret == -1)'
> 
>> +            if (ret == -EINVAL) {
> 
> and here 'if (errno == EINVAL)'. But, also as discussed internally, based
> on our upcoming plans to use ENOENT for missing registers, we should
> change this check to be for ENOENT now. While that may seem premature, I
> think it's OK, because until a KVM which returns ENOENT for missing
> registers exists and is used, QEMU command lines which disable unknown
> registers will be rejected. But, that will also happen even after a KVM
> that returns ENOENT exits if an older KVM is used. In both cases that's
> fine, as rejecting is the more conservative behavior for an error.
> Finally, if the yet-to-be-posted KVM ENOENT patch never gets merged, then
> we may be stuck rejecting forever anyway, since EINVAL is quite generic
> and probably isn't safe to use for this purpose.


I agree. I'll re-send v8 right away with the 'errno' fix and changing the
check to use ENOENT instead of EINVAL.

Even if we don't manage to change KVM to use ENOENT in these situations (reg
does not exist/extension does not exist), the assumption made here does not
hold water anyway because EINVAL is being thrown for all sort of errors, so
might as well error out.

So changing for ENOENT is good if we manage to change KVM, and if we fail to
change it it we'll end up erroring out on all errors, which is saner than
having to take a guess on what EINVAL means.



Thanks,

Daniel


> 
> Thanks,
> drew
> 
> 
>> +                /* Silently default to 'false' if KVM does not support it. */
>> +                multi_ext_cfg->supported = false;
>> +                val = false;
>> +            } else {
>> +                error_report("Unable to read ISA_EXT KVM register %s, "
>> +                             "error %d", multi_ext_cfg->name, ret);
>> +                kvm_riscv_destroy_scratch_vcpu(kvmcpu);
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
>> @@ -542,6 +660,7 @@ void kvm_riscv_init_user_properties(Object *cpu_obj)
>>       kvm_riscv_add_cpu_user_properties(cpu_obj);
>>       kvm_riscv_init_machine_ids(cpu, &kvmcpu);
>>       kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
>> +    kvm_riscv_init_multiext_cfg(cpu, &kvmcpu);
>>   
>>       kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
>>   }
>> -- 
>> 2.41.0
>>

