Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8770C47074
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 12:30:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rKdud-0002UD-54; Tue, 02 Jan 2024 07:30:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rKduW-0002TM-PX
 for qemu-riscv@nongnu.org; Tue, 02 Jan 2024 07:30:22 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rKdu9-0005nx-7v
 for qemu-riscv@nongnu.org; Tue, 02 Jan 2024 07:30:20 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d44200b976so29064925ad.2
 for <qemu-riscv@nongnu.org>; Tue, 02 Jan 2024 04:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704198595; x=1704803395; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Augk+xPGGFqEgjYC1IaucYVe0K+Hl4t3eULPoLhAk20=;
 b=lTPt9y07aR/otrAP8pObnFXgwa2zwNGmH4oQlT01c4ibgnQAyFE3C6GvktTyO5tuZa
 Z3TWV/FE4XKyKI6vI6ljAfIdnd7SiaRMmcA5xDAsWzH+PXQURZFUPnZWbSrYjJb01Zor
 KRbmP+DgQKA0CcNOUt/hDUAyXghRbyUDRzQA5RcQnhPX65ftgiaT/5HESVlRrtV3jqGy
 8f6Is3JLPu8IkkRrep4FMBi0zA70fQ5jpZKNt7iLage1mM9aGNd7JVS+an/G/F6bAVyt
 pcHzemOFGZmXVhYlDwOPpbgAN2qpxMaZeXd7pkam1bP0juGEGejhyQx3xTGgOT8RDdEr
 xLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704198595; x=1704803395;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Augk+xPGGFqEgjYC1IaucYVe0K+Hl4t3eULPoLhAk20=;
 b=GJXObvUWgPn7OxL9p4MxvOCnKAyc0DmhC/7c89tAEChs6gDU1/gTrX3fK36Z3dBfrw
 ACP/d1cJMljKQj0w32kqZwSv37gTQCHbSZb2ZhR13FTuKqn4Q5xL24Sz7B+OYzxm1VN4
 44kLM3iPModHdJ7SVGoaWvYOfABgPOkyyn6yXcc0sq8xocmZBLG+OTlbID/gbduKhgpe
 sEdYw/8KAXzaqMAkVASSMscN8Jg773i4zrfC40f7w9zgFyDKHdwTQGF5LrLRq/pNVSXp
 ixjIFu/k9UHHN2fEQihqC8dHJexF7GWVMsl5cseDUpVrC4CAQDcvzg39pdJi+gdS5iiU
 2Z+g==
X-Gm-Message-State: AOJu0Yzz9GlMsnRaadDHVXLigHVCNr0U8WFejbFTrZAsssQ1vH0RZCX5
 lSFs7mZMqBnvBfxqxx+6GhiVIIT2JMh19g==
X-Google-Smtp-Source: AGHT+IHS3iOa66IYtgf5mfAZCZ07dT1eHIB6zQxVe89gAoGWeHV2UUPXNhTMpzv3HoP9IPA8LQ5MYQ==
X-Received: by 2002:a17:903:2450:b0:1d4:ab6b:f102 with SMTP id
 l16-20020a170903245000b001d4ab6bf102mr1281083pls.85.1704198595524; 
 Tue, 02 Jan 2024 04:29:55 -0800 (PST)
Received: from [192.168.68.110] ([189.79.21.107])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a17090270c700b001d49608e3dfsm8560466plt.50.2024.01.02.04.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jan 2024 04:29:55 -0800 (PST)
Message-ID: <b2a9b35d-e1dc-4d01-b42c-a2eb865f274e@ventanamicro.com>
Date: Tue, 2 Jan 2024 09:29:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] target/riscv: create finalize_features() for KVM
Content-Language: en-US
To: Vladimir Isaev <vladimir.isaev@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20231222122235.545235-1-dbarboza@ventanamicro.com>
 <20231222122235.545235-11-dbarboza@ventanamicro.com>
 <1905a7c9-b59f-4392-9a27-74c292668856@syntacore.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <1905a7c9-b59f-4392-9a27-74c292668856@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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



On 12/29/23 08:22, Vladimir Isaev wrote:
> 22.12.2023 15:22, Daniel Henrique Barboza wrote:
>> To turn cbom_blocksize and cboz_blocksize into class properties we need
>> KVM specific changes.
>>
>> KVM is creating its own version of these options with a customized
>> setter() that prevents users from picking an invalid value during init()
>> time. This comes at the cost of duplicating each option that KVM
>> supports. This will keep happening for each new shared option KVM
>> implements in the future.
>>
>> We can avoid that by using the same property TCG uses and adding
>> specific KVM handling during finalize() time, like TCG already does with
>> riscv_tcg_cpu_finalize_features(). To do that, the common CPU property
>> offers a way of knowing if an option was user set or not, sparing us
>> from doing unneeded syscalls.
>>
>> riscv_kvm_cpu_finalize_features() is then created using the same
>> KVMScratch CPU we already use during init() time, since finalize() time
>> is still too early to use the official KVM CPU for it. cbom_blocksize
>> and cboz_blocksize are then handled during finalize() in the same way
>> they're handled by their KVM specific setter.
>>
>> With this change we can proceed with the blocksize changes in the common
>> code without breaking the KVM driver.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c           | 16 +++++++---
>>   target/riscv/cpu.h           |  1 +
>>   target/riscv/kvm/kvm-cpu.c   | 59 ++++++++++++++++++++++++++++++++++++
>>   target/riscv/kvm/kvm_riscv.h |  1 +
>>   4 files changed, 72 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 8be619b6f1..f49d31d753 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -63,6 +63,11 @@ static void cpu_option_add_user_setting(const char *optname, uint32_t value)
>>                           GUINT_TO_POINTER(value));
>>   }
>>
>> +bool riscv_cpu_option_set(const char *optname)
>> +{
>> +    return g_hash_table_contains(general_user_opts, optname);
>> +}
>> +
> 
> This function may work in unexpected way for future developer since we can check just somehow restricted
> number of options using it, like vlen/elen/cbom/cboz size, but not vext_spec or pmu-num/mask.

