Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E034DD6A22D
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 21:06:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBh2M-0003XR-MJ; Thu, 14 Nov 2024 16:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBh25-0003RL-Td
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 16:05:43 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBh22-0000Qo-UN
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 16:05:41 -0500
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso19169301fa.3
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2024 13:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731618337; x=1732223137; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pWlnoTNls266dh3rTxML6If/W5HjOvej1W8Ls+0tjpA=;
 b=dI4ORW9L27iPzFKQEHWjhJXuc8O7WvU4r3/WcMyql/1VAXzaucIFVSHyGHe1SkRYXq
 +hLSDD7woWne9UFN6QmYeabYKlrzqlRmTcTJISNRQBVEfYY4OCW7GZRCdSPA9yJ+pN8p
 pHPFMtwLLkGPSnIiII2y/2ZlDAkoMTrugbQxTbzPe02xYJrrEWKBImry4SZZKXciNQgg
 seVvDp53T5CkiPWJV77SprYIC+1UNjwhlOcv7bchEEzkpeHBRb9SkUZLOYEkCfJtdbOi
 Icz6Mh48h/akQq6PC83+YLYfv9F/8ReUTx8zp4p/dztGLesqIuZWRq83a1BDCtwvaI0e
 R+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731618337; x=1732223137;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pWlnoTNls266dh3rTxML6If/W5HjOvej1W8Ls+0tjpA=;
 b=gGGzLSTjBcVHbg289V+4rn3RbNtnKMyNqg7zr0iAjzI86VXkt/NH2Y5Bkch00pFnNs
 dCSWCh1GfOnZyoDdwODYHinRjWS+j5+AWCTnNEC9dxRHqEkSWdZsXYhpb/gO2LJzfBIN
 g4qO74T4KqTabPrzlFfJAvHLGhtWF51XjxNx9mke80XugqpuFxmcIQ1K1N7kXC3GjKEB
 KsN8Bfv/36D26MiDiEh1Hj6xlL7NwLF7Rvh9VDpZXjnksApheK84rFnYXF8TDdGk/3Wv
 aGYQLEXa/2eaBfImfToqALomc4jooesycOmlojVgBPNeST3tpaLo8fAgZeJz1prEgZH0
 69Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqvBt1FAekPDHaIXsr6TWqKjeT9oHJ/zZJXu/EBdtiKxWRDNHr5E8E/wP3gp4YcZL9TTdoyLDcAt7+@nongnu.org
X-Gm-Message-State: AOJu0YzXQeMyyRKC8SqZw6xG4/QYJHLi37tG2qR6aQRtkHu2HN5Ol98H
 eg87sYiShKYY4O6bYx9DEZXQ5cBqiocNY2UFm+p7Hv2hpi5QOPPlMhWQJQ05lqA=
X-Google-Smtp-Source: AGHT+IF/+vE2NIeTr2lZCJQFM30ZJCtPOWIen71zHtBQd5fnu7UeuvR9wsTaDjhfo7F8SNDvRzsw1Q==
X-Received: by 2002:a05:651c:160e:b0:2fb:510c:7237 with SMTP id
 38308e7fff4ca-2ff60715466mr3722871fa.41.1731618336989; 
 Thu, 14 Nov 2024 13:05:36 -0800 (PST)
Received: from [192.168.69.126] ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e045438sm102112866b.158.2024.11.14.13.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 13:05:36 -0800 (PST)
Message-ID: <c072c343-c90c-49f4-9657-3f946a02f92e@linaro.org>
Date: Thu, 14 Nov 2024 22:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/24] exec: Declare tlb_reset_dirty*() in 'exec/cputlb.h'
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-14-philmd@linaro.org>
 <1c700309-abc5-4b5d-9a40-d00b7a7a13a2@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <1c700309-abc5-4b5d-9a40-d00b7a7a13a2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x233.google.com
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

On 14/11/24 19:19, Richard Henderson wrote:
> On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
>> Move CPU TLB related methods to "exec/cputlb.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/exec/cputlb.h   | 7 +++++++
>>   include/exec/exec-all.h | 3 ---
>>   include/exec/ram_addr.h | 1 +
>>   system/physmem.c        | 1 +
>>   4 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
>> index ef18642a32..6cac7d530f 100644
>> --- a/include/exec/cputlb.h
>> +++ b/include/exec/cputlb.h
>> @@ -32,4 +32,11 @@ void tlb_unprotect_code(ram_addr_t ram_addr);
>>   #endif /* CONFIG_TCG */
>> +#ifndef CONFIG_USER_ONLY
>> +
>> +void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t 
>> length);
>> +void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
>> +
>> +#endif
>> +
>>   #endif
> 
> This can join the existing CONFIG_TCG, !CONFIG_USER_ONLY block above.

Actually they are used by all accelerators (thus prototype required),
but elided at build time:

static inline
void cpu_physical_memory_dirty_bits_cleared(ram_addr_t start,
                                             ram_addr_t length)
{
     if (tcg_enabled()) {
         tlb_reset_dirty_range_all(start, length);
     }

}

That said, we can probably to smth to improve that. I'll have
a look.

