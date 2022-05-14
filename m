Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npmTn-0006jg-8K
	for mharc-qemu-riscv@gnu.org; Sat, 14 May 2022 03:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1npmTl-0006jJ-Gz
 for qemu-riscv@nongnu.org; Sat, 14 May 2022 03:46:21 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:42591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1npmTh-0003Cy-9h
 for qemu-riscv@nongnu.org; Sat, 14 May 2022 03:46:21 -0400
Received: by mail-ed1-x531.google.com with SMTP id z19so12351482edx.9
 for <qemu-riscv@nongnu.org>; Sat, 14 May 2022 00:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8x3B1mxpBVq1TLykUDtAE2IfSNM2zFVNzRGFTb323K8=;
 b=iyRQEDPXJQPUQm0LboPQebGoB7Yx2L3TJlMmPOh1nM25Ahd1czDZyELo0YViA421Fr
 wsg/Zvwu3lORu9pMAx6gXW+k/al4q7/x248I49wdAMPM51vs6gSvtbfzmnrUi/QA+nhK
 j8w0fSxrmn1HwEiRXGCrY4CF6v8+kV+99WVlExspXLDihuBU/+NYsyvIi69PMXssk6v6
 itY3s9s4vmNvvu9xYUcJo2M9smqLWvj0SFNb9M+gQb58uaV7l2LKhRJ6PNFgNKLSpnTx
 j7piBKc/qDpKwWeTcpWe6ZXV9spuxsJ45xELRCoiQWuADxLOoconiZQl02favyoxRsW1
 T+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8x3B1mxpBVq1TLykUDtAE2IfSNM2zFVNzRGFTb323K8=;
 b=V1J4h7nVFOZ2cPdZ53FNhTtOvx8lqgGJWxtC2OaAeb4v8T+6qD4ep+JTY3+QbC2p/a
 zJKlbToBzEmET6iogdCZVvKhmopaVxYvAEpJvDYNP6NfL4eAOR8LdMXA0+lds5/v1AWN
 vXWrSx2Dq3Uax5rgkOwrCHlMTZ3jyJUwvSfgtFOJ8Xuif3lcXjO59YcKCbCJiN0ZpnVb
 RuZL2zimammjoZHTgUz9DRyDniyvcuZXVhpYEv9cPXblkYUGcZU9CV+YGw0ZyeFmswlm
 VmsmmW/rX8xuGP5hZigIvJP6jz6pGKH0GIzVKQNhs593E/zH5kjRn/WBkPhxiFJKLq6Q
 XztQ==
X-Gm-Message-State: AOAM533w0K1DzyHcVMBq6xnt7f3P5Ryx/6KlJ7QgLbtfIrQMiaK4s9bQ
 uFzHiA1KrfyhODiI4KzWyiUwVDG7B/r66bgmtM/LPQ==
X-Google-Smtp-Source: ABdhPJz6gmrenrfMUYHuRkfCrRv+3YGlrH+hSM7tWAbabMVZs/05PsAD2SC7P+8fxHTWzNvdoiwMWIwL799E6Yuxmzc=
X-Received: by 2002:a05:6402:354d:b0:428:19be:2447 with SMTP id
 f13-20020a056402354d00b0042819be2447mr2463420edd.308.1652514375199; Sat, 14
 May 2022 00:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220511215956.2351243-1-atishp@rivosinc.com>
 <20220511215956.2351243-8-atishp@rivosinc.com>
 <CANzO1D28K+QeJF4q4mD7ZYH+0H=KTFWtSwfQ4KoV4onKX4-j3Q@mail.gmail.com>
 <CAHBxVyG9BRGHLgbLZ7p8eg1oK7k_z8OAvAygQnQ68gMMk8K7bg@mail.gmail.com>
In-Reply-To: <CAHBxVyG9BRGHLgbLZ7p8eg1oK7k_z8OAvAygQnQ68gMMk8K7bg@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 14 May 2022 15:46:04 +0800
Message-ID: <CAE_xrPgz4mxhDx88P_67SfKoxsNPL4gDNLA0vrWwTMcz3qsatQ@mail.gmail.com>
Subject: Re: [PATCH v8 07/12] target/riscv: Support mcycle/minstret write
 operation
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000051ff5f05def3fc87"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=frank.chang@sifive.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sat, 14 May 2022 07:46:21 -0000

--00000000000051ff5f05def3fc87
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022 at 11:58 PM Atish Kumar Patra <atishp@rivosinc.com>
wrote:

> On Thu, May 12, 2022 at 11:29 PM Frank Chang <frank.chang@sifive.com>
> wrote:
> >
> > On Thu, May 12, 2022 at 6:01 AM Atish Patra <atishp@rivosinc.com> wrote:
> >>
> >> From: Atish Patra <atish.patra@wdc.com>
> >>
> >> mcycle/minstret are actually WARL registers and can be written with any
> >> given value. With SBI PMU extension, it will be used to store a initial
> >> value provided from supervisor OS. The Qemu also need prohibit the
> counter
> >> increment if mcountinhibit is set.
> >>
> >> Support mcycle/minstret through generic counter infrastructure.
> >>
> >> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> >> ---
> >>  target/riscv/cpu.h       |  23 ++++--
> >>  target/riscv/csr.c       | 157 ++++++++++++++++++++++++++++-----------
> >>  target/riscv/machine.c   |  25 ++++++-
> >>  target/riscv/meson.build |   3 +-
> >>  target/riscv/pmu.c       |  32 ++++++++
> >>  target/riscv/pmu.h       |  28 +++++++
> >>  6 files changed, 214 insertions(+), 54 deletions(-)
> >>  create mode 100644 target/riscv/pmu.c
> >>  create mode 100644 target/riscv/pmu.h
> >>
> >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> index 32cdd9070be5..f60072e0fd3d 100644
> >> --- a/target/riscv/cpu.h
> >> +++ b/target/riscv/cpu.h
> >> @@ -111,7 +111,7 @@ typedef struct CPUArchState CPURISCVState;
> >>  #endif
> >>
> >>  #define RV_VLEN_MAX 1024
> >> -#define RV_MAX_MHPMEVENTS 29
> >> +#define RV_MAX_MHPMEVENTS 32
> >>  #define RV_MAX_MHPMCOUNTERS 32
> >>
> >>  FIELD(VTYPE, VLMUL, 0, 3)
> >> @@ -121,6 +121,18 @@ FIELD(VTYPE, VMA, 7, 1)
> >>  FIELD(VTYPE, VEDIV, 8, 2)
> >>  FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
> >>
> >> +typedef struct PMUCTRState {
> >> +    /* Current value of a counter */
> >> +    target_ulong mhpmcounter_val;
> >> +    /* Current value of a counter in RV32*/
> >> +    target_ulong mhpmcounterh_val;
> >> +    /* Snapshot values of counter */
> >> +    target_ulong mhpmcounter_prev;
> >> +    /* Snapshort value of a counter in RV32 */
> >> +    target_ulong mhpmcounterh_prev;
> >> +    bool started;
> >> +} PMUCTRState;
> >> +
> >>  struct CPUArchState {
> >>      target_ulong gpr[32];
> >>      target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
> >> @@ -273,13 +285,10 @@ struct CPUArchState {
> >>
> >>      target_ulong mcountinhibit;
> >>
> >> -    /* PMU counter configured values */
> >> -    target_ulong mhpmcounter_val[RV_MAX_MHPMCOUNTERS];
> >> -
> >> -    /* for RV32 */
> >> -    target_ulong mhpmcounterh_val[RV_MAX_MHPMCOUNTERS];
> >> +    /* PMU counter state */
> >> +    PMUCTRState pmu_ctrs[RV_MAX_MHPMCOUNTERS];
> >>
> >> -    /* PMU event selector configured values */
> >> +    /* PMU event selector configured values. First three are unused*/
> >>      target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
> >>
> >>      target_ulong sscratch;
> >> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >> index 87aa601e5ddb..c050ed2e2c1b 100644
> >> --- a/target/riscv/csr.c
> >> +++ b/target/riscv/csr.c
> >> @@ -21,6 +21,7 @@
> >>  #include "qemu/log.h"
> >>  #include "qemu/timer.h"
> >>  #include "cpu.h"
> >> +#include "pmu.h"
> >>  #include "qemu/main-loop.h"
> >>  #include "exec/exec-all.h"
> >>  #include "sysemu/cpu-timers.h"
> >> @@ -597,34 +598,28 @@ static int write_vcsr(CPURISCVState *env, int
> csrno, target_ulong val)
> >>  }
> >>
> >>  /* User Timers and Counters */
> >> -static RISCVException read_instret(CPURISCVState *env, int csrno,
> >> -                                   target_ulong *val)
> >> +static target_ulong get_ticks(bool shift)
> >>  {
> >> +    int64_t val;
> >> +    target_ulong result;
> >> +
> >>  #if !defined(CONFIG_USER_ONLY)
> >>      if (icount_enabled()) {
> >> -        *val = icount_get();
> >> +        val = icount_get();
> >>      } else {
> >> -        *val = cpu_get_host_ticks();
> >> +        val = cpu_get_host_ticks();
> >>      }
> >>  #else
> >> -    *val = cpu_get_host_ticks();
> >> +    val = cpu_get_host_ticks();
> >>  #endif
> >> -    return RISCV_EXCP_NONE;
> >> -}
> >>
> >> -static RISCVException read_instreth(CPURISCVState *env, int csrno,
> >> -                                    target_ulong *val)
> >> -{
> >> -#if !defined(CONFIG_USER_ONLY)
> >> -    if (icount_enabled()) {
> >> -        *val = icount_get() >> 32;
> >> +    if (shift) {
> >> +        result = val >> 32;
> >>      } else {
> >> -        *val = cpu_get_host_ticks() >> 32;
> >> +        result = val;
> >>      }
> >> -#else
> >> -    *val = cpu_get_host_ticks() >> 32;
> >> -#endif
> >> -    return RISCV_EXCP_NONE;
> >> +
> >> +    return result;
> >>  }
> >>
> >>  #if defined(CONFIG_USER_ONLY)
> >> @@ -642,11 +637,23 @@ static RISCVException read_timeh(CPURISCVState
> *env, int csrno,
> >>      return RISCV_EXCP_NONE;
> >>  }
> >>
> >> +static int read_hpmcounter(CPURISCVState *env, int csrno, target_ulong
> *val)
> >> +{
> >> +    *val = get_ticks(false);
> >> +    return RISCV_EXCP_NONE;
> >> +}
> >> +
> >> +static int read_hpmcounterh(CPURISCVState *env, int csrno,
> target_ulong *val)
> >> +{
> >> +    *val = get_ticks(true);
> >> +    return RISCV_EXCP_NONE;
> >> +}
> >> +
> >>  #else /* CONFIG_USER_ONLY */
> >>
> >>  static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong
> *val)
> >>  {
> >> -    int evt_index = csrno - CSR_MHPMEVENT3;
> >> +    int evt_index = csrno - CSR_MCOUNTINHIBIT;
> >>
> >>      *val = env->mhpmevent_val[evt_index];
> >>
> >> @@ -655,7 +662,7 @@ static int read_mhpmevent(CPURISCVState *env, int
> csrno, target_ulong *val)
> >>
> >>  static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong
> val)
> >>  {
> >> -    int evt_index = csrno - CSR_MHPMEVENT3;
> >> +    int evt_index = csrno - CSR_MCOUNTINHIBIT;
> >>
> >>      env->mhpmevent_val[evt_index] = val;
> >>
> >> @@ -664,52 +671,102 @@ static int write_mhpmevent(CPURISCVState *env,
> int csrno, target_ulong val)
> >>
> >>  static int write_mhpmcounter(CPURISCVState *env, int csrno,
> target_ulong val)
> >>  {
> >> -    int ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
> >> +    int ctr_idx = csrno - CSR_MCYCLE;
> >> +    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
> >>
> >> -    env->mhpmcounter_val[ctr_index] = val;
> >> +    counter->mhpmcounter_val = val;
> >> +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> >> +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> >> +        counter->mhpmcounter_prev = get_ticks(false);
> >> +    } else {
> >> +        /* Other counters can keep incrementing from the given value */
> >> +        counter->mhpmcounter_prev = val;
> >> +    }
> >>
> >>      return RISCV_EXCP_NONE;
> >>  }
> >>
> >>  static int write_mhpmcounterh(CPURISCVState *env, int csrno,
> target_ulong val)
> >>  {
> >> -    int ctr_index = csrno - CSR_MHPMCOUNTER3H + 3;
> >> +    int ctr_idx = csrno - CSR_MCYCLEH;
> >> +    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
> >>
> >> -    env->mhpmcounterh_val[ctr_index] = val;
> >> +    counter->mhpmcounterh_val = val;
> >> +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> >> +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> >> +        counter->mhpmcounterh_prev = get_ticks(true);
> >> +    } else {
> >> +        counter->mhpmcounterh_prev = val;
> >> +    }
> >> +
> >> +    return RISCV_EXCP_NONE;
> >> +}
> >> +
> >> +static RISCVException riscv_pmu_read_ctr(CPURISCVState *env,
> target_ulong *val,
> >> +                                         bool upper_half, uint32_t
> ctr_idx)
> >> +{
> >> +    PMUCTRState counter = env->pmu_ctrs[ctr_idx];
> >> +    target_ulong ctr_prev = upper_half ? counter.mhpmcounterh_prev :
> >> +                                         counter.mhpmcounter_prev;
> >> +    target_ulong ctr_val = upper_half ? counter.mhpmcounterh_val :
> >> +                                        counter.mhpmcounter_val;
> >> +
> >> +    if (get_field(env->mcountinhibit, BIT(ctr_idx))) {
> >> +        /**
> >> +         * Counter should not increment if inhibit bit is set. We
> can't really
> >> +         * stop the icount counting. Just return the counter value
> written by
> >> +         * the supervisor to indicate that counter was not incremented.
> >> +         */
> >> +        if (!counter.started) {
> >> +            *val = ctr_val;
> >> +            return RISCV_EXCP_NONE;
> >> +        } else {
> >> +            /* Mark that the counter has been stopped */
> >> +            counter.started = false;
> >> +        }
> >> +    }
> >> +
> >> +
> >> +    /**
> >> +     * The kernel computes the perf delta by subtracting the current
> value from
> >> +     * the value it initialized previously (ctr_val).
> >> +     */
> >> +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> >> +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> >> +        *val = get_ticks(upper_half) - ctr_prev + ctr_val;
> >> +    } else {
> >> +        *val = ctr_val;
> >> +    }
> >>
> >>      return RISCV_EXCP_NONE;
> >>  }
> >>
> >>  static int read_hpmcounter(CPURISCVState *env, int csrno, target_ulong
> *val)
> >>  {
> >> -    int ctr_index;
> >> +    uint16_t ctr_index;
> >>
> >>      if (env->priv == PRV_M) {
> >> -        ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
> >> +        ctr_index = csrno - CSR_MCYCLE;
> >>
> >>      } else {
> >> -        ctr_index = csrno - CSR_HPMCOUNTER3 + 3;
> >> +        ctr_index = csrno - CSR_CYCLE;
> >>      }
> >
> >
> > Hi Atish,
> >
> > According to spec:
> > "The RDCYCLE pseudoinstruction reads the low XLEN bits of the cycle CSR
> > which holds a count of the number of clock cycles executed by the
> > processor core on which the hart is running from an arbitrary start time
> in the past."
> >
> > However, the counter index calculation here would have the issue.
> > For example, if RDCYCLE instruction is executed in M-mode:
> > CYCLE csrno is: 0xc00, but MCYCLE csrno is: 0xb00
> > "csrno - CSR_MCYCLE" would result in the invalidate value: 0x100,
> > which is out of the counter array's bound.
> >
>
> Why does somebody want to invoke RDCYCLE in M-mode ? IIRC, it's not
> used anywhere
> currently. I understand rdtime use case but don't know why do you want
> to run RDCYCLE.
>

Hi Atish,

That's just a random program and I think it tries to be portable in both
U-mode and M-mode.
Does RISC-V spec have any limitation on executing RDCYCLE instruction in
M-mode?

Regards,
Frank Chang


> > Will it be easier to just check against csrno instead of the current
> privileged mode?
> >
>
> Anyways, we can move to csrno range check to calculate the offset
> instead of the priv mode.
> I am fine with that. I just want to understand the use case. If it is
> just for completeness and cover
> edge cases, that's fine too.
>
> > And I think the same issue also occurs for:
> > HPMCOUNTER3 ~ HPMCOUNTER31.
>
> Again what is the use case for reading  HPMCOUNTER3-HPMCOUNTER31 in M-mode
> when you MHPMCOUNTERX available ?
>
> >
> > Regards,
> > Frank Chang
> >
> >>
> >> -    *val = env->mhpmcounter_val[ctr_index];
> >>
> >> -    return RISCV_EXCP_NONE;
> >> +    return riscv_pmu_read_ctr(env, val, false, ctr_index);
> >>  }
> >>
> >>  static int read_hpmcounterh(CPURISCVState *env, int csrno,
> target_ulong *val)
> >>  {
> >> -    int ctr_index;
> >> +    uint16_t ctr_index;
> >>
> >>      if (env->priv == PRV_M) {
> >> -        ctr_index = csrno - CSR_MHPMCOUNTER3H + 3;
> >> +        ctr_index = csrno - CSR_MCYCLEH;
> >>      } else {
> >> -        ctr_index = csrno - CSR_HPMCOUNTER3H + 3;
> >> +        ctr_index = csrno - CSR_CYCLEH;
> >>      }
> >>
> >> -    *val = env->mhpmcounterh_val[ctr_index];
> >> -
> >> -    return RISCV_EXCP_NONE;
> >> +    return riscv_pmu_read_ctr(env, val, true, ctr_index);
> >>  }
> >>
> >> -
> >>  static RISCVException read_time(CPURISCVState *env, int csrno,
> >>                                  target_ulong *val)
> >>  {
> >> @@ -1564,11 +1621,23 @@ static RISCVException
> read_mcountinhibit(CPURISCVState *env, int csrno,
> >>  static RISCVException write_mcountinhibit(CPURISCVState *env, int
> csrno,
> >>                                            target_ulong val)
> >>  {
> >> +    int cidx;
> >> +    PMUCTRState *counter;
> >> +
> >>      if (env->priv_ver < PRIV_VERSION_1_11_0) {
> >>          return RISCV_EXCP_ILLEGAL_INST;
> >>      }
> >>
> >>      env->mcountinhibit = val;
> >> +
> >> +    /* Check if any other counter is also monitoring
> cycles/instructions */
> >> +    for (cidx = 0; cidx < RV_MAX_MHPMCOUNTERS; cidx++) {
> >> +        if (!get_field(env->mcountinhibit, BIT(cidx))) {
> >> +            counter = &env->pmu_ctrs[cidx];
> >> +            counter->started = true;
> >> +        }
> >> +    }
> >> +
> >>      return RISCV_EXCP_NONE;
> >>  }
> >>
> >> @@ -3526,10 +3595,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >>      [CSR_VLENB]    = { "vlenb",    vs,    read_vlenb,
> >>                                            .min_priv_ver =
> PRIV_VERSION_1_12_0 },
> >>      /* User Timers and Counters */
> >> -    [CSR_CYCLE]    = { "cycle",    ctr,    read_instret  },
> >> -    [CSR_INSTRET]  = { "instret",  ctr,    read_instret  },
> >> -    [CSR_CYCLEH]   = { "cycleh",   ctr32,  read_instreth },
> >> -    [CSR_INSTRETH] = { "instreth", ctr32,  read_instreth },
> >> +    [CSR_CYCLE]    = { "cycle",    ctr,    read_hpmcounter  },
> >> +    [CSR_INSTRET]  = { "instret",  ctr,    read_hpmcounter  },
> >> +    [CSR_CYCLEH]   = { "cycleh",   ctr32,  read_hpmcounterh },
> >> +    [CSR_INSTRETH] = { "instreth", ctr32,  read_hpmcounterh },
> >>
> >>      /*
> >>       * In privileged mode, the monitor will have to emulate TIME CSRs
> only if
> >> @@ -3543,10 +3612,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >>
> >>  #if !defined(CONFIG_USER_ONLY)
> >>      /* Machine Timers and Counters */
> >> -    [CSR_MCYCLE]    = { "mcycle",    any,   read_instret  },
> >> -    [CSR_MINSTRET]  = { "minstret",  any,   read_instret  },
> >> -    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_instreth },
> >> -    [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
> >> +    [CSR_MCYCLE]    = { "mcycle",    any,   read_hpmcounter,
> write_mhpmcounter},
> >> +    [CSR_MINSTRET]  = { "minstret",  any,   read_hpmcounter,
> write_mhpmcounter},
> >> +    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_hpmcounterh,
> write_mhpmcounterh},
> >> +    [CSR_MINSTRETH] = { "minstreth", any32, read_hpmcounterh,
> write_mhpmcounterh},
> >>
> >>      /* Machine Information Registers */
> >>      [CSR_MVENDORID] = { "mvendorid", any,   read_mvendorid },
> >> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> >> index 99193c85bb97..dc182ca81119 100644
> >> --- a/target/riscv/machine.c
> >> +++ b/target/riscv/machine.c
> >> @@ -279,7 +279,28 @@ static const VMStateDescription vmstate_envcfg = {
> >>          VMSTATE_UINT64(env.menvcfg, RISCVCPU),
> >>          VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
> >>          VMSTATE_UINT64(env.henvcfg, RISCVCPU),
> >> +        VMSTATE_END_OF_LIST()
> >> +    }
> >> +};
> >> +
> >> +static bool pmu_needed(void *opaque)
> >> +{
> >> +    RISCVCPU *cpu = opaque;
> >>
> >> +    return cpu->cfg.pmu_num;
> >> +}
> >> +
> >> +static const VMStateDescription vmstate_pmu_ctr_state = {
> >> +    .name = "cpu/pmu",
> >> +    .version_id = 1,
> >> +    .minimum_version_id = 1,
> >> +    .needed = pmu_needed,
> >> +    .fields = (VMStateField[]) {
> >> +        VMSTATE_UINTTL(mhpmcounter_val, PMUCTRState),
> >> +        VMSTATE_UINTTL(mhpmcounterh_val, PMUCTRState),
> >> +        VMSTATE_UINTTL(mhpmcounter_prev, PMUCTRState),
> >> +        VMSTATE_UINTTL(mhpmcounterh_prev, PMUCTRState),
> >> +        VMSTATE_BOOL(started, PMUCTRState),
> >>          VMSTATE_END_OF_LIST()
> >>      }
> >>  };
> >> @@ -331,8 +352,8 @@ const VMStateDescription vmstate_riscv_cpu = {
> >>          VMSTATE_UINTTL(env.scounteren, RISCVCPU),
> >>          VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
> >>          VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
> >> -        VMSTATE_UINTTL_ARRAY(env.mhpmcounter_val, RISCVCPU,
> RV_MAX_MHPMCOUNTERS),
> >> -        VMSTATE_UINTTL_ARRAY(env.mhpmcounterh_val, RISCVCPU,
> RV_MAX_MHPMCOUNTERS),
> >> +        VMSTATE_STRUCT_ARRAY(env.pmu_ctrs, RISCVCPU,
> RV_MAX_MHPMCOUNTERS, 0,
> >> +                             vmstate_pmu_ctr_state, PMUCTRState),
> >>          VMSTATE_UINTTL_ARRAY(env.mhpmevent_val, RISCVCPU,
> RV_MAX_MHPMEVENTS),
> >>          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
> >>          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> >> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> >> index 096249f3a30f..2c1975e72c4e 100644
> >> --- a/target/riscv/meson.build
> >> +++ b/target/riscv/meson.build
> >> @@ -30,7 +30,8 @@ riscv_softmmu_ss.add(files(
> >>    'pmp.c',
> >>    'debug.c',
> >>    'monitor.c',
> >> -  'machine.c'
> >> +  'machine.c',
> >> +  'pmu.c'
> >>  ))
> >>
> >>  target_arch += {'riscv': riscv_ss}
> >> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> >> new file mode 100644
> >> index 000000000000..000fe8da45ef
> >> --- /dev/null
> >> +++ b/target/riscv/pmu.c
> >> @@ -0,0 +1,32 @@
> >> +/*
> >> + * RISC-V PMU file.
> >> + *
> >> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> >> + *
> >> + * This program is free software; you can redistribute it and/or
> modify it
> >> + * under the terms and conditions of the GNU General Public License,
> >> + * version 2 or later, as published by the Free Software Foundation.
> >> + *
> >> + * This program is distributed in the hope it will be useful, but
> WITHOUT
> >> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
> or
> >> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> >> + * more details.
> >> + *
> >> + * You should have received a copy of the GNU General Public License
> along with
> >> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> >> + */
> >> +
> >> +#include "qemu/osdep.h"
> >> +#include "cpu.h"
> >> +#include "pmu.h"
> >> +
> >> +bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
> >> +                                        uint32_t target_ctr)
> >> +{
> >> +    return (target_ctr == 0) ? true : false;
> >> +}
> >> +
> >> +bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t
> target_ctr)
> >> +{
> >> +    return (target_ctr == 2) ? true : false;
> >> +}
> >> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> >> new file mode 100644
> >> index 000000000000..58a5bc3a4089
> >> --- /dev/null
> >> +++ b/target/riscv/pmu.h
> >> @@ -0,0 +1,28 @@
> >> +/*
> >> + * RISC-V PMU header file.
> >> + *
> >> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> >> + *
> >> + * This program is free software; you can redistribute it and/or
> modify it
> >> + * under the terms and conditions of the GNU General Public License,
> >> + * version 2 or later, as published by the Free Software Foundation.
> >> + *
> >> + * This program is distributed in the hope it will be useful, but
> WITHOUT
> >> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
> or
> >> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> >> + * more details.
> >> + *
> >> + * You should have received a copy of the GNU General Public License
> along with
> >> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> >> + */
> >> +
> >> +#include "qemu/osdep.h"
> >> +#include "qemu/log.h"
> >> +#include "cpu.h"
> >> +#include "qemu/main-loop.h"
> >> +#include "exec/exec-all.h"
> >> +
> >> +bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
> >> +                                        uint32_t target_ctr);
> >> +bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
> >> +                                  uint32_t target_ctr);
> >> --
> >> 2.25.1
> >>
> >>
>