Makes sense. I'll add all options in this hash to make it consistent.


Thanks,


Daniel

> 
>>   #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
>>       {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
>>
>> @@ -1056,17 +1061,18 @@ void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
>>   {
>>       Error *local_err = NULL;
>>
>> -    /*
>> -     * KVM accel does not have a specialized finalize()
>> -     * callback because its extensions are validated
>> -     * in the get()/set() callbacks of each property.
>> -     */
>>       if (tcg_enabled()) {
>>           riscv_tcg_cpu_finalize_features(cpu, &local_err);
>>           if (local_err != NULL) {
>>               error_propagate(errp, local_err);
>>               return;
>>           }
>> +    } else if (kvm_enabled()) {
>> +        riscv_kvm_cpu_finalize_features(cpu, &local_err);
>> +        if (local_err != NULL) {
>> +            error_propagate(errp, local_err);
>> +            return;
>> +        }
>>       }
>>
>>   #ifndef CONFIG_USER_ONLY
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 53101b82c5..988471c7ba 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -495,6 +495,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>                           bool probe, uintptr_t retaddr);
>>   char *riscv_isa_string(RISCVCPU *cpu);
>>   void riscv_cpu_list(void);
>> +bool riscv_cpu_option_set(const char *optname);
>>
>>   #define cpu_list riscv_cpu_list
>>   #define cpu_mmu_index riscv_cpu_mmu_index
>> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
>> index 62a1e51f0a..70fb075846 100644
>> --- a/target/riscv/kvm/kvm-cpu.c
>> +++ b/target/riscv/kvm/kvm-cpu.c
>> @@ -1490,6 +1490,65 @@ static void kvm_cpu_instance_init(CPUState *cs)
>>       }
>>   }
>>
>> +void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
>> +{
>> +    CPURISCVState *env = &cpu->env;
>> +    KVMScratchCPU kvmcpu;
>> +    struct kvm_one_reg reg;
>> +    uint64_t val;
>> +    int ret;
>> +
>> +    /* short-circuit without spinning the scratch CPU */
>> +    if (!cpu->cfg.ext_zicbom && !cpu->cfg.ext_zicboz) {
>> +        return;
>> +    }
>> +
>> +    if (!kvm_riscv_create_scratch_vcpu(&kvmcpu)) {
>> +        error_setg(errp, "Unable to create scratch KVM cpu");
>> +        return;
>> +    }
>> +
>> +    if (cpu->cfg.ext_zicbom &&
>> +        riscv_cpu_option_set(kvm_cbom_blocksize.name)) {
>> +
>> +        reg.id = kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CONFIG,
>> +                                        kvm_cbom_blocksize.kvm_reg_id);
>> +        reg.addr = (uint64_t)&val;
>> +        ret = ioctl(kvmcpu.cpufd, KVM_GET_ONE_REG, &reg);
>> +        if (ret != 0) {
>> +            error_setg(errp, "Unable to read cbom_blocksize, error %d", errno);
>> +            return;
>> +        }
>> +
>> +        if (cpu->cfg.cbom_blocksize != val) {
>> +            error_setg(errp, "Unable to set cbom_blocksize to a different "
>> +                       "value than the host (%lu)", val);
>> +            return;
>> +        }
>> +    }
>> +
>> +    if (cpu->cfg.ext_zicboz &&
>> +        riscv_cpu_option_set(kvm_cboz_blocksize.name)) {
>> +
>> +        reg.id = kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CONFIG,
>> +                                        kvm_cboz_blocksize.kvm_reg_id);
>> +        reg.addr = (uint64_t)&val;
>> +        ret = ioctl(kvmcpu.cpufd, KVM_GET_ONE_REG, &reg);
>> +        if (ret != 0) {
>> +            error_setg(errp, "Unable to read cbom_blocksize, error %d", errno);
>> +            return;
>> +        }
>> +
>> +        if (cpu->cfg.cboz_blocksize != val) {
>> +            error_setg(errp, "Unable to set cboz_blocksize to a different "
>> +                       "value than the host (%lu)", val);
>> +            return;
>> +        }
>> +    }
>> +
>> +    kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
>> +}
>> +
>>   static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
>>   {
>>       AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
>> diff --git a/target/riscv/kvm/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
>> index 8329cfab82..4bd98fddc7 100644
>> --- a/target/riscv/kvm/kvm_riscv.h
>> +++ b/target/riscv/kvm/kvm_riscv.h
>> @@ -27,5 +27,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>>                             uint64_t guest_num);
>>   void riscv_kvm_aplic_request(void *opaque, int irq, int level);
>>   int kvm_riscv_sync_mpstate_to_kvm(RISCVCPU *cpu, int state);
>> +void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
>>
>>   #endif
>> --
>> 2.43.0
>>
>>

