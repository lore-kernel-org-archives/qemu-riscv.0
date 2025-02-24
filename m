Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D1AC021B5
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 09:25:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmUht-0001mM-HA; Mon, 24 Feb 2025 04:24:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tmUhh-0001kL-TQ
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 04:24:47 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tmUhe-0005CH-Rd
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 04:24:44 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38f29a1a93bso3294521f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2025 01:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740389080; x=1740993880; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=em8Wj6gdexYSbGcXIIzkB3WaMZ1vCoGcyE0NamhWvhQ=;
 b=L+zZoJNvhPAOvd8RKhRlgz9Mw2feS25khk6YtzPgoksRcal+0+qcQ2n71ha+74cvci
 ruuVy+iD3d4NonqE4G+VqgPGRn7TIRK+cwaSK0O0gXdbG7laJ7qt0Pq5sWIIYV7gjTOC
 CEgc8lhGwmbQIgPUp5jIgz+gtBOsft4Si69eaFEXhy+DFzZLoQSoM0zni481NnI/+IEy
 JzzHMno19rEJp9x8nUeskExOMMueFte3lH9ELxfvuKwcD+ntsC8enAsFr8ofQRHhcTM6
 Dcvj0tQ+IHIhRbJqkzRj8OLKN3M+cUZpI4b3Ei1OeXhGI2niBYjGRY+L/banNkW3p7i6
 OQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740389080; x=1740993880;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=em8Wj6gdexYSbGcXIIzkB3WaMZ1vCoGcyE0NamhWvhQ=;
 b=tGj9+N0hJB8lM3JUka2lG74VYxpFkSw1RUcCEmT/QtEcvUi6uQCj9eCebnEO5+LBWq
 WvdO+dOwtkKBydobHEB8bSXcoy485kpuFUTzgPZivX7NVQddB9u9/RNVvmKzy83HesqA
 bI12TZGly+gAroWylSB8Km0QKf/kYUPa1/KK/FMXNbg7H4zODCxGA5ILVQfcAytAAwDq
 lDl+261NTHN6XnEGWXm1Br2YxwRt2l4xoW3jCfMxehBPHLFP4lwkt0yulUcZI6HqNPJT
 J8n6oEGx5aL2k0/ncOn/vyjzab2ZyfCXvp/dEdfBxPqqAv9GON2Kk7VeyE04uGO+as0e
 1M6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWJWs4mgUAO+kEA09ZxPNAwtSW7EyRlrNayU8/kY1k36CemssrB0H0EUOeGvB4rUSynsaFwqjvPcim@nongnu.org
X-Gm-Message-State: AOJu0YzFa1div/SUokQ70xQk+jZgyNujRrVwcS8QokewQ5y1tIsb3PwI
 DjJibOBh1X3gDE6TwSClfWNIJxcPDpC/zOzIc9qHMNEZwdFuT3+Yb3gHpIwzK4fTZFlqjREQ5ah
 o0HQ=
X-Gm-Gg: ASbGncsG+ZAl2oTgqLSN4kp2WlSuin1JpXXNmEQEQpx4AZO1mbPjhjgenOKtnrWaODu
 enpPNFfP7x7LdVfCNtqM9HDREJQkOs6rbItkJM/0gQNAErncX2Y8GoLLCZ5y+i1hN0jIpkrvsxc
 GJPZEHhhknerW7lVGSn2X/IYd0yfgx5OVxQRj1ZAGgKX7g3ydYsei3ysioztLgYClvlzP0JW44G
 xOCnKQGUZFYta/nRDaXy4GaZij3ROjAPp+hyBcDF/iuXer6JObMXIlJhv2pDj75t5aK3rN58FK4
 rgUHqnlkXMTICyYZYfWOVmCPcu8pYj+RtyXtKSP21k7Pp93pmvywTQkD7YYerRN0Sf1Ung==
X-Google-Smtp-Source: AGHT+IHFB77kvWkt91N63XIcorxkiSQplgsPWzmJn11K7JazVdOQxcaPGMWjnYfE469N9zWEUcrY8A==
X-Received: by 2002:a05:6000:1788:b0:38d:d9bd:1897 with SMTP id
 ffacd0b85a97d-38f6e95ef5bmr9636542f8f.22.1740389079743; 
 Mon, 24 Feb 2025 01:24:39 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258dab74sm31459332f8f.32.2025.02.24.01.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 01:24:39 -0800 (PST)
