Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjvgG-0008PS-6e
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvg8-0008M8-Ga; Wed, 05 Apr 2023 01:27:28 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvg3-0004fj-LH; Wed, 05 Apr 2023 01:27:28 -0400
Received: by mail-ua1-x931.google.com with SMTP id h34so24825803uag.4;
 Tue, 04 Apr 2023 22:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680672441;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ipDZMwwHssrHpy4Kd9NNVfbXkKvxh1a1wZE2wc/u9aY=;
 b=kvjBi5yYPioyG4DFbATqnobU4BWrVseokHp91dd6EYe6JMmWEEV2GlesQyc73IWapY
 TzYUl0znnRPJnns/VVNKYyJ1I3nfE820q8b62pDD1wtu3f149oz9u4iG0vfnU9MwbDWH
 12dEfxQMSwqnCJ42f/OaLaJjbLDck7l236Q1JYSvjqeuvmYwgEAP78wPZ0oWrkkJwBaW
 wmIOkId4L1Yhu2sFXmGSRMN7OHyFnkp3Fb+Now3vgWA4dLs655PyEf6lb3Z1uspBGufF
 iQLuB/NqS1uu7F9/d1XmF93dxgU1CHku/bwOvxI4zNa6Zv68SbB3MThebtuHJ1dR6Ntr
 AGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680672441;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ipDZMwwHssrHpy4Kd9NNVfbXkKvxh1a1wZE2wc/u9aY=;
 b=h0o/hvs0aYfW3nukgh5oiriAWMJFYIBX2PuRH5QlvOpjruK2T1WG9EPHH8GjYkOrVc
 6xJnPinjROu8Kc2Atm6miWpAqNqVh3QI/zq960T62q7qZ9b9faBkWtZm6RC5xc4amUf0
 qB8uSD35FxJeHogYQjDQXWJ+Jx7501gOuIjaadzPxcUx5QvwrBT8G3pN1yII36mCse/H
 c6kBl/0LXkM5k/4ceHAiBGUFFrQxINJVlGU0BvNGdGGXlBiaG0o5V4Wck4m2/fgbfZOH
 bHqBttUklFybJoVJQuNLx1HoO6/O8+mzaj6AyEGdVcUbb1Z2X4Tl0atY9fMbfkgEkuyh
 a4fQ==
X-Gm-Message-State: AAQBX9eAkPRz8uHwFPxHkEBvmwN5nIXrbUgEOAfllcsqW3AX483pUPmU
 BSKePFocc/SRVvfEmDzoVlRtjVSdNeYUiDkyi0w=
X-Google-Smtp-Source: AKy350b1+UtxMkpRQ08va7v+1W7ZrwOOJQ+VxrtQZjx/5AJE4hA3fg/ZvQLndYo4etKdFTYDzu8BczW8RyY1m5dKWnM=
X-Received: by 2002:ab0:7ce:0:b0:68d:6360:77b with SMTP id
 d14-20020ab007ce000000b0068d6360077bmr3201349uaf.1.1680672441124; 
 Tue, 04 Apr 2023 22:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
 <20230327080858.39703-7-liweiwei@iscas.ac.cn>
In-Reply-To: <20230327080858.39703-7-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:26:54 +1000
Message-ID: <CAKmqyKOue4eq1Y-LMs563E6fbUhg6u6+QSg1ZZ-szOR=tZd1qQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] target/riscv: Remove riscv_cpu_virt_enabled()
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 05:27:28 -0000

