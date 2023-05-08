Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13128C77B7F
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 May 2023 15:17:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pw2by-0008HX-Ix; Mon, 08 May 2023 11:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw2bw-0008GO-Ck
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 11:17:12 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw2bt-0002HL-Gv
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 11:17:12 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ac831bb762so45122491fa.3
 for <qemu-riscv@nongnu.org>; Mon, 08 May 2023 08:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683559027; x=1686151027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UBbxJddLxcWqJBbg0WUFKGLzCWbsXg2xn1Tf7qITYxM=;
 b=pdRBLSwsXY+LQevvroYcXF0Cl3lYR5AvE7EwJTdg/9bQzIG62zuW01ctLyp2EmzWdk
 eXyxvKg2Of6sM1ikd80fUQOCcY8465dVe8Hm9ifMuTKfcu6IdhNDB0vGC4jrHhUUbhTm
 VVqq8p6fJWGJhUt+cJhM/eQ0hjOzAnSL3Y7XyHml+w1pU103L/FAhIJh8iUMIg4QB4hY
 vkQzZ8sjhv8LEeb6AxVOH4Uk9JpAwT5Wl1ioh3yxGBJrrSHL5OmQk7P5fN/oflaLp+eI
 OcgDLukewgvFtAdO26yRDBtZLcDRl8ChOZVdX83fQEoG2BJMPQn89dr3jpifKc7Cj2HV
 eRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683559027; x=1686151027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UBbxJddLxcWqJBbg0WUFKGLzCWbsXg2xn1Tf7qITYxM=;
 b=HvpBUYFinGIEYFlr4oZGrzoNmUiG/CaDIZgsfFpQ204MEOHJAuEDuBh7ywQERJImPT
 e17fUsp30sz950A0BRGRHQbOJAGkveMYJvlHCh1XaOFTGLfAX3tSbpa5j1oefZCQ73Pc
 GRUyfl5w0sv3cZXAwBg4+4+h42RHFKnipI8UaSI5mJ+b/McGtMEDkBwpeTs38QgP4FHB
 QIojjynioa9m6GDCnAAcaWrg3kAtq8yhpSJpTULL9/62cpjh7bSKBwgPWw8gZzFXVScj
 pJD5Nw7ao4SMCMWmdI7KutzOVJhmEQSPawzo3N1ZIpXZKdrqKlcS/PweGkTk1nxzAyzQ
 XURQ==
X-Gm-Message-State: AC+VfDxvtvGEBzx44s5LftfBWtZqada57I62JUjF35gkmGtLfc7gJcKV
 /Mz00hfcW1jwFWyiw3NiQrf2QA==
X-Google-Smtp-Source: ACHHUZ6Sdv6xQUEdMh6ABdMrHBpAs5inhD1+0crr+vovwn+WHXpptVJA/SVZCZkKIKncqPw8C71oOw==
X-Received: by 2002:a05:651c:112:b0:2a8:c8d8:80fe with SMTP id
 a18-20020a05651c011200b002a8c8d880femr2823560ljb.23.1683559027549; 
 Mon, 08 May 2023 08:17:07 -0700 (PDT)
Received: from [192.168.110.227] ([91.209.212.42])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a2e9d56000000b002ac71095b61sm1177014ljj.64.2023.05.08.08.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 08:17:07 -0700 (PDT)
Message-ID: <58a0667e-7387-4231-85d4-548a39c8064f@linaro.org>
Date: Mon, 8 May 2023 16:17:00 +0100
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
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9dOpZUeCnkHxmSAPTs20ZuUW++kFEtp2icmmST=yGPvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
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

On 5/5/23 13:19, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:17, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
>>   1 file changed, 7 insertions(+), 8 deletions(-)
>>
>> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
>> index e997db2645..64464ab363 100644
>> --- a/tcg/sparc64/tcg-target.c.inc
>> +++ b/tcg/sparc64/tcg-target.c.inc
>> @@ -83,9 +83,10 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
>>   #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
>>   #define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
>>
>> -/* Define some temporary registers.  T2 is used for constant generation.  */
>> +/* Define some temporary registers.  T3 is used for constant generation.  */
>>   #define TCG_REG_T1  TCG_REG_G1
>> -#define TCG_REG_T2  TCG_REG_O7
>> +#define TCG_REG_T2  TCG_REG_G2
>> +#define TCG_REG_T3  TCG_REG_O7
>>
>>   #ifndef CONFIG_SOFTMMU
>>   # define TCG_GUEST_BASE_REG TCG_REG_I5
>> @@ -110,7 +111,6 @@ static const int tcg_target_reg_alloc_order[] = {
>>       TCG_REG_I4,
>>       TCG_REG_I5,
>>
>> -    TCG_REG_G2,
>>       TCG_REG_G3,
>>       TCG_REG_G4,
>>       TCG_REG_G5,
>> @@ -492,8 +492,8 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
>>   static void tcg_out_movi(TCGContext *s, TCGType type,
>>                            TCGReg ret, tcg_target_long arg)
>>   {
>> -    tcg_debug_assert(ret != TCG_REG_T2);
>> -    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
>> +    tcg_debug_assert(ret != TCG_REG_T3);
>> +    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T3);
>>   }
> 
> Why do we need to change this usage of TCG_REG_T2 but not
> any of the others ?

To match the comment above.


r~


