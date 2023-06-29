Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D4DEB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 07:26:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEm2p-00056W-Tu; Thu, 29 Jun 2023 03:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEm2n-00056B-TO
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 03:26:22 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEm2l-0000lS-T6
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 03:26:21 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fb8574a3a1so549336e87.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 00:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688023576; x=1690615576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PO1GM1pxnPAQQKnzudxw5zwsMO8K0Q4X03az0rUwhx0=;
 b=D+VT5yAARFsMDUbByuDieKlqVbGV55Kt4uVHrxlyEbpQ7Cpabi1i4eG2aUTHX7A1p9
 YTdtQWXhPZzk5+vT2RWFbRXGWjWo7Phhhf+lto9dxmuYgUOtTBHBYI8zdOx3+FuIOSrh
 Y6dPn6XANuU5/Fvalo4N4pbwS67UxnzEPOjqCUWWNdMvzswpEzBJsdTC8nrqNzuAB1So
 Jwaciz2DgJLqJlDC1lNjqBeRarf4pya/NlOgsR4GijYAdaVqb52nGuLUVVwiIcIRuULX
 InL3ebC2A+12MCAz/OHhxOLTROFsGHwG2tUHoekHqR8psRlaV1+FTI8QoNdLLfSgaDcF
 +EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688023576; x=1690615576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PO1GM1pxnPAQQKnzudxw5zwsMO8K0Q4X03az0rUwhx0=;
 b=Sm1/3MfckYRMgTUsMT2WJLPysryJ/dFrJLKlwqxqXL5R+OF5YkP/ehLKa73Y8/WHhf
 RzzcsduvdseVvdV32BBSOgGfX491oSXFiI/0y6N2weVYjvS/SHbW70yEItOuS17OBZxS
 G9fJFsuZ5IkAAoS43VZXY703eFi0E2+8raXrPG7p3QoxnSRguoxBzkva+eUrL7+Yo7bW
 VfmMLumx9aZte1Nf/cVqincrCXMpKnbldEcHYDdN1qaxUxBR8nyteHUwCSYhJ+bb5543
 dvrHHjmvWRsxAHdQZjM/qZbxOsXyGSo/MNM2UwdYMKCZumCyqYlYwdHb0qvmrKzIwO/S
 L8yw==
X-Gm-Message-State: AC+VfDxZbCbdO1P9aNUG+L4x/1bjFY5MkM2KDPFWYvX8h9Aq03/+vpzl
 GAGubTByIIHGqkrlMQHQZDgD2YqqsvwwoHzEfFc=
X-Google-Smtp-Source: ACHHUZ7bHdKQI8JyOzOCHj71oIPrrIgTGfnP0b83qiTVFsjZdg6Rmu4IPrOYa4ddc9ww3p9k5M0ucw==
X-Received: by 2002:a05:6512:2527:b0:4fa:a217:1e76 with SMTP id
 be39-20020a056512252700b004faa2171e76mr9210097lfb.9.1688023575828; 
 Thu, 29 Jun 2023 00:26:15 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.166.242])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a5d50cd000000b0030647d1f34bsm15368247wrt.1.2023.06.29.00.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 00:26:15 -0700 (PDT)
Message-ID: <053d4c93-6501-257c-5473-3de78d5635b5@linaro.org>
Date: Thu, 29 Jun 2023 09:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v6 11/20] target/riscv/cpu: add misa_ext_info_arr[]
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
 <20230628213033.170315-12-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230628213033.170315-12-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 28/6/23 23:30, Daniel Henrique Barboza wrote:
