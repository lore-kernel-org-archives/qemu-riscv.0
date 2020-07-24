Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyonv-0001RN-A7
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jul 2020 23:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyont-0001QC-80
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 23:55:25 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyonr-0004xZ-FZ
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 23:55:24 -0400
Received: by mail-pf1-x442.google.com with SMTP id m9so4362871pfh.0
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2020 20:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nAwJfw/ynnW+pwvb1PJ+GO/cChQY6DGXtFZA8patnu8=;
 b=AsND7eHYwStsSLu+w99k/5HJeJHqsiyww8FP7ZBe4O8p83aymnJfwK4JSmuf88LD/J
 LesbTQraPhPlYtJk9HiH4Qcu+uIvW5khHWf1w7Ds5T+LGZjBHNj44uJVaKquFkFziUWk
 W+NV6skiuxMPHbEqGhocWhe9FUenDkNB7xkejQw8onlFx2XxhSdPiq7/BByiVXWDokcW
 Wa3YYro++oCMo+14DvF1ZNmDsOtuelo8kYClyn5ILf2SGauH6J7jvnB1IfGJOwh6K8vk
 4UfA4ERTHiY3DiJN9sl0smWwIEi4DQlC6Wyk27EQWGRLjDLKr3OWTOAPtEQIK3MIcOK5
 iVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nAwJfw/ynnW+pwvb1PJ+GO/cChQY6DGXtFZA8patnu8=;
 b=I+mC53B8MvFjdijmaAv0IfLytiFLQnIh+4TXp9IHyj7jAzMb0/pkLP4FiMTC+pH8St
 o48NjPnstgjOnyBZzD88vZhdvQ3xr9FGQHalPEtsLiVQf3nXSR+5ffyqcm6uXb8WgFQP
 DrMbZA2klq/R/nI3zWRW52WLcr4KGWzy0N6OUx7RZI5ulBWfGLlLFzkpwFgOpd+lUZz7
 yRuDg83f//Q0F6txvZF/71UCnQeoQaI2yBk30iUR8/y5WXMaEd/QAIxfBRnW1wrKFook
 duOXzu2hq/7/VHlFZ1F4H8k/HiEGn/FcL7rPwssWFpkaAssBmq3BR8LzDH1+aFCCZ0ZC
 +dWw==
X-Gm-Message-State: AOAM530RzhrbJmq4XU/+pkgyi/tzwj6iKfgQUJUJR787WHldWPdMm1uO
 dheN1JXEbx/tMGeLm/rFqAIgDQ==
X-Google-Smtp-Source: ABdhPJz4qtUh3bQJ6DoOwNRm1iPGGcdiS8VHCycUPP8RyTzKZuKXISi1giOIu9qRzs4ShBh5SEh9sA==
X-Received: by 2002:a63:4144:: with SMTP id o65mr6966068pga.8.1595562921530;
 Thu, 23 Jul 2020 20:55:21 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 v28sm4728708pgn.81.2020.07.23.20.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 20:55:20 -0700 (PDT)
Subject: Re: [PATCH v2 1/7] target/riscv: Generate nanboxed results from fp
 helpers
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
Cc: frank.chang@sifive.com, qemu-riscv@nongnu.org, alistair23@gmail.com
References: <20200724002807.441147-1-richard.henderson@linaro.org>
 <20200724002807.441147-2-richard.henderson@linaro.org>
 <1aa6cb56-2f41-45c1-2d32-ec8b3b10780b@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9e10c17c-7a9e-5f7f-b1e3-c195d4e30b32@linaro.org>
Date: Thu, 23 Jul 2020 20:55:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1aa6cb56-2f41-45c1-2d32-ec8b3b10780b@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 24 Jul 2020 03:55:25 -0000

On 7/23/20 7:35 PM, LIU Zhiwei wrote:
> 
> 
> On 2020/7/24 8:28, Richard Henderson wrote:
>> Make sure that all results from single-precision scalar helpers
>> are properly nan-boxed to 64-bits.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/riscv/internals.h  |  5 +++++
>>   target/riscv/fpu_helper.c | 42 +++++++++++++++++++++------------------
>>   2 files changed, 28 insertions(+), 19 deletions(-)
>>
>> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
>> index 37d33820ad..9f4ba7d617 100644
>> --- a/target/riscv/internals.h
>> +++ b/target/riscv/internals.h
>> @@ -38,4 +38,9 @@ target_ulong fclass_d(uint64_t frs1);
>>   #define SEW32 2
>>   #define SEW64 3
>>   +static inline uint64_t nanbox_s(float32 f)
>> +{
>> +    return f | MAKE_64BIT_MASK(32, 32);
>> +}
>> +
> If define it here,  we can also define a more general  function with flen.
> 
> +static inline uint64_t nanbox_s(float32 f, uint32_t flen)
> +{
> +    return f | MAKE_64BIT_MASK(flen, 64 - flen);
> +}
> +
> 
> So we can reuse it in fp16 or bf16 scalar instruction and in vector instructions.

While we could do that, we will not encounter all possible lengths.  In the
cover letter, I mentioned defining a second function,

static inline uint64_t nanbox_h(float16 f)
{
   return f | MAKE_64BIT_MASK(16, 48);
}

Having two separate functions will, I believe, be easier to use in practice.


r~

