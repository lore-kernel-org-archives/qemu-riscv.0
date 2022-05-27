Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nuihG-00019P-KO
	for mharc-qemu-riscv@gnu.org; Fri, 27 May 2022 18:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nuihE-000195-7f
 for qemu-riscv@nongnu.org; Fri, 27 May 2022 18:44:40 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:33560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nuihA-0003df-Du
 for qemu-riscv@nongnu.org; Fri, 27 May 2022 18:44:39 -0400
Received: by mail-lf1-x12f.google.com with SMTP id a28so4281366lfm.0
 for <qemu-riscv@nongnu.org>; Fri, 27 May 2022 15:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ekQIkHQvm9sLbl7B7R6sbk55ckvBb75qdrYdzOnEF3Q=;
 b=gU9eVRl7UtFzg2M3Gl1CE4PbMocmDmH8aASCgQd/U2pddJ7tdlfCvJJWVlVw4WaSX3
 ggBHP1PYh5F5zH3tVgBSDKMZxtaGAUzv63s6fgtnfHjq0CwulQbgRJU9KKZNyeYwnVRI
 KdV7pfLfMJzLqyXpm9rWRNzV3SRsaSpOsB0D3fw9mauLo9Ry++MSj/1mEu4Nk4x5sNV1
 rF/65tlYoBxXLqs7sz+vWaO+Zl2mebTq8R7FVxOhUDzJbgWAII0Vnr3eK9YaXD6HgFfF
 g3UzRWh1UDLJqFfxsv4G2UvL45+0kkxHVrhoefvcfaWpZqi1GuiDd7Bg4PgA8vWXo7SZ
 olkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ekQIkHQvm9sLbl7B7R6sbk55ckvBb75qdrYdzOnEF3Q=;
 b=rdQTdJ2q0P8JPOOozlftC2OpvCgAtcKwI5mH9bWeLeEk2BarjaDC9Dy6p+Pmu3oHpn
 OoWaSFPeT7PhXyHERrlm3nmhEDtdz8UMzVe33aL/RhNqFQtmV/WH7EkS43Sk5KTh8sGQ
 WhqR5FHuBKqm3gMgjVxHdicnpgFmstSmK9EIkDadPRjy2An/pPzKJe+gr7LtPoAGnlvZ
 Qzyee+lZAjOOUTJdpWH5P0TzG0bBRrG2sIZDdjSPudA5bxEpBu+QHUS9UARfPy6jxEbd
 cv6dInx/ed/dOx6PtEWHReq9D5EZdSoxc3zpbSLoDcJOsV6J3kEilQYr6pGRNh/VyzGL
 s39A==
X-Gm-Message-State: AOAM532B9aVWGECcaiq4NbcYYdj5t4CxAT5JdnwAk3wj7byhmagN4PaJ
 A/MP4Jz1OJF+wj/fcihyoXW+F/vQa39hgE6Bmjl8BA==
X-Google-Smtp-Source: ABdhPJyeVUN3Hh0wm1OB9OYrPIdazgSmSh4Ib40pPeHlNIPwFUDKwQfSRUca3MvAHP9vdFk5qoJqaoMyuGsieiXR8tc=
X-Received: by 2002:a05:6512:3182:b0:478:6db8:829a with SMTP id
 i2-20020a056512318200b004786db8829amr19901589lfe.482.1653691473457; Fri, 27
 May 2022 15:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220513181748.990645-1-atishp@rivosinc.com>
 <20220513181748.990645-3-atishp@rivosinc.com>
 <CAKmqyKN_SsWkPiRnQxd-ArS44aNKJZ5zgUAFM2WSEggDbUopug@mail.gmail.com>
 <CAOnJCUL2GXDvven-4q79RhJAqcBH+i=dFN7ttRoCktTXpqhVxg@mail.gmail.com>
 <CAKmqyKNOMMNWfhKzL8vP=rqhQw9rC2HtCmcdA3QBFfjyMMtXGA@mail.gmail.com>
In-Reply-To: <CAKmqyKNOMMNWfhKzL8vP=rqhQw9rC2HtCmcdA3QBFfjyMMtXGA@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 27 May 2022 15:44:22 -0700
Message-ID: <CAHBxVyEpTHQsJCHeaRFL2BWU_6A3r3gTKUpnCUMroruzmdKPvg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] target/riscv: Add stimecmp support
To: Alistair Francis <alistair23@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 27 May 2022 22:44:40 -0000

