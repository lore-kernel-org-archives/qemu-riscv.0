Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pec1o-0003cF-EO
	for mharc-qemu-riscv@gnu.org; Tue, 21 Mar 2023 09:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pec1m-0003br-H3; Tue, 21 Mar 2023 09:27:50 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pec1j-0002Sd-4d; Tue, 21 Mar 2023 09:27:50 -0400
Received: from [192.168.0.120] (unknown [180.165.240.243])
 by APP-01 (Coremail) with SMTP id qwCowAA3O0fGsBlkpRtxFA--.8904S2;
 Tue, 21 Mar 2023 21:27:36 +0800 (CST)
Message-ID: <ac04846c-4823-ae77-8bbd-c9bf16431b91@iscas.ac.cn>
Date: Tue, 21 Mar 2023 21:27:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] target/riscv: reduce overhead of MSTATUS_SUM change
Content-Language: en-US
To: "Wu, Fei" <fei2.wu@intel.com>, liweiwei <liweiwei@iscas.ac.cn>
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20230321063746.151107-1-fei2.wu@intel.com>
 <6648a495-d5d4-60df-cf88-90c98cc429c6@iscas.ac.cn>
 <c9c33a1e-73fc-921c-8c3b-c6d2cfca5016@intel.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <c9c33a1e-73fc-921c-8c3b-c6d2cfca5016@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAA3O0fGsBlkpRtxFA--.8904S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFy3Cr1rJF15Zw1rJF48Crg_yoW7JrWxpr
 1kJay7Gry5GrykJw1xtr1UWry5Ar1UGw1DCr10qF15Ar4UJryj9rWUXr1q9rnrJF48Jr1j
 yr1UZr9rZr47JrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
 42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5sjjDUUUU
X-Originating-IP: [180.165.240.243]
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
X-List-Received-Date: Tue, 21 Mar 2023 13:27:50 -0000


On 2023/3/21 21:22, Wu, Fei wrote:
> On 3/21/2023 8:58 PM, liweiwei wrote:
>> On 2023/3/21 14:37, fei2.wu@intel.com wrote:
>>> From: Fei Wu <fei2.wu@intel.com>
>>>
>>> Kernel needs to access user mode memory e.g. during syscalls, the window
>>> is usually opened up for a very limited time through MSTATUS.SUM, the
>>> overhead is too much if tlb_flush() gets called for every SUM change.
>>> This patch saves addresses accessed when SUM=1, and flushs only these
>>> pages when SUM changes to 0. If the buffer is not large enough to save
>>> all the pages during SUM=1, it will fall back to tlb_flush when
>>> necessary.
>>>
>>> The buffer size is set to 4 since in this MSTATUS.SUM open-up window,
>>> most of the time kernel accesses 1 or 2 pages, it's very rare to see
>>> more than 4 pages accessed.
>>>
>>> It's not necessary to save/restore these new added status, as
>>> tlb_flush() is always called after restore.
>>>
>>> Result of 'pipe 10' from unixbench boosts from 223656 to 1327407. Many
>>> other syscalls benefit a lot from this one too.
>>>
>>> Signed-off-by: Fei Wu <fei2.wu@intel.com>
>>> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>>> ---
>>>    target/riscv/cpu.h        |  4 ++++
>>>    target/riscv/cpu_helper.c |  7 +++++++
>>>    target/riscv/csr.c        | 14 +++++++++++++-
>>>    3 files changed, 24 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>> index 638e47c75a..926dbce59f 100644
>>> --- a/target/riscv/cpu.h
>>> +++ b/target/riscv/cpu.h
>>> @@ -383,6 +383,10 @@ struct CPUArchState {
>>>        uint64_t kvm_timer_compare;
>>>        uint64_t kvm_timer_state;
>>>        uint64_t kvm_timer_frequency;
>>> +
>>> +#define MAX_CACHED_SUM_U_ADDR_NUM 4
>>> +    uint64_t sum_u_count;
>>> +    uint64_t sum_u_addr[MAX_CACHED_SUM_U_ADDR_NUM];
>>>    };
>>>      OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>> index f88c503cf4..5ad0418eb6 100644
>>> --- a/target/riscv/cpu_helper.c
>>> +++ b/target/riscv/cpu_helper.c
>>> @@ -1068,6 +1068,13 @@ restart:
>>>                        (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
>>>                    *prot |= PAGE_WRITE;
>>>                }
>>> +            if ((pte & PTE_U) && (mode & PRV_S) &&
>>> +                    get_field(env->mstatus, MSTATUS_SUM)) {
>>> +                if (env->sum_u_count < MAX_CACHED_SUM_U_ADDR_NUM) {
>>> +                    env->sum_u_addr[env->sum_u_count] = addr;
>>> +                }
>>> +                ++env->sum_u_count;
>>> +            }
>>>                return TRANSLATE_SUCCESS;
>>>            }
>>>        }
>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>> index ab566639e5..74b7638c8a 100644
>>> --- a/target/riscv/csr.c
>>> +++ b/target/riscv/csr.c
>>> @@ -1246,9 +1246,21 @@ static RISCVException
>>> write_mstatus(CPURISCVState *env, int csrno,
>>>          /* flush tlb on mstatus fields that affect VM */
>>>        if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
>>> -            MSTATUS_MPRV | MSTATUS_SUM)) {
>>> +            MSTATUS_MPRV)) {
>>>            tlb_flush(env_cpu(env));
>>> +        env->sum_u_count = 0;
>>> +    } else if ((mstatus & MSTATUS_SUM) && !(val & MSTATUS_SUM)) {
>>> +        if (env->sum_u_count > MAX_CACHED_SUM_U_ADDR_NUM) {
>>> +            tlb_flush(env_cpu(env));
>> SUM seems only affect S mode TLB. Maybe we can only flush S mode TLB here.
>>
> It's also in effect when MPRV=1 and MPP=S in M mode, we can only flush
> the tlb of PRV_S and PRV_M.

OK. Good point.

Regards,

Weiwei Li

>
> Thanks,
> Fei.
>
>>> +        } else {
>>> +            for (int i = 0; i < env->sum_u_count; ++i) {
>>> +                tlb_flush_page_by_mmuidx(env_cpu(env),
>>> env->sum_u_addr[i],
>>> +                                         1 << PRV_S | 1 << PRV_M);
>> Similar case here.
>>
>> Regards,
>>
>> Weiwei Li
>>
>>> +            }
>>> +        }
>>> +        env->sum_u_count = 0;
>>>        }
>>> +
>>>        mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
>>>            MSTATUS_SPP | MSTATUS_MPRV | MSTATUS_SUM |
>>>            MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |


