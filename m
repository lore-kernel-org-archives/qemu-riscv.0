Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npKaD-0003PN-4B
	for mharc-qemu-riscv@gnu.org; Thu, 12 May 2022 21:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1npKaB-0003O1-0C
 for qemu-riscv@nongnu.org; Thu, 12 May 2022 21:59:07 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:45942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1npKa8-0006QN-IL
 for qemu-riscv@nongnu.org; Thu, 12 May 2022 21:59:06 -0400
Received: by mail-lj1-x229.google.com with SMTP id bx33so8592299ljb.12
 for <qemu-riscv@nongnu.org>; Thu, 12 May 2022 18:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z4Z1vsHArZZkBK33TLFrs0viMjqLrAP1bbVt/YF9r5U=;
 b=COm1gNypvZbYoqFeQnGe7osYR2pIb6wlhkoeWDE9Ff5OreAujJvmoCkf0tCrAhyk4f
 BxnFeRUQaaVHZMV4S6AWh4iW8GYS1B8sCEQ2PZ4cshB3ONSWO+xBvhsV61QKGWCGVw8z
 +hSDvuL8xvEPGhct8fsZUHhL4taJ+gplc3dJsz/vH4Coq1/ddfrt//8mPLavhJn3LaXF
 owhfuJH8OXfbsLMULoHBNiYo/k60Qi7QdHZcsYUhaQcNHqwp8J9rDvFv9Aft7ar5wMK8
 U9fARWMPenB6mDzfDdaBtRREUKJmOyJ62f+bl6BavQILZs1gZDy7oNgwap3kTxKTQz88
 JmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z4Z1vsHArZZkBK33TLFrs0viMjqLrAP1bbVt/YF9r5U=;
 b=1O+AzEP4SEtKTuKXEG6BZx9c4SDBwftlFCMj3rAjpaGW1eqC8/EPgQTb0m1SKVnQbw
 3UuLHJQXilt4Y4WU7k4ZczXdEJvCCyPUym1mvzhWfjlmR+2WLzmlfeStoz4XvVr3pxsh
 UwVujsJpakLjy/QI7AXlSjWDqqkrDZDPVUPkTI9dCHsERv7UAXxaNkadPUfVs86vTGHv
 nxGmuxaZa9lPO5QZsJTFFhU39j+hpeAjAMp+G/fPZYx/QG6tlOLyJ5c43D0kpMlTA8Ex
 fWvU8xXFjDi9hb1Wu+d3j7wnKuLX3S1h1CdEFnFpc45612ioSVI+r60ItSxNj/WN+yca
 Y36A==
X-Gm-Message-State: AOAM532KBAjDpAv2cQLxKfZPaRLW8ZJEFAQZHz7n3A3ZxQ4PcMq3hM18
 /7DK6zSB91CYuyeDOlIw7PqhXemP5vF3KWB3FyAa0w==
X-Google-Smtp-Source: ABdhPJzN87kXHMRzqRyBOSctRFDXWxfUFu+L+kQeSNkEisfARDp7jUjYY3Vl4mo5huonwJs4SNC5Xx49qEySnbHbPkY=
X-Received: by 2002:a2e:9617:0:b0:250:896e:3d25 with SMTP id
 v23-20020a2e9617000000b00250896e3d25mr1670727ljh.526.1652407141787; Thu, 12
 May 2022 18:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220509212827.2057822-1-atishp@rivosinc.com>
 <20220509212827.2057822-4-atishp@rivosinc.com>
 <CAAhSdy2mcjiMFQBhmPMf4Vc5Jfmr2W_+jk0h+bswfR3ATn=DjA@mail.gmail.com>
In-Reply-To: <CAAhSdy2mcjiMFQBhmPMf4Vc5Jfmr2W_+jk0h+bswfR3ATn=DjA@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 12 May 2022 18:58:50 -0700
Message-ID: <CAHBxVyG9EPj9RNeXU-w0cBHbdZwRcwt=kJX++66UmRAzbL8pdQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] target/riscv: Add vstimecmp support
To: Anup Patel <anup@brainfault.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=atishp@rivosinc.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 13 May 2022 01:59:07 -0000

