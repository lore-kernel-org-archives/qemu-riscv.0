Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF88EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 11:37:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEpx3-0001nv-0x; Thu, 29 Jun 2023 07:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEpx1-0001nI-9u
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 07:36:39 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEpwz-00047X-Bb
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 07:36:39 -0400
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-39eab4bcee8so389862b6e.0
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 04:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688038596; x=1690630596;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cKJECIjJSvuaP+QK1f4KeShINHti2qIjm+JtIQLBuO0=;
 b=OvjrFn+UnnmLo8ju0dr5cvJ/2Nag7rErUzPI7dhVxbVBruuRrmUD6YGKup0gHKBvTw
 7a1Zcvqb5Hqk0R90ZQcySxyPBTSKBIrmDYTgazsp6HQq3hJFuiffpKnunRd20SozQiqL
 M7mC9wEeXD+7eGmG4E9GMRW1akQ5IF257uCNxbMhvvIB5EyfZA8O5Za1HB1VaI3L1G/U
 +80yT3oSdxW6DRrk3X8bmeir/Bg+jjy1FNYOZfpTX/GJ9J4DhbxUhXAKVDjY38+kHKRu
 +izsei9p4h28URPkdDIFErCEbzxf8fYgBrIHNCo5rNTTannqMPXNV/sc2MDQpPW3iDcB
 923A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688038596; x=1690630596;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cKJECIjJSvuaP+QK1f4KeShINHti2qIjm+JtIQLBuO0=;
 b=jXWhmhy4oHCfr6sq5RTKkdY+884A868jExIE1QyEhCUs/WYwmbCZVi6TGWKfbFcYPO
 WRbgQcf8rp4JM/NGKxhboF1qlFna+oWkbwh31fWGPmm8e8g2AsCniTHkMXj9zo/3IWNH
 gYF/EDKLlIWyEBrqpA4FFrL3M+XNjdxwrpwx5PXHPLgOB7aHoYSfF5qByt0KEZLh74ld
 zblftVWjaOUmpTXUrYA1rCXBEHz/hYVrVQf43YU1d7aWSA0NjJ5i6QQ+vBUB4eBYz2/u
 M4Krx+32PxfeWjb5IytmBuDEmXH8zfFC0zmoKosVS+y74PvLt52E5rdkprVhFbnGAe7o
 nyJA==
X-Gm-Message-State: AC+VfDxEIGaaJkHhKuk+Tjd0SlUi+MyxAvfa2q0KwsgX1Fv0IIlZAaGZ
 s6190Ebvc/w37H/BDW06sYei0w==
X-Google-Smtp-Source: ACHHUZ4ziSb23P3NR65ybExWISzWRj+NDzr/A+uguclOhxTiHp/+t5OWTCqU0XmA/gNcHoVPzvW69Q==
X-Received: by 2002:a05:6808:bd4:b0:3a0:3161:ee2f with SMTP id
 o20-20020a0568080bd400b003a03161ee2fmr34688511oik.57.1688038596042; 
 Thu, 29 Jun 2023 04:36:36 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59?
 ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a544386000000b003a36382d006sm1694433oiv.13.2023.06.29.04.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 04:36:35 -0700 (PDT)
Message-ID: <ff4ccd13-2dfe-ce52-3528-d302578e1fed@ventanamicro.com>
Date: Thu, 29 Jun 2023 08:36:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 11/20] target/riscv/cpu: add misa_ext_info_arr[]
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
 <20230628213033.170315-12-dbarboza@ventanamicro.com>
 <053d4c93-6501-257c-5473-3de78d5635b5@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <053d4c93-6501-257c-5473-3de78d5635b5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
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



