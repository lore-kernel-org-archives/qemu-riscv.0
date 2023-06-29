Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E20EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 22:05:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEzkn-0007Eh-LW; Thu, 29 Jun 2023 18:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEzkl-0007EA-Gf
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 18:04:39 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEzki-0005Nd-0r
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 18:04:39 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6b73b839025so990227a34.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 15:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688076274; x=1690668274;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=07VFQnaXYtN1Pc7pguLYmt6KM+DjocCyIf/S2PONZqM=;
 b=hJt/t/Yv/dnL+SMHdaIEVgFQUJIP5QMxhuHpcNTSu2QSiMPB+3HH1tIwpTboPRa6i7
 Vk1Ry9Fz+pP/mQScrHdGe16EAWDRvUvANcegmmNJRWivnqdgsMMkc28Xv8vQ4RlK+PKn
 PN9dnt0KyrRgToNxF+hGpeMpIXLoMUk/m1hPs3ZSfHA9gSiwvDKWVns2cKkXWw8t+xFE
 HNuGUmUHQxvmBOj9rd81I9pmigdFnxihOLdzECAhl9QfZqt8LGDMzEbbrEbxpsSFbnW9
 mZaPfICS5U2qz+buYOMpERnVRJ6I9HQcC5M7wkzBXbsTzb9psjCZqVgEI2j8gvhyNmOB
 GAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688076274; x=1690668274;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=07VFQnaXYtN1Pc7pguLYmt6KM+DjocCyIf/S2PONZqM=;
 b=lCSaoxC2OMQZzOYguW4fJEql5Eg8F/NMYk5s8AnGmP9ZZ9WzVRckAAWH5+x43epGPJ
 dIYU7YEkaxmAz28WP8RUCEgdgO3wyMMxOEB2hgETCM3GSg1l4rt415FuNElLpCzIpkjc
 CLRCp/uOgLPBTytql03cToaBhQnUlxDyEReNur1k0c3AjV9O/SsjMCWEvne5wBGdjhvg
 tibYRXHYBhnMR6+tPeEIt2KrMMbh5woUv8+MNF7nLdp8QBz3RA1/MhvHcgJncEcGS4hZ
 TpiGK6B/haW0cxHTaKdeGOOgg2BZarccD62uDxyRqBeny0kbZcscN63duyn6nxiysIdN
 Ce8Q==
X-Gm-Message-State: AC+VfDy374t01I52O+L10Pi8svvcVqvKwY2N7v8X+Mhs+7Ju9s8WfkrJ
 7vzgA/w2Yvz9uH8sXYT0BvOoVg==
X-Google-Smtp-Source: ACHHUZ4WXmhWumr1V02ZTOjswFlxaIV7XP+gv9x4/+S+bmTVT2r14puWx394mXT3mXAUL6uj74p3mg==
X-Received: by 2002:a9d:6d82:0:b0:6b8:6b70:4848 with SMTP id
 x2-20020a9d6d82000000b006b86b704848mr1288269otp.29.1688076273720; 
 Thu, 29 Jun 2023 15:04:33 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 j15-20020a9d7f0f000000b006b5887ba78fsm6002203otq.81.2023.06.29.15.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 15:04:33 -0700 (PDT)
Message-ID: <8d54c842-fd7a-0e9d-3835-10599d7de5c2@ventanamicro.com>
Date: Thu, 29 Jun 2023 19:04:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 11/20] target/riscv/cpu: add misa_ext_info_arr[]
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, philmd@linaro.org
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
 <20230628213033.170315-12-dbarboza@ventanamicro.com>
 <20230629-6a932f8d5f71fefc9afbd974@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230629-6a932f8d5f71fefc9afbd974@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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

Drew,

