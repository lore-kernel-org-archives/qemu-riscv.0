Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1XeK-0002yu-Bj
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 14:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o1XeH-0002wh-9S
 for qemu-riscv@nongnu.org; Wed, 15 Jun 2022 14:21:49 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:42897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o1XeB-0007b1-9v
 for qemu-riscv@nongnu.org; Wed, 15 Jun 2022 14:21:49 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o33-20020a17090a0a2400b001ea806e48c6so2798634pjo.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Jun 2022 11:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Deg+r/NnwKfc+BROYFSY38t9YNBCmjOwmbOtkGWIA9E=;
 b=IEbmzA9Fx4lBYAmZD37DFPr9Z8r0deLPuVQ4w0dC+1bKuW2kRHV55xrzFRs0Duk0R0
 hmc47AtihLEzCU1e5x7aaB1bLy/oYPVapBLr8pxA3zHD9lEJc0zR4HWfkF0VX5FCJbrw
 V67YdVHIk4Pk6mOY4iDReVN/+cyFvPD8bz/+qUKIDfAXdzGxnDczVhA9pqxnbZb7PG4F
 6qXep5LYwh8TeGlXvZXNnFGuB83WA4xh6Ju+/C7RNCk8eab6+riiiBLv8eyr/e2H8+dB
 /VowV9eYrhlLzphsWsdiZ4njR0f7Vbno7jq9pTkNybeorBh/7HDaYx/dSTdzXIhcigUl
 VqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Deg+r/NnwKfc+BROYFSY38t9YNBCmjOwmbOtkGWIA9E=;
 b=kPknt6FIzmqbW6aJyON515AHvboTFYpK2jrCL/hL0FQAO5ORytD3QS3C8Ky8EMzFTn
 Zpd9PQuRG5JBuh6LLQoKWxqzjP31Lxpo5f4mFvSI2LyIHSYKvvazjHPr5e9o/08LDWh7
 PpkSsn7ZM8zStYh5/HFS6JKk12Emv7+MRaQY9hFTLWaRXGiC5dxJzDtx86zJYUGaEE1w
 B5xb92cpFvOCELQHadG/LyPKkJyu/tS4jo+CrQAv+UkqReF33C5mTcTFd+cCVEjOjwUU
 HW0mT59krDBuzDAar2Sg/LcFcMIJDtQkhhY7uzm2n6nA0MYtrI6dhPMV49j0QquMXWd3
 14ww==
X-Gm-Message-State: AJIora81b9Jmq3qDgHoVy9VQctOBMuxw/bZFPT5hayJVeJKqDoBDmFDn
 wUHo55ZfKrxMgEQN0lEIX6MIa3HEAdkvEuVuzmdKQA==
X-Google-Smtp-Source: AGRyM1tb6tkaBSKGVfBcKXCx4whoI0zmevHzAUpKF2gmvpvpDgxX5LNynov+npV1oX75ykKxlATcuXx5/ki3YWRduuI=
X-Received: by 2002:a17:90a:d148:b0:1ea:4e16:545b with SMTP id
 t8-20020a17090ad14800b001ea4e16545bmr11752763pjw.132.1655317301170; Wed, 15
 Jun 2022 11:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220531180321.34942-1-atishp@rivosinc.com>
 <20220531180321.34942-3-atishp@rivosinc.com>
 <CAKmqyKNLKB-kZQrSK-7sKJ3HQzSBxGFR_4V2=L0iBEa4MmuwQg@mail.gmail.com>
 <CAOnJCU+YdOPRqYNtwsMu8Q2o4onkMqXJppudBwLwUhjWvoe5Xg@mail.gmail.com>
 <CAKmqyKOt67aWFFNu3CNS+NfiLFk4gtE_7SncPrunFDmtKe_98g@mail.gmail.com>
In-Reply-To: <CAKmqyKOt67aWFFNu3CNS+NfiLFk4gtE_7SncPrunFDmtKe_98g@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 15 Jun 2022 11:21:30 -0700
Message-ID: <CAHBxVyFOmbet8J0PW3-9mhqNh9RmJ9hJcuDkXonE_+Y8LYf4OQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] target/riscv: Add stimecmp support
To: Alistair Francis <alistair23@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Anup Patel <apatel@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 15 Jun 2022 18:21:49 -0000

