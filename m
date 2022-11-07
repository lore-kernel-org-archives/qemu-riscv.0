Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1orr56-0006LQ-SL
	for mharc-qemu-riscv@gnu.org; Sun, 06 Nov 2022 20:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1orr55-0006Kr-1H; Sun, 06 Nov 2022 20:37:43 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1orr52-0008KN-S5; Sun, 06 Nov 2022 20:37:42 -0500
Received: by mail-pl1-x634.google.com with SMTP id p21so9775449plr.7;
 Sun, 06 Nov 2022 17:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3ialqVeea/6mXsckAqnuiq5ZupxYhUixfaUbWJkEvgA=;
 b=c+HF28vFLIG83ggeWSXkF8D22K4LOJH+HawQIwqfKWRll/+wCEXuI3uAvszyinprIR
 wYr9OviRXxRiyQpIBPEy+VjxlW/Pdmh8TbXdwhFnpfSH6uofPAOshSwQOIUshOz/W7ob
 AP+p1NLnDCZGxbr/vbzv6nYbcy2NTDVT+446h8yIT0HjJvGlrz07/9mt/s+pAsCp0Ruo
 1faAtmti16RB6gbPM08SHMKtR7f7hCAbu+Ylo0nSgzC4toAhsKfbw18Gzob6ntdVkCh6
 9rUzIqgWiALPsxQ0iwLA0oHYLojt6mAoWDXqjsKbjgbyowkwIZTP2DjDYWlGEWhGEjSR
 J1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ialqVeea/6mXsckAqnuiq5ZupxYhUixfaUbWJkEvgA=;
 b=KoyxQnBFdjvneieJ/Nt+s62+N5CxFXumVPQs6iLf24zFvZHcLqi10czGIPi1lL3UjA
 TxLyUmCy3hKAATnRH6FYsyMj6SS3OF2+sDzCxQy60Jv7HAZG0ygEdeqEyMC1USQOvGou
 sZZMUHI6B4U63VjZEr9tdLaNK3IDA88f/Idr8nsa7RXCztLK8QO+CK6c9rJKpGeXE1kj
 EqLwhShvTHlfuhyUuzuYkXKhFUBHng3ZK2bu4T38PqrpwQ2GUQbaMXiuoFfZvrkIpY2Q
 0bl8+6hOTP+DNl3W6ppDh4XJDt05x02HQ8W5N6BF6Yc6GXul5srrQml8+rDZZ1pvUdJu
 dajw==
X-Gm-Message-State: ACrzQf2kLKegl5+JiT9wSSO6cMpUXnMAHLKS6Xe9itqY+B/kFcVnSjNo
 aLVFOnv+hR5nM5thYEUPgYSofrTPgsw3wfiH0iA=
X-Google-Smtp-Source: AMsMyM6cc0QJb3pMwVu+eWKZ7ikNlPAxwIQ70z4X2eyUc1IMfGNHkcRP1d6UcXrzGQQlbRHX0/4ukXx6H+dkrLTyurk=
X-Received: by 2002:a17:902:7294:b0:187:146c:316f with SMTP id
 d20-20020a170902729400b00187146c316fmr42444288pll.149.1667785058427; Sun, 06
 Nov 2022 17:37:38 -0800 (PST)
MIME-Version: 1.0
References: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
 <20221013062946.7530-2-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20221013062946.7530-2-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 7 Nov 2022 11:37:10 +1000
Message-ID: <CAKmqyKNTyCvjjYOrgAttW36ygGBibTHjA_f1b5AAWp+pF-xAiA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] target/riscv: Add itrigger support when icount is
 not enabled
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, sergey.matyukevich@syntacore.com, 
 vladimir.isaev@syntacore.com, anatoly.parshintsev@syntacore.com, 
 philipp.tomsich@vrull.eu, zhiwei_liu@c-sky.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Mon, 07 Nov 2022 01:37:43 -0000

