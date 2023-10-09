Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B00E95A8E
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:32:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpoTb-0001R9-1h; Mon, 09 Oct 2023 07:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qpoTZ-0001O0-Jd
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 07:31:05 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qpoTX-0000xm-6O
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 07:31:05 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1c5cd27b1acso34900365ad.2
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 04:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696851061; x=1697455861; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b3+tkYoMGPlIedqWYzkauURaxMqmpS5kp2Aw05LQWJY=;
 b=nrbTSnfpA86cpwpAOjfhtnu438iyMo4DbbwETbHE+NxXRUYA6KVDWCjcJbH0HOhWCX
 b+uAzLKSuN8PkC6b2WQIjK6w2HFYalwg79rweHaR+86Tk7UEHOBqRsEv7x2EolNaDFi3
 t3mdZDkXUGaTbjHnkvDjuNtqG+xW98xveSv2r4y2LGjkIZOP3uro/Jbjz7+bUkMf5nNz
 IYkGQtoTXU4zZiAsF0hW8rAm949IXCsgInVhk17nxAOJ2DQugSfhpa5WS0WJz/MHSasa
 5M140qWA/ly1KuqhmTPQHsgR7Hzqr6O5tEQ1kAqWqd28mlQvSoUw9ad//qTMrIs/BqbO
 7nGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696851061; x=1697455861;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b3+tkYoMGPlIedqWYzkauURaxMqmpS5kp2Aw05LQWJY=;
 b=jPmJRs28wQfVU2tWJuLUe8tBsao755soZb58sUFeZanQ8r+SkzLLs8xNsLgS6/+kil
 qdwnI1ixoBkXxKlxbGuMPzJwto2ofiHRtTH9//l/cwBAtzerYRnwsekCVWUPk4qSQj8a
 qUb0+yLjiaTOJXrECBB6WH6RUq2Yk/G0J7mO8o5EwcZqzbbNYR5VW4Db+ajGlZoJZFv6
 9TbPGSAXqwRvsfB757PUMchdkxGWCY7dgCPySBZ1IVNm933dfi6C/jvn7uKHHQ5aIEZL
 mRdDVTqRE+HFuqr78y5H4YOr36KOF6HwBZuMEVZmLUx3M9km4aOzY4oIsCUHyNS6h+15
 55JA==
X-Gm-Message-State: AOJu0Ywn03+1MvyrfkTccRlp6IPuSzDvXZ0gJh+NPyWysEvYFCLESVnp
 opoN2bsB3w2rhUJ2plEjlg3awA==
X-Google-Smtp-Source: AGHT+IE4OrqDeS0UorK3fw72XvX7U6oLLxFfX2578y+xrwn6w6SreBsY7L0MZvEJFAN2uG5PXTNawg==
X-Received: by 2002:a17:903:2015:b0:1c8:922e:e00f with SMTP id
 s21-20020a170903201500b001c8922ee00fmr7188005pla.15.1696851061244; 
 Mon, 09 Oct 2023 04:31:01 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.42.196])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b001c74876f018sm9359147plb.18.2023.10.09.04.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 04:31:00 -0700 (PDT)
Message-ID: <6477a639-7c1f-4713-a22b-bd00f8cbb914@ventanamicro.com>
Date: Mon, 9 Oct 2023 08:30:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: deprecate capital 'Z' CPU properties
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20231007171427.1210117-1-dbarboza@ventanamicro.com>
 <CAKmqyKOZCb_-=KDJX3p63M1Muv0pVpUpnyborJBEXuTA1h8=_w@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKOZCb_-=KDJX3p63M1Muv0pVpUpnyborJBEXuTA1h8=_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
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


On 10/8/23 22:39, Alistair Francis wrote:
> On Sun, Oct 8, 2023 at 3:15 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> At this moment there are eleven CPU extension properties that starts
>> with capital 'Z': Zifencei, Zicsr, Zihintntl, Zihintpause, Zawrs, Zfa,
>> Zfh, Zfhmin, Zve32f, Zve64f and Zve64d. All other extensions are named
>> with lower-case letters.
>>
>> We want all properties to be named with lower-case letters since it's
>> consistent with the riscv-isa string that we create in the FDT. Having
>> these 11 properties to be exceptions can be confusing.
>>
>> Deprecate all of them. Create their lower-case counterpart to be used as
>> maintained CPU properties. When trying to use any deprecated property a
>> warning message will be displayed, recommending users to switch to the
>> lower-case variant:
>>
>> ./build/qemu-system-riscv64 -M virt -cpu rv64,Zifencei=true --nographic
>> qemu-system-riscv64: warning: CPU property 'Zifencei' is deprecated. Please use 'zifencei' instead
>>
>> This will give users some time to change their scripts before we remove
>> the capital 'Z' properties entirely.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> 
> Thanks!
> 
> Applied to riscv-to-apply.next
> 
> Alistair

