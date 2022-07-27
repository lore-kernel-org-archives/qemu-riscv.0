Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGWE1-0003FE-4L
	for mharc-qemu-riscv@gnu.org; Tue, 26 Jul 2022 21:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oGWDz-0003Cl-Dn; Tue, 26 Jul 2022 21:52:35 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:55336 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oGWDw-0004OO-E2; Tue, 26 Jul 2022 21:52:35 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-05 (Coremail) with SMTP id zQCowADX3rJSmuBi_gsREw--.371S2;
 Wed, 27 Jul 2022 09:52:18 +0800 (CST)
Subject: Re: [PATCH] target/riscv: fix csr check for cycle{h}, instret{h},
 time{h}, hpmcounter3~31{h}
To: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <alistair23@gmail.com>
Cc: Atish Kumar Patra <atishp@rivosinc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, Frank Chang <frank.chang@sifive.com>
References: <20220702134149.14384-1-liweiwei@iscas.ac.cn>
 <CAKmqyKNoijHZENxw4dtAK9BfA_-kT8vShrKaC6oero8K4BUCjQ@mail.gmail.com>
 <CAOnJCUJzVwAC7YNQipLV=e+R8D6VYTOOKqoM74Edf3wO3_=MSg@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <46eec2dd-9e4f-673d-585b-767cb538bf5f@iscas.ac.cn>
Date: Wed, 27 Jul 2022 09:52:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCUJzVwAC7YNQipLV=e+R8D6VYTOOKqoM74Edf3wO3_=MSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowADX3rJSmuBi_gsREw--.371S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFW8Kw1DAr17ZF15Jw13Arb_yoWrZr4Up3
 WftanrKFy8Xr9rCay2q3Z8Kr1jvryxWa45Gw45Ga40krn8tr9xXa4DWr4UKas5Zr98Gw4v
 9r4j939xZF4UXa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUklb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
 FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
 0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
 r21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8rcTPUUUU
 U==
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 27 Jul 2022 01:52:35 -0000


在 2022/7/27 上午7:34, Atish Patra 写道:
> On Wed, Jul 20, 2022 at 9:32 PM Alistair Francis <alistair23@gmail.com> wrote:
>> On Sat, Jul 2, 2022 at 11:42 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>> - improve the field extract progress
> This part is already improved with the PMU series.
>
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg895143.html
Yeah, I have replied on this patch a few days ago.
>
>>> - add stand-alone check for mcuonteren when in less-privileged mode
>>> - add check for scounteren when 'S' is enabled and current priv is PRV_U
>>>
> These two parts are fine. I am resending the remaining patches for the
> PMU series.
> Can you please rebase your top and resend it ?

Ok. I'll rebase and resend it later.

Regards,

Weiwei Li

>
>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> + Atish
>>
>> Alistair
>>
>>> ---
>>>   target/riscv/csr.c | 76 ++++++++++++++--------------------------------
>>>   1 file changed, 22 insertions(+), 54 deletions(-)
>>>
>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>> index 6dbe9b541f..a4719cbf35 100644
>>> --- a/target/riscv/csr.c
>>> +++ b/target/riscv/csr.c
>>> @@ -72,66 +72,34 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>>>   #if !defined(CONFIG_USER_ONLY)
>>>       CPUState *cs = env_cpu(env);
>>>       RISCVCPU *cpu = RISCV_CPU(cs);
>>> +    uint32_t field = 0;
>>>
>>>       if (!cpu->cfg.ext_counters) {
>>>           /* The Counters extensions is not enabled */
>>>           return RISCV_EXCP_ILLEGAL_INST;
>>>       }
>>>
>>> -    if (riscv_cpu_virt_enabled(env)) {
>>> -        switch (csrno) {
>>> -        case CSR_CYCLE:
>>> -            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
>>> -                get_field(env->mcounteren, COUNTEREN_CY)) {
>>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>> -            }
>>> -            break;
>>> -        case CSR_TIME:
>>> -            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
>>> -                get_field(env->mcounteren, COUNTEREN_TM)) {
>>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>> -            }
>>> -            break;
>>> -        case CSR_INSTRET:
>>> -            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
>>> -                get_field(env->mcounteren, COUNTEREN_IR)) {
>>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>> -            }
>>> -            break;
>>> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
>>> -            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
>>> -                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
>>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>> -            }
>>> -            break;
>>> -        }
>>> -        if (riscv_cpu_mxl(env) == MXL_RV32) {
>>> -            switch (csrno) {
>>> -            case CSR_CYCLEH:
>>> -                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
>>> -                    get_field(env->mcounteren, COUNTEREN_CY)) {
>>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>> -                }
>>> -                break;
>>> -            case CSR_TIMEH:
>>> -                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
>>> -                    get_field(env->mcounteren, COUNTEREN_TM)) {
>>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>> -                }
>>> -                break;
>>> -            case CSR_INSTRETH:
>>> -                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
>>> -                    get_field(env->mcounteren, COUNTEREN_IR)) {
>>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>> -                }
>>> -                break;
>>> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
>>> -                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
>>> -                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
>>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>> -                }
>>> -                break;
>>> -            }
>>> +    if (csrno <= CSR_HPMCOUNTER31 && csrno >= CSR_CYCLE) {
>>> +        field = 1 << (csrno - CSR_CYCLE);
>>> +    } else if (riscv_cpu_mxl(env) == MXL_RV32 && csrno <= CSR_HPMCOUNTER31H &&
>>> +               csrno >= CSR_CYCLEH) {
>>> +        field = 1 << (csrno - CSR_CYCLEH);
>>> +    }
>>> +
>>> +    if (env->priv < PRV_M && !get_field(env->mcounteren, field)) {
>>> +        return RISCV_EXCP_ILLEGAL_INST;
>>> +    }
>>> +
>>> +    if (riscv_cpu_virt_enabled(env) && !get_field(env->hcounteren, field)) {
>>> +        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>> +    }
>>> +
>>> +    if (riscv_has_ext(env, RVS) && env->priv == PRV_U &&
>>> +        !get_field(env->scounteren, field)) {
>>> +        if (riscv_cpu_virt_enabled(env)) {
>>> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>> +        } else {
>>> +            return RISCV_EXCP_ILLEGAL_INST;
>>>           }
>>>       }
>>>   #endif
>>> --
>>> 2.17.1
>>>
>>>
>
>


