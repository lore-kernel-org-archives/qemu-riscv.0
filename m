Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poeZD-0003Ol-Vl
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 02:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1poeZB-0003OR-H3; Tue, 18 Apr 2023 02:11:50 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1poeZ9-0005jh-By; Tue, 18 Apr 2023 02:11:49 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-01 (Coremail) with SMTP id qwCowABnbZ2bND5kpLrJBQ--.55313S2;
 Tue, 18 Apr 2023 14:11:39 +0800 (CST)
Message-ID: <ec43b0ce-21ab-50c9-e9dd-1707512b53a5@iscas.ac.cn>
Date: Tue, 18 Apr 2023 14:11:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH 0/6] target/riscv: Fix PMP related problem
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <3038155a-6190-5aa5-7425-ad0d957fd7a6@linux.alibaba.com>
 <3ace9e9e-91cf-36e6-a18f-494fd44dffab@iscas.ac.cn>
 <860f1cb8-71d0-51e8-eb5d-878c059a5eae@linux.alibaba.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <860f1cb8-71d0-51e8-eb5d-878c059a5eae@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABnbZ2bND5kpLrJBQ--.55313S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFy7Ar1UtrWxtFy3XF1fZwb_yoW5XryfpF
 93AFWaqrZ8CrZ3Kr4ftF1DXryYyr18Kw1UXw1rJr1rZFsIvryY9rsYgr4FkF9rXFZ3Cr4j
 kF1Yvr97uFyjyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUF9a9DUUUU
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
X-List-Received-Date: Tue, 18 Apr 2023 06:11:51 -0000


On 2023/4/18 12:47, LIU Zhiwei wrote:
>
> On 2023/4/18 11:36, Weiwei Li wrote:
>>
>> On 2023/4/18 11:07, LIU Zhiwei wrote:
>>>
>>> On 2023/4/13 17:01, Weiwei Li wrote:
>>>> This patchset tries to fix the PMP bypass problem issue 
>>>> https://gitlab.com/qemu-project/qemu/-/issues/1542
>>>
>>> Please add your analysis of this issue here.
>>>
>>> By the way, I think this problem is introduced by
>>>
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg939331.html
>>
>> It seems have no relationship with this commit.
>>
>> I think there are several problems for this issue:
>>
>> 1. TLB will not be cached only when the access address have matched 
>> PMP entry. 
> TLB will be filled only when PMP check and PTW check pass.
>> So the other address access  may hit the TLB(if first access of the 
>> page didn't hit the PMP entry)
> This page will not be filled to TLB if the first access of the page 
> didn't pass the PMP check.

I have given an example for this bypass in the replied email of patch 1.

Regards,

Weiwei Li

>>
>> and bypass the pmp check. This is fixed by patch 1.
>
> Never it should be.
>
> Zhiwei
>
>>
>> 2. Writing to pmpaddr  didn't trigger tlb flush. This is fixed by 
>> patch 3.
>>
>> 3. The tb isn't flushed when PMP permission changes, so It also may 
>> hit the tb and bypass the changed PMP check for instruction fetch. 
>> This is fixed by patch 5.
>>
>> 4. We set the tlb_size to 1 to make the TLB_INVALID_MASK set. However 
>> this flag will be cleared after fill_tlb, and this will make the host 
>> address be cached, and let the following instruction fetch in the 
>> same tb bypass the PMP check. This is fixed by patch 6.
>>
>> Regards,
>>
>> Weiwei Li
>>
>>>
>>> I have commented on how to correct this patch. But by accident, it 
>>> has been merged.
>>>
>>> Zhiwei
>>>
>>>>
>>>> The port is available here:
>>>> https://github.com/plctlab/plct-qemu/tree/plct-pmp-fix
>>>>
>>>> Weiwei Li (6):
>>>>    target/riscv: Update pmp_get_tlb_size()
>>>>    target/riscv: Move pmp_get_tlb_size apart from
>>>>      get_physical_address_pmp
>>>>    target/riscv: flush tlb when pmpaddr is updated
>>>>    target/riscv: Flush TLB only when pmpcfg/pmpaddr really changes
>>>>    target/riscv: flush tb when PMP entry changes
>>>>    accel/tcg: Remain TLB_INVALID_MASK in the address when TLB is
>>>>      re-filled
>>>>
>>>>   accel/tcg/cputlb.c        |  7 -----
>>>>   target/riscv/cpu_helper.c | 19 ++++---------
>>>>   target/riscv/pmp.c        | 60 
>>>> ++++++++++++++++++++++++++-------------
>>>>   target/riscv/pmp.h        |  3 +-
>>>>   4 files changed, 47 insertions(+), 42 deletions(-)
>>>>


