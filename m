Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nEsj8-0003OU-Mr
	for mharc-qemu-riscv@gnu.org; Tue, 01 Feb 2022 07:57:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nEsio-0003BD-94; Tue, 01 Feb 2022 07:57:26 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:58446 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nEsiY-000419-Hs; Tue, 01 Feb 2022 07:57:14 -0500
Received: from [192.168.0.107] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAAnCfKtLflh9WpCAA--.16824S2;
 Tue, 01 Feb 2022 20:55:10 +0800 (CST)
Subject: Re: [PATCH v7 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>,
 Guo Ren <ren_guo@c-sky.com>
References: <20220128085501.8014-1-liweiwei@iscas.ac.cn>
 <20220128085501.8014-2-liweiwei@iscas.ac.cn>
 <CAKmqyKO4KS-=1mENTOAOMJ4soo+cWoMVVzCMn=AuuS_PPWijfg@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <86b649d7-4b56-d5dd-9fb0-e78dd356b029@iscas.ac.cn>
Date: Tue, 1 Feb 2022 20:55:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKO4KS-=1mENTOAOMJ4soo+cWoMVVzCMn=AuuS_PPWijfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAAnCfKtLflh9WpCAA--.16824S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw48Zw1UJFWxKw1kCrW5GFg_yoW5tw47pr
 W8Ga13ArWDJr97Ca4SqF15tw1rtws2kr1rCw4xCrnrta1rXrZ5WFnFkw4a9F9rXF18uF1Y
 v3Wj9F13CF4qvFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 01 Feb 2022 12:57:29 -0000


在 2022/2/1 上午11:31, Alistair Francis 写道:
> On Fri, Jan 28, 2022 at 7:11 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> From: Guo Ren <ren_guo@c-sky.com>
>>
>> Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
>> need to ignore them. They cannot be a part of ppn.
>>
>> 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
>>     4.4 Sv39: Page-Based 39-bit Virtual-Memory System
>>     4.5 Sv48: Page-Based 48-bit Virtual-Memory System
>>
>> 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
>>
>> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
>> Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
>> Cc: Bin Meng <bmeng.cn@gmail.com>
>> Cc: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>   target/riscv/cpu.h        | 15 +++++++++++++++
>>   target/riscv/cpu_bits.h   |  3 +++
>>   target/riscv/cpu_helper.c | 14 +++++++++++++-
>>   3 files changed, 31 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 55635d68d5..336fe8e3d5 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -341,6 +341,8 @@ struct RISCVCPU {
>>           bool ext_counters;
>>           bool ext_ifencei;
>>           bool ext_icsr;
>> +        bool ext_svnapot;
>> +        bool ext_svpbmt;
>>           bool ext_zfh;
>>           bool ext_zfhmin;
>>           bool ext_zve32f;
> Hello, thanks for the patches.
>
> This looks good, but you might need to rebase it as there are patches
> on list that move this into a different struct.

Thanks for your review.

I'll rebase it.

>
>> @@ -495,6 +497,19 @@ static inline int riscv_cpu_xlen(CPURISCVState *env)
>>       return 16 << env->xl;
>>   }
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
>>   /*
>>    * Encode LMUL to lmul as follows:
>>    *     LMUL    vlmul    lmul
>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>> index 7c87433645..6ea3944423 100644
>> --- a/target/riscv/cpu_bits.h
>> +++ b/target/riscv/cpu_bits.h
>> @@ -493,6 +493,9 @@ typedef enum {
>>   /* Page table PPN shift amount */
>>   #define PTE_PPN_SHIFT       10
>>
>> +/* Page table PPN mask */
>> +#define PTE_PPN_MASK        0x3FFFFFFFFFFC00ULL
>> +
>>   /* Leaf page shift amount */
>>   #define PGSHIFT             12
>>
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 327a2c4f1d..5a1c0e239e 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -622,7 +622,19 @@ restart:
>>               return TRANSLATE_FAIL;
>>           }
>>
>> -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
>> +        hwaddr ppn;
>> +        RISCVCPU *cpu = env_archcpu(env);
> I know there is existing code in this function that does this, but
> please don't initiate variables mid function. Can you move this to the
> top of the function?
OK.
>
> Otherwise:
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
>> +
>> +        if (riscv_cpu_sxl(env) == MXL_RV32) {
>> +            ppn = pte >> PTE_PPN_SHIFT;
>> +        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
>> +            ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>> +        } else {
>> +            ppn = pte >> PTE_PPN_SHIFT;
>> +            if ((pte & ~(target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT) {
>> +                return TRANSLATE_FAIL;
>> +            }
>> +        }
>>
>>           if (!(pte & PTE_V)) {
>>               /* Invalid PTE */
>> --
>> 2.17.1
>>
>>


