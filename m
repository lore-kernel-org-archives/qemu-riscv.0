Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F828EE57DF
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 05:55:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfZtD-0006PR-85; Mon, 11 Sep 2023 01:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qfZt2-0006O9-Rr; Mon, 11 Sep 2023 01:55:04 -0400
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qfZsy-0004IR-UF; Mon, 11 Sep 2023 01:55:04 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R381e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0Vrlp4R4_1694411683; 
Received: from 30.221.110.218(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vrlp4R4_1694411683) by smtp.aliyun-inc.com;
 Mon, 11 Sep 2023 13:54:44 +0800
Message-ID: <d98368f6-89f0-9a39-fc20-4cd3afdf4f52@linux.alibaba.com>
Date: Mon, 11 Sep 2023 13:53:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] qemu/timer: Add host ticks function for RISC-V
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, LIU Zhiwei <lzw194868@alibaba-inc.com>
References: <20230908032300.646-1-zhiwei_liu@linux.alibaba.com>
 <7dcb92db-b3c6-7236-cccd-fb6dc9d388a9@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <7dcb92db-b3c6-7236-cccd-fb6dc9d388a9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.97;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-97.freemail.mail.aliyun.com
X-Spam_score_int: -113
X-Spam_score: -11.4
X-Spam_bar: -----------
X-Spam_report: (-11.4 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2023/9/10 1:43, Richard Henderson wrote:
> On 9/7/23 20:23, LIU Zhiwei wrote:
>> From: LIU Zhiwei <lzw194868@alibaba-inc.com>
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> ---
>>   include/qemu/timer.h | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/include/qemu/timer.h b/include/qemu/timer.h
>> index 9a91cb1248..ce0b66d122 100644
>> --- a/include/qemu/timer.h
>> +++ b/include/qemu/timer.h
>> @@ -979,6 +979,25 @@ static inline int64_t cpu_get_host_ticks(void)
>>       return cur - ofs;
>>   }
>>   +#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 32
>> +static inline int64_t cpu_get_host_ticks(void)
>> +{
>> +    uint32_t lo, hi;
>> +    asm volatile("RDCYCLE %0\n\t"
>> +                 "RDCYCLEH %1"
>> +                 : "=r"(lo), "=r"(hi));
>> +    return lo | (uint64_t)hi << 32;
>> +}
>> +
>> +#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen > 32
>> +static inline int64_t cpu_get_host_ticks(void)
>> +{
>> +    int64_t val;
>> +
>> +    asm volatile("RDCYCLE %0" : "=r"(cc));
>> +    return val;
>> +}
>
> __riscv_xlen should never be undefined.
OK
>
> Don't you need a loop for RDCYCLEH to avoid time going backward?
>
>     do {
>         asm("rdcycleh %0\n\t"
>             "rdcycle %1\n\t"
>             "rdcycleh %2\n\t"
>             : "=r"(hi), "=r"(lo), "=r"(tmph));
>     } while (unlikely(tmph != hi));
>
Yes, I think we should do this for XLEN == 32bits.

Thanks,
Zhiwei

>
> r~