On Thu, Oct 13, 2022 at 4:32 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>
> When icount is not enabled, there is no API in QEMU that can get the
> guest instruction number.
>
> Translate the guest code in a way that each TB only has one instruction.

I don't think this is a great idea.

Why can't we just require icount be enabled if a user wants this? Or singlestep?

Alistair

> After executing the instruction, decrease the count by 1 until it reaches 0
> where the itrigger fires.
>
> Note that only when priviledge matches the itrigger configuration,
> the count will decrease.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>  target/riscv/cpu.h                            |  2 +
>  target/riscv/cpu_helper.c                     |  6 ++
>  target/riscv/debug.c                          | 71 +++++++++++++++++++
>  target/riscv/debug.h                          | 12 ++++
>  target/riscv/helper.h                         |  2 +
>  .../riscv/insn_trans/trans_privileged.c.inc   |  4 +-
>  target/riscv/insn_trans/trans_rvi.c.inc       |  8 +--
>  target/riscv/insn_trans/trans_rvv.c.inc       |  4 +-
>  target/riscv/translate.c                      | 33 ++++++++-
>  9 files changed, 131 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index b131fa8c8e..24bafda27d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -621,6 +621,8 @@ FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
>  FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
>  FIELD(TB_FLAGS, VTA, 24, 1)
>  FIELD(TB_FLAGS, VMA, 25, 1)
> +/* Native debug itrigger */
> +FIELD(TB_FLAGS, ITRIGGER, 26, 1)
>
>  #ifdef TARGET_RISCV32
>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 278d163803..263282f230 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -27,7 +27,9 @@
>  #include "tcg/tcg-op.h"
>  #include "trace.h"
>  #include "semihosting/common-semi.h"
> +#include "sysemu/cpu-timers.h"
>  #include "cpu_bits.h"
> +#include "debug.h"
>
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>  {
> @@ -103,6 +105,10 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>          flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
>                             get_field(env->mstatus_hs, MSTATUS_VS));
>      }
> +    if (riscv_feature(env, RISCV_FEATURE_DEBUG) && !icount_enabled()) {
> +        flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER,
> +                           riscv_itrigger_enabled(env));
> +    }
>  #endif
>
>      flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 26ea764407..45a3537d5c 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -29,6 +29,7 @@
>  #include "cpu.h"
>  #include "trace.h"
>  #include "exec/exec-all.h"
> +#include "exec/helper-proto.h"
>
>  /*
>   * The following M-mode trigger CSRs are implemented:
> @@ -498,6 +499,76 @@ static void type6_reg_write(CPURISCVState *env, target_ulong index,
>      return;
>  }
>
> +/* icount trigger type */
> +static inline int
> +itrigger_get_count(CPURISCVState *env, int index)
> +{
> +    return get_field(env->tdata1[index], ITRIGGER_COUNT);
> +}
> +
> +static inline void
> +itrigger_set_count(CPURISCVState *env, int index, int value)
> +{
> +    env->tdata1[index] = set_field(env->tdata1[index],
> +                                   ITRIGGER_COUNT, value);
> +}
> +
> +static bool check_itrigger_priv(CPURISCVState *env, int index)
> +{
> +    target_ulong tdata1 = env->tdata1[index];
> +    if (riscv_cpu_virt_enabled(env)) {
> +        /* check VU/VS bit against current privilege level */
> +        return (get_field(tdata1, ITRIGGER_VS) == env->priv) ||
> +               (get_field(tdata1, ITRIGGER_VU) == env->priv);
> +    } else {
> +        /* check U/S/M bit against current privilege level */
> +        return (get_field(tdata1, ITRIGGER_M) == env->priv) ||
> +               (get_field(tdata1, ITRIGGER_S) == env->priv) ||
> +               (get_field(tdata1, ITRIGGER_U) == env->priv);
> +    }
> +}
> +
> +bool riscv_itrigger_enabled(CPURISCVState *env)
> +{
> +    int count;
> +    for (int i = 0; i < RV_MAX_TRIGGERS; i++) {
> +        if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
> +            continue;
> +        }
> +        if (check_itrigger_priv(env, i)) {
> +            continue;
> +        }
> +        count = itrigger_get_count(env, i);
> +        if (!count) {
> +            continue;
> +        }
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
> +void helper_itrigger_match(CPURISCVState *env)
> +{
> +    int count;
> +    for (int i = 0; i < RV_MAX_TRIGGERS; i++) {
> +        if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
> +            continue;
> +        }
> +        if (check_itrigger_priv(env, i)) {
> +            continue;
> +        }
> +        count = itrigger_get_count(env, i);
> +        if (!count) {
> +            continue;
> +        }
> +        itrigger_set_count(env, i, count--);
> +        if (!count) {
> +            do_trigger_action(env, i);
> +        }
> +    }
> +}
> +
>  target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
>  {
>      switch (tdata_index) {
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index a1226b4d29..cc3358e69b 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -118,6 +118,17 @@ enum {
>      SIZE_NUM = 16
>  };
>
> +/* itrigger filed masks */
> +#define ITRIGGER_ACTION       0x3f
> +#define ITRIGGER_U            BIT(6)
> +#define ITRIGGER_S            BIT(7)
> +#define ITRIGGER_PENDING      BIT(8)
> +#define ITRIGGER_M            BIT(9)
> +#define ITRIGGER_COUNT        (0x3fff << 10)
> +#define ITRIGGER_HIT          BIT(24)
> +#define ITRIGGER_VU           BIT(25)
> +#define ITRIGGER_VS           BIT(26)
> +
>  bool tdata_available(CPURISCVState *env, int tdata_index);
>
>  target_ulong tselect_csr_read(CPURISCVState *env);
> @@ -134,4 +145,5 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
>
>  void riscv_trigger_init(CPURISCVState *env);
>
> +bool riscv_itrigger_enabled(CPURISCVState *env);
>  #endif /* RISCV_DEBUG_H */
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index a03014fe67..227c7122ef 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -109,6 +109,8 @@ DEF_HELPER_1(sret, tl, env)
>  DEF_HELPER_1(mret, tl, env)
>  DEF_HELPER_1(wfi, void, env)
>  DEF_HELPER_1(tlb_flush, void, env)
> +/* Native Debug */
> +DEF_HELPER_1(itrigger_match, void, env)
>  #endif
>
>  /* Hypervisor functions */
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index 3281408a87..59501b2780 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -78,7 +78,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
>      if (has_ext(ctx, RVS)) {
>          decode_save_opc(ctx);
>          gen_helper_sret(cpu_pc, cpu_env);
> -        tcg_gen_exit_tb(NULL, 0); /* no chaining */
> +        exit_tb(ctx); /* no chaining */
>          ctx->base.is_jmp = DISAS_NORETURN;
>      } else {
>          return false;
> @@ -94,7 +94,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
>  #ifndef CONFIG_USER_ONLY
>      decode_save_opc(ctx);
>      gen_helper_mret(cpu_pc, cpu_env);
> -    tcg_gen_exit_tb(NULL, 0); /* no chaining */
> +    exit_tb(ctx); /* no chaining */
>      ctx->base.is_jmp = DISAS_NORETURN;
>      return true;
>  #else
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index c49dbec0eb..5c69b88d1e 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -66,7 +66,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>      }
>
>      gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
> -    tcg_gen_lookup_and_goto_ptr();
> +    lookup_and_goto_ptr(ctx);
>
>      if (misaligned) {
>          gen_set_label(misaligned);
> @@ -803,7 +803,7 @@ static bool trans_pause(DisasContext *ctx, arg_pause *a)
>       * end the TB and return to main loop
>       */
>      gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> -    tcg_gen_exit_tb(NULL, 0);
> +    exit_tb(ctx);
>      ctx->base.is_jmp = DISAS_NORETURN;
>
>      return true;
> @@ -827,7 +827,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
>       * however we need to end the translation block
>       */
>      gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> -    tcg_gen_exit_tb(NULL, 0);
> +    exit_tb(ctx);
>      ctx->base.is_jmp = DISAS_NORETURN;
>      return true;
>  }
> @@ -838,7 +838,7 @@ static bool do_csr_post(DisasContext *ctx)
>      decode_save_opc(ctx);
>      /* We may have changed important cpu state -- exit to main loop. */
>      gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> -    tcg_gen_exit_tb(NULL, 0);
> +    exit_tb(ctx);
>      ctx->base.is_jmp = DISAS_NORETURN;
>      return true;
>  }
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 4dea4413ae..d455acedbf 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -196,7 +196,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
>      mark_vs_dirty(s);
>
>      gen_set_pc_imm(s, s->pc_succ_insn);
> -    tcg_gen_lookup_and_goto_ptr();
> +    lookup_and_goto_ptr(s);
>      s->base.is_jmp = DISAS_NORETURN;
>
>      if (rd == 0 && rs1 == 0) {
> @@ -222,7 +222,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
>      gen_set_gpr(s, rd, dst);
>      mark_vs_dirty(s);
>      gen_set_pc_imm(s, s->pc_succ_insn);
> -    tcg_gen_lookup_and_goto_ptr();
> +    lookup_and_goto_ptr(s);
>      s->base.is_jmp = DISAS_NORETURN;
>
>      return true;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index db123da5ec..d704265a37 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -111,6 +111,8 @@ typedef struct DisasContext {
>      /* PointerMasking extension */
>      bool pm_mask_enabled;
>      bool pm_base_enabled;
> +    /* Use icount trigger for native debug */
> +    bool itrigger;
>      /* TCG of the current insn_start */
>      TCGOp *insn_start;
>  } DisasContext;
> @@ -252,15 +254,39 @@ static void gen_exception_inst_addr_mis(DisasContext *ctx)
>      generate_exception(ctx, RISCV_EXCP_INST_ADDR_MIS);
>  }
>
> +static void lookup_and_goto_ptr(DisasContext *ctx)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    if (ctx->itrigger) {
> +        gen_helper_itrigger_match(cpu_env);
> +    }
> +#endif
> +    tcg_gen_lookup_and_goto_ptr();
> +}
> +
> +static void exit_tb(DisasContext *ctx)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    if (ctx->itrigger) {
> +        gen_helper_itrigger_match(cpu_env);
> +    }
> +#endif
> +    tcg_gen_exit_tb(NULL, 0);
> +}
> +
>  static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>  {
> -    if (translator_use_goto_tb(&ctx->base, dest)) {
> +     /*
> +      * Under itrigger, instruction executes one by one like singlestep,
> +      * direct block chain benefits will be small.
> +      */
> +    if (translator_use_goto_tb(&ctx->base, dest) && !ctx->itrigger) {
>          tcg_gen_goto_tb(n);
>          gen_set_pc_imm(ctx, dest);
>          tcg_gen_exit_tb(ctx->base.tb, n);
>      } else {
>          gen_set_pc_imm(ctx, dest);
> -        tcg_gen_lookup_and_goto_ptr();
> +        lookup_and_goto_ptr(ctx);
>      }
>  }
>
> @@ -1136,6 +1162,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
>      ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
>      ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
> +    ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
>      ctx->zero = tcg_constant_tl(0);
>  }
>
> @@ -1175,7 +1202,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>
>      /* Only the first insn within a TB is allowed to cross a page boundary. */
>      if (ctx->base.is_jmp == DISAS_NEXT) {
> -        if (!is_same_page(&ctx->base, ctx->base.pc_next)) {
> +        if (ctx->itrigger || !is_same_page(&ctx->base, ctx->base.pc_next)) {
>              ctx->base.is_jmp = DISAS_TOO_MANY;
>          } else {
>              unsigned page_ofs = ctx->base.pc_next & ~TARGET_PAGE_MASK;
> --
> 2.17.1
>
>