On 6/29/23 05:59, Andrew Jones wrote:
> On Wed, Jun 28, 2023 at 06:30:24PM -0300, Daniel Henrique Barboza wrote:
>> Next patch will add KVM specific user properties for both MISA and
>> multi-letter extensions. For MISA extensions we want to make use of what
>> is already available in misa_ext_cfgs[] to avoid code repetition.
>>
>> misa_ext_info_arr[] array will hold name and description for each MISA
>> extension that misa_ext_cfgs[] is declaring. We'll then use this new
>> array in KVM code to avoid duplicating strings.
>>
>> There's nothing holding us back from doing the same with multi-letter
>> extensions. For now doing just with MISA extensions is enough.
>>
>> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 83 ++++++++++++++++++++++++++++++----------------
>>   target/riscv/cpu.h |  7 +++-
>>   2 files changed, 61 insertions(+), 29 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 2485e820f8..90dd2078ae 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1558,33 +1558,57 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>>       visit_type_bool(v, name, &value, errp);
>>   }
>>   
>> -static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
>> -    {.name = "a", .description = "Atomic instructions",
>> -     .misa_bit = RVA, .enabled = true},
>> -    {.name = "c", .description = "Compressed instructions",
>> -     .misa_bit = RVC, .enabled = true},
>> -    {.name = "d", .description = "Double-precision float point",
>> -     .misa_bit = RVD, .enabled = true},
>> -    {.name = "f", .description = "Single-precision float point",
>> -     .misa_bit = RVF, .enabled = true},
>> -    {.name = "i", .description = "Base integer instruction set",
>> -     .misa_bit = RVI, .enabled = true},
>> -    {.name = "e", .description = "Base integer instruction set (embedded)",
>> -     .misa_bit = RVE, .enabled = false},
>> -    {.name = "m", .description = "Integer multiplication and division",
>> -     .misa_bit = RVM, .enabled = true},
>> -    {.name = "s", .description = "Supervisor-level instructions",
>> -     .misa_bit = RVS, .enabled = true},
>> -    {.name = "u", .description = "User-level instructions",
>> -     .misa_bit = RVU, .enabled = true},
>> -    {.name = "h", .description = "Hypervisor",
>> -     .misa_bit = RVH, .enabled = true},
>> -    {.name = "x-j", .description = "Dynamic translated languages",
>> -     .misa_bit = RVJ, .enabled = false},
>> -    {.name = "v", .description = "Vector operations",
>> -     .misa_bit = RVV, .enabled = false},
>> -    {.name = "g", .description = "General purpose (IMAFD_Zicsr_Zifencei)",
>> -     .misa_bit = RVG, .enabled = false},
>> +typedef struct misa_ext_info {
>> +    const char *name;
>> +    const char *description;
>> +} MISAExtInfo;
>> +
>> +#define MISA_EXT_INFO(_idx, _propname, _descr) \
>> +    [(_idx - 'A')] = {.name = _propname, .description = _descr}
> 
> We don't have to give up on passing RV* to this macro. Directly
> using __builtin_ctz() with a constant should work, i.e.
> 
>   #define MISA_EXT_INFO(_bit, _propname, _descr) \
>       [__builtin_ctz(_bit)] = {.name = _propname, .description = _descr}
> 
> and then
> 
>   MISA_EXT_INFO(RVA, "a", "Atomic instructions"),
>   MISA_EXT_INFO(RVD, "d", "Double-precision float point"),
>   ...
> 
> (We don't need the ctz32() wrapper since we know we'll never input zero to
> __builtin_ctz().)

I run the series through gitlab because I got worried about this change in different
compilers and so on. And in fact I fear that we break 'clang-user' with it:

https://gitlab.com/danielhb/qemu/-/jobs/4569265199

u.c.o -c ../target/riscv/cpu.c
../target/riscv/cpu.c:1624:5: error: initializer element is not a compile-time constant
     MISA_CFG(RVA, true),
     ^~~~~~~~~~~~~~~~~~~