--00000000000051ff5f05def3fc87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, May 13, 2022 at 11:58 PM Atish Ku=
mar Patra &lt;<a href=3D"mailto:atishp@rivosinc.com">atishp@rivosinc.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Thu, May 12, 2022 at 11:29 PM Frank Chang &lt;<a=
 href=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifiv=
e.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, May 12, 2022 at 6:01 AM Atish Patra &lt;<a href=3D"mailto:atis=
hp@rivosinc.com" target=3D"_blank">atishp@rivosinc.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.com" targe=
t=3D"_blank">atish.patra@wdc.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; mcycle/minstret are actually WARL registers and can be written wit=
h any<br>
&gt;&gt; given value. With SBI PMU extension, it will be used to store a in=
itial<br>
&gt;&gt; value provided from supervisor OS. The Qemu also need prohibit the=
 counter<br>
&gt;&gt; increment if mcountinhibit is set.<br>
&gt;&gt;<br>
&gt;&gt; Support mcycle/minstret through generic counter infrastructure.<br=
>
&gt;&gt;<br>
&gt;&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.franc=
is@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.c=
om" target=3D"_blank">atish.patra@wdc.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.c=
om" target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 ++++=
--<br>
&gt;&gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 157 +++++++++=
+++++++++++++++++++-----------<br>
&gt;&gt;=C2=A0 target/riscv/machine.c=C2=A0 =C2=A0|=C2=A0 25 ++++++-<br>
&gt;&gt;=C2=A0 target/riscv/meson.build |=C2=A0 =C2=A03 +-<br>
&gt;&gt;=C2=A0 target/riscv/pmu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 32 ++++=
++++<br>
&gt;&gt;=C2=A0 target/riscv/pmu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 28 ++++=
+++<br>
&gt;&gt;=C2=A0 6 files changed, 214 insertions(+), 54 deletions(-)<br>
&gt;&gt;=C2=A0 create mode 100644 target/riscv/pmu.c<br>
&gt;&gt;=C2=A0 create mode 100644 target/riscv/pmu.h<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt;&gt; index 32cdd9070be5..f60072e0fd3d 100644<br>
&gt;&gt; --- a/target/riscv/cpu.h<br>
&gt;&gt; +++ b/target/riscv/cpu.h<br>
&gt;&gt; @@ -111,7 +111,7 @@ typedef struct CPUArchState CPURISCVState;<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #define RV_VLEN_MAX 1024<br>
&gt;&gt; -#define RV_MAX_MHPMEVENTS 29<br>
&gt;&gt; +#define RV_MAX_MHPMEVENTS 32<br>
&gt;&gt;=C2=A0 #define RV_MAX_MHPMCOUNTERS 32<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 FIELD(VTYPE, VLMUL, 0, 3)<br>
&gt;&gt; @@ -121,6 +121,18 @@ FIELD(VTYPE, VMA, 7, 1)<br>
&gt;&gt;=C2=A0 FIELD(VTYPE, VEDIV, 8, 2)<br>
&gt;&gt;=C2=A0 FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)<br=
>
&gt;&gt;<br>
&gt;&gt; +typedef struct PMUCTRState {<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Current value of a counter */<br>
&gt;&gt; +=C2=A0 =C2=A0 target_ulong mhpmcounter_val;<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Current value of a counter in RV32*/<br>
&gt;&gt; +=C2=A0 =C2=A0 target_ulong mhpmcounterh_val;<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Snapshot values of counter */<br>
&gt;&gt; +=C2=A0 =C2=A0 target_ulong mhpmcounter_prev;<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Snapshort value of a counter in RV32 */<br>
&gt;&gt; +=C2=A0 =C2=A0 target_ulong mhpmcounterh_prev;<br>
&gt;&gt; +=C2=A0 =C2=A0 bool started;<br>
&gt;&gt; +} PMUCTRState;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 struct CPUArchState {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong gpr[32];<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong gprh[32]; /* 64 top bits of the 1=
28-bit registers */<br>
&gt;&gt; @@ -273,13 +285,10 @@ struct CPUArchState {<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mcountinhibit;<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 /* PMU counter configured values */<br>
&gt;&gt; -=C2=A0 =C2=A0 target_ulong mhpmcounter_val[RV_MAX_MHPMCOUNTERS];<=
br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 /* for RV32 */<br>
&gt;&gt; -=C2=A0 =C2=A0 target_ulong mhpmcounterh_val[RV_MAX_MHPMCOUNTERS];=
<br>
&gt;&gt; +=C2=A0 =C2=A0 /* PMU counter state */<br>
&gt;&gt; +=C2=A0 =C2=A0 PMUCTRState pmu_ctrs[RV_MAX_MHPMCOUNTERS];<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 /* PMU event selector configured values */<br>
&gt;&gt; +=C2=A0 =C2=A0 /* PMU event selector configured values. First thre=
e are unused*/<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];=
<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 target_ulong sscratch;<br>
&gt;&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt;&gt; index 87aa601e5ddb..c050ed2e2c1b 100644<br>
&gt;&gt; --- a/target/riscv/csr.c<br>
&gt;&gt; +++ b/target/riscv/csr.c<br>
&gt;&gt; @@ -21,6 +21,7 @@<br>
&gt;&gt;=C2=A0 #include &quot;qemu/log.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu/timer.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;cpu.h&quot;<br>
&gt;&gt; +#include &quot;pmu.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu/main-loop.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;exec/exec-all.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;sysemu/cpu-timers.h&quot;<br>
&gt;&gt; @@ -597,34 +598,28 @@ static int write_vcsr(CPURISCVState *env, in=
t csrno, target_ulong val)<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 /* User Timers and Counters */<br>
&gt;&gt; -static RISCVException read_instret(CPURISCVState *env, int csrno,=
<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong =
*val)<br>
&gt;&gt; +static target_ulong get_ticks(bool shift)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 int64_t val;<br>
&gt;&gt; +=C2=A0 =C2=A0 target_ulong result;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #if !defined(CONFIG_USER_ONLY)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (icount_enabled()) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D icount_get();<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D icount_get();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D cpu_get_host_ticks();<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D cpu_get_host_ticks();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 #else<br>
&gt;&gt; -=C2=A0 =C2=A0 *val =3D cpu_get_host_ticks();<br>
&gt;&gt; +=C2=A0 =C2=A0 val =3D cpu_get_host_ticks();<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt; -}<br>
&gt;&gt;<br>
&gt;&gt; -static RISCVException read_instreth(CPURISCVState *env, int csrno=
,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong=
 *val)<br>
&gt;&gt; -{<br>
&gt;&gt; -#if !defined(CONFIG_USER_ONLY)<br>
&gt;&gt; -=C2=A0 =C2=A0 if (icount_enabled()) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D icount_get() &gt;&gt; 32;<br=
>
&gt;&gt; +=C2=A0 =C2=A0 if (shift) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D val &gt;&gt; 32;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D cpu_get_host_ticks() &gt;&gt=
; 32;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D val;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; -#else<br>
&gt;&gt; -=C2=A0 =C2=A0 *val =3D cpu_get_host_ticks() &gt;&gt; 32;<br>
&gt;&gt; -#endif<br>
&gt;&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 return result;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #if defined(CONFIG_USER_ONLY)<br>
&gt;&gt; @@ -642,11 +637,23 @@ static RISCVException read_timeh(CPURISCVSta=
te *env, int csrno,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; +static int read_hpmcounter(CPURISCVState *env, int csrno, target_=
ulong *val)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 *val =3D get_ticks(false);<br>
&gt;&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static int read_hpmcounterh(CPURISCVState *env, int csrno, target=
_ulong *val)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 *val =3D get_ticks(true);<br>
&gt;&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #else /* CONFIG_USER_ONLY */<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static int read_mhpmevent(CPURISCVState *env, int csrno, tar=
get_ulong *val)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; -=C2=A0 =C2=A0 int evt_index =3D csrno - CSR_MHPMEVENT3;<br>
&gt;&gt; +=C2=A0 =C2=A0 int evt_index =3D csrno - CSR_MCOUNTINHIBIT;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *val =3D env-&gt;mhpmevent_val[evt_index];<br>
&gt;&gt;<br>
&gt;&gt; @@ -655,7 +662,7 @@ static int read_mhpmevent(CPURISCVState *env, =
int csrno, target_ulong *val)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static int write_mhpmevent(CPURISCVState *env, int csrno, ta=
rget_ulong val)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; -=C2=A0 =C2=A0 int evt_index =3D csrno - CSR_MHPMEVENT3;<br>
&gt;&gt; +=C2=A0 =C2=A0 int evt_index =3D csrno - CSR_MCOUNTINHIBIT;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;mhpmevent_val[evt_index] =3D val;<br>
&gt;&gt;<br>
&gt;&gt; @@ -664,52 +671,102 @@ static int write_mhpmevent(CPURISCVState *e=
nv, int csrno, target_ulong val)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static int write_mhpmcounter(CPURISCVState *env, int csrno, =
target_ulong val)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; -=C2=A0 =C2=A0 int ctr_index =3D csrno - CSR_MHPMCOUNTER3 + 3;<br>
&gt;&gt; +=C2=A0 =C2=A0 int ctr_idx =3D csrno - CSR_MCYCLE;<br>
&gt;&gt; +=C2=A0 =C2=A0 PMUCTRState *counter =3D &amp;env-&gt;pmu_ctrs[ctr_=
idx];<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 env-&gt;mhpmcounter_val[ctr_index] =3D val;<br>
&gt;&gt; +=C2=A0 =C2=A0 counter-&gt;mhpmcounter_val =3D val;<br>
&gt;&gt; +=C2=A0 =C2=A0 if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_pmu_ctr_monitor_instructions(en=
v, ctr_idx)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounter_prev =3D get_=
ticks(false);<br>
&gt;&gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Other counters can keep incrementi=
ng from the given value */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounter_prev =3D val;=
<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static int write_mhpmcounterh(CPURISCVState *env, int csrno,=
 target_ulong val)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; -=C2=A0 =C2=A0 int ctr_index =3D csrno - CSR_MHPMCOUNTER3H + 3;<br=
>
&gt;&gt; +=C2=A0 =C2=A0 int ctr_idx =3D csrno - CSR_MCYCLEH;<br>
&gt;&gt; +=C2=A0 =C2=A0 PMUCTRState *counter =3D &amp;env-&gt;pmu_ctrs[ctr_=
idx];<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 env-&gt;mhpmcounterh_val[ctr_index] =3D val;<br>
&gt;&gt; +=C2=A0 =C2=A0 counter-&gt;mhpmcounterh_val =3D val;<br>
&gt;&gt; +=C2=A0 =C2=A0 if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_pmu_ctr_monitor_instructions(en=
v, ctr_idx)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounterh_prev =3D get=
_ticks(true);<br>
&gt;&gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounterh_prev =3D val=
;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, targ=
et_ulong *val,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bool upper_half, uint32_t ctr_idx)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 PMUCTRState counter =3D env-&gt;pmu_ctrs[ctr_idx];<=
br>
&gt;&gt; +=C2=A0 =C2=A0 target_ulong ctr_prev =3D upper_half ? counter.mhpm=
counterh_prev :<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0counter.mhpmcounter_prev;<br>
&gt;&gt; +=C2=A0 =C2=A0 target_ulong ctr_val =3D upper_half ? counter.mhpmc=
ounterh_val :<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 counter.mhpmcounter_val;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 if (get_field(env-&gt;mcountinhibit, BIT(ctr_idx)))=
 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /**<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Counter should not increment =
if inhibit bit is set. We can&#39;t really<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* stop the icount counting. Jus=
t return the counter value written by<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the supervisor to indicate th=
at counter was not incremented.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!counter.started) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D ctr_val;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Mark that the counte=
r has been stopped */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter.started =3D fal=
se;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /**<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* The kernel computes the perf delta by subtr=
acting the current value from<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* the value it initialized previously (ctr_va=
l).<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; +=C2=A0 =C2=A0 if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_pmu_ctr_monitor_instructions(en=
v, ctr_idx)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D get_ticks(upper_half) - ctr_=
prev + ctr_val;<br>
&gt;&gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D ctr_val;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static int read_hpmcounter(CPURISCVState *env, int csrno, ta=
rget_ulong *val)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; -=C2=A0 =C2=A0 int ctr_index;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint16_t ctr_index;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_M) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_MHPMCOUNTER=
3 + 3;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_MCYCLE;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_HPMCOUNTER3=
 + 3;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_CYCLE;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;<br>
&gt; Hi Atish,<br>
&gt;<br>
&gt; According to spec:<br>
&gt; &quot;The RDCYCLE pseudoinstruction reads the low XLEN bits of the cyc=
le CSR<br>
&gt; which holds a count of the number of clock cycles executed by the<br>
&gt; processor core on which the hart is running from an arbitrary start ti=
me in the past.&quot;<br>
&gt;<br>
&gt; However, the counter index calculation here would have the issue.<br>
&gt; For example, if RDCYCLE instruction is executed in M-mode:<br>
&gt; CYCLE csrno is: 0xc00, but MCYCLE csrno is: 0xb00<br>
&gt; &quot;csrno - CSR_MCYCLE&quot; would result in the invalidate value: 0=
x100,<br>
&gt; which is out of the counter array&#39;s bound.<br>
&gt;<br>
<br>
Why does somebody want to invoke RDCYCLE in M-mode ? IIRC, it&#39;s not<br>
used anywhere<br>
currently. I understand rdtime use case but don&#39;t know why do you want<=
br>
to run RDCYCLE.<br></blockquote><div><br></div><div>Hi Atish,</div><div><br=
></div><div>That&#39;s just a random program and I think it tries to be por=
table in both U-mode and M-mode.<br></div><div>Does RISC-V spec have any li=
mitation on executing RDCYCLE instruction in M-mode?</div><div><br></div><d=
iv>Regards,</div><div>Frank Chang</div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt; Will it be easier to just check against csrno instead of the current p=
rivileged mode?<br>
&gt;<br>
<br>
Anyways, we can move to csrno range check to calculate the offset<br>
instead of the priv mode.<br>
I am fine with that. I just want to understand the use case. If it is<br>
just for completeness and cover<br>
edge cases, that&#39;s fine too.<br>
<br>
&gt; And I think the same issue also occurs for:<br>
&gt; HPMCOUNTER3 ~ HPMCOUNTER31.<br>
<br>
Again what is the use case for reading=C2=A0 HPMCOUNTER3-HPMCOUNTER31 in M-=
mode<br>
when you MHPMCOUNTERX available ?<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Frank Chang<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 *val =3D env-&gt;mhpmcounter_val[ctr_index];<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt; +=C2=A0 =C2=A0 return riscv_pmu_read_ctr(env, val, false, ctr_inde=
x);<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static int read_hpmcounterh(CPURISCVState *env, int csrno, t=
arget_ulong *val)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; -=C2=A0 =C2=A0 int ctr_index;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint16_t ctr_index;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_M) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_MHPMCOUNTER=
3H + 3;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_MCYCLEH;<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_HPMCOUNTER3=
H + 3;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_CYCLEH;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 *val =3D env-&gt;mhpmcounterh_val[ctr_index];<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt; +=C2=A0 =C2=A0 return riscv_pmu_read_ctr(env, val, true, ctr_index=
);<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 static RISCVException read_time(CPURISCVState *env, int csrn=
o,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; @@ -1564,11 +1621,23 @@ static RISCVException read_mcountinhibit(C=
PURISCVState *env, int csrno,<br>
&gt;&gt;=C2=A0 static RISCVException write_mcountinhibit(CPURISCVState *env=
, int csrno,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 target_ulong val)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 int cidx;<br>
&gt;&gt; +=C2=A0 =C2=A0 PMUCTRState *counter;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv_ver &lt; PRIV_VERSION_1_11_0)=
 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;mcountinhibit =3D val;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Check if any other counter is also monitoring cy=
cles/instructions */<br>
&gt;&gt; +=C2=A0 =C2=A0 for (cidx =3D 0; cidx &lt; RV_MAX_MHPMCOUNTERS; cid=
x++) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(env-&gt;mcountinhibit,=
 BIT(cidx))) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter =3D &amp;env-&g=
t;pmu_ctrs[cidx];<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;started =3D=
 true;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; @@ -3526,10 +3595,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZ=
E] =3D {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 [CSR_VLENB]=C2=A0 =C2=A0 =3D { &quot;vlenb&quo=
t;,=C2=A0 =C2=A0 vs,=C2=A0 =C2=A0 read_vlenb,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 .min_priv_ver =3D PRIV_VERSION_1_12_0 },<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* User Timers and Counters */<br>
&gt;&gt; -=C2=A0 =C2=A0 [CSR_CYCLE]=C2=A0 =C2=A0 =3D { &quot;cycle&quot;,=
=C2=A0 =C2=A0 ctr,=C2=A0 =C2=A0 read_instret=C2=A0 },<br>
&gt;&gt; -=C2=A0 =C2=A0 [CSR_INSTRET]=C2=A0 =3D { &quot;instret&quot;,=C2=
=A0 ctr,=C2=A0 =C2=A0 read_instret=C2=A0 },<br>
&gt;&gt; -=C2=A0 =C2=A0 [CSR_CYCLEH]=C2=A0 =C2=A0=3D { &quot;cycleh&quot;,=
=C2=A0 =C2=A0ctr32,=C2=A0 read_instreth },<br>
&gt;&gt; -=C2=A0 =C2=A0 [CSR_INSTRETH] =3D { &quot;instreth&quot;, ctr32,=
=C2=A0 read_instreth },<br>
&gt;&gt; +=C2=A0 =C2=A0 [CSR_CYCLE]=C2=A0 =C2=A0 =3D { &quot;cycle&quot;,=
=C2=A0 =C2=A0 ctr,=C2=A0 =C2=A0 read_hpmcounter=C2=A0 },<br>
&gt;&gt; +=C2=A0 =C2=A0 [CSR_INSTRET]=C2=A0 =3D { &quot;instret&quot;,=C2=
=A0 ctr,=C2=A0 =C2=A0 read_hpmcounter=C2=A0 },<br>
&gt;&gt; +=C2=A0 =C2=A0 [CSR_CYCLEH]=C2=A0 =C2=A0=3D { &quot;cycleh&quot;,=
=C2=A0 =C2=A0ctr32,=C2=A0 read_hpmcounterh },<br>
&gt;&gt; +=C2=A0 =C2=A0 [CSR_INSTRETH] =3D { &quot;instreth&quot;, ctr32,=
=C2=A0 read_hpmcounterh },<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* In privileged mode, the monitor will h=
ave to emulate TIME CSRs only if<br>
&gt;&gt; @@ -3543,10 +3612,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZ=
E] =3D {<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #if !defined(CONFIG_USER_ONLY)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* Machine Timers and Counters */<br>
&gt;&gt; -=C2=A0 =C2=A0 [CSR_MCYCLE]=C2=A0 =C2=A0 =3D { &quot;mcycle&quot;,=
=C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_instret=C2=A0 },<br>
&gt;&gt; -=C2=A0 =C2=A0 [CSR_MINSTRET]=C2=A0 =3D { &quot;minstret&quot;,=C2=
=A0 any,=C2=A0 =C2=A0read_instret=C2=A0 },<br>
&gt;&gt; -=C2=A0 =C2=A0 [CSR_MCYCLEH]=C2=A0 =C2=A0=3D { &quot;mcycleh&quot;=
,=C2=A0 =C2=A0any32, read_instreth },<br>
&gt;&gt; -=C2=A0 =C2=A0 [CSR_MINSTRETH] =3D { &quot;minstreth&quot;, any32,=
 read_instreth },<br>
&gt;&gt; +=C2=A0 =C2=A0 [CSR_MCYCLE]=C2=A0 =C2=A0 =3D { &quot;mcycle&quot;,=
=C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_hpmcounter, write_mhpmcounter},<br>
&gt;&gt; +=C2=A0 =C2=A0 [CSR_MINSTRET]=C2=A0 =3D { &quot;minstret&quot;,=C2=
=A0 any,=C2=A0 =C2=A0read_hpmcounter, write_mhpmcounter},<br>
&gt;&gt; +=C2=A0 =C2=A0 [CSR_MCYCLEH]=C2=A0 =C2=A0=3D { &quot;mcycleh&quot;=
,=C2=A0 =C2=A0any32, read_hpmcounterh, write_mhpmcounterh},<br>
&gt;&gt; +=C2=A0 =C2=A0 [CSR_MINSTRETH] =3D { &quot;minstreth&quot;, any32,=
 read_hpmcounterh, write_mhpmcounterh},<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* Machine Information Registers */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 [CSR_MVENDORID] =3D { &quot;mvendorid&quot;, a=
ny,=C2=A0 =C2=A0read_mvendorid },<br>
&gt;&gt; diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
&gt;&gt; index 99193c85bb97..dc182ca81119 100644<br>
&gt;&gt; --- a/target/riscv/machine.c<br>
&gt;&gt; +++ b/target/riscv/machine.c<br>
&gt;&gt; @@ -279,7 +279,28 @@ static const VMStateDescription vmstate_envcf=
g =3D {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.menvcfg, RISC=
VCPU),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.senvcfg, RISC=
VCPU),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.henvcfg, RISC=
VCPU),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +};<br>
&gt;&gt; +<br>
&gt;&gt; +static bool pmu_needed(void *opaque)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D opaque;<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 return cpu-&gt;cfg.pmu_num;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static const VMStateDescription vmstate_pmu_ctr_state =3D {<br>
&gt;&gt; +=C2=A0 =C2=A0 .name =3D &quot;cpu/pmu&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 .version_id =3D 1,<br>
&gt;&gt; +=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
&gt;&gt; +=C2=A0 =C2=A0 .needed =3D pmu_needed,<br>
&gt;&gt; +=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(mhpmcounter_val, PMUCT=
RState),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(mhpmcounterh_val, PMUC=
TRState),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(mhpmcounter_prev, PMUC=
TRState),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(mhpmcounterh_prev, PMU=
CTRState),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_BOOL(started, PMUCTRState),<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 };<br>
&gt;&gt; @@ -331,8 +352,8 @@ const VMStateDescription vmstate_riscv_cpu =3D=
 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.scounteren, R=
