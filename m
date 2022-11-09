Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osttz-00081E-Qs
	for mharc-qemu-riscv@gnu.org; Wed, 09 Nov 2022 17:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ostty-00080t-WB; Wed, 09 Nov 2022 17:50:35 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1osttx-0004fR-5Q; Wed, 09 Nov 2022 17:50:34 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 z5-20020a17090a8b8500b00210a3a2364fso4636692pjn.0; 
 Wed, 09 Nov 2022 14:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Nnjg7sYGcGV8ZMC7cM2uPN/IB+TuO9/gM8xS8DM9fYE=;
 b=Bu2fcSZPwe4BPMaPa6J4bed6gGGMhFFntfCjMhYLFb7AWntxVwi7qfD5X1/ggbqOn7
 JGxqqggmmpewD+szy4K4PDN87zkfvYiJaJmwfL3fS02GFBqJKY3/2Pg32opje22o+kF4
 uahAYyfyM3bsmHKAvLTr4y+4F0RRbFMbabQqBsYO4GLdM3XaSdyzZdXwT/hxz8h50QmI
 oJjjO06JhUvUE5dTZhMBmYkWXtSHL9qSPULq0lkAX38bFUeyvXejPhyJJwyDqkCA0dJW
 iBKSwJX5zHx5/2mi/2s8+YgNPGc8eDNn0EkHCMCERey2HH9qX/6x00eghy9OfMW9xrSM
 r2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nnjg7sYGcGV8ZMC7cM2uPN/IB+TuO9/gM8xS8DM9fYE=;
 b=CDcJcFjQ0c5eHF3niywR/gdZDnspdbsqiEqOTZRPAoOMzxw227ODyA/+SB21GtrxFx
 D4Yfvo+exyswe1K3zjEJD442fmFV2TxD64FvbSUpCH2pnaa9gPW9HRRNuVWltTEsrTYE
 C6PTX0r1yV/AD8fVqJlKp1YqqbboJStk3A6j6P9TergY/7IWn1j1HZyqI2FfVH8PL91G
 rsyXbmMjx7DR164Pdw3dq4SZm50f29eg6dqEdodmzQD64Zc1TL7jKG92fK9NpcY0Ks5+
 KQvH8QliGTtIPL1aJb6ef+cpc/0XXxXYwsSbeYO+3zlOhSqEW9QmS5y2ocgQXgSdw/r6
 9vfA==
X-Gm-Message-State: ACrzQf2B4PYfJ72lFZ+FcN0S6YPkJ/Pzmwq2FkwYDUM0iY59CDita1qc
 4apTdmOzeE9fH3pguquuZYeCpaYwvVWgNH2QIas=
X-Google-Smtp-Source: AMsMyM5+no1gblYIAStj7C0B4lH+gTKtDmBBEsbmlFZ4ZIuYz4zcRBwEfNGLyk+ytuBaGEvEYzco75k9AN362MX9x64=
X-Received: by 2002:a17:902:7294:b0:187:146c:316f with SMTP id
 d20-20020a170902729400b00187146c316fmr57105475pll.149.1668034231201; Wed, 09
 Nov 2022 14:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
 <20221013062946.7530-3-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20221013062946.7530-3-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Nov 2022 08:50:04 +1000
Message-ID: <CAKmqyKOFKjHG22h-=E4gvhXoq8N2GWeqsV++4pXoYyFG_Hqrow@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] target/riscv: Add itrigger support when icount is
 enabled
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, sergey.matyukevich@syntacore.com, 
 vladimir.isaev@syntacore.com, anatoly.parshintsev@syntacore.com, 
 philipp.tomsich@vrull.eu, zhiwei_liu@c-sky.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 09 Nov 2022 22:50:35 -0000