Message-ID: <af650a49-8917-4d19-9cd4-e29a1538b86b@linaro.org>
Date: Mon, 24 Feb 2025 10:24:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 33/42] tcg/riscv: Require TCG_TARGET_REG_BITS == 64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv <qemu-riscv@nongnu.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
 <20230505212447.374546-34-richard.henderson@linaro.org>
 <95e6af77-05bf-46f5-9e85-ce913b08706e@linaro.org>
 <2a2026eb-b92e-450f-9bcf-211620bdf450@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <2a2026eb-b92e-450f-9bcf-211620bdf450@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 22/2/25 19:17, Richard Henderson wrote:
> On 2/20/25 15:27, Philippe Mathieu-Daudé wrote:
>> On 5/5/23 23:24, Richard Henderson wrote:
>>> The port currently does not support "oversize" guests, which
>>> means riscv32 can only target 32-bit guests.  We will soon be
>>> building TCG once for all guests.  This implies that we can
>>> only support riscv64.
>>>
>>> Since all Linux distributions target riscv64 not riscv32,
>>> this is not much of a restriction and simplifies the code.
>>>
>>> The brcond2 and setcond2 opcodes are exclusive to 32-bit hosts,
>>> so we can and should remove the stubs.
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   tcg/riscv/tcg-target-con-set.h |   8 --
>>>   tcg/riscv/tcg-target.h         |  22 ++--
>>>   tcg/riscv/tcg-target.c.inc     | 232 +++++++++------------------------
>>>   3 files changed, 72 insertions(+), 190 deletions(-)
>>
>>
>>> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
>>> index 0deb33701f..dddf2486c1 100644
>>> --- a/tcg/riscv/tcg-target.h
>>> +++ b/tcg/riscv/tcg-target.h
>>> @@ -25,11 +25,14 @@
>>>   #ifndef RISCV_TCG_TARGET_H
>>>   #define RISCV_TCG_TARGET_H
>>> -#if __riscv_xlen == 32
>>> -# define TCG_TARGET_REG_BITS 32
>>> -#elif __riscv_xlen == 64
>>> -# define TCG_TARGET_REG_BITS 64
>>> +/*
>>> + * We don't support oversize guests.
>>> + * Since we will only build tcg once, this in turn requires a 64-bit 
>>> host.
>>> + */
>>> +#if __riscv_xlen != 64
>>> +#error "unsupported code generation mode"
>>>   #endif
>>> +#define TCG_TARGET_REG_BITS 64
>>>   #define TCG_TARGET_INSN_UNIT_SIZE 4
>>>   #define TCG_TARGET_TLB_DISPLACEMENT_BITS 20
>>> @@ -83,13 +86,8 @@ typedef enum {
>>>   #define TCG_TARGET_STACK_ALIGN          16
>>>   #define TCG_TARGET_CALL_STACK_OFFSET    0
>>>   #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
>>> -#if TCG_TARGET_REG_BITS == 32
>>> -#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
>>> -#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
>>> -#else
>>>   #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
>>>   #define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
>>> -#endif
>>>   #define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
>>>   /* optional instructions */
>>> @@ -106,8 +104,8 @@ typedef enum {
>>>   #define TCG_TARGET_HAS_sub2_i32         1
>>>   #define TCG_TARGET_HAS_mulu2_i32        0
>>>   #define TCG_TARGET_HAS_muls2_i32        0
>>> -#define TCG_TARGET_HAS_muluh_i32        (TCG_TARGET_REG_BITS == 32)
>>> -#define TCG_TARGET_HAS_mulsh_i32        (TCG_TARGET_REG_BITS == 32)
>>> +#define TCG_TARGET_HAS_muluh_i32        0
>>> +#define TCG_TARGET_HAS_mulsh_i32        0
>>
>> Should have we squashed the following with these changes?
> 
> Yes, mulsh_i32 is not reachable anymore.  At this point I'll just leave 
> this cleanup to conversion of mulsh to TCGOutOpBinary.

Sure, I was not planing to ask for another patch, but trying to see if
I was correctly understanding your conversion.

Thanks,

Phil.

