Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0380BC49EA1
	for <qemu-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 12:38:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sZ8ap-0007Q8-1P; Wed, 31 Jul 2024 08:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sZ8an-0007Jd-Dz
 for qemu-riscv@nongnu.org; Wed, 31 Jul 2024 08:38:09 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sZ8al-0005Dc-KZ
 for qemu-riscv@nongnu.org; Wed, 31 Jul 2024 08:38:09 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3db1eb76702so3541392b6e.0
 for <qemu-riscv@nongnu.org>; Wed, 31 Jul 2024 05:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1722429486; x=1723034286; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ze3AmnsRxCQ+2juvILXTxsYNLGlanIbKhNWgFEl1Ly0=;
 b=GIRWVLMcmYCv8MA6pUQF0jn1zlFAJhPKocquTMbdc4Fp+XcAUq95ehyFs72xuXXIiB
 0Uerv136F+wXc2+kYh0FROAKPwx4OpccgEEIcirjJ3fD7x5ZVESPAwhym3CYQh7PWWwM
 mTeI1PMMOhdflXE3IuOAYrVb5OmYkl++8ltJCZrxTZhWfF0b4VZh8JCGyNNxI0i0yiC2
 86MHxA5fatO1ri07XfATkRLgAD3OMY/SJDc33IxTTg0i0e9324yqsaIEO8HZcWESkoOn
 bn43vJbWPSYsGtRsM3H0hlXNVHRZ5RGc8lQyBWewfbCaYRvS4XnBgEueQvS8N7RshSC0
 jW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722429486; x=1723034286;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ze3AmnsRxCQ+2juvILXTxsYNLGlanIbKhNWgFEl1Ly0=;
 b=PpgjdKWV7lJVNGP1k1pFpoATrBGUIE3Gj7yx3SPCz2DbfiWZZGj21LGMV4EG5/oyFd
 EKmYrH85twZL/o/NA0vCh2OZin1AxryF4FpokX5lgv08TB2/mRjxcUEk6MUK1MfdT+KE
 aA5pEWZzdnSIbA5tlv0A+4WMnfvAcOrb/v+rQc87rT+3du7ot70AEjF0LD+axeKgAfk6
 eyCGxRO+k4swMQ0I4aYcuH0TBxmAao0Fta7YOe/1JlkTUdEwmY3QbQXjFEi3tLkFP5Mf
 mRlGed7AJ1tDFIeiXyl3g8ubl6GylTZ5WJFmQhfBFs8COX7nN7GHXp6hIPTxCtmk/SNg
 j7HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrJrSN+2O5b1Dw51BZ3hap7okvdt3iCTX4Btgh6IRVb9OBdNsE5cXBbxFaSZXo0UZ53ztjwh/0/NabRaL0VX5OjiFuYwE=
X-Gm-Message-State: AOJu0Yyfd4H6+EEyWMY1TiSegDMCClbFCoTG6b8ddawBr7Af5CIxleTf
 3MsOlPNkL+lFEZggjzOZgSzZgfaHJcd2fwIYvr/mHZdZM2v6VvE3ynrBJDPpcfE=
X-Google-Smtp-Source: AGHT+IHJQvaKTwQzxlU6MQFm82SbRJ+V+fchHHLuDYhC5kRCunDra4Lm5CSftrOEYERJXDCWQedMaw==
X-Received: by 2002:a05:6808:23c7:b0:3da:a7ca:88f7 with SMTP id
 5614622812f47-3db23a69520mr17906019b6e.17.1722429484754; 
 Wed, 31 Jul 2024 05:38:04 -0700 (PDT)
