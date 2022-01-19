Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA1Qm-0000ro-VR
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 22:14:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA1Ql-0000rb-0s; Tue, 18 Jan 2022 22:14:39 -0500
Received: from out28-218.mail.aliyun.com ([115.124.28.218]:60008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA1Qh-0001Pi-6E; Tue, 18 Jan 2022 22:14:38 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436287|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_social|0.0126536-0.000613953-0.986732;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=12; RT=12; SR=0; TI=SMTPD_---.Mf90QoW_1642562063; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Mf90QoW_1642562063)
 by smtp.aliyun-inc.com(10.147.41.138);
 Wed, 19 Jan 2022 11:14:23 +0800
Subject: Re: [PATCH v5 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Weiwei Li <liweiwei@iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
 Anup Patel <apatel@ventanamicro.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Anup Patel <anup@brainfault.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Guo Ren <ren_guo@c-sky.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-2-liweiwei@iscas.ac.cn>
 <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
 <CAJF2gTSztdr_geRwQAU=Y3T14urwwpi8+K5uzjf8K_R5ecfLqQ@mail.gmail.com>
 <CAK9=C2Wr1aci6Z3wAKh3Bh_BYyY86BZ_0SRF7pfvKak6HXNvsQ@mail.gmail.com>
 <CAJF2gTQp3RTbj51-5J4md_6UWT7qTYxXvvyZmSK5LN91h4fB0w@mail.gmail.com>
 <bdb141c7-e45c-b05e-60ff-9e60603df6e6@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <762305fc-bf26-ca46-0d00-b8b58d82d49b@c-sky.com>
Date: Wed, 19 Jan 2022 11:14:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <bdb141c7-e45c-b05e-60ff-9e60603df6e6@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.218; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-218.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 03:14:39 -0000


On 2022/1/18 下午7:29, Weiwei Li wrote:
>
> 在 2022/1/18 下午7:15, Guo Ren 写道:
>> On Tue, Jan 18, 2022 at 4:51 PM Anup Patel <apatel@ventanamicro.com> 
>> wrote:
>>> On Tue, Jan 18, 2022 at 2:16 PM Guo Ren <guoren@kernel.org> wrote:
>>>> On Tue, Jan 18, 2022 at 11:32 AM Anup Patel <anup@brainfault.org> 
>>>> wrote:
>>>>> On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> 
>>>>> wrote:
>>>>>> From: Guo Ren <ren_guo@c-sky.com>
>>>>>>
>>>>>> Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
>>>>>> need to ignore them. They cannot be a part of ppn.
>>>>>>
>>>>>> 1: The RISC-V Instruction Set Manual, Volume II: Privileged 
>>>>>> Architecture
>>>>>>     4.4 Sv39: Page-Based 39-bit Virtual-Memory System
>>>>>>     4.5 Sv48: Page-Based 48-bit Virtual-Memory System
>>>>>>
>>>>>> 2: 
>>>>>> https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
>>>>>>
>>>>>> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
>>>>>> Tested-by: Bin Meng <bmeng.cn@gmail.com>
>>>>>> Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
>>>>>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>>>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>>>> ---
>>>>>>   target/riscv/cpu_bits.h   | 7 +++++++
>>>>>>   target/riscv/cpu_helper.c | 2 +-
>>>>>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>>>>>> index 5a6d49aa64..282cd8eecd 100644
>>>>>> --- a/target/riscv/cpu_bits.h
>>>>>> +++ b/target/riscv/cpu_bits.h
>>>>>> @@ -490,6 +490,13 @@ typedef enum {
>>>>>>   /* Page table PPN shift amount */
>>>>>>   #define PTE_PPN_SHIFT       10
>>>>>>
>>>>>> +/* Page table PPN mask */
>>>>>> +#if defined(TARGET_RISCV32)
>>>>>> +#define PTE_PPN_MASK        0xffffffffUL
>>>>>> +#elif defined(TARGET_RISCV64)
>>>>>> +#define PTE_PPN_MASK        0x3fffffffffffffULL
>>>>>> +#endif
>>>>>> +
>>>>> Going forward we should avoid using target specific "#if"
>>>>> so that we can use the same qemu-system-riscv64 for both
>>>>> RV32 and RV64.
>>>>>
>>>>>>   /* Leaf page shift amount */
>>>>>>   #define PGSHIFT             12
>>>>>>
>>>>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>>>>> index 434a83e66a..26608ddf1c 100644
>>>>>> --- a/target/riscv/cpu_helper.c
>>>>>> +++ b/target/riscv/cpu_helper.c
>>>>>> @@ -619,7 +619,7 @@ restart:
>>>>>>               return TRANSLATE_FAIL;
>>>>>>           }
>>>>>>
>>>>>> -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
>>>>>> +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>>>>> Rather than using "#if", please use "xlen" comparison to extract
>>>>> PPN correctly from PTE.
>>>> Do you mean?
>>>>
>>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>>> index 9fffaccffb..071b7ea4cf 100644
>>>> --- a/target/riscv/cpu_helper.c
>>>> +++ b/target/riscv/cpu_helper.c
>>>> @@ -619,7 +619,11 @@ restart:
>>>>               return TRANSLATE_FAIL;
>>>>           }
>>>>
>>>> -        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>>>> +        if (riscv_cpu_mxl(env) == MXL_RV32) {
>>>> +               hwaddr ppn = pte  >> PTE_PPN_SHIFT;
>>>> +       } else {
>>>> +               hwaddr ppn = (pte & 0x3fffffffffffffULL) >> 
>>>> PTE_PPN_SHIFT;
>>>> +       }
>>> Yes, something like this but use a define for 0x3fffffffffffffULL
>> Just as Alistair said: This will need to be dynamic based on get_xl()
>>
>>   I still prefer:
>> +#if defined(TARGET_RISCV32)
>> +#define PTE_PPN_MASK        0xffffffffUL
>> +#elif defined(TARGET_RISCV64)
>> +#define PTE_PPN_MASK        0x3fffffffffffffULL
>> +#endif
>>
>> +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>
> I think the difference may be xl = MXL_RV32 in RV64.
Agree.
>
> Or we may  define  PTE_PPN_MASK as  0x3fffffffffffffULL, and use type 
> contrast
>
> +        hwaddr ppn = (pte & (target_ulong)PTE_PPN_MASK) >> 
> PTE_PPN_SHIFT;

It is absolutely not right to use target_ulong here.

Although we don't support dynamic SXLEN currently,   we should avoid 
assuming  that SXLEN is always 64 on qemu-system-riscv64. Get_cpu_xl is 
the right way.

I have  moved  xl to CPURISCVState in my patch set v6 for UXL. I think 
it will be much convenient for this situation and you can just use 
env->xl to get right XLEN.
But I don't know when it will be merged.

Thanks,
Zhiwei

>
> Regards,
> Weiwei Li
>
>>> Regards,
>>> Anup
>>>
>>>>           RISCVCPU *cpu = env_archcpu(env);
>>>>           if (!(pte & PTE_V)) {
>>>>
>>>>> Regards,
>>>>> Anup
>>>>>
>>>>>>           if (!(pte & PTE_V)) {
>>>>>>               /* Invalid PTE */
>>>>>> -- 
>>>>>> 2.17.1
>>>>>>
>>>>
>>>> -- 
>>>> Best Regards
>>>>   Guo Ren
>>>>
>>>> ML: https://lore.kernel.org/linux-csky/
>>>>
>>
>>
>
>

