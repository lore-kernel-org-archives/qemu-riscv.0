Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oKqEF-0001Lr-Tb
	for mharc-qemu-riscv@gnu.org; Sun, 07 Aug 2022 20:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKqDi-0001K4-Ka; Sun, 07 Aug 2022 20:02:11 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKqDg-0003US-J6; Sun, 07 Aug 2022 20:02:10 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x23so7138616pll.7;
 Sun, 07 Aug 2022 17:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=IeIa90wG8d9cb4Xcrkbe7Fy7fe2q7yXSiGmG8PAUTQ0=;
 b=d3mTsqQmYM2c2H+oAxCqI8q9Ywhrn98mySE9m4gUVBLr5eaaOEkaHLP4EZIYcKpXW8
 UyKzQHWsgROFGLBvn+O6jUQgcqZjofrdr5P61MML0pCEj6/PP7Gk2bL8ZNf17OYrbirF
 iKI7+/rTOYvW42iEhsyQpLlSSSmNVqquKkXx88drUyRRRQOXRRbAaW5KaUzHyWVWIYt8
 U0zWMSdIysvtlo1UKNY+C0IfF2tKDrvEltCB8krbqqIEnrUHEPrRcRleirTyaeQ7TgR6
 AO4SZlnykp7xNr026Uaa/CN6OKUq5J4mNoVUee5NAvv+I152t0VzxV3OWxL7ndyJ3t2v
 OqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=IeIa90wG8d9cb4Xcrkbe7Fy7fe2q7yXSiGmG8PAUTQ0=;
 b=3bOIyecAokmaRjAAJ9yo9mi9INWSpz8sVyTeQBw6wtEznMcunlz91AGHspej+RBSxO
 PD7SkTJDBVDtV8bN+ziXKekZsQUImP+gxrWLwRuXmjCWPCKPj11tEpMsQDpVSwBPb2H5
 YQ01vAklWEt76F57COPbdLwI5ea8X7/3S0hFg2IBcbwL+IHKe6nIRT71Vz0R5dhbK8vl
 Vi3ejm1Kxq8aXDakwozXSex9c5Pihf80LRE7V+5EL9mCbhRNWgkxQheqUzopD31rKyjQ
 yUf69na7CSX+OsfWLimdOtZIRDhgbzA3LQP+JOEldnZDrCCSdXqFiuPgee/eVDkFISHF
 SEaA==
X-Gm-Message-State: ACgBeo1hClWJFzk4RCFGDWIHu/VfRyhUkmgkhNl81PajFqwjdskSugQW
 Zh7rEjaBt3dWlEn9G9moCER8gyz1w9N20366sCQ=
X-Google-Smtp-Source: AA6agR7fbAG6Zvqb1+cQobRPOx0nFr9mX/VNkyGwhNI/0kj5f8d6EBehV9D0JuDXcCzR7eA8MziO0oAlxYTBSzk2k28=
X-Received: by 2002:a17:90b:3b49:b0:1f4:df09:d671 with SMTP id
 ot9-20020a17090b3b4900b001f4df09d671mr18186116pjb.129.1659916926755; Sun, 07
 Aug 2022 17:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220804014240.2514957-1-atishp@rivosinc.com>
 <20220804014240.2514957-4-atishp@rivosinc.com>
In-Reply-To: <20220804014240.2514957-4-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 10:01:40 +1000
Message-ID: <CAKmqyKPB9GZ6YpyOamjL357ZbKde3mWiSqrv9fF_zG3zY1C0TA@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] target/riscv: Add vstimecmp support
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 08 Aug 2022 00:02:11 -0000
X-List-Received-Date: Mon, 08 Aug 2022 00:02:11 -0000

