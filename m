Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7eCo-000679-50
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 09:02:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n7eBv-0005S1-QU; Wed, 12 Jan 2022 09:01:31 -0500
Received: from [2607:f8b0:4864:20::b33] (port=33742
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n7eBt-0003Wr-Is; Wed, 12 Jan 2022 09:01:31 -0500
Received: by mail-yb1-xb33.google.com with SMTP id p187so6774961ybc.0;
 Wed, 12 Jan 2022 06:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YtwlVA0KtEfDG6pzsFtKAdKinGkA7SRBiFqucnpbBXo=;
 b=H7uowQSZ7EvI28fgHuS9tQZgdWw6Cr2xk/9jJXUYrxE+mWJGh/rFqoYHv/EnNAdXHu
 0k5h9CypDhi47aNSopr9h2pCWLJ9I6qnN2qjKRfKEPWSayojDrMzfmbWa+lZXmLSZbQL
 GY1uSGdOalt1lZJuwtYAztA1LggnVPNsVEFSklxlVgrG1ax8MEzXJ+OlfRLoFPmayJkF
 b8pMjaACZHyQuDpB8nl8dd6SUktWj3i89OUIwXpAmcgnLo4zRhxgTUTSnXubp9P1VvBr
 TvNwAIQJgF+wRa/mD1rQLJeW6XxgdQPrC7D+x9mPmHuS+YmFaH4lnHmCsvvkF8g/0Slh
 0vqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YtwlVA0KtEfDG6pzsFtKAdKinGkA7SRBiFqucnpbBXo=;
 b=AxsDoQQbFR96CJJjIrvXgrU5A2rTAsY8dqoUrwn4T+r3I01CNlTlB3k/wS+52DH9pN
 gInMkgWjngOM/CDq1UbajGJNJsC1PQoShxOtjKXZJmo4KfIFF4FmlC+7KSRXqHgng1G9
 CJCsfOdfKwd5AnHuilQCrLYBnowr/RzlhcTjnKe8UNWPOWfbOSX2ZWNaEZd8Tz5FlR6w
 rh032Md2CVP8l/uqvfTBG+9TCPc8zgfqVpc1KkIA02n7FiFh+T/42/ZZVrHE2NHzJBwn
 IDwSDyJILJfAFrXXfDKF99cA9B+RJTqCt20tQMLbXWaL/khXx4SK/lpLdeZOQjIA5pEi
 Mg3Q==
X-Gm-Message-State: AOAM530Ixp1qp7E1QVi7byyiGEKLTdPUyrhmF/zBJc4z0M7hCrFck4qD
 aORf5atL6YjjDs5Fr8ZUlbYCjTwnU9D3eYPAf64=
X-Google-Smtp-Source: ABdhPJyDg7w6kKFi0/oYJC/yKwyAvBbLvrEVCI+mAu++Wy36GwY8OhfK3M+tc6R0LYBYOIYcQIDX3b2LSYnr9Ac1XP8=
X-Received: by 2002:a25:abb4:: with SMTP id v49mr13115402ybi.91.1641996086484; 
 Wed, 12 Jan 2022 06:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20220107004846.378859-1-atishp@rivosinc.com>
 <20220107004846.378859-8-atishp@rivosinc.com>
 <CAEUhbmWgrqBeqE7HgPtQ-hBcps=Raz0=nOz5KnnzuakUADijQA@mail.gmail.com>
 <CAOnJCUKgjJOxhx1evxTVra_zPbULU2thctF717S=sCCvjzX=mg@mail.gmail.com>
In-Reply-To: <CAOnJCUKgjJOxhx1evxTVra_zPbULU2thctF717S=sCCvjzX=mg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 12 Jan 2022 22:01:15 +0800
Message-ID: <CAEUhbmVNWMmNE-TQZ6OD6S1wPhWpYzvyrEwJGUr1vgVYNk_Png@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] target/riscv: Support mcycle/minstret write
 operation
To: Atish Patra <atishp@atishpatra.org>
Cc: Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
X-List-Received-Date: Wed, 12 Jan 2022 14:01:32 -0000

