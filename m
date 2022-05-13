Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npOov-0007cb-FG
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 02:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1npOo3-0007WC-9U
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 02:29:47 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:42838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1npOnx-0000aJ-SX
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 02:29:42 -0400
Received: by mail-vs1-xe30.google.com with SMTP id i186so7422607vsc.9
 for <qemu-riscv@nongnu.org>; Thu, 12 May 2022 23:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wIwbdoaKg2C5ucR1fbYgbaEK0c36WPrwQQX15xS/hP0=;
 b=YsR/UyToreK08OkWgOBZqZL9m1+oY16oZl43TODNH/2FS0aLNZp6i3Atyr1TJ6BUqy
 Wz9Uh1pIrmP3FezXRTo2lWyDss9/8B5BN97LT/h2Vnw6LwzbioaYTQmtY1RzSKqoj08S
 Q0OazpaimnOQVOSiEOtLbYm2oZAVhWruQhXFe2nMw107kCgb8XKfhB7aBtpgu8BRcoHp
 pgbRCK5DD9j9OiUnZE7P+nYMxZbx8TPYnSkBXhodqS17Mh2zZ0u9jpl/jFEE2vd5kcnt
 7MQ6nx5MtsoIoXWQVtGjete/1FXRFbkn/zkHmcYoaOsoTmi4Z6Mp4ex1cQgAzge4vLEd
 JqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wIwbdoaKg2C5ucR1fbYgbaEK0c36WPrwQQX15xS/hP0=;
 b=xyk0k/7dz5pSIVXeXMwIrZaP7vDTI6OHR0/92FRLqGvZodR5FhduGepyKFTeyPvkFi
 kWT1CcvXWUJG5IQBaIqg6K2wXWyEmc6Mpbu5i54ZXQ9nYRQxEOYwttN1tlw9CrC6DZnD
 NRyEZ6nc0pBNS/t3AzCNVjOVMm9DvTzm5sUTWpRCbcPPO21h5qwkDYIthQ+YMpRTYRO9
 y1KGmTZHEl7Ojpm2QP8T/iSZ2+Y2EiLrVjqamZc6bbQ/cQspyjXyxADXv1ZoHHxJ3lsg
 23S5vYRqM8BICd7n7uLpPn1Ub621euwbggBUTngNdJJ26e4dHdJmd4bA2wiwFLa9DrCB
 eAcA==
X-Gm-Message-State: AOAM53016wGYvfFPu3w+n3a2mU+GholU8Wc3uSFysoKG+SHsdweJlU8c
 asKQ1GV8CveDyW/oMWVHZeAwkOFbrO0q1Okt
X-Google-Smtp-Source: ABdhPJzxBDlpjGuxnoL3v+JbXgCdrY1SfyM1DL9oTCqszZ6mXgmdpVqv3219V1Kw7iUMHA0E5KuoSQ==
X-Received: by 2002:a67:d98a:0:b0:32d:6bc7:f78 with SMTP id
 u10-20020a67d98a000000b0032d6bc70f78mr1745193vsj.19.1652423374641; 
 Thu, 12 May 2022 23:29:34 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176]) by smtp.gmail.com with ESMTPSA id
 p6-20020ab01546000000b003626f894df0sm258267uae.30.2022.05.12.23.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 23:29:33 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id s68so3745137vke.6;
 Thu, 12 May 2022 23:29:32 -0700 (PDT)
X-Received: by 2002:a05:6122:d09:b0:351:f87b:b27a with SMTP id
 az9-20020a0561220d0900b00351f87bb27amr1542417vkb.23.1652423372532; Thu, 12
 May 2022 23:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220511215956.2351243-1-atishp@rivosinc.com>
 <20220511215956.2351243-8-atishp@rivosinc.com>
In-Reply-To: <20220511215956.2351243-8-atishp@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 13 May 2022 14:29:21 +0800
X-Gmail-Original-Message-ID: <CANzO1D28K+QeJF4q4mD7ZYH+0H=KTFWtSwfQ4KoV4onKX4-j3Q@mail.gmail.com>
Message-ID: <CANzO1D28K+QeJF4q4mD7ZYH+0H=KTFWtSwfQ4KoV4onKX4-j3Q@mail.gmail.com>
Subject: Re: [PATCH v8 07/12] target/riscv: Support mcycle/minstret write
 operation
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000023709705dedecc07"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=frank.chang@sifive.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Fri, 13 May 2022 06:29:52 -0000

--00000000000023709705dedecc07
Content-Type: text/plain; charset="UTF-8"

On Thu, May 12, 2022 at 6:01 AM Atish Patra <atishp@rivosinc.com> wrote:

