Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLvmY-0002QT-6x
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 20:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oLvmW-0002QG-BL; Wed, 10 Aug 2022 20:10:36 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:45452 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oLvmS-0006WS-VG; Wed, 10 Aug 2022 20:10:36 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-05 (Coremail) with SMTP id zQCowABHaX7uSPRie+7rFw--.22181S2;
 Thu, 11 Aug 2022 08:10:23 +0800 (CST)
Subject: Re: [PATCH v9 3/3] target/riscv: Add vstimecmp support
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20220810184548.3620153-1-atishp@rivosinc.com>
 <20220810184548.3620153-4-atishp@rivosinc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <9170b9c7-fcf7-88b4-31ae-fdab496439b0@iscas.ac.cn>
Date: Thu, 11 Aug 2022 08:10:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220810184548.3620153-4-atishp@rivosinc.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowABHaX7uSPRie+7rFw--.22181S2
X-Coremail-Antispam: 1UD129KBjvJXoW3KFW7Cw1rKry8urWkJr1xAFb_yoWDXry3pF
 WkC39xKay3tFZrZ3Z3trn8GwnYyw4UKan8Wws7CFWrAFs8GrW5GF1DK3ZrAFs5WFWDWr4F
 vF1Fkr1Ykw40vFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
 evJa73UjIFyTuYvjfU8VbyDUUUU
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 11 Aug 2022 00:10:36 -0000


ÔÚ 2022/8/11 ÉÏÎç2:45, Atish Patra Ð´µÀ:
> vstimecmp CSR allows the guest OS or to program the next guest timer
> interrupt directly. Thus, hypervisor no longer need to inject the
> timer interrupt to the guest if vstimecmp is used. This was ratified
> as a part of the Sstc extension.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   target/riscv/cpu.h         |  4 ++
>   target/riscv/cpu_bits.h    |  4 ++
>   target/riscv/cpu_helper.c  | 11 +++--
>   target/riscv/csr.c         | 88 ++++++++++++++++++++++++++++++++++++--
>   target/riscv/machine.c     |  1 +
>   target/riscv/time_helper.c | 16 +++++++
>   6 files changed, 118 insertions(+), 6 deletions(-)

