Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99267C77B7F
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 May 2023 16:15:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pw3WG-0004a8-5K; Mon, 08 May 2023 12:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw3WE-0004Yx-Ru
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 12:15:22 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw3WD-0000UL-9w
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 12:15:22 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f13d8f74abso5333378e87.0
 for <qemu-riscv@nongnu.org>; Mon, 08 May 2023 09:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683562518; x=1686154518;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5mj0ILx9D2Fcoo7Cz4Jz74MroLxEbqcUU9mXmi8udK8=;
 b=r6GTTCFOU+L/0d1zibWYQWWfdQx7LdScmJF7mhbhU+qap/Nn6N/Ka3BIZHBmyQYIdV
 frAdpSlfrz63IMSu2/LLthVu0mFc/pDmBh708XwL1kWUZ3LxOWfxn17o3ojyGFdCV5Qm
 Xnw0BbUumtQJXMcHams6YvKoTDbtFzfBQ64lDcn6oChFGVzkW/Yvo78AW39sGUTc0YV+
 P3vW64pkKEF+fS8XYGcLHshcrONtRB9SCozQyo0l+z0ADaJL3VcwDMQRpU0U9uNxvq1/
 O0VSHDlsqr2c4X3gBuqK91HEeKu1ilk+QWmG3ULDevvYTXpeCeqvo1kzBOVC1bycc4i6
 OMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683562518; x=1686154518;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5mj0ILx9D2Fcoo7Cz4Jz74MroLxEbqcUU9mXmi8udK8=;
 b=X8MJQpYfDr1vNs+ZiN6S97vCZtx3wOzlQx6vUAzrIDRSje5ODJAxsy3iATOR6UiOUt
 6P6A2IZS2rYeoU4Bz7ff6lVHZT8kW0yQFk5VSalBWhfMkkXXyuFvuUTIdfS37GAe/i0R
 4tVnupBOjsGYZykImhAy1ejvOSdmvn9bx64QNuL7bMJ+a5ijU/LlzbpJVAZwvpbaivjd
 k3qrDG5fM3PWkzpZohuUweLDYrf7QHBbOywJFjU5GY8RxJYr2BCQsz+f9ELlo9xnqHZD
 2LqhKEcdNAtMI9jYbW9yflFxJD0I3jHcCRSpfyBXf3FgnFXe045/PbtrzM0ZPAl6DjPf
 PCWw==
X-Gm-Message-State: AC+VfDyl411eXgeru7VzQNKhlafyIhgzfynDVnAdE6ldcmBkFYroS8um
 g1dv6mLw9YzmpT9ESAQN5IjmMQ==
X-Google-Smtp-Source: ACHHUZ5RkpMitoTqxrMrDlzoDT6CsO4xz3iRu0BVxrJxCBbYdkj7VBhQjsY+5m/q1GNaSGMb+1jvDQ==
X-Received: by 2002:a05:6512:38c4:b0:4ef:f583:ee16 with SMTP id
 p4-20020a05651238c400b004eff583ee16mr2350546lft.57.1683562517953; 
 Mon, 08 May 2023 09:15:17 -0700 (PDT)
Received: from [192.168.110.227] ([91.209.212.34])
 by smtp.gmail.com with ESMTPSA id
 q30-20020ac2511e000000b004cca1658a41sm30923lfb.300.2023.05.08.09.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 09:15:17 -0700 (PDT)
Message-ID: <8def4794-3eb1-39df-56f3-a5d1b577ec93@linaro.org>
Date: Mon, 8 May 2023 17:15:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 52/57] tcg/i386: Honor 64-bit atomicity in 32-bit mode
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-53-richard.henderson@linaro.org>
 <CAFEAcA8XQ2_GFyBCqW4N7p32dvkWe6B21bpHhOf48xHyc_petw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8XQ2_GFyBCqW4N7p32dvkWe6B21bpHhOf48xHyc_petw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12b.google.com
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

On 5/5/23 14:27, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:18, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Use the fpu to perform 64-bit loads and stores.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>> @@ -2091,7 +2095,20 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
>>               datalo = datahi;
>>               datahi = t;
>>           }
>> -        if (h.base == datalo || h.index == datalo) {
>> +        if (h.atom == MO_64) {
>> +            /*
>> +             * Atomicity requires that we use use a single 8-byte load.
>> +             * For simplicity and code size, always use the FPU for this.
>> +             * Similar insns using SSE/AVX are merely larger.
> 
> I'm surprised there's no performance penalty for throwing old-school
> FPU insns into what is presumably otherwise code that's only
> using modern SSE.

I have no idea about performance.  We don't require SSE for TCG at the moment.

> I assume the caller has arranged that the top of the stack
> is trashable at this point?

The entire fpu stack is call-clobbered.


r~


