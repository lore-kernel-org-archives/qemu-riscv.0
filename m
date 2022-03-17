Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUfbY-0003vt-LE
	for mharc-qemu-riscv@gnu.org; Wed, 16 Mar 2022 22:11:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nUfbW-0003uK-44; Wed, 16 Mar 2022 22:11:06 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:40274 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nUfbR-0003eQ-0p; Wed, 16 Mar 2022 22:11:05 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAC3vkKqmDJil2nMAw--.13141S2;
 Thu, 17 Mar 2022 10:10:52 +0800 (CST)
Subject: Re: [PATCH v2] target/riscv: write back unmodified value for
 csrrc/csrrs with rs1 is not x0 but holding zero
To: Alistair Francis <alistair23@gmail.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, wangjunqiang <wangjunqiang@iscas.ac.cn>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
References: <20220311094601.30440-1-liweiwei@iscas.ac.cn>
 <CAEUhbmX7wBzhvojSioQnB=T-DDuq9FX7UTPdvtR=oXHDm5Ra4A@mail.gmail.com>
 <769fe78f-e4c0-83c1-d5fc-65fbf40bb5ff@iscas.ac.cn>
 <CAKmqyKMpWFo5-=XSTBy_B9aTqDsw6-uxWfe3RwNnKUCKXQtjeQ@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <f5a1d76b-12a9-6d84-f73f-2dc523cfa4ee@iscas.ac.cn>
Date: Thu, 17 Mar 2022 10:10:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMpWFo5-=XSTBy_B9aTqDsw6-uxWfe3RwNnKUCKXQtjeQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAC3vkKqmDJil2nMAw--.13141S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWrWkGFy5AFyDXw4fXrWkJFb_yoW5Xw1Dp3
 y0qF4Yyr4kWF929w1vqw4rt3WYq3yrJryrXr4kJ34Yy3s0qF98Jr40yrsYkayDJr4Fyr12
 vFnFyr93uay5AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20x
 vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
 cVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 17 Mar 2022 02:11:06 -0000


在 2022/3/17 上午6:35, Alistair Francis 写道:
> On Thu, Mar 17, 2022 at 1:13 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>
>>>>            riscv_raise_exception(env, ret, GETPC());
>>>> @@ -90,7 +90,7 @@ void helper_csrw_i128(CPURISCVState *env, int csr,
>>>>    {
>>>>        RISCVException ret = riscv_csrrw_i128(env, csr, NULL,
>>>>                                              int128_make128(srcl, srch),
>>>> -                                          UINT128_MAX);
>>>> +                                          UINT128_MAX, true);
>>>>
>>>>        if (ret != RISCV_EXCP_NONE) {
>>>>            riscv_raise_exception(env, ret, GETPC());
>>>> @@ -104,7 +104,7 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
>>>>        Int128 rv = int128_zero();
>>>>        RISCVException ret = riscv_csrrw_i128(env, csr, &rv,
>>>>                                              int128_make128(srcl, srch),
>>>> -                                          int128_make128(maskl, maskh));
>>>> +                                          int128_make128(maskl, maskh), true);
>>>>
>>>>        if (ret != RISCV_EXCP_NONE) {
>>>>            riscv_raise_exception(env, ret, GETPC());
>>> I am afraid the adding of "bool write_op" argument was done on many
>>> functions, some of which do not look good to me, e.g.: predicate
>>> funcs. v1 is much better.*>
>> Yeah, I agree adding  argument to predicate is not a good idea. However
>> it seems that the csr(like seed)
>>
>> itself cannot  distinguish whether it's to be written or not except
>> these two ways(in v1 and v2).
>>
>> Or we can take seed CSR as a special case  in riscv_csrrw_check since no
>> other csr will limit itself
>>
>> to be accessed only with read-write instruction currently.
>>
>>> Or maybe, is that possible we do something in trans_csrrs() instead?
> That might be a better option. Unless there are other CSRs we expect
> to do this I think trans_csrr*() is probably the place to have this,
> similar to the `rd == 0` case.
>
> It could also go in helper_csrr() which would just be a simple if check.
>
> Alistair
>
Sorry. I don't understand what can be done in trans_csrr*(). As I said 
in last email: trans_csr*

have made all the read operation will go to the helper_csrr. However 
helper_csrr share the progress

of riscv_csrrw*  with helper_csrrw/helper_csrw to implement its function.

The truely question is that helper_csrr will call riscv_csrrw*with 
write_mask = zero, new_value=zero,

which cannot distinguished from the call from helper_csrrw of which its 
write_mask all can be zero

(origin from trans_csrrs/trans_csrrc when rs1 is not x0 and the value of 
rs1 reg is zero).

Regards,

Weiwei Li


>> The read and write operation in trans_csr*  have been truely
>> distinguished in original code:
>>
>> all the read operation will go to  the helper_csrr,  write to
>> helper_csrrw, read/write to helper_csrrw.
>>
>> However, they all go to the same progress  riscv_csrrw* in the helper
>> with different arguments.
>>
>> Regards,
>>
>> Weiwei Li
>>
>>> Regards,
>>> Bin
>>
>>
>>
>>