LGTM.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,
Weiwei Li
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4cda2905661e..1fd382b2717f 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -312,6 +312,8 @@ struct CPUArchState {
>       /* Sstc CSRs */
>       uint64_t stimecmp;
>   
> +    uint64_t vstimecmp;
> +
>       /* physical memory protection */
>       pmp_table_t pmp_state;
>       target_ulong mseccfg;
> @@ -366,6 +368,8 @@ struct CPUArchState {
>   
>       /* Fields from here on are preserved across CPU reset. */
>       QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> +    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
> +    bool vstime_irq;
>   
>       hwaddr kernel_addr;
>       hwaddr fdt_addr;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index ac17cf1515c0..095dab19f512 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -257,6 +257,10 @@
>   #define CSR_VSIP            0x244
>   #define CSR_VSATP           0x280
>   
> +/* Sstc virtual CSRs */
> +#define CSR_VSTIMECMP       0x24D
> +#define CSR_VSTIMECMPH      0x25D
> +
>   #define CSR_MTINST          0x34a
>   #define CSR_MTVAL2          0x34b
>   
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 650574accf0a..1e4faa84e839 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -345,8 +345,9 @@ uint64_t riscv_cpu_all_pending(CPURISCVState *env)
>   {
>       uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
>       uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> +    uint64_t vstip = (env->vstime_irq) ? MIP_VSTIP : 0;
>   
> -    return (env->mip | vsgein) & env->mie;
> +    return (env->mip | vsgein | vstip) & env->mie;
>   }
>   
>   int riscv_cpu_mirq_pending(CPURISCVState *env)
> @@ -605,7 +606,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>   {
>       CPURISCVState *env = &cpu->env;
>       CPUState *cs = CPU(cpu);
> -    uint64_t gein, vsgein = 0, old = env->mip;
> +    uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
>       bool locked = false;
>   
>       if (riscv_cpu_virt_enabled(env)) {
> @@ -613,6 +614,10 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>           vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
>       }
>   
> +    /* No need to update mip for VSTIP */
> +    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
> +    vstip = env->vstime_irq ? MIP_VSTIP : 0;
> +
>       if (!qemu_mutex_iothread_locked()) {
>           locked = true;
>           qemu_mutex_lock_iothread();
> @@ -620,7 +625,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>   
>       env->mip = (env->mip & ~mask) | (value & mask);
>   
> -    if (env->mip | vsgein) {
> +    if (env->mip | vsgein | vstip) {
>           cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>       } else {
>           cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9079d988ba08..38bb46db8f99 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -808,6 +808,7 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
>   {
>       CPUState *cs = env_cpu(env);
>       RISCVCPU *cpu = RISCV_CPU(cs);
> +    bool hmode_check = false;
>   
>       if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
>           return RISCV_EXCP_ILLEGAL_INST;
> @@ -826,7 +827,18 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> -    return smode(env, csrno);
> +    if (riscv_cpu_virt_enabled(env)) {
> +        if (!(get_field(env->hcounteren, COUNTEREN_TM) &
> +              get_field(env->henvcfg, HENVCFG_STCE))) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
> +    }
> +
> +    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
> +        hmode_check = true;
> +    }
> +
> +    return hmode_check ? hmode(env, csrno) : smode(env, csrno);
>   }
>   
>   static RISCVException sstc_32(CPURISCVState *env, int csrno)
> @@ -838,17 +850,72 @@ static RISCVException sstc_32(CPURISCVState *env, int csrno)
>       return sstc(env, csrno);
>   }
>   
> +static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    *val = env->vstimecmp;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    *val = env->vstimecmp >> 32;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (riscv_cpu_mxl(env) == MXL_RV32) {
> +        env->vstimecmp = deposit64(env->vstimecmp, 0, 32, (uint64_t)val);
> +    } else {
> +        env->vstimecmp = val;
> +    }
> +
> +    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +                              env->htimedelta, MIP_VSTIP);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    env->vstimecmp = deposit64(env->vstimecmp, 32, 32, (uint64_t)val);
> +    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +                              env->htimedelta, MIP_VSTIP);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>   static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
>                                       target_ulong *val)
>   {
> -    *val = env->stimecmp;
> +    if (riscv_cpu_virt_enabled(env)) {
> +        *val = env->vstimecmp;
> +    } else {
> +        *val = env->stimecmp;
> +    }
> +
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
>                                       target_ulong *val)
>   {
> -    *val = env->stimecmp >> 32;
> +    if (riscv_cpu_virt_enabled(env)) {
> +        *val = env->vstimecmp >> 32;
> +    } else {
> +        *val = env->stimecmp >> 32;
> +    }
> +
>       return RISCV_EXCP_NONE;
>   }
>   
> @@ -857,6 +924,10 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
>   {
>       RISCVCPU *cpu = env_archcpu(env);
>   
> +    if (riscv_cpu_virt_enabled(env)) {
> +        return write_vstimecmp(env, csrno, val);
> +    }
> +
>       if (riscv_cpu_mxl(env) == MXL_RV32) {
>           env->stimecmp = deposit64(env->stimecmp, 0, 32, (uint64_t)val);
>       } else {
> @@ -873,6 +944,10 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
>   {
>       RISCVCPU *cpu = env_archcpu(env);
>   
> +    if (riscv_cpu_virt_enabled(env)) {
> +        return write_vstimecmph(env, csrno, val);
> +    }
> +
>       env->stimecmp = deposit64(env->stimecmp, 32, 32, (uint64_t)val);
>       riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
>   
> @@ -1810,6 +1885,7 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
>       if (csrno != CSR_HVIP) {
>           gin = get_field(env->hstatus, HSTATUS_VGEIN);
>           old_mip |= (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP : 0;
> +        old_mip |= env->vstime_irq ? MIP_VSTIP : 0;
>       }
>   
>       if (ret_val) {
> @@ -3670,6 +3746,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_STIMECMPH] = { "stimecmph", sstc_32, read_stimecmph, write_stimecmph,
>                           .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSTIMECMP] = { "vstimecmp", sstc, read_vstimecmp,
> +                        write_vstimecmp,
> +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSTIMECMPH] = { "vstimecmph", sstc_32, read_vstimecmph,
> +                         write_vstimecmph,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
>   
>       /* Supervisor Protection and Translation */
>       [CSR_SATP]     = { "satp",     smode, read_satp,     write_satp     },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 622fface484e..4ba55705d147 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper = {
>           VMSTATE_UINTTL(env.hgeie, RISCVCPU),
>           VMSTATE_UINTTL(env.hgeip, RISCVCPU),
>           VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> +        VMSTATE_UINT64(env.vstimecmp, RISCVCPU),
>   
>           VMSTATE_UINTTL(env.hvictl, RISCVCPU),
>           VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
> diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> index f3fb5eac7b7b..8cce667dfd47 100644
> --- a/target/riscv/time_helper.c
> +++ b/target/riscv/time_helper.c
> @@ -22,6 +22,14 @@
>   #include "time_helper.h"
>   #include "hw/intc/riscv_aclint.h"
>   
> +static void riscv_vstimer_cb(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +    env->vstime_irq = 1;
> +    riscv_cpu_update_mip(cpu, MIP_VSTIP, BOOL_TO_MASK(1));
> +}
> +
>   static void riscv_stimer_cb(void *opaque)
>   {
>       RISCVCPU *cpu = opaque;
> @@ -47,10 +55,16 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
>            * If we're setting an stimecmp value in the "past",
>            * immediately raise the timer interrupt
>            */
> +        if (timer_irq == MIP_VSTIP) {
> +            env->vstime_irq = 1;
> +        }
>           riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
>           return;
>       }
>   
> +    if (timer_irq == MIP_VSTIP) {
> +        env->vstime_irq = 0;
> +    }
>       /* Clear the [V]STIP bit in mip */
>       riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
>   
> @@ -95,4 +109,6 @@ void riscv_timer_init(RISCVCPU *cpu)
>       env->stimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_stimer_cb, cpu);
>       env->stimecmp = 0;
>   
> +    env->vstimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_vstimer_cb, cpu);
> +    env->vstimecmp = 0;
>   }