On Thu, Aug 4, 2022 at 11:47 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> vstimecmp CSR allows the guest OS or to program the next guest timer
> interrupt directly. Thus, hypervisor no longer need to inject the
> timer interrupt to the guest if vstimecmp is used. This was ratified
> as a part of the Sstc extension.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h         |   4 ++
>  target/riscv/cpu_bits.h    |   4 ++
>  target/riscv/cpu_helper.c  |  11 ++--
>  target/riscv/csr.c         | 102 ++++++++++++++++++++++++++++++++++++-
>  target/riscv/machine.c     |   1 +
>  target/riscv/time_helper.c |  16 ++++++
>  6 files changed, 133 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4cda2905661e..1fd382b2717f 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -312,6 +312,8 @@ struct CPUArchState {
>      /* Sstc CSRs */
>      uint64_t stimecmp;
>
> +    uint64_t vstimecmp;
> +
>      /* physical memory protection */
>      pmp_table_t pmp_state;
>      target_ulong mseccfg;
> @@ -366,6 +368,8 @@ struct CPUArchState {
>
>      /* Fields from here on are preserved across CPU reset. */
>      QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> +    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
> +    bool vstime_irq;
>
>      hwaddr kernel_addr;
>      hwaddr fdt_addr;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index ac17cf1515c0..095dab19f512 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -257,6 +257,10 @@
>  #define CSR_VSIP            0x244
>  #define CSR_VSATP           0x280
>
> +/* Sstc virtual CSRs */
> +#define CSR_VSTIMECMP       0x24D
> +#define CSR_VSTIMECMPH      0x25D
> +
>  #define CSR_MTINST          0x34a
>  #define CSR_MTVAL2          0x34b
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 650574accf0a..1e4faa84e839 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -345,8 +345,9 @@ uint64_t riscv_cpu_all_pending(CPURISCVState *env)
>  {
>      uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
>      uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> +    uint64_t vstip = (env->vstime_irq) ? MIP_VSTIP : 0;
>
> -    return (env->mip | vsgein) & env->mie;
> +    return (env->mip | vsgein | vstip) & env->mie;
>  }
>
>  int riscv_cpu_mirq_pending(CPURISCVState *env)
> @@ -605,7 +606,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>  {
>      CPURISCVState *env = &cpu->env;
>      CPUState *cs = CPU(cpu);
> -    uint64_t gein, vsgein = 0, old = env->mip;
> +    uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
>      bool locked = false;
>
>      if (riscv_cpu_virt_enabled(env)) {
> @@ -613,6 +614,10 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>          vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
>      }
>
> +    /* No need to update mip for VSTIP */
> +    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
> +    vstip = env->vstime_irq ? MIP_VSTIP : 0;
> +
>      if (!qemu_mutex_iothread_locked()) {
>          locked = true;
>          qemu_mutex_lock_iothread();
> @@ -620,7 +625,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>
>      env->mip = (env->mip & ~mask) | (value & mask);
>
> -    if (env->mip | vsgein) {
> +    if (env->mip | vsgein | vstip) {
>          cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>      } else {
>          cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e18b000700e4..9da4d6515e7b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -829,17 +829,100 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
>      return smode(env, csrno);
>  }
>
> +static RISCVException sstc_hmode(CPURISCVState *env, int csrno)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (env->priv == PRV_M) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (!(get_field(env->mcounteren, COUNTEREN_TM) &
> +          get_field(env->menvcfg, MENVCFG_STCE))) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (riscv_cpu_virt_enabled(env)) {
> +        if (!(get_field(env->hcounteren, COUNTEREN_TM) &
> +              get_field(env->henvcfg, HENVCFG_STCE))) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
> +    }
> +
> +    return hmode(env, csrno);
> +}
> +
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
>  static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
>                                      target_ulong *val)
>  {
> -    *val = env->stimecmp;
> +    if (riscv_cpu_virt_enabled(env)) {
> +        *val = env->vstimecmp;
> +    } else {
> +        *val = env->stimecmp;
> +    }
> +
>      return RISCV_EXCP_NONE;
>  }
>
>  static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
>                                      target_ulong *val)
>  {
> -    *val = env->stimecmp >> 32;
> +    if (riscv_cpu_virt_enabled(env)) {
> +        *val = env->vstimecmp >> 32;
> +    } else {
> +        *val = env->stimecmp >> 32;
> +    }
> +
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -848,6 +931,10 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
>  {
>      RISCVCPU *cpu = env_archcpu(env);
>
> +    if (riscv_cpu_virt_enabled(env)) {
> +        return write_vstimecmp(env, csrno, val);
> +    }
> +
>      if (riscv_cpu_mxl(env) == MXL_RV32) {
>          env->stimecmp = deposit64(env->stimecmp, 0, 32, (uint64_t)val);
>      } else {
> @@ -864,6 +951,10 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
>  {
>      RISCVCPU *cpu = env_archcpu(env);
>
> +    if (riscv_cpu_virt_enabled(env)) {
> +        return write_vstimecmph(env, csrno, val);
> +    }
> +
>      env->stimecmp = deposit64(env->stimecmp, 32, 32, (uint64_t)val);
>      riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
>
> @@ -1801,6 +1892,7 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
>      if (csrno != CSR_HVIP) {
>          gin = get_field(env->hstatus, HSTATUS_VGEIN);
>          old_mip |= (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP : 0;
> +        old_mip |= env->vstime_irq ? MIP_VSTIP : 0;
>      }
>
>      if (ret_val) {
> @@ -3661,6 +3753,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                                            .min_priv_ver = PRIV_VERSION_1_12_0 },
>      [CSR_STIMECMPH] = { "stimecmph", sstc, read_stimecmph, write_stimecmph,
>                                            .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSTIMECMP] = { "vstimecmp", sstc_hmode, read_vstimecmp,
> +                                          write_vstimecmp,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSTIMECMPH] = { "vstimecmph", sstc_hmode, read_vstimecmph,
> +                                          write_vstimecmph,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>
>      /* Supervisor Protection and Translation */
>      [CSR_SATP]     = { "satp",     smode, read_satp,     write_satp     },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 622fface484e..4ba55705d147 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper = {
>          VMSTATE_UINTTL(env.hgeie, RISCVCPU),
>          VMSTATE_UINTTL(env.hgeip, RISCVCPU),
>          VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> +        VMSTATE_UINT64(env.vstimecmp, RISCVCPU),
>
>          VMSTATE_UINTTL(env.hvictl, RISCVCPU),
>          VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
> diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> index f3fb5eac7b7b..8cce667dfd47 100644
> --- a/target/riscv/time_helper.c
> +++ b/target/riscv/time_helper.c
> @@ -22,6 +22,14 @@
>  #include "time_helper.h"
>  #include "hw/intc/riscv_aclint.h"
>
> +static void riscv_vstimer_cb(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +    env->vstime_irq = 1;
> +    riscv_cpu_update_mip(cpu, MIP_VSTIP, BOOL_TO_MASK(1));
> +}
> +
>  static void riscv_stimer_cb(void *opaque)
>  {
>      RISCVCPU *cpu = opaque;
> @@ -47,10 +55,16 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
>           * If we're setting an stimecmp value in the "past",
>           * immediately raise the timer interrupt
>           */
> +        if (timer_irq == MIP_VSTIP) {
> +            env->vstime_irq = 1;
> +        }
>          riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
>          return;
>      }
>
> +    if (timer_irq == MIP_VSTIP) {
> +        env->vstime_irq = 0;
> +    }
>      /* Clear the [V]STIP bit in mip */
>      riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
>
> @@ -95,4 +109,6 @@ void riscv_timer_init(RISCVCPU *cpu)
>      env->stimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_stimer_cb, cpu);
>      env->stimecmp = 0;
>
> +    env->vstimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_vstimer_cb, cpu);
> +    env->vstimecmp = 0;
>  }
> --
> 2.25.1
>
>