ISCVCPU),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.mcounteren, R=
ISCVCPU),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.mcountinhibit=
, RISCVCPU),<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL_ARRAY(env.mhpmcounter_=
val, RISCVCPU, RV_MAX_MHPMCOUNTERS),<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL_ARRAY(env.mhpmcounterh=
_val, RISCVCPU, RV_MAX_MHPMCOUNTERS),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_STRUCT_ARRAY(env.pmu_ctrs, RI=
SCVCPU, RV_MAX_MHPMCOUNTERS, 0,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmstate_pmu_ctr_state, PMUCTRState=
),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL_ARRAY(env.mhpmeve=
nt_val, RISCVCPU, RV_MAX_MHPMEVENTS),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.sscratch, RIS=
CVCPU),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.mscratch, RIS=
CVCPU),<br>
&gt;&gt; diff --git a/target/riscv/meson.build b/target/riscv/meson.build<b=
r>
&gt;&gt; index 096249f3a30f..2c1975e72c4e 100644<br>
&gt;&gt; --- a/target/riscv/meson.build<br>
&gt;&gt; +++ b/target/riscv/meson.build<br>
&gt;&gt; @@ -30,7 +30,8 @@ riscv_softmmu_ss.add(files(<br>
&gt;&gt;=C2=A0 =C2=A0 &#39;pmp.c&#39;,<br>
&gt;&gt;=C2=A0 =C2=A0 &#39;debug.c&#39;,<br>
&gt;&gt;=C2=A0 =C2=A0 &#39;monitor.c&#39;,<br>
&gt;&gt; -=C2=A0 &#39;machine.c&#39;<br>
&gt;&gt; +=C2=A0 &#39;machine.c&#39;,<br>
&gt;&gt; +=C2=A0 &#39;pmu.c&#39;<br>
&gt;&gt;=C2=A0 ))<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 target_arch +=3D {&#39;riscv&#39;: riscv_ss}<br>
&gt;&gt; diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 000000000000..000fe8da45ef<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/target/riscv/pmu.c<br>
&gt;&gt; @@ -0,0 +1,32 @@<br>
&gt;&gt; +/*<br>
&gt;&gt; + * RISC-V PMU file.<br>
&gt;&gt; + *<br>
&gt;&gt; + * Copyright (c) 2021 Western Digital Corporation or its affiliat=
es.<br>
&gt;&gt; + *<br>
&gt;&gt; + * This program is free software; you can redistribute it and/or =
modify it<br>
&gt;&gt; + * under the terms and conditions of the GNU General Public Licen=
se,<br>
&gt;&gt; + * version 2 or later, as published by the Free Software Foundati=
on.<br>
&gt;&gt; + *<br>
&gt;&gt; + * This program is distributed in the hope it will be useful, but=
 WITHOUT<br>
&gt;&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABI=
LITY or<br>
&gt;&gt; + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Pu=
blic License for<br>
&gt;&gt; + * more details.<br>
&gt;&gt; + *<br>
&gt;&gt; + * You should have received a copy of the GNU General Public Lice=
nse along with<br>
&gt;&gt; + * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.=
org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/lice=
nses/</a>&gt;.<br>
&gt;&gt; + */<br>
&gt;&gt; +<br>
&gt;&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; +#include &quot;cpu.h&quot;<br>
&gt;&gt; +#include &quot;pmu.h&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 uint32_t target_ctr)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 return (target_ctr =3D=3D 0) ? true : false;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t ta=
rget_ctr)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 return (target_ctr =3D=3D 2) ? true : false;<br>
&gt;&gt; +}<br>
&gt;&gt; diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 000000000000..58a5bc3a4089<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/target/riscv/pmu.h<br>
&gt;&gt; @@ -0,0 +1,28 @@<br>
&gt;&gt; +/*<br>
&gt;&gt; + * RISC-V PMU header file.<br>
&gt;&gt; + *<br>
&gt;&gt; + * Copyright (c) 2021 Western Digital Corporation or its affiliat=
es.<br>
&gt;&gt; + *<br>
&gt;&gt; + * This program is free software; you can redistribute it and/or =
modify it<br>
&gt;&gt; + * under the terms and conditions of the GNU General Public Licen=
se,<br>
&gt;&gt; + * version 2 or later, as published by the Free Software Foundati=
on.<br>
&gt;&gt; + *<br>
&gt;&gt; + * This program is distributed in the hope it will be useful, but=
 WITHOUT<br>
&gt;&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABI=
LITY or<br>
&gt;&gt; + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Pu=
blic License for<br>
&gt;&gt; + * more details.<br>
&gt;&gt; + *<br>
&gt;&gt; + * You should have received a copy of the GNU General Public Lice=
nse along with<br>
&gt;&gt; + * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.=
org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/lice=
nses/</a>&gt;.<br>
&gt;&gt; + */<br>
&gt;&gt; +<br>
&gt;&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; +#include &quot;qemu/log.h&quot;<br>
&gt;&gt; +#include &quot;cpu.h&quot;<br>
&gt;&gt; +#include &quot;qemu/main-loop.h&quot;<br>
&gt;&gt; +#include &quot;exec/exec-all.h&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 uint32_t target_ctr);<br>
&gt;&gt; +bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t target_ctr=
);<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
</blockquote></div></div>

--00000000000051ff5f05def3fc87--

