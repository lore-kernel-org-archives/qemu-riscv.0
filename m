Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOvmj-0003SA-Vo
	for mharc-qemu-riscv@gnu.org; Tue, 01 Mar 2022 01:14:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nOvmi-0003Rq-Hl; Tue, 01 Mar 2022 01:14:56 -0500
Received: from [2607:f8b0:4864:20::d32] (port=36511
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nOvmf-00087r-G1; Tue, 01 Mar 2022 01:14:55 -0500
Received: by mail-io1-xd32.google.com with SMTP id r7so17396005iot.3;
 Mon, 28 Feb 2022 22:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gbDVw0qVmBpvw7E6fKYjFZ2aeorxCXlHe9VALgPiXTs=;
 b=MvZRO58Aa0JeiUBxqoGVq7+uMZYoSeIo5rF247CJsS+ZFZYUaoin9Miy+Rii/eo7vC
 AyWQgm14WFUr4O0b50K6RXxeMrZkPy7F17Tp624y2pyPMUeZr1b55ipHdQwlg7o9UOsB
 MvHMNVB9m2rEA3GohEOyR2mJ64WAS5/dx4yYo7iYCwuYHT5sMTZx4XxfJonbVYhiYfyu
 kV9U1go7SUwxZnqExMihV0qSJM0KI+5VxAW9K/0by6NC/LF1Cv4dKjKtgytrCjFDvbNC
 qhQ3CQpIgZ5EFnqCTawRVcypQezJQ5nF8tjeBSQA2O9a6lbWRFaHC9bO5ycmaA6sOR4Q
 il0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gbDVw0qVmBpvw7E6fKYjFZ2aeorxCXlHe9VALgPiXTs=;
 b=qbCZBCopWdUxDYYFMCKjgLRxxQ7MrrPPu7X9Zx7aK/LO6BhA39mPhaMopOaMjUOrZe
 j/Oh6VWWC5dGTmfoF2o8OYBLHlRBaMGSs08+tOgvKDd2SLSD8qNSUZqAF2V5NDkAqZrV
 GPY3ZVhXh3cM/RMbw22rJ6WncK6AXCWFYeDt8zbuJ+NN5S6Fx6eYFTE3vdk8uz9hFB68
 1zj+vySRWOsI4WiaWt9scW9srDWf5qzrn1Mp/p1ZSv5O+ZO+558Nys7fswEwXFphHRK5
 chI6zdoIwNt6b2d1HKcWx4p0DdWKQy6B6X0Z/60otLJN3TbD3G8Q6471PHoJcMYsuIz5
 E8Jw==
X-Gm-Message-State: AOAM532xP+bmxhWCo2oLXnHvqiLVVU8dKKykGXxnQc55Vr/hleDfTNEJ
 4zTXeBaAkgi6zLc3zdcWh2o+Xm9jAJJKCtm4lcM=
X-Google-Smtp-Source: ABdhPJx52rQgaxUg2GOg7eXMhSDQEA27zz3npWDXaiab7qHwj1/WsQJpMT5P+CmrXrzPsP33dNVoa+RVA7PBsF2qebI=
X-Received: by 2002:a6b:d60a:0:b0:63a:be64:c652 with SMTP id
 w10-20020a6bd60a000000b0063abe64c652mr18322193ioa.27.1646115291398; Mon, 28
 Feb 2022 22:14:51 -0800 (PST)
MIME-Version: 1.0
References: <20220219002518.1936806-1-atishp@rivosinc.com>
 <20220219002518.1936806-8-atishp@rivosinc.com>
In-Reply-To: <20220219002518.1936806-8-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Mar 2022 16:14:24 +1000
Message-ID: <CAKmqyKN0DTiPNs_gn4Z+RCViDSFGpXZw1wFX5s57zNg1caLzug@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] target/riscv: Support mcycle/minstret write
 operation
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 01 Mar 2022 06:14:56 -0000

