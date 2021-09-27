Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUjJQ-0002fR-8o
	for mharc-qemu-riscv@gnu.org; Mon, 27 Sep 2021 01:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUjJN-0002dT-AP; Mon, 27 Sep 2021 01:36:21 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUjJL-0006Po-I2; Mon, 27 Sep 2021 01:36:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id g16so48789944wrb.3;
 Sun, 26 Sep 2021 22:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KPUM7zUOh2AlvxQWvv2s28KLNpV1AH+QA4ozyF3ZRKw=;
 b=es+xMCHTT3henNPoFNu+iVAdsOc+4CC3tKn/ZAQ8wA7dB7ZYkfL2f4GSuwcY6hKKvw
 6MT3PneJ8y23n8hADs9ctcI36IuS1IMXSh5KT6RBzwlS3TrUhTOCwStouSo+p1wY71nC
 +/EguzJwnABaK7GFszZcfrfdFg+yg+Ng3Qzne/TdkT0IxDcFaa3vCxa0fxZ89qSQY45L
 9Rhk22pFcCGgV/ZXqZ9NYHX/RGq/gKnqshjtd5ZKbi5izIAowEkZNIQoFGmmy9mDPhSU
 q573Jp4nfRehPcpH190D69Wu8xtrcQltXHt9DMrgLEoqvsKZZ8T7FavuvtDPTjlNo7B3
 2+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KPUM7zUOh2AlvxQWvv2s28KLNpV1AH+QA4ozyF3ZRKw=;
 b=EDfIZd03GgI5dqRaDkEr/7aNuLgDzZ4dWCTPXqWT4h95lZxjU4Hiu5XLmCx07xXsH5
 ovuWuUEFNSgjIzCSgLAh1WdEh2wZuQqw5tcAKEtWI46jgvdTJRn1Jl5AT6LfBKaArRus
 3PY22pZAalZ+EiPNBdM2RAO0/ttc5eEF6AzgrlZvV91QdtGPFBTQw2Jag9nY0pC9dOfr
 fesEYwEFHzz1EHuzcXFJVHvEbwFuETAMUJJ2uYH8IHpgPhMZVGtmFOFmm4uCQ+iOGzYs
 WllKrINSvXmEdC8z6EcgyrbQLZONs7Ehx1DMXfwcHsC1QhA027mDeqX/1SWWDPKo6oiX
 SWZg==
X-Gm-Message-State: AOAM533jcpAnKToHWx7KD9fkaS5XQ9fWGL8lxZYd5hFaXKLwUeSLbAPD
 VaIOx5UQVqjdv0zngixwOmY=
X-Google-Smtp-Source: ABdhPJy+Lf5mAcI5MXLNTmw3ROLoLu7ylefS+6BFg3rNwdPr5dK7b2TfJr3tVN7DsHg5pU8JrDjLGQ==
X-Received: by 2002:adf:f188:: with SMTP id h8mr25128957wro.269.1632720977371; 
 Sun, 26 Sep 2021 22:36:17 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id i203sm19984904wma.7.2021.09.26.22.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 22:36:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <ab6303d3-f009-a992-5b5a-3606b9db3a02@amsat.org>
Date: Mon, 27 Sep 2021 07:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] tcg/riscv: Fix potential bug in clobbered call register
 set
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Joelle van Dyne <j@getutm.app>,
 qemu-riscv@nongnu.org
References: <20210926213902.1713506-1-f4bug@amsat.org>
 <fa4c2f52-d924-4b58-16c6-273ce7dba392@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <fa4c2f52-d924-4b58-16c6-273ce7dba392@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.478,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Sep 2021 05:36:22 -0000

On 9/27/21 01:06, Richard Henderson wrote:
> On 9/26/21 5:39 PM, Philippe Mathieu-Daudé wrote:
>> The tcg_target_call_clobber_regs variable is of type TCGRegSet,
>> which is unsigned and might be 64-bit wide. By initializing it
>> as unsigned type, only 32-bit are set. Currently the RISCV TCG
>> backend only uses 32 registers, so this is not a problem.
>> However if more register were to be implemented (such vectors)
>> then it would become problematic. Since we are better safe than
>> sorry, properly initialize the value as 64-bit.
>>
>> Fixes: 7a5549f2aea ("tcg/riscv: Add the target init code")
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   tcg/riscv/tcg-target.c.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
>> index dc8d8f1de23..5bd95633b0d 100644
>> --- a/tcg/riscv/tcg-target.c.inc
>> +++ b/tcg/riscv/tcg-target.c.inc
>> @@ -1734,7 +1734,7 @@ static void tcg_target_init(TCGContext *s)
>>           tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffff;
>>       }
>>   -    tcg_target_call_clobber_regs = -1u;
>> +    tcg_target_call_clobber_regs = -1ull;
> 
> There are not 64 registers, so this is incorrect.

Currently there are 32 registers, but I was looking at this draft:
https://five-embeddev.com/riscv-v-spec/draft/v-spec.html#_vector_registers
"The vector extension adds 32 architectural vector registers, v0-v31
to the base scalar RISC-V ISA."
If this were to be implemented (and available on the host), wouldn't
we have 64 registers?

> I don't think your logic is correct.

Eventually this line would be easier to review as:

  tcg_target_call_clobber_regs = MAKE_64BIT_MASK(0, TCG_TARGET_NB_REGS);

