Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E17BEB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 11:44:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEq4E-0004Ly-Il; Thu, 29 Jun 2023 07:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEq49-0004Ke-9v
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 07:44:02 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEq45-0006Me-9N
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 07:44:00 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6b74faaac3bso480175a34.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 04:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688039035; x=1690631035;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BzJ4onS5qWK8tOLGFk2qneVAUPyHwIXqCYkytit7om0=;
 b=W4MaHGaBz6taubP05CAwQdFSn0QWFnVbVKY+kZaLyXhdRhDiA8t+SRQV9bKpCwiSM/
 A0ufGny/bb+IFXSC+HCBBPanGj5dWtRUHrYNSoThFuYaNKAyuve4QA7lt2sbR4ATJZkg
 NzdmW+Z47gvfm+zDtnycuyitJKlAXsl1zrsaPHwb+QDEAlFtCt02KCnOWsW7TpuWiE5X
 teGiB9vuf9Z+GnmIn/pl2D+lRUZw3ovljL6w58tdX7xLRxkun0WxatRbFXNWW01p3nES
 MdOv2KsagV/jEGvxDO3bR5uNdQ+d2J/q+Ssz4swaYIJ9b3Gfz9Y70AWKqx0CeiQnZOLx
 n7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688039035; x=1690631035;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BzJ4onS5qWK8tOLGFk2qneVAUPyHwIXqCYkytit7om0=;
 b=Qjep6WM3hBdodeqr0XeN54rMK1tVqg5lOPx4I+aLz/1Z13Y8ISWc9mZ7uC2pB1Vz98
 GO3kmHBYpeTmM6D6ocdqDl9RpYEhJImJP122Q4unMP+/BF/jkXImWVQW+HmUZrZqhlQH
 9k1o767JqdqUps6HrNF5xLf2c7+gjNpAf7UxM2tLtixBVD73LodzIBQse0XfI/0w6owG
 B+a7lt3el5ngA+2Ki9Pemt9MdGUSm1UVt35/3OQtZt2FWVGrcO3HYg1qlPe0FIV2G6C8
 4ZoKfJ5ZlBCM7hzCTCqxi+63yQU9Eppu7c6rmy6SfOrBo4vgBDLtXKXIeywUzdRp73o4
 fJZA==
X-Gm-Message-State: AC+VfDwIjfi32CGZkKzEaDwfC9QkHm92Xipt1nYzs1jycDhukzZBJGxN
 FhB0ITpfUuv7KpqvFcCW+0zYNA==
X-Google-Smtp-Source: ACHHUZ6VVxE9wcVIL1ZDoHQiT15ovUonSYsUF8urTNNhTDJb0TTQrNm+uoPW0vUvuANr8vvb7ZkFgg==
X-Received: by 2002:a05:6830:3:b0:6b8:85c4:2390 with SMTP id
 c3-20020a056830000300b006b885c42390mr3278742otp.25.1688039035526; 
 Thu, 29 Jun 2023 04:43:55 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59?
 ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a9d6c17000000b006b74bea76c0sm4024248otq.47.2023.06.29.04.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 04:43:54 -0700 (PDT)
Message-ID: <c6a4c7d6-881e-50a2-0eb8-3b6b411c4a91@ventanamicro.com>
Date: Thu, 29 Jun 2023 08:43:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 11/20] target/riscv/cpu: add misa_ext_info_arr[]
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
 <20230628213033.170315-12-dbarboza@ventanamicro.com>
 <053d4c93-6501-257c-5473-3de78d5635b5@linaro.org>
 <ff4ccd13-2dfe-ce52-3528-d302578e1fed@ventanamicro.com>
In-Reply-To: <ff4ccd13-2dfe-ce52-3528-d302578e1fed@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
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



