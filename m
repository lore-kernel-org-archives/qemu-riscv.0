Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACA1C83F33
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 14:22:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qdASh-0003Ta-BJ; Mon, 04 Sep 2023 10:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdASf-0003SU-Ba
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 10:21:53 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdASc-0004wD-Jd
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 10:21:53 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6beff322a97so1197647a34.3
 for <qemu-riscv@nongnu.org>; Mon, 04 Sep 2023 07:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693837309; x=1694442109; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tSfdmgKzdx03PG8Cg2VNfjcO1w1vRh0EO/TOV/LuIxU=;
 b=Ptp6kEYx3mJAMzB1J8AgCDFq0K3VU1HPEwETA77oasoWwh7As8GYsSmMhgKQM3JesV
 XizYunaaDG7+tVEDBQk5Fk9ZvCW+q0gh3n8cJGIzMKf4mjX+/hyFm7d+QqI9vOkKX1ao
 A2heeOauKXjzN5e31tWAmaK5+i9kYiHnlUuqQhbUXNL8KOkZUfryoyHBjgZMdTm5wJge
 TDOmg8PyHocwmlNHSAK6O2ec9ZRqd54Vj6g0nZejIIZV3UYMuY7xCjwpb7vCZnYAsHa1
 JkoiJpANQygQhZX+wGF0ImXwSofPwM+kKvmETNlBRIQBVv1XBer2UPXWMd7XWqAgR5Mp
 pVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693837309; x=1694442109;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tSfdmgKzdx03PG8Cg2VNfjcO1w1vRh0EO/TOV/LuIxU=;
 b=dCv2jMNwIs6Way43EoMJV+lIDQMAaXOkPGPnWL70TXtsyTlsPCd2KM2gXVwvPoNm0G
 yAWDaSVgTwaBlzDpaF8y4rRtqE36qMORlhbeXdmSjcqNUtrykU0s++KWQJcZBnD+/Nnp
 lnOD6CBKgKBjDcFj8LsNbEfMZgeVx8HswNFaMKsE5AKNuFih3BdTuwcQg+EozyIb305e
 2Ufb6gz6bdL6d4eHRJ/NU8amJWwy9DVxm5El2UdOGOzWM1KP/LarDnpT0pVWsKpolB8f
 nWwc0OpS1Uyxakd0KLWwkqpwdKy04Xjrl0OWxehDbx//UpkGzaN2pEoWGP0BTSP8poLX
 7smg==
X-Gm-Message-State: AOJu0Yxx4EtGFTd3VrLSzGo5KYc+EIbR59o539PNruwfKon5A3fYBQ8S
 j5dGJtaY/pzc6aAAr5QankU3ww==
X-Google-Smtp-Source: AGHT+IHEwkU9fnev1bERCGzDbMFLyS/Ghm8ix4KCkSPriQCMHS8HqrjNW18bWGE84+NR/5J33dl2pA==
X-Received: by 2002:a9d:7dd3:0:b0:6b9:350e:4051 with SMTP id
 k19-20020a9d7dd3000000b006b9350e4051mr10558158otn.4.1693837309027; 
 Mon, 04 Sep 2023 07:21:49 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05683012d200b006bee542e840sm4561581otq.1.2023.09.04.07.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 07:21:48 -0700 (PDT)
Message-ID: <04487f2f-3fc9-7bc3-1083-9f6328a18925@ventanamicro.com>
Date: Mon, 4 Sep 2023 11:21:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 16/20] target/riscv/tcg: move
 riscv_cpu_add_misa_properties() to tcg-cpu.c
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-17-dbarboza@ventanamicro.com>
 <20230831-9135d7f6e2059b82be3f9300@orel>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230831-9135d7f6e2059b82be3f9300@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
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



