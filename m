Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ph0ek-0006EQ-SJ
	for mharc-qemu-riscv@gnu.org; Tue, 28 Mar 2023 00:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ph0ej-0006EE-Et; Tue, 28 Mar 2023 00:09:57 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ph0ef-0007x4-N6; Tue, 28 Mar 2023 00:09:57 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowADX3UmEaCJk+bj4Fw--.50734S2;
 Tue, 28 Mar 2023 12:09:42 +0800 (CST)
Message-ID: <165c20a1-222a-9b75-c23a-10bbc0619c65@iscas.ac.cn>
Date: Tue, 28 Mar 2023 12:09:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH 5/5] target/riscv: Add pointer mask support for
 instruction fetch
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-6-liweiwei@iscas.ac.cn>
 <8fed2551-a67d-cd53-f5a1-f089f980aa08@linaro.org>
 <ae53e46c-b7e2-c986-a797-06a2630cc393@iscas.ac.cn>
 <aa9b6745-341f-2466-70c2-d574ce2a7c6a@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <aa9b6745-341f-2466-70c2-d574ce2a7c6a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADX3UmEaCJk+bj4Fw--.50734S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFy7Zw1UtF4UXr1fGr43trb_yoW8Jw4rpr
 95AFW8KrWktFWkArsFqr1xXFy2kr1xJ3WUG348GF1FyryFqr1Svr17Was0gr1Ykr4xXw1U
 Zr4Dt3yruF13JrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 28 Mar 2023 04:09:57 -0000


On 2023/3/28 11:31, Richard Henderson wrote:
> On 3/27/23 18:55, liweiwei wrote:
>>
>> On 2023/3/28 02:04, Richard Henderson wrote:
>>> On 3/27/23 03:00, Weiwei Li wrote:
>>>> @@ -1248,6 +1265,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr 
>>>> address, int size,
>>>>       qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d 
>>>> mmu_idx %d\n",
>>>>                     __func__, address, access_type, mmu_idx);
>>>>   +    if (access_type == MMU_INST_FETCH) {
>>>> +        address = adjust_pc_address(env, address);
>>>> +    }
>>>
>>> Why do you want to do this so late, as opposed to earlier in 
>>> cpu_get_tb_cpu_state?
>>
>> In this way, the pc for tb may be different from the reg pc. Then the 
>> pc register will be wrong if sync from tb.
>
> Hmm, true.
>
> But you certainly cannot adjust the address in tlb_fill, as you'll be 
> producing different result for read/write and exec.  You could 
> plausibly use a separate mmu_idx, but that's not ideal either.
>
> The best solution might be to implement pc-relative translation 
> (CF_PCREL).  At which point cpu_pc always has the correct results and 
> we make relative adjustments to that.

I'm not very familiar with how CF_PCREL works currently. I'll try this 
way later.

Regards,

Weiwei Li

>
>
> r~


