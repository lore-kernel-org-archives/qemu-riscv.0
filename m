Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lO9w7-0005fD-9M
	for mharc-qemu-riscv@gnu.org; Sun, 21 Mar 2021 22:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lO9w5-0005cy-KX
 for qemu-riscv@nongnu.org; Sun, 21 Mar 2021 22:04:53 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:36681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lO9w1-0006uC-BT
 for qemu-riscv@nongnu.org; Sun, 21 Mar 2021 22:04:53 -0400
Received: by mail-oi1-x233.google.com with SMTP id c16so2623200oib.3
 for <qemu-riscv@nongnu.org>; Sun, 21 Mar 2021 19:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HCyxe9DwAhXmP5gaPnNt0hy2GkCAxtG38r7L/2LZmMk=;
 b=koMx7egI/p11xp3ALK5tapmpC1DRBUcE40J9rh8xPFx3b+AXBQi1dkXtf6XwuK+4Cj
 Vg8qUrb+HN20y6UDhS15WUFM4tUNWgASB1+katCb0wow7PCxVPLnnb1iMu6O9x+hLE1x
 tQjsX/5cV1gVzNyh6RUMmCwLzdLq4L6Wj22MGSc5xAz9T/FI+gL8+nlSPNJKRgdJWb8J
 4f1PjgWizFSKBKc+KWf5NIxDtjZlHINYv1RimfG8XK6ALf45Lfc0n+W0Am69AL1UBeIm
 PUZ+EIfsU5c5k+MEc71wRLREJKtgcxD26TRehu8u38xg2PWpyI4+nFbe/rDEtxsOuBgH
 fDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HCyxe9DwAhXmP5gaPnNt0hy2GkCAxtG38r7L/2LZmMk=;
 b=sddj55nNk5NfKu8cCLhhsmPSZIvHphVdXpnboYv1zNFZdnwGVsl59bbR2nxYpLwjMA
 eLTmP6XMXOL5DBBsA82hqi8y97A2nMT/v7mJt7apigwn8uXErpMV8IXuX5vLzryuuRHm
 roZMZscur+bhFBgT+hq5giYgjqxXEEqNBspAIbmw5SGT+krewPynzoau6jUOOEeYO7+e
 U5waxHCuoTxoI34NU37ScwFgaYoZVVFhvJmRVLINOOYNtw2BpKsY2ywKdhsfK0CeqHCI
 4NNNyKeGoLWDiHlMsbTpLgLV2Kh9Hns0TGW+vYPdEB8dydEO+By3m8GFoDXl2oUhCnpC
 UwMg==
X-Gm-Message-State: AOAM530gTY4Nyl8AiBLAEyYjsUk3U7Oe/DH/57BpADow3XZaU5vMp/4B
 MZWuZoIzxcudT3q8j9ETtPht26J2yv4yRHRJnAN5wg==
X-Google-Smtp-Source: ABdhPJx8HYbclVTN6OzwsVgVRDIVZfjnyjSihglfi3Rj1+r4wt67ZKTmIp+Syu3iFLYD6Q+mnwbTPEtP+wXpy3MPH2o=
X-Received: by 2002:aca:ef84:: with SMTP id n126mr8035380oih.78.1616378688302; 
 Sun, 21 Mar 2021 19:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210309072925.4314-1-frank.chang@sifive.com>
 <20210309072925.4314-2-frank.chang@sifive.com>
 <CAKmqyKPJhaj1gyg5DpZU60u8qL_YzE9LTB5zZ_LPuJUg=owXOA@mail.gmail.com>
In-Reply-To: <CAKmqyKPJhaj1gyg5DpZU60u8qL_YzE9LTB5zZ_LPuJUg=owXOA@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 22 Mar 2021 10:04:37 +0800
Message-ID: <CAE_xrPgh9tN66JW=uXKvj2scBsijb0bBB7DOmwojv8hLNFL1NA@mail.gmail.com>
Subject: Re: [RFC 1/1] target/riscv: add support of RNMI
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Keith Packard <keithp@keithp.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="0000000000008a05f105be167db2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=frank.chang@sifive.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Mar 2021 02:04:53 -0000

--0000000000008a05f105be167db2
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 19, 2021 at 9:29 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Tue, Mar 9, 2021 at 2:30 AM <frank.chang@sifive.com> wrote:
> >
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
>
> I had a quick look and this looks fine. I haven't compared it to the
> spec yet though.
>
> When you send the patch series do you mind splitting it up a bit more?
> It just makes it easier to review.
>
> Alistair
>

Sure, will do that.

Thanks,
Frank Chang