On 8/31/23 09:01, Andrew Jones wrote:
> On Fri, Aug 25, 2023 at 10:08:49AM -0300, Daniel Henrique Barboza wrote:
>> All code related to MISA TCG properties is also moved.
>>
>> At this point, all TCG properties handling is done in tcg-cpu.c, all KVM
>> properties handling is done in kvm-cpu.c.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c         | 89 --------------------------------------
>>   target/riscv/cpu.h         |  1 -
>>   target/riscv/tcg/tcg-cpu.c | 84 +++++++++++++++++++++++++++++++++++
>>   3 files changed, 84 insertions(+), 90 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 89b09a7e89..3c9db46837 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1201,49 +1201,6 @@ static void riscv_cpu_init(Object *obj)
>>   #endif /* CONFIG_USER_ONLY */
>>   }
>>   
>> -typedef struct RISCVCPUMisaExtConfig {
>> -    const char *name;
>> -    const char *description;
>> -    target_ulong misa_bit;
>> -    bool enabled;
>> -} RISCVCPUMisaExtConfig;
>> -
>> -static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>> -                                 void *opaque, Error **errp)
>> -{
>> -    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
>> -    target_ulong misa_bit = misa_ext_cfg->misa_bit;
>> -    RISCVCPU *cpu = RISCV_CPU(obj);
>> -    CPURISCVState *env = &cpu->env;
>> -    bool value;
>> -
>> -    if (!visit_type_bool(v, name, &value, errp)) {
>> -        return;
>> -    }
>> -
>> -    if (value) {
>> -        env->misa_ext |= misa_bit;
>> -        env->misa_ext_mask |= misa_bit;
>> -    } else {
>> -        env->misa_ext &= ~misa_bit;
>> -        env->misa_ext_mask &= ~misa_bit;
>> -    }
>> -}
>> -
>> -static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>> -                                 void *opaque, Error **errp)
>> -{
>> -    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
>> -    target_ulong misa_bit = misa_ext_cfg->misa_bit;
>> -    RISCVCPU *cpu = RISCV_CPU(obj);
>> -    CPURISCVState *env = &cpu->env;
>> -    bool value;
>> -
>> -    value = env->misa_ext & misa_bit;
>> -
>> -    visit_type_bool(v, name, &value, errp);
>> -}
>> -
>>   typedef struct misa_ext_info {
>>       const char *name;
>>       const char *description;
>> @@ -1304,52 +1261,6 @@ const char *riscv_get_misa_ext_description(uint32_t bit)
>>       return val;
>>   }
>>   
>> -#define MISA_CFG(_bit, _enabled) \
>> -    {.misa_bit = _bit, .enabled = _enabled}
>> -
>> -static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
>> -    MISA_CFG(RVA, true),
>> -    MISA_CFG(RVC, true),
>> -    MISA_CFG(RVD, true),
>> -    MISA_CFG(RVF, true),
>> -    MISA_CFG(RVI, true),
>> -    MISA_CFG(RVE, false),
>> -    MISA_CFG(RVM, true),
>> -    MISA_CFG(RVS, true),
>> -    MISA_CFG(RVU, true),
>> -    MISA_CFG(RVH, true),
>> -    MISA_CFG(RVJ, false),
>> -    MISA_CFG(RVV, false),
>> -    MISA_CFG(RVG, false),
>> -};
>> -
>> -void riscv_cpu_add_misa_properties(Object *cpu_obj)
>> -{
>> -    int i;
>> -
>> -    for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
>> -        RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
>> -        int bit = misa_cfg->misa_bit;
>> -
>> -        misa_cfg->name = riscv_get_misa_ext_name(bit);
>> -        misa_cfg->description = riscv_get_misa_ext_description(bit);
>> -
>> -        /* Check if KVM already created the property */
>> -        if (object_property_find(cpu_obj, misa_cfg->name)) {
>> -            continue;
>> -        }
>> -
>> -        object_property_add(cpu_obj, misa_cfg->name, "bool",
>> -                            cpu_get_misa_ext_cfg,
>> -                            cpu_set_misa_ext_cfg,
>> -                            NULL, (void *)misa_cfg);
>> -        object_property_set_description(cpu_obj, misa_cfg->name,
>> -                                        misa_cfg->description);
>> -        object_property_set_bool(cpu_obj, misa_cfg->name,
>> -                                 misa_cfg->enabled, NULL);
>> -    }
>> -}
>> -
>>   #define MULTI_EXT_CFG_BOOL(_name, _prop, _defval) \
>>       {.name = _name, .offset = CPU_CFG_OFFSET(_prop), \
>>        .enabled = _defval}
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 74fbb33e09..4269523e24 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -726,7 +726,6 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
>>   extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
>>   extern Property riscv_cpu_options[];
>>   
>> -void riscv_cpu_add_misa_properties(Object *cpu_obj);
>>   void riscv_add_satp_mode_properties(Object *obj);
>>   
>>   /* CSR function table */
>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>> index 68ce3cbcb9..8e3f55d3a6 100644
>> --- a/target/riscv/tcg/tcg-cpu.c
>> +++ b/target/riscv/tcg/tcg-cpu.c
>> @@ -574,6 +574,90 @@ static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
>>       return true;
>>   }
>>   
>> +typedef struct RISCVCPUMisaExtConfig {
>> +    const char *name;
>> +    const char *description;
>> +    target_ulong misa_bit;
>> +    bool enabled;
>> +} RISCVCPUMisaExtConfig;
>> +
>> +static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>> +                                 void *opaque, Error **errp)
>> +{
>> +    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
>> +    target_ulong misa_bit = misa_ext_cfg->misa_bit;
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>> +    CPURISCVState *env = &cpu->env;
>> +    bool value;
>> +
>> +    if (!visit_type_bool(v, name, &value, errp)) {
>> +        return;
>> +    }
>> +
>> +    if (value) {
>> +        env->misa_ext |= misa_bit;
>> +        env->misa_ext_mask |= misa_bit;
>> +    } else {
>> +        env->misa_ext &= ~misa_bit;
>> +        env->misa_ext_mask &= ~misa_bit;
>> +    }
>> +}
>> +
>> +static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>> +                                 void *opaque, Error **errp)
>> +{
>> +    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
>> +    target_ulong misa_bit = misa_ext_cfg->misa_bit;
>> +    RISCVCPU *cpu = RISCV_CPU(obj);
>> +    CPURISCVState *env = &cpu->env;
>> +    bool value;
>> +
>> +    value = env->misa_ext & misa_bit;
>> +
>> +    visit_type_bool(v, name, &value, errp);
>> +}
>> +
>> +#define MISA_CFG(_bit, _enabled) \
>> +    {.misa_bit = _bit, .enabled = _enabled}
>> +
>> +static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
> 
> Can this be const?

