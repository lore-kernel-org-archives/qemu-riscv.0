Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvxqJ-0005R3-BV
	for mharc-qemu-riscv@gnu.org; Mon, 08 May 2023 06:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvxqG-0005QF-VP
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 06:11:41 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvxqB-0006VY-DQ
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 06:11:38 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-965ac4dd11bso870209266b.2
 for <qemu-riscv@nongnu.org>; Mon, 08 May 2023 03:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683540693; x=1686132693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r7f/fkBATNzqUinvH3w4ndLoZkkktG1Ww8fEUs19hSc=;
 b=OCCLWRprweY2bhfsQGo5cnKbVv3FqujmVlyyux2kPyfH6zQJB/aoDo5mBctZXxj/xd
 WYbzOIVVo+FarsAF96uee7lFG+e7bvyz/7aAZbYFPuFrB0Tg4RgBkyuZKESGL0dSrwbU
 DU683Zyn5jtLL35C2ULRSNKe3k6vuZTEjZdDWcC/+PSG6yygwIxBlkxgdE9e0O7zJuVg
 JwkW85PBx+hQvsSzILDBiN4vVzFgwJMsdO/xpB3/DXwDK+e/zPm9CAIidzWCg5KOE1Q7
 6nghOoaFDNHc5wC3Q24fsiXHMbM0XrA0yKRhT3oibqfRwHt4a6sLGi2LzqvdIh2jIzHX
 Ei+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683540693; x=1686132693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r7f/fkBATNzqUinvH3w4ndLoZkkktG1Ww8fEUs19hSc=;
 b=Pkz5HE2PHQDzHTayDmw/dQoxnD5NblSVZIP5IYlsdJ1Py8QwTe0wjyeF2MIwOL+vSC
 6iqmhSC1OKc1m0XlfsPjam1WieXPZDfgZbaddjpBCAEoCocz3Du38AZpp2BVngemVx/Z
 BmUWSV0xrb6jj1Xkghx/RstpJ56uRwbICCXxJ8UbCZCchdaLv5t49iy4H1C3dxzJb7ci
 RvEnDMxXEkSx4vcvh+6w0Xticnk8HmkFtQ+4eiiU31fJY6kQMBXp8QeiBgn1W7zK5V9J
 cp5k7OIxzQGqhuyspNuxTMz34M2g3tPTpCGcTZJuk9IRpaswIovqXx7zGslAZ5eAqsKN
 1gfA==
X-Gm-Message-State: AC+VfDy3zRgDcTIf7knRsrn/aqhhiYfkDtApIHRkytQKX0Yb6aUxXgnV
 8CX47sRs8plgdgRIXiaKPjkLGQ==
X-Google-Smtp-Source: ACHHUZ6xQAjpMdOVprzTd9OkJFtnsobvWsqbYmoiW4VdH1Z3vc4hSJLaXWDqZ9qBt0/tBjw6Mq8/MQ==
X-Received: by 2002:a17:907:9345:b0:94e:c4b:4d95 with SMTP id
 bv5-20020a170907934500b0094e0c4b4d95mr7629334ejc.69.1683540693491; 
 Mon, 08 May 2023 03:11:33 -0700 (PDT)
Received: from [192.168.110.227] ([91.223.100.33])
 by smtp.gmail.com with ESMTPSA id
 p25-20020a1709065dd900b0094e4eabb402sm4777421ejv.128.2023.05.08.03.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 03:11:33 -0700 (PDT)
Message-ID: <483ae5ee-82e7-d964-7f95-ac45ce4bfb46@linaro.org>
Date: Mon, 8 May 2023 11:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 07/57] accel/tcg: Honor atomicity of stores
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-8-richard.henderson@linaro.org>
 <CAFEAcA8aqJXGcFSTU1dz6bSeJL5n+cmHq3ATt4xZGZsehJk6Tg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8aqJXGcFSTU1dz6bSeJL5n+cmHq3ATt4xZGZsehJk6Tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.964,
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
X-List-Received-Date: Mon, 08 May 2023 10:11:41 -0000

On 5/5/23 10:28, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:11, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/cputlb.c             | 103 +++----
>>   accel/tcg/user-exec.c          |  12 +-
>>   accel/tcg/ldst_atomicity.c.inc | 491 +++++++++++++++++++++++++++++++++
>>   3 files changed, 540 insertions(+), 66 deletions(-)
> 
> 
>> +/**
>> + * store_atom_insert_al16:
>> + * @p: host address
>> + * @val: shifted value to store
>> + * @msk: mask for value to store
>> + *
>> + * Atomically store @val to @p masked by @msk.
>> + */
>> +static void store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
>> +{
>> +#if defined(CONFIG_ATOMIC128)
>> +    __uint128_t *pu, old, new;
>> +
>> +    /* With CONFIG_ATOMIC128, we can avoid the memory barriers. */
>> +    pu = __builtin_assume_aligned(ps, 16);
>> +    old = *pu;
>> +    do {
>> +        new = (old & ~msk.u) | val.u;
>> +    } while (!__atomic_compare_exchange_n(pu, &old, new, true,
>> +                                          __ATOMIC_RELAXED, __ATOMIC_RELAXED));
>> +#elif defined(CONFIG_CMPXCHG128)
>> +    __uint128_t *pu, old, new;
>> +
>> +    /*
>> +     * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
>> +     * defer to libatomic, so we must use __sync_val_compare_and_swap_16
>> +     * and accept the sequential consistency that comes with it.
>> +     */
>> +    pu = __builtin_assume_aligned(ps, 16);
>> +    do {
>> +        old = *pu;
>> +        new = (old & ~msk.u) | val.u;
>> +    } while (!__sync_bool_compare_and_swap_16(pu, old, new));
> 
> Comment says "__sync_val..." but code says "__sync_bool...". Which is right?

Fixed the comment to __sync_*_compare_and_swap_16


r~

