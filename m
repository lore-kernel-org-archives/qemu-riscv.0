Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nCHb6-00011Q-Ir
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jan 2022 03:54:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nCHb4-0000zf-Vk; Tue, 25 Jan 2022 03:54:39 -0500
Received: from out28-149.mail.aliyun.com ([115.124.28.149]:32942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nCHb1-0007fn-FL; Tue, 25 Jan 2022 03:54:38 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0743631|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0818051-0.000734364-0.917461;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=12; RT=12; SR=0; TI=SMTPD_---.Mi7COBB_1643100869; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Mi7COBB_1643100869)
 by smtp.aliyun-inc.com(10.147.40.44); Tue, 25 Jan 2022 16:54:29 +0800
Message-ID: <ef4bf292-d77b-7b59-feaf-c1760c2520af@c-sky.com>
Date: Tue, 25 Jan 2022 16:54:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/5] target/riscv: Ignore reserved bits in PTE for RV64
Content-Language: en-US
To: Guo Ren <guoren@kernel.org>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
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
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
In-Reply-To: <CAJF2gTQT619yKoeFdH8-qaCmuQxSn9qar02SUTLO44gi=QmSsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.149; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-149.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 25 Jan 2022 08:54:39 -0000


On 2022/1/25 16:40, Guo Ren wrote:
> On Tue, Jan 25, 2022 at 4:34 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>
>> On 2022/1/25 14:45, Weiwei Li wrote:
>>> From: Guo Ren <ren_guo@c-sky.com>
>>>
>>> Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
>>> need to ignore them. They cannot be a part of ppn.
>>>
>>> 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
>>>      4.4 Sv39: Page-Based 39-bit Virtual-Memory System
>>>      4.5 Sv48: Page-Based 48-bit Virtual-Memory System
>>>
>>> 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
>>>
>>> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
>>> Cc: Liu Zhiwei <zhiwei_liu@c-sky.com>
>>> Cc: Bin Meng <bmeng.cn@gmail.com>
>>> Cc: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>>    target/riscv/cpu.h        | 13 +++++++++++++
>>>    target/riscv/cpu_bits.h   |  7 +++++++
>>>    target/riscv/cpu_helper.c | 14 +++++++++++++-
>>>    3 files changed, 33 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>> index 55635d68d5..45de8faaca 100644
>>> --- a/target/riscv/cpu.h
>>> +++ b/target/riscv/cpu.h
>>> @@ -341,6 +341,8 @@ struct RISCVCPU {
>>>            bool ext_counters;
>>>            bool ext_ifencei;
>>>            bool ext_icsr;
>>> +        bool ext_svnapot;
>>> +        bool ext_svpbmt;
>>>            bool ext_zfh;
>>>            bool ext_zfhmin;
>>>            bool ext_zve32f;
>>> @@ -495,6 +497,17 @@ static inline int riscv_cpu_xlen(CPURISCVState *env)
>>>        return 16 << env->xl;
>>>    }
>>>
>>> +#ifndef CONFIG_USER_ONLY
>>> +#ifdef TARGET_RISCV32
>>> +#define riscv_cpu_sxl(env)  ((void)(env), MXL_RV32)
>>> +#else
>>> +static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *env)
>>> +{
>>> +    return get_field(env->mstatus, MSTATUS64_SXL);
>>> +}
>>> +#endif
>>> +#endif
>>> +
>> Perhaps an interface also works for user mode is better.
>>
>> +#ifdef TARGET_RISCV32
>> +#define riscv_cpu_sxl(env)  ((void)(env), MXL_RV32)
>> +#else
>> +static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *env)
>> +{
>> +#ifdef CONFIG_USER_ONLY
>> +    return env->misa_mxl;
>> +#else
>> +    return get_field(env->mstatus, MSTATUS64_SXL);
>> +#endif
>> +}
>> +#endif
>> +
>>
>>>    /*
>>>     * Encode LMUL to lmul as follows:
>>>     *     LMUL    vlmul    lmul
>>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>>> index 7c87433645..37b622fbfa 100644
>>> --- a/target/riscv/cpu_bits.h
>>> +++ b/target/riscv/cpu_bits.h
>>> @@ -493,6 +493,13 @@ typedef enum {
>>>    /* Page table PPN shift amount */
>>>    #define PTE_PPN_SHIFT       10
>>>
>>> +/* Page table PPN mask */
>>> +#if defined(TARGET_RISCV32)
>>> +#define PTE_PPN_MASK        0xFFFFFC00UL
>>> +#elif defined(TARGET_RISCV64)
>>> +#define PTE_PPN_MASK        0x3FFFFFFFFFFC00ULL
>>> +#endif
>>> +
>> No need to define PTE_PPN_MASK for TARGET_RISCV32.
> ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>
> pte is target_ulong, so types are different.
>
> TARGET_RISCV32: is 32bit.
> TARGET_RISCV64: is 64bit.
>
I should make it more clear.  You will not use PTE_PPN_MASK on 
TARGET_RISCV32.
>>>    /* Leaf page shift amount */
>>>    #define PGSHIFT             12
>>>
>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>> index 327a2c4f1d..2a921bedfd 100644
>>> --- a/target/riscv/cpu_helper.c
>>> +++ b/target/riscv/cpu_helper.c
>>> @@ -622,7 +622,19 @@ restart:
>>>                return TRANSLATE_FAIL;
>>>            }
>>>
>>> -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
>>> +        hwaddr ppn;
>>> +        RISCVCPU *cpu = env_archcpu(env);
>>> +
>>> +        if (riscv_cpu_sxl(env) == MXL_RV32) {
>>> +            ppn = pte >> PTE_PPN_SHIFT;

TARGET_RISCV32 will always come here. So no need to define PTE_PPN_MASK 
for TARGET_RISCV32.

Thanks,
Zhiwei

>>> +        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
>>> +            ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>>> +        } else {
>>> +            ppn = pte >> PTE_PPN_SHIFT;
>>> +            if ((pte & ~PTE_PPN_MASK) >> PTE_PPN_SHIFT) {
>>> +                return TRANSLATE_FAIL;
>>> +            }
>>> +        }
>>>
>>>            if (!(pte & PTE_V)) {
>>>                /* Invalid PTE */
>> Otherwise,
>>
>> Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>>
>> Thanks,
>> Zhiwei
>>
>>
>>
>

