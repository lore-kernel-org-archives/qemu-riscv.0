Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DC9C7EE2E
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:17:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8Y37-0002hR-Mf; Sun, 11 Jun 2023 23:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q8Y36-0002gF-C2; Sun, 11 Jun 2023 23:16:56 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q8Y34-0002Qt-Dz; Sun, 11 Jun 2023 23:16:56 -0400
Received: from [192.168.100.156] (unknown [203.168.25.149])
 by APP-01 (Coremail) with SMTP id qwCowAAnhywfjoZkFoK1AQ--.2363S2;
 Mon, 12 Jun 2023 11:16:49 +0800 (CST)
Message-ID: <91eb4769-bfc3-23da-0a97-cd91a93ec936@iscas.ac.cn>
Date: Mon, 12 Jun 2023 11:16:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/4] target/riscv: Support MSTATUS.MPV/GVA only when RVH
 is enabled
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230529121719.179507-1-liweiwei@iscas.ac.cn>
 <20230529121719.179507-4-liweiwei@iscas.ac.cn>
 <7b8bc5a7-ccc1-a764-cb55-706b62a36a37@linux.alibaba.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <7b8bc5a7-ccc1-a764-cb55-706b62a36a37@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAnhywfjoZkFoK1AQ--.2363S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trWxJF1rJFy8Aw1fZw4UXFb_yoW8Zw45pr
 1kJrWUWry5GrWkJ3WxJr1UWry5JryUG3WDAr18XF18JF45Jr1Y9F1UXrnFgr1DXrW8Jr1j
 vF1UXwnrZF47AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCj5wCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
 x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
 0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUeMKtUUUUU=
X-Originating-IP: [203.168.25.149]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.093,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 2023/6/12 11:08, LIU Zhiwei wrote:
>
> On 2023/5/29 20:17, Weiwei Li wrote:
>> MPV and GVA bits are added by hypervisor extension to mstatus
>> and mstatush (if MXLEN=32).
>
> Have you found the CSR field specifications for them, especially for GVA.

Yeah.  in the section 9.4.1 of the privilege spec:

"/The hypervisor extension adds two fields, MPV and GVA, to the 
machine-level mstatus or mstatush CSR/".

Regards,

Weiwei Li

>
> Zhiwei
>
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/csr.c | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 58499b5afc..6ac11d1f11 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1311,11 +1311,9 @@ static RISCVException 
>> write_mstatus(CPURISCVState *env, int csrno,
>>       }
>>         if (xl != MXL_RV32 || env->debugger) {
>> -        /*
>> -         * RV32: MPV and GVA are not in mstatus. The current plan is to
>> -         * add them to mstatush. For now, we just don't support it.
>> -         */
>> -        mask |= MSTATUS_MPV | MSTATUS_GVA;
>> +        if (riscv_has_ext(env, RVH)) {
>> +            mask |= MSTATUS_MPV | MSTATUS_GVA;
>> +        }
>>           if ((val & MSTATUS64_UXL) != 0) {
>>               mask |= MSTATUS64_UXL;
>>           }
>> @@ -1351,7 +1349,7 @@ static RISCVException 
>> write_mstatush(CPURISCVState *env, int csrno,
>>                                        target_ulong val)
>>   {
>>       uint64_t valh = (uint64_t)val << 32;
>> -    uint64_t mask = MSTATUS_MPV | MSTATUS_GVA;
>> +    uint64_t mask = riscv_has_ext(env, RVH) ? MSTATUS_MPV | 
>> MSTATUS_GVA : 0;
>>         env->mstatus = (env->mstatus & ~mask) | (valh & mask);


