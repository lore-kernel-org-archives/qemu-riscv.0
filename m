Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6p4K-00075f-Sf
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 02:26:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n6p40-00072g-E1; Mon, 10 Jan 2022 02:25:59 -0500
Received: from [2607:f8b0:4864:20::b29] (port=35715
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n6p3u-0002xk-9U; Mon, 10 Jan 2022 02:25:55 -0500
Received: by mail-yb1-xb29.google.com with SMTP id j83so35644624ybg.2;
 Sun, 09 Jan 2022 23:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9xWnsHe3tOZpqXwvadYGpTnUtVgWIauU1FZvJIF2fs4=;
 b=JRl8ejtZIHWCUwVidMZvGwpQXKv2+4QIjs0LUID/kQ94cRty98h5mY1C8n2tAFIkAN
 1TE/P1961RLiok15zdb/1WGWW+CyBTC8gA0fUavAvT7pfX19MWuD9SfeNy5Zp9FNd66l
 glOKBtM9LO7SIoAcinDXhrGNl6BlGLxL/b7OwzO3shokxxSTyzyNmUuKEXw6B/liUQjK
 eGSRYn42CUhNa8Otj6dHSyDCghcBUFQsKYjTcwH+p87GNaBKHuUKTrPbdeBx8VsxdFHd
 5WbZ35jUf5qPf7Q6prrFcj73aPa6dXgEDQ8CD0+XvItG9eKS5OEMLxORwsEIwT8EytG7
 yM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9xWnsHe3tOZpqXwvadYGpTnUtVgWIauU1FZvJIF2fs4=;
 b=vc/Q0h3Baef4jXJuwQzWHiQCl47SuffXx0zYlXamlAO11baY9EVIE7xka6ZuY6/wlb
 QknmhFo+rNN52rTj6ZHYuZYnvzR7gYNF3tIOyVVo2fve/2nYZoJFHjAaPLpAoSqU1G5e
 QjGv9cNF6Xl+/BAksVaJ47F5zC2l7nRxJ/aA6IT2ymqB31hefNhcJOH1WIaWWUavJyx8
 ZsRgqK8xMJtmgNJvvdToRsWY62uEsCpCT5PHU7KzP+qP9MBsy9HPkn9wNchqOp1/6nw9
 sPP2EeX/IvIMJmHRihSUzqS9YkBb4pNGiUeYfsRnVl3saz7Hr/td9y9qRAXbEYmVr7NN
 uLfA==
X-Gm-Message-State: AOAM532HpybjKw9Zg8ZC2Zal6nwYOHW6tBfTEH0roqpyZ0ssYBUXAjVe
 zwV5RJdyg/whz4FZYV7p9sFN3AuwOmKSm15a5WQW1Ki/c0/rlA==
X-Google-Smtp-Source: ABdhPJx+zV0j55132Wyt3W/av2ThIyL40ZuxKsTRzTaM3K+y2HoRrMQfOS7upRep6Np1tRrqPTuwl1WCHd9lRGjD60c=
X-Received: by 2002:a5b:3c2:: with SMTP id t2mr86015530ybp.747.1641799538671; 
 Sun, 09 Jan 2022 23:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20220107004846.378859-1-atishp@rivosinc.com>
 <20220107004846.378859-8-atishp@rivosinc.com>
In-Reply-To: <20220107004846.378859-8-atishp@rivosinc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 10 Jan 2022 15:25:26 +0800
Message-ID: <CAEUhbmWgrqBeqE7HgPtQ-hBcps=Raz0=nOz5KnnzuakUADijQA@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] target/riscv: Support mcycle/minstret write
 operation
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 10 Jan 2022 07:26:10 -0000

On Fri, Jan 7, 2022 at 10:14 AM Atish Patra <atishp@rivosinc.com> wrote:
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
>  target/riscv/cpu.h       |  24 +++++--
>  target/riscv/csr.c       | 144 ++++++++++++++++++++++++++-------------
>  target/riscv/machine.c   |  26 ++++++-
>  target/riscv/meson.build |   1 +
>  target/riscv/pmu.c       |  32 +++++++++
>  target/riscv/pmu.h       |  28 ++++++++
>  6 files changed, 200 insertions(+), 55 deletions(-)
>  create mode 100644 target/riscv/pmu.c
>  create mode 100644 target/riscv/pmu.h
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 39edc948d703..5fe9c51b38c7 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -101,7 +101,7 @@ typedef struct CPURISCVState CPURISCVState;
>  #endif
>
>  #define RV_VLEN_MAX 1024
> -#define RV_MAX_MHPMEVENTS 29
> +#define RV_MAX_MHPMEVENTS 32
>  #define RV_MAX_MHPMCOUNTERS 32
>
>  FIELD(VTYPE, VLMUL, 0, 3)
> @@ -112,6 +112,19 @@ FIELD(VTYPE, VEDIV, 8, 2)
>  FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
>  FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
>
> +typedef struct PMUCTRState PMUCTRState;

This 'typedef' can be merged into the definition below


