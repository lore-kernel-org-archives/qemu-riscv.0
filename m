Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78EDC7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:11:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8XxU-0000Ht-0b; Sun, 11 Jun 2023 23:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q8XxT-0000H9-4f; Sun, 11 Jun 2023 23:11:07 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q8XxO-0000EH-0g; Sun, 11 Jun 2023 23:11:06 -0400
Received: from [192.168.100.156] (unknown [203.168.25.149])
 by APP-01 (Coremail) with SMTP id qwCowAAnhyy2jIZk2Ja0AQ--.2309S2;
 Mon, 12 Jun 2023 11:10:47 +0800 (CST)
Message-ID: <c0c093f2-908b-3084-ab4d-a9e3d6d663a5@iscas.ac.cn>
Date: Mon, 12 Jun 2023 11:10:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com
Subject: Re: [PATCH 1/4] target/riscv: Make MPV only work when MPP != PRV_M
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230529121719.179507-1-liweiwei@iscas.ac.cn>
 <20230529121719.179507-2-liweiwei@iscas.ac.cn>
 <271fae50-e4a9-0cf0-6697-e9ada4eff41f@linux.alibaba.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <271fae50-e4a9-0cf0-6697-e9ada4eff41f@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAnhyy2jIZk2Ja0AQ--.2309S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr1xCr17Kw1UWw43tryUAwb_yoW5Gw45pr
 4kGrW7GFWDCrWkC3WIqr1UGryUJr4DGw1UJr1kAF1UJr45Jr4q9F4DXr1jgr1UJr48Jr1j
 vF1UZryDZF47ZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCj5wCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
 x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
 0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7sRRGQ6PUUUUU==
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


On 2023/6/12 10:45, LIU Zhiwei wrote:
>
> On 2023/5/29 20:17, Weiwei Li wrote:
>> Upon MRET or explicit memory access with MPRV=1, MPV should be ignored
>> when MPP=PRV_M.
> Does MPP==PRV_M always indicate the MPV==0?

No, I think . The spec doesn't restrict this. When MPP=PRV_M, MPV wll be 
0 in normal case.

But users can set MPV=1 by write to mstatus CSR directly.

As described in spec, "When an MRET instruction is executed, the 
virtualization mode V is set to MPV, unless

MPP=3, in which case V remains 0."

MPV is just ignored if MPP = 3. This also can be seen in "table 9.5 
Effect of MPRV on the translation and protection of explicit memory 
accesses".

Regards,

Weiwei Li

>
> Zhiwei
>
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu_helper.c | 3 ++-
>>   target/riscv/op_helper.c  | 3 ++-
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 09ea227ceb..bd892c05d4 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -46,7 +46,8 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool 
>> ifetch)
>>             if (mode == PRV_M && get_field(status, MSTATUS_MPRV)) {
>>               mode = get_field(env->mstatus, MSTATUS_MPP);
>> -            virt = get_field(env->mstatus, MSTATUS_MPV);
>> +            virt = get_field(env->mstatus, MSTATUS_MPV) &&
>> +                   (mode != PRV_M);
>>               if (virt) {
>>                   status = env->vsstatus;
>>               }
>> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
>> index f563dc3981..9cdb9cdd06 100644
>> --- a/target/riscv/op_helper.c
>> +++ b/target/riscv/op_helper.c
>> @@ -335,7 +335,8 @@ target_ulong helper_mret(CPURISCVState *env)
>>           riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, 
>> GETPC());
>>       }
>>   -    target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV);
>> +    target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV) &&
>> +                             (prev_priv != PRV_M);
>>       mstatus = set_field(mstatus, MSTATUS_MIE,
>>                           get_field(mstatus, MSTATUS_MPIE));
>>       mstatus = set_field(mstatus, MSTATUS_MPIE, 1);


