Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066ECC0218A
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 06:07:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tdNi1-0005CD-9j; Thu, 30 Jan 2025 01:07:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tdNhx-0005Bm-Fa
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2025 01:07:21 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tdNhu-0001kM-K5
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2025 01:07:20 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2163dc5155fso6366025ad.0
 for <qemu-riscv@nongnu.org>; Wed, 29 Jan 2025 22:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1738217236; x=1738822036; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BBpuuOuknC+jAqDB9OMywypbLwlgMHnDfYW2K8Sj1ZM=;
 b=O2v1e0PSEp+/YE2zhynG1pbp6nUQg/OlDSgc4hMz30Hncj6JSV3mvasrngxroxRpoT
 3/a9p8Jxv0nAc3FIYd/tuWSuiROSmYWadsm+QZPr7CGY6D+ImCU+q67rzSv2uAvltOva
 0s88ohslse3L3i5vpmvbdMdEDge85F6oSPjHhLyMDEODgqlQ0Ndj7yPQQsITMMeyib0p
 bpNkfXUuj01CzCFqCtU21AmvJW2P/gQ/4B/yx/bk5NLuly1hBD6jb+fN9W7RKIbuYo91
 w09NSsWYdGVZYJ39XKvWDvnxHVPFUx9Hs7tet8YUAyM8nEv2GYrOOUdq9U7NI07fIRBo
 uUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738217236; x=1738822036;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BBpuuOuknC+jAqDB9OMywypbLwlgMHnDfYW2K8Sj1ZM=;
 b=nqV9hbL0qRVGfES7yocFwhLPtXPcAYiIp3Dyb1gUcJfxVVKZQkF4tGlyicwuGSKJxh
 UTKe0pmq0kHUz/jXSuBt/Kpv5lRJs/4IDtLAper1+rKQGHYHwXWdUfOCgzrTmGZTmL73
 JFM+12boKKzGa6Kc3HGy20TNvpjS0J1rBiLAuX7ykt/TmyPYr2likGsNGm9fR4/0DALR
 qRQLfgQH4jPk2tj6+fR+LJxYjZFeMSj82Eb9IUDnFwEYVzGGcGH7Olfitmd+JKfORAzf
 GW/v3eCknLvlMR205pyKE5S1v8PefXLGtAidby/zvxPGh2K8YaF/GVNrWoxz4CvkutDw
 +Ptw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbEA15E7ClPAa1UvttF5igpk7BDqu3scstwV0cq7HwBQAIDPqcbuawO6/EddTkLzpVrttn3r24rjwP@nongnu.org
X-Gm-Message-State: AOJu0YwJ+7TbEf/qQQGJ7sytfnkzfkyv5pZh5cezqEv9xyinXFgwsx4k
 X17pv2NcFVRmTqsaWT37J422AqyUp5oaqQCg8WrGrrrDNrdhF6L3f8UzBsF2zEw=
X-Gm-Gg: ASbGncs6cnhaDBC6rrx6P4fcIQJyvLFe9KNm6j/4PyuqzT6VC2HR9276kgLHZIQb5yI
 vq+OlxK8MGn31UpLvwZGXbBXEplnV/N21Ih0R9sppfQjqDh9cGLfWzMUMgiYoNHqUGcuiN+APue
 jsmiM5+6vF2tGBr0W88tYgiBM3jTarKMAKnMotkIfX1nqosID8Y/zjrepiWWeqLrVfLv7XHfvnp
 F0ee07lKK/+orMBx1Cqv+pr1b50NQnLmR6HZHvfJXklKqa+BTmiKll4NATSfPU7CzKeumCBxCZy
 lSF7j05VkYgG64uUJJt4sr4E0bBffw0=
X-Google-Smtp-Source: AGHT+IFjXiB3VtXqs1hRL3sQbUDriLwKng1ApLCqRea3KhNWYrrtWbkQv0a5tm/6ttbjvNWyEyhMRQ==
X-Received: by 2002:a05:6a21:3416:b0:1e1:afa9:d39b with SMTP id
 adf61e73a8af0-1ed7a5a5102mr10810684637.7.1738217235612; 
 Wed, 29 Jan 2025 22:07:15 -0800 (PST)
