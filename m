Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59756C0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 15:06:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUTiU-0007BP-TS; Fri, 11 Aug 2023 11:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUTiS-0007Ai-Iz
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 11:06:16 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUTiO-0005eD-QD
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 11:06:15 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1bbf8cb694aso18047645ad.3
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 08:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691766365; x=1692371165;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NzGcAH/wncr/lLEDpQNjY48DJKuZa1xa3K7ctnyqPhA=;
 b=ewPr9aBfFeMHvRKTY4BnGez/n6gOhTaZI8XpC/MeZRcyIUBAzO+OZL8tlPzH/wx/CK
 VgW+w7BCIj7ej1rRcLRJ+Ei3rJ8RgbLdJ5YVPkDCn56+OJHVUTpZo+z17ojBU0ldBqOl
 ztNf751uA3v2/2lmadO/xytegJuhZF00L2ipm100nm00TurutDYrpV11ZXx09Fh2aDah
 4l8hNpm3woHTM31SOZa9rBoaqp5ooQq4BRmRcrZk1p8OtD4fEwPTYNIVTQbGyHhK5A8+
 AUDH/H4QRIo3+gG4wznj1Mwu6s67CJ66gwm1676pzA+/I8G1SFbpPU9WigTjjtxu7N8w
 A7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691766365; x=1692371165;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NzGcAH/wncr/lLEDpQNjY48DJKuZa1xa3K7ctnyqPhA=;
 b=FGYUCZAY1D1aINBmmqVrAWJT5XQ2Aw2zZqvmJRHSqNRI3aogY2Hiy9eRMXwWyH3uC0
 JAYL7kWXuEf4pJfE0Kl4tt9ru/jm23H5oj5f9lS6nzuOQdMw9j9QfD9XN8jFdred6a4R
 BJfkfM1zgM52DIxKyE7Se4On3p4UZZMqXYyKUbyzobma0IpbqzdhPaE5IOUtVSnSrOFx
 41q6+OqDBlGRJ49R7+mrj/zxm8CvbhjuhaMAHpM+PKzZ77+8pcnRlL6KYij4rBU0U7DM
 Eht9EvF4UTIX02RBnIR06GXqc0YOFlae0K4ySBwRRVrHV1hYP+QkyziPmy9zopNpKY2F
 /F+w==
X-Gm-Message-State: AOJu0YwWucNTWEKdQKr0U+sl1vRS9CTbST/lq7cbQ96GgmXKRnTs6s3Q
 RmW5byDPt0LfzwUCPxLPhkq93Q==
X-Google-Smtp-Source: AGHT+IFeMiEi9YAMZN29Zr72AQgiAE89yFmKlUh0vw/E+KmKN8BQtPhM3jTD/BgFS15trS/H7wOiJw==
X-Received: by 2002:a17:903:120a:b0:1b8:987f:3f34 with SMTP id
 l10-20020a170903120a00b001b8987f3f34mr2666087plh.25.1691766365228; 
 Fri, 11 Aug 2023 08:06:05 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:e773:351d:2db2:8a8a?
 ([2602:47:d483:7301:e773:351d:2db2:8a8a])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a170902eed200b001ac6b926621sm4019046plb.292.2023.08.11.08.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 08:06:04 -0700 (PDT)
Message-ID: <6a116d10-5e01-30f8-fbd6-30c062fcccc5@linaro.org>
Date: Fri, 11 Aug 2023 08:06:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 20/24] tcg/i386: Add cf parameter to tcg_out_cmp
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-21-richard.henderson@linaro.org>
 <CAFEAcA-N-QWQXcHgMNnXTr+Bmf7fhdSKYQwS-kkWGdR+UHvT-Q@mail.gmail.com>
 <CAFEAcA9xsPHOeorJvjfO7mrpX_TfYHMNcMHi3dyt41+CktyXsg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9xsPHOeorJvjfO7mrpX_TfYHMNcMHi3dyt41+CktyXsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.972,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 8/11/23 03:45, Peter Maydell wrote:
> On Fri, 11 Aug 2023 at 11:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 8 Aug 2023 at 04:13, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> Add the parameter to avoid TEST and pass along to tgen_arithi.
>>> All current users pass false.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   tcg/i386/tcg-target.c.inc | 16 ++++++++--------
>>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
>>> index b88fc14afd..56549ff2a0 100644
>>> --- a/tcg/i386/tcg-target.c.inc
>>> +++ b/tcg/i386/tcg-target.c.inc
>>> @@ -1418,15 +1418,15 @@ static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, bool small)
>>>       }
>>>   }
>>>
>>> -static void tcg_out_cmp(TCGContext *s, TCGArg arg1, TCGArg arg2,
>>> -                        int const_arg2, int rexw)
>>> +static void tcg_out_cmp(TCGContext *s, int rexw, TCGArg arg1, TCGArg arg2,
>>> +                        int const_arg2, bool cf)
>>>   {
>>>       if (const_arg2) {
>>> -        if (arg2 == 0) {
>>> +        if (arg2 == 0 && !cf) {
>>>               /* test r, r */
>>>               tcg_out_modrm(s, OPC_TESTL + rexw, arg1, arg1);
>>>           } else {
>>> -            tgen_arithi(s, ARITH_CMP + rexw, arg1, arg2, 0);
>>> +            tgen_arithi(s, ARITH_CMP + rexw, arg1, arg2, cf);
>>>           }
>>>       } else {
>>>           tgen_arithr(s, ARITH_CMP + rexw, arg1, arg2);
>>
>> I don't really understand the motivation here.
>> Why are some uses of this function fine with using the TEST
>> insn, but some must avoid it? What does 'cf' stand for?
>> A comment would help here if there isn't a clearer argument
>> name available...
> 
> Looking at the following patch suggests perhaps:
> 
> /**
>   * tcg_out_cmp: Emit a compare, setting the X, Y, Z flags accordingly.
>   * @need_cf : true if the comparison must also set CF
>   */
> 
> (fill in which XYZ flags you can rely on even if need_cf is false)

I can add that, yes.

Basically, test sets SZ flags, where cmp sets SZCO.  I want to add an optimizaton using C, 
so "cmp 0,x" should not be silently replaced by "test x,x".


r~

