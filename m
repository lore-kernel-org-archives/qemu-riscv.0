Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956E4C77B75
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 May 2023 14:35:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwOQp-00012M-LQ; Tue, 09 May 2023 10:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOQk-0000mN-Aw
 for qemu-riscv@nongnu.org; Tue, 09 May 2023 10:35:08 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOQW-0007G8-41
 for qemu-riscv@nongnu.org; Tue, 09 May 2023 10:35:05 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f42ba32e24so5992015e9.3
 for <qemu-riscv@nongnu.org>; Tue, 09 May 2023 07:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683642890; x=1686234890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ReCPLA1EOBdJoeJw4nq9AIxw9vdM7f4bdm8v5Cas8T8=;
 b=Z2PDryeiX086oPYPKZ2YnNHvl8Fdzk9pW0kQ3p8eJVEXowlyvnRq/CGoSVsICn0zGu
 XPF3CjKzs1bLWP26Th/1yLkIpxQ3Sb29Ri+kLke5PVYfq7OfVQgynbeOCKN77MUsHPY5
 JVxM+1EDkf6dpgkmCwZIWja4vczxjDPxC7nIdrUZkY9++utUkB8IWuU9isxg/HrXHBLG
 XSSalCwRtslpKicc52BgvscBo78KL8xAeqH7BG+4ZfteXSluplR7smJ207Q5ZtYTTk5s
 PoM2qvIaberA7ZpxZ7Hy06SQIWRX2AIPv8kWI2RRYIikpUdb8lukcuILIFBL4S8mjBoo
 dz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642890; x=1686234890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ReCPLA1EOBdJoeJw4nq9AIxw9vdM7f4bdm8v5Cas8T8=;
 b=bC9XYm89NBwHbZJkJH++yd31kiT9IyhqufUQ+CfLIz1UVU5dgqEyfVU8JlTbctLaTd
 TmRJfADBYP1E/P/DBeATIzj0/hoflcHxtRyn0wEtavsK4UYxcp/EtswSZwU8wsBvU5S/
 uLnSiZ6INIb1uutGLTj8RSQTXc6ava5zbuS7X7U9lIO/YiAivkZqQ0K0gVt9EpRSFlGA
 jQddG+KekidUFVnH/uVObwtKyzDmIrtTUSFvxuT2vkCDo8RMcXTv2YHhuMn6/yAkSWhI
 6HMBZy61uS5vVsdeB38ggmeLF4Kpdg/n/UDo/vpDPUn75eBkBwiHxRnP/TWWV+RExUM6
 WIJw==
X-Gm-Message-State: AC+VfDx75qpnTzauc4leaYXVL3Z4s30h17+EGDTvM5vN2s+0YU3eBmTQ
 AXhSP+8Dty1VeB+3vnOe2mShcw==
X-Google-Smtp-Source: ACHHUZ6vMfJWAZ3ih3mo9/+liNFDUmjFJVADm93XA8StE7gMfiPC52wYtm0yrqdUGxrizmi/ShanWw==
X-Received: by 2002:a5d:534e:0:b0:306:791:24a9 with SMTP id
 t14-20020a5d534e000000b00306079124a9mr9343952wrv.0.1683642890512; 
 Tue, 09 May 2023 07:34:50 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y12-20020adffa4c000000b00306281cfa59sm14575279wrr.47.2023.05.09.07.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 07:34:50 -0700 (PDT)
Message-ID: <3fb8f451-b6fa-ac19-18f0-436c5bd0c732@linaro.org>
Date: Tue, 9 May 2023 15:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 30/57] tcg/sparc64: Allocate %g2 as a third temporary
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-31-richard.henderson@linaro.org>
 <CAFEAcA9dOpZUeCnkHxmSAPTs20ZuUW++kFEtp2icmmST=yGPvA@mail.gmail.com>
 <58a0667e-7387-4231-85d4-548a39c8064f@linaro.org>
 <CAFEAcA8h-+U8MW1b1QfyoX=vjZdMLi4EcjgsARNb4AKpn35sgw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8h-+U8MW1b1QfyoX=vjZdMLi4EcjgsARNb4AKpn35sgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/9/23 10:24, Peter Maydell wrote:
> On Mon, 8 May 2023 at 16:17, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 5/5/23 13:19, Peter Maydell wrote:
>>> On Wed, 3 May 2023 at 08:17, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>>    tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
>>>>    1 file changed, 7 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
>>>> index e997db2645..64464ab363 100644
>>>> --- a/tcg/sparc64/tcg-target.c.inc
>>>> +++ b/tcg/sparc64/tcg-target.c.inc
>>>> @@ -83,9 +83,10 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
>>>>    #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
>>>>    #define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
>>>>
>>>> -/* Define some temporary registers.  T2 is used for constant generation.  */
>>>> +/* Define some temporary registers.  T3 is used for constant generation.  */
>>>>    #define TCG_REG_T1  TCG_REG_G1
>>>> -#define TCG_REG_T2  TCG_REG_O7
>>>> +#define TCG_REG_T2  TCG_REG_G2
>>>> +#define TCG_REG_T3  TCG_REG_O7
>>>>
>>>>    #ifndef CONFIG_SOFTMMU
>>>>    # define TCG_GUEST_BASE_REG TCG_REG_I5
>>>> @@ -110,7 +111,6 @@ static const int tcg_target_reg_alloc_order[] = {
>>>>        TCG_REG_I4,
>>>>        TCG_REG_I5,
>>>>
>>>> -    TCG_REG_G2,
>>>>        TCG_REG_G3,
>>>>        TCG_REG_G4,
>>>>        TCG_REG_G5,
>>>> @@ -492,8 +492,8 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
>>>>    static void tcg_out_movi(TCGContext *s, TCGType type,
>>>>                             TCGReg ret, tcg_target_long arg)
>>>>    {
>>>> -    tcg_debug_assert(ret != TCG_REG_T2);
>>>> -    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
>>>> +    tcg_debug_assert(ret != TCG_REG_T3);
>>>> +    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T3);
>>>>    }
>>>
>>> Why do we need to change this usage of TCG_REG_T2 but not
>>> any of the others ?
>>
>> To match the comment above.
> 
> To expand, what I mean is "when I'm reviewing this patch, what
> do I need to know in order to know whether any particular
> instance of TCG_REG_T2 should be changed to _T3 or not?".
> All the sites where we *don't* change T2 to T3 are now
> using a different register, so there is presumably some
> logic for how we tell whether that's safe or not. The
> "no behaviour change" option would be to change all of them.

Oh.  Well, we could change none of them, including the comment, and also be correct. 
There is no conflict anywhere.

Only with patch 34 ("Use standard slow path for softmmu") do we first see all three temps 
in use at the same time.  Moreover, when I wrote this patch I thought there would in fact 
be a conflict with the use of tcg_out_movi within the slow path patch.  Then I found I 
needed to split out tcg_out_movi_s32 (patch 33) so that I could avoid the assert altogether.

Clearer?  Or not?


r~