On 6/29/23 08:36, Daniel Henrique Barboza wrote:
> 
> 
> On 6/29/23 04:26, Philippe Mathieu-Daudé wrote:
>> On 28/6/23 23:30, Daniel Henrique Barboza wrote:
>>> Next patch will add KVM specific user properties for both MISA and
>>> multi-letter extensions. For MISA extensions we want to make use of what
>>> is already available in misa_ext_cfgs[] to avoid code repetition.
>>>
>>> misa_ext_info_arr[] array will hold name and description for each MISA
>>> extension that misa_ext_cfgs[] is declaring. We'll then use this new
>>> array in KVM code to avoid duplicating strings.
>>>
>>> There's nothing holding us back from doing the same with multi-letter
>>> extensions. For now doing just with MISA extensions is enough.
>>>
>>> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> ---
>>>   target/riscv/cpu.c | 83 ++++++++++++++++++++++++++++++----------------
>>>   target/riscv/cpu.h |  7 +++-
>>>   2 files changed, 61 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index 2485e820f8..90dd2078ae 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -1558,33 +1558,57 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>>>       visit_type_bool(v, name, &value, errp);
>>>   }
>>> -static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
>>> -    {.name = "a", .description = "Atomic instructions",
>>> -     .misa_bit = RVA, .enabled = true},
>>> -    {.name = "c", .description = "Compressed instructions",
>>> -     .misa_bit = RVC, .enabled = true},
>>> -    {.name = "d", .description = "Double-precision float point",
>>> -     .misa_bit = RVD, .enabled = true},
>>> -    {.name = "f", .description = "Single-precision float point",
>>> -     .misa_bit = RVF, .enabled = true},
>>> -    {.name = "i", .description = "Base integer instruction set",
>>> -     .misa_bit = RVI, .enabled = true},
>>> -    {.name = "e", .description = "Base integer instruction set (embedded)",
>>> -     .misa_bit = RVE, .enabled = false},
>>> -    {.name = "m", .description = "Integer multiplication and division",
>>> -     .misa_bit = RVM, .enabled = true},
>>> -    {.name = "s", .description = "Supervisor-level instructions",
>>> -     .misa_bit = RVS, .enabled = true},
>>> -    {.name = "u", .description = "User-level instructions",
>>> -     .misa_bit = RVU, .enabled = true},
>>> -    {.name = "h", .description = "Hypervisor",
>>> -     .misa_bit = RVH, .enabled = true},
>>> -    {.name = "x-j", .description = "Dynamic translated languages",
>>> -     .misa_bit = RVJ, .enabled = false},
>>> -    {.name = "v", .description = "Vector operations",
>>> -     .misa_bit = RVV, .enabled = false},
>>> -    {.name = "g", .description = "General purpose (IMAFD_Zicsr_Zifencei)",
>>> -     .misa_bit = RVG, .enabled = false},
>>> +typedef struct misa_ext_info {
>>> +    const char *name;
>>> +    const char *description;
>>> +} MISAExtInfo;
>>> +
>>> +#define MISA_EXT_INFO(_idx, _propname, _descr) \
>>> +    [(_idx - 'A')] = {.name = _propname, .description = _descr}
>>> +
>>> +static const MISAExtInfo misa_ext_info_arr[] = {
>>> +    MISA_EXT_INFO('A', "a", "Atomic instructions"),
>>> +    MISA_EXT_INFO('C', "c", "Compressed instructions"),
>>> +    MISA_EXT_INFO('D', "d", "Double-precision float point"),
>>> +    MISA_EXT_INFO('F', "f", "Single-precision float point"),
>>> +    MISA_EXT_INFO('I', "i", "Base integer instruction set"),
>>> +    MISA_EXT_INFO('E', "e", "Base integer instruction set (embedded)"),
>>> +    MISA_EXT_INFO('M', "m", "Integer multiplication and division"),
>>> +    MISA_EXT_INFO('S', "s", "Supervisor-level instructions"),
>>> +    MISA_EXT_INFO('U', "u", "User-level instructions"),
>>> +    MISA_EXT_INFO('H', "h", "Hypervisor"),
>>> +    MISA_EXT_INFO('J', "x-j", "Dynamic translated languages"),
>>> +    MISA_EXT_INFO('V', "v", "Vector operations"),
>>> +    MISA_EXT_INFO('G', "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
>>> +};
>>> +
>>> +const char *riscv_get_misa_ext_name(uint32_t bit)
>>> +{
>>
>> Is that OK to return NULL, or should we assert for
>> unimplemented bit/feature?

It's easier to assert out if name or description is NULL (meaning that we don't
implement the bit).


>>
>>> +    return misa_ext_info_arr[ctz32(bit)].name;
>>> +}
>>> +
>>> +const char *riscv_get_misa_ext_descr(uint32_t bit)
>>> +{
>>> +    return misa_ext_info_arr[ctz32(bit)].description;
>>
>> Ditto.
>>
>>> +}
>>> +
>>> +#define MISA_CFG(_bit, _enabled) \
>>> +    {.misa_bit = _bit, .enabled = _enabled}
>>> +
>>> +static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
>>
>> 'const'
> 
> Not sure why I got rid of 'const' here. I'll reintroduce it.

Just remembered why. 'name' and 'description' are being initialized during runtime, so
the array can't be 'const'.

If we managed to init everything in the macro like Drew suggested we can keep it 'const'.


Daniel

> 
> 
> Daniel
> 
>>
>>> +    MISA_CFG(RVA, true),
>>> +    MISA_CFG(RVC, true),
>>> +    MISA_CFG(RVD, true),
>>> +    MISA_CFG(RVF, true),
>>> +    MISA_CFG(RVI, true),
>>> +    MISA_CFG(RVE, false),
>>> +    MISA_CFG(RVM, true),
>>> +    MISA_CFG(RVS, true),
>>> +    MISA_CFG(RVU, true),
>>> +    MISA_CFG(RVH, true),
>>> +    MISA_CFG(RVJ, false),
>>> +    MISA_CFG(RVV, false),
>>> +    MISA_CFG(RVG, false),
>>>   };
>>>   static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>>> @@ -1592,7 +1616,10 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>>>       int i;
>>>       for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
>>> -        const RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
>>> +        RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
>>
>> const
>>
>>> +
>>> +        misa_cfg->name = riscv_get_misa_ext_name(misa_cfg->misa_bit);
>>> +        misa_cfg->description = riscv_get_misa_ext_descr(misa_cfg->misa_bit);
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>

