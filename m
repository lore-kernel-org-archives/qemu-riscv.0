Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEC6C4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 05:04:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRmU9-0007bY-Hw; Mon, 22 Jan 2024 00:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmU6-0007a4-07; Mon, 22 Jan 2024 00:04:35 -0500
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmU3-0004Gd-G9; Mon, 22 Jan 2024 00:04:33 -0500
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-7d2ded146cbso402543241.2; 
 Sun, 21 Jan 2024 21:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705899869; x=1706504669; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZs3I69q8ey7uEIfq45bpGkMYqMg37Pg9k2Gxa74Asg=;
 b=T+YxoDOqwOgSZNhGe9t22KvKQFWJdwkXw+1CjO/Lwk6diEq+5lgwPzg/mJGnKQNdAf
 64Ap05gHob7RoadTZmYbjvWvwg5ToeqcBJSE+5n25cZnTNC8dHIhnK86VoqDta2D7eQZ
 Gix5NwLoS8zv6sR0VZSBKsKuMY+jxv+j3BBSFrrmnx/UNyMVBFOcbSclv07ERehyUkpu
 YovZOVKA2Q5fq8I1RKtE0KVWeuO+nR26jbI3885QqZQIEgqnUwzCazWcAmjkB+oPZcH2
 /tkeQmo+8tEpbGPSvsqyDlumJymaLAv7uD62iauLarPtWpmrbSwsLiJuamHvVDwkqU9q
 s8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705899869; x=1706504669;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fZs3I69q8ey7uEIfq45bpGkMYqMg37Pg9k2Gxa74Asg=;
 b=UxaZKplwkXxKD3pqknWwPIC2h6oPAO0qgdEusxAby8D1PXB3+jeXJRCJaYDedp39wq
 Q3DB/Cvzxu1ohLEc5nUdGBmvizgNJqV7p8tZv/f4efASPaFOpQOAvwofCYAbDawm7qhn
 fNG27atcW7vmx9OE+yd5L7V73LVVEdaY/LTE1Xs8pD4d0rG7vj4Lqtqbs8z02uWSzC3L
 uWD5i6IDe2TTqCUZrvGTUYog/4y4p8YSU5wvsccar3o7YPLQd4/U5UlogHmjCQI8712P
 PVqNqeuGvAIxS7W8tTh52XRrOB7rovFNCupLLDPCcOcfCzChQQ6cHSUSW2oRMyxhZUYl
 v9Kg==
X-Gm-Message-State: AOJu0Yw72HvaAY46k/GMZgv4OtFpHuVdtxZImCkUElyX0jD804a8TfFH
 XKIh7fpGwpOFtsdFN2gECL0lALnEhLU2b/PCWdTKegfYu367th/X7s+JNT9dGW6zUxOz6BGkF++
 6yMi51Ag20CUIXeA0llVbPubDRDI=
X-Google-Smtp-Source: AGHT+IHUtbB7KDHeSPeq4D7ia4rIVEWYPCoir9tjcPGXqLF3VSicfNgsUC+Bemdi5fjqOTFfb42wU43Bm1EczQ7Yo9c=
X-Received: by 2002:ac5:c8b3:0:b0:4b7:209d:4b2e with SMTP id
 o19-20020ac5c8b3000000b004b7209d4b2emr797680vkl.22.1705899868770; Sun, 21 Jan
 2024 21:04:28 -0800 (PST)
MIME-Version: 1.0
References: <20240109002554.646572-1-atishp@rivosinc.com>
 <20240109002554.646572-6-atishp@rivosinc.com>
In-Reply-To: <20240109002554.646572-6-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 15:04:02 +1000
Message-ID: <CAKmqyKM2j=zeEObQuf+8kB78Ko3A-aaWBLpb24O0YVjg_FHcRA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] target/riscv: Implement privilege mode filtering
 for cycle/instret
