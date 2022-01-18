Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9juq-0002k3-P8
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 03:32:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9jun-0002gV-4B; Tue, 18 Jan 2022 03:32:31 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:60888 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9juk-00069z-RD; Tue, 18 Jan 2022 03:32:28 -0500
Received: from [192.168.0.102] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACXe0EOe+Zh3Dh1Bg--.40394S2;
 Tue, 18 Jan 2022 16:32:15 +0800 (CST)
Subject: Re: [PATCH v5 3/5] target/riscv: add support for svnapot extension
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 wangjunqiang@iscas.ac.cn, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-4-liweiwei@iscas.ac.cn>
 <CAAhSdy3C7eNcrq2WJ_u7GnY-z=MJQCVQXL=iKufFETswzZ0awQ@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <57d51f70-2add-5383-6062-eb6f661394b7@iscas.ac.cn>
Date: Tue, 18 Jan 2022 16:32:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy3C7eNcrq2WJ_u7GnY-z=MJQCVQXL=iKufFETswzZ0awQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowACXe0EOe+Zh3Dh1Bg--.40394S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur4fAw1UXr48tw4kJrW8JFb_yoWrJFy7pr
 WkGa12kFZ7JFy2ka1fK3Wqqw1kGws09r4rCw4xJr4xJw4rJrWrG3WqkwsIkF1UXF48Zr1Y
 9a1UuF1Yyr4jvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1U
 MIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUbzVbDUUUU
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
X-List-Received-Date: Tue, 18 Jan 2022 08:32:31 -0000


在 2022/1/18 上午11:32, Anup Patel 写道:
> On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> - add PTE_N bit
>> - add PTE_N bit check for inner PTE
>> - update address translation to support 64KiB continuous region (napot_bits = 4)
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> Cc: Anup Patel <anup@brainfault.org>
> I did review this patch previously.
>
> In any case, this looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Regards,
> Anup

Thanks a lot. Sorry for your repeated work.

Regards.

Weiwei Li

>> ---
>>   target/riscv/cpu.c        |  2 ++
>>   target/riscv/cpu.h        |  1 +
>>   target/riscv/cpu_bits.h   |  1 +
>>   target/riscv/cpu_helper.c | 18 +++++++++++++++---
>>   4 files changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 9bc25d3055..ff6c86c85b 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -668,6 +668,8 @@ static Property riscv_cpu_properties[] = {
>>       DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>>       DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>>
>> +    DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>> +
>>       DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>>       DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>>       DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 4d63086765..d3d17cde82 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -327,6 +327,7 @@ struct RISCVCPU {
>>           bool ext_counters;
>>           bool ext_ifencei;
>>           bool ext_icsr;
>> +        bool ext_svnapot;
>>           bool ext_zfh;
>>           bool ext_zfhmin;
>>
>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>> index 282cd8eecd..5501e9698b 100644
>> --- a/target/riscv/cpu_bits.h
>> +++ b/target/riscv/cpu_bits.h
>> @@ -486,6 +486,7 @@ typedef enum {
>>   #define PTE_A               0x040 /* Accessed */
>>   #define PTE_D               0x080 /* Dirty */
>>   #define PTE_SOFT            0x300 /* Reserved for Software */
>> +#define PTE_N               0x8000000000000000 /* NAPOT translation */
>>
>>   /* Page table PPN shift amount */
>>   #define PTE_PPN_SHIFT       10
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 1820188f41..c276760c7f 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -621,12 +621,13 @@ restart:
>>
>>           hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>>
>> +        RISCVCPU *cpu = env_archcpu(env);
>>           if (!(pte & PTE_V)) {
>>               /* Invalid PTE */
>>               return TRANSLATE_FAIL;
>>           } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>>               /* Inner PTE, continue walking */
>> -            if (pte & (PTE_D | PTE_A | PTE_U)) {
>> +            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_N)) {
>>                   return TRANSLATE_FAIL;
>>               }
>>               base = ppn << PGSHIFT;
>> @@ -702,8 +703,19 @@ restart:
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
>> +                          (vpn & (((target_ulong)1 << napot_bits) - 1)) |
>> +                          (vpn & (((target_ulong)1 << ptshift) - 1))
>> +                        ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
>>
>>               /* set permissions on the TLB entry */
>>               if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
>> --
>> 2.17.1
>>


