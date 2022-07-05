Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8e7g-00038q-Sm
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 04:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o8e7f-00036h-BO; Tue, 05 Jul 2022 04:41:31 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:38244 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o8e7b-0005aQ-Mx; Tue, 05 Jul 2022 04:41:31 -0400
Received: from [192.168.0.138] (unknown [117.151.235.252])
 by APP-01 (Coremail) with SMTP id qwCowADX3xcs+cNicPR0DA--.19282S2;
 Tue, 05 Jul 2022 16:41:18 +0800 (CST)
Subject: Re: [PATCH v10 09/12] target/riscv: Simplify counter predicate
 function
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>
References: <20220620231603.2547260-1-atishp@rivosinc.com>
 <20220620231603.2547260-10-atishp@rivosinc.com>
 <88b34ac2-c126-c4de-f238-f882d73365c6@iscas.ac.cn>
 <CAHBxVyF240FjEwtrEuttXXan1QKAoX1J8LHm3a91xSy=QRPEUQ@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <0245adf3-dc74-15c2-70ec-644f23ab9830@iscas.ac.cn>
Date: Tue, 5 Jul 2022 16:41:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHBxVyF240FjEwtrEuttXXan1QKAoX1J8LHm3a91xSy=QRPEUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowADX3xcs+cNicPR0DA--.19282S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr4kWw4DWryDJry5JFyfXrb_yoWfJw4kpa
 1ftay3Kr48Zr9rCa9Fq3Z8Kry7uryxJay5G3y5Ga4vkr15tr1rX3WqgF4jqas3Aryrtws2
 9F4j93sxua1UXFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyU
 JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfU8VbyDUUUU
X-Originating-IP: [117.151.235.252]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Tue, 05 Jul 2022 08:41:31 -0000


在 2022/7/5 下午4:00, Atish Kumar Patra 写道:
> On Mon, Jul 4, 2022 at 8:19 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>
>> 在 2022/6/21 上午7:15, Atish Patra 写道:
>>
>> All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
>> as a unified counter. Thus, the predicate function doesn't need handle each
>> case separately.
>>
>> Simplify the predicate function so that we just handle things differently
>> between RV32/RV64 and S/HS mode.
>>
>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   target/riscv/csr.c | 112 +++++----------------------------------------
>>   1 file changed, 11 insertions(+), 101 deletions(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 2664ce265784..9367e2af9b90 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>>       CPUState *cs = env_cpu(env);
>>       RISCVCPU *cpu = RISCV_CPU(cs);
>>       int ctr_index;
>> +    target_ulong ctr_mask;
>>       int base_csrno = CSR_CYCLE;
>>       bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
>>
>> @@ -82,122 +83,31 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>>           base_csrno += 0x80;
>>       }
>>       ctr_index = csrno - base_csrno;
>> +    ctr_mask = BIT(ctr_index);
>>
>>       if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
>>           (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
>>           goto skip_ext_pmu_check;
>>       }
>>
>> -    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
>> +    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & ctr_mask))) {
>>           /* No counter is enabled in PMU or the counter is out of range */
>>           return RISCV_EXCP_ILLEGAL_INST;
>>       }
>>
>>   skip_ext_pmu_check:
>>
>> -    if (env->priv == PRV_S) {
>> -        switch (csrno) {
>> -        case CSR_CYCLE:
>> -            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
>> -                return RISCV_EXCP_ILLEGAL_INST;
>> -            }
>> -            break;
>> -        case CSR_TIME:
>> -            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
>> -                return RISCV_EXCP_ILLEGAL_INST;
>> -            }
>> -            break;
>> -        case CSR_INSTRET:
>> -            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
>> -                return RISCV_EXCP_ILLEGAL_INST;
>> -            }
>> -            break;
>> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
>> -            if (!get_field(env->mcounteren, 1 << ctr_index)) {
>> -                return RISCV_EXCP_ILLEGAL_INST;
>> -            }
>> -            break;
>> -        }
>> -        if (rv32) {
>> -            switch (csrno) {
>> -            case CSR_CYCLEH:
>> -                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
>> -                    return RISCV_EXCP_ILLEGAL_INST;
>> -                }
>> -                break;
>> -            case CSR_TIMEH:
>> -                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
>> -                    return RISCV_EXCP_ILLEGAL_INST;
>> -                }
>> -                break;
>> -            case CSR_INSTRETH:
>> -                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
>> -                    return RISCV_EXCP_ILLEGAL_INST;
>> -                }
>> -                break;
>> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
>> -                if (!get_field(env->mcounteren, 1 << ctr_index)) {
>> -                    return RISCV_EXCP_ILLEGAL_INST;
>> -                }
>> -                break;
>> -            }
>> -        }
>> +    if (((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) ||
>> +       ((env->priv == PRV_U) && (!get_field(env->scounteren, ctr_mask)))) {
>> +        return RISCV_EXCP_ILLEGAL_INST;
>>       }
>>
>> Sorry. I didn't realize this simplification and sent a similar patch to fix the problems in Xcounteren
>>
>> related check I found when I tried to learn the patchset for state enable extension two days ago.
>>
>> I think there are several difference between our understanding, following is my modifications:
>>
>> +    if (csrno <= CSR_HPMCOUNTER31 && csrno >= CSR_CYCLE) {
>> +        field = 1 << (csrno - CSR_CYCLE);
>> +    } else if (riscv_cpu_mxl(env) == MXL_RV32 && csrno <= CSR_HPMCOUNTER31H &&
>> +               csrno >= CSR_CYCLEH) {
>> +        field = 1 << (csrno - CSR_CYCLEH);
>> +    }
>> +
>> +    if (env->priv < PRV_M && !get_field(env->mcounteren, field)) {
>> +        return RISCV_EXCP_ILLEGAL_INST;
>> +    }
>> +
>> +    if (riscv_cpu_virt_enabled(env) && !get_field(env->hcounteren, field)) {
>> +        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> +    }
>> +
>> +    if (riscv_has_ext(env, RVS) && env->priv == PRV_U &&
>> +        !get_field(env->scounteren, field)) {
>> +        if (riscv_cpu_virt_enabled(env)) {
>> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> +        } else {
>> +            return RISCV_EXCP_ILLEGAL_INST;
>>           }
>>       }
>>
>>
>> 1) For any less-privileged mode under M, illegal exception is raised if matching
>> bit in mcounteren is zero.
>>
> As per the priv spec, in the section 3.1.11
> "When one of these bits is set, access to the corresponding register
> is permitted in the next implemented privilege mode (S-mode if
> implemented, otherwise U-mode)."
>
> mcounteren controls the access for U-mode only if the next implemented
> mode is U (riscv_has_ext(env, RVS) must be false).
> I did not add the additional check as the ctr is defined only for
> !CONFIG_USER_ONLY.