Received: from [192.168.68.110] ([177.197.107.101])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7a9f9ec3bf6sm10366063a12.60.2024.07.31.05.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 05:38:04 -0700 (PDT)
Message-ID: <6e8ea15f-67ef-4cfe-bb65-12f06d6e761c@ventanamicro.com>
Date: Wed, 31 Jul 2024 09:38:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] target/riscv: rvv: reduce the overhead for simple
 RISC-V vector unit-stride loads and stores
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Savini <paolo.savini@embecosm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Max Chou <max.chou@sifive.com>
References: <20240717153040.11073-1-paolo.savini@embecosm.com>
 <20240717153040.11073-2-paolo.savini@embecosm.com>
 <aff5f930-d291-4ff5-8f24-53291059d59a@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <aff5f930-d291-4ff5-8f24-53291059d59a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
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



On 7/27/24 4:13 AM, Richard Henderson wrote:
> On 7/18/24 01:30, Paolo Savini wrote:
>> From: Helene CHELIN <helene.chelin@embecosm.com>
>>
>> This patch improves the performance of the emulation of the RVV unit-stride
>> loads and stores in the following cases:
>>
>> - when the data being loaded/stored per iteration amounts to 8 bytes or less.
>> - when the vector length is 16 bytes (VLEN=128) and there's no grouping of the
>>    vector registers (LMUL=1).
>>
>> The optimization consists of avoiding the overhead of probing the RAM of the
>> host machine and doing a loop load/store on the input data grouped in chunks
>> of as many bytes as possible (8,4,2,1 bytes).
>>
>> Co-authored-by: Helene CHELIN <helene.chelin@embecosm.com>
>> Co-authored-by: Paolo Savini <paolo.savini@embecosm.com>
>>
>> Signed-off-by: Helene CHELIN <helene.chelin@embecosm.com>
>> ---
>>   target/riscv/vector_helper.c | 46 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>
>> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
>> index 29849a8b66..4b444c6bc5 100644
>> --- a/target/riscv/vector_helper.c
>> +++ b/target/riscv/vector_helper.c
>> @@ -633,6 +633,52 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>>       VSTART_CHECK_EARLY_EXIT(env);
>> +    /* For data sizes <= 64 bits and for LMUL=1 with VLEN=128 bits we get a
>> +     * better performance by doing a simple simulation of the load/store
>> +     * without the overhead of prodding the host RAM */
>> +    if ((nf == 1) && ((evl << log2_esz) <= 8 ||
>> +    ((vext_lmul(desc) == 0) && (simd_maxsz(desc) == 16)))) {
>> +
>> +    uint32_t evl_b = evl << log2_esz;
>> +
>> +        for (uint32_t j = env->vstart; j < evl_b;) {
>> +        addr = base + j;
>> +            if ((evl_b - j) >= 8) {
>> +                if (is_load)
>> +                    lde_d_tlb(env, adjust_addr(env, addr), j, vd, ra);
>> +                else
>> +                    ste_d_tlb(env, adjust_addr(env, addr), j, vd, ra);
>> +                j += 8;
>> +            }
>> +            else if ((evl_b - j) >= 4) {
>> +                if (is_load)
>> +                    lde_w_tlb(env, adjust_addr(env, addr), j, vd, ra);
>> +                else
>> +                    ste_w_tlb(env, adjust_addr(env, addr), j, vd, ra);
>> +                j += 4;
>> +            }
>> +            else if ((evl_b - j) >= 2) {
>> +                if (is_load)
>> +                    lde_h_tlb(env, adjust_addr(env, addr), j, vd, ra);
>> +                else
>> +                    ste_h_tlb(env, adjust_addr(env, addr), j, vd, ra);
>> +                j += 2;
>> +            }
>> +            else {
>> +                if (is_load)
>> +                    lde_b_tlb(env, adjust_addr(env, addr), j, vd, ra);
>> +                else
>> +                    ste_b_tlb(env, adjust_addr(env, addr), j, vd, ra);
>> +                j += 1;
>> +            }
>> +        }
> 
> For system mode, this performs the tlb lookup N times, and so will not be an improvement.

I believe we can wrap this up in an "#ifdef CONFIG_USER_ONLY" block to allow
linux-user mode to benefit from it. We would still need to take care of the
host endianess though.


Thanks,

Daniel

> 
> This will not work on a big-endian host.
> 
> 
> r~