Received: from [192.168.68.110] ([177.170.227.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72fe69cea77sm549397b3a.150.2025.01.29.22.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 22:07:14 -0800 (PST)
Message-ID: <0d10a8ed-2775-4207-8d9d-a243c04b9db1@ventanamicro.com>
Date: Thu, 30 Jan 2025 03:07:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] target/riscv: add RVA23U64 profile
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, ajones@ventanamicro.com
References: <20250114190001.1650942-1-dbarboza@ventanamicro.com>
 <20250114190001.1650942-4-dbarboza@ventanamicro.com>
 <CAKmqyKPc6OuKjf3PdY9AzyUzNBzP8AtyQD6+koBSqQsu9=Z=KA@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKPc6OuKjf3PdY9AzyUzNBzP8AtyQD6+koBSqQsu9=Z=KA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 1/28/25 10:22 PM, Alistair Francis wrote:
> On Wed, Jan 15, 2025 at 5:02 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> Add RVA23U64 as described in [1]. Add it as a child of RVA22U64 since
>> all RVA22U64 mandatory extensions are also present in RVA23U64. What's
>> left then is to list the mandatory extensions that are RVA23 only.
>>
>> A new "rva23u64" CPU is also added.
>>
>> [1] https://github.com/riscv/riscv-profiles/blob/main/src/rva23-profile.adoc
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks for the review! If you could take a look at the latest version of this
work that would be great too:

[PATCH v4 0/6] target/riscv: RVA23 profile support

All patches are acked. Drew's points that were raised in this version (and v3)
were addressed.


Thanks,


Daniel

> 
> Alistair
> 
>> ---
>>   target/riscv/cpu-qom.h |  1 +
>>   target/riscv/cpu.c     | 32 ++++++++++++++++++++++++++++++++
>>   2 files changed, 33 insertions(+)
>>
>> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
>> index d56b067bf2..53ead481a9 100644
>> --- a/target/riscv/cpu-qom.h
>> +++ b/target/riscv/cpu-qom.h
>> @@ -40,6 +40,7 @@
>>   #define TYPE_RISCV_CPU_RV64E            RISCV_CPU_TYPE_NAME("rv64e")
>>   #define TYPE_RISCV_CPU_RVA22U64         RISCV_CPU_TYPE_NAME("rva22u64")
>>   #define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
>> +#define TYPE_RISCV_CPU_RVA23U64         RISCV_CPU_TYPE_NAME("rva23u64")
>>   #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>>   #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>>   #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 6fb4d5f374..371a7d63fa 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -2395,9 +2395,33 @@ static RISCVCPUProfile RVA22S64 = {
>>       }
>>   };
>>
>> +/*
>> + * All mandatory extensions from RVA22U64 are present
>> + * in RVA23U64 so set RVA22 as a parent. We need to
>> + * declare just the newly added mandatory extensions.
>> + */
>> +static RISCVCPUProfile RVA23U64 = {
>> +    .parent = &RVA22U64,
>> +    .name = "rva23u64",
>> +    .misa_ext = RVV,
>> +    .priv_spec = RISCV_PROFILE_ATTR_UNUSED,
>> +    .satp_mode = RISCV_PROFILE_ATTR_UNUSED,
>> +    .ext_offsets = {
>> +        CPU_CFG_OFFSET(ext_zvfhmin), CPU_CFG_OFFSET(ext_zvbb),
>> +        CPU_CFG_OFFSET(ext_zvkt), CPU_CFG_OFFSET(ext_zihintntl),
>> +        CPU_CFG_OFFSET(ext_zicond), CPU_CFG_OFFSET(ext_zimop),
>> +        CPU_CFG_OFFSET(ext_zcmop), CPU_CFG_OFFSET(ext_zcb),
>> +        CPU_CFG_OFFSET(ext_zfa), CPU_CFG_OFFSET(ext_zawrs),
>> +        CPU_CFG_OFFSET(ext_supm),
>> +
>> +        RISCV_PROFILE_EXT_LIST_END
>> +    }
>> +};
>> +
>>   RISCVCPUProfile *riscv_profiles[] = {
>>       &RVA22U64,
>>       &RVA22S64,
>> +    &RVA23U64,
>>       NULL,
>>   };
>>
>> @@ -2884,6 +2908,13 @@ static void rva22s64_profile_cpu_init(Object *obj)
>>
>>       RVA22S64.enabled = true;
>>   }
>> +
>> +static void rva23u64_profile_cpu_init(Object *obj)
>> +{
>> +    rv64i_bare_cpu_init(obj);
>> +
>> +    RVA23U64.enabled = true;
>> +}
>>   #endif
>>
>>   static const gchar *riscv_gdb_arch_name(CPUState *cs)
>> @@ -3163,6 +3194,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>>       DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64E,        MXL_RV64,  rv64e_bare_cpu_init),
>>       DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22U64,  MXL_RV64,  rva22u64_profile_cpu_init),
>>       DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22S64,  MXL_RV64,  rva22s64_profile_cpu_init),
>> +    DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA23U64,  MXL_RV64,  rva23u64_profile_cpu_init),
>>   #endif /* TARGET_RISCV64 */
>>   };
>>
>> --
>> 2.47.1
>>
>>