In section 3.1.11, It also have description like this:

"In systems with U-mode, the mcounteren must be implemented, but all 
fields are WARL and may
be read-only zero, indicating reads to the corresponding counter will 
cause an illegal instruction
exception when executing in a less-privileged mode."

And !CONFIG_USER_ONLY is defined for QEMU system emulation,  it doesn't 
means current priv

cannot be  PRV_U mode.

>
>> 2) For VS/VU mode('H' extension is supported implicitly), virtual instruction
>> exception is raised if matching bit in hcounteren is zero.
>>
>> 3) scounteren csr only works in U/VU mode when 'S' extension is supported:
> Yes. But we don't need additional check for 'S' extension as it will
> be done by the predicate function "smode"

This is the question, smode can only guard the read/write of scounteren. 
If 'S' extension is not implemented,

scounteren will be zero. and If check is done as following:

+    if (((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) ||
+       ((env->priv == PRV_U) && (!get_field(env->scounteren, ctr_mask)))) {
+        return RISCV_EXCP_ILLEGAL_INST;
      }

any access from PRV_U will trigger illegal instruction exception. From above spec, this kind of
access will be controlled by mcounteren, and will be legal if matching bit in mcounteren is 1.

Regards,
Weiwei Li

>
>>     For U mode, illegal exception is raised if matching bit in scounteren is zero.
>>     For VU mode, virtual instruction exception exception is raised if matching bit
>> in scounteren is zero.
>>
>> Regards,
>> Weiwei Li
>>
>>
>>       if (riscv_cpu_virt_enabled(env)) {
>> -        switch (csrno) {
>> -        case CSR_CYCLE:
>> -            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
>> -                get_field(env->mcounteren, COUNTEREN_CY)) {
>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -            }
>> -            break;
>> -        case CSR_TIME:
>> -            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
>> -                get_field(env->mcounteren, COUNTEREN_TM)) {
>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -            }
>> -            break;
>> -        case CSR_INSTRET:
>> -            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
>> -                get_field(env->mcounteren, COUNTEREN_IR)) {
>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -            }
>> -            break;
>> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
>> -            if (!get_field(env->hcounteren, 1 << ctr_index) &&
>> -                 get_field(env->mcounteren, 1 << ctr_index)) {
>> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -            }
>> -            break;
>> -        }
>> -        if (rv32) {
>> -            switch (csrno) {
>> -            case CSR_CYCLEH:
>> -                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
>> -                    get_field(env->mcounteren, COUNTEREN_CY)) {
>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -                }
>> -                break;
>> -            case CSR_TIMEH:
>> -                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
>> -                    get_field(env->mcounteren, COUNTEREN_TM)) {
>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -                }
>> -                break;
>> -            case CSR_INSTRETH:
>> -                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
>> -                    get_field(env->mcounteren, COUNTEREN_IR)) {
>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -                }
>> -                break;
>> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
>> -                if (!get_field(env->hcounteren, 1 << ctr_index) &&
>> -                     get_field(env->mcounteren, 1 << ctr_index)) {
>> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -                }
>> -                break;
>> -            }
>> +        if (!get_field(env->mcounteren, ctr_mask)) {
>> +            /* The bit must be set in mcountern for HS mode access */
>> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> +        } else if (!get_field(env->hcounteren, ctr_mask)) {
>> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>           }
>>       }
>>   #endif


