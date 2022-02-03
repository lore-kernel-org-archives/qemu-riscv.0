Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nFS7q-0007iV-J4
	for mharc-qemu-riscv@gnu.org; Wed, 02 Feb 2022 21:45:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nFS7l-0007hk-U3; Wed, 02 Feb 2022 21:45:30 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:36230 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nFS7c-0008A7-Um; Wed, 02 Feb 2022 21:45:25 -0500
Received: from [192.168.0.107] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABHT5uwQfthxDJBAA--.62884S2;
 Thu, 03 Feb 2022 10:45:04 +0800 (CST)
Subject: Re: [PATCH v8 3/5] target/riscv: add support for svnapot extension
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>, Guo Ren <ren_guo@c-sky.com>
References: <20220201142415.29980-1-liweiwei@iscas.ac.cn>
 <20220201142415.29980-4-liweiwei@iscas.ac.cn>
 <CAKmqyKNp-D5ijraM+-r7ZU3eYzZ7Wf_kViAjc_7GW=RUp28V-Q@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <694e1999-f466-0509-109c-1bf0fc691dab@iscas.ac.cn>
Date: Thu, 3 Feb 2022 10:45:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNp-D5ijraM+-r7ZU3eYzZ7Wf_kViAjc_7GW=RUp28V-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowABHT5uwQfthxDJBAA--.62884S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFy3Xr4rAw43Xr45Zw4xJFb_yoWrXr13pr
 WkGa12kFZ7JFy2ka1xKF1jqr18Kw4Ykr4ruw4xJr4Iyw45GrWrW3WDKw4Y9F4DXr48Zr4j
 9a1qvF1YyFWjvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20x
 vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
 cVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjdHUDUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 03 Feb 2022 02:45:32 -0000


在 2022/2/3 上午6:25, Alistair Francis 写道:
> On Wed, Feb 2, 2022 at 3:24 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
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
>>   target/riscv/cpu_helper.c | 18 +++++++++++++++---
>>   3 files changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 6df07b8289..cfaccdfc72 100644
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
>> index 6ea3944423..7abe9607ff 100644
>> --- a/target/riscv/cpu_bits.h
>> +++ b/target/riscv/cpu_bits.h
>> @@ -489,6 +489,7 @@ typedef enum {
>>   #define PTE_A               0x040 /* Accessed */
>>   #define PTE_D               0x080 /* Dirty */
>>   #define PTE_SOFT            0x300 /* Reserved for Software */
>> +#define PTE_N               0x8000000000000000ULL /* NAPOT translation */
>>
>>   /* Page table PPN shift amount */
>>   #define PTE_PPN_SHIFT       10
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 61c3a9a4ad..77b263c37e 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -456,6 +456,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>>       bool use_background = false;
>>       hwaddr ppn;
>>       RISCVCPU *cpu = env_archcpu(env);
>> +    int napot_bits = 0;
>> +    target_ulong napot_mask;
>>
>>       /*
>>        * Check if we should use the background registers for the two
>> @@ -640,7 +642,7 @@ restart:
>>               return TRANSLATE_FAIL;
>>           } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>>               /* Inner PTE, continue walking */
>> -            if (pte & (PTE_D | PTE_A | PTE_U)) {
>> +            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_N)) {
> You shouldn't need this cast
>
The reason that I added cast here is to avoid the possible warning for 
strict type check that pte is target_ulong( unsgined int in RV32) and  
PTE_N is always unsigned long long.

I'm not quite sure if such strict type check exists. I tested the 
operation between unsigned int and unsigned long long on gcc v 7.5.0 and 
v10.2.0 with -Wall and -Wextra. It didn't trigger any warning without  
explicit cast.

I'll delete this cast if you assist.

Regards,

Weiwei Li

>>                   return TRANSLATE_FAIL;
>>               }
>>               base = ppn << PGSHIFT;
>> @@ -716,8 +718,18 @@ restart:
>>               /* for superpage mappings, make a fake leaf PTE for the TLB's
>>                  benefit. */
>>               target_ulong vpn = addr >> PGSHIFT;
>> -            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
>> -                        (addr & ~TARGET_PAGE_MASK);
>> +
>> +            if (cpu->cfg.ext_svnapot && (pte & (target_ulong)PTE_N)) {
> Same here
>
> Otherwise:
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
>> +                napot_bits = ctzl(ppn) + 1;
>> +                if ((i != (levels - 1)) || (napot_bits != 4)) {
>> +                    return TRANSLATE_FAIL;
>> +                }
>> +            }
>> +
>> +            napot_mask = (1 << napot_bits) - 1;
>> +            *physical = (((ppn & ~napot_mask) | (vpn & napot_mask) |
>> +                          (vpn & (((target_ulong)1 << ptshift) - 1))
>> +                         ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
>>
>>               /* set permissions on the TLB entry */
>>               if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
>> --
>> 2.17.1
>>
>>