On Mon, Mar 27, 2023 at 6:10=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Directly use env->virt_enabled instead.
>
> Suggested-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c        |  2 +-
>  target/riscv/cpu.h        |  1 -
>  target/riscv/cpu_helper.c | 51 ++++++++++++++++++---------------------
>  target/riscv/csr.c        | 46 +++++++++++++++++------------------
>  target/riscv/debug.c      | 10 ++++----
>  target/riscv/op_helper.c  | 18 +++++++-------
>  target/riscv/pmu.c        |  4 +--
>  target/riscv/translate.c  |  2 +-
>  8 files changed, 64 insertions(+), 70 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 16e465a0ab..e71b4d24a7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -549,7 +549,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *=
f, int flags)
>
>  #if !defined(CONFIG_USER_ONLY)
>      if (riscv_has_ext(env, RVH)) {
> -        qemu_fprintf(f, " %s %d\n", "V      =3D  ", riscv_cpu_virt_enabl=
ed(env));
> +        qemu_fprintf(f, " %s %d\n", "V      =3D  ", env->virt_enabled);
>      }
>  #endif
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 22dc5ddb95..dc9817b40d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -576,7 +576,6 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env);
>  target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
>  void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
>  bool riscv_cpu_vector_enabled(CPURISCVState *env);
> -bool riscv_cpu_virt_enabled(CPURISCVState *env);
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
>  bool riscv_cpu_two_stage_lookup(int mmu_idx);
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index c7bc3fc553..1ad39e7157 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -93,8 +93,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ul=
ong *pc,
>
>      if (riscv_has_ext(env, RVH)) {
>          if (env->priv =3D=3D PRV_M ||
> -            (env->priv =3D=3D PRV_S && !riscv_cpu_virt_enabled(env)) ||
> -            (env->priv =3D=3D PRV_U && !riscv_cpu_virt_enabled(env) &&
> +            (env->priv =3D=3D PRV_S && !env->virt_enabled) ||
> +            (env->priv =3D=3D PRV_U && !env->virt_enabled &&
>                  get_field(env->hstatus, HSTATUS_HU))) {
>              flags =3D FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
>          }
> @@ -391,7 +391,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState =
*env)
>      uint64_t irqs, pending, mie, hsie, vsie;
>
>      /* Determine interrupt enable state of all privilege modes */
> -    if (riscv_cpu_virt_enabled(env)) {
> +    if (env->virt_enabled) {
>          mie =3D 1;
>          hsie =3D 1;
>          vsie =3D (env->priv < PRV_S) ||
> @@ -452,7 +452,7 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int inter=
rupt_request)
>  bool riscv_cpu_fp_enabled(CPURISCVState *env)
>  {
>      if (env->mstatus & MSTATUS_FS) {
> -        if (riscv_cpu_virt_enabled(env) && !(env->mstatus_hs & MSTATUS_F=
S)) {
> +        if (env->virt_enabled && !(env->mstatus_hs & MSTATUS_FS)) {
>              return false;
>          }
>          return true;
> @@ -465,7 +465,7 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
>  bool riscv_cpu_vector_enabled(CPURISCVState *env)
>  {
>      if (env->mstatus & MSTATUS_VS) {
> -        if (riscv_cpu_virt_enabled(env) && !(env->mstatus_hs & MSTATUS_V=
S)) {
> +        if (env->virt_enabled && !(env->mstatus_hs & MSTATUS_VS)) {
>              return false;
>          }
>          return true;
> @@ -483,7 +483,7 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *en=
v)
>      if (riscv_has_ext(env, RVF)) {
>          mstatus_mask |=3D MSTATUS_FS;
>      }
> -    bool current_virt =3D riscv_cpu_virt_enabled(env);
> +    bool current_virt =3D env->virt_enabled;
>
>      g_assert(riscv_has_ext(env, RVH));
>
> @@ -558,11 +558,6 @@ void riscv_cpu_set_geilen(CPURISCVState *env, target=
_ulong geilen)
>      env->geilen =3D geilen;
>  }
>
> -bool riscv_cpu_virt_enabled(CPURISCVState *env)
> -{
> -    return env->virt_enabled;
> -}
> -
>  /* This function can only be called to set virt when RVH is enabled */
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
>  {
> @@ -609,7 +604,7 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uin=
t64_t mask,
>      CPUState *cs =3D env_cpu(env);
>      uint64_t gein, vsgein =3D 0, vstip =3D 0, old =3D env->mip;
>
> -    if (riscv_cpu_virt_enabled(env)) {
> +    if (env->virt_enabled) {
>          gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
>          vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
>      }
> @@ -768,7 +763,7 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
>       * was called. Background registers will be used if the guest has
>       * forced a two stage translation to be on (in HS or M mode).
>       */
> -    if (!riscv_cpu_virt_enabled(env) && two_stage) {
> +    if (!env->virt_enabled && two_stage) {
>          use_background =3D true;
>      }
>
> @@ -931,7 +926,7 @@ restart:
>          bool pbmte =3D env->menvcfg & MENVCFG_PBMTE;
>          bool hade =3D env->menvcfg & MENVCFG_HADE;
>
> -        if (first_stage && two_stage && riscv_cpu_virt_enabled(env)) {
> +        if (first_stage && two_stage && env->virt_enabled) {
>              pbmte =3D pbmte && (env->henvcfg & HENVCFG_PBMTE);
>              hade =3D hade && (env->henvcfg & HENVCFG_HADE);
>          }
> @@ -1091,7 +1086,7 @@ static void raise_mmu_exception(CPURISCVState *env,=
 target_ulong address,
>
>      switch (access_type) {
>      case MMU_INST_FETCH:
> -        if (riscv_cpu_virt_enabled(env) && !first_stage) {
> +        if (env->virt_enabled && !first_stage) {
>              cs->exception_index =3D RISCV_EXCP_INST_GUEST_PAGE_FAULT;
>          } else {
>              cs->exception_index =3D page_fault_exceptions ?
> @@ -1131,11 +1126,11 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs=
, vaddr addr)
>      int mmu_idx =3D cpu_mmu_index(&cpu->env, false);
>
>      if (get_physical_address(env, &phys_addr, &prot, addr, NULL, 0, mmu_=
idx,
> -                             true, riscv_cpu_virt_enabled(env), true)) {
> +                             true, env->virt_enabled, true)) {
>          return -1;
>      }
>
> -    if (riscv_cpu_virt_enabled(env)) {
> +    if (env->virt_enabled) {
>          if (get_physical_address(env, &phys_addr, &prot, phys_addr, NULL=
,
>                                   0, mmu_idx, false, true, true)) {
>              return -1;
> @@ -1163,7 +1158,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, =
hwaddr physaddr,
>      }
>
>      env->badaddr =3D addr;
> -    env->two_stage_lookup =3D riscv_cpu_virt_enabled(env) ||
> +    env->two_stage_lookup =3D env->virt_enabled ||
>                              riscv_cpu_two_stage_lookup(mmu_idx);
>      env->two_stage_indirect_lookup =3D false;
>      cpu_loop_exit_restore(cs, retaddr);
> @@ -1189,7 +1184,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, va=
ddr addr,
>          g_assert_not_reached();
>      }
>      env->badaddr =3D addr;
> -    env->two_stage_lookup =3D riscv_cpu_virt_enabled(env) ||
> +    env->two_stage_lookup =3D env->virt_enabled ||
>                              riscv_cpu_two_stage_lookup(mmu_idx);
>      env->two_stage_indirect_lookup =3D false;
>      cpu_loop_exit_restore(cs, retaddr);
> @@ -1253,7 +1248,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>      }
>
>      pmu_tlb_fill_incr_ctr(cpu, access_type);
> -    if (riscv_cpu_virt_enabled(env) ||
> +    if (env->virt_enabled ||
>          ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
>           access_type !=3D MMU_INST_FETCH)) {
>          /* Two stage lookup */
> @@ -1351,7 +1346,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>      } else {
>          raise_mmu_exception(env, address, access_type, pmp_violation,
>                              first_stage_error,
> -                            riscv_cpu_virt_enabled(env) ||
> +                            env->virt_enabled ||
>                                  riscv_cpu_two_stage_lookup(mmu_idx),
>                              two_stage_indirect_error);
>          cpu_loop_exit_restore(cs, retaddr);
> @@ -1658,9 +1653,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>
>              if (env->priv =3D=3D PRV_M) {
>                  cause =3D RISCV_EXCP_M_ECALL;
> -            } else if (env->priv =3D=3D PRV_S && riscv_cpu_virt_enabled(=
env)) {
> +            } else if (env->priv =3D=3D PRV_S && env->virt_enabled) {
>                  cause =3D RISCV_EXCP_VS_ECALL;
> -            } else if (env->priv =3D=3D PRV_S && !riscv_cpu_virt_enabled=
(env)) {
> +            } else if (env->priv =3D=3D PRV_S && !env->virt_enabled) {
>                  cause =3D RISCV_EXCP_S_ECALL;
>              } else if (env->priv =3D=3D PRV_U) {
>                  cause =3D RISCV_EXCP_U_ECALL;
> @@ -1683,7 +1678,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          if (riscv_has_ext(env, RVH)) {
>              uint64_t hdeleg =3D async ? env->hideleg : env->hedeleg;
>
> -            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) =
{
> +            if (env->virt_enabled && ((hdeleg >> cause) & 1)) {
>                  /* Trap to VS mode */
>                  /*
>                   * See if we need to adjust cause. Yes if its VS mode in=
terrupt
> @@ -1694,7 +1689,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                      cause =3D cause - 1;
>                  }
>                  write_gva =3D false;
> -            } else if (riscv_cpu_virt_enabled(env)) {
> +            } else if (env->virt_enabled) {
>                  /* Trap into HS mode, from virt */
>                  riscv_cpu_swap_hypervisor_regs(env);
>                  env->hstatus =3D set_field(env->hstatus, HSTATUS_SPVP,
> @@ -1728,12 +1723,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      } else {
>          /* handle the trap in M-mode */
>          if (riscv_has_ext(env, RVH)) {
> -            if (riscv_cpu_virt_enabled(env)) {
> +            if (env->virt_enabled) {
>                  riscv_cpu_swap_hypervisor_regs(env);
>              }
>              env->mstatus =3D set_field(env->mstatus, MSTATUS_MPV,
> -                                     riscv_cpu_virt_enabled(env));
> -            if (riscv_cpu_virt_enabled(env) && tval) {
> +                                     env->virt_enabled);
> +            if (env->virt_enabled && tval) {
>                  env->mstatus =3D set_field(env->mstatus, MSTATUS_GVA, 1)=
;
>              }
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8f4d5eb13f..4ccd5dbfb5 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -46,7 +46,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations =
*ops)
>  static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
>                                         uint64_t bit)
>  {
> -    bool virt =3D riscv_cpu_virt_enabled(env);
> +    bool virt =3D env->virt_enabled;
>
>      if (env->priv =3D=3D PRV_M || !riscv_cpu_cfg(env)->ext_smstateen) {
>          return RISCV_EXCP_NONE;
> @@ -136,7 +136,7 @@ skip_ext_pmu_check:
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> -    if (riscv_cpu_virt_enabled(env)) {
> +    if (env->virt_enabled) {
>          if (!get_field(env->hcounteren, ctr_mask) ||
>              (env->priv =3D=3D PRV_U && !get_field(env->scounteren, ctr_m=
ask))) {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> @@ -350,7 +350,7 @@ static RISCVException hstateenh(CPURISCVState *env, i=
nt csrno)
>
>  static RISCVException sstateen(CPURISCVState *env, int csrno)
>  {
> -    bool virt =3D riscv_cpu_virt_enabled(env);
> +    bool virt =3D env->virt_enabled;
>      int index =3D csrno - CSR_SSTATEEN0;
>
>      if (!riscv_cpu_cfg(env)->ext_smstateen) {
> @@ -415,7 +415,7 @@ static RISCVException sstc(CPURISCVState *env, int cs=
rno)
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> -    if (riscv_cpu_virt_enabled(env)) {
> +    if (env->virt_enabled) {
>          if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
>                get_field(env->henvcfg, HENVCFG_STCE))) {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> @@ -521,7 +521,7 @@ static RISCVException seed(CPURISCVState *env, int cs=
rno)
>       */
>      if (env->priv =3D=3D PRV_M) {
>          return RISCV_EXCP_NONE;
> -    } else if (riscv_cpu_virt_enabled(env)) {
> +    } else if (env->virt_enabled) {
>          if (env->mseccfg & MSECCFG_SSEED) {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          } else {
> @@ -949,7 +949,7 @@ static int read_scountovf(CPURISCVState *env, int csr=
no, target_ulong *val)
>  static RISCVException read_time(CPURISCVState *env, int csrno,
>                                  target_ulong *val)
>  {
> -    uint64_t delta =3D riscv_cpu_virt_enabled(env) ? env->htimedelta : 0=
;
> +    uint64_t delta =3D env->virt_enabled ? env->htimedelta : 0;
>
>      if (!env->rdtime_fn) {
>          return RISCV_EXCP_ILLEGAL_INST;
> @@ -962,7 +962,7 @@ static RISCVException read_time(CPURISCVState *env, i=
nt csrno,
>  static RISCVException read_timeh(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> -    uint64_t delta =3D riscv_cpu_virt_enabled(env) ? env->htimedelta : 0=
;
> +    uint64_t delta =3D env->virt_enabled ? env->htimedelta : 0;
>
>      if (!env->rdtime_fn) {
>          return RISCV_EXCP_ILLEGAL_INST;
> @@ -1016,7 +1016,7 @@ static RISCVException write_vstimecmph(CPURISCVStat=
e *env, int csrno,
>  static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
>                                      target_ulong *val)
>  {
> -    if (riscv_cpu_virt_enabled(env)) {
> +    if (env->virt_enabled) {
>          *val =3D env->vstimecmp;
>      } else {
>          *val =3D env->stimecmp;
> @@ -1028,7 +1028,7 @@ static RISCVException read_stimecmp(CPURISCVState *=
env, int csrno,
>  static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
>                                       target_ulong *val)
>  {
> -    if (riscv_cpu_virt_enabled(env)) {
> +    if (env->virt_enabled) {
>          *val =3D env->vstimecmp >> 32;
>      } else {
>          *val =3D env->stimecmp >> 32;
> @@ -1040,7 +1040,7 @@ static RISCVException read_stimecmph(CPURISCVState =
*env, int csrno,
>  static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
>                                       target_ulong val)
>  {
> -    if (riscv_cpu_virt_enabled(env)) {
> +    if (env->virt_enabled) {
>          if (env->hvictl & HVICTL_VTI) {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
> @@ -1061,7 +1061,7 @@ static RISCVException write_stimecmp(CPURISCVState =
*env, int csrno,
>  static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
>                                        target_ulong val)
>  {
> -    if (riscv_cpu_virt_enabled(env)) {
> +    if (env->virt_enabled) {
>          if (env->hvictl & HVICTL_VTI) {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
> @@ -1515,7 +1515,7 @@ static int read_mtopi(CPURISCVState *env, int csrno=
, target_ulong *val)
>
>  static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
>  {
> -    if (!riscv_cpu_virt_enabled(env)) {
> +    if (!env->virt_enabled) {
>          return csrno;
>      }
>
> @@ -1672,7 +1672,7 @@ static int rmw_xireg(CPURISCVState *env, int csrno,=
 target_ulong *val,
>
>  done:
>      if (ret) {
> -        return (riscv_cpu_virt_enabled(env) && virt) ?
> +        return (env->virt_enabled && virt) ?
>                 RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_IN=
ST;
>      }
>      return RISCV_EXCP_NONE;
> @@ -1726,7 +1726,7 @@ static int rmw_xtopei(CPURISCVState *env, int csrno=
, target_ulong *val,
>
>  done:
>      if (ret) {
> -        return (riscv_cpu_virt_enabled(env) && virt) ?
> +        return (env->virt_enabled && virt) ?
>                 RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_IN=
ST;
>      }
>      return RISCV_EXCP_NONE;
> @@ -2156,7 +2156,7 @@ static RISCVException write_hstateenh_1_3(CPURISCVS=
tate *env, int csrno,
>  static RISCVException read_sstateen(CPURISCVState *env, int csrno,
>                                      target_ulong *val)
>  {
> -    bool virt =3D riscv_cpu_virt_enabled(env);
> +    bool virt =3D env->virt_enabled;
>      int index =3D csrno - CSR_SSTATEEN0;
>
>      *val =3D env->sstateen[index] & env->mstateen[index];
> @@ -2170,7 +2170,7 @@ static RISCVException read_sstateen(CPURISCVState *=
env, int csrno,
>  static RISCVException write_sstateen(CPURISCVState *env, int csrno,
>                                       uint64_t mask, target_ulong new_val=
)
>  {
> -    bool virt =3D riscv_cpu_virt_enabled(env);
> +    bool virt =3D env->virt_enabled;
>      int index =3D csrno - CSR_SSTATEEN0;
>      uint64_t wr_mask;
>      uint64_t *reg;
> @@ -2365,7 +2365,7 @@ static RISCVException rmw_sie64(CPURISCVState *env,=
 int csrno,
>      RISCVException ret;
>      uint64_t mask =3D env->mideleg & S_MODE_INTERRUPTS;
>
> -    if (riscv_cpu_virt_enabled(env)) {
> +    if (env->virt_enabled) {
>          if (env->hvictl & HVICTL_VTI) {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
> @@ -2575,7 +2575,7 @@ static RISCVException rmw_sip64(CPURISCVState *env,=
 int csrno,
>      RISCVException ret;
>      uint64_t mask =3D env->mideleg & sip_writable_mask;
>
> -    if (riscv_cpu_virt_enabled(env)) {
> +    if (env->virt_enabled) {
>          if (env->hvictl & HVICTL_VTI) {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
> @@ -2768,7 +2768,7 @@ static int read_stopi(CPURISCVState *env, int csrno=
, target_ulong *val)
>      int irq;
>      uint8_t iprio;
>
> -    if (riscv_cpu_virt_enabled(env)) {
> +    if (env->virt_enabled) {
>          return read_vstopi(env, CSR_VSTOPI, val);
>      }
>
> @@ -3113,7 +3113,7 @@ static int read_hvipriox(CPURISCVState *env, int fi=
rst_index,
>
>      /* First index has to be a multiple of number of irqs per register *=
/
>      if (first_index % num_irqs) {
> -        return (riscv_cpu_virt_enabled(env)) ?
> +        return (env->virt_enabled) ?
>                 RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_IN=
ST;
>      }
>
> @@ -3139,7 +3139,7 @@ static int write_hvipriox(CPURISCVState *env, int f=
irst_index,
>
>      /* First index has to be a multiple of number of irqs per register *=
/
>      if (first_index % num_irqs) {
> -        return (riscv_cpu_virt_enabled(env)) ?
> +        return (env->virt_enabled) ?
>                 RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_IN=
ST;
>      }
>
> @@ -3794,7 +3794,7 @@ static inline RISCVException riscv_csrrw_check(CPUR=
ISCVState *env,
>      int csr_priv, effective_priv =3D env->priv;
>
>      if (riscv_has_ext(env, RVH) && env->priv =3D=3D PRV_S &&
> -        !riscv_cpu_virt_enabled(env)) {
> +        !env->virt_enabled) {
>          /*
>           * We are in HS mode. Add 1 to the effective privledge level to
>           * allow us to access the Hypervisor CSRs.
> @@ -3804,7 +3804,7 @@ static inline RISCVException riscv_csrrw_check(CPUR=
ISCVState *env,
>
>      csr_priv =3D get_field(csrno, 0x300);
>      if (!env->debugger && (effective_priv < csr_priv)) {
> -        if (csr_priv =3D=3D (PRV_S + 1) && riscv_cpu_virt_enabled(env)) =
{
> +        if (csr_priv =3D=3D (PRV_S + 1) && env->virt_enabled) {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
>          return RISCV_EXCP_ILLEGAL_INST;
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index b091293069..1f7aed23c9 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -515,7 +515,7 @@ itrigger_set_count(CPURISCVState *env, int index, int=
 value)
>  static bool check_itrigger_priv(CPURISCVState *env, int index)
>  {
>      target_ulong tdata1 =3D env->tdata1[index];
> -    if (riscv_cpu_virt_enabled(env)) {
> +    if (env->virt_enabled) {
>          /* check VU/VS bit against current privilege level */
>          return (get_field(tdata1, ITRIGGER_VS) =3D=3D env->priv) ||
>                 (get_field(tdata1, ITRIGGER_VU) =3D=3D env->priv);
> @@ -787,7 +787,7 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
>              switch (trigger_type) {
>              case TRIGGER_TYPE_AD_MATCH:
>                  /* type 2 trigger cannot be fired in VU/VS mode */
> -                if (riscv_cpu_virt_enabled(env)) {
> +                if (env->virt_enabled) {
>                      return false;
>                  }
>
> @@ -806,7 +806,7 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
>                  pc =3D env->tdata2[i];
>
>                  if ((ctrl & TYPE6_EXEC) && (bp->pc =3D=3D pc)) {
> -                    if (riscv_cpu_virt_enabled(env)) {
> +                    if (env->virt_enabled) {
>                          /* check VU/VS bit against current privilege lev=
el */
>                          if ((ctrl >> 23) & BIT(env->priv)) {
>                              return true;
> @@ -845,7 +845,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, C=
PUWatchpoint *wp)
>          switch (trigger_type) {
>          case TRIGGER_TYPE_AD_MATCH:
>              /* type 2 trigger cannot be fired in VU/VS mode */
> -            if (riscv_cpu_virt_enabled(env)) {
> +            if (env->virt_enabled) {
>                  return false;
>              }
>
> @@ -880,7 +880,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, C=
PUWatchpoint *wp)
>              }
>
>              if ((wp->flags & flags) && (wp->vaddr =3D=3D addr)) {
> -                if (riscv_cpu_virt_enabled(env)) {
> +                if (env->virt_enabled) {
>                      /* check VU/VS bit against current privilege level *=
/
>                      if ((ctrl >> 23) & BIT(env->priv)) {
>                          return true;
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 1eecae9547..c0c4ced7f0 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -140,7 +140,7 @@ static void check_zicbo_envcfg(CPURISCVState *env, ta=
rget_ulong envbits,
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
>      }
>
> -    if (riscv_cpu_virt_enabled(env) &&
> +    if (env->virt_enabled &&
>          (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
>           ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) {
>          riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra=
);
> @@ -278,7 +278,7 @@ target_ulong helper_sret(CPURISCVState *env)
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>      }
>
> -    if (riscv_cpu_virt_enabled(env) && get_field(env->hstatus, HSTATUS_V=
TSR)) {
> +    if (env->virt_enabled && get_field(env->hstatus, HSTATUS_VTSR)) {
>          riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GE=
TPC());
>      }
>
> @@ -293,7 +293,7 @@ target_ulong helper_sret(CPURISCVState *env)
>      }
>      env->mstatus =3D mstatus;
>
> -    if (riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
> +    if (riscv_has_ext(env, RVH) && !env->virt_enabled) {
>          /* We support Hypervisor extensions and virtulisation is disable=
d */
>          target_ulong hstatus =3D env->hstatus;
>
> @@ -365,9 +365,9 @@ void helper_wfi(CPURISCVState *env)
>      bool prv_s =3D env->priv =3D=3D PRV_S;
>
>      if (((prv_s || (!rvs && prv_u)) && get_field(env->mstatus, MSTATUS_T=
W)) ||
> -        (rvs && prv_u && !riscv_cpu_virt_enabled(env))) {
> +        (rvs && prv_u && !env->virt_enabled)) {
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> -    } else if (riscv_cpu_virt_enabled(env) && (prv_u ||
> +    } else if (env->virt_enabled && (prv_u ||
>          (prv_s && get_field(env->hstatus, HSTATUS_VTW)))) {
>          riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GE=
TPC());
>      } else {
> @@ -384,7 +384,7 @@ void helper_tlb_flush(CPURISCVState *env)
>          (env->priv =3D=3D PRV_S &&
>           get_field(env->mstatus, MSTATUS_TVM))) {
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> -    } else if (riscv_has_ext(env, RVH) && riscv_cpu_virt_enabled(env) &&
> +    } else if (riscv_has_ext(env, RVH) && env->virt_enabled &&
>                 get_field(env->hstatus, HSTATUS_VTVM)) {
>          riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GE=
TPC());
>      } else {
> @@ -402,12 +402,12 @@ void helper_hyp_tlb_flush(CPURISCVState *env)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> -    if (env->priv =3D=3D PRV_S && riscv_cpu_virt_enabled(env)) {
> +    if (env->priv =3D=3D PRV_S && env->virt_enabled) {
>          riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GE=
TPC());
>      }
>
>      if (env->priv =3D=3D PRV_M ||
> -        (env->priv =3D=3D PRV_S && !riscv_cpu_virt_enabled(env))) {
> +        (env->priv =3D=3D PRV_S && !env->virt_enabled)) {
>          tlb_flush(cs);
>          return;
>      }
> @@ -417,7 +417,7 @@ void helper_hyp_tlb_flush(CPURISCVState *env)
>
>  void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
>  {
> -    if (env->priv =3D=3D PRV_S && !riscv_cpu_virt_enabled(env) &&
> +    if (env->priv =3D=3D PRV_S && !env->virt_enabled &&
>          get_field(env->mstatus, MSTATUS_TVM)) {
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>      }
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 22e2283c76..7ad85ab476 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -109,7 +109,7 @@ static int riscv_pmu_incr_ctr_rv32(RISCVCPU *cpu, uin=
t32_t ctr_idx)
>      CPURISCVState *env =3D &cpu->env;
>      target_ulong max_val =3D UINT32_MAX;
>      PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
> -    bool virt_on =3D riscv_cpu_virt_enabled(env);
> +    bool virt_on =3D env->virt_enabled;
>
>      /* Privilege mode filtering */
>      if ((env->priv =3D=3D PRV_M &&
> @@ -150,7 +150,7 @@ static int riscv_pmu_incr_ctr_rv64(RISCVCPU *cpu, uin=
t32_t ctr_idx)
>      CPURISCVState *env =3D &cpu->env;
>      PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
>      uint64_t max_val =3D UINT64_MAX;
> -    bool virt_on =3D riscv_cpu_virt_enabled(env);
> +    bool virt_on =3D env->virt_enabled;
>
>      /* Privilege mode filtering */
>      if ((env->priv =3D=3D PRV_M &&
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index c3adf30b54..5450efcce5 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1158,7 +1158,7 @@ static void riscv_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
>      ctx->priv_ver =3D env->priv_ver;
>  #if !defined(CONFIG_USER_ONLY)
>      if (riscv_has_ext(env, RVH)) {
> -        ctx->virt_enabled =3D riscv_cpu_virt_enabled(env);
> +        ctx->virt_enabled =3D env->virt_enabled;
>      } else {
>          ctx->virt_enabled =3D false;
>      }
> --
> 2.25.1
>
>