> From: Atish Patra <atish.patra@wdc.com>
>
> mcycle/minstret are actually WARL registers and can be written with any
> given value. With SBI PMU extension, it will be used to store a initial
> value provided from supervisor OS. The Qemu also need prohibit the counter
> increment if mcountinhibit is set.
>
> Support mcycle/minstret through generic counter infrastructure.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/cpu.h       |  23 ++++--
>  target/riscv/csr.c       | 157 ++++++++++++++++++++++++++++-----------
>  target/riscv/machine.c   |  25 ++++++-
>  target/riscv/meson.build |   3 +-
>  target/riscv/pmu.c       |  32 ++++++++
>  target/riscv/pmu.h       |  28 +++++++
>  6 files changed, 214 insertions(+), 54 deletions(-)
>  create mode 100644 target/riscv/pmu.c
>  create mode 100644 target/riscv/pmu.h
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 32cdd9070be5..f60072e0fd3d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -111,7 +111,7 @@ typedef struct CPUArchState CPURISCVState;
>  #endif
>
>  #define RV_VLEN_MAX 1024
> -#define RV_MAX_MHPMEVENTS 29
> +#define RV_MAX_MHPMEVENTS 32
>  #define RV_MAX_MHPMCOUNTERS 32
>
>  FIELD(VTYPE, VLMUL, 0, 3)
> @@ -121,6 +121,18 @@ FIELD(VTYPE, VMA, 7, 1)
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
>  struct CPUArchState {
>      target_ulong gpr[32];
>      target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
> @@ -273,13 +285,10 @@ struct CPUArchState {
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
> index 87aa601e5ddb..c050ed2e2c1b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -21,6 +21,7 @@
>  #include "qemu/log.h"
>  #include "qemu/timer.h"
>  #include "cpu.h"
> +#include "pmu.h"
>  #include "qemu/main-loop.h"
>  #include "exec/exec-all.h"
>  #include "sysemu/cpu-timers.h"
> @@ -597,34 +598,28 @@ static int write_vcsr(CPURISCVState *env, int csrno,
> target_ulong val)
>  }
>
>  /* User Timers and Counters */
> -static RISCVException read_instret(CPURISCVState *env, int csrno,
> -                                   target_ulong *val)
> +static target_ulong get_ticks(bool shift)
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
> +    if (shift) {
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
>  #if defined(CONFIG_USER_ONLY)
> @@ -642,11 +637,23 @@ static RISCVException read_timeh(CPURISCVState *env,
> int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static int read_hpmcounter(CPURISCVState *env, int csrno, target_ulong
> *val)
> +{
> +    *val = get_ticks(false);
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong
> *val)
> +{
> +    *val = get_ticks(true);
> +    return RISCV_EXCP_NONE;
> +}
> +
>  #else /* CONFIG_USER_ONLY */
>
>  static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong
> *val)
>  {
> -    int evt_index = csrno - CSR_MHPMEVENT3;
> +    int evt_index = csrno - CSR_MCOUNTINHIBIT;
>
>      *val = env->mhpmevent_val[evt_index];
>
> @@ -655,7 +662,7 @@ static int read_mhpmevent(CPURISCVState *env, int
> csrno, target_ulong *val)
>
>  static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong
> val)
>  {
> -    int evt_index = csrno - CSR_MHPMEVENT3;
> +    int evt_index = csrno - CSR_MCOUNTINHIBIT;
>
>      env->mhpmevent_val[evt_index] = val;
>
> @@ -664,52 +671,102 @@ static int write_mhpmevent(CPURISCVState *env, int
> csrno, target_ulong val)
>
>  static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong
> val)
>  {
> -    int ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
> +    int ctr_idx = csrno - CSR_MCYCLE;
> +    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
>
> -    env->mhpmcounter_val[ctr_index] = val;
> +    counter->mhpmcounter_val = val;
> +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> +        counter->mhpmcounter_prev = get_ticks(false);
> +    } else {
> +        /* Other counters can keep incrementing from the given value */
> +        counter->mhpmcounter_prev = val;
> +    }
>
>      return RISCV_EXCP_NONE;
>  }
>
>  static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulong
> val)
>  {
> -    int ctr_index = csrno - CSR_MHPMCOUNTER3H + 3;
> +    int ctr_idx = csrno - CSR_MCYCLEH;
> +    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
>
> -    env->mhpmcounterh_val[ctr_index] = val;
> +    counter->mhpmcounterh_val = val;
> +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> +        counter->mhpmcounterh_prev = get_ticks(true);
> +    } else {
> +        counter->mhpmcounterh_prev = val;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong
> *val,
> +                                         bool upper_half, uint32_t
> ctr_idx)
> +{
> +    PMUCTRState counter = env->pmu_ctrs[ctr_idx];
> +    target_ulong ctr_prev = upper_half ? counter.mhpmcounterh_prev :
> +                                         counter.mhpmcounter_prev;
> +    target_ulong ctr_val = upper_half ? counter.mhpmcounterh_val :
> +                                        counter.mhpmcounter_val;
> +
> +    if (get_field(env->mcountinhibit, BIT(ctr_idx))) {
> +        /**
> +         * Counter should not increment if inhibit bit is set. We can't
> really
> +         * stop the icount counting. Just return the counter value
> written by
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
> +     * The kernel computes the perf delta by subtracting the current
> value from
> +     * the value it initialized previously (ctr_val).
> +     */
> +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> +        *val = get_ticks(upper_half) - ctr_prev + ctr_val;
> +    } else {
> +        *val = ctr_val;
> +    }
>
>      return RISCV_EXCP_NONE;
>  }
>
>  static int read_hpmcounter(CPURISCVState *env, int csrno, target_ulong
> *val)
>  {
> -    int ctr_index;
> +    uint16_t ctr_index;
>
>      if (env->priv == PRV_M) {
> -        ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
> +        ctr_index = csrno - CSR_MCYCLE;

     } else {
> -        ctr_index = csrno - CSR_HPMCOUNTER3 + 3;
> +        ctr_index = csrno - CSR_CYCLE;
>      }
>

Hi Atish,

According to spec:
"The RDCYCLE pseudoinstruction reads the low XLEN bits of the cycle CSR
which holds a count of the number of clock cycles executed by the
processor core on which the hart is running from an arbitrary start time in
the past."

However, the counter index calculation here would have the issue.
For example, if RDCYCLE instruction is executed in M-mode:
CYCLE csrno is: 0xc00, but MCYCLE csrno is: 0xb00
"csrno - CSR_MCYCLE" would result in the invalidate value: 0x100,
which is out of the counter array's bound.

Will it be easier to just check against csrno instead of the current
privileged mode?

And I think the same issue also occurs for:
HPMCOUNTER3 ~ HPMCOUNTER31.

Regards,
Frank Chang


> -    *val = env->mhpmcounter_val[ctr_index];
>
> -    return RISCV_EXCP_NONE;
> +    return riscv_pmu_read_ctr(env, val, false, ctr_index);
>  }
>
>  static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong
> *val)
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
>  static RISCVException read_time(CPURISCVState *env, int csrno,
>                                  target_ulong *val)
>  {
> @@ -1564,11 +1621,23 @@ static RISCVException
> read_mcountinhibit(CPURISCVState *env, int csrno,
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
> +    /* Check if any other counter is also monitoring cycles/instructions
> */
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
> @@ -3526,10 +3595,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_VLENB]    = { "vlenb",    vs,    read_vlenb,
>                                            .min_priv_ver =
> PRIV_VERSION_1_12_0 },
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
>       * In privileged mode, the monitor will have to emulate TIME CSRs
> only if
> @@ -3543,10 +3612,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>
>  #if !defined(CONFIG_USER_ONLY)
>      /* Machine Timers and Counters */
> -    [CSR_MCYCLE]    = { "mcycle",    any,   read_instret  },
> -    [CSR_MINSTRET]  = { "minstret",  any,   read_instret  },
> -    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_instreth },
> -    [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
> +    [CSR_MCYCLE]    = { "mcycle",    any,   read_hpmcounter,
> write_mhpmcounter},
> +    [CSR_MINSTRET]  = { "minstret",  any,   read_hpmcounter,
> write_mhpmcounter},
> +    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_hpmcounterh,
> write_mhpmcounterh},
> +    [CSR_MINSTRETH] = { "minstreth", any32, read_hpmcounterh,
> write_mhpmcounterh},
>
>      /* Machine Information Registers */
>      [CSR_MVENDORID] = { "mvendorid", any,   read_mvendorid },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 99193c85bb97..dc182ca81119 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -279,7 +279,28 @@ static const VMStateDescription vmstate_envcfg = {
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
> @@ -331,8 +352,8 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINTTL(env.scounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
> -        VMSTATE_UINTTL_ARRAY(env.mhpmcounter_val, RISCVCPU,
> RV_MAX_MHPMCOUNTERS),
> -        VMSTATE_UINTTL_ARRAY(env.mhpmcounterh_val, RISCVCPU,
> RV_MAX_MHPMCOUNTERS),
> +        VMSTATE_STRUCT_ARRAY(env.pmu_ctrs, RISCVCPU, RV_MAX_MHPMCOUNTERS,
> 0,
> +                             vmstate_pmu_ctr_state, PMUCTRState),
>          VMSTATE_UINTTL_ARRAY(env.mhpmevent_val, RISCVCPU,
> RV_MAX_MHPMEVENTS),
>          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
>          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 096249f3a30f..2c1975e72c4e 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -30,7 +30,8 @@ riscv_softmmu_ss.add(files(
>    'pmp.c',
>    'debug.c',
>    'monitor.c',
> -  'machine.c'
> +  'machine.c',
> +  'pmu.c'
>  ))
>
>  target_arch += {'riscv': riscv_ss}
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
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> along with
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
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> along with
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
> 2.25.1
>
>
>

--00000000000023709705dedecc07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, May 12, 2022 at 6:01 AM Atish Pat=
ra &lt;<a href=3D"mailto:atishp@rivosinc.com">atishp@rivosinc.com</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">From: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.co=
m" target=3D"_blank">atish.patra@wdc.com</a>&gt;<br>
<br>
mcycle/minstret are actually WARL registers and can be written with any<br>
given value. With SBI PMU extension, it will be used to store a initial<br>
value provided from supervisor OS. The Qemu also need prohibit the counter<=
br>
increment if mcountinhibit is set.<br>
<br>
Support mcycle/minstret through generic counter infrastructure.<br>
<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.com" targe=
t=3D"_blank">atish.patra@wdc.com</a>&gt;<br>
Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" targe=
t=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 ++++--<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 157 ++++++++++++++++++=
++++++++++-----------<br>
=C2=A0target/riscv/machine.c=C2=A0 =C2=A0|=C2=A0 25 ++++++-<br>
=C2=A0target/riscv/meson.build |=C2=A0 =C2=A03 +-<br>
=C2=A0target/riscv/pmu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 32 ++++++++<br>
=C2=A0target/riscv/pmu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 28 +++++++<br>
=C2=A06 files changed, 214 insertions(+), 54 deletions(-)<br>
=C2=A0create mode 100644 target/riscv/pmu.c<br>
=C2=A0create mode 100644 target/riscv/pmu.h<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 32cdd9070be5..f60072e0fd3d 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -111,7 +111,7 @@ typedef struct CPUArchState CPURISCVState;<br>
=C2=A0#endif<br>
<br>
=C2=A0#define RV_VLEN_MAX 1024<br>
-#define RV_MAX_MHPMEVENTS 29<br>
+#define RV_MAX_MHPMEVENTS 32<br>
=C2=A0#define RV_MAX_MHPMCOUNTERS 32<br>
<br>
=C2=A0FIELD(VTYPE, VLMUL, 0, 3)<br>
@@ -121,6 +121,18 @@ FIELD(VTYPE, VMA, 7, 1)<br>
=C2=A0FIELD(VTYPE, VEDIV, 8, 2)<br>
=C2=A0FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)<br>
<br>
+typedef struct PMUCTRState {<br>
+=C2=A0 =C2=A0 /* Current value of a counter */<br>
+=C2=A0 =C2=A0 target_ulong mhpmcounter_val;<br>
+=C2=A0 =C2=A0 /* Current value of a counter in RV32*/<br>
+=C2=A0 =C2=A0 target_ulong mhpmcounterh_val;<br>
+=C2=A0 =C2=A0 /* Snapshot values of counter */<br>
+=C2=A0 =C2=A0 target_ulong mhpmcounter_prev;<br>
+=C2=A0 =C2=A0 /* Snapshort value of a counter in RV32 */<br>
+=C2=A0 =C2=A0 target_ulong mhpmcounterh_prev;<br>
+=C2=A0 =C2=A0 bool started;<br>
+} PMUCTRState;<br>
+<br>
=C2=A0struct CPUArchState {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong gpr[32];<br>
=C2=A0 =C2=A0 =C2=A0target_ulong gprh[32]; /* 64 top bits of the 128-bit re=
gisters */<br>
@@ -273,13 +285,10 @@ struct CPUArchState {<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mcountinhibit;<br>
<br>
-=C2=A0 =C2=A0 /* PMU counter configured values */<br>
-=C2=A0 =C2=A0 target_ulong mhpmcounter_val[RV_MAX_MHPMCOUNTERS];<br>
-<br>
-=C2=A0 =C2=A0 /* for RV32 */<br>
-=C2=A0 =C2=A0 target_ulong mhpmcounterh_val[RV_MAX_MHPMCOUNTERS];<br>
+=C2=A0 =C2=A0 /* PMU counter state */<br>
+=C2=A0 =C2=A0 PMUCTRState pmu_ctrs[RV_MAX_MHPMCOUNTERS];<br>
<br>
-=C2=A0 =C2=A0 /* PMU event selector configured values */<br>
+=C2=A0 =C2=A0 /* PMU event selector configured values. First three are unu=
sed*/<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong sscratch;<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 87aa601e5ddb..c050ed2e2c1b 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -21,6 +21,7 @@<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
+#include &quot;pmu.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
=C2=A0#include &quot;exec/exec-all.h&quot;<br>
=C2=A0#include &quot;sysemu/cpu-timers.h&quot;<br>
@@ -597,34 +598,28 @@ static int write_vcsr(CPURISCVState *env, int csrno, =
target_ulong val)<br>
=C2=A0}<br>
<br>
=C2=A0/* User Timers and Counters */<br>
-static RISCVException read_instret(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<br>
+static target_ulong get_ticks(bool shift)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 int64_t val;<br>
+=C2=A0 =C2=A0 target_ulong result;<br>
+<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
=C2=A0 =C2=A0 =C2=A0if (icount_enabled()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D icount_get();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D icount_get();<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D cpu_get_host_ticks();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D cpu_get_host_ticks();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#else<br>
-=C2=A0 =C2=A0 *val =3D cpu_get_host_ticks();<br>
+=C2=A0 =C2=A0 val =3D cpu_get_host_ticks();<br>
=C2=A0#endif<br>
-=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
-}<br>
<br>
-static RISCVException read_instreth(CPURISCVState *env, int csrno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)<br>
-{<br>
-#if !defined(CONFIG_USER_ONLY)<br>
-=C2=A0 =C2=A0 if (icount_enabled()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D icount_get() &gt;&gt; 32;<br>
+=C2=A0 =C2=A0 if (shift) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D val &gt;&gt; 32;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D cpu_get_host_ticks() &gt;&gt; 32;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D val;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-#else<br>
-=C2=A0 =C2=A0 *val =3D cpu_get_host_ticks() &gt;&gt; 32;<br>
-#endif<br>
-=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+<br>
+=C2=A0 =C2=A0 return result;<br>
=C2=A0}<br>
<br>
=C2=A0#if defined(CONFIG_USER_ONLY)<br>
@@ -642,11 +637,23 @@ static RISCVException read_timeh(CPURISCVState *env, =
int csrno,<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
+static int read_hpmcounter(CPURISCVState *env, int csrno, target_ulong *va=
l)<br>
+{<br>
+=C2=A0 =C2=A0 *val =3D get_ticks(false);<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
+static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong *v=
al)<br>
+{<br>
+=C2=A0 =C2=A0 *val =3D get_ticks(true);<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
=C2=A0#else /* CONFIG_USER_ONLY */<br>
<br>
=C2=A0static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong=
 *val)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int evt_index =3D csrno - CSR_MHPMEVENT3;<br>
+=C2=A0 =C2=A0 int evt_index =3D csrno - CSR_MCOUNTINHIBIT;<br>
<br>
=C2=A0 =C2=A0 =C2=A0*val =3D env-&gt;mhpmevent_val[evt_index];<br>
<br>
@@ -655,7 +662,7 @@ static int read_mhpmevent(CPURISCVState *env, int csrno=
, target_ulong *val)<br>
<br>
=C2=A0static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulon=
g val)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int evt_index =3D csrno - CSR_MHPMEVENT3;<br>
+=C2=A0 =C2=A0 int evt_index =3D csrno - CSR_MCOUNTINHIBIT;<br>
<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mhpmevent_val[evt_index] =3D val;<br>
<br>
@@ -664,52 +671,102 @@ static int write_mhpmevent(CPURISCVState *env, int c=
srno, target_ulong val)<br>
<br>
=C2=A0static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ul=
ong val)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int ctr_index =3D csrno - CSR_MHPMCOUNTER3 + 3;<br>
+=C2=A0 =C2=A0 int ctr_idx =3D csrno - CSR_MCYCLE;<br>
+=C2=A0 =C2=A0 PMUCTRState *counter =3D &amp;env-&gt;pmu_ctrs[ctr_idx];<br>
<br>
-=C2=A0 =C2=A0 env-&gt;mhpmcounter_val[ctr_index] =3D val;<br>
+=C2=A0 =C2=A0 counter-&gt;mhpmcounter_val =3D val;<br>
+=C2=A0 =C2=A0 if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_pmu_ctr_monitor_instructions(env, ctr_id=
x)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounter_prev =3D get_ticks(fal=
se);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Other counters can keep incrementing from t=
he given value */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounter_prev =3D val;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
=C2=A0static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_u=
long val)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int ctr_index =3D csrno - CSR_MHPMCOUNTER3H + 3;<br>
+=C2=A0 =C2=A0 int ctr_idx =3D csrno - CSR_MCYCLEH;<br>
+=C2=A0 =C2=A0 PMUCTRState *counter =3D &amp;env-&gt;pmu_ctrs[ctr_idx];<br>
<br>
-=C2=A0 =C2=A0 env-&gt;mhpmcounterh_val[ctr_index] =3D val;<br>
+=C2=A0 =C2=A0 counter-&gt;mhpmcounterh_val =3D val;<br>
+=C2=A0 =C2=A0 if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_pmu_ctr_monitor_instructions(env, ctr_id=
x)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounterh_prev =3D get_ticks(tr=
ue);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounterh_prev =3D val;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
+static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong =
*val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo=
ol upper_half, uint32_t ctr_idx)<br>
+{<br>
+=C2=A0 =C2=A0 PMUCTRState counter =3D env-&gt;pmu_ctrs[ctr_idx];<br>
+=C2=A0 =C2=A0 target_ulong ctr_prev =3D upper_half ? counter.mhpmcounterh_=
prev :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
unter.mhpmcounter_prev;<br>
+=C2=A0 =C2=A0 target_ulong ctr_val =3D upper_half ? counter.mhpmcounterh_v=
al :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter.=
mhpmcounter_val;<br>
+<br>
+=C2=A0 =C2=A0 if (get_field(env-&gt;mcountinhibit, BIT(ctr_idx))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Counter should not increment if inhibi=
t bit is set. We can&#39;t really<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* stop the icount counting. Just return =
the counter value written by<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the supervisor to indicate that counte=
r was not incremented.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!counter.started) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D ctr_val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Mark that the counter has bee=
n stopped */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter.started =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+<br>
+=C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0* The kernel computes the perf delta by subtracting th=
e current value from<br>
+=C2=A0 =C2=A0 =C2=A0* the value it initialized previously (ctr_val).<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_pmu_ctr_monitor_instructions(env, ctr_id=
x)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D get_ticks(upper_half) - ctr_prev + ct=
r_val;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D ctr_val;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
=C2=A0static int read_hpmcounter(CPURISCVState *env, int csrno, target_ulon=
g *val)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int ctr_index;<br>
+=C2=A0 =C2=A0 uint16_t ctr_index;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (env-&gt;priv =3D=3D PRV_M) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_MHPMCOUNTER3 + 3;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_MCYCLE;=C2=A0</block=
quote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_HPMCOUNTER3 + 3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_CYCLE;<br>
=C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br></div><div>Hi Atish,</div><d=
iv><br></div><div>According to spec:</div><div>&quot;The RDCYCLE pseudoinst=
ruction reads the low XLEN bits of the cycle CSR</div><div>which holds a co=
unt of the number of clock cycles executed by the</div><div>processor core =
on which the hart is running from an arbitrary start time in the past.&quot=
;</div><div><br></div><div>However, the counter index calculation here woul=
d have the issue.</div><div>For example, if RDCYCLE instruction is executed=
 in M-mode:</div><div>CYCLE csrno=C2=A0is: 0xc00, but MCYCLE csrno is: 0xb0=
0</div><div>&quot;csrno - CSR_MCYCLE&quot; would result in the invalidate v=
alue: 0x100,</div><div>which is out of the counter array&#39;s bound.</div>=
<div><br></div><div>Will it be easier to just check against csrno instead o=
f the current privileged mode?</div><div><br></div><div>And I think the sam=
e issue also occurs for:</div><div>HPMCOUNTER3 ~=C2=A0HPMCOUNTER31.<br></di=
v><div><br></div><div>Regards,</div><div>Frank Chang</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
-=C2=A0 =C2=A0 *val =3D env-&gt;mhpmcounter_val[ctr_index];<br>
<br>
-=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+=C2=A0 =C2=A0 return riscv_pmu_read_ctr(env, val, false, ctr_index);<br>
=C2=A0}<br>
<br>
=C2=A0static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulo=
ng *val)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int ctr_index;<br>
+=C2=A0 =C2=A0 uint16_t ctr_index;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (env-&gt;priv =3D=3D PRV_M) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_MHPMCOUNTER3H + 3;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_MCYCLEH;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_HPMCOUNTER3H + 3;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_CYCLEH;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 *val =3D env-&gt;mhpmcounterh_val[ctr_index];<br>
-<br>
-=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+=C2=A0 =C2=A0 return riscv_pmu_read_ctr(env, val, true, ctr_index);<br>
=C2=A0}<br>
<br>
-<br>
=C2=A0static RISCVException read_time(CPURISCVState *env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<br>
=C2=A0{<br>
@@ -1564,11 +1621,23 @@ static RISCVException read_mcountinhibit(CPURISCVSt=
ate *env, int csrno,<br>
=C2=A0static RISCVException write_mcountinhibit(CPURISCVState *env, int csr=
no,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0target_ulong val)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 int cidx;<br>
+=C2=A0 =C2=A0 PMUCTRState *counter;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (env-&gt;priv_ver &lt; PRIV_VERSION_1_11_0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_ILLEGAL_INST;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mcountinhibit =3D val;<br>
+<br>
+=C2=A0 =C2=A0 /* Check if any other counter is also monitoring cycles/inst=
ructions */<br>
+=C2=A0 =C2=A0 for (cidx =3D 0; cidx &lt; RV_MAX_MHPMCOUNTERS; cidx++) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!get_field(env-&gt;mcountinhibit, BIT(cidx=
))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter =3D &amp;env-&gt;pmu_ctr=
s[cidx];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;started =3D true;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
@@ -3526,10 +3595,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<=
br>
=C2=A0 =C2=A0 =C2=A0[CSR_VLENB]=C2=A0 =C2=A0 =3D { &quot;vlenb&quot;,=C2=A0=
 =C2=A0 vs,=C2=A0 =C2=A0 read_vlenb,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0.min_priv_ver =3D PRIV_VERSION_1_12_0 },<br>
=C2=A0 =C2=A0 =C2=A0/* User Timers and Counters */<br>
-=C2=A0 =C2=A0 [CSR_CYCLE]=C2=A0 =C2=A0 =3D { &quot;cycle&quot;,=C2=A0 =C2=
=A0 ctr,=C2=A0 =C2=A0 read_instret=C2=A0 },<br>
-=C2=A0 =C2=A0 [CSR_INSTRET]=C2=A0 =3D { &quot;instret&quot;,=C2=A0 ctr,=C2=
=A0 =C2=A0 read_instret=C2=A0 },<br>
-=C2=A0 =C2=A0 [CSR_CYCLEH]=C2=A0 =C2=A0=3D { &quot;cycleh&quot;,=C2=A0 =C2=
=A0ctr32,=C2=A0 read_instreth },<br>
-=C2=A0 =C2=A0 [CSR_INSTRETH] =3D { &quot;instreth&quot;, ctr32,=C2=A0 read=
_instreth },<br>
+=C2=A0 =C2=A0 [CSR_CYCLE]=C2=A0 =C2=A0 =3D { &quot;cycle&quot;,=C2=A0 =C2=
=A0 ctr,=C2=A0 =C2=A0 read_hpmcounter=C2=A0 },<br>
+=C2=A0 =C2=A0 [CSR_INSTRET]=C2=A0 =3D { &quot;instret&quot;,=C2=A0 ctr,=C2=
=A0 =C2=A0 read_hpmcounter=C2=A0 },<br>
+=C2=A0 =C2=A0 [CSR_CYCLEH]=C2=A0 =C2=A0=3D { &quot;cycleh&quot;,=C2=A0 =C2=
=A0ctr32,=C2=A0 read_hpmcounterh },<br>
+=C2=A0 =C2=A0 [CSR_INSTRETH] =3D { &quot;instreth&quot;, ctr32,=C2=A0 read=
_hpmcounterh },<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * In privileged mode, the monitor will have to emulate=
 TIME CSRs only if<br>
@@ -3543,10 +3612,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<=
br>
<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
=C2=A0 =C2=A0 =C2=A0/* Machine Timers and Counters */<br>
-=C2=A0 =C2=A0 [CSR_MCYCLE]=C2=A0 =C2=A0 =3D { &quot;mcycle&quot;,=C2=A0 =
=C2=A0 any,=C2=A0 =C2=A0read_instret=C2=A0 },<br>
-=C2=A0 =C2=A0 [CSR_MINSTRET]=C2=A0 =3D { &quot;minstret&quot;,=C2=A0 any,=
=C2=A0 =C2=A0read_instret=C2=A0 },<br>
-=C2=A0 =C2=A0 [CSR_MCYCLEH]=C2=A0 =C2=A0=3D { &quot;mcycleh&quot;,=C2=A0 =
=C2=A0any32, read_instreth },<br>
-=C2=A0 =C2=A0 [CSR_MINSTRETH] =3D { &quot;minstreth&quot;, any32, read_ins=
treth },<br>
+=C2=A0 =C2=A0 [CSR_MCYCLE]=C2=A0 =C2=A0 =3D { &quot;mcycle&quot;,=C2=A0 =
=C2=A0 any,=C2=A0 =C2=A0read_hpmcounter, write_mhpmcounter},<br>
+=C2=A0 =C2=A0 [CSR_MINSTRET]=C2=A0 =3D { &quot;minstret&quot;,=C2=A0 any,=
=C2=A0 =C2=A0read_hpmcounter, write_mhpmcounter},<br>
+=C2=A0 =C2=A0 [CSR_MCYCLEH]=C2=A0 =C2=A0=3D { &quot;mcycleh&quot;,=C2=A0 =
=C2=A0any32, read_hpmcounterh, write_mhpmcounterh},<br>
+=C2=A0 =C2=A0 [CSR_MINSTRETH] =3D { &quot;minstreth&quot;, any32, read_hpm=
counterh, write_mhpmcounterh},<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Machine Information Registers */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MVENDORID] =3D { &quot;mvendorid&quot;, any,=C2=A0=
 =C2=A0read_mvendorid },<br>
diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
index 99193c85bb97..dc182ca81119 100644<br>
--- a/target/riscv/machine.c<br>
+++ b/target/riscv/machine.c<br>
@@ -279,7 +279,28 @@ static const VMStateDescription vmstate_envcfg =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.menvcfg, RISCVCPU),<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.senvcfg, RISCVCPU),<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.henvcfg, RISCVCPU),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static bool pmu_needed(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D opaque;<br>
<br>
+=C2=A0 =C2=A0 return cpu-&gt;cfg.pmu_num;<br>
+}<br>
+<br>
+static const VMStateDescription vmstate_pmu_ctr_state =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;cpu/pmu&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .needed =3D pmu_needed,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(mhpmcounter_val, PMUCTRState),<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(mhpmcounterh_val, PMUCTRState),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(mhpmcounter_prev, PMUCTRState),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(mhpmcounterh_prev, PMUCTRState)=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_BOOL(started, PMUCTRState),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_END_OF_LIST()<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0};<br>
@@ -331,8 +352,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.scounteren, RISCVCPU),=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.mcounteren, RISCVCPU),=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.mcountinhibit, RISCVCP=
U),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL_ARRAY(env.mhpmcounter_val, RISC=
VCPU, RV_MAX_MHPMCOUNTERS),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL_ARRAY(env.mhpmcounterh_val, RIS=
CVCPU, RV_MAX_MHPMCOUNTERS),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_STRUCT_ARRAY(env.pmu_ctrs, RISCVCPU, R=
V_MAX_MHPMCOUNTERS, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmstate_pmu_ctr_state, PMUCTRState),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL_ARRAY(env.mhpmevent_val, R=
ISCVCPU, RV_MAX_MHPMEVENTS),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.sscratch, RISCVCPU),<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.mscratch, RISCVCPU),<b=
r>
diff --git a/target/riscv/meson.build b/target/riscv/meson.build<br>
index 096249f3a30f..2c1975e72c4e 100644<br>
--- a/target/riscv/meson.build<br>
+++ b/target/riscv/meson.build<br>
@@ -30,7 +30,8 @@ riscv_softmmu_ss.add(files(<br>
=C2=A0 =C2=A0&#39;pmp.c&#39;,<br>
=C2=A0 =C2=A0&#39;debug.c&#39;,<br>
=C2=A0 =C2=A0&#39;monitor.c&#39;,<br>
-=C2=A0 &#39;machine.c&#39;<br>
+=C2=A0 &#39;machine.c&#39;,<br>
+=C2=A0 &#39;pmu.c&#39;<br>
=C2=A0))<br>
<br>
=C2=A0target_arch +=3D {&#39;riscv&#39;: riscv_ss}<br>
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c<br>
new file mode 100644<br>
index 000000000000..000fe8da45ef<br>
--- /dev/null<br>
+++ b/target/riscv/pmu.c<br>
@@ -0,0 +1,32 @@<br>
+/*<br>
+ * RISC-V PMU file.<br>
+ *<br>
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms and conditions of the GNU General Public License,<br>
+ * version 2 or later, as published by the Free Software Foundation.<br>
+ *<br>
+ * This program is distributed in the hope it will be useful, but WITHOUT<=
br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public Lice=
nse for<br>
+ * more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
 with<br>
+ * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/licen=
ses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>=
&gt;.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;cpu.h&quot;<br>
+#include &quot;pmu.h&quot;<br>
+<br>
+bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=
 target_ctr)<br>
+{<br>
+=C2=A0 =C2=A0 return (target_ctr =3D=3D 0) ? true : false;<br>
+}<br>
+<br>
+bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t target_ctr)=
<br>
+{<br>
+=C2=A0 =C2=A0 return (target_ctr =3D=3D 2) ? true : false;<br>
+}<br>
diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h<br>
new file mode 100644<br>
index 000000000000..58a5bc3a4089<br>
--- /dev/null<br>
+++ b/target/riscv/pmu.h<br>
@@ -0,0 +1,28 @@<br>
+/*<br>
+ * RISC-V PMU header file.<br>
+ *<br>
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms and conditions of the GNU General Public License,<br>
+ * version 2 or later, as published by the Free Software Foundation.<br>
+ *<br>
+ * This program is distributed in the hope it will be useful, but WITHOUT<=
br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public Lice=
nse for<br>
+ * more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
 with<br>
+ * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/licen=
ses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>=
&gt;.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;cpu.h&quot;<br>
+#include &quot;qemu/main-loop.h&quot;<br>
+#include &quot;exec/exec-all.h&quot;<br>
+<br>
+bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=
 target_ctr);<br>
+bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t target_ctr);<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000023709705dedecc07--

