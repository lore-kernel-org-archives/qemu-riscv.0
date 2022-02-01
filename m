Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nEsj8-0003Nf-7U
	for mharc-qemu-riscv@gnu.org; Tue, 01 Feb 2022 07:57:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nEsio-0003BB-2D; Tue, 01 Feb 2022 07:57:26 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:58528 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nEsiY-00045z-Hg; Tue, 01 Feb 2022 07:57:14 -0500
Received: from [192.168.0.107] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAC3mfLdLflhemxCAA--.16958S2;
 Tue, 01 Feb 2022 20:55:58 +0800 (CST)
Subject: Re: [PATCH v7 3/5] target/riscv: add support for svnapot extension
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>, Guo Ren <ren_guo@c-sky.com>
References: <20220128085501.8014-1-liweiwei@iscas.ac.cn>
 <20220128085501.8014-4-liweiwei@iscas.ac.cn>
 <CAKmqyKN_iCjfhk=pb1uP=j1=H_Y2FZRmoWoahj5d9_RRYoFpvw@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <cb6b0a58-d36f-6fa4-c93a-510e43041f7b@iscas.ac.cn>
Date: Tue, 1 Feb 2022 20:55:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKN_iCjfhk=pb1uP=j1=H_Y2FZRmoWoahj5d9_RRYoFpvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAC3mfLdLflhemxCAA--.16958S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFyUXFWDAFyrur4rAF48Crg_yoW5ZrWfpr
 Z5Gay2kFZ7JFW2kayxKF1qqw18Gw4YkF4rCw4xJw47Aw4rJrWrG3WDKws09F4UXF48Zr1j
 9a1UuF1YyFWjvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnXdbUUUUU
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


在 2022/2/1 下午2:22, Alistair Francis 写道:
> On Fri, Jan 28, 2022 at 6:57 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> - add PTE_N bit
>> - add PTE_N bit check for inner PTE
>> - update address translation to support 64KiB continuous region (napot_bits = 4)
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> ---
>>   target/riscv/cpu.c        |  2 ++
>>   target/riscv/cpu_bits.h   |  1 +
>>   target/riscv/cpu_helper.c | 17 ++++++++++++++---
>>   3 files changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 1cb0436187..8752fa1544 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -729,6 +729,8 @@ static Property riscv_cpu_properties[] = {
>>       DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>>       DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>>
>> +    DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>> +
>>       DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>>       DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>>       DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>> index 6ea3944423..f6ff1c5012 100644
>> --- a/target/riscv/cpu_bits.h
>> +++ b/target/riscv/cpu_bits.h
>> @@ -489,6 +489,7 @@ typedef enum {
>>   #define PTE_A               0x040 /* Accessed */
>>   #define PTE_D               0x080 /* Dirty */
>>   #define PTE_SOFT            0x300 /* Reserved for Software */
>> +#define PTE_N               0x8000000000000000 /* NAPOT translation */
> This should be 0x8000000000000000ULL to avoid casting
OK. I'll fix it.
>
>>   /* Page table PPN shift amount */
>>   #define PTE_PPN_SHIFT       10
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index b820166dc5..6262d157e2 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -641,7 +641,7 @@ restart:
>>               return TRANSLATE_FAIL;
>>           } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>>               /* Inner PTE, continue walking */
>> -            if (pte & (PTE_D | PTE_A | PTE_U)) {
>> +            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_N)) {
>>                   return TRANSLATE_FAIL;
>>               }
>>               base = ppn << PGSHIFT;
>> @@ -717,8 +717,19 @@ restart:
>>               /* for superpage mappings, make a fake leaf PTE for the TLB's
>>                  benefit. */
>>               target_ulong vpn = addr >> PGSHIFT;
>> -            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
>> -                        (addr & ~TARGET_PAGE_MASK);
>> +
>> +            int napot_bits = 0;
>> +            if (cpu->cfg.ext_svnapot && (pte & (target_ulong)PTE_N)) {
>> +                napot_bits = ctzl(ppn) + 1;
>> +                if ((i != (levels - 1)) || (napot_bits != 4)) {
>> +                    return TRANSLATE_FAIL;
>> +                }
>> +            }
>> +
>> +            *physical = (((ppn & ~(((target_ulong)1 << napot_bits) - 1)) |
> It might be clearer to create the mask as a variable, there are a lot
> of brackets here :)
OK.
>
> Alistair
>
>> +                          (vpn & (((target_ulong)1 << napot_bits) - 1)) |
>> +                          (vpn & (((target_ulong)1 << ptshift) - 1))
>> +                        ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
>>
>>               /* set permissions on the TLB entry */
>>               if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
>> --
>> 2.17.1
>>
>>


