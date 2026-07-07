Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD6FC44501
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 18:16:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1whAKq-0004N1-Ju; Tue, 07 Jul 2026 14:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1whAKT-0003tJ-Rx
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 14:15:35 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1whAKS-0006FS-6m
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 14:15:33 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2cace7da66eso43596475ad.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2026 11:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783448131; x=1784052931; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=n6ZnUu7p43qhppjSI5TV78JCU7uRyyoM+0DlhftBQVo=;
 b=JNHuMfJPUQuev/sFQIY55yI2fJ1wORYYA48kbbNehcRu8jUwMmmnzqlaSJyOouWeh+
 8hiLxfCzsCOBG8SM20UczYI2+0lGmce7A5uAhXb6gGvVkoR2fBx6aV1VUGQKwz5INS30
 a8IWJtRJ53smBjTRnee5Hm7ACZ2ZZvmDML0FQzdpugN10HqGi0bYHVok0Y/62DfPUto9
 Bshsn0hwU6Fs1sewXVw+HcQAsLEzDb5v0lyVtG9/v/KAjCNCxqhJ5VGtZlghEVepeI9c
 o6x6XCVVLmCFIu4Zcwhl5XrPrBcoQuzy0D91665Djj98oNpsJPis6DUDxS2ZTn/KoscS
 0AtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783448131; x=1784052931;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=n6ZnUu7p43qhppjSI5TV78JCU7uRyyoM+0DlhftBQVo=;
 b=XgBi47EIbdfAYpK4ul+xBY4WBIZNHWlbEK0KetcQa1NjLIs1jQun4OdXZ7BBonUZHp
 zgT3V2jLG4Nef2p2OpBpQE4W4dp6XVdMXzax4omASXjz6i9iE1XLa/xSC7b021fNPZvo
 SdPUbYZtXYY/Fubg55v+Kl8NjjlgWgED3Wg6aQDy4nDE8KdVAYQ8d3QZsLWEFGrCBJCX
 foxjiZLwQvdWTL9KA9NmLAnxfl28rcVC52QsE33EXzSJ5z4dsLVhR4df2S8PGTMahJJN
 bMyA5YAhp6bNkHKq0FoWLhkMSVi/T3Ti/3E2ejzGpNCfYBUo+zc1cX7/YKdVH3SDtifu
 ezjA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrzfQyr2nyXsFUEJi5/4hC6MDODE8N5j0l4MT9MxgpwTTgxFL6WZswM9nioAh6CNGLWyYnhU4UkVq9k@nongnu.org
X-Gm-Message-State: AOJu0YwBzvF6MysmddTV+0G8ijiFz/7yI9iKcFeHMsuTPB1YTf6d3dOZ
 0f9Hfr1d8SXn0k2wAi2SME64+xA4+rfjw8PEVF9zM/SliEmn8Q/H3ys+4u4Pvd/q0MI=
X-Gm-Gg: AfdE7cnu4pQDt/+OvpzkQAnv1xnIYgfdaJf91qOlWfVisC4Mzh2DdxnNZYdNMIeVjtH
 KkrfabRzH5CqWki8Oau1TuuSiqwFbJXz1izyS07iGuQOMkM6LDnI4R6mfSVGrkg/0uGSx4HH3Zj
 /71J9wKc8lgXFm5vZdzR9BRcoN7bpkMPOjxW/SSfklqyvqHtD0BSrAibw7IAyiMGYyunUuj/mdC
 vvrj7/lRDb+rw0mjzKigSWeSlVx/Vci1rkgB6sK1jSB3AqBzCI7wMUN2AufIuLe+UYTFfztG/GI
 Fwlw8QeBYVDANllmTrI/kc0pQc2u9b4BB0sGVsa3cF6MgJF92mdDY96HbuRv9pMOYJKGcMbLJ8k
 zGWe2bqwJ29vhZgJFQjYZ8/2mZ6pZ3m5COozElscO8xZNXPENFqkGf2SgJ4bM8mTNyW9mMdvP1p
 2IpWXSSGuKcZMkHyyHhlo0lwbuqOlPg5dhbLvpSRiCVYDxA3MEmR7mJkk=
X-Received: by 2002:a17:902:e88d:b0:2cc:9179:325 with SMTP id
 d9443c01a7336-2ccbe720304mr58776705ad.13.1783448129843; 
 Tue, 07 Jul 2026 11:15:29 -0700 (PDT)
Received: from [192.168.0.4] (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bc42sm16111515ad.63.2026.07.07.11.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 11:15:29 -0700 (PDT)
Message-ID: <4ad532fd-8f64-4a1e-a369-4edb00bef599@linaro.org>
Date: Tue, 7 Jul 2026 11:15:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tcg/x86_64: declare MO_ATOM_WITHIN16 host atomicity
 support
From: Richard Henderson <richard.henderson@linaro.org>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: daniel.barboza@oss.qualcomm.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20260707122819.114105-1-andrew.jones@oss.qualcomm.com>
 <38651779-9181-4f22-93cc-23fc508ac9ce@linaro.org>
Content-Language: en-US
In-Reply-To: <38651779-9181-4f22-93cc-23fc508ac9ce@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 7/7/26 10:46, Richard Henderson wrote:
> On 7/7/26 05:28, Andrew Jones wrote:
>> Just like aarch64's prepare_host_addr(), x86_64 should use
>> MO_ATOM_WITHIN16 for the memop when it's capable. Unlike aarch64,
>> which needs to check a CPU feature, x86 has been capable since P6
>> family processors and newer (see Intel SDM Vol. 3 §11.1.1).
>>
>> Since a 16-byte aligned region always fits within a 16-byte multiple
>> sized cache line (x86_64 implementations always have cache lines of
>> at least 64 bytes), then this enables riscv cpu models with Zama16b
>> to use the fast path, just as cpu models without Zama16b do.
>>
>> Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
>> ---
>>   tcg/x86_64/tcg-target.c.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tcg/x86_64/tcg-target.c.inc b/tcg/x86_64/tcg-target.c.inc
>> index 92251f832738..99b6559eed88 100644
>> --- a/tcg/x86_64/tcg-target.c.inc
>> +++ b/tcg/x86_64/tcg-target.c.inc
>> @@ -1934,7 +1934,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, 
>> HostAddress *h,
>>           *h = x86_guest_base;
>>       }
>>       h->base = addr;
>> -    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, s_bits == MO_128);
>> +    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_WITHIN16, s_bits == MO_128);
>>       a_mask = (1 << h->aa.align) - 1;
>>       if (tcg_use_softmmu) {
> 
> You should update both uses of atom_and_align_for_opc.
> 
> With that,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I'll update this myself and queue for today's PR.

r~