> Next patch will add KVM specific user properties for both MISA and
> multi-letter extensions. For MISA extensions we want to make use of what
> is already available in misa_ext_cfgs[] to avoid code repetition.
> 
> misa_ext_info_arr[] array will hold name and description for each MISA
> extension that misa_ext_cfgs[] is declaring. We'll then use this new
> array in KVM code to avoid duplicating strings.
> 
> There's nothing holding us back from doing the same with multi-letter
> extensions. For now doing just with MISA extensions is enough.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 83 ++++++++++++++++++++++++++++++----------------
>   target/riscv/cpu.h |  7 +++-
>   2 files changed, 61 insertions(+), 29 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2485e820f8..90dd2078ae 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1558,33 +1558,57 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>       visit_type_bool(v, name, &value, errp);
>   }
>   
> -static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
> -    {.name = "a", .description = "Atomic instructions",
> -     .misa_bit = RVA, .enabled = true},
> -    {.name = "c", .description = "Compressed instructions",
> -     .misa_bit = RVC, .enabled = true},
> -    {.name = "d", .description = "Double-precision float point",
> -     .misa_bit = RVD, .enabled = true},
> -    {.name = "f", .description = "Single-precision float point",
> -     .misa_bit = RVF, .enabled = true},
> -    {.name = "i", .description = "Base integer instruction set",
> -     .misa_bit = RVI, .enabled = true},
> -    {.name = "e", .description = "Base integer instruction set (embedded)",
> -     .misa_bit = RVE, .enabled = false},
> -    {.name = "m", .description = "Integer multiplication and division",
> -     .misa_bit = RVM, .enabled = true},
> -    {.name = "s", .description = "Supervisor-level instructions",
> -     .misa_bit = RVS, .enabled = true},
> -    {.name = "u", .description = "User-level instructions",
> -     .misa_bit = RVU, .enabled = true},
> -    {.name = "h", .description = "Hypervisor",
> -     .misa_bit = RVH, .enabled = true},
> -    {.name = "x-j", .description = "Dynamic translated languages",
> -     .misa_bit = RVJ, .enabled = false},
> -    {.name = "v", .description = "Vector operations",
> -     .misa_bit = RVV, .enabled = false},
> -    {.name = "g", .description = "General purpose (IMAFD_Zicsr_Zifencei)",
> -     .misa_bit = RVG, .enabled = false},
> +typedef struct misa_ext_info {
> +    const char *name;
> +    const char *description;
> +} MISAExtInfo;
> +
> +#define MISA_EXT_INFO(_idx, _propname, _descr) \
> +    [(_idx - 'A')] = {.name = _propname, .description = _descr}
> +
> +static const MISAExtInfo misa_ext_info_arr[] = {
> +    MISA_EXT_INFO('A', "a", "Atomic instructions"),
> +    MISA_EXT_INFO('C', "c", "Compressed instructions"),
> +    MISA_EXT_INFO('D', "d", "Double-precision float point"),
> +    MISA_EXT_INFO('F', "f", "Single-precision float point"),
> +    MISA_EXT_INFO('I', "i", "Base integer instruction set"),
> +    MISA_EXT_INFO('E', "e", "Base integer instruction set (embedded)"),
> +    MISA_EXT_INFO('M', "m", "Integer multiplication and division"),
> +    MISA_EXT_INFO('S', "s", "Supervisor-level instructions"),
> +    MISA_EXT_INFO('U', "u", "User-level instructions"),
> +    MISA_EXT_INFO('H', "h", "Hypervisor"),
> +    MISA_EXT_INFO('J', "x-j", "Dynamic translated languages"),
> +    MISA_EXT_INFO('V', "v", "Vector operations"),
> +    MISA_EXT_INFO('G', "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
> +};
> +
> +const char *riscv_get_misa_ext_name(uint32_t bit)
> +{

Is that OK to return NULL, or should we assert for
unimplemented bit/feature?

> +    return misa_ext_info_arr[ctz32(bit)].name;
> +}
> +
> +const char *riscv_get_misa_ext_descr(uint32_t bit)
> +{
> +    return misa_ext_info_arr[ctz32(bit)].description;

Ditto.

> +}
> +
> +#define MISA_CFG(_bit, _enabled) \
> +    {.misa_bit = _bit, .enabled = _enabled}
> +
> +static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {

'const'

> +    MISA_CFG(RVA, true),
> +    MISA_CFG(RVC, true),
> +    MISA_CFG(RVD, true),
> +    MISA_CFG(RVF, true),
> +    MISA_CFG(RVI, true),
> +    MISA_CFG(RVE, false),
> +    MISA_CFG(RVM, true),
> +    MISA_CFG(RVS, true),
> +    MISA_CFG(RVU, true),
> +    MISA_CFG(RVH, true),
> +    MISA_CFG(RVJ, false),
> +    MISA_CFG(RVV, false),
> +    MISA_CFG(RVG, false),
>   };
>   
>   static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> @@ -1592,7 +1616,10 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>       int i;
>   
>       for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
> -        const RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
> +        RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];

const

> +
> +        misa_cfg->name = riscv_get_misa_ext_name(misa_cfg->misa_bit);
> +        misa_cfg->description = riscv_get_misa_ext_descr(misa_cfg->misa_bit);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