On Thu, May 26, 2022 at 7:07 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, May 26, 2022 at 5:16 PM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Wed, May 25, 2022 at 10:11 PM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Sat, May 14, 2022 at 4:39 AM Atish Patra <atishp@rivosinc.com> wrote:
> > > >
> > > > stimecmp allows the supervisor mode to update stimecmp CSR directly
> > > > to program the next timer interrupt. This CSR is part of the Sstc
> > > > extension which was ratified recently.
> > > >
> > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > > ---
> > > >  target/riscv/cpu.c         |  8 ++++
> > > >  target/riscv/cpu.h         |  7 +++
> > > >  target/riscv/cpu_bits.h    |  4 ++
> > > >  target/riscv/csr.c         | 92 +++++++++++++++++++++++++++++++++++
> > > >  target/riscv/machine.c     |  2 +
> > > >  target/riscv/meson.build   |  3 +-
> > > >  target/riscv/time_helper.c | 98 ++++++++++++++++++++++++++++++++++++++
> > > >  target/riscv/time_helper.h | 30 ++++++++++++
> > > >  8 files changed, 243 insertions(+), 1 deletion(-)
> > > >  create mode 100644 target/riscv/time_helper.c
> > > >  create mode 100644 target/riscv/time_helper.h
> > > >
> > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > index 19f4e8294042..d58dd2f857a7 100644
> > > > --- a/target/riscv/cpu.c
> > > > +++ b/target/riscv/cpu.c
> > > > @@ -23,6 +23,7 @@
> > > >  #include "qemu/log.h"
> > > >  #include "cpu.h"
> > > >  #include "internals.h"
> > > > +#include "time_helper.h"
> > > >  #include "exec/exec-all.h"
> > > >  #include "qapi/error.h"
> > > >  #include "qemu/error-report.h"
> > > > @@ -779,7 +780,12 @@ static void riscv_cpu_init(Object *obj)
> > > >  #ifndef CONFIG_USER_ONLY
> > > >      qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
> > > >                        IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
> > > > +
> > > > +    if (cpu->cfg.ext_sstc) {
> > > > +        riscv_timer_init(cpu);
> > > > +    }
> > > >  #endif /* CONFIG_USER_ONLY */
> > > > +
> > > >  }
> > > >
> > > >  static Property riscv_cpu_properties[] = {
> > > > @@ -806,6 +812,7 @@ static Property riscv_cpu_properties[] = {
> > > >      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> > > >      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> > > >      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> > > > +    DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
> > > >
> > > >      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> > > >      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> > > > @@ -965,6 +972,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> > > >          ISA_EDATA_ENTRY(zbs, ext_zbs),
> > > >          ISA_EDATA_ENTRY(zve32f, ext_zve32f),
> > > >          ISA_EDATA_ENTRY(zve64f, ext_zve64f),
> > > > +        ISA_EDATA_ENTRY(sstc, ext_sstc),
> > > >          ISA_EDATA_ENTRY(svinval, ext_svinval),
> > > >          ISA_EDATA_ENTRY(svnapot, ext_svnapot),
> > > >          ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
> > > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > > index 1119d5201066..9a01e6d0f587 100644
> > > > --- a/target/riscv/cpu.h
> > > > +++ b/target/riscv/cpu.h
> > > > @@ -276,6 +276,11 @@ struct CPUArchState {
> > > >      uint64_t mfromhost;
> > > >      uint64_t mtohost;
> > > >
> > > > +    /* Sstc CSRs */
> > > > +    uint64_t stimecmp;
> > > > +    /* For RV32 only */
> > > > +    uint8_t stimecmp_wr_done;
> > > > +
> > > >      /* physical memory protection */
> > > >      pmp_table_t pmp_state;
> > > >      target_ulong mseccfg;
> > > > @@ -329,6 +334,7 @@ struct CPUArchState {
> > > >      float_status fp_status;
> > > >
> > > >      /* Fields from here on are preserved across CPU reset. */
> > > > +    QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> > > >
> > > >      hwaddr kernel_addr;
> > > >      hwaddr fdt_addr;
> > > > @@ -379,6 +385,7 @@ struct RISCVCPUConfig {
> > > >      bool ext_counters;
> > > >      bool ext_ifencei;
> > > >      bool ext_icsr;
> > > > +    bool ext_sstc;
> > > >      bool ext_svinval;
> > > >      bool ext_svnapot;
> > > >      bool ext_svpbmt;
> > > > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > > > index 4e5b630f5965..29d0e4a1be01 100644
> > > > --- a/target/riscv/cpu_bits.h
> > > > +++ b/target/riscv/cpu_bits.h
> > > > @@ -215,6 +215,10 @@
> > > >  #define CSR_STVAL           0x143
> > > >  #define CSR_SIP             0x144
> > > >
> > > > +/* Sstc supervisor CSRs */
> > > > +#define CSR_STIMECMP        0x14D
> > > > +#define CSR_STIMECMPH       0x15D
> > > > +
> > > >  /* Supervisor Protection and Translation */
> > > >  #define CSR_SPTBR           0x180
> > > >  #define CSR_SATP            0x180
> > > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > > index 245f007e66e1..8952d1308008 100644
> > > > --- a/target/riscv/csr.c
> > > > +++ b/target/riscv/csr.c
> > > > @@ -21,6 +21,7 @@
> > > >  #include "qemu/log.h"
> > > >  #include "qemu/timer.h"
> > > >  #include "cpu.h"
> > > > +#include "time_helper.h"
> > > >  #include "qemu/main-loop.h"
> > > >  #include "exec/exec-all.h"
> > > >  #include "sysemu/cpu-timers.h"
> > > > @@ -537,6 +538,87 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
> > > >      return RISCV_EXCP_NONE;
> > > >  }
> > > >
> > > > +static RISCVException sstc(CPURISCVState *env, int csrno)
> > > > +{
> > > > +    CPUState *cs = env_cpu(env);
> > > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > > > +
> > > > +    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> > > > +        return RISCV_EXCP_ILLEGAL_INST;
> > > > +    }
> > > > +
> > > > +    if (env->priv == PRV_M) {
> > > > +        return RISCV_EXCP_NONE;
> > > > +    }
> > > > +
> > > > +    if (env->priv != PRV_S) {
> > > > +        return RISCV_EXCP_ILLEGAL_INST;
> > > > +    }
> > > > +
> > > > +    /*
> > > > +     * No need of separate function for rv32 as menvcfg stores both menvcfg
> > > > +     * menvcfgh for RV32.
> > > > +     */
> > > > +    if (!(get_field(env->mcounteren, COUNTEREN_TM) &&
> > > > +          get_field(env->menvcfg, MENVCFG_STCE))) {
> > > > +        return RISCV_EXCP_ILLEGAL_INST;
> > > > +    }
> > > > +
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > > +static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
> > > > +                                    target_ulong *val)
> > > > +{
> > > > +    *val = env->stimecmp;
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > > +static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
> > > > +                                    target_ulong *val)
> > > > +{
> > > > +    *val = env->stimecmp >> 32;
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > > +static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
> > > > +                                    target_ulong val)
> > > > +{
> > > > +    RISCVCPU *cpu = env_archcpu(env);
> > > > +
> > > > +    if (riscv_cpu_mxl(env) == MXL_RV32) {
> > > > +        env->stimecmp = deposit64(env->stimecmp, 0, 32, (uint64_t)val);
> > > > +        env->stimecmp_wr_done |= 0x01;
> > > > +        if (env->stimecmp_wr_done != 0x03) {
> > >
> > > This still doesn't seem right. What if a guest already knows the top
> > > 32-bits are 0 and just writes the bottom 32-bits? In this case we
> > > won't generate an interrupt, which is incorrect
> > >
> > > That's unlikely to happen, but we should aim to model the spec, not
> > > what we think people will do.
> > >
> > > We should just be able to call riscv_timer_write_timecmp() on all updates
> > >
> >
> > If we update the riscv_timer_write_timecmp on all updates, it will
> > have set the timer
> > with an incorrect value. For example, consider the unlikely case you
> > described above
> >
> > The guest wants to update stimecmp with a value that has upper 32 bits
> > as zero. Thus,
> > the guest only updates STIMECMP.
> >
> > However, env->stimecmp may already have some stale value in the upper
> > 32 bits. The resultant
> > value stored after write_stimecmp will be completely wrong. Thus it
> > will generate a timer interrupt at
> > incorrect interval.
>
> But that is the correct behaviour. In this case that is a guest bug
> and hardware would behave exactly the same
>
> >
> > Another use case: In case of a preemptible guest, it may get preempted
> > after updating upper or lower
> > 32 bits. If riscv_timer_write_timecmp is called after every update, it
> > may get a spurious interrupt as well
> > depending on when the other half is written by the guest.
>
> That also matches what would happen on hardware though. We are trying
> to replicate hardware not prevent guests from having bugs
>

Ahh I got your point now :). I will modify the patch so that a timer
is programmed every write of
stimecmp & stimecmph. This makes the code simpler as well :)

We should do that for mhpmevent & mhpmcounter writes as well.
Thanks.

> Alistair
>
> >
> > > Alistair
> > >
> > > > +            return RISCV_EXCP_NONE;
> > > > +        } else {
> > > > +            env->stimecmp_wr_done = 0;
> > > > +        }
> > > > +    } else {
> > > > +        env->stimecmp = val;
> > > > +    }
> > > > +
> > > > +    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
> > > > +
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > > +static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
> > > > +                                    target_ulong val)
> > > > +{
> > > > +    RISCVCPU *cpu = env_archcpu(env);
> > > > +
> > > > +    env->stimecmp = deposit64(env->stimecmp, 32, 32, (uint64_t)val);
> > > > +    env->stimecmp_wr_done |= 0x02;
> > > > +    if (env->stimecmp_wr_done != 0x03) {
> > > > +        return RISCV_EXCP_NONE;
> > > > +    }
> > > > +    env->stimecmp_wr_done = 0;
> > > > +    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
> > > > +
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > >  /* Machine constants */
> > > >
> > > >  #define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
> > > > @@ -1515,6 +1597,12 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
> > > >          new_val |= env->external_seip * MIP_SEIP;
> > > >      }
> > > >
> > > > +    if (cpu->cfg.ext_sstc && (env->priv == PRV_M) &&
> > > > +        get_field(env->menvcfg, MENVCFG_STCE)) {
> > > > +        /* sstc extension forbids STIP & VSTIP to be writeable in mip */
> > > > +        mask = mask & ~(MIP_STIP | MIP_VSTIP);
> > > > +    }
> > > > +
> > > >      if (mask) {
> > > >          old_mip = riscv_cpu_update_mip(cpu, mask, (new_val & mask));
> > > >      } else {
> > > > @@ -3341,6 +3429,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> > > >      [CSR_SCAUSE]   = { "scause",   smode, read_scause,   write_scause   },
> > > >      [CSR_STVAL]    = { "stval",    smode, read_stval,   write_stval   },
> > > >      [CSR_SIP]      = { "sip",      smode, NULL,    NULL, rmw_sip        },
> > > > +    [CSR_STIMECMP] = { "stimecmp", sstc, read_stimecmp, write_stimecmp,
> > > > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > > +    [CSR_STIMECMPH] = { "stimecmph", sstc, read_stimecmph, write_stimecmph,
> > > > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > >
> > > >      /* Supervisor Protection and Translation */
> > > >      [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
> > > > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > > > index 7d85de0b1d49..1e775343a37b 100644
> > > > --- a/target/riscv/machine.c
> > > > +++ b/target/riscv/machine.c
> > > > @@ -334,6 +334,8 @@ const VMStateDescription vmstate_riscv_cpu = {
> > > >          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> > > >          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> > > >          VMSTATE_UINT64(env.mtohost, RISCVCPU),
> > > > +        VMSTATE_UINT64(env.stimecmp, RISCVCPU),
> > > > +        VMSTATE_UINT8(env.stimecmp_wr_done, RISCVCPU),
> > > >
> > > >          VMSTATE_END_OF_LIST()
> > > >      },
> > > > diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> > > > index 2c20f3dd8e9c..1243d019148e 100644
> > > > --- a/target/riscv/meson.build
> > > > +++ b/target/riscv/meson.build
> > > > @@ -29,7 +29,8 @@ riscv_softmmu_ss.add(files(
> > > >    'pmp.c',
> > > >    'debug.c',
> > > >    'monitor.c',
> > > > -  'machine.c'
> > > > +  'machine.c',
> > > > +  'time_helper.c'
> > > >  ))
> > > >
> > > >  target_arch += {'riscv': riscv_ss}
> > > > diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> > > > new file mode 100644
> > > > index 000000000000..f3fb5eac7b7b
> > > > --- /dev/null
> > > > +++ b/target/riscv/time_helper.c
> > > > @@ -0,0 +1,98 @@
> > > > +/*
> > > > + * RISC-V timer helper implementation.
> > > > + *
> > > > + * Copyright (c) 2022 Rivos Inc.
> > > > + *
> > > > + * This program is free software; you can redistribute it and/or modify it
> > > > + * under the terms and conditions of the GNU General Public License,
> > > > + * version 2 or later, as published by the Free Software Foundation.
> > > > + *
> > > > + * This program is distributed in the hope it will be useful, but WITHOUT
> > > > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > > > + * more details.
> > > > + *
> > > > + * You should have received a copy of the GNU General Public License along with
> > > > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > > > + */
> > > > +
> > > > +#include "qemu/osdep.h"
> > > > +#include "qemu/log.h"
> > > > +#include "cpu_bits.h"
> > > > +#include "time_helper.h"
> > > > +#include "hw/intc/riscv_aclint.h"
> > > > +
> > > > +static void riscv_stimer_cb(void *opaque)
> > > > +{
> > > > +    RISCVCPU *cpu = opaque;
> > > > +    riscv_cpu_update_mip(cpu, MIP_STIP, BOOL_TO_MASK(1));
> > > > +}
> > > > +
> > > > +/*
> > > > + * Called when timecmp is written to update the QEMU timer or immediately
> > > > + * trigger timer interrupt if mtimecmp <= current timer value.
> > > > + */
> > > > +void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
> > > > +                               uint64_t timecmp, uint64_t delta,
> > > > +                               uint32_t timer_irq)
> > > > +{
> > > > +    uint64_t diff, ns_diff, next;
> > > > +    CPURISCVState *env = &cpu->env;
> > > > +    RISCVAclintMTimerState *mtimer = env->rdtime_fn_arg;
> > > > +    uint32_t timebase_freq = mtimer->timebase_freq;
> > > > +    uint64_t rtc_r = env->rdtime_fn(env->rdtime_fn_arg) + delta;
> > > > +
> > > > +    if (timecmp <= rtc_r) {
> > > > +        /*
> > > > +         * If we're setting an stimecmp value in the "past",
> > > > +         * immediately raise the timer interrupt
> > > > +         */
> > > > +        riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    /* Clear the [V]STIP bit in mip */
> > > > +    riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
> > > > +
> > > > +    /* otherwise, set up the future timer interrupt */
> > > > +    diff = timecmp - rtc_r;
> > > > +    /* back to ns (note args switched in muldiv64) */
> > > > +    ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
> > > > +
> > > > +    /*
> > > > +     * check if ns_diff overflowed and check if the addition would potentially
> > > > +     * overflow
> > > > +     */
> > > > +    if ((NANOSECONDS_PER_SECOND > timebase_freq && ns_diff < diff) ||
> > > > +        ns_diff > INT64_MAX) {
> > > > +        next = INT64_MAX;
> > > > +    } else {
> > > > +        /*
> > > > +         * as it is very unlikely qemu_clock_get_ns will return a value
> > > > +         * greater than INT64_MAX, no additional check is needed for an
> > > > +         * unsigned integer overflow.
> > > > +         */
> > > > +        next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns_diff;
> > > > +        /*
> > > > +         * if ns_diff is INT64_MAX next may still be outside the range
> > > > +         * of a signed integer.
> > > > +         */
> > > > +        next = MIN(next, INT64_MAX);
> > > > +    }
> > > > +
> > > > +    timer_mod(timer, next);
> > > > +}
> > > > +
> > > > +void riscv_timer_init(RISCVCPU *cpu)
> > > > +{
> > > > +    CPURISCVState *env;
> > > > +
> > > > +    if (!cpu) {
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    env = &cpu->env;
> > > > +    env->stimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_stimer_cb, cpu);
> > > > +    env->stimecmp = 0;
> > > > +
> > > > +}
> > > > diff --git a/target/riscv/time_helper.h b/target/riscv/time_helper.h
> > > > new file mode 100644
> > > > index 000000000000..7b3cdcc35020
> > > > --- /dev/null
> > > > +++ b/target/riscv/time_helper.h
> > > > @@ -0,0 +1,30 @@
> > > > +/*
> > > > + * RISC-V timer header file.
> > > > + *
> > > > + * Copyright (c) 2022 Rivos Inc.
> > > > + *
> > > > + * This program is free software; you can redistribute it and/or modify it
> > > > + * under the terms and conditions of the GNU General Public License,
> > > > + * version 2 or later, as published by the Free Software Foundation.
> > > > + *
> > > > + * This program is distributed in the hope it will be useful, but WITHOUT
> > > > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > > > + * more details.
> > > > + *
> > > > + * You should have received a copy of the GNU General Public License along with
> > > > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > > > + */
> > > > +
> > > > +#ifndef RISCV_TIME_HELPER_H
> > > > +#define RISCV_TIME_HELPER_H
> > > > +
> > > > +#include "cpu.h"
> > > > +#include "qemu/timer.h"
> > > > +
> > > > +void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
> > > > +                               uint64_t timecmp, uint64_t delta,
> > > > +                               uint32_t timer_irq);
> > > > +void riscv_timer_init(RISCVCPU *cpu);
> > > > +
> > > > +#endif
> > > > --
> > > > 2.25.1
> > > >
> > > >
> > >
> >
> >
> > --
> > Regards,
> > Atish