../target/riscv/cpu.c:1619:53: note: expanded from macro 'MISA_CFG'
     {.name = misa_ext_info_arr[MISA_INFO_IDX(_bit)].name, \
              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
1 error generated.
[1503/2619] Compiling C object libqemu-ppc64le-linux-user.fa.p/linux-user_syscall.c.o


Which is a shame because gcc and everyone else is okay with it, but 'clang-user' and
'tsan-build' runners are complaining about it.

Unless there's a directive to make clang accept this code (I didn't find any) we'll
need to keep updating name and description during runtime, and we'll have to keep
removing 'const' from misa_ext_cfgs[].


Thanks,


Daniel


> 
>> +
>> +static const MISAExtInfo misa_ext_info_arr[] = {
>> +    MISA_EXT_INFO('A', "a", "Atomic instructions"),
>> +    MISA_EXT_INFO('C', "c", "Compressed instructions"),
>> +    MISA_EXT_INFO('D', "d", "Double-precision float point"),
>> +    MISA_EXT_INFO('F', "f", "Single-precision float point"),
>> +    MISA_EXT_INFO('I', "i", "Base integer instruction set"),
>> +    MISA_EXT_INFO('E', "e", "Base integer instruction set (embedded)"),
>> +    MISA_EXT_INFO('M', "m", "Integer multiplication and division"),
>> +    MISA_EXT_INFO('S', "s", "Supervisor-level instructions"),
>> +    MISA_EXT_INFO('U', "u", "User-level instructions"),
>> +    MISA_EXT_INFO('H', "h", "Hypervisor"),
>> +    MISA_EXT_INFO('J', "x-j", "Dynamic translated languages"),
>> +    MISA_EXT_INFO('V', "v", "Vector operations"),
>> +    MISA_EXT_INFO('G', "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
>> +};
>> +
>> +const char *riscv_get_misa_ext_name(uint32_t bit)
>> +{
>> +    return misa_ext_info_arr[ctz32(bit)].name;
>> +}
>> +
>> +const char *riscv_get_misa_ext_descr(uint32_t bit)
> 
> nit: I'd prefer riscv_get_misa_ext_description() for the name.
> 
>> +{
>> +    return misa_ext_info_arr[ctz32(bit)].description;
>> +}
>> +
>> +#define MISA_CFG(_bit, _enabled) \
>> +    {.misa_bit = _bit, .enabled = _enabled}
>> +
>> +static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
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
>>   };
>>   
>>   static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>> @@ -1592,7 +1616,10 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>>       int i;
>>   
>>       for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
>> -        const RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
>> +        RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
>> +
>> +        misa_cfg->name = riscv_get_misa_ext_name(misa_cfg->misa_bit);
>> +        misa_cfg->description = riscv_get_misa_ext_descr(misa_cfg->misa_bit);
> 
> This might be necessary for the KVM side, but we should be able to avoid
> this runtime setting here where the compiler can be certain everything is
> a constant. We just need the old MISA_CFG() back, slightly tweaked to use
> __builtin_ctz().
> 
>>   
>>           object_property_add(cpu_obj, misa_cfg->name, "bool",
>>                               cpu_get_misa_ext_cfg,
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index cc20ee25a7..acae118b9b 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -41,7 +41,10 @@
>>   
>>   #define RV(x) ((target_ulong)1 << (x - 'A'))
>>   
>> -/* Consider updating misa_ext_cfgs[] when adding new MISA bits here */
>> +/*
>> + * Consider updating misa_ext_info_arr[] and misa_ext_cfgs[]
>> + * when adding new MISA bits here.
>> + */
>>   #define RVI RV('I')
>>   #define RVE RV('E') /* E and I are mutually exclusive */
>>   #define RVM RV('M')
>> @@ -56,6 +59,8 @@
>>   #define RVJ RV('J')
>>   #define RVG RV('G')
>>   
>> +const char *riscv_get_misa_ext_name(uint32_t bit);
>> +const char *riscv_get_misa_ext_descr(uint32_t bit);
>>   
>>   /* Privileged specification version */
>>   enum {
>> -- 
>> 2.41.0
>>
> 
> Thanks,
> drew