On Wed, Jan 12, 2022 at 3:58 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Sun, Jan 9, 2022 at 11:51 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Fri, Jan 7, 2022 at 10:14 AM Atish Patra <atishp@rivosinc.com> wrote:
> > >
> > > From: Atish Patra <atish.patra@wdc.com>
> > >
> > > mcycle/minstret are actually WARL registers and can be written with any
> > > given value. With SBI PMU extension, it will be used to store a initial
> > > value provided from supervisor OS. The Qemu also need prohibit the counter
> > > increment if mcountinhibit is set.
> > >
> > > Support mcycle/minstret through generic counter infrastructure.
> > >
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > ---
> > >  target/riscv/cpu.h       |  24 +++++--
> > >  target/riscv/csr.c       | 144 ++++++++++++++++++++++++++-------------
> > >  target/riscv/machine.c   |  26 ++++++-
> > >  target/riscv/meson.build |   1 +
> > >  target/riscv/pmu.c       |  32 +++++++++
> > >  target/riscv/pmu.h       |  28 ++++++++
> > >  6 files changed, 200 insertions(+), 55 deletions(-)
> > >  create mode 100644 target/riscv/pmu.c
> > >  create mode 100644 target/riscv/pmu.h
> > >
> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > index 39edc948d703..5fe9c51b38c7 100644
> > > --- a/target/riscv/cpu.h
> > > +++ b/target/riscv/cpu.h
> > > @@ -101,7 +101,7 @@ typedef struct CPURISCVState CPURISCVState;
> > >  #endif
> > >
> > >  #define RV_VLEN_MAX 1024
> > > -#define RV_MAX_MHPMEVENTS 29
> > > +#define RV_MAX_MHPMEVENTS 32
> > >  #define RV_MAX_MHPMCOUNTERS 32
> > >
> > >  FIELD(VTYPE, VLMUL, 0, 3)
> > > @@ -112,6 +112,19 @@ FIELD(VTYPE, VEDIV, 8, 2)
> > >  FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
> > >  FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
> > >
> > > +typedef struct PMUCTRState PMUCTRState;
> >
> > This 'typedef' can be merged into the definition below
> >
>
> Sure.
>
> >
> > > +struct PMUCTRState {
> > > +    /* Current value of a counter */
> > > +    target_ulong mhpmcounter_val;
> > > +    /* Current value of a counter in RV32*/
> > > +    target_ulong mhpmcounterh_val;
> > > +    /* Snapshot values of counter */
> > > +    target_ulong mhpmcounter_prev;
> > > +    /* Snapshort value of a counter in RV32 */
> > > +    target_ulong mhpmcounterh_prev;
> > > +    bool started;
> > > +};
> > > +
> > >  struct CPURISCVState {
> > >      target_ulong gpr[32];
> > >      uint64_t fpr[32]; /* assume both F and D extensions */
> > > @@ -226,13 +239,10 @@ struct CPURISCVState {
> > >
> > >      target_ulong mcountinhibit;
> > >
> > > -    /* PMU counter configured values */
> > > -    target_ulong mhpmcounter_val[RV_MAX_MHPMCOUNTERS];
> > > -
> > > -    /* for RV32 */
> > > -    target_ulong mhpmcounterh_val[RV_MAX_MHPMCOUNTERS];
> > > +    /* PMU counter state */
> > > +    PMUCTRState pmu_ctrs[RV_MAX_MHPMCOUNTERS];
> > >
> > > -    /* PMU event selector configured values */
> > > +    /* PMU event selector configured values. First three are unused*/
> > >      target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
> > >
> > >      target_ulong sscratch;
> > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > index 58a9550bd898..d4449ada557c 100644
> > > --- a/target/riscv/csr.c
> > > +++ b/target/riscv/csr.c
> > > @@ -20,6 +20,7 @@
> > >  #include "qemu/osdep.h"
> > >  #include "qemu/log.h"
> > >  #include "cpu.h"
> > > +#include "pmu.h"
> > >  #include "qemu/main-loop.h"
> > >  #include "exec/exec-all.h"
> > >
> > > @@ -461,41 +462,33 @@ static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
> > >  }
> > >
> > >  /* User Timers and Counters */
> > > -static RISCVException read_instret(CPURISCVState *env, int csrno,
> > > -                                   target_ulong *val)
> > > +static target_ulong get_icount_ticks(bool brv32)
> >
> > I would use 'rv32' instead of 'brv32'
> >
>
> ok.
>
> > >  {
> > > +    int64_t val;
> > > +    target_ulong result;
> > > +
> > >  #if !defined(CONFIG_USER_ONLY)
> > >      if (icount_enabled()) {
> > > -        *val = icount_get();
> > > +        val = icount_get();
> > >      } else {
> > > -        *val = cpu_get_host_ticks();
> > > +        val = cpu_get_host_ticks();
> > >      }
> > >  #else
> > > -    *val = cpu_get_host_ticks();
> > > +    val = cpu_get_host_ticks();
> > >  #endif
> > >
> > > -    return RISCV_EXCP_NONE;
> > > -}
> > > -
> > > -static RISCVException read_instreth(CPURISCVState *env, int csrno,
> > > -                                    target_ulong *val)
> > > -{
> > > -#if !defined(CONFIG_USER_ONLY)
> > > -    if (icount_enabled()) {
> > > -        *val = icount_get() >> 32;
> > > +    if (brv32) {
> > > +        result = val >> 32;
> > >      } else {
> > > -        *val = cpu_get_host_ticks() >> 32;
> > > +        result = val;
> > >      }
> > > -#else
> > > -    *val = cpu_get_host_ticks() >> 32;
> > > -#endif
> > >
> > > -    return RISCV_EXCP_NONE;
> > > +    return result;
> > >  }
> > >
> > >  static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
> > >  {
> > > -    int evt_index = csrno - CSR_MHPMEVENT3;
> > > +    int evt_index = csrno - CSR_MCOUNTINHIBIT;
> > >
> > >      *val = env->mhpmevent_val[evt_index];
> > >
> > > @@ -504,7 +497,7 @@ static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
> > >
> > >  static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
> > >  {
> > > -    int evt_index = csrno - CSR_MHPMEVENT3;
> > > +    int evt_index = csrno - CSR_MCOUNTINHIBIT;
> > >
> > >      env->mhpmevent_val[evt_index] = val;
> > >
> > > @@ -513,52 +506,99 @@ static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
> > >
> > >  static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong val)
> > >  {
> > > -    int ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
> > > +    int ctr_idx = csrno - CSR_MCYCLE;
> > > +    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
> > >
> > > -    env->mhpmcounter_val[ctr_index] = val;
> > > +    counter->mhpmcounter_val = val;
> > > +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> > > +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> > > +        counter->mhpmcounter_prev = get_icount_ticks(false);
> > > +     } else {
> > > +        /* Other counters can keep incrementing from the given value */
> > > +        counter->mhpmcounter_prev = val;
> > > +     }
> > >
> > > -    return RISCV_EXCP_NONE;
> > > +     return RISCV_EXCP_NONE;
> >
> > The indentation is wrong, which should be 4 spaces. The same issue
> > exists in above if .. else .. block.
> >
>
> Oops. will fix it.
>
> > >  }
> > >
> > >  static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulong val)
> > >  {
> > > -    int ctr_index = csrno - CSR_MHPMCOUNTER3H + 3;
> > > +    int ctr_idx = csrno - CSR_MCYCLEH;
> > > +    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
> > > +
> > > +    counter->mhpmcounterh_val = val;
> > > +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> > > +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> > > +        counter->mhpmcounterh_prev = get_icount_ticks(false);
> >
> > Should be get_icount_ticks(true)
> >
>
> Yup. Thanks for catching that.
>
> > > +    } else {
> > > +        counter->mhpmcounterh_prev = val;
> > > +    }
> > > +
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
> > > +                                    bool is_uh, uint32_t ctr_idx)
> >
> > nits: %s/is_uh/upper_half to make it more intuitive?
> >
>
> ok. will change it.
>
> > > +{
> > > +    PMUCTRState counter = env->pmu_ctrs[ctr_idx];
> > > +    target_ulong ctr_prev = is_uh ? counter.mhpmcounterh_prev :
> > > +                                    counter.mhpmcounter_prev;
> > > +    target_ulong ctr_val = is_uh ? counter.mhpmcounterh_val :
> > > +                                   counter.mhpmcounter_val;
> > >
> > > -    env->mhpmcounterh_val[ctr_index] = val;
> > > +    if (get_field(env->mcountinhibit, BIT(ctr_idx))) {
> > > +        /**
> > > +         * Counter should not increment if inhibit bit is set. We can't really
> > > +         * stop the icount counting. Just return the previous value to indicate
> > > +         * that counter was not incremented.
> > > +         */
> > > +        if (!counter.started) {
> > > +            *val = ctr_val;
> >
> > I think this should be *val = ctl_prev to match your comments?
> >
>
> ctr_val - has the value written from the supervisor previously
> ctr_prev - has the previous value read from the counter
>
> As the kernel should see the exact same value it has written
> previously to the counter
> it should ctr_val.
>
> The comment probably doesn't explain it correctly. I will update it.
>
> > > +            return RISCV_EXCP_NONE;
> > > +        } else {
> > > +            /* Mark that the counter has been stopped */
> > > +            counter.started = false;
> > > +        }
> > > +    }
> > > +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> > > +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> > > +        *val = get_icount_ticks(is_uh);
> > > +    } else {
> > > +        *val = ctr_val;
> >
> > *val = ctr_prev?
> >
>
> Yeah if we want to retain the below line.
> However, I think we can simplify by just moving the below line for if condition
> which is applicable only for cycles & instructions.
>
> > > +    }
> > > +
> > > +    /* No need to handle the overflow here */
> > > +    *val = *val - ctr_prev + ctr_val;
> >
> > I am not sure I understand the logic here.
> >
> > For cycle/instret counters, this logic becomes: new get_icount_ticks()
> > - get_icount_ticks() last time when counter was written + the counter
> > value last time when counter was written. This does not make sense.
> >
>
> The kernel computes the perf delta by subtracting the current value from
> the value it initialized previously.
>
> That's why we need to add the delta value (current get_icount_ticks()
> - previous get_icount_ticks())
> to the counter value it was written last time.
>
> Let me know if I should add a comment about this to avoid further confusion.
>

Yes, adding some comments definitely helps.

Regards,
Bin