On Wed, Jun 8, 2022 at 12:19 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Mon, Jun 6, 2022 at 2:23 AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Thu, Jun 2, 2022 at 12:02 AM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Wed, Jun 1, 2022 at 4:16 AM Atish Patra <atishp@rivosinc.com> wrote:
> > > >
> > > > stimecmp allows the supervisor mode to update stimecmp CSR directly
> > > > to program the next timer interrupt. This CSR is part of the Sstc
> > > > extension which was ratified recently.
> > > >
> > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > > ---
> > > >  target/riscv/cpu.c         |  8 ++++
> > > >  target/riscv/cpu.h         |  5 ++
> > > >  target/riscv/cpu_bits.h    |  4 ++
> > > >  target/riscv/csr.c         | 81 +++++++++++++++++++++++++++++++
> > > >  target/riscv/machine.c     |  1 +
> > > >  target/riscv/meson.build   |  3 +-
> > > >  target/riscv/time_helper.c | 98 ++++++++++++++++++++++++++++++++++++++
> > > >  target/riscv/time_helper.h | 30 ++++++++++++
> > > >  8 files changed, 229 insertions(+), 1 deletion(-)
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
> > >
> > > Do we want this enabled by default?
> > >
> >
> > sstc extension will result in performance improvements as it avoids
> > the SBI calls & interrupt forwarding
> > path. That's why I think it should be enabled by default.
> >
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
> > > > index 1119d5201066..9a5e02f217ba 100644
> > > > --- a/target/riscv/cpu.h
> > > > +++ b/target/riscv/cpu.h
> > > > @@ -276,6 +276,9 @@ struct CPUArchState {
> > > >      uint64_t mfromhost;
> > > >      uint64_t mtohost;
> > > >
> > > > +    /* Sstc CSRs */
> > > > +    uint64_t stimecmp;
> > > > +
> > > >      /* physical memory protection */
> > > >      pmp_table_t pmp_state;
> > > >      target_ulong mseccfg;
> > > > @@ -329,6 +332,7 @@ struct CPUArchState {
> > > >      float_status fp_status;
> > > >
> > > >      /* Fields from here on are preserved across CPU reset. */
> > > > +    QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> > > >
> > > >      hwaddr kernel_addr;
> > > >      hwaddr fdt_addr;
> > > > @@ -379,6 +383,7 @@ struct RISCVCPUConfig {
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
> > > > index 245f007e66e1..48d07911ae14 100644
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
> > > > @@ -537,6 +538,76 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
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
> > > > +    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
> > > > +
> > > > +    return RISCV_EXCP_NONE;
> > > > +}
> > > > +
> > > >  /* Machine constants */
> > > >
> > > >  #define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
> > > > @@ -1515,6 +1586,12 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
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
> > > > @@ -3341,6 +3418,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
> > > > index 7d85de0b1d49..ee02bfc18916 100644
> > > > --- a/target/riscv/machine.c
> > > > +++ b/target/riscv/machine.c
> > > > @@ -334,6 +334,7 @@ const VMStateDescription vmstate_riscv_cpu = {
> > > >          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> > > >          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> > > >          VMSTATE_UINT64(env.mtohost, RISCVCPU),
> > > > +        VMSTATE_UINT64(env.stimecmp, RISCVCPU),
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
> > > > +    uint64_t diff, ns_diff, next
> > > > +    CPURISCVState *env = &cpu->env;
> > > > +    RISCVAclintMTimerState *mtimer = env->rdtime_fn_arg;
> > > > +    uint32_t timebase_freq = mtimer->timebase_freq;
> > > > +    uint64_t rtc_r = env->rdtime_fn(env->rdtime_fn_arg) + delta;
> > >
> > > Can't we just pass mtimer here directly?
> > >
> >
> > Yeah. rank's recent patch changed the argument to mtimer instead of
> > timebase_freq.
> > I forgot to change here while rebasing. I will change this.
> >
> > > Ok, so I realise this is based on the aclint, but I've now confused myself.
> > >
> > > So rtc_r is the current time in ticks
> > >
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
> > >
> > > timecmp is the absolute time we want the interrupt in ticks
> > >
> > > > +    /* back to ns (note args switched in muldiv64) */
> > > > +    ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
> > >
> > > ns_diff is the amount of ns in the future we want the interrupt to occur
> > >
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
> > >
> > > I don't think qemu_clock_get_ns() can return a value larger than INT64_MAX
> > >
> >
> > Yup as the return type is int64_t :)
> >
> > > > +         */
> > > > +        next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns_diff;
> > >
> > > next is the absolute time (in ns) that we want the interrupt to occur.
> > >
> > > So we end up performing
> > >
> > > ((timecmp - now_in_ticks) in ns) + now_in_ns
> > >
> > > Can't we just convert timecmp to ns and then set that directly with timer_mod()?
> > >
> >
> > That should work for all the case except
> > if ((NANOSECONDS_PER_SECOND > timebase_freq && ns_diff < diff)
> >
> > where we cap the next to INT64_MAX.
>
> Couldn't we catch that with this?
>
> /* Convert to ns */
> timecmp_ns = muldiv64(timecmp, NANOSECONDS_PER_SECOND, timebase_freq);
>
> if ((NANOSECONDS_PER_SECOND > timebase_freq && timecmp_ns < timecmp)
>

Yes. But I think there are other problems.

1. Currently, we are converting the difference between timecmp & rtc_r
to nanoseconds.
The diff will always be a smaller number that won't overflow for a long time.
However, if we convert the timestamp directly to nanoseconds, it may
overflow more often.

2. For vstimecmp, we have htimedelta which relies on unsigned integer wrapping.
If we convert directly convert the vstimecmp to nanoseconds, it will
be problematic to factor in the
htimedelta.

Let me know if I missed something.

> >
> > Don't we need this condition to check ? If yes, we have to compute
> > ns_diff anyways.
> >
> > > > +        /*
> > > > +         * if ns_diff is INT64_MAX next may still be outside the range
> > > > +         * of a signed integer.
> > > > +         */
> > > > +        next = MIN(next, INT64_MAX);
> > >
> > > Also, what happens if the guest sets a timecmp larger than INT64_MAX?
> > > We will then end up rounding it down, maybe we should store the
> > > timecmp and check it in riscv_stimer_cb?
> > >
> >
> > The 'cpu' is passed as an opaque parameter. Thus, we can retrieve the timecmp in
> > riscv_stimer_cb.
> >
> > At that point, if stimecmp > INT64_MAX, we need to reprogram the
> > counter with the overflow amount
> > instead of triggering the interrupt. Correct ?
>
> Yep! Exactly
>
> >
> > It is probably unlikely to hit that condition, we should do what is
> > correct. It should be fixed for mtimecmp in aclint driver
> > as well.
>
> Yeah, I agree it's unlikely, but this extension is expected to be used
> by higher performance implements, like servers, where it *could*
> happen
>
> Alistair
>
> >
> > > Alistair
> > >
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