>
> > ---
> >  target/riscv/cpu.c                            | 40 +++++++++++++
> >  target/riscv/cpu.h                            | 16 ++++-
> >  target/riscv/cpu_bits.h                       | 19 ++++++
> >  target/riscv/cpu_helper.c                     | 47 +++++++++++++--
> >  target/riscv/csr.c                            | 59 +++++++++++++++++++
> >  target/riscv/helper.h                         |  1 +
> >  target/riscv/insn32.decode                    |  3 +
> >  .../riscv/insn_trans/trans_privileged.c.inc   | 13 ++++
> >  target/riscv/op_helper.c                      | 31 ++++++++++
> >  9 files changed, 224 insertions(+), 5 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index ddea8fbeeb3..07ea2105200 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -137,6 +137,14 @@ static void set_feature(CPURISCVState *env, int
> feature)
> >      env->features |= (1ULL << feature);
> >  }
> >
> > +static void set_rnmi_vectors(CPURISCVState *env, int irqvec, int
> excpvec)
> > +{
> > +#ifndef CONFIG_USER_ONLY
> > +    env->rnmi_irqvec = irqvec;
> > +    env->rnmi_excpvec = excpvec;
> > +#endif
> > +}
> > +
> >  static void set_resetvec(CPURISCVState *env, int resetvec)
> >  {
> >  #ifndef CONFIG_USER_ONLY
> > @@ -372,6 +380,23 @@ static void riscv_cpu_disas_set_info(CPUState *s,
> disassemble_info *info)
> >      }
> >  }
> >
> > +#ifndef CONFIG_USER_ONLY
> > +static void riscv_cpu_set_rnmi(void *opaque, int irq, int level)
> > +{
> > +    RISCVCPU *cpu = opaque;
> > +    CPURISCVState *env = &cpu->env;
> > +    CPUState *cs = CPU(cpu);
> > +
> > +    if (level) {
> > +        env->nmip |= 1 << irq;
> > +        cpu_interrupt(cs, CPU_INTERRUPT_RNMI);
> > +    } else {
> > +        env->nmip &= ~(1 << irq);
> > +        cpu_reset_interrupt(cs, CPU_INTERRUPT_RNMI);
> > +    }
> > +}
> > +#endif
> > +
> >  static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >  {
> >      CPUState *cs = CPU(dev);
> > @@ -415,6 +440,16 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
> >
> >      set_resetvec(env, cpu->cfg.resetvec);
> >
> > +    if (cpu->cfg.rnmi) {
> > +        set_feature(env, RISCV_FEATURE_RNMI);
> > +        set_rnmi_vectors(env, cpu->cfg.rnmi_irqvec,
> cpu->cfg.rnmi_excpvec);
> > +#ifndef CONFIG_USER_ONLY
> > +        env->nmie = true;
> > +        qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_rnmi,
> > +                                "rnmi", TARGET_LONG_BITS);
> > +#endif
> > +    }
> > +
> >      /* If only XLEN is set for misa, then set misa from properties */
> >      if (env->misa == RV32 || env->misa == RV64) {
> >          /* Do some ISA extension error checking */
> > @@ -554,6 +589,11 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> >      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> >      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec,
> DEFAULT_RSTVEC),
> > +    DEFINE_PROP_BOOL("rnmi", RISCVCPU, cfg.rnmi, false),
> > +    DEFINE_PROP_UINT64("rnmi_irqvec", RISCVCPU, cfg.rnmi_irqvec,
> > +                       DEFAULT_RNMI_IRQVEC),
> > +    DEFINE_PROP_UINT64("rnmi_excpvec", RISCVCPU, cfg.rnmi_excpvec,
> > +                       DEFAULT_RNMI_EXCPVEC),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 0edb2826a27..b9aa403dfec 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -80,7 +80,8 @@
> >  enum {
> >      RISCV_FEATURE_MMU,
> >      RISCV_FEATURE_PMP,
> > -    RISCV_FEATURE_MISA
> > +    RISCV_FEATURE_MISA,
> > +    RISCV_FEATURE_RNMI,
> >  };
> >
> >  #define PRIV_VERSION_1_10_0 0x00011000
> > @@ -178,6 +179,16 @@ struct CPURISCVState {
> >      target_ulong mcause;
> >      target_ulong mtval;  /* since: priv-1.10.0 */
> >
> > +    /* NMI */
> > +    target_ulong mnscratch;
> > +    target_ulong mnepc;
> > +    target_ulong mncause; /* mncause without bit XLEN-1 set to 1 */
> > +    target_ulong mnstatus;
> > +    bool nmie;
> > +    target_ulong nmip;
> > +    target_ulong rnmi_irqvec;
> > +    target_ulong rnmi_excpvec;
> > +
> >      /* Hypervisor CSRs */
> >      target_ulong hstatus;
> >      target_ulong hedeleg;
> > @@ -300,6 +311,9 @@ struct RISCVCPU {
> >          bool mmu;
> >          bool pmp;
> >          uint64_t resetvec;
> > +        bool rnmi;
> > +        uint64_t rnmi_irqvec;
> > +        uint64_t rnmi_excpvec;
> >      } cfg;
> >  };
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index caf45992070..94ab76c66b8 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -166,6 +166,12 @@
> >  #define CSR_MTVAL           0x343
> >  #define CSR_MIP             0x344
> >
> > +/* NMI */
> > +#define CSR_MNSCRATCH       0x350
> > +#define CSR_MNEPC           0x351
> > +#define CSR_MNCAUSE         0x352
> > +#define CSR_MNSTATUS        0x353
> > +
> >  /* Legacy Machine Trap Handling (priv v1.9.1) */
> >  #define CSR_MBADADDR        0x343
> >
> > @@ -526,6 +532,12 @@
> >  /* Default Reset Vector adress */
> >  #define DEFAULT_RSTVEC      0x1000
> >
> > +/* Default RNMI Interrupt Vector address */
> > +#define DEFAULT_RNMI_IRQVEC     0x1000
> > +
> > +/* Default RNMI Exception Vector address */
> > +#define DEFAULT_RNMI_EXCPVEC    0x1000
> > +
> >  /* Exception causes */
> >  #define EXCP_NONE                                -1 /* sentinel value */
> >  #define RISCV_EXCP_INST_ADDR_MIS                 0x0
> > @@ -552,6 +564,9 @@
> >  #define RISCV_EXCP_INT_FLAG                0x80000000
> >  #define RISCV_EXCP_INT_MASK                0x7fffffff
> >
> > +/* RNMI mnstatus CSR mask */
> > +#define MNSTATUS_MPP                       MSTATUS_MPP
> > +
> >  /* Interrupt causes */
> >  #define IRQ_U_SOFT                         0
> >  #define IRQ_S_SOFT                         1
> > @@ -592,4 +607,8 @@
> >  #define MIE_UTIE                           (1 << IRQ_U_TIMER)
> >  #define MIE_SSIE                           (1 << IRQ_S_SOFT)
> >  #define MIE_USIE                           (1 << IRQ_U_SOFT)
> > +
> > +/* RISC-V-specific interrupt pending bits */
> > +#define CPU_INTERRUPT_RNMI                 CPU_INTERRUPT_TGT_EXT_0
> > +
> >  #endif
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 2f43939fb6d..f331c4b7032 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -38,6 +38,19 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool
> ifetch)
> >  #ifndef CONFIG_USER_ONLY
> >  static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> >  {
> > +    if (riscv_feature(env, RISCV_FEATURE_RNMI)) {
> > +        /* Priority: RNMI > Other interrupt. */
> > +        if (env->nmip && env->nmie) {
> > +            return ctz64(env->nmip); /* since non-zero */
> > +        } else if (!env->nmie) {
> > +            /*
> > +             * We are already in RNMI handler,
> > +             * other interrupts cannot preempt.
> > +             */
> > +            return EXCP_NONE;
> > +        }
> > +    }
> > +
> >      target_ulong irqs;
> >
> >      target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
> > @@ -80,7 +93,8 @@ static int riscv_cpu_local_irq_pending(CPURISCVState
> *env)
> >  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> >  {
> >  #if !defined(CONFIG_USER_ONLY)
> > -    if (interrupt_request & CPU_INTERRUPT_HARD) {
> > +    if (interrupt_request &
> > +            (CPU_INTERRUPT_HARD | CPU_INTERRUPT_RNMI)) {
> >          RISCVCPU *cpu = RISCV_CPU(cs);
> >          CPURISCVState *env = &cpu->env;
> >          int interruptno = riscv_cpu_local_irq_pending(env);
> > @@ -847,6 +861,23 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >      target_ulong tval = 0;
> >      target_ulong htval = 0;
> >      target_ulong mtval2 = 0;
> > +    target_ulong nextpc;
> > +    bool nmi_execp = false;
> > +
> > +    if (riscv_feature(env, RISCV_FEATURE_RNMI)) {
> > +        nmi_execp = !env->nmie && !async;
> > +
> > +        if (env->nmip && async) {
> > +            env->nmie = false;
> > +            env->mnstatus = set_field(env->mnstatus, MSTATUS_MPP,
> > +                                      env->priv);
> > +            env->mncause = cause;
> > +            env->mnepc = env->pc;
> > +            env->pc = env->rnmi_irqvec;
> > +            riscv_cpu_set_mode(env, PRV_M);
> > +            goto handled;
> > +        }
> > +    }
> >
> >      if  (cause == RISCV_EXCP_SEMIHOST) {
> >          if (env->priv >= PRV_S) {
> > @@ -905,7 +936,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >                    __func__, env->mhartid, async, cause, env->pc, tval,
> >                    riscv_cpu_get_trap_name(cause, async));
> >
> > -    if (env->priv <= PRV_S &&
> > +    if (env->priv <= PRV_S && !nmi_execp &&
> >              cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
> >          /* handle the trap in S-mode */
> >          if (riscv_has_ext(env, RVH)) {
> > @@ -1005,8 +1036,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >          env->mepc = env->pc;
> >          env->mbadaddr = tval;
> >          env->mtval2 = mtval2;
> > -        env->pc = (env->mtvec >> 2 << 2) +
> > -            ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
> > +
> > +        if (nmi_execp) {
> > +            nextpc = env->rnmi_excpvec;
> > +        } else {
> > +            nextpc = (env->mtvec >> 2 << 2) +
> > +                ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
> > +        }
> > +        env->pc = nextpc;
> > +
> >          riscv_cpu_set_mode(env, PRV_M);
> >      }
> >
> > @@ -1016,6 +1054,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >       * RISC-V ISA Specification.
> >       */
> >
> > +handled:
> >  #endif
> >      cs->exception_index = EXCP_NONE; /* mark handled to qemu */
> >  }
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index fd2e6363f39..f67c50327ec 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -188,6 +188,11 @@ static int pmp(CPURISCVState *env, int csrno)
> >  {
> >      return -!riscv_feature(env, RISCV_FEATURE_PMP);
> >  }
> > +
> > +static int nmi(CPURISCVState *env, int csrno)
> > +{
> > +    return -!riscv_feature(env, RISCV_FEATURE_RNMI);
> > +}
> >  #endif
> >
> >  /* User Floating-Point CSRs */
> > @@ -712,6 +717,54 @@ static int write_mbadaddr(CPURISCVState *env, int
> csrno, target_ulong val)
> >      return 0;
> >  }
> >
> > +static int read_mnscratch(CPURISCVState *env, int csrno, target_ulong
> *val)
> > +{
> > +    *val = env->mnscratch;
> > +    return 0;
> > +}
> > +
> > +static int write_mnscratch(CPURISCVState *env, int csrno, target_ulong
> val)
> > +{
> > +    env->mnscratch = val;
> > +    return 0;
> > +}
> > +
> > +static int read_mnepc(CPURISCVState *env, int csrno, target_ulong *val)
> > +{
> > +    *val = env->mnepc;
> > +    return 0;
> > +}
> > +
> > +static int write_mnepc(CPURISCVState *env, int csrno, target_ulong val)
> > +{
> > +    env->mnepc = val;
> > +    return 0;
> > +}
> > +
> > +static int read_mncause(CPURISCVState *env, int csrno, target_ulong
> *val)
> > +{
> > +    *val = env->mncause;
> > +    return 0;
> > +}
> > +
> > +static int write_mncause(CPURISCVState *env, int csrno, target_ulong
> val)
> > +{
> > +    env->mncause = val;
> > +    return 0;
> > +}
> > +
> > +static int read_mnstatus(CPURISCVState *env, int csrno, target_ulong
> *val)
> > +{
> > +    *val = env->mnstatus;
> > +    return 0;
> > +}
> > +
> > +static int write_mnstatus(CPURISCVState *env, int csrno, target_ulong
> val)
> > +{
> > +    env->mnstatus = val & MNSTATUS_MPP;
> > +    return 0;
> > +}
> > +
> >  static int rmw_mip(CPURISCVState *env, int csrno, target_ulong
> *ret_value,
> >                     target_ulong new_value, target_ulong write_mask)
> >  {
> > @@ -1427,6 +1480,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      [CSR_MBADADDR] = { "mbadaddr", any,  read_mbadaddr, write_mbadaddr
> },
> >      [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip
> },
> >
> > +    /* NMI */
> > +    [CSR_MNSCRATCH] = { "mnscratch", nmi, read_mnscratch,
> write_mnscratch },
> > +    [CSR_MNEPC]     = { "mnepc",     nmi, read_mnepc,     write_mnepc
>    },
> > +    [CSR_MNCAUSE]   = { "mncause",   nmi, read_mncause,
>  write_mncause   },
> > +    [CSR_MNSTATUS]  = { "mnstatus",  nmi, read_mnstatus,
> write_mnstatus  },
> > +
> >      /* Supervisor Trap Setup */
> >      [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,
> write_sstatus    },
> >      [CSR_SIE]        = { "sie",        smode, read_sie,
> write_sie        },
> > diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> > index e3f3f41e891..0914d777d6d 100644
> > --- a/target/riscv/helper.h
> > +++ b/target/riscv/helper.h
> > @@ -65,6 +65,7 @@ DEF_HELPER_4(csrrc, tl, env, tl, tl, tl)
> >  #ifndef CONFIG_USER_ONLY
> >  DEF_HELPER_2(sret, tl, env, tl)
> >  DEF_HELPER_2(mret, tl, env, tl)
> > +DEF_HELPER_2(mnret, tl, env, tl)
> >  DEF_HELPER_1(wfi, void, env)
> >  DEF_HELPER_1(tlb_flush, void, env)
> >  #endif
> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > index 84080dd18ca..557f3394276 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -97,6 +97,9 @@ wfi         0001000    00101 00000 000 00000 1110011
> >  sfence_vma  0001001    ..... ..... 000 00000 1110011 @sfence_vma
> >  sfence_vm   0001000    00100 ..... 000 00000 1110011 @sfence_vm
> >
> > +# *** NMI ***
> > +mnret       0111000    00010 00000 000 00000 1110011
> > +
> >  # *** RV32I Base Instruction Set ***
> >  lui      ....................       ..... 0110111 @u
> >  auipc    ....................       ..... 0010111 @u
> > diff --git a/target/riscv/insn_trans/trans_privileged.c.inc
> b/target/riscv/insn_trans/trans_privileged.c.inc
> > index 32312be2024..63c49dfe6fb 100644
> > --- a/target/riscv/insn_trans/trans_privileged.c.inc
> > +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> > @@ -106,6 +106,19 @@ static bool trans_mret(DisasContext *ctx, arg_mret
> *a)
> >  #endif
> >  }
> >
> > +static bool trans_mnret(DisasContext *ctx, arg_mnret *a)
> > +{
> > +#ifndef CONFIG_USER_ONLY
> > +    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
> > +    gen_helper_mnret(cpu_pc, cpu_env, cpu_pc);
> > +    exit_tb(ctx); /* no chaining */
> > +    ctx->base.is_jmp = DISAS_NORETURN;
> > +    return true;
> > +#else
> > +    return false;
> > +#endif
> > +}
> > +
> >  static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
> >  {
> >  #ifndef CONFIG_USER_ONLY
> > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> > index 1eddcb94de7..b9601776153 100644
> > --- a/target/riscv/op_helper.c
> > +++ b/target/riscv/op_helper.c
> > @@ -175,6 +175,37 @@ target_ulong helper_mret(CPURISCVState *env,
> target_ulong cpu_pc_deb)
> >      return retpc;
> >  }
> >
> > +target_ulong helper_mnret(CPURISCVState *env, target_ulong cpu_pc_deb)
> > +{
> > +    if (!riscv_feature(env, RISCV_FEATURE_RNMI)) {
> > +        /* RNMI feature is not presented. */
> > +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> > +    }
> > +
> > +    if (!(env->priv >= PRV_M)) {
> > +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> > +    }
> > +
> > +    /* Get return PC from mnepc CSR. */
> > +    target_ulong retpc = env->mnepc;
> > +    if (!riscv_has_ext(env, RVC) && (retpc & 0x3)) {
> > +        riscv_raise_exception(env, RISCV_EXCP_INST_ADDR_MIS, GETPC());
> > +    }
> > +
> > +    /* Get previous privilege level from mnstatus CSR. */
> > +    target_ulong prev_priv = get_field(env->mnstatus, MNSTATUS_MPP);
> > +
> > +    if (!pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
> > +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> > +    }
> > +
> > +    riscv_cpu_set_mode(env, prev_priv);
> > +
> > +    env->nmie = true;
> > +
> > +    return retpc;
> > +}
> > +
> >  void helper_wfi(CPURISCVState *env)
> >  {
> >      CPUState *cs = env_cpu(env);
> > --
> > 2.17.1
> >
> >
>

--0000000000008a05f105be167db2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Mar 19, 2021 at 9:29 PM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Tue, Mar 9, 2021 at 2:30 AM &lt;<a href=3D"mailt=
o:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; =
wrote:<br>
&gt;<br>
&gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=
=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.co=
m" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
<br>
I had a quick look and this looks fine. I haven&#39;t compared it to the<br=
>
spec yet though.<br>
<br>
When you send the patch series do you mind splitting it up a bit more?<br>
It just makes it easier to review.<br>
<br>
Alistair<br></blockquote><div><br></div><div>Sure, will do that.</div><div>=
<br></div><div>Thanks,</div><div>Frank Chang</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 40 +++++++++++++<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 ++++-<br>
&gt;=C2=A0 target/riscv/cpu_bits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 ++++++<br>
&gt;=C2=A0 target/riscv/cpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 47 +++++++++++++--<br>
&gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 59 +++++++++++++++++=
++<br>
&gt;=C2=A0 target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
&gt;=C2=A0 .../riscv/insn_trans/trans_privileged.c.inc=C2=A0 =C2=A0| 13 +++=
+<br>
&gt;=C2=A0 target/riscv/op_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 31 ++++++++++<br>
&gt;=C2=A0 9 files changed, 224 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index ddea8fbeeb3..07ea2105200 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -137,6 +137,14 @@ static void set_feature(CPURISCVState *env, int f=
eature)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;features |=3D (1ULL &lt;&lt; feature);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static void set_rnmi_vectors(CPURISCVState *env, int irqvec, int excp=
vec)<br>
&gt; +{<br>
&gt; +#ifndef CONFIG_USER_ONLY<br>
&gt; +=C2=A0 =C2=A0 env-&gt;rnmi_irqvec =3D irqvec;<br>
&gt; +=C2=A0 =C2=A0 env-&gt;rnmi_excpvec =3D excpvec;<br>
&gt; +#endif<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static void set_resetvec(CPURISCVState *env, int resetvec)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt; @@ -372,6 +380,23 @@ static void riscv_cpu_disas_set_info(CPUState *s,=
 disassemble_info *info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +#ifndef CONFIG_USER_ONLY<br>
&gt; +static void riscv_cpu_set_rnmi(void *opaque, int irq, int level)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt; +=C2=A0 =C2=A0 CPUState *cs =3D CPU(cpu);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (level) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;nmip |=3D 1 &lt;&lt; irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_interrupt(cs, CPU_INTERRUPT_RNMI);<br=
>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;nmip &amp;=3D ~(1 &lt;&lt; irq);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_reset_interrupt(cs, CPU_INTERRUPT_RNM=
I);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +#endif<br>
&gt; +<br>
&gt;=C2=A0 static void riscv_cpu_realize(DeviceState *dev, Error **errp)<br=
>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D CPU(dev);<br>
&gt; @@ -415,6 +440,16 @@ static void riscv_cpu_realize(DeviceState *dev, E=
rror **errp)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_resetvec(env, cpu-&gt;cfg.resetvec);<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 if (cpu-&gt;cfg.rnmi) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_feature(env, RISCV_FEATURE_RNMI);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_rnmi_vectors(env, cpu-&gt;cfg.rnmi_ir=
qvec, cpu-&gt;cfg.rnmi_excpvec);<br>
&gt; +#ifndef CONFIG_USER_ONLY<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;nmie =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_init_gpio_in_named(DEVICE(cpu), risc=
v_cpu_set_rnmi,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rnmi&quot;, TARGET_LONG_BI=
TS);<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* If only XLEN is set for misa, then set misa fro=
m properties */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (env-&gt;misa =3D=3D RV32 || env-&gt;misa =3D=
=3D RV64) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Do some ISA extension error check=
ing */<br>
&gt; @@ -554,6 +589,11 @@ static Property riscv_cpu_properties[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;mmu&quot;, RISCVCPU, cfg.mm=
u, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;pmp&quot;, RISCVCPU, cfg.pm=
p, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;resetvec&quot;, RISCVCPU,=
 cfg.resetvec, DEFAULT_RSTVEC),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;rnmi&quot;, RISCVCPU, cfg.rnmi, =
false),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;rnmi_irqvec&quot;, RISCVCPU, c=
fg.rnmi_irqvec,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DEFAULT_RNMI_IRQVEC),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;rnmi_excpvec&quot;, RISCVCPU, =
cfg.rnmi_excpvec,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DEFAULT_RNMI_EXCPVEC),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 0edb2826a27..b9aa403dfec 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -80,7 +80,8 @@<br>
&gt;=C2=A0 enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RISCV_FEATURE_MMU,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RISCV_FEATURE_PMP,<br>
&gt; -=C2=A0 =C2=A0 RISCV_FEATURE_MISA<br>
&gt; +=C2=A0 =C2=A0 RISCV_FEATURE_MISA,<br>
&gt; +=C2=A0 =C2=A0 RISCV_FEATURE_RNMI,<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 #define PRIV_VERSION_1_10_0 0x00011000<br>
&gt; @@ -178,6 +179,16 @@ struct CPURISCVState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mcause;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mtval;=C2=A0 /* since: priv-1.10.0 */=
<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 /* NMI */<br>
&gt; +=C2=A0 =C2=A0 target_ulong mnscratch;<br>
&gt; +=C2=A0 =C2=A0 target_ulong mnepc;<br>
&gt; +=C2=A0 =C2=A0 target_ulong mncause; /* mncause without bit XLEN-1 set=
 to 1 */<br>
&gt; +=C2=A0 =C2=A0 target_ulong mnstatus;<br>
&gt; +=C2=A0 =C2=A0 bool nmie;<br>
&gt; +=C2=A0 =C2=A0 target_ulong nmip;<br>
&gt; +=C2=A0 =C2=A0 target_ulong rnmi_irqvec;<br>
&gt; +=C2=A0 =C2=A0 target_ulong rnmi_excpvec;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Hypervisor CSRs */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong hstatus;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong hedeleg;<br>
&gt; @@ -300,6 +311,9 @@ struct RISCVCPU {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool mmu;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool pmp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t resetvec;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool rnmi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t rnmi_irqvec;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t rnmi_excpvec;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } cfg;<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
&gt; index caf45992070..94ab76c66b8 100644<br>
&gt; --- a/target/riscv/cpu_bits.h<br>
&gt; +++ b/target/riscv/cpu_bits.h<br>
&gt; @@ -166,6 +166,12 @@<br>
&gt;=C2=A0 #define CSR_MTVAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x343<=
br>
&gt;=C2=A0 #define CSR_MIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00=
x344<br>
&gt;<br>
&gt; +/* NMI */<br>
&gt; +#define CSR_MNSCRATCH=C2=A0 =C2=A0 =C2=A0 =C2=A00x350<br>
&gt; +#define CSR_MNEPC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x351<br>
&gt; +#define CSR_MNCAUSE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x352<br>
&gt; +#define CSR_MNSTATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x353<br>
&gt; +<br>
&gt;=C2=A0 /* Legacy Machine Trap Handling (priv v1.9.1) */<br>
&gt;=C2=A0 #define CSR_MBADADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x343<br>
&gt;<br>
&gt; @@ -526,6 +532,12 @@<br>
&gt;=C2=A0 /* Default Reset Vector adress */<br>
&gt;=C2=A0 #define DEFAULT_RSTVEC=C2=A0 =C2=A0 =C2=A0 0x1000<br>
&gt;<br>
&gt; +/* Default RNMI Interrupt Vector address */<br>
&gt; +#define DEFAULT_RNMI_IRQVEC=C2=A0 =C2=A0 =C2=A00x1000<br>
&gt; +<br>
&gt; +/* Default RNMI Exception Vector address */<br>
&gt; +#define DEFAULT_RNMI_EXCPVEC=C2=A0 =C2=A0 0x1000<br>
&gt; +<br>
&gt;=C2=A0 /* Exception causes */<br>
&gt;=C2=A0 #define EXCP_NONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -1 /* se=
ntinel value */<br>
&gt;=C2=A0 #define RISCV_EXCP_INST_ADDR_MIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0<br>
&gt; @@ -552,6 +564,9 @@<br>
&gt;=C2=A0 #define RISCV_EXCP_INT_FLAG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x80000000<br>
&gt;=C2=A0 #define RISCV_EXCP_INT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x7fffffff<br>
&gt;<br>
&gt; +/* RNMI mnstatus CSR mask */<br>
&gt; +#define MNSTATUS_MPP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MSTATUS_MPP<br>
&gt; +<br>
&gt;=C2=A0 /* Interrupt causes */<br>
&gt;=C2=A0 #define IRQ_U_SOFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt;=C2=A0 #define IRQ_S_SOFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
&gt; @@ -592,4 +607,8 @@<br>
&gt;=C2=A0 #define MIE_UTIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_U_TIMER)<b=
r>
&gt;=C2=A0 #define MIE_SSIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_S_SOFT)<br=
>
&gt;=C2=A0 #define MIE_USIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_U_SOFT)<br=
>
&gt; +<br>
&gt; +/* RISC-V-specific interrupt pending bits */<br>
&gt; +#define CPU_INTERRUPT_RNMI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0CPU_INTERRUPT_TGT_EXT_0<br>
&gt; +<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
&gt; index 2f43939fb6d..f331c4b7032 100644<br>
&gt; --- a/target/riscv/cpu_helper.c<br>
&gt; +++ b/target/riscv/cpu_helper.c<br>
&gt; @@ -38,6 +38,19 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool if=
etch)<br>
&gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt;=C2=A0 static int riscv_cpu_local_irq_pending(CPURISCVState *env)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 if (riscv_feature(env, RISCV_FEATURE_RNMI)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Priority: RNMI &gt; Other interrupt. *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;nmip &amp;&amp; env-&gt;nmie)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ctz64(env-&gt;nmip);=
 /* since non-zero */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!env-&gt;nmie) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We are already in R=
NMI handler,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* other interrupts ca=
nnot preempt.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return EXCP_NONE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong irqs;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mstatus_mie =3D get_field(env-&gt;mst=
atus, MSTATUS_MIE);<br>
&gt; @@ -80,7 +93,8 @@ static int riscv_cpu_local_irq_pending(CPURISCVState=
 *env)<br>
&gt;=C2=A0 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_reques=
t)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 #if !defined(CONFIG_USER_ONLY)<br>
&gt; -=C2=A0 =C2=A0 if (interrupt_request &amp; CPU_INTERRUPT_HARD) {<br>
&gt; +=C2=A0 =C2=A0 if (interrupt_request &amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (CPU_INTERRUPT_HARD | CPU_I=
NTERRUPT_RNMI)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;=
env;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int interruptno =3D riscv_cpu_local_=
irq_pending(env);<br>
&gt; @@ -847,6 +861,23 @@ void riscv_cpu_do_interrupt(CPUState *cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong tval =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong htval =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mtval2 =3D 0;<br>
&gt; +=C2=A0 =C2=A0 target_ulong nextpc;<br>
&gt; +=C2=A0 =C2=A0 bool nmi_execp =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (riscv_feature(env, RISCV_FEATURE_RNMI)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 nmi_execp =3D !env-&gt;nmie &amp;&amp; !a=
sync;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;nmip &amp;&amp; async) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;nmie =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mnstatus =3D set_fi=
eld(env-&gt;mnstatus, MSTATUS_MPP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pri=
v);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mncause =3D cause;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mnepc =3D env-&gt;p=
c;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pc =3D env-&gt;rnmi=
_irqvec;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_mode(env, PRV=
_M);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto handled;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if=C2=A0 (cause =3D=3D RISCV_EXCP_SEMIHOST) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv &gt;=3D PRV_S) {<br=
>
&gt; @@ -905,7 +936,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _=
_func__, env-&gt;mhartid, async, cause, env-&gt;pc, tval,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
iscv_cpu_get_trap_name(cause, async));<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 if (env-&gt;priv &lt;=3D PRV_S &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 if (env-&gt;priv &lt;=3D PRV_S &amp;&amp; !nmi_execp &a=
mp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cause &lt; TARGET_LONG=
_BITS &amp;&amp; ((deleg &gt;&gt; cause) &amp; 1)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* handle the trap in S-mode */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_has_ext(env, RVH)) {<br>
&gt; @@ -1005,8 +1036,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mepc =3D env-&gt;pc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mbadaddr =3D tval;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mtval2 =3D mtval2;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pc =3D (env-&gt;mtvec &gt;&gt; 2 =
&lt;&lt; 2) +<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((async &amp;&amp; (env-&gt=
;mtvec &amp; 3) =3D=3D 1) ? cause * 4 : 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nmi_execp) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nextpc =3D env-&gt;rnmi_exc=
pvec;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nextpc =3D (env-&gt;mtvec &=
gt;&gt; 2 &lt;&lt; 2) +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((async &amp;=
&amp; (env-&gt;mtvec &amp; 3) =3D=3D 1) ? cause * 4 : 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pc =3D nextpc;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_mode(env, PRV_M);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; @@ -1016,6 +1054,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* RISC-V ISA Specification.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;<br>
&gt; +handled:<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cs-&gt;exception_index =3D EXCP_NONE; /* mark hand=
led to qemu */<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt; index fd2e6363f39..f67c50327ec 100644<br>
&gt; --- a/target/riscv/csr.c<br>
&gt; +++ b/target/riscv/csr.c<br>
&gt; @@ -188,6 +188,11 @@ static int pmp(CPURISCVState *env, int csrno)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return -!riscv_feature(env, RISCV_FEATURE_PMP);<br=
>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +static int nmi(CPURISCVState *env, int csrno)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return -!riscv_feature(env, RISCV_FEATURE_RNMI);<br>
&gt; +}<br>
&gt;=C2=A0 #endif<br>
&gt;<br>
&gt;=C2=A0 /* User Floating-Point CSRs */<br>
&gt; @@ -712,6 +717,54 @@ static int write_mbadaddr(CPURISCVState *env, int=
 csrno, target_ulong val)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static int read_mnscratch(CPURISCVState *env, int csrno, target_ulong=
 *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;mnscratch;<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int write_mnscratch(CPURISCVState *env, int csrno, target_ulon=
g val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 env-&gt;mnscratch =3D val;<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int read_mnepc(CPURISCVState *env, int csrno, target_ulong *va=
l)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;mnepc;<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int write_mnepc(CPURISCVState *env, int csrno, target_ulong va=
l)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 env-&gt;mnepc =3D val;<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int read_mncause(CPURISCVState *env, int csrno, target_ulong *=
val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;mncause;<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int write_mncause(CPURISCVState *env, int csrno, target_ulong =
val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 env-&gt;mncause =3D val;<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int read_mnstatus(CPURISCVState *env, int csrno, target_ulong =
*val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;mnstatus;<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int write_mnstatus(CPURISCVState *env, int csrno, target_ulong=
 val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 env-&gt;mnstatus =3D val &amp; MNSTATUS_MPP;<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *=
ret_value,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0target_ulong new_value, target_ulong write_mask)<br>
&gt;=C2=A0 {<br>
&gt; @@ -1427,6 +1480,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [CSR_MBADADDR] =3D { &quot;mbadaddr&quot;, any,=C2=
=A0 read_mbadaddr, write_mbadaddr },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [CSR_MIP]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;mip&quot=
;,=C2=A0 =C2=A0 =C2=A0 any,=C2=A0 NULL,=C2=A0 =C2=A0 NULL, rmw_mip=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 },<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 /* NMI */<br>
&gt; +=C2=A0 =C2=A0 [CSR_MNSCRATCH] =3D { &quot;mnscratch&quot;, nmi, read_=
mnscratch, write_mnscratch },<br>
&gt; +=C2=A0 =C2=A0 [CSR_MNEPC]=C2=A0 =C2=A0 =C2=A0=3D { &quot;mnepc&quot;,=
=C2=A0 =C2=A0 =C2=A0nmi, read_mnepc,=C2=A0 =C2=A0 =C2=A0write_mnepc=C2=A0 =
=C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MNCAUSE]=C2=A0 =C2=A0=3D { &quot;mncause&quot;,=C2=
=A0 =C2=A0nmi, read_mncause,=C2=A0 =C2=A0write_mncause=C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MNSTATUS]=C2=A0 =3D { &quot;mnstatus&quot;,=C2=A0 =
nmi, read_mnstatus,=C2=A0 write_mnstatus=C2=A0 },<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Supervisor Trap Setup */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [CSR_SSTATUS]=C2=A0 =C2=A0 =3D { &quot;sstatus&quo=
t;,=C2=A0 =C2=A0 smode, read_sstatus,=C2=A0 =C2=A0 write_sstatus=C2=A0 =C2=
=A0 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [CSR_SIE]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D { &quot;s=
ie&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 smode, read_sie,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 write_sie=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; diff --git a/target/riscv/helper.h b/target/riscv/helper.h<br>
&gt; index e3f3f41e891..0914d777d6d 100644<br>
&gt; --- a/target/riscv/helper.h<br>
&gt; +++ b/target/riscv/helper.h<br>
&gt; @@ -65,6 +65,7 @@ DEF_HELPER_4(csrrc, tl, env, tl, tl, tl)<br>
&gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt;=C2=A0 DEF_HELPER_2(sret, tl, env, tl)<br>
&gt;=C2=A0 DEF_HELPER_2(mret, tl, env, tl)<br>
&gt; +DEF_HELPER_2(mnret, tl, env, tl)<br>
&gt;=C2=A0 DEF_HELPER_1(wfi, void, env)<br>
&gt;=C2=A0 DEF_HELPER_1(tlb_flush, void, env)<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode<b=
r>
&gt; index 84080dd18ca..557f3394276 100644<br>
&gt; --- a/target/riscv/insn32.decode<br>
&gt; +++ b/target/riscv/insn32.decode<br>
&gt; @@ -97,6 +97,9 @@ wfi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00001000=C2=A0 =
=C2=A0 00101 00000 000 00000 1110011<br>
&gt;=C2=A0 sfence_vma=C2=A0 0001001=C2=A0 =C2=A0 ..... ..... 000 00000 1110=
011 @sfence_vma<br>
&gt;=C2=A0 sfence_vm=C2=A0 =C2=A00001000=C2=A0 =C2=A0 00100 ..... 000 00000=
 1110011 @sfence_vm<br>
&gt;<br>
&gt; +# *** NMI ***<br>
&gt; +mnret=C2=A0 =C2=A0 =C2=A0 =C2=A00111000=C2=A0 =C2=A0 00010 00000 000 =
00000 1110011<br>
&gt; +<br>
&gt;=C2=A0 # *** RV32I Base Instruction Set ***<br>
&gt;=C2=A0 lui=C2=A0 =C2=A0 =C2=A0 ....................=C2=A0 =C2=A0 =C2=A0=
 =C2=A0..... 0110111 @u<br>
&gt;=C2=A0 auipc=C2=A0 =C2=A0 ....................=C2=A0 =C2=A0 =C2=A0 =C2=
=A0..... 0010111 @u<br>
&gt; diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/r=
iscv/insn_trans/trans_privileged.c.inc<br>
&gt; index 32312be2024..63c49dfe6fb 100644<br>
&gt; --- a/target/riscv/insn_trans/trans_privileged.c.inc<br>
&gt; +++ b/target/riscv/insn_trans/trans_privileged.c.inc<br>
&gt; @@ -106,6 +106,19 @@ static bool trans_mret(DisasContext *ctx, arg_mre=
t *a)<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static bool trans_mnret(DisasContext *ctx, arg_mnret *a)<br>
&gt; +{<br>
&gt; +#ifndef CONFIG_USER_ONLY<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_movi_tl(cpu_pc, ctx-&gt;base.pc_next);<br>
&gt; +=C2=A0 =C2=A0 gen_helper_mnret(cpu_pc, cpu_env, cpu_pc);<br>
&gt; +=C2=A0 =C2=A0 exit_tb(ctx); /* no chaining */<br>
&gt; +=C2=A0 =C2=A0 ctx-&gt;base.is_jmp =3D DISAS_NORETURN;<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 return false;<br>
&gt; +#endif<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static bool trans_wfi(DisasContext *ctx, arg_wfi *a)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt; diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c<br>
&gt; index 1eddcb94de7..b9601776153 100644<br>
&gt; --- a/target/riscv/op_helper.c<br>
&gt; +++ b/target/riscv/op_helper.c<br>
&gt; @@ -175,6 +175,37 @@ target_ulong helper_mret(CPURISCVState *env, targ=
et_ulong cpu_pc_deb)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return retpc;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +target_ulong helper_mnret(CPURISCVState *env, target_ulong cpu_pc_deb=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (!riscv_feature(env, RISCV_FEATURE_RNMI)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* RNMI feature is not presented. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISCV_EXCP_ILL=
EGAL_INST, GETPC());<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!(env-&gt;priv &gt;=3D PRV_M)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISCV_EXCP_ILL=
EGAL_INST, GETPC());<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Get return PC from mnepc CSR. */<br>
&gt; +=C2=A0 =C2=A0 target_ulong retpc =3D env-&gt;mnepc;<br>
&gt; +=C2=A0 =C2=A0 if (!riscv_has_ext(env, RVC) &amp;&amp; (retpc &amp; 0x=
3)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISCV_EXCP_INS=
T_ADDR_MIS, GETPC());<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Get previous privilege level from mnstatus CSR. */<b=
r>
&gt; +=C2=A0 =C2=A0 target_ulong prev_priv =3D get_field(env-&gt;mnstatus, =
MNSTATUS_MPP);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!pmp_get_num_rules(env) &amp;&amp; (prev_priv !=3D =
PRV_M)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISCV_EXCP_ILL=
EGAL_INST, GETPC());<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 riscv_cpu_set_mode(env, prev_priv);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 env-&gt;nmie =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return retpc;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 void helper_wfi(CPURISCVState *env)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--0000000000008a05f105be167db2--