On Wed, May 11, 2022 at 9:48 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, May 10, 2022 at 3:03 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > vstimecmp CSR allows the guest OS or to program the next guest timer
> > interrupt directly. Thus, hypervisor no longer need to inject the
> > timer interrupt to the guest if vstimecmp is used. This was ratified
> > as a part of the Sstc extension.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  target/riscv/cpu.h         |   5 ++
> >  target/riscv/cpu_bits.h    |   4 ++
> >  target/riscv/cpu_helper.c  |  11 +++-
> >  target/riscv/csr.c         | 112 ++++++++++++++++++++++++++++++++++++-
> >  target/riscv/machine.c     |   1 +
> >  target/riscv/time_helper.c |  16 ++++++
> >  6 files changed, 144 insertions(+), 5 deletions(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 9a01e6d0f587..798874d6189d 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -280,6 +280,9 @@ struct CPUArchState {
> >      uint64_t stimecmp;
> >      /* For RV32 only */
> >      uint8_t stimecmp_wr_done;
>
> Add new line here.
>
> > +    uint64_t vstimecmp;
> > +    /* For RV32 only */
> > +    uint8_t vstimecmp_wr_done;
> >
> >      /* physical memory protection */
> >      pmp_table_t pmp_state;
> > @@ -335,6 +338,8 @@ struct CPUArchState {
> >
> >      /* Fields from here on are preserved across CPU reset. */
> >      QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> > +    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
> > +    bool vstime_irq;
> >
> >      hwaddr kernel_addr;
> >      hwaddr fdt_addr;
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 29d0e4a1be01..5c9f512872e1 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -272,6 +272,10 @@
> >  #define CSR_VSIP            0x244
> >  #define CSR_VSATP           0x280
> >
> > +/* Sstc virtual CSRs */
> > +#define CSR_VSTIMECMP       0x24D
> > +#define CSR_VSTIMECMPH      0x25D
> > +
> >  #define CSR_MTINST          0x34a
> >  #define CSR_MTVAL2          0x34b
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index e1aa4f2097c1..2715021c022e 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -344,8 +344,9 @@ static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
> >  {
> >      uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
> >      uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> > +    uint64_t vstip = (env->vstime_irq) ? MIP_VSTIP : 0;
> >
> > -    return (env->mip | vsgein) & env->mie;
> > +    return (env->mip | vsgein | vstip) & env->mie;
> >  }
> >
> >  int riscv_cpu_mirq_pending(CPURISCVState *env)
> > @@ -604,7 +605,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
> >  {
> >      CPURISCVState *env = &cpu->env;
> >      CPUState *cs = CPU(cpu);
> > -    uint64_t gein, vsgein = 0, old = env->mip;
> > +    uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
> >      bool locked = false;
> >
> >      if (riscv_cpu_virt_enabled(env)) {
> > @@ -612,6 +613,10 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
> >          vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> >      }
> >
> > +    /* No need to update mip for VSTIP */
> > +    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
> > +    vstip = env->vstime_irq ? MIP_VSTIP : 0;
> > +
> >      if (!qemu_mutex_iothread_locked()) {
> >          locked = true;
> >          qemu_mutex_lock_iothread();
> > @@ -619,7 +624,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
> >
> >      env->mip = (env->mip & ~mask) | (value & mask);
> >
> > -    if (env->mip | vsgein) {
> > +    if (env->mip | vsgein | vstip) {
> >          cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> >      } else {
> >          cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 8952d1308008..35eb2c4d84eb 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -567,17 +567,110 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > +static RISCVException sstc_hmode(CPURISCVState *env, int csrno)
> > +{
> > +    CPUState *cs = env_cpu(env);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > +
> > +    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    if (env->priv == PRV_M) {
> > +        return RISCV_EXCP_NONE;
> > +    }
> > +
> > +    if (!(get_field(env->mcounteren, COUNTEREN_TM) &
> > +          get_field(env->menvcfg, MENVCFG_STCE))) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    if (!(get_field(env->hcounteren, COUNTEREN_TM) &
> > +          get_field(env->henvcfg, HENVCFG_STCE))) {
> > +        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +    }
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
> > +                                    target_ulong *val)
> > +{
> > +    *val = env->vstimecmp;
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
> > +                                    target_ulong *val)
> > +{
> > +    *val = env->vstimecmp >> 32;
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
> > +                                    target_ulong val)
> > +{
> > +    RISCVCPU *cpu = env_archcpu(env);
> > +
> > +    if (riscv_cpu_mxl(env) == MXL_RV32) {
> > +        env->vstimecmp = deposit64(env->vstimecmp, 0, 32, (uint64_t)val);
> > +        env->vstimecmp_wr_done |= 0x01;
> > +        if (env->vstimecmp_wr_done != 0x03) {
> > +            return RISCV_EXCP_NONE;
> > +        } else {
> > +            env->vstimecmp_wr_done = 0;
> > +        }
> > +    } else {
> > +        env->vstimecmp = val;
> > +    }
> > +
> > +    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> > +                              env->htimedelta, MIP_VSTIP);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
> > +                                    target_ulong val)
> > +{
> > +    RISCVCPU *cpu = env_archcpu(env);
> > +
> > +    env->vstimecmp = deposit64(env->vstimecmp, 32, 32, (uint64_t)val);
> > +    env->vstimecmp_wr_done |= 0x02;
> > +    if (env->vstimecmp_wr_done != 0x03) {
> > +            return RISCV_EXCP_NONE;
> > +    }
> > +
> > +    env->vstimecmp_wr_done = 0;
> > +    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> > +                              env->htimedelta, MIP_VSTIP);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >  static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
> >                                      target_ulong *val)
> >  {
> > -    *val = env->stimecmp;
> > +    if (riscv_cpu_virt_enabled(env)) {
> > +        *val = env->vstimecmp;
> > +    } else {
> > +        *val = env->stimecmp;
> > +    }
> > +
> >      return RISCV_EXCP_NONE;
> >  }
> >
> >  static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
> >                                      target_ulong *val)
> >  {
> > -    *val = env->stimecmp >> 32;
> > +    if (riscv_cpu_virt_enabled(env)) {
> > +        *val = env->vstimecmp >> 32;
> > +    } else {
> > +        *val = env->stimecmp >> 32;
> > +    }
> > +
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > @@ -586,6 +679,10 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
> >  {
> >      RISCVCPU *cpu = env_archcpu(env);
> >
> > +    if (riscv_cpu_virt_enabled(env)) {
> > +        return write_vstimecmp(env, csrno, val);
> > +    }
> > +
> >      if (riscv_cpu_mxl(env) == MXL_RV32) {
> >          env->stimecmp = deposit64(env->stimecmp, 0, 32, (uint64_t)val);
> >          env->stimecmp_wr_done |= 0x01;
> > @@ -608,6 +705,10 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
> >  {
> >      RISCVCPU *cpu = env_archcpu(env);
> >
> > +    if (riscv_cpu_virt_enabled(env)) {
> > +        return write_vstimecmph(env, csrno, val);
> > +    }
> > +
> >      env->stimecmp = deposit64(env->stimecmp, 32, 32, (uint64_t)val);
> >      env->stimecmp_wr_done |= 0x02;
> >      if (env->stimecmp_wr_done != 0x03) {
> > @@ -1612,6 +1713,7 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
> >      if (csrno != CSR_HVIP) {
> >          gin = get_field(env->hstatus, HSTATUS_VGEIN);
> >          old_mip |= (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP : 0;
> > +        old_mip |= env->vstime_irq ? MIP_VSTIP : 0;
> >      }
> >
> >      if (ret_val) {
> > @@ -3433,6 +3535,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >                                            .min_priv_ver = PRIV_VERSION_1_12_0 },
> >      [CSR_STIMECMPH] = { "stimecmph", sstc, read_stimecmph, write_stimecmph,
> >                                            .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VSTIMECMP] = { "vstimecmp", sstc_hmode, read_vstimecmp,
> > +                                          write_vstimecmp,
> > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_VSTIMECMPH] = { "vstimecmph", sstc_hmode, read_vstimecmph,
> > +                                          write_vstimecmph,
> > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> >
> >      /* Supervisor Protection and Translation */
> >      [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index ee02bfc18916..d453b401bdfd 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper = {
> >          VMSTATE_UINTTL(env.hgeie, RISCVCPU),
> >          VMSTATE_UINTTL(env.hgeip, RISCVCPU),
> >          VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> > +        VMSTATE_UINT64(env.vstimecmp, RISCVCPU),
>
> Add vstimecmp_wr_done to vmstate_hyper.
>

ok. I will add [v]stimecmp_wr_done to corresponding vmstate.

> >
> >          VMSTATE_UINTTL(env.hvictl, RISCVCPU),
> >          VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
> > diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> > index f3fb5eac7b7b..8cce667dfd47 100644
> > --- a/target/riscv/time_helper.c
> > +++ b/target/riscv/time_helper.c
> > @@ -22,6 +22,14 @@
> >  #include "time_helper.h"
> >  #include "hw/intc/riscv_aclint.h"
> >
> > +static void riscv_vstimer_cb(void *opaque)
> > +{
> > +    RISCVCPU *cpu = opaque;
> > +    CPURISCVState *env = &cpu->env;
> > +    env->vstime_irq = 1;
> > +    riscv_cpu_update_mip(cpu, MIP_VSTIP, BOOL_TO_MASK(1));
> > +}
> > +
> >  static void riscv_stimer_cb(void *opaque)
> >  {
> >      RISCVCPU *cpu = opaque;
> > @@ -47,10 +55,16 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
> >           * If we're setting an stimecmp value in the "past",
> >           * immediately raise the timer interrupt
> >           */
> > +        if (timer_irq == MIP_VSTIP) {
> > +            env->vstime_irq = 1;
> > +        }
> >          riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
> >          return;
> >      }
> >
> > +    if (timer_irq == MIP_VSTIP) {
> > +        env->vstime_irq = 0;
> > +    }
> >      /* Clear the [V]STIP bit in mip */
> >      riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
> >
> > @@ -95,4 +109,6 @@ void riscv_timer_init(RISCVCPU *cpu)
> >      env->stimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_stimer_cb, cpu);
> >      env->stimecmp = 0;
> >
> > +    env->vstimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_vstimer_cb, cpu);
> > +    env->vstimecmp = 0;
> >  }
> > --
> > 2.25.1
> >
> >
>
> Regards,
> Anup

