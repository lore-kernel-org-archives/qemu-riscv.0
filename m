Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25015EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 00:44:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLYot-0002gu-3d; Mon, 17 Jul 2023 20:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qLYor-0002gX-H7; Mon, 17 Jul 2023 20:44:01 -0400
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qLYoo-0007B2-L5; Mon, 17 Jul 2023 20:44:01 -0400
Received: from [192.168.0.120] (unknown [180.175.26.191])
 by APP-03 (Coremail) with SMTP id rQCowAC312RC4LVkZcsbDA--.55003S2;
 Tue, 18 Jul 2023 08:43:47 +0800 (CST)
Message-ID: <21bd465f-9f27-be77-cb3b-2b44b5f1e837@iscas.ac.cn>
Date: Tue, 18 Jul 2023 08:43:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH] target/riscv: Fix LMUL check to use minimum SEW
Content-Language: en-US
To: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org
References: <20230706104433.16264-1-rbradford@rivosinc.com>
 <dfc75d1f-f28d-7d2c-26f9-72086ffb54ca@iscas.ac.cn>
 <7a102598badfaa01b0e0c04e4f59e81eac5a2b81.camel@rivosinc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <7a102598badfaa01b0e0c04e4f59e81eac5a2b81.camel@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAC312RC4LVkZcsbDA--.55003S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWrWkKw1kKw18uw4rGF1kAFb_yoWrGr15pF
 W8JFW7tFy8X34xZr12q3WDX3y0vF48G3WUJrnYqa4UJws8Gr1qvFn0qF1q9F18AF4fJr1j
 qa4jv3WfZrZ8AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1a9aPUUUU
 U==
X-Originating-IP: [180.175.26.191]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.81; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
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


On 2023/7/17 23:13, Rob Bradford wrote:
> On Thu, 2023-07-06 at 21:22 +0800, Weiwei Li wrote:
>> On 2023/7/6 18:44, Rob Bradford wrote:
>>> The previous check was failing with:
>>>
>>> ELEN = 64 SEW = 16 and LMUL = 1/8 (encoded as 5) which is a valid
>>> combination.
>>>
>>> Fix the check to correctly match the specification by using minimum
>>> SEW
>>> rather than the active SEW.
>>>
>>>   From the specification:
>>>
>>> "In general, the requirement is to support LMUL ≥ SEWMIN/ELEN,
>>> where
>>> SEWMIN is the narrowest supported SEW value and ELEN is the widest
>>> supported SEW value. In the standard extensions, SEWMIN=8. For
>>> standard
>>> vector extensions with ELEN=32, fractional LMULs of 1/2 and 1/4
>>> must be
>>> supported. For standard vector extensions with ELEN=64, fractional
>>> LMULs
>>> of 1/2, 1/4, and 1/8 must be supported."
>>>
>>>   From inspection this new check allows:
>>>
>>> ELEN=64 1/2, 1/4, 1/8 (encoded as 7, 6, 5 respectfully)
>>> ELEN=32 1/2, 1/4 (encoded as 7 and 6 respectfully)
> Hi Weiwei Li,
>
> Thanks for your reply. Sorry for delay in replying i've been away.
>
>> This is a little confusing.  there is  note in spec to explain why
>> LMUL
>> ≥ SEW MIN /ELEN:
>>
>> "When LMUL < SEW MIN /ELEN, there is no guarantee an implementation
>> would have enough bits in the fractional vector register to store
>>
>> Note at least one element, as VLEN=ELEN is a valid implementation
>> choice. For example, with VLEN=ELEN=32, and SEW MIN =8, an LMUL of
>>
>> 1/8 would only provide four bits of storage in a vector register."
>>
>> In this way, when VLEN=ELEN=64,  an LMUL of 1/8 would only provide 8
>> bits of storage in a vector register, so it's also not suitable for
>> sew
>> = 16.
>>
>> Maybe we can explain the above description of the spec in another
>> way:
>> we must support lmul=1/8 when ELEN=64, but it's only available when
>> sew = 8.
>>
> I'm afraid i'm not sure I agree with this comment.
>
> VLEN=128 ELEN=64 SEW=16 LMUL=1/8 is a perfectly reasonable
> configuration and contradicts your statement.
>
> The goal of my patch was to ensure that we permit a valid configuration
> not to also reject other invalid configurations.
>
> An extra check that takes into consideration VLEN would also make sense
> to me:
>
> e.g. VLEN=64 LMUL=1/8 SEW=16 should be rejected

Yeah. I agree. But instead of an extra check, I think VLEN is the one 
that really works instead of ELEN.

Such as when ELEN=32,  LMUL=1/8 with SEW=8 is also a reasonable 
configuration  if VLEN >= 64.

Regards,

Weiwei Li

>
> Cheers,
>
> Rob
>
>> Regards,
>>
>> Weiwei Li
>>
>> `
>>
>> Regards,
>>
>> Weiwei Li
>>
>>> Fixes: d9b7609a1fb2 ("target/riscv: rvv-1.0: configure
>>> instructions")
>>>
>>> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
>>> ---
>>>    target/riscv/vector_helper.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/riscv/vector_helper.c
>>> b/target/riscv/vector_helper.c
>>> index 1e06e7447c..8dfd8fe484 100644
>>> --- a/target/riscv/vector_helper.c
>>> +++ b/target/riscv/vector_helper.c
>>> @@ -43,9 +43,9 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env,
>>> target_ulong s1,
>>>                                                xlen - 1 -
>>> R_VTYPE_RESERVED_SHIFT);
>>>    
>>>        if (lmul & 4) {
>>> -        /* Fractional LMUL. */
>>> +        /* Fractional LMUL - check LMUL >= ELEN/SEW_MIN (8) */
>>>            if (lmul == 4 ||
>>> -            cpu->cfg.elen >> (8 - lmul) < sew) {
>>> +            cpu->cfg.elen >> (8 - lmul) < 8) {
>>>                vill = true;
>>>            }
>>>        }


