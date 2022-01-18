Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9mgB-0005ml-AK
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 06:29:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9mg8-0005fN-1c; Tue, 18 Jan 2022 06:29:32 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:39102 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9mg2-0000Sd-8W; Tue, 18 Jan 2022 06:29:31 -0500
Received: from [192.168.0.102] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADnT5CCpOZhSUm2BQ--.28003S2;
 Tue, 18 Jan 2022 19:29:07 +0800 (CST)
Subject: Re: [PATCH v5 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Guo Ren <guoren@kernel.org>, Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>,
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
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <bdb141c7-e45c-b05e-60ff-9e60603df6e6@iscas.ac.cn>
Date: Tue, 18 Jan 2022 19:29:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJF2gTQp3RTbj51-5J4md_6UWT7qTYxXvvyZmSK5LN91h4fB0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowADnT5CCpOZhSUm2BQ--.28003S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWryUCw18Kr48uFy8JF45GFg_yoWrXw18pr
 W8Ga42yFyDXry7u34aq3W5Jr13tw4DKw1ruw4kZr1UJws5KrZ7uFnFkw48u3WDXF4kZr12
 9F1q9r43ZF4qqFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
 04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
 w20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
 CY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUzuWLUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 11:29:32 -0000


在 2022/1/18 下午7:15, Guo Ren 写道:
> On Tue, Jan 18, 2022 at 4:51 PM Anup Patel <apatel@ventanamicro.com> wrote:
>> On Tue, Jan 18, 2022 at 2:16 PM Guo Ren <guoren@kernel.org> wrote:
>>> On Tue, Jan 18, 2022 at 11:32 AM Anup Patel <anup@brainfault.org> wrote:
>>>> On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>>>> From: Guo Ren <ren_guo@c-sky.com>
>>>>>
>>>>> Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
>>>>> need to ignore them. They cannot be a part of ppn.
>>>>>
>>>>> 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
>>>>>     4.4 Sv39: Page-Based 39-bit Virtual-Memory System
>>>>>     4.5 Sv48: Page-Based 48-bit Virtual-Memory System
>>>>>
>>>>> 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
>>>>>
>>>>> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
>>>>> Tested-by: Bin Meng <bmeng.cn@gmail.com>
>>>>> Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
>>>>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>>> ---
>>>>>   target/riscv/cpu_bits.h   | 7 +++++++
>>>>>   target/riscv/cpu_helper.c | 2 +-
>>>>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>>>>> index 5a6d49aa64..282cd8eecd 100644
>>>>> --- a/target/riscv/cpu_bits.h
>>>>> +++ b/target/riscv/cpu_bits.h
>>>>> @@ -490,6 +490,13 @@ typedef enum {
>>>>>   /* Page table PPN shift amount */
>>>>>   #define PTE_PPN_SHIFT       10
>>>>>
>>>>> +/* Page table PPN mask */
>>>>> +#if defined(TARGET_RISCV32)
>>>>> +#define PTE_PPN_MASK        0xffffffffUL
>>>>> +#elif defined(TARGET_RISCV64)
>>>>> +#define PTE_PPN_MASK        0x3fffffffffffffULL
>>>>> +#endif
>>>>> +
>>>> Going forward we should avoid using target specific "#if"
>>>> so that we can use the same qemu-system-riscv64 for both
>>>> RV32 and RV64.
>>>>
>>>>>   /* Leaf page shift amount */
>>>>>   #define PGSHIFT             12
>>>>>
>>>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>>>> index 434a83e66a..26608ddf1c 100644
>>>>> --- a/target/riscv/cpu_helper.c
>>>>> +++ b/target/riscv/cpu_helper.c
>>>>> @@ -619,7 +619,7 @@ restart:
>>>>>               return TRANSLATE_FAIL;
>>>>>           }
>>>>>
>>>>> -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
>>>>> +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>>>> Rather than using "#if", please use "xlen" comparison to extract
>>>> PPN correctly from PTE.
>>> Do you mean?
>>>
>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>> index 9fffaccffb..071b7ea4cf 100644
>>> --- a/target/riscv/cpu_helper.c
>>> +++ b/target/riscv/cpu_helper.c
>>> @@ -619,7 +619,11 @@ restart:
>>>               return TRANSLATE_FAIL;
>>>           }
>>>
>>> -        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>>> +        if (riscv_cpu_mxl(env) == MXL_RV32) {
>>> +               hwaddr ppn = pte  >> PTE_PPN_SHIFT;
>>> +       } else {
>>> +               hwaddr ppn = (pte &  0x3fffffffffffffULL) >> PTE_PPN_SHIFT;
>>> +       }
>> Yes, something like this but use a define for 0x3fffffffffffffULL
> Just as Alistair said: This will need to be dynamic based on get_xl()
>
>   I still prefer:
> +#if defined(TARGET_RISCV32)
> +#define PTE_PPN_MASK        0xffffffffUL
> +#elif defined(TARGET_RISCV64)
> +#define PTE_PPN_MASK        0x3fffffffffffffULL
> +#endif
>
> +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;

I think the difference may be xl = MXL_RV32 in RV64.

Or we may  define  PTE_PPN_MASK as  0x3fffffffffffffULL, and use type 
contrast

+        hwaddr ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;

Regards,
Weiwei Li

>> Regards,
>> Anup
>>
>>>           RISCVCPU *cpu = env_archcpu(env);
>>>           if (!(pte & PTE_V)) {
>>>
>>>> Regards,
>>>> Anup
>>>>
>>>>>           if (!(pte & PTE_V)) {
>>>>>               /* Invalid PTE */
>>>>> --
>>>>> 2.17.1
>>>>>
>>>
>>> --
>>> Best Regards
>>>   Guo Ren
>>>
>>> ML: https://lore.kernel.org/linux-csky/
>>>
>
>