> +struct PMUCTRState {
> +    /* Current value of a counter */
> +    target_ulong mhpmcounter_val;
> +    /* Current value of a counter in RV32*/
> +    target_ulong mhpmcounterh_val;
> +    /* Snapshot values of counter */
> +    target_ulong mhpmcounter_prev;
> +    /* Snapshort value of a counter in RV32 */
> +    target_ulong mhpmcounterh_prev;
> +    bool started;
> +};
> +
>  struct CPURISCVState {
>      target_ulong gpr[32];
>      uint64_t fpr[32]; /* assume both F and D extensions */
> @@ -226,13 +239,10 @@ struct CPURISCVState {
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
> index 58a9550bd898..d4449ada557c 100644
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
> @@ -461,41 +462,33 @@ static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
>  }
>
>  /* User Timers and Counters */
> -static RISCVException read_instret(CPURISCVState *env, int csrno,
> -                                   target_ulong *val)
> +static target_ulong get_icount_ticks(bool brv32)

I would use 'rv32' instead of 'brv32'

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
>
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException read_instreth(CPURISCVState *env, int csrno,
> -                                    target_ulong *val)
> -{
> -#if !defined(CONFIG_USER_ONLY)
> -    if (icount_enabled()) {
> -        *val = icount_get() >> 32;
> +    if (brv32) {
> +        result = val >> 32;
>      } else {
> -        *val = cpu_get_host_ticks() >> 32;
> +        result = val;
>      }
> -#else
> -    *val = cpu_get_host_ticks() >> 32;
> -#endif
>
> -    return RISCV_EXCP_NONE;
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
> @@ -504,7 +497,7 @@ static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
>
>  static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    int evt_index = csrno - CSR_MHPMEVENT3;
> +    int evt_index = csrno - CSR_MCOUNTINHIBIT;
>
>      env->mhpmevent_val[evt_index] = val;
>
> @@ -513,52 +506,99 @@ static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
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
> +     } else {
> +        /* Other counters can keep incrementing from the given value */
> +        counter->mhpmcounter_prev = val;
> +     }
>
> -    return RISCV_EXCP_NONE;
> +     return RISCV_EXCP_NONE;

The indentation is wrong, which should be 4 spaces. The same issue
exists in above if .. else .. block.

>  }
>
>  static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    int ctr_index = csrno - CSR_MHPMCOUNTER3H + 3;
> +    int ctr_idx = csrno - CSR_MCYCLEH;
> +    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
> +
> +    counter->mhpmcounterh_val = val;
> +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> +        counter->mhpmcounterh_prev = get_icount_ticks(false);

Should be get_icount_ticks(true)

> +    } else {
> +        counter->mhpmcounterh_prev = val;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
> +                                    bool is_uh, uint32_t ctr_idx)

nits: %s/is_uh/upper_half to make it more intuitive?

> +{
> +    PMUCTRState counter = env->pmu_ctrs[ctr_idx];
> +    target_ulong ctr_prev = is_uh ? counter.mhpmcounterh_prev :
> +                                    counter.mhpmcounter_prev;
> +    target_ulong ctr_val = is_uh ? counter.mhpmcounterh_val :
> +                                   counter.mhpmcounter_val;
>
> -    env->mhpmcounterh_val[ctr_index] = val;
> +    if (get_field(env->mcountinhibit, BIT(ctr_idx))) {
> +        /**
> +         * Counter should not increment if inhibit bit is set. We can't really
> +         * stop the icount counting. Just return the previous value to indicate
> +         * that counter was not incremented.
> +         */
> +        if (!counter.started) {
> +            *val = ctr_val;

I think this should be *val = ctl_prev to match your comments?

> +            return RISCV_EXCP_NONE;
> +        } else {
> +            /* Mark that the counter has been stopped */
> +            counter.started = false;
> +        }
> +    }
> +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> +        *val = get_icount_ticks(is_uh);
> +    } else {
> +        *val = ctr_val;

*val = ctr_prev?

> +    }
> +
> +    /* No need to handle the overflow here */
> +    *val = *val - ctr_prev + ctr_val;

I am not sure I understand the logic here.

For cycle/instret counters, this logic becomes: new get_icount_ticks()
- get_icount_ticks() last time when counter was written + the counter
value last time when counter was written. This does not make sense.

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
> @@ -925,11 +965,23 @@ static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
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
> @@ -2035,10 +2087,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
>      [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb                 },
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
> @@ -2049,10 +2101,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
> index d10a3d7472cb..829b9f2d1f46 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -164,6 +164,28 @@ static const VMStateDescription vmstate_pointermasking = {
>      }
>  };
>
> +static bool pmu_needed(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +
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
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
>      .version_id = 3,
> @@ -206,8 +228,8 @@ const VMStateDescription vmstate_riscv_cpu = {
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
> index d5e0bc93ea9c..992122c4d6f5 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -24,6 +24,7 @@ riscv_softmmu_ss = ss.source_set()
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

Maybe it makes sense to move all PMU CSRs read/write routine into this
new pmu.c file? It looks odd to just add 2 simple functions here.

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

Regards,
Bin