On Thu, Oct 13, 2022 at 4:43 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>
> The max count in itrigger can be 0x3FFF, which will cause a no trivial
> translation and execution overload.
>
> When icount is enabled, QEMU provides API that can fetch guest
> instruction number. Thus, we can set an timer for itrigger with
> the count as deadline.
>
> Only when timer expires or priviledge mode changes, do lazy update
> to count.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h        |  2 ++
>  target/riscv/cpu_helper.c |  3 ++
>  target/riscv/debug.c      | 59 +++++++++++++++++++++++++++++++++++++++
>  target/riscv/debug.h      |  1 +
>  4 files changed, 65 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 24bafda27d..13ca0f20ae 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -329,6 +329,8 @@ struct CPUArchState {
>      target_ulong tdata3[RV_MAX_TRIGGERS];
>      struct CPUBreakpoint *cpu_breakpoint[RV_MAX_TRIGGERS];
>      struct CPUWatchpoint *cpu_watchpoint[RV_MAX_TRIGGERS];
> +    QEMUTimer *itrigger_timer[RV_MAX_TRIGGERS];
> +    int64_t last_icount;
>
>      /* machine specific rdtime callback */
>      uint64_t (*rdtime_fn)(void *);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 263282f230..7d8089b218 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -676,6 +676,9 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>      if (newpriv == PRV_H) {
>          newpriv = PRV_U;
>      }
> +    if (icount_enabled() && newpriv != env->priv) {
> +        riscv_itrigger_update_priv(env);
> +    }
>      /* tlb_flush is unnecessary as mode is contained in mmu_idx */
>      env->priv = newpriv;
>      env->xl = cpu_recompute_xl(env);
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 45a3537d5c..5ff70430a1 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -30,6 +30,7 @@
>  #include "trace.h"
>  #include "exec/exec-all.h"
>  #include "exec/helper-proto.h"
> +#include "sysemu/cpu-timers.h"
>
>  /*
>   * The following M-mode trigger CSRs are implemented:
> @@ -569,6 +570,62 @@ void helper_itrigger_match(CPURISCVState *env)
>      }
>  }
>
> +static void riscv_itrigger_update_count(CPURISCVState *env)
> +{
> +    int count, executed;
> +    /*
> +     * Record last icount, so that we can evaluate the executed instructions
> +     * since last priviledge mode change or timer expire.
> +     */
> +    int64_t last_icount = env->last_icount, current_icount;
> +    current_icount = env->last_icount = icount_get_raw();
> +
> +    for (int i = 0; i < RV_MAX_TRIGGERS; i++) {
> +        if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
> +            continue;
> +        }
> +        count = itrigger_get_count(env, i);
> +        if (!count) {
> +            continue;
> +        }
> +        /*
> +         * Only when priviledge is changed or itrigger timer expires,
> +         * the count field in itrigger tdata1 register is updated.
> +         * And the count field in itrigger only contains remaining value.
> +         */
> +        if (check_itrigger_priv(env, i)) {
> +            /*
> +             * If itrigger enabled in this priviledge mode, the number of
> +             * executed instructions since last priviledge change
> +             * should be reduced from current itrigger count.
> +             */
> +            executed = current_icount - last_icount;
> +            itrigger_set_count(env, i, count - executed);
> +            if (count == executed) {
> +                do_trigger_action(env, i);
> +            }
> +        } else {
> +            /*
> +             * If itrigger is not enabled in this priviledge mode,
> +             * the number of executed instructions will be discard and
> +             * the count field in itrigger will not change.
> +             */
> +            timer_mod(env->itrigger_timer[i],
> +                      current_icount + count);
> +        }
> +    }
> +}
> +
> +static void riscv_itrigger_timer_cb(void *opaque)
> +{
> +    riscv_itrigger_update_count((CPURISCVState *)opaque);
> +}
> +
> +void riscv_itrigger_update_priv(CPURISCVState *env)
> +{
> +    riscv_itrigger_update_count(env);
> +}
> +
>  target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
>  {
>      switch (tdata_index) {
> @@ -798,5 +855,7 @@ void riscv_trigger_init(CPURISCVState *env)
>          env->tdata3[i] = 0;
>          env->cpu_breakpoint[i] = NULL;
>          env->cpu_watchpoint[i] = NULL;
> +        env->itrigger_timer[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                              riscv_itrigger_timer_cb, env);
>      }
>  }
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index cc3358e69b..c471748d5a 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -146,4 +146,5 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
>  void riscv_trigger_init(CPURISCVState *env);
>
>  bool riscv_itrigger_enabled(CPURISCVState *env);
> +void riscv_itrigger_update_priv(CPURISCVState *env);
>  #endif /* RISCV_DEBUG_H */
> --
> 2.17.1
>
>

