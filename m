Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pogYX-0008VR-Ip
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 04:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pogYN-0008RK-Ve; Tue, 18 Apr 2023 04:19:08 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pogYL-0005OE-S6; Tue, 18 Apr 2023 04:19:07 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-01 (Coremail) with SMTP id qwCowAAXXJxtUj5kK7TXBQ--.58260S2;
 Tue, 18 Apr 2023 16:18:54 +0800 (CST)
Message-ID: <b453715e-d740-c11c-bcf1-7315a6781c79@iscas.ac.cn>
Date: Tue, 18 Apr 2023 16:18:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH 6/6] accel/tcg: Remain TLB_INVALID_MASK in the address
 when TLB is re-filled
To: Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-7-liweiwei@iscas.ac.cn>
 <a256a5fd-e408-74a3-5476-694d216e08d8@ventanamicro.com>
 <e2288c5f-b4a1-9105-6c2e-60e51decd91d@linaro.org>
 <e6fea4f5-4750-30df-4ce4-e2d36f5e4664@linaro.org>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <e6fea4f5-4750-30df-4ce4-e2d36f5e4664@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAXXJxtUj5kK7TXBQ--.58260S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4UJFyUXF17uw15ZFW8WFg_yoW8Zw18pr
 48KF4UCryUJryxtw1xtr18ZFyYyr4DJw1DXw1rt3WUA347Ar1qgr17Xr4q9r1UJr4kWr1U
 Ar1UXry5ZFy5JFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JUZa9-UUUUU=
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
X-List-Received-Date: Tue, 18 Apr 2023 08:19:08 -0000


On 2023/4/18 15:36, Richard Henderson wrote:
> On 4/18/23 09:18, Richard Henderson wrote:
>>>> -            /*
>>>> -             * With PAGE_WRITE_INV, we set TLB_INVALID_MASK 
>>>> immediately,
>>>> -             * to force the next access through tlb_fill. We've just
>>>> -             * called tlb_fill, so we know that this entry *is* 
>>>> valid.
>>>> -             */
>>>> -            flags &= ~TLB_INVALID_MASK;
>>
>>
>> I missed the original patch, but this is definitely wrong.
>>
>> Clearing this bit locally (!) is correct because we want to inform 
>> the caller of probe_access_* that the access is valid. We know that 
>> it is valid because we have just queried tlb_fill (and thus for 
>> riscv, PMP).
>>
>> Clearing the bit locally does *not* cause the tlb entry to be cached 
>> -- the INVALID bit is still set within the tlb entry. The next access 
>> will again go through tlb_fill.
>>
>> What is the original problem you are seeing?  The commit message does 
>> not say.
>
> From 
> https://lore.kernel.org/qemu-devel/3ace9e9e-91cf-36e6-a18f-494fd44dffab@iscas.ac.cn/
> I see that it is a problem with execution.
Yeah. I found this problem in PMP check for instruction fetch.
>
> By eye, it appears that get_page_addr_code_hostp needs adjustment, e.g.
>
>     (void)probe_access_internal(env, addr, 1, MMU_INST_FETCH,
>                                 cpu_mmu_index(env, true), false, &p, 
> &full, 0);
>     if (p == NULL) {
>         return -1;
>     }
> +   if (full->lg_page_size < TARGET_PAGE_BITS) {
> +       return -1;
> +   }
>     if (hostp) {
>         *hostp = p;
>     }
>
> It seems like we could do slightly better than this, perhaps by 
> single-stepping through such a page, but surely this edge case is so 
> uncommon as to not make it worthwhile to consider.

OK. I'll  update and test it later.

Regards,

Weiwei Li

>
>
> r~