On Sat, Feb 19, 2022 at 10:32 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> From: Atish Patra <atish.patra@wdc.com>
>
> mcycle/minstret are actually WARL registers and can be written with any
> given value. With SBI PMU extension, it will be used to store a initial
> value provided from supervisor OS. The Qemu also need prohibit the counter
> increment if mcountinhibit is set.
>
> Support mcycle/minstret through generic counter infrastructure.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/cpu.h       |  23 +++++--
>  target/riscv/csr.c       | 145 +++++++++++++++++++++++++++------------
>  target/riscv/machine.c   |  25 ++++++-
>  target/riscv/meson.build |   1 +
>  target/riscv/pmu.c       |  32 +++++++++
>  target/riscv/pmu.h       |  28 ++++++++
>  6 files changed, 201 insertions(+), 53 deletions(-)
>  create mode 100644 target/riscv/pmu.c
>  create mode 100644 target/riscv/pmu.h
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index cce5c3538c89..68522acda4d2 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -109,7 +109,7 @@ typedef struct CPURISCVState CPURISCVState;
>  #endif
>
>  #define RV_VLEN_MAX 1024
> -#define RV_MAX_MHPMEVENTS 29
> +#define RV_MAX_MHPMEVENTS 32
>  #define RV_MAX_MHPMCOUNTERS 32
>
>  FIELD(VTYPE, VLMUL, 0, 3)
> @@ -119,6 +119,18 @@ FIELD(VTYPE, VMA, 7, 1)
>  FIELD(VTYPE, VEDIV, 8, 2)
>  FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
>
> +typedef struct PMUCTRState {
> +    /* Current value of a counter */
> +    target_ulong mhpmcounter_val;
> +    /* Current value of a counter in RV32*/
> +    target_ulong mhpmcounterh_val;
> +    /* Snapshot values of counter */
> +    target_ulong mhpmcounter_prev;
> +    /* Snapshort value of a counter in RV32 */
> +    target_ulong mhpmcounterh_prev;
> +    bool started;
> +} PMUCTRState;
> +
>  struct CPURISCVState {
>      target_ulong gpr[32];
>      target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
> @@ -263,13 +275,10 @@ struct CPURISCVState {
>
>      target_ulong mcountinhibit;
>
> -    /* PMU counter configured values */
> -    target_ulong mhpmcounter_val[RV_MAX_MHPMCOUNTERS];
> -
> -    /* for RV32 */
> -    target_ulong mhpmcounterh_val[RV_MAX_MHPMCOUNTERS];
> +    /* PMU counter state */
> +    PMUCTRState pmu_ctrs[RV_MAX_MHPMCOUNTERS];
>
> -    /* PMU event selector configured values */
> +    /* PMU event selector configured values. First three are unused*/
>      target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
>
>      target_ulong sscratch;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index dbb723a3307b..dc4d258205b3 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -20,6 +20,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "cpu.h"
> +#include "pmu.h"
>  #include "qemu/main-loop.h"
>  #include "exec/exec-all.h"
>
> @@ -539,39 +540,33 @@ static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
>  }
>
>  /* User Timers and Counters */
> -static RISCVException read_instret(CPURISCVState *env, int csrno,
> -                                   target_ulong *val)
> +static target_ulong get_icount_ticks(bool rv32)

Maybe get_ticks() instead?

Also rv32 could be something more descriptive, maybe just shift instead?

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>  {
> +    int64_t val;
> +    target_ulong result;
> +
>  #if !defined(CONFIG_USER_ONLY)
>      if (icount_enabled()) {
> -        *val = icount_get();
> +        val = icount_get();
>      } else {
> -        *val = cpu_get_host_ticks();
> +        val = cpu_get_host_ticks();
>      }
>  #else
> -    *val = cpu_get_host_ticks();
> +    val = cpu_get_host_ticks();
>  #endif
> -    return RISCV_EXCP_NONE;
> -}
>
> -static RISCVException read_instreth(CPURISCVState *env, int csrno,
> -                                    target_ulong *val)
> -{
> -#if !defined(CONFIG_USER_ONLY)
> -    if (icount_enabled()) {
> -        *val = icount_get() >> 32;
> +    if (rv32) {
> +        result = val >> 32;
>      } else {
> -        *val = cpu_get_host_ticks() >> 32;
> +        result = val;
>      }
> -#else
> -    *val = cpu_get_host_ticks() >> 32;
> -#endif
> -    return RISCV_EXCP_NONE;
> +
> +    return result;
>  }
>
>  static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> -    int evt_index = csrno - CSR_MHPMEVENT3;
> +    int evt_index = csrno - CSR_MCOUNTINHIBIT;
>
>      *val = env->mhpmevent_val[evt_index];
>
> @@ -580,7 +575,7 @@ static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
>
>  static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    int evt_index = csrno - CSR_MHPMEVENT3;
> +    int evt_index = csrno - CSR_MCOUNTINHIBIT;
>
>      env->mhpmevent_val[evt_index] = val;
>
> @@ -589,52 +584,102 @@ static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
>
>  static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    int ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
> +    int ctr_idx = csrno - CSR_MCYCLE;
> +    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
>
> -    env->mhpmcounter_val[ctr_index] = val;
> +    counter->mhpmcounter_val = val;
> +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> +        counter->mhpmcounter_prev = get_icount_ticks(false);
> +    } else {
> +        /* Other counters can keep incrementing from the given value */
> +        counter->mhpmcounter_prev = val;
> +    }
>
>      return RISCV_EXCP_NONE;
>  }
>
>  static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    int ctr_index = csrno - CSR_MHPMCOUNTER3H + 3;
> +    int ctr_idx = csrno - CSR_MCYCLEH;
> +    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
>
> -    env->mhpmcounterh_val[ctr_index] = val;
> +    counter->mhpmcounterh_val = val;
> +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> +        counter->mhpmcounterh_prev = get_icount_ticks(true);
> +    } else {
> +        counter->mhpmcounterh_prev = val;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
> +                                         bool upper_half, uint32_t ctr_idx)
> +{
> +    PMUCTRState counter = env->pmu_ctrs[ctr_idx];
> +    target_ulong ctr_prev = upper_half ? counter.mhpmcounterh_prev :
> +                                         counter.mhpmcounter_prev;
> +    target_ulong ctr_val = upper_half ? counter.mhpmcounterh_val :
> +                                        counter.mhpmcounter_val;
> +
> +    if (get_field(env->mcountinhibit, BIT(ctr_idx))) {
> +        /**
> +         * Counter should not increment if inhibit bit is set. We can't really
> +         * stop the icount counting. Just return the counter value written by
> +         * the supervisor to indicate that counter was not incremented.
> +         */
> +        if (!counter.started) {
> +            *val = ctr_val;
> +            return RISCV_EXCP_NONE;
> +        } else {
> +            /* Mark that the counter has been stopped */
> +            counter.started = false;
> +        }
> +    }
> +
> +
> +    /**
> +     * The kernel computes the perf delta by subtracting the current value from
> +     * the value it initialized previously (ctr_val).
> +     */
> +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> +        *val = get_icount_ticks(upper_half) - ctr_prev + ctr_val;
> +    } else {
> +        *val = ctr_val;
> +    }
>
>      return RISCV_EXCP_NONE;
>  }
>
>  static int read_hpmcounter(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> -    int ctr_index;
> +    uint16_t ctr_index;
>
>      if (env->priv == PRV_M) {
> -        ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
> +        ctr_index = csrno - CSR_MCYCLE;
>      } else {
> -        ctr_index = csrno - CSR_HPMCOUNTER3 + 3;
> +        ctr_index = csrno - CSR_CYCLE;
>      }
> -    *val = env->mhpmcounter_val[ctr_index];
>
> -    return RISCV_EXCP_NONE;
> +    return riscv_pmu_read_ctr(env, val, false, ctr_index);
>  }
>
>  static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> -    int ctr_index;
> +    uint16_t ctr_index;
>
>      if (env->priv == PRV_M) {
> -        ctr_index = csrno - CSR_MHPMCOUNTER3H + 3;
> +        ctr_index = csrno - CSR_MCYCLEH;
>      } else {
> -        ctr_index = csrno - CSR_HPMCOUNTER3H + 3;
> +        ctr_index = csrno - CSR_CYCLEH;
>      }
>
> -    *val = env->mhpmcounterh_val[ctr_index];
> -
> -    return RISCV_EXCP_NONE;
> +    return riscv_pmu_read_ctr(env, val, true, ctr_index);
>  }
>
> -
>  #if defined(CONFIG_USER_ONLY)
>  static RISCVException read_time(CPURISCVState *env, int csrno,
>                                  target_ulong *val)
> @@ -1468,11 +1513,23 @@ static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
>  static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
>                                            target_ulong val)
>  {
> +    int cidx;
> +    PMUCTRState *counter;
> +
>      if (env->priv_ver < PRIV_VERSION_1_11_0) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
>      env->mcountinhibit = val;
> +
> +    /* Check if any other counter is also monitoring cycles/instructions */
> +    for (cidx = 0; cidx < RV_MAX_MHPMCOUNTERS; cidx++) {
> +        if (!get_field(env->mcountinhibit, BIT(cidx))) {
> +            counter = &env->pmu_ctrs[cidx];
> +            counter->started = true;
> +        }
> +    }
> +
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -3347,10 +3404,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_VLENB]    = { "vlenb",    vs,    read_vlenb,
>                                            .min_priv_ver = PRIV_VERSION_1_12_0 },
>      /* User Timers and Counters */
> -    [CSR_CYCLE]    = { "cycle",    ctr,    read_instret  },
> -    [CSR_INSTRET]  = { "instret",  ctr,    read_instret  },
> -    [CSR_CYCLEH]   = { "cycleh",   ctr32,  read_instreth },
> -    [CSR_INSTRETH] = { "instreth", ctr32,  read_instreth },
> +    [CSR_CYCLE]    = { "cycle",    ctr,    read_hpmcounter  },
> +    [CSR_INSTRET]  = { "instret",  ctr,    read_hpmcounter  },
> +    [CSR_CYCLEH]   = { "cycleh",   ctr32,  read_hpmcounterh },
> +    [CSR_INSTRETH] = { "instreth", ctr32,  read_hpmcounterh },
>
>      /*
>       * In privileged mode, the monitor will have to emulate TIME CSRs only if
> @@ -3361,10 +3418,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>
>  #if !defined(CONFIG_USER_ONLY)
>      /* Machine Timers and Counters */
> -    [CSR_MCYCLE]    = { "mcycle",    any,   read_instret  },
> -    [CSR_MINSTRET]  = { "minstret",  any,   read_instret  },
> -    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_instreth },
> -    [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
> +    [CSR_MCYCLE]    = { "mcycle",    any,   read_hpmcounter, write_mhpmcounter},
> +    [CSR_MINSTRET]  = { "minstret",  any,   read_hpmcounter, write_mhpmcounter},
> +    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_hpmcounterh, write_mhpmcounterh},
> +    [CSR_MINSTRETH] = { "minstreth", any32, read_hpmcounterh, write_mhpmcounterh},
>
>      /* Machine Information Registers */
>      [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 042d655ce3ef..1f2186935666 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -248,7 +248,28 @@ static const VMStateDescription vmstate_envcfg = {
>          VMSTATE_UINT64(env.menvcfg, RISCVCPU),
>          VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
>          VMSTATE_UINT64(env.henvcfg, RISCVCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static bool pmu_needed(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
>
> +    return cpu->cfg.pmu_num;
> +}
> +
> +static const VMStateDescription vmstate_pmu_ctr_state = {
> +    .name = "cpu/pmu",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = pmu_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINTTL(mhpmcounter_val, PMUCTRState),
> +        VMSTATE_UINTTL(mhpmcounterh_val, PMUCTRState),
> +        VMSTATE_UINTTL(mhpmcounter_prev, PMUCTRState),
> +        VMSTATE_UINTTL(mhpmcounterh_prev, PMUCTRState),
> +        VMSTATE_BOOL(started, PMUCTRState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> @@ -300,8 +321,8 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINTTL(env.scounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
> -        VMSTATE_UINTTL_ARRAY(env.mhpmcounter_val, RISCVCPU, RV_MAX_MHPMCOUNTERS),
> -        VMSTATE_UINTTL_ARRAY(env.mhpmcounterh_val, RISCVCPU, RV_MAX_MHPMCOUNTERS),
> +        VMSTATE_STRUCT_ARRAY(env.pmu_ctrs, RISCVCPU, RV_MAX_MHPMCOUNTERS, 0,
> +                             vmstate_pmu_ctr_state, PMUCTRState),
>          VMSTATE_UINTTL_ARRAY(env.mhpmevent_val, RISCVCPU, RV_MAX_MHPMEVENTS),
>          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
>          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 91f0ac32ff3d..b41967b8c54a 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -27,6 +27,7 @@ riscv_softmmu_ss = ss.source_set()
>  riscv_softmmu_ss.add(files(
>    'arch_dump.c',
>    'pmp.c',
> +  'pmu.c',
>    'monitor.c',
>    'machine.c'
>  ))
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> new file mode 100644
> index 000000000000..000fe8da45ef
> --- /dev/null
> +++ b/target/riscv/pmu.c
> @@ -0,0 +1,32 @@
> +/*
> + * RISC-V PMU file.
> + *
> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "pmu.h"
> +
> +bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
> +                                        uint32_t target_ctr)
> +{
> +    return (target_ctr == 0) ? true : false;
> +}
> +
> +bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t target_ctr)
> +{
> +    return (target_ctr == 2) ? true : false;
> +}
> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> new file mode 100644
> index 000000000000..58a5bc3a4089
> --- /dev/null
> +++ b/target/riscv/pmu.h
> @@ -0,0 +1,28 @@
> +/*
> + * RISC-V PMU header file.
> + *
> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "cpu.h"
> +#include "qemu/main-loop.h"
> +#include "exec/exec-all.h"
> +
> +bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
> +                                        uint32_t target_ctr);
> +bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
> +                                  uint32_t target_ctr);
> --
> 2.30.2
>
>

