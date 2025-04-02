Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D467BC36018
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Apr 2025 21:25:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u05aj-0003zb-3e; Wed, 02 Apr 2025 17:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u05ab-0003xv-QD
 for qemu-riscv@nongnu.org; Wed, 02 Apr 2025 17:25:39 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u05aX-0004WO-Tq
 for qemu-riscv@nongnu.org; Wed, 02 Apr 2025 17:25:36 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso1524145e9.2
 for <qemu-riscv@nongnu.org>; Wed, 02 Apr 2025 14:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743629132; x=1744233932; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JMF1o2oyl9lXKTvH8DLhnN3bdYwEal7s4aWebAqi28I=;
 b=SfwnOTmreOMWpB4dT2bxDghVhT4K1tsQbcv7zwbXyEAKZ9mui9CdSuzXwpBsoHIEKU
 V8fLhTPSZmUHif8QfTZd5yKobPMAqYQncSmUyArFhJF7M8hEWY4WXxEcPLa+Y17xALQN
 Xobx4Y/1MfyZTsnFxOUjOE7ZMSgKRG7NVYVQMlIkF2JRaH6t+94jO8ujMB6cma2Fh7yx
 AWAAn4/3oWa/6MKTuXrf50QxtqSb/TqBlVmoGFtLZMsbHRH8ZvA4cYGBZGWvv8QyyyTL
 vJnhh9tfozTFtmmsM7KDVTVoQsFvpLFixT/M7E/rTb8gBJfI7QdqoxKhdijmHTUCcdOp
 0qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743629132; x=1744233932;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JMF1o2oyl9lXKTvH8DLhnN3bdYwEal7s4aWebAqi28I=;
 b=dJ+itbmadrLau29kuweyKMHkFTa884vuTOHuWrCiGKLhUoFLoXaLJsKyglwaF3xM0S
 CWytHN/FmiY+6n88pMmAhjRaDPBMl1O/oJB/8cf1B/bzHG67Q+nimnGIkPAOT38T1TmL
 iSE5cRa5xchVCQo5BfcITIxo2BL46dQRsWYd6eiAIlcRp9EoB01JKkp++Fqv4p6Onjj7
 u8vceSzP4ZwOAhEqG7qc5aYV+XY34DhFk+BpR1XhsSWW8s9flkVuQvzK+6olOYyvfk4j
 zr17944SdiqsIhjqL3UUafIoYHoyKHMs+FUtvo/w5HET+0y8BPLeLaqAU6QloC9WqjEF
 JhuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdHMne09/Yl9jNyBxAu3tbhNOF0/6a5gAkicn7iVGVJrtfoKP3AEs/i5TTtJ0Hg5nv7RkLJDPgT1EB@nongnu.org
X-Gm-Message-State: AOJu0YyzpqZTsULeUzHceBKF17BFhzqutCKfm8zck1A5r8ZWgbwGpUL0
 mMCDWvuMvF/cpBhyuBdh2ghkw1ypf1mExae/ezbF7BROJOR9lW7Zp+B5kMmcEUU=
X-Gm-Gg: ASbGnctV+Se726REQVtJncYNil2kJdEw2NjR70N/9tslKt7MrOXVz37n3xLUl3m3t+3
 htdPg2+64DknBUv8J/OGBCUnhg53cfpolHO42XG+R2mVSyKc5+0YZYtVvFHFZDK8tiq7baGlMw/
 DXKx3KotoHxnlUVOrDp72K2TXWiDYNSMHEowvP/rWghMOscDZ6z+3e1N3Mvscng6JWviKSQdQPN
 4IKMpODaodeLfZ8rZsnxEFU2Ta45kJT7/nJ4RBLvY3xvPK6Gz/ifDKTYPoaoRxARbgG0ESsZXaM
 DAUQ3LJ3AETBlDUOu53NyKGGzhcroYicdQjK2F+ROKwOQXqEsWUybZwW0olaH3lZemPvHrC4dUu
 Gz0pbEoJlmqA6
X-Google-Smtp-Source: AGHT+IHZ28nohVFb2VQa0YD/+nwPkkR0LZ4THkFplS88IiqAeIwMZiBqfLeeNAPG8QYKimqJQwRQ/A==
X-Received: by 2002:a05:600c:4453:b0:43d:683:8cb2 with SMTP id
 5b1f17b1804b1-43ec13eaccbmr2825905e9.14.1743629131844; 
 Wed, 02 Apr 2025 14:25:31 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b65873bsm17783952f8f.8.2025.04.02.14.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 14:25:31 -0700 (PDT)
