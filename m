Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poZWv-0001Bt-ON
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 20:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1poZWo-0001BX-By; Mon, 17 Apr 2023 20:49:02 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1poZWk-0001Xe-NC; Mon, 17 Apr 2023 20:49:01 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-01 (Coremail) with SMTP id qwCowADncdTr6D1kJeyqBQ--.55246S2;
 Tue, 18 Apr 2023 08:48:44 +0800 (CST)
Message-ID: <4c4bad4b-2b43-e2d7-643c-fdc463724462@iscas.ac.cn>
Date: Tue, 18 Apr 2023 08:48:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH 6/6] accel/tcg: Remain TLB_INVALID_MASK in the address
 when TLB is re-filled
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-7-liweiwei@iscas.ac.cn>
 <a256a5fd-e408-74a3-5476-694d216e08d8@ventanamicro.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <a256a5fd-e408-74a3-5476-694d216e08d8@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADncdTr6D1kJeyqBQ--.55246S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww1rtFW5Cw4rCr1fZw43ZFb_yoW5Jr13pr
 Z5tr1UKFW8Jr92kw17Jw17ZFyUGr1UJw4UJr1rK3Z8ZrnxXrn2qr17X3yjgr1UXrW8Zr1j
 yr1qqryDZFyYqFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
 WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.284,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 18 Apr 2023 00:49:02 -0000


On 2023/4/18 00:25, Daniel Henrique Barboza wrote:
>
>
> On 4/13/23 06:01, Weiwei Li wrote:
>> When PMP entry overlap part of the page, we'll set the tlb_size to 1, 
>> and
>> this will make the address set with TLB_INVALID_MASK to make the page
>> un-cached. However, if we clear TLB_INVALID_MASK when TLB is 
>> re-filled, then
>> the TLB host address will be cached, and the following instructions 
>> can use
>> this host address directly which may lead to the bypass of PMP 
>> related check.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>
> For this commit I believe it's worth mentioning that it's partially 
> reverting
> commit c3c8bf579b431b6b ("accel/tcg: Suppress auto-invalidate in
> probe_access_internal") that was made to handle a particularity/quirk 
> that was
> present in s390x code.
>
> At first glance this patch seems benign but we must make sure that no 
> other
> assumptions were made with this particular change in 
> probe_access_internal().

I think this change will introduce no external function change except 
that we should

always walk the page table(fill_tlb) for memory access to that page. And 
this is needed

for pages that are partially overlapped by PMP region.

Regards,

Weiwei Li


>
>
> Thanks,
>
> Daniel
>
>>   accel/tcg/cputlb.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index e984a98dc4..d0bf996405 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -1563,13 +1563,6 @@ static int probe_access_internal(CPUArchState 
>> *env, target_ulong addr,
>>               /* TLB resize via tlb_fill may have moved the entry.  */
>>               index = tlb_index(env, mmu_idx, addr);
>>               entry = tlb_entry(env, mmu_idx, addr);
>> -
>> -            /*
>> -             * With PAGE_WRITE_INV, we set TLB_INVALID_MASK 
>> immediately,
>> -             * to force the next access through tlb_fill. We've just
>> -             * called tlb_fill, so we know that this entry *is* valid.
>> -             */
>> -            flags &= ~TLB_INVALID_MASK;
>>           }
>>           tlb_addr = tlb_read_ofs(entry, elt_ofs);
>>       }


