Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77827C61DF4
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 11:42:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6UZw-0007MH-VG; Fri, 24 Nov 2023 06:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6UZv-0007KQ-L2
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 06:42:35 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6UZt-0001Kj-QK
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 06:42:35 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1cf7a8ab047so13961595ad.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 03:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700826152; x=1701430952; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hrUEKc4IXj5eKNktXjnPYv76yLdhFibwJsTSAyCObmg=;
 b=lU2bkb74AszPS72PG/dRQ6AOIKUrBOt5XfjTSTW9YDP5lS+/+dVxuL/90kEe/d/Hgo
 7205LIbbvYZtyFMBcHcIdjA98m3ME9/DRR1E1CDiBtZcPtu/VhGsCqq0QgdCs3+XC232
 uiNvZx65739L8Bf/mERhQWJR8Jv5NDk6WtyTp3Cf0j0qEBJ5nQLcuyz8bDUvd9aEd0eX
 nCvdFxZOdcNDUGUn4rWzmhPYcDgNvwJ7I9uEy56+r2/ZbLBzp1aIcTqzlfDZT2sZ1vdq
 U5yruFhQCrollDB3GUEIZlcTL4qPuV547AkbaKd2GvjBTL+irXAyqaFIV279/yCxbTlb
 tC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700826152; x=1701430952;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hrUEKc4IXj5eKNktXjnPYv76yLdhFibwJsTSAyCObmg=;
 b=FKD/tF1h64OK8/qG3CTtDJnT+ySL5C5X1+DeaGY4esoRFIn5sWWDemIdU7eOAf2s3z
 KyfRYQ8n8Ajx883FZCt+AHGoANoEIoWZ6ZM/b+7U0JnpQlAx+8XlqOiPSmnYQyPQ+1Yi
 5nKqDNgC3yUPl+fseFxmIDRs8ckwvTrBZnFyhB3DRcuvcQ6fwqTvphQ+1fsgvSR/uZWf
 pWhGWundmRBUYSRSXc6hv2ZxC7M0OARmWBrjV3AQI9fJWwvAuVfYxsAERsm8voA6i+QP
 yC3GLoHgIvtLORdqmvz1zWUU/Me4S+JD3c5qFdbfIYq7YAJYR2bApcftO3Ls14nZcwg6
 +z1w==
X-Gm-Message-State: AOJu0YwPSwOLZlFA6OMombUATTpg0b0zYJG1pezyId3W8SkRfiUtNFjV
 yuM+waqsIn+mJfiB+qc5PnXJOg==
X-Google-Smtp-Source: AGHT+IG8s8MIkzsvNBCHJ1K0MXnGQYWp1bW+6di4dWWhijM7l/ZLb0GMbfpwqSU0qaUc1tAb5b07fg==
X-Received: by 2002:a17:903:183:b0:1cf:55dd:9a0e with SMTP id
 z3-20020a170903018300b001cf55dd9a0emr2998085plg.15.1700826151978; 
 Fri, 24 Nov 2023 03:42:31 -0800 (PST)
Received: from [192.168.68.109] ([152.250.131.119])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a170902eed200b001cf5d425244sm2982621plb.298.2023.11.24.03.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 03:42:31 -0800 (PST)
Message-ID: <c58b3b6c-9a26-4199-9776-c67e2a650da4@ventanamicro.com>
Date: Fri, 24 Nov 2023 08:42:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.0 2/7] target/riscv: add priv ver restriction to
 profiles
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20231123191532.1101644-1-dbarboza@ventanamicro.com>
 <20231123191532.1101644-3-dbarboza@ventanamicro.com>
 <20231124-9f593580898dcebbdb590bff@orel>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231124-9f593580898dcebbdb590bff@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 11/24/23 06:57, Andrew Jones wrote:
> On Thu, Nov 23, 2023 at 04:15:27PM -0300, Daniel Henrique Barboza wrote:
>> Some profiles, like RVA22S64, has a priv_spec requirement.
>>
>> Make this requirement explicit for all profiles. We'll validate this
>> requirement finalize() time and, in case the user chooses an
>> incompatible priv_spec while activating a profile, a warning will be
>> shown.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c         |  1 +
>>   target/riscv/cpu.h         |  2 ++
>>   target/riscv/tcg/tcg-cpu.c | 30 ++++++++++++++++++++++++++++++
>>   3 files changed, 33 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 59b131c1fc..29a9f77702 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1537,6 +1537,7 @@ Property riscv_cpu_options[] = {
>>   static RISCVCPUProfile RVA22U64 = {
>>       .name = "rva22u64",
>>       .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVU,
>> +    .priv_spec = RISCV_PROFILE_ATTR_UNUSED,
>>       .ext_offsets = {
>>           CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
>>           CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 5ff629650d..1f34eda1e4 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -81,10 +81,12 @@ typedef struct riscv_cpu_profile {
>>       uint32_t misa_ext;
>>       bool enabled;
>>       bool user_set;
>> +    int priv_spec;
>>       const int32_t ext_offsets[];
>>   } RISCVCPUProfile;
>>   
>>   #define RISCV_PROFILE_EXT_LIST_END -1
>> +#define RISCV_PROFILE_ATTR_UNUSED -1
>>   
>>   extern RISCVCPUProfile *riscv_profiles[];
>>   
>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>> index ddf37b25f3..a26cc6f093 100644
>> --- a/target/riscv/tcg/tcg-cpu.c
>> +++ b/target/riscv/tcg/tcg-cpu.c
>> @@ -74,6 +74,20 @@ static void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit,
>>       }
>>   }
>>   
>> +static const char *cpu_priv_ver_to_str(int priv_ver)
>> +{
>> +    switch (priv_ver) {
>> +    case PRIV_VERSION_1_10_0:
>> +        return "v1.10.0";
>> +    case PRIV_VERSION_1_11_0:
>> +        return "v1.11.0";
>> +    case PRIV_VERSION_1_12_0:
>> +        return "v1.12.0";
>> +    }
>> +
>> +    g_assert_not_reached();
>> +}
>> +
>>   static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>>                                             const TranslationBlock *tb)
>>   {
>> @@ -764,11 +778,23 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>   static void riscv_cpu_validate_profile(RISCVCPU *cpu,
>>                                          RISCVCPUProfile *profile)
>>   {
>> +    CPURISCVState *env = &cpu->env;
>>       const char *warn_msg = "Profile %s mandates disabled extension %s";
>>       bool send_warn = profile->user_set && profile->enabled;
>>       bool profile_impl = true;
>>       int i;
>>   
>> +    if (profile->priv_spec != env->priv_ver) {
> 
> Shouldn't this be something like
> 
>   if (profile->priv_spec != RISCV_PROFILE_ATTR_UNUSED &&
>       profile->priv_spec != env->priv_ver)

Yeah it should. Otherwise we might send warnings for cases in which the profile
doesn't care about priv_ver. I'll fix it in v2.


Thanks,


Daniel

> 
>> +        profile_impl = false;
>> +
>> +        if (send_warn) {
>> +            warn_report("Profile %s requires priv spec %s, "
>> +                        "but priv ver %s was set", profile->name,
>> +                        cpu_priv_ver_to_str(profile->priv_spec),
>> +                        cpu_priv_ver_to_str(env->priv_ver));
>> +        }
>> +    }
>> +
>>       for (i = 0; misa_bits[i] != 0; i++) {
>>           uint32_t bit = misa_bits[i];
>>   
>> @@ -1057,6 +1083,10 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
>>       profile->user_set = true;
>>       profile->enabled = value;
>>   
>> +    if (profile->enabled) {
>> +        cpu->env.priv_ver = profile->priv_spec;
>> +    }
>> +
>>       for (i = 0; misa_bits[i] != 0; i++) {
>>           uint32_t bit = misa_bits[i];
>>   
>> -- 
>> 2.41.0
>>
> 
> Thanks,
> drew

