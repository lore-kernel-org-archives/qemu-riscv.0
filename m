Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyorz-0002uJ-Rs
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jul 2020 23:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyory-0002tZ-Ly
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 23:59:38 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:35646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyorw-0005jM-33
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 23:59:38 -0400
Received: by mail-pl1-x641.google.com with SMTP id x9so3783178plr.2
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2020 20:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XjdktMDmz9PN4tGrlzmXySUB4FgiQVb7VNbcbwk1gP4=;
 b=xqvDR586IFTSphozaZtOIXepGSwdlVBRGoNlGKo5xFRxaw3Np0JM2sScNtCe4/zUKb
 horoj1vwnSQ2fuLNOir+GNlzuIif81EDKfNNT5AiPpciXmyDeFoGFO3Rhwk2moYhPqDQ
 PR1cK2UUVCp6E2znSGTjQQ5QflawkYahmRbkJ8dZEbDwTu/QHuCoymXA/FOXDigZ36wL
 IC8QZVuR97zb0eKcJc7KhNB4zU+COLVfJwGqwWF4fdg3Gwp9wWDWqg54kQvIAVxkj1o3
 1LHTr0vvqrNfdlrTeWtoz8qw5F2CmGeSEBBGi8RatNLcJ569TC+7OMp+mxFLHEIPIlqX
 49Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XjdktMDmz9PN4tGrlzmXySUB4FgiQVb7VNbcbwk1gP4=;
 b=svFTrrSxs+OU+hdrKil2TZENBHeeaiKMchVJ7qcbZ2zwPkRlhccwx+SOtwjrTs1Wbf
 5WRvtCk0SyHkOA6ua94gTQN8Ro8YljOVglpnhQae36uZHc+vkRwcuhJfChzAGHgM9A+Z
 FQ/2RbCmPdeUCx51o7qMZ0BdBduTm3WT/KldKk3WFWxnLm6PbnIsxNbafLzMq9O84YVI
 SExOCyfsxo9lARlLOgywpEAKDVKQzeDvhvPhF7ZZwOSEqGHsGDT1PA8rlFpmsMLxCWjy
 tCiKFQz8xtD/3qtX8T82r+upn9R/pIgVzo9Vvz5x7R4JuUzM2QRkVTSMyMHK5mDX1gV3
 o3pQ==
X-Gm-Message-State: AOAM5321Uan6KUxYKIJj08Vz/A1KSAVX/p8o242eWk63fu6L6l/284BS
 AosuxFoImOu8zz5QkqS5OJt3Yg==
X-Google-Smtp-Source: ABdhPJzhgd6xmZPBn7dtZJJdptZeTNsNt1oAyloLyUv9qnJZPVS2Jts46uP4ncq1P4AOQWcox5Nrdw==
X-Received: by 2002:a17:90a:6b02:: with SMTP id
 v2mr3351394pjj.163.1595563174671; 
 Thu, 23 Jul 2020 20:59:34 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 66sm4746432pfa.92.2020.07.23.20.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 20:59:33 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] target/riscv: Check nanboxed inputs to fp helpers
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
Cc: frank.chang@sifive.com, qemu-riscv@nongnu.org, alistair23@gmail.com
References: <20200724002807.441147-1-richard.henderson@linaro.org>
 <20200724002807.441147-5-richard.henderson@linaro.org>
 <abf8bc3d-b021-6d01-3b7d-fa42bfe64653@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a624b5cc-bee5-76c6-35ce-008a4bf9f0ca@linaro.org>
Date: Thu, 23 Jul 2020 20:59:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <abf8bc3d-b021-6d01-3b7d-fa42bfe64653@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
X-List-Received-Date: Fri, 24 Jul 2020 03:59:38 -0000

On 7/23/20 7:47 PM, LIU Zhiwei wrote:
> 
> 
> On 2020/7/24 8:28, Richard Henderson wrote:
>> If a 32-bit input is not properly nanboxed, then the input is
>> replaced with the default qnan.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/riscv/internals.h  | 11 +++++++
>>   target/riscv/fpu_helper.c | 64 ++++++++++++++++++++++++++++-----------
>>   2 files changed, 57 insertions(+), 18 deletions(-)
>>
>> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
>> index 9f4ba7d617..f1a546dba6 100644
>> --- a/target/riscv/internals.h
>> +++ b/target/riscv/internals.h
>> @@ -43,4 +43,15 @@ static inline uint64_t nanbox_s(float32 f)
>>       return f | MAKE_64BIT_MASK(32, 32);
>>   }
>>   +static inline float32 check_nanbox_s(uint64_t f)
>> +{
>> +    uint64_t mask = MAKE_64BIT_MASK(32, 32);
>> +
>> +    if (likely((f & mask) == mask)) {
>> +        return (uint32_t)f;
>> +    } else {
>> +        return 0x7fc00000u; /* default qnan */
>> +    }
>> +}
>> +
> If possible,
> 
> +static inline float32 check_nanbox(uint64_t f, uint32_t flen)
> +{
> +    uint64_t mask = MAKE_64BIT_MASK(flen, 64 - flen);
> +
> +    if (likely((f & mask) == mask)) {
> +        return (uint32_t)f;
> +    } else {
> +        return (flen == 32) ? 0x7fc00000u : 0x7e00u; /* default qnan */
> +    }
> +}

The difficulty of choosing the proper default qnan is an example of why we
should *not* attempt to make this function fully general, but should instead
define separate functions for each type.  E.g.

static inline float16 check_nanbox_h(uint64_t f);
static inline bfloat16 check_nanbox_b(uint64_t f);


r~

