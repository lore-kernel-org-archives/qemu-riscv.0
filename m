Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9NOA-00076R-I3
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 03:29:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9NO4-00070s-FB; Mon, 17 Jan 2022 03:29:15 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:52756 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9NO1-0003Mv-Gg; Mon, 17 Jan 2022 03:29:12 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAAnLFjCKOVhTRCtBQ--.8130S2;
 Mon, 17 Jan 2022 16:28:51 +0800 (CST)
Subject: Re: [PATCH v4 4/4] target/riscv: add support for svpbmt extension
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bin.meng@windriver.com,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>
References: <20220116025925.29973-1-liweiwei@iscas.ac.cn>
 <20220116025925.29973-5-liweiwei@iscas.ac.cn>
 <CAJF2gTTh+L5PX2kAnAMQUeindidpW=tWRhAX_B0HwV4rFzsyBA@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <facc03c8-f2ba-9e5e-b571-4fbfbdff72f3@iscas.ac.cn>
Date: Mon, 17 Jan 2022 16:28:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJF2gTTh+L5PX2kAnAMQUeindidpW=tWRhAX_B0HwV4rFzsyBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowAAnLFjCKOVhTRCtBQ--.8130S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1rWr4xAFWfCw13Gr4fGrg_yoW5Kw1xpr
 WkGay2ka95tFy3Ca1xtF15tw18JwsI9F4rCws7Zr4xJw45JrW3GF1DKw47KF45XF48ur10
 9F1j9F1Yvr4jqaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
 04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
 w20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
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
X-List-Received-Date: Mon, 17 Jan 2022 08:29:15 -0000


在 2022/1/17 下午3:18, Guo Ren 写道:
> On Sun, Jan 16, 2022 at 11:08 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> - add PTE_PBMT bits: It uses two PTE bits, but otherwise has no effect on QEMU, since QEMU is sequentially consistent and doesn't model PMAs currently
>> - add PTE_PBMT bits check for inner PTE
>> - add reserved bits check for all PTE
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> ---
>>   target/riscv/cpu.c        | 1 +
>>   target/riscv/cpu.h        | 1 +
>>   target/riscv/cpu_bits.h   | 3 +++
>>   target/riscv/cpu_helper.c | 8 ++++++--
>>   4 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 45ac98e06b..4f82bd00a3 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -670,6 +670,7 @@ static Property riscv_cpu_properties[] = {
>>
>>       DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>>       DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>> +    DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
>>
>>       DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>>       DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index c3d1845ca1..53f314c752 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -329,6 +329,7 @@ struct RISCVCPU {
>>           bool ext_icsr;
>>           bool ext_svinval;
>>           bool ext_svnapot;
>> +        bool ext_svpbmt;
>>           bool ext_zfh;
>>           bool ext_zfhmin;
>>
>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>> index bc23e3b523..ee294c1d0b 100644
>> --- a/target/riscv/cpu_bits.h
>> +++ b/target/riscv/cpu_bits.h
>> @@ -486,7 +486,10 @@ typedef enum {
>>   #define PTE_A               0x040 /* Accessed */
>>   #define PTE_D               0x080 /* Dirty */
>>   #define PTE_SOFT            0x300 /* Reserved for Software */
>> +#define PTE_RSVD            0x1FC0000000000000 /* Reserved for future use */
>> +#define PTE_PBMT            0x6000000000000000 /* Page-based memory types */
>>   #define PTE_N               0x8000000000000000 /* NAPOT translation */
>> +#define PTE_ATTR            0xFFC0000000000000 /* All attributes bits */
>>
>>   /* Page table PPN shift amount */
>>   #define PTE_PPN_SHIFT       10
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 832a2dd79c..f90766e026 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -619,17 +619,21 @@ restart:
>>               return TRANSLATE_FAIL;
>>           }
>>
>> -        hwaddr ppn = (pte & ~(target_ulong)PTE_N) >> PTE_PPN_SHIFT;
>> +        hwaddr ppn = (pte & ~(target_ulong)PTE_ATTR) >> PTE_PPN_SHIFT;
> This would break rv32. Please ref:
> https://lore.kernel.org/qemu-devel/1569456861-8502-1-git-send-email-guoren@kernel.org/
>
Thanks for your comment . I'll merge this into our patchset.

Regards,

Weiwei Li

>>           RISCVCPU *cpu = env_archcpu(env);
>>           if (!cpu->cfg.ext_svnapot && (pte & PTE_N)) {
>>               return TRANSLATE_FAIL;
>> +        } else if (!cpu->cfg.ext_svpbmt && (pte & PTE_PBMT)) {
>> +            return TRANSLATE_FAIL;
>> +        } else if (pte & PTE_RSVD) {
>> +            return TRANSLATE_FAIL;
>>           } else if (!(pte & PTE_V)) {
>>               /* Invalid PTE */
>>               return TRANSLATE_FAIL;
>>           } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>>               /* Inner PTE, continue walking */
>> -            if (pte & (PTE_D | PTE_A | PTE_U | PTE_N)) {
>> +            if (pte & (PTE_D | PTE_A | PTE_U | PTE_N | PTE_PBMT)) {
>>                   return TRANSLATE_FAIL;
>>               }
>>               base = ppn << PGSHIFT;
>> --
>> 2.17.1
>>
>>
>