Message-ID: <296658b4-d28f-4a71-9023-8e87791daa72@linaro.org>
Date: Wed, 2 Apr 2025 23:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0?] target/riscv: Do not expose rv128 CPU on user
 mode emulation
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250402205151.51415-1-philmd@linaro.org>
 <6ac4e5d6-42c8-43b9-93e6-6842a7f66cd9@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <6ac4e5d6-42c8-43b9-93e6-6842a7f66cd9@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 2/4/25 23:22, Daniel Henrique Barboza wrote:
> 
> 
> On 4/2/25 5:51 PM, Philippe Mathieu-Daudé wrote:
>> As Richard mentioned:
>>
>>    We should allow RV128 in user-mode at all until there's a
>>    kernel abi for it.
> 
> By the context I suppose Richard said 'We shouldn't allow RV128 ...'.
> 
> If this was said in a gitlab issue or something it would be nice to
> add a link in the commit msg.

Here is the link to the thread:
https://lore.kernel.org/qemu-devel/2650b68f-e705-4994-9791-0bf8b2e01d74@linaro.org/

> 
>>
>> Remove the experimental 'x-rv128' CPU on user emulation
>> (since it is experimental, no deprecation period is required).
>>
>> Reported-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
> 
> 
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

> 
>>   target/riscv/cpu.c         | 10 ++++------
>>   target/riscv/tcg/tcg-cpu.c |  5 +++--
>>   2 files changed, 7 insertions(+), 8 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 430b02d2a58..ad534cee51f 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -697,7 +697,7 @@ static void rv64_xiangshan_nanhu_cpu_init(Object 
>> *obj)
>>   #endif
>>   }
>> -#ifdef CONFIG_TCG
>> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>>   static void rv128_base_cpu_init(Object *obj)
>>   {
>>       RISCVCPU *cpu = RISCV_CPU(obj);
>> @@ -708,11 +708,9 @@ static void rv128_base_cpu_init(Object *obj)
>>       /* Set latest version of privileged specification */
>>       env->priv_ver = PRIV_VERSION_LATEST;
>> -#ifndef CONFIG_USER_ONLY
>>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>> -#endif
>>   }
>> -#endif /* CONFIG_TCG */
>> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
>>   static void rv64i_bare_cpu_init(Object *obj)
>>   {
>> @@ -3255,9 +3253,9 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>>       DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,  MXL_RV64,  
>> rv64_veyron_v1_cpu_init),
>>       DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_XIANGSHAN_NANHU,
>>                                                    MXL_RV64, 
>> rv64_xiangshan_nanhu_cpu_init),
>> -#ifdef CONFIG_TCG
>> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>>       DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,   MXL_RV128, 
>> rv128_base_cpu_init),
>> -#endif /* CONFIG_TCG */
>> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
>>       DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I,        MXL_RV64,  
>> rv64i_bare_cpu_init),
>>       DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64E,        MXL_RV64,  
>> rv64e_bare_cpu_init),
>>       DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22U64,  MXL_RV64,  
>> rva22u64_profile_cpu_init),
>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>> index 19ab324cb2a..50e81b2e521 100644
>> --- a/target/riscv/tcg/tcg-cpu.c
>> +++ b/target/riscv/tcg/tcg-cpu.c
>> @@ -1048,7 +1048,6 @@ static bool riscv_cpu_is_generic(Object *cpu_obj)
>>   static bool riscv_tcg_cpu_realize(CPUState *cs, Error **errp)
>>   {
>>       RISCVCPU *cpu = RISCV_CPU(cs);
>> -    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>>       if (!riscv_cpu_tcg_compatible(cpu)) {
>>           g_autofree char *name = riscv_cpu_get_name(cpu);
>> @@ -1057,6 +1056,9 @@ static bool riscv_tcg_cpu_realize(CPUState *cs, 
>> Error **errp)
>>           return false;
>>       }
>> +#ifndef CONFIG_USER_ONLY
>> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>> +
>>       if (mcc->misa_mxl_max >= MXL_RV128 && qemu_tcg_mttcg_enabled()) {
>>           /* Missing 128-bit aligned atomics */
>>           error_setg(errp,
>> @@ -1065,7 +1067,6 @@ static bool riscv_tcg_cpu_realize(CPUState *cs, 
>> Error **errp)
>>           return false;
>>       }
>> -#ifndef CONFIG_USER_ONLY
>>       CPURISCVState *env = &cpu->env;
>>       tcg_cflags_set(CPU(cs), CF_PCREL);
> 