I just sent a v2 with the doc fix Drew mentioned. Feel free to either pick the v2 or
amend this one in-tree. Whatever is more convenient for you.



Thanks,

Daniel

> 
>> ---
>>   docs/about/deprecated.rst  | 23 ++++++++++++++++++++++
>>   target/riscv/cpu.c         | 39 +++++++++++++++++++++++++++-----------
>>   target/riscv/cpu.h         |  1 +
>>   target/riscv/tcg/tcg-cpu.c | 31 +++++++++++++++++++++++++++++-
>>   4 files changed, 82 insertions(+), 12 deletions(-)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 694b878f36..331f10f930 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -378,6 +378,29 @@ of generic CPUs: rv32 and rv64 as default CPUs and 'max' as a feature complete
>>   CPU for both 32 and 64 bit builds. Users are then discouraged to use the 'any'
>>   CPU type starting in 8.2.
>>
>> +RISC-V CPU properties which start with with capital 'Z' (since 8.2)
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> +
>> +All RISC-V CPU properties which start with capital 'Z' are being deprecated
>> +starting in 8.2. The reason is that they were wrongly added with capital 'Z'
>> +in the past. CPU properties were later added with lower-case names, which
>> +is the format we want to use from now on.
>> +
>> +Users which try to use these deprecated properties will receive a warning
>> +recommending to switch to their stable counterparts:
>> +
>> +- "Zifencei" should be replaced with "zifencei"
>> +- "Zicsr" should be replaced with "zicsr"
>> +- "Zihintntl" should be replaced with "zihintntl"
>> +- "Zihintpause" should be replaced with "zihintpause"
>> +- "Zawrs" should be replaced with "zawrs"
>> +- "Zfa" should be replaced with "zfa"
>> +- "Zfh" should be replaced with "zfh"
>> +- "Zfhmin" should be replaced with "zfhmin"
>> +- "Zve32f" should be replaced with "zve32f"
>> +- "Zve64f" should be replaced with "zve64f"
>> +- "Zve64d" should be replaced with "zve64d"
>> +
>>   Block device options
>>   ''''''''''''''''''''
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 521bb88538..1cdc3d2609 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1246,17 +1246,17 @@ const char *riscv_get_misa_ext_description(uint32_t bit)
>>   const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>>       /* Defaults for standard extensions */
>>       MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
>> -    MULTI_EXT_CFG_BOOL("Zifencei", ext_ifencei, true),
>> -    MULTI_EXT_CFG_BOOL("Zicsr", ext_icsr, true),
>> -    MULTI_EXT_CFG_BOOL("Zihintntl", ext_zihintntl, true),
>> -    MULTI_EXT_CFG_BOOL("Zihintpause", ext_zihintpause, true),
>> -    MULTI_EXT_CFG_BOOL("Zawrs", ext_zawrs, true),
>> -    MULTI_EXT_CFG_BOOL("Zfa", ext_zfa, true),
>> -    MULTI_EXT_CFG_BOOL("Zfh", ext_zfh, false),
>> -    MULTI_EXT_CFG_BOOL("Zfhmin", ext_zfhmin, false),
>> -    MULTI_EXT_CFG_BOOL("Zve32f", ext_zve32f, false),
>> -    MULTI_EXT_CFG_BOOL("Zve64f", ext_zve64f, false),
>> -    MULTI_EXT_CFG_BOOL("Zve64d", ext_zve64d, false),
>> +    MULTI_EXT_CFG_BOOL("zifencei", ext_ifencei, true),
>> +    MULTI_EXT_CFG_BOOL("zicsr", ext_icsr, true),
>> +    MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
>> +    MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
>> +    MULTI_EXT_CFG_BOOL("zawrs", ext_zawrs, true),
>> +    MULTI_EXT_CFG_BOOL("zfa", ext_zfa, true),
>> +    MULTI_EXT_CFG_BOOL("zfh", ext_zfh, false),
>> +    MULTI_EXT_CFG_BOOL("zfhmin", ext_zfhmin, false),
>> +    MULTI_EXT_CFG_BOOL("zve32f", ext_zve32f, false),
>> +    MULTI_EXT_CFG_BOOL("zve64f", ext_zve64f, false),
>> +    MULTI_EXT_CFG_BOOL("zve64d", ext_zve64d, false),
>>       MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
>>
>>       MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
>> @@ -1349,6 +1349,23 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>
>> +/* Deprecated entries marked for future removal */
>> +const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[] = {
>> +    MULTI_EXT_CFG_BOOL("Zifencei", ext_ifencei, true),
>> +    MULTI_EXT_CFG_BOOL("Zicsr", ext_icsr, true),
>> +    MULTI_EXT_CFG_BOOL("Zihintntl", ext_zihintntl, true),
>> +    MULTI_EXT_CFG_BOOL("Zihintpause", ext_zihintpause, true),
>> +    MULTI_EXT_CFG_BOOL("Zawrs", ext_zawrs, true),
>> +    MULTI_EXT_CFG_BOOL("Zfa", ext_zfa, true),
>> +    MULTI_EXT_CFG_BOOL("Zfh", ext_zfh, false),
>> +    MULTI_EXT_CFG_BOOL("Zfhmin", ext_zfhmin, false),
>> +    MULTI_EXT_CFG_BOOL("Zve32f", ext_zve32f, false),
>> +    MULTI_EXT_CFG_BOOL("Zve64f", ext_zve64f, false),
>> +    MULTI_EXT_CFG_BOOL("Zve64d", ext_zve64d, false),
>> +
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>>   Property riscv_cpu_options[] = {
>>       DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 3f11e69223..e98f5de32e 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -722,6 +722,7 @@ typedef struct RISCVCPUMultiExtConfig {
>>   extern const RISCVCPUMultiExtConfig riscv_cpu_extensions[];
>>   extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
>>   extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
>> +extern const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[];
>>   extern Property riscv_cpu_options[];
>>
>>   typedef struct isa_ext_data {
>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>> index 08b806dc07..00676593f7 100644
>> --- a/target/riscv/tcg/tcg-cpu.c
>> +++ b/target/riscv/tcg/tcg-cpu.c
>> @@ -732,6 +732,25 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>>       }
>>   }
>>
>> +static bool cpu_ext_is_deprecated(const char *ext_name)
>> +{
>> +    return isupper(ext_name[0]);
>> +}
>> +
>> +/*
>> + * String will be allocated in the heap. Caller is responsible
>> + * for freeing it.
>> + */
>> +static char *cpu_ext_to_lower(const char *ext_name)
>> +{
>> +    char *ret = g_malloc0(strlen(ext_name) + 1);
>> +
>> +    strcpy(ret, ext_name);
>> +    ret[0] = tolower(ret[0]);
>> +
>> +    return ret;
>> +}
>> +
>>   static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
>>                                     void *opaque, Error **errp)
>>   {
>> @@ -744,6 +763,13 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
>>           return;
>>       }
>>
>> +    if (cpu_ext_is_deprecated(multi_ext_cfg->name)) {
>> +        g_autofree char *lower = cpu_ext_to_lower(multi_ext_cfg->name);
>> +
>> +        warn_report("CPU property '%s' is deprecated. Please use '%s' instead",
>> +                    multi_ext_cfg->name, lower);
>> +    }
>> +
>>       g_hash_table_insert(multi_ext_user_opts,
>>                           GUINT_TO_POINTER(multi_ext_cfg->offset),
>>                           (gpointer)value);
>> @@ -777,13 +803,14 @@ static void cpu_add_multi_ext_prop(Object *cpu_obj,
>>                                      const RISCVCPUMultiExtConfig *multi_cfg)
>>   {
>>       bool generic_cpu = riscv_cpu_is_generic(cpu_obj);
>> +    bool deprecated_ext = cpu_ext_is_deprecated(multi_cfg->name);
>>
>>       object_property_add(cpu_obj, multi_cfg->name, "bool",
>>                           cpu_get_multi_ext_cfg,
>>                           cpu_set_multi_ext_cfg,
>>                           NULL, (void *)multi_cfg);
>>
>> -    if (!generic_cpu) {
>> +    if (!generic_cpu || deprecated_ext) {
>>           return;
>>       }
>>
>> @@ -826,6 +853,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
>>       riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_vendor_exts);
>>       riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_experimental_exts);
>>
>> +    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
>> +
>>       for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
>>           qdev_property_add_static(DEVICE(obj), prop);
>>       }
>> --
>> 2.41.0
>>
>>