To: Atish Patra <atishp@rivosinc.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, kaiwenxue1@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jan 9, 2024 at 10:29=E2=80=AFAM Atish Patra <atishp@rivosinc.com> w=
rote:
>
> Privilege mode filtering can also be emulated for cycle/instret by
> tracking host_ticks/icount during each privilege mode switch. This
> patch implements that for both cycle/instret and mhpmcounters. The
> first one requires Smcntrpmf while the other one requires Sscofpmf
> to be enabled.
>
> The cycle/instret are still computed using host ticks when icount
> is not enabled. Otherwise, they are computed using raw icount which
> is more accurate in icount mode.
>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/cpu.h        | 11 +++++
>  target/riscv/cpu_helper.c |  9 +++-
>  target/riscv/csr.c        | 95 ++++++++++++++++++++++++++++++---------
>  target/riscv/pmu.c        | 43 ++++++++++++++++++
>  target/riscv/pmu.h        |  2 +
>  5 files changed, 136 insertions(+), 24 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 34617c4c4bab..40d10726155b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -136,6 +136,15 @@ typedef struct PMUCTRState {
>      target_ulong irq_overflow_left;
>  } PMUCTRState;
>
> +typedef struct PMUFixedCtrState {
> +        /* Track cycle and icount for each privilege mode */
> +        uint64_t counter[4];
> +        uint64_t counter_prev[4];

Are these two used?

Alistair

> +        /* Track cycle and icount for each privilege mode when V =3D 1*/
> +        uint64_t counter_virt[2];
> +        uint64_t counter_virt_prev[2];
> +} PMUFixedCtrState;
> +
>  struct CPUArchState {
>      target_ulong gpr[32];
>      target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
> @@ -334,6 +343,8 @@ struct CPUArchState {
>      /* PMU event selector configured values for RV32 */
>      target_ulong mhpmeventh_val[RV_MAX_MHPMEVENTS];
>
> +    PMUFixedCtrState pmu_fixed_ctrs[2];
> +
>      target_ulong sscratch;
>      target_ulong mscratch;
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e7e23b34f455..3dddb1b433e8 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -715,8 +715,13 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_u=
long newpriv)
>  {
>      g_assert(newpriv <=3D PRV_M && newpriv !=3D PRV_RESERVED);
>
> -    if (icount_enabled() && newpriv !=3D env->priv) {
> -        riscv_itrigger_update_priv(env);
> +    if (newpriv !=3D env->priv) {
> +        if (icount_enabled()) {
> +            riscv_itrigger_update_priv(env);
> +            riscv_pmu_icount_update_priv(env, newpriv);
> +        } else {
> +            riscv_pmu_cycle_update_priv(env, newpriv);
> +        }
>      }
>      /* tlb_flush is unnecessary as mode is contained in mmu_idx */
>      env->priv =3D newpriv;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 3bd4aa22374f..307d052021c5 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -782,32 +782,16 @@ static int write_vcsr(CPURISCVState *env, int csrno=
, target_ulong val)
>      return RISCV_EXCP_NONE;
>  }
>
> +#if defined(CONFIG_USER_ONLY)
>  /* User Timers and Counters */
>  static target_ulong get_ticks(bool shift)
>  {
> -    int64_t val;
> -    target_ulong result;
> -
> -#if !defined(CONFIG_USER_ONLY)
> -    if (icount_enabled()) {
> -        val =3D icount_get();
> -    } else {
> -        val =3D cpu_get_host_ticks();
> -    }
> -#else
> -    val =3D cpu_get_host_ticks();
> -#endif
> -
> -    if (shift) {
> -        result =3D val >> 32;
> -    } else {
> -        result =3D val;
> -    }
> +    int64_t val =3D cpu_get_host_ticks();
> +    target_ulong result =3D shift ? val >> 32 : val;
>
>      return result;
>  }
>
> -#if defined(CONFIG_USER_ONLY)
>  static RISCVException read_time(CPURISCVState *env, int csrno,
>                                  target_ulong *val)
>  {
> @@ -932,6 +916,70 @@ static int write_mhpmeventh(CPURISCVState *env, int =
csrno, target_ulong val)
>      return RISCV_EXCP_NONE;
>  }
>
> +static target_ulong riscv_pmu_ctr_get_fixed_counters_val(CPURISCVState *=
env,
> +                                                         int counter_idx=
,
> +                                                         bool upper_half=
)
> +{
> +    uint64_t curr_val =3D 0;
> +    target_ulong result =3D 0;
> +    uint64_t *counter_arr =3D icount_enabled() ? env->pmu_fixed_ctrs[1].=
counter :
> +                            env->pmu_fixed_ctrs[0].counter;
> +    uint64_t *counter_arr_virt =3D icount_enabled() ?
> +                                 env->pmu_fixed_ctrs[1].counter_virt :
> +                                 env->pmu_fixed_ctrs[0].counter_virt;
> +    uint64_t cfg_val =3D 0;
> +
> +    if (counter_idx =3D=3D 0) {
> +        cfg_val =3D upper_half ? ((uint64_t)env->mcyclecfgh << 32) :
> +                  env->mcyclecfg;
> +    } else if (counter_idx =3D=3D 2) {
> +        cfg_val =3D upper_half ? ((uint64_t)env->minstretcfgh << 32) :
> +                  env->minstretcfg;
> +    } else {
> +        cfg_val =3D upper_half ?
> +                  ((uint64_t)env->mhpmeventh_val[counter_idx] << 32) :
> +                  env->mhpmevent_val[counter_idx];
> +    }
> +
> +    if (!cfg_val) {
> +        if (icount_enabled()) {
> +            curr_val =3D icount_get_raw();
> +        } else {
> +            curr_val =3D cpu_get_host_ticks();
> +        }
> +        goto done;
> +    }
> +
> +    if (!(cfg_val & MCYCLECFG_BIT_MINH)) {
> +        curr_val +=3D counter_arr[PRV_M];
> +    }
> +
> +    if (!(cfg_val & MCYCLECFG_BIT_SINH)) {
> +        curr_val +=3D counter_arr[PRV_S];
> +    }
> +
> +    if (!(cfg_val & MCYCLECFG_BIT_UINH)) {
> +        curr_val +=3D counter_arr[PRV_U];
> +    }
> +
> +    if (!(cfg_val & MCYCLECFG_BIT_VSINH)) {
> +        curr_val +=3D counter_arr_virt[PRV_S];
> +    }
> +
> +    if (!(cfg_val & MCYCLECFG_BIT_VUINH)) {
> +        curr_val +=3D counter_arr_virt[PRV_U];
> +    }
> +
> +done:
> +    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> +        result =3D upper_half ? curr_val >> 32 : curr_val;
> +    } else {
> +        result =3D curr_val;
> +    }
> +
> +    return result;
> +}
> +
>  static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong=
 val)
