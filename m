Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGcVG-00044z-Cw
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 04:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oGcVE-00042L-6v; Wed, 27 Jul 2022 04:34:48 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:60966 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oGcVA-0002cK-Hw; Wed, 27 Jul 2022 04:34:47 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-01 (Coremail) with SMTP id qwCowAAHTJyX+OBi8Hj7Ag--.49997S2;
 Wed, 27 Jul 2022 16:34:32 +0800 (CST)
Subject: Re: [PATCH v11 2/6] target/riscv: Simplify counter predicate function
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
References: <20220727064913.1041427-1-atishp@rivosinc.com>
 <20220727064913.1041427-3-atishp@rivosinc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <4fe4fca9-71ea-de77-1db1-b02302599881@iscas.ac.cn>
Date: Wed, 27 Jul 2022 16:34:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220727064913.1041427-3-atishp@rivosinc.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAAHTJyX+OBi8Hj7Ag--.49997S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr4kAr18AryUXFWfCr4kWFg_yoW7Cry7pa
 13ta17K39avr9rCa9rJ3WDGr1kuryxJay5Gw45Gw4vkw45JFn8Xa4Duw4jqa4rt345tw4v
 gF4Uu3s8ua1UWa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1U
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JUx73kUUUUU=
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Jul 2022 08:34:48 -0000


ÔÚ 2022/7/27 ÏÂÎç2:49, Atish Patra Ð´µÀ:
> All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
> as a unified counter. Thus, the predicate function doesn't need handle each
> case separately.
>
> Simplify the predicate function so that we just handle things differently
> between RV32/RV64 and S/HS mode.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   target/riscv/csr.c | 112 +++++----------------------------------------
>   1 file changed, 11 insertions(+), 101 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 1233bfa0a726..57dbbf9b09a0 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>       CPUState *cs = env_cpu(env);
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       int ctr_index;
> +    target_ulong ctr_mask;
>       int base_csrno = CSR_CYCLE;
>       bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
>   
> @@ -82,122 +83,31 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>           base_csrno += 0x80;
>       }
>       ctr_index = csrno - base_csrno;
> +    ctr_mask = BIT(ctr_index);
>   
>       if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
>           (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
>           goto skip_ext_pmu_check;
>       }
>   
> -    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
> +    if (!(cpu->pmu_avail_ctrs & ctr_mask)) {
>           /* No counter is enabled in PMU or the counter is out of range */
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
>   skip_ext_pmu_check:
>   
> -    if (env->priv == PRV_S) {
> -        switch (csrno) {
> -        case CSR_CYCLE:
> -            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_TIME:
> -            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_INSTRET:
> -            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            if (!get_field(env->mcounteren, 1 << ctr_index)) {
> -                return RISCV_EXCP_ILLEGAL_INST;
> -            }
> -            break;
> -        }
> -        if (rv32) {
> -            switch (csrno) {
> -            case CSR_CYCLEH:
> -                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_TIMEH:
> -                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_INSTRETH:
> -                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                if (!get_field(env->mcounteren, 1 << ctr_index)) {
> -                    return RISCV_EXCP_ILLEGAL_INST;
> -                }
> -                break;
> -            }
> -        }
> +    if (((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) ||
> +       ((env->priv == PRV_U) && (!get_field(env->scounteren, ctr_mask)))) {
> +        return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
>       if (riscv_cpu_virt_enabled(env)) {
> -        switch (csrno) {
> -        case CSR_CYCLE:
> -            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> -                get_field(env->mcounteren, COUNTEREN_CY)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_TIME:
> -            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> -                get_field(env->mcounteren, COUNTEREN_TM)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_INSTRET:
> -            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> -                get_field(env->mcounteren, COUNTEREN_IR)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            if (!get_field(env->hcounteren, 1 << ctr_index) &&
> -                 get_field(env->mcounteren, 1 << ctr_index)) {
> -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -            }
> -            break;
> -        }
> -        if (rv32) {
> -            switch (csrno) {
> -            case CSR_CYCLEH:
> -                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> -                    get_field(env->mcounteren, COUNTEREN_CY)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_TIMEH:
> -                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
> -                    get_field(env->mcounteren, COUNTEREN_TM)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_INSTRETH:
> -                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
> -                    get_field(env->mcounteren, COUNTEREN_IR)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                if (!get_field(env->hcounteren, 1 << ctr_index) &&
> -                     get_field(env->mcounteren, 1 << ctr_index)) {
> -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -                }
> -                break;
> -            }
> +        if (!get_field(env->mcounteren, ctr_mask)) {
> +            /* The bit must be set in mcountern for HS mode access */
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        } else if (!get_field(env->hcounteren, ctr_mask)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>           }

The logic is changed here. In original logic, 
RISCV_EXCP_VIRT_INSTRUCTION_FAULT is triggered when

!get_field(env->hcounteren, 1 << ctr_index) && get_field(env->mcounteren, 1 << ctr_index)

The new logic is RISCV_EXCP_VIRT_INSTRUCTION_FAULT is triggered when !get_field(env->mcounteren, ctr_mask)

or !get_field(env->hcounteren, 1 << ctr_index) && get_field(env->mcounteren, 1 << ctr_index)

Regards,

Weiwei Li

>       }
>   #endif


