Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B962C3ABBC
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 May 2025 18:59:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uC12O-0000dR-Md; Mon, 05 May 2025 14:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uC12L-0000cF-VL
 for qemu-riscv@nongnu.org; Mon, 05 May 2025 14:59:35 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uC12I-0007u7-OA
 for qemu-riscv@nongnu.org; Mon, 05 May 2025 14:59:33 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-7390d21bb1cso5081019b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 05 May 2025 11:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746471569; x=1747076369; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A7CuY77gO+ycPjhJR+jqTUZ/MuIElViaSpNHT9rkCNo=;
 b=dkwcPCrEKLzyCJPqJdnRSHbzv93vjgitQ69og6M3ILYGelkzNbWv7PvQRdg4lric7e
 IrgYQAqDEPFyo4jLi8pJ+/8gq8FLw5NaooROeAcDyH2hqpNn9udC5yoGHGdOvLPt4kmi
 Qr0mzorI7tJX9oWjcVahJONcQS36EiycsEzkAKcyQAc5WUQWMZDrg4nPYmK500UAAatG
 IRUO8LLmu0z+nWUEp+cS35v5paY3qLimNsiSBiw8pf92+12iGljJgsoFDul+DmbOh/1Z
 W9b+oLIiM4aNx+5Akaltlbga6Uo+Ez3pcAlKuUfEXVhasNhiYiiQ6QqOSQA8ydj6pKi3
 jGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746471569; x=1747076369;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A7CuY77gO+ycPjhJR+jqTUZ/MuIElViaSpNHT9rkCNo=;
 b=wIVE+q0KAo4e+Jdvm2fy7j6WIZOZJq2AqR5PYYPIqpBq78PCq++OYBcVu9Xx8+HW10
 wNLFUeM7vduF21LE3bkIVvQQZdz5x0Q7D6xPLVCUgZ1bXKxLzaxjwm7Vd52tWm871Axj
 p7PfHPC9dK0jEVwzNg/2dLCt6zkEirXxgDi/m6VBZ0Jsw5GGbtvn5wOr2zCKYxZMBGK6
 xk+/U96kD7C9kIce8nNnmB2yjyUqdYdvqMupiBgQ3mYMi8kJsMQGeABhdo0QzqedC3XQ
 y6VX7uFvbrsoQsSZ1JL13W8wts48eZBxj8juyA91bJFNQd1ZAN6UPcpVcgni38yOnLiQ
 6XAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaHBSvobbVECDya0N6RY75ile9kch80QqMqEwANUCUGWO+lhZsWgicb5QG2oVefYPMX1FuVc2xxoVf@nongnu.org
X-Gm-Message-State: AOJu0YyVR44K9OY6aERy9sD/Pl71+kgsw3ey8TTczsrsGj2it0rxU1wb
 SICxZuYlj6d5pMmewUxvXG2RbVqvBN4M6pOS51X4ApdLUZ0iIkRpKpvysAXAqy7tFy77+w+orAF
 J
X-Gm-Gg: ASbGncuLEwLszHLBYIF/ysMMNwXL3jY4ZtEBDEa9I64tXq3zypdkTJNBGFf9vjIEymn
 hz3G9NWsXcbq12fGIDI/qXYMDiiJslwoHtvBsKeLUF9FHYmNfEeFriQt/smB25/TjixeiPP+wtL
 j2aKNllSSgNolnDB7D1Y3Ed7+DldR1reHe1c3Qlwbi60+sI274dBKetXCJOXpDgIgCEyrCpe/nK
 POOs5FA5Tdz3B8E4hAJgFNOx4l4f9skV0IQNQmLoiAo6WlfbdHLti0CJNwiFXWvAXCcIx0oyW5e
 bOpRw1/dtuDK2azP9tm6JxRYAc5xpHODeh42ygWCiR/q6m6ma8FP+J/lvl/7IbOdHxWbgYScVpn
 SEXi1Oe3lR7gCUaEopA==
X-Google-Smtp-Source: AGHT+IFtx/Xz3ZHyZJ9pqB72YEver0dszK8ydQaxSDRWE6dCehUNlZnNCnmh+KYwqNRHT8NIGtvzkw==
X-Received: by 2002:a05:6a00:420c:b0:736:5e28:cfba with SMTP id
 d2e1a72fcca58-74058ae70aemr20715150b3a.18.1746471568944; 
 Mon, 05 May 2025 11:59:28 -0700 (PDT)
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74058d7a3a6sm7193733b3a.2.2025.05.05.11.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 11:59:27 -0700 (PDT)
Message-ID: <702b4c82-653d-4782-8805-c4ff9a1155ae@linaro.org>
Date: Mon, 5 May 2025 11:59:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] target/riscv: Fill in TCGCPUOps.pointer_wrap
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: foss@percivaleng.com, qemu-riscv@nongnu.org
References: <20250504205714.3432096-1-richard.henderson@linaro.org>
 <20250504205714.3432096-10-richard.henderson@linaro.org>
 <e8db1ec3-fcb3-42d1-a488-cf55d6060904@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e8db1ec3-fcb3-42d1-a488-cf55d6060904@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 5/5/25 09:47, Philippe Mathieu-Daudé wrote:
> On 4/5/25 22:57, Richard Henderson wrote:
>> Check 32 vs 64-bit and pointer masking state.
>>
>> Cc: qemu-riscv@nongnu.org
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/riscv/tcg/tcg-cpu.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>> index 55e00972b7..267186e5e3 100644
>> --- a/target/riscv/tcg/tcg-cpu.c
>> +++ b/target/riscv/tcg/tcg-cpu.c
>> @@ -237,6 +237,31 @@ static void riscv_restore_state_to_opc(CPUState *cs,
>>       env->excp_uw2 = data[2];
>>   }
>> +#ifndef CONFIG_USER_ONLY
>> +static vaddr riscv_pointer_wrap(CPUState *cs, int mmu_idx,
>> +                                vaddr result, vaddr base)
>> +{
>> +    CPURISCVState *env = cpu_env(cs);
>> +    uint32_t pm_len;
>> +    bool pm_signext;
>> +
>> +    if (cpu_address_xl(env) == MXL_RV32) {
>> +        return (uint32_t)result;
>> +    }
>> +
>> +    pm_len = riscv_pm_get_pmlen(riscv_pm_get_pmm(env));
>> +    if (pm_len == 0) {
>> +        return result;
>> +    }
>> +
>> +    pm_signext = riscv_cpu_virt_mem_enabled(env);
>> +    if (pm_signext) {
>> +        return sextract64(result, 0, 64 - pm_len);
>> +    }
>> +    return extract64(result, 0, 64 - pm_len);
> 
> Is this safe for MXL_RV128?

The RV128 implementation only uses 64-bit pointers, so, yes.


r~