On 6/29/23 04:26, Philippe Mathieu-Daudé wrote:
> On 28/6/23 23:30, Daniel Henrique Barboza wrote:
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
>>   target/riscv/cpu.c | 83 ++++++++++++++++++++++++++++++----------------
>>   target/riscv/cpu.h |  7 +++-
>>   2 files changed, 61 insertions(+), 29 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 2485e820f8..90dd2078ae 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1558,33 +1558,57 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>>       visit_type_bool(v, name, &value, errp);
>>   }
>> -static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
>> -    {.name = "a", .description = "Atomic instructions",
>> -     .misa_bit = RVA, .enabled = true},
>> -    {.name = "c", .description = "Compressed instructions",
>> -     .misa_bit = RVC, .enabled = true},
>> -    {.name = "d", .description = "Double-precision float point",
>> -     .misa_bit = RVD, .enabled = true},
>> -    {.name = "f", .description = "Single-precision float point",
>> -     .misa_bit = RVF, .enabled = true},
>> -    {.name = "i", .description = "Base integer instruction set",
>> -     .misa_bit = RVI, .enabled = true},
>> -    {.name = "e", .description = "Base integer instruction set (embedded)",
>> -     .misa_bit = RVE, .enabled = false},
>> -    {.name = "m", .description = "Integer multiplication and division",
>> -     .misa_bit = RVM, .enabled = true},
>> -    {.name = "s", .description = "Supervisor-level instructions",
>> -     .misa_bit = RVS, .enabled = true},
>> -    {.name = "u", .description = "User-level instructions",
>> -     .misa_bit = RVU, .enabled = true},
>> -    {.name = "h", .description = "Hypervisor",
>> -     .misa_bit = RVH, .enabled = true},
>> -    {.name = "x-j", .description = "Dynamic translated languages",
>> -     .misa_bit = RVJ, .enabled = false},
>> -    {.name = "v", .description = "Vector operations",
>> -     .misa_bit = RVV, .enabled = false},
>> -    {.name = "g", .description = "General purpose (IMAFD_Zicsr_Zifencei)",
>> -     .misa_bit = RVG, .enabled = false},
>> +typedef struct misa_ext_info {
>> +    const char *name;
>> +    const char *description;
>> +} MISAExtInfo;
>> +
>> +#define MISA_EXT_INFO(_idx, _propname, _descr) \
>> +    [(_idx - 'A')] = {.name = _propname, .description = _descr}
>> +
>> +static const MISAExtInfo misa_ext_info_arr[] = {
>> +    MISA_EXT_INFO('A', "a", "Atomic instructions"),
>> +    MISA_EXT_INFO('C', "c", "Compressed instructions"),
>> +    MISA_EXT_INFO('D', "d", "Double-precision float point"),
>> +    MISA_EXT_INFO('F', "f", "Single-precision float point"),
>> +    MISA_EXT_INFO('I', "i", "Base integer instruction set"),
>> +    MISA_EXT_INFO('E', "e", "Base integer instruction set (embedded)"),
>> +    MISA_EXT_INFO('M', "m", "Integer multiplication and division"),
>> +    MISA_EXT_INFO('S', "s", "Supervisor-level instructions"),
>> +    MISA_EXT_INFO('U', "u", "User-level instructions"),
>> +    MISA_EXT_INFO('H', "h", "Hypervisor"),
>> +    MISA_EXT_INFO('J', "x-j", "Dynamic translated languages"),
>> +    MISA_EXT_INFO('V', "v", "Vector operations"),
>> +    MISA_EXT_INFO('G', "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
>> +};
>> +
>> +const char *riscv_get_misa_ext_name(uint32_t bit)
>> +{
> 
> Is that OK to return NULL, or should we assert for
> unimplemented bit/feature?
> 
>> +    return misa_ext_info_arr[ctz32(bit)].name;
>> +}
>> +
>> +const char *riscv_get_misa_ext_descr(uint32_t bit)
>> +{
>> +    return misa_ext_info_arr[ctz32(bit)].description;
> 
> Ditto.
> 
>> +}
>> +
>> +#define MISA_CFG(_bit, _enabled) \
>> +    {.misa_bit = _bit, .enabled = _enabled}
>> +
>> +static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
> 
> 'const'

Not sure why I got rid of 'const' here. I'll reintroduce it.


Daniel

> 
>> +    MISA_CFG(RVA, true),
>> +    MISA_CFG(RVC, true),
>> +    MISA_CFG(RVD, true),
>> +    MISA_CFG(RVF, true),
>> +    MISA_CFG(RVI, true),
>> +    MISA_CFG(RVE, false),
>> +    MISA_CFG(RVM, true),
>> +    MISA_CFG(RVS, true),
>> +    MISA_CFG(RVU, true),
>> +    MISA_CFG(RVH, true),
>> +    MISA_CFG(RVJ, false),
>> +    MISA_CFG(RVV, false),
>> +    MISA_CFG(RVG, false),
>>   };
>>   static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>> @@ -1592,7 +1616,10 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>>       int i;
>>       for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
>> -        const RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
>> +        RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
> 
> const
> 
>> +
>> +        misa_cfg->name = riscv_get_misa_ext_name(misa_cfg->misa_bit);
>> +        misa_cfg->description = riscv_get_misa_ext_descr(misa_cfg->misa_bit);
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