At this moment it can't because we're setting 'name' and 'description' for
each element down there in riscv_cpu_add_misa_properties().

However, in a quick look it seems that we don't need these fields because we
don't access 'name' or 'description' using the struct after the property is
created.

I'll take another look and, if that's indeed the case, I'll do a prep patch
to make these changes before moving code in this patch. Thanks,


Daniel

> 
>> +    MISA_CFG(RVA, true),
>> +    MISA_CFG(RVC, true),
>> +    MISA_CFG(RVD, true),
>> +    MISA_CFG(RVF, true),
>> +    MISA_CFG(RVI, true),
>> +    MISA_CFG(RVE, false),
>> +    MISA_CFG(RVM, true),
>> +    MISA_CFG(RVS, true),
>> +    MISA_CFG(RVU, true),
>> +    MISA_CFG(RVH, true),
>> +    MISA_CFG(RVJ, false),
>> +    MISA_CFG(RVV, false),
>> +    MISA_CFG(RVG, false),
>> +};
>> +
>> +static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
>> +        RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
>> +        int bit = misa_cfg->misa_bit;
>> +
>> +        misa_cfg->name = riscv_get_misa_ext_name(bit);
>> +        misa_cfg->description = riscv_get_misa_ext_description(bit);
>> +
>> +        object_property_add(cpu_obj, misa_cfg->name, "bool",
>> +                            cpu_get_misa_ext_cfg,
>> +                            cpu_set_misa_ext_cfg,
>> +                            NULL, (void *)misa_cfg);
>> +        object_property_set_description(cpu_obj, misa_cfg->name,
>> +                                        misa_cfg->description);
>> +        object_property_set_bool(cpu_obj, misa_cfg->name,
>> +                                 misa_cfg->enabled, NULL);
>> +    }
>> +}
>> +
>>   static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
>>                                     void *opaque, Error **errp)
>>   {
>> -- 
>> 2.41.0
>>
>>
> 
> Otherwise,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