>  {
>      int ctr_idx =3D csrno - CSR_MCYCLE;
> @@ -941,7 +989,8 @@ static int write_mhpmcounter(CPURISCVState *env, int =
csrno, target_ulong val)
>      counter->mhpmcounter_val =3D val;
>      if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>          riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> -        counter->mhpmcounter_prev =3D get_ticks(false);
> +        counter->mhpmcounter_prev =3D riscv_pmu_ctr_get_fixed_counters_v=
al(env,
> +                                                                ctr_idx,=
 false);
>          if (ctr_idx > 2) {
>              if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
>                  mhpmctr_val =3D mhpmctr_val |
> @@ -968,7 +1017,8 @@ static int write_mhpmcounterh(CPURISCVState *env, in=
t csrno, target_ulong val)
>      mhpmctr_val =3D mhpmctr_val | (mhpmctrh_val << 32);
>      if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>          riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> -        counter->mhpmcounterh_prev =3D get_ticks(true);
> +        counter->mhpmcounterh_prev =3D riscv_pmu_ctr_get_fixed_counters_=
val(env,
> +                                                                 ctr_idx=
, true);
>          if (ctr_idx > 2) {
>              riscv_pmu_setup_timer(env, mhpmctr_val, ctr_idx);
>          }
> @@ -1009,7 +1059,8 @@ static RISCVException riscv_pmu_read_ctr(CPURISCVSt=
ate *env, target_ulong *val,
>       */
>      if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>          riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> -        *val =3D get_ticks(upper_half) - ctr_prev + ctr_val;
> +        *val =3D riscv_pmu_ctr_get_fixed_counters_val(env, ctr_idx, uppe=
r_half) -
> +                                                    ctr_prev + ctr_val;
>      } else {
>          *val =3D ctr_val;
>      }
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 0e7d58b8a5c2..8b6cc4c6bb4d 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -19,6 +19,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qemu/error-report.h"
> +#include "qemu/timer.h"
>  #include "cpu.h"
>  #include "pmu.h"
>  #include "sysemu/cpu-timers.h"
> @@ -176,6 +177,48 @@ static int riscv_pmu_incr_ctr_rv64(RISCVCPU *cpu, ui=
nt32_t ctr_idx)
>      return 0;
>  }
>
> +void riscv_pmu_icount_update_priv(CPURISCVState *env, target_ulong newpr=
iv)
> +{
> +    uint64_t delta;
> +    uint64_t *counter_arr;
> +    uint64_t *counter_arr_prev;
> +    uint64_t current_icount =3D icount_get_raw();
> +
> +    if (env->virt_enabled) {
> +        counter_arr =3D env->pmu_fixed_ctrs[1].counter_virt;
> +        counter_arr_prev =3D env->pmu_fixed_ctrs[1].counter_virt_prev;
> +    } else {
> +        counter_arr =3D env->pmu_fixed_ctrs[1].counter;
> +        counter_arr_prev =3D env->pmu_fixed_ctrs[1].counter_prev;
> +    }
> +
> +    counter_arr_prev[newpriv] =3D current_icount;
> +    delta =3D current_icount - counter_arr_prev[env->priv];
> +
> +    counter_arr[env->priv] +=3D delta;
> +}
> +
> +void riscv_pmu_cycle_update_priv(CPURISCVState *env, target_ulong newpri=
v)
> +{
> +    uint64_t delta;
> +    uint64_t *counter_arr;
> +    uint64_t *counter_arr_prev;
> +    uint64_t current_host_ticks =3D cpu_get_host_ticks();
> +
> +    if (env->virt_enabled) {
> +        counter_arr =3D env->pmu_fixed_ctrs[0].counter_virt;
> +        counter_arr_prev =3D env->pmu_fixed_ctrs[0].counter_virt_prev;
> +    } else {
> +        counter_arr =3D env->pmu_fixed_ctrs[0].counter;
> +        counter_arr_prev =3D env->pmu_fixed_ctrs[0].counter_prev;
> +    }
> +
> +    counter_arr_prev[newpriv] =3D current_host_ticks;
> +    delta =3D current_host_ticks - counter_arr_prev[env->priv];
> +
> +    counter_arr[env->priv] +=3D delta;
> +}
> +
>  int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx=
)
>  {
>      uint32_t ctr_idx;
> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> index 505fc850d38e..50de6031a730 100644
> --- a/target/riscv/pmu.h
> +++ b/target/riscv/pmu.h
> @@ -31,3 +31,5 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_ev=
ent_idx event_idx);
>  void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_na=
me);
>  int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
>                            uint32_t ctr_idx);
> +void riscv_pmu_icount_update_priv(CPURISCVState *env, target_ulong newpr=
iv);
> +void riscv_pmu_cycle_update_priv(CPURISCVState *env, target_ulong newpri=
v);
> --
> 2.34.1
>
>

