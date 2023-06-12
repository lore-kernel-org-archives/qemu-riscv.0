Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2293C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 04:36:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8ZHX-0007rC-2J; Mon, 12 Jun 2023 00:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q8ZHV-0007qY-5i; Mon, 12 Jun 2023 00:35:53 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q8ZHQ-0005Ip-2E; Mon, 12 Jun 2023 00:35:52 -0400
Received: from [192.168.100.156] (unknown [203.168.25.149])
 by APP-05 (Coremail) with SMTP id zQCowACX8iyYoIZk90EbAQ--.49162S2;
 Mon, 12 Jun 2023 12:35:37 +0800 (CST)
Message-ID: <5037c47f-1277-4dfc-aa8a-3b62a06b97d7@iscas.ac.cn>
Date: Mon, 12 Jun 2023 12:35:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com
Subject: Re: [PATCH 3/4] target/riscv: Support MSTATUS.MPV/GVA only when RVH
 is enabled
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230529121719.179507-1-liweiwei@iscas.ac.cn>
 <20230529121719.179507-4-liweiwei@iscas.ac.cn>
 <7b8bc5a7-ccc1-a764-cb55-706b62a36a37@linux.alibaba.com>
 <91eb4769-bfc3-23da-0a97-cd91a93ec936@iscas.ac.cn>
 <ad06f409-5f14-75ea-9f9c-65a4b8596a3a@linux.alibaba.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <ad06f409-5f14-75ea-9f9c-65a4b8596a3a@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACX8iyYoIZk90EbAQ--.49162S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF18GF4xJryfAw43ZF4xWFg_yoW5GrW8pr
 1kAFW7JrW5Jr4kAr1IqF1UWry5tryUKa4UXr1kXF18JF4Dtrn09F1UZr1qgr1DXrW8Gr1j
 vF1jqwnrZF47ArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6x8DMxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
 0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
 W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRRGQ6PUUUUU==
X-Originating-IP: [203.168.25.149]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 2023/6/12 11:18, LIU Zhiwei wrote:
>
> On 2023/6/12 11:16, Weiwei Li wrote:
>>
>> On 2023/6/12 11:08, LIU Zhiwei wrote:
>>>
>>> On 2023/5/29 20:17, Weiwei Li wrote:
>>>> MPV and GVA bits are added by hypervisor extension to mstatus
>>>> and mstatush (if MXLEN=32).
>>>
>>> Have you found the CSR field specifications for them, especially for 
>>> GVA.
>>
>> Yeah.  in the section 9.4.1 of the privilege spec:
>>
>> "/The hypervisor extension adds two fields, MPV and GVA, to the 
>> machine-level mstatus or mstatush CSR/".
>
> I mean the WARL or other CSR field specifications here.

I don't quite get your idea. The only specification for MPV and GVA  I 
found is in section 9.4.1.  The spec for most of mstatus fields can be 
found in  Section 3.1.6
"Machine Status Registers (mstatus and mstatush)".

Regards,

Weiwei Li

>
> Zhiwei
>
>>
>> Regards,
>>
>> Weiwei Li
>>
>>>
>>> Zhiwei
>>>
>>>>
>>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>>> ---
>>>>   target/riscv/csr.c | 10 ++++------
>>>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>> index 58499b5afc..6ac11d1f11 100644
>>>> --- a/target/riscv/csr.c
>>>> +++ b/target/riscv/csr.c
>>>> @@ -1311,11 +1311,9 @@ static RISCVException 
>>>> write_mstatus(CPURISCVState *env, int csrno,
>>>>       }
>>>>         if (xl != MXL_RV32 || env->debugger) {
>>>> -        /*
>>>> -         * RV32: MPV and GVA are not in mstatus. The current plan 
>>>> is to
>>>> -         * add them to mstatush. For now, we just don't support it.
>>>> -         */
>>>> -        mask |= MSTATUS_MPV | MSTATUS_GVA;
>>>> +        if (riscv_has_ext(env, RVH)) {
>>>> +            mask |= MSTATUS_MPV | MSTATUS_GVA;
>>>> +        }
>>>>           if ((val & MSTATUS64_UXL) != 0) {
>>>>               mask |= MSTATUS64_UXL;
>>>>           }
>>>> @@ -1351,7 +1349,7 @@ static RISCVException 
>>>> write_mstatush(CPURISCVState *env, int csrno,
>>>>                                        target_ulong val)
>>>>   {
>>>>       uint64_t valh = (uint64_t)val << 32;
>>>> -    uint64_t mask = MSTATUS_MPV | MSTATUS_GVA;
>>>> +    uint64_t mask = riscv_has_ext(env, RVH) ? MSTATUS_MPV | 
>>>> MSTATUS_GVA : 0;
>>>>         env->mstatus = (env->mstatus & ~mask) | (valh & mask);


