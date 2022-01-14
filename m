Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n8NiI-0000BL-Nv
	for mharc-qemu-riscv@gnu.org; Fri, 14 Jan 2022 09:37:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n8Ni5-0008Uv-IQ; Fri, 14 Jan 2022 09:37:48 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:44870 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n8Ni0-0007jp-Ls; Fri, 14 Jan 2022 09:37:44 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAA3FxSwiuFh_2s3Bg--.49053S2;
 Fri, 14 Jan 2022 22:37:36 +0800 (CST)
Subject: Re: [PATCH v3 3/3] target/riscv: add support for svpbmt extension
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 wangjunqiang@iscas.ac.cn, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>
References: <20220114014059.23300-1-liweiwei@iscas.ac.cn>
 <20220114014059.23300-4-liweiwei@iscas.ac.cn>
 <CAAhSdy3pwbw8E7KnjQBguY83DbVYhX4LiLK2WBwb_A9KvyAivQ@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <8d76aab5-eee0-aef0-37c6-94b7e44f38c3@iscas.ac.cn>
Date: Fri, 14 Jan 2022 22:37:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy3pwbw8E7KnjQBguY83DbVYhX4LiLK2WBwb_A9KvyAivQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAA3FxSwiuFh_2s3Bg--.49053S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw4rZrW8tw47Ar1kAryDAwb_yoWrJF45pr
 WkGay2kayktFWaka1xtr15Jw4UJws09F4Fkws7Xrs7Jw45J3yrGF1DKw43KF45XF48Zr1j
 9F1j9F1Yyr4jqaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUTOJ5UUUUU=
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
X-List-Received-Date: Fri, 14 Jan 2022 14:37:49 -0000


在 2022/1/14 下午9:59, Anup Patel 写道:
> On Fri, Jan 14, 2022 at 7:11 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> It uses two PTE bits, but otherwise has no effect on QEMU, since QEMU is sequentially consistent and doesn't model PMAs currently
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>> ---
>>   target/riscv/cpu.c        | 1 +
>>   target/riscv/cpu.h        | 1 +
>>   target/riscv/cpu_bits.h   | 3 +++
>>   target/riscv/cpu_helper.c | 9 ++++++++-
>>   4 files changed, 13 insertions(+), 1 deletion(-)
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
>> index 58ab85bca3..f90766e026 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -619,16 +619,23 @@ restart:
>>               return TRANSLATE_FAIL;
>>           }
>>
>> -        hwaddr ppn = (pte & ~(target_ulong)PTE_N) >> PTE_PPN_SHIFT;
>> +        hwaddr ppn = (pte & ~(target_ulong)PTE_ATTR) >> PTE_PPN_SHIFT;
>>
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
>> +            if (pte & (PTE_D | PTE_A | PTE_U | PTE_N | PTE_PBMT)) {
>> +                return TRANSLATE_FAIL;
>> +            }
> I think you should add a patch before PATCH1 to add following:
>
> if (pte & (PTE_D | PTE_A | PTE_U)) {
>      return TRANSLATE_FAIL;
> }
>
> The current PATCH1 should add PTE_N to the comparison and
> this patch can add PTE_PBMT to the comparison.
OK. I'll update this.
>>               base = ppn << PGSHIFT;
>>           } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
>>               /* Reserved leaf PTE flags: PTE_W */
>> --
>> 2.17.1
>>
> Apart from the minor comment above, it looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Regards,
> Anup

Regards,

Weiwei Li


