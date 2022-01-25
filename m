Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nCINu-0001gg-3X
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jan 2022 04:45:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nCINp-0001bi-4I; Tue, 25 Jan 2022 04:45:01 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:50086 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nCINk-0006tU-A3; Tue, 25 Jan 2022 04:45:00 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowABHKBWFxu9hcM7bBg--.22861S2;
 Tue, 25 Jan 2022 17:44:38 +0800 (CST)
Subject: Re: [PATCH v6 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Guo Ren <guoren@kernel.org>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>,
 Ren Guo <ren_guo@c-sky.com>
References: <20220125064536.7869-1-liweiwei@iscas.ac.cn>
 <20220125064536.7869-2-liweiwei@iscas.ac.cn>
 <0a70c29c-0d59-24bb-73a8-652e26761d48@c-sky.com>
 <CAJF2gTQT619yKoeFdH8-qaCmuQxSn9qar02SUTLO44gi=QmSsA@mail.gmail.com>
 <ef4bf292-d77b-7b59-feaf-c1760c2520af@c-sky.com>
 <CAJF2gTRaLbFUnOK6v4PLa0OrsvO=a3wov+QOdSR3W4PmPGjMBQ@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <20f17f8b-3997-9b46-f9b1-e559df4da148@iscas.ac.cn>
Date: Tue, 25 Jan 2022 17:44:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJF2gTRaLbFUnOK6v4PLa0OrsvO=a3wov+QOdSR3W4PmPGjMBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowABHKBWFxu9hcM7bBg--.22861S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr48tw17Jw4xtw17WF18uFg_yoW7Cry8pF
 WUGF1UAr4DXFy3Cw1Sq3Z8Jrnxtwn7Kr1rur4xWw48Jan8tr1xGF1qkw4Yka4kXF18Zr1Y
 vF1UCr43CF4Yva7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
 CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj0JPtUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 25 Jan 2022 09:45:02 -0000


在 2022/1/25 下午5:00, Guo Ren 写道:
> On Tue, Jan 25, 2022 at 4:54 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>
>> On 2022/1/25 16:40, Guo Ren wrote:
>>> On Tue, Jan 25, 2022 at 4:34 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>>> On 2022/1/25 14:45, Weiwei Li wrote:
>>>>> From: Guo Ren <ren_guo@c-sky.com>
>>>>>
>>>>> Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
>>>>> need to ignore them. They cannot be a part of ppn.
>>>>>
>>>>> 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
>>>>>       4.4 Sv39: Page-Based 39-bit Virtual-Memory System
>>>>>       4.5 Sv48: Page-Based 48-bit Virtual-Memory System
>>>>>
>>>>> 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
>>>>>
>>>>> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
>>>>> Cc: Liu Zhiwei <zhiwei_liu@c-sky.com>
>>>>> Cc: Bin Meng <bmeng.cn@gmail.com>
>>>>> Cc: Alistair Francis <alistair.francis@wdc.com>
>>>>> ---
>>>>>     target/riscv/cpu.h        | 13 +++++++++++++
>>>>>     target/riscv/cpu_bits.h   |  7 +++++++
>>>>>     target/riscv/cpu_helper.c | 14 +++++++++++++-
>>>>>     3 files changed, 33 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>>>> index 55635d68d5..45de8faaca 100644
>>>>> --- a/target/riscv/cpu.h
>>>>> +++ b/target/riscv/cpu.h
>>>>> @@ -341,6 +341,8 @@ struct RISCVCPU {
>>>>>             bool ext_counters;
>>>>>             bool ext_ifencei;
>>>>>             bool ext_icsr;
>>>>> +        bool ext_svnapot;
>>>>> +        bool ext_svpbmt;
>>>>>             bool ext_zfh;
>>>>>             bool ext_zfhmin;
>>>>>             bool ext_zve32f;
>>>>> @@ -495,6 +497,17 @@ static inline int riscv_cpu_xlen(CPURISCVState *env)
>>>>>         return 16 << env->xl;
>>>>>     }
>>>>>
>>>>> +#ifndef CONFIG_USER_ONLY
>>>>> +#ifdef TARGET_RISCV32
>>>>> +#define riscv_cpu_sxl(env)  ((void)(env), MXL_RV32)
>>>>> +#else
>>>>> +static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *env)
>>>>> +{
>>>>> +    return get_field(env->mstatus, MSTATUS64_SXL);
>>>>> +}
>>>>> +#endif
>>>>> +#endif
>>>>> +
>>>> Perhaps an interface also works for user mode is better.
>>>>
>>>> +#ifdef TARGET_RISCV32
>>>> +#define riscv_cpu_sxl(env)  ((void)(env), MXL_RV32)
>>>> +#else
>>>> +static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *env)
>>>> +{
>>>> +#ifdef CONFIG_USER_ONLY
>>>> +    return env->misa_mxl;
>>>> +#else
>>>> +    return get_field(env->mstatus, MSTATUS64_SXL);
>>>> +#endif
>>>> +}
>>>> +#endif
>>>> +
>>>>
>>>>>     /*
>>>>>      * Encode LMUL to lmul as follows:
>>>>>      *     LMUL    vlmul    lmul
>>>>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>>>>> index 7c87433645..37b622fbfa 100644
>>>>> --- a/target/riscv/cpu_bits.h
>>>>> +++ b/target/riscv/cpu_bits.h
>>>>> @@ -493,6 +493,13 @@ typedef enum {
>>>>>     /* Page table PPN shift amount */
>>>>>     #define PTE_PPN_SHIFT       10
>>>>>
>>>>> +/* Page table PPN mask */
>>>>> +#if defined(TARGET_RISCV32)
>>>>> +#define PTE_PPN_MASK        0xFFFFFC00UL
>>>>> +#elif defined(TARGET_RISCV64)
>>>>> +#define PTE_PPN_MASK        0x3FFFFFFFFFFC00ULL
>>>>> +#endif
>>>>> +
>>>> No need to define PTE_PPN_MASK for TARGET_RISCV32.
>>> ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>>>
>>> pte is target_ulong, so types are different.
>>>
>>> TARGET_RISCV32: is 32bit.
>>> TARGET_RISCV64: is 64bit.
>>>
>> I should make it more clear.  You will not use PTE_PPN_MASK on
>> TARGET_RISCV32.
>>>>>     /* Leaf page shift amount */
>>>>>     #define PGSHIFT             12
>>>>>
>>>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>>>> index 327a2c4f1d..2a921bedfd 100644
>>>>> --- a/target/riscv/cpu_helper.c
>>>>> +++ b/target/riscv/cpu_helper.c
>>>>> @@ -622,7 +622,19 @@ restart:
>>>>>                 return TRANSLATE_FAIL;
>>>>>             }
>>>>>
>>>>> -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
>>>>> +        hwaddr ppn;
>>>>> +        RISCVCPU *cpu = env_archcpu(env);
>>>>> +
>>>>> +        if (riscv_cpu_sxl(env) == MXL_RV32) {
>>>>> +            ppn = pte >> PTE_PPN_SHIFT;
>> TARGET_RISCV32 will always come here. So no need to define PTE_PPN_MASK
>> for TARGET_RISCV32.
> Oops, maybe we should use TARGET_LONG_SIZE == 4
>
> #if TARGET_LONG_SIZE == 4
> typedef int32_t target_long;
> typedef uint32_t target_ulong;
> #define TARGET_FMT_lx "%08x"
> #define TARGET_FMT_ld "%d"
> #define TARGET_FMT_lu "%u"
> #elif TARGET_LONG_SIZE == 8
> typedef int64_t target_long;
> typedef uint64_t target_ulong;
> #define TARGET_FMT_lx "%016" PRIx64
> #define TARGET_FMT_ld "%" PRId64
> #define TARGET_FMT_lu "%" PRIu64
> #else
> #error TARGET_LONG_SIZE undefined
> #endif
>
TARGET_LONG_SIZE is related to TARGET_RISCV32 and TARGET_RISCV64.

In RV32, the code will truely not reach there when executing. However the code itself have different types for pte and PTE_PPN_MASK, and may cause compiler warning.

So if we only define PTE_PPN_MASK for RV64, maybe we can take type casting here:

   ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;

Regards,
Weiwei Li

>> Thanks,
>> Zhiwei
>>
>>>>> +        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
>>>>> +            ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>>>>> +        } else {
>>>>> +            ppn = pte >> PTE_PPN_SHIFT;
>>>>> +            if ((pte & ~PTE_PPN_MASK) >> PTE_PPN_SHIFT) {
>>>>> +                return TRANSLATE_FAIL;
>>>>> +            }
>>>>> +        }
>>>>>
>>>>>             if (!(pte & PTE_V)) {
>>>>>                 /* Invalid PTE */
>>>> Otherwise,
>>>>
>>>> Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>>>>
>>>> Thanks,
>>>> Zhiwei
>>>>
>>>>
>>>>
>
>


