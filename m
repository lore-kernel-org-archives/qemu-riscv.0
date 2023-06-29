Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A84EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 11:50:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEqAk-0007Iq-1Z; Thu, 29 Jun 2023 07:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEqAh-0007IN-C3
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 07:50:47 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEqAe-0000UW-3a
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 07:50:46 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6b2e1023f30so514055a34.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 04:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688039442; x=1690631442;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=weDTkMav7+3PiDuAlGRavKzdLh6C+OSfUaSA0DB2My0=;
 b=LicaFnuY6pWYfDh+81ZPaXRL55sSzxzIUSNg4S1DhvfnxI8zWDfv5iGQLc8ATUscyV
 EucqDl4uioCttjggq5s6dJtbHPE98KfWBichl/1rTteA6Ug2cd1/VG0TGua9SUjS/AV0
 WHoEO4DoI7Cyl9/Xc0FN13HgNJNsEX9xbP+7BxDZ6XcFRKKgNY/SeHYxmSdQcDtoTh2Q
 ZFKCkxPozzsrIJ0eguN017yRFd94aVBKlZJkAW8cAOtrePcb2rNtydVckDzvdykcaYZf
 vONvSD+/AgLY1J4wOdO9E/V+tgUWzLGxan4xfuroEmUNcRPMxrgYBPzuXLkssqBohmnh
 6K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688039442; x=1690631442;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=weDTkMav7+3PiDuAlGRavKzdLh6C+OSfUaSA0DB2My0=;
 b=h8tosrz/2CGXwMpkiDDRu7hfHNbOVsgGK/e3qpqf2xpMqdjJZ/J/TyxWRE3j2bgvEm
 0tB9zHhWWQrPFJWUnF9d2+xe9aOTPTTV8phfA9Cw3EmcoYPAw09l9mU2qjP6m5gUs5mz
 IjAwjCDAvBKtP/bqfIll36AwHyvXqTUThlqGlpaLzdbdQfcyFjuM7NopgVn2F5JK/64E
 +q2tQtB4iyRPijz+wt2Hd6UmKrDb2XPhTAINBa1+XuKjB5ICzDXGjAziaSbm848+DWXD
 ijHaf3CWd5yTudUwpxpVfecVDJWozhfUBTURyJQiCpRTjRAXFKJ0BERT7LXVm3XQB6ir
 PSPw==
X-Gm-Message-State: AC+VfDwSzzHkmAcz3zUUA+CjuTnDoIf7NZL/GrXaBSG/6oV/w8cgYGxI
 HyxT/oUYbhSur0BJNbgj4FRpIQ==
X-Google-Smtp-Source: ACHHUZ7qluPgbFhEOdZqMtyAjLoHv4nSK3OctqDELaZyS1eSOt6g6sO/9JY8ZQlQEfSEJxEHbOJDaA==
X-Received: by 2002:a9d:7cd5:0:b0:6b8:81a3:9060 with SMTP id
 r21-20020a9d7cd5000000b006b881a39060mr3560194otn.6.1688039442514; 
 Thu, 29 Jun 2023 04:50:42 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59?
 ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a9d7b51000000b006b89596bc61sm118508oto.61.2023.06.29.04.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 04:50:41 -0700 (PDT)
Message-ID: <6f9e1d11-bb34-d8b7-dc83-588064adabf6@ventanamicro.com>
Date: Thu, 29 Jun 2023 08:50:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 12/20] target/riscv: add KVM specific MISA properties
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, philmd@linaro.org
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
 <20230628213033.170315-13-dbarboza@ventanamicro.com>
 <20230629-549d312bafe3d5b913ca2048@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230629-549d312bafe3d5b913ca2048@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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



On 6/29/23 06:12, Andrew Jones wrote:
> On Wed, Jun 28, 2023 at 06:30:25PM -0300, Daniel Henrique Barboza wrote:
>> Using all TCG user properties in KVM is tricky. First because KVM
>> supports only a small subset of what TCG provides, so most of the
>> cpu->cfg flags do nothing for KVM.
>>
>> Second, and more important, we don't have a way of telling if any given
>> value is an user input or not. For TCG this has a small impact since we
>> just validating everything and error out if needed. But for KVM it would
>> be good to know if a given value was set by the user or if it's a value
>> already provided by KVM. Otherwise we don't know how to handle failed
>> kvm_set_one_regs() when writing the configurations back.
>>
>> These characteristics make it overly complicated to use the same user
>> facing flags for both KVM and TCG. A simpler approach is to create KVM
>> specific properties that have specialized logic, forking KVM and TCG use
>> cases for those cases only. Fully separating KVM/TCG properties is
>> unneeded at this point - in fact we want the user experience to be as
>> equal as possible, regardless of the acceleration chosen.
>>
>> We'll start this fork with the MISA properties, adding the MISA bits
>> that the KVM driver currently supports. A new KVMCPUConfig type is
>> introduced. It'll hold general information about an extension. For MISA
>> extensions we're going to use the newly created getters of
>> misa_ext_infos[] to populate their name and description. 'offset' holds
>> the MISA bit (RVA, RVC, ...). We're calling it 'offset' instead of
>> 'misa_bit' because this same KVMCPUConfig struct will be used to
>> multi-letter extensions later on.
>>
>> This new type also holds a 'user_set' flag. This flag will be set when
>> the user set an option that's different than what is already configured
>> in the host, requiring KVM intervention to write the regs back during
>> kvm_arch_init_vcpu(). Similar mechanics will be implemented for
>> multi-letter extensions as well.
>>
>> There is no need to duplicate more code than necessary, so we're going
>> to use the existing kvm_riscv_init_user_properties() to add the KVM
>> specific properties. Any code that is adding a TCG user prop is then
>> changed slightly to verify first if there's a KVM prop with the same
>> name already added.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 13 +++++---
>>   target/riscv/kvm.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 87 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 90dd2078ae..f4b1868466 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1617,14 +1617,19 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>>   
>>       for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
>>           RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
>> +        Error *local_err = NULL;
>>   
>>           misa_cfg->name = riscv_get_misa_ext_name(misa_cfg->misa_bit);
>>           misa_cfg->description = riscv_get_misa_ext_descr(misa_cfg->misa_bit);
>>   
>> -        object_property_add(cpu_obj, misa_cfg->name, "bool",
>> -                            cpu_get_misa_ext_cfg,
>> -                            cpu_set_misa_ext_cfg,
>> -                            NULL, (void *)misa_cfg);
>> +        object_property_try_add(cpu_obj, misa_cfg->name, "bool",
>> +                                cpu_get_misa_ext_cfg, cpu_set_misa_ext_cfg,
>> +                                NULL, (void *)misa_cfg, &local_err);
>> +        if (local_err) {
>> +            /* Someone (KVM) already created the property */
>> +            continue;
>> +        }
> 
> This assumes object_property_try_add() only fails when it detects
> duplicate properties. That's currently true, but it's not documented,
> so I'm not sure we should count on it. Also, if we do want to assume
> only duplicate properties generate errors, then we can pass NULL for
> errp and just check the return value of the call, as it'll be NULL on
> failure.

At this moment only a duplicate property returns NULL, so this works. But then, if this
function changes in the future and more conditions return NULL, we might not be sure if
we should ignore the NULL return instead of erroring out.

If we want to be on the safe side I believe we should give up this idea and go back to
what it was before. We'll safely ignore if there's a duplicate because we'll test for
it, and then object_property_add() can error_fatal in any other error.

Thanks,

Daniel

> 
>> +
>>           object_property_set_description(cpu_obj, misa_cfg->name,
>>                                           misa_cfg->description);
>>           object_property_set_bool(cpu_obj, misa_cfg->name,
>> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
>> index 4d0808cb9a..0fb63cced3 100644
>> --- a/target/riscv/kvm.c
>> +++ b/target/riscv/kvm.c
>> @@ -22,8 +22,10 @@
>>   #include <linux/kvm.h>
>>   
>>   #include "qemu/timer.h"
>> +#include "qapi/error.h"
>>   #include "qemu/error-report.h"
>>   #include "qemu/main-loop.h"
>> +#include "qapi/visitor.h"
>>   #include "sysemu/sysemu.h"
>>   #include "sysemu/kvm.h"
>>   #include "sysemu/kvm_int.h"
>> @@ -105,6 +107,81 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
>>           } \
>>       } while (0)
>>   
>> +typedef struct KVMCPUConfig {
>> +    const char *name;
>> +    const char *description;
>> +    target_ulong offset;
>> +    int kvm_reg_id;
>> +    bool user_set;
>> +} KVMCPUConfig;
>> +
>> +#define KVM_MISA_CFG(_bit, _reg_id) \
>> +    {.offset = _bit, .kvm_reg_id = _reg_id}
>> +
>> +/* KVM ISA extensions */
>> +static KVMCPUConfig kvm_misa_ext_cfgs[] = {
>> +    KVM_MISA_CFG(RVA, KVM_RISCV_ISA_EXT_A),
>> +    KVM_MISA_CFG(RVC, KVM_RISCV_ISA_EXT_C),
>> +    KVM_MISA_CFG(RVD, KVM_RISCV_ISA_EXT_D),
>> +    KVM_MISA_CFG(RVF, KVM_RISCV_ISA_EXT_F),
>> +    KVM_MISA_CFG(RVH, KVM_RISCV_ISA_EXT_H),
>> +    KVM_MISA_CFG(RVI, KVM_RISCV_ISA_EXT_I),
>> +    KVM_MISA_CFG(RVM, KVM_RISCV_ISA_EXT_M),
>> +};
>> +
>> +static void kvm_cpu_set_misa_ext_cfg(Object *obj, Visitor *v,
>> +                                     const char *name,
>> +                                     void *opaque, Error **errp)
>> +{
>> +    KVMCPUConfig *misa_ext_cfg = opaque;
>> +    target_ulong misa_bit = misa_ext_cfg->offset;
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>> +    CPURISCVState *env = &cpu->env;
>> +    bool value, host_bit;
>> +
>> +    if (!visit_type_bool(v, name, &value, errp)) {
>> +        return;
>> +    }
>> +
>> +    host_bit = env->misa_ext_mask & misa_bit;
>> +
>> +    if (value == host_bit) {
>> +        return;
>> +    }
>> +
>> +    if (!value) {
>> +        misa_ext_cfg->user_set = true;
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Forbid users to enable extensions that aren't
>> +     * available in the hart.
>> +     */
>> +    error_setg(errp, "Enabling MISA bit '%s' is not allowed: it's not "
>> +               "enabled in the host", misa_ext_cfg->name);
>> +}
>> +
>> +static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(kvm_misa_ext_cfgs); i++) {
>> +        KVMCPUConfig *misa_cfg = &kvm_misa_ext_cfgs[i];
>> +        int bit = misa_cfg->offset;
>> +
>> +        misa_cfg->name = riscv_get_misa_ext_name(bit);
>> +        misa_cfg->description = riscv_get_misa_ext_descr(bit);
>> +
>> +        object_property_add(cpu_obj, misa_cfg->name, "bool",
>> +                            NULL,
>> +                            kvm_cpu_set_misa_ext_cfg,
>> +                            NULL, misa_cfg);
>> +        object_property_set_description(cpu_obj, misa_cfg->name,
>> +                                        misa_cfg->description);
>> +    }
>> +}
>> +
>>   static int kvm_riscv_get_regs_core(CPUState *cs)
>>   {
>>       int ret = 0;
>> @@ -427,6 +504,7 @@ void kvm_riscv_init_user_properties(Object *cpu_obj)
>>           return;
>>       }
>>   
>> +    kvm_riscv_add_cpu_user_properties(cpu_obj);
>>       kvm_riscv_init_machine_ids(cpu, &kvmcpu);
>>       kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
>>   
>> -- 
>> 2.41.0
>>
> 
> Thanks,
> drew

