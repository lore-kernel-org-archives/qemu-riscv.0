Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peXiB-0006F6-7w
	for mharc-qemu-riscv@gnu.org; Tue, 21 Mar 2023 04:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1peXi7-0006Ep-TI; Tue, 21 Mar 2023 04:51:17 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1peXi1-0004mi-KB; Tue, 21 Mar 2023 04:51:14 -0400
Received: from [192.168.0.120] (unknown [180.165.240.243])
 by APP-01 (Coremail) with SMTP id qwCowAAHD8_sbxlkSndKFA--.10916S2;
 Tue, 21 Mar 2023 16:50:54 +0800 (CST)
Message-ID: <8029cbcf-520f-cfd3-5b5a-923685a1da80@iscas.ac.cn>
Date: Tue, 21 Mar 2023 16:50:51 +0800
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
 <cf407a04-9717-6a82-6405-d836874c5613@iscas.ac.cn>
 <ddeaba54-e9fc-0309-4f35-7ee72052264d@intel.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <ddeaba54-e9fc-0309-4f35-7ee72052264d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAHD8_sbxlkSndKFA--.10916S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtw1UKr1UZw15Ww1xtw48tFb_yoW7GF43pr
 1kJay7Gry5Jr97Jw12qr1UWryUAr1UGw1DAr10qF15Ar43Jryj9r4UXr1q9rnrJF48Jr1j
 yr1Uur9rZr4UJrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUU
 U==
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
X-List-Received-Date: Tue, 21 Mar 2023 08:51:18 -0000


On 2023/3/21 16:40, Wu, Fei wrote:
> On 3/21/2023 4:28 PM, liweiwei wrote:
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
>>> +        } else {
>>> +            for (int i = 0; i < env->sum_u_count; ++i) {
>>> +                tlb_flush_page_by_mmuidx(env_cpu(env),
>>> env->sum_u_addr[i],
>>> +                                         1 << PRV_S | 1 << PRV_M);
>>> +            }
>>> +        }
>>> +        env->sum_u_count = 0;
>>>        }
>> Whether tlb should  be flushed when SUM is changed from 0 to 1?
>>
> When SUM is changed from 0 to 1, all the existing tlb entries remain
> valid as the permission is elevated instead of reduced, so I don't think
> it's necessary to flush tlb.

If elevated not unchanged, I think the tlb also needs update, since new 
permitted access rights may be added to the tlb.

Regards,

Weiwei Li

>
> Thanks,
> Fei.
>
>> Regards,
>>
>> Weiwei Li
>>
>>> +
>>>        mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
>>>            MSTATUS_SPP | MSTATUS_MPRV | MSTATUS_SUM |
>>>            MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |


