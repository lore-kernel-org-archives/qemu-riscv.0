Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB67CAC5B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 21:14:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v1tIS-0001s9-8S; Thu, 25 Sep 2025 17:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v1tI2-0001q6-LR
 for qemu-riscv@nongnu.org; Thu, 25 Sep 2025 17:14:13 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v1tHt-00057m-CL
 for qemu-riscv@nongnu.org; Thu, 25 Sep 2025 17:14:09 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-26983b5411aso11091625ad.1
 for <qemu-riscv@nongnu.org>; Thu, 25 Sep 2025 14:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758834834; x=1759439634; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M36z01tvDiO4eiSV5/XCyURuP7Abakr3KCAND8fEuqc=;
 b=c6d0zegqBR8E80C3rX8GcrBzphy77pc73/kP697IKAL1+MBd9lJfCx38dCpzjIEfsM
 VXXMb8mtJTxhmon6UdBJKr2N0bXLqSR5QMvV07Th6Bkngc3Q9nN4cE41IkP3VA7D5OFh
 7Sw/sF7NhRr9o11yOXeBRCI+udN1ZR3WUw7tqHjr/gQa3zqJxdAt+WshU5GyzKo+ir53
 ezCJsWbNRVkLUZcry5p7C632gt+v6PVvHBe1BVxSvK3+eiaYaD2VuSK3GSmdMVQgVfx7
 pqVvxwzUkrqSpeLRaC2sVgknZokCwpR4/bE2TyHpRXPcC9r69uVyzOTX7S5Rjv74r0Vs
 ih6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758834834; x=1759439634;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M36z01tvDiO4eiSV5/XCyURuP7Abakr3KCAND8fEuqc=;
 b=BYNkHi24f0ORWNqIqFKIeCCQGBHV9vC7wbdZPas3ujprdBG6zewy2tjtaeLH++ay/0
 1/mw+r+xJ8yAIoB7sV3YwXIDWQUUhJHP4Bg4Ub4+4P9fL5e+VtdLjRjx/x+JoMH7CsR4
 Otp2oNLwyPenLKTGmXUqhisuNBbY3tRqb/JvnNGOAcLAczbm8kXrtwqYidD2LZ1bjMVe
 UNum1gtj1qpUlnZzea8SWwas/Ln6hE2M/GV8FvezmvKKBJ2Xth6vLFdvBvGg+2rnCbQa
 nrF0E2upmCATBuEJRxE1gpecixc16m2Wl2ILMLkF7PZ5Y0QyKu0t9A/DylQd5tgFw/UV
 qCrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVYV8TPlQvoXCwDVzXjpvOEfu02C9DmhOTr9spiorYEkyMT6ThdO/6bNtaS7mV6hMhvMoAtZjHG28x@nongnu.org
X-Gm-Message-State: AOJu0YxAR5dZ0kQ7wgLtBZpGI0HMyCqIOAb1Hs3ra8gaJOJTwzvuAapw
 OUAC2r9bkKSdV6TsyDxeioLHrqisv+NtLekyJyfTg+X4ugkXkeBcme8qqDS6ffgeQJI=
X-Gm-Gg: ASbGncs4PDI/yhE99hOY2ibbLuN9aLwBAlfDnCITCXsWDxSeYY+/+L4oNzdaxIbg+yI
 gMdS7bEgwBwtaNH3ojASVhCb+cSPyPwu9fiySS4tEpgz73Lwg6jUEIDzEtMKFBvYzobOwzisuIb
 p6tbM4p6TUe7Rp2CcXFhTJVxbwwhvqUZXcqN5Lm9mzxwaajISJlYA+9sBHNcfnQUoxMfcPiEMfr
 1Mnja886yodgDsjWcnH4eZxArsKRObeoMSEblaT1qP0Z6BqVnM6f6i3Rc6wbOLj+GY68xpzffbm
 p06rADwTRVDJP3PZMl4Czl27RAE5iGJ5SGgbrUgQJqt6iDuKCYHBNZJWahPwn6WqZPHajrPR34/
 BpY62Pfr+UqMa8Pw5MhJEaY9uRp8Dl76JMc0GyuGpNMIpWQ==
X-Google-Smtp-Source: AGHT+IFdocDfmpuv4fKGNgjO538vG9UCiJrrTAHsBuZfc0IMQ4mVCbhdpzA0ZBBVLALxIbN4Kx5AAg==
X-Received: by 2002:a17:902:cccf:b0:27e:ef96:c153 with SMTP id
 d9443c01a7336-27eef96c3acmr1362405ad.19.1758834834040; 
 Thu, 25 Sep 2025 14:13:54 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed66d6523sm34133135ad.11.2025.09.25.14.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 14:13:53 -0700 (PDT)
Message-ID: <8e73d8af-6f4f-405c-bed8-a475f051dcf5@linaro.org>
Date: Thu, 25 Sep 2025 14:13:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/25] semihosting/arm-compat-semi: replace target_ulong
 with vaddr
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
 <20250922093711.2768983-13-alex.bennee@linaro.org>
 <935cfb4b-1990-4ca8-91a2-b9b96b503c42@linaro.org>
 <87ldm6odxw.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87ldm6odxw.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
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

On 9/22/25 5:43 AM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 22/9/25 11:36, Alex Bennée wrote:
>>> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> Message-ID: <20250822150058.18692-10-pierrick.bouvier@linaro.org>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    semihosting/arm-compat-semi.c | 22 +++++++++++-----------
>>>    1 file changed, 11 insertions(+), 11 deletions(-)
>>> diff --git a/semihosting/arm-compat-semi.c
>>> b/semihosting/arm-compat-semi.c
>>> index 6725dcf4ba7..29cdab66f73 100644
>>> --- a/semihosting/arm-compat-semi.c
>>> +++ b/semihosting/arm-compat-semi.c
>>> @@ -123,7 +123,7 @@ static GuestFD console_out_gf;
>>>     */
>>>      typedef struct LayoutInfo {
>>> -    target_ulong rambase;
>>> +    vaddr rambase;
>>
>> This is what the subject describes. Most of the other changes aren't.
> 
> I was going to say vaddr is functionally a uint64_t but we actually made
> it a uintptr_t in February. Shall I update to:
> 
>    semihosting/arm-compat-semi: replace target_ulong
> 
>    Replace with vaddr or uint64_t where appropriate
> 
> ?

Looks good to me, thanks.
Pierrick

