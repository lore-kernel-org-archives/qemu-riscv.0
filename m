Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA2DC77B7E
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 02:29:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2NBv-0008NK-OT; Thu, 25 May 2023 22:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2NBu-0008N6-A0; Thu, 25 May 2023 22:28:30 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2NBs-0007cI-Ay; Thu, 25 May 2023 22:28:30 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-456d241fcdcso64519e0c.0; 
 Thu, 25 May 2023 19:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685068107; x=1687660107;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+/kKcPJVklSIjShJmtrNgSzfjOmPNroXQPS7QBxn/Uw=;
 b=RRDuOqQicnG3/0WP5IPDwCkdVv6apPqAdVbORMXvKmF/SaUhuE9haXZzYZbgsDLefT
 Wfo4XV39etlXUWvb7D1TNb6ovVKzWS/EGdFtbrCBmnt4OIElglAUxoqFjQ77x3QIPeA/
 RmePYsSwJQx8ARil/hSg5UODW0Nu6wC/Y+NcXI69Und4ZsPVtAZXd2qwxPClxmzT9wgq
 cXT+dv3FQnzeIobsOlnPq/EREWRwRTyM/JiPHQ7BhWLVqZOpLHBPwE4o/ZKX+B/xyjfX
 D3KE9UVRlks3O8FNHMn+Ub/9zGaPXsKTdfDmVk0SbqmUH2oZSmnu322F9vGWHxNSNgMs
 jjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685068107; x=1687660107;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+/kKcPJVklSIjShJmtrNgSzfjOmPNroXQPS7QBxn/Uw=;
 b=LOdhD081WWa5tS98+kIh8cQ3BCX7X9RQ0HKkNwQJ55bqKaZEP8ctQWvNNJZtQ5QT4C
 7LO/MxXID9QFtmrEqdaJ9L8f1KQIWvQCSEa7xCY4H96htWE1PH+BZsISE+A9OzyqRTNi
 dav1oGiiAlcwNBskEddBgb3SFTIY5pSFHMdmhhNilz00VugUKnbXA1WOH6Q+udKUi2nT
 ql82LxmgTzrQtZsYXv/KtNPwrlGnll18DFSNQJRBDwYevCXiSgOu9N76ZUHrfELkOzHj
 giBxp1IlXlbF+KDJFUa1aPYcqCdAdyw++/3kzmcLmG70i2w+HDjgI8WWoqo8CoQwub5R
 +Z6Q==
X-Gm-Message-State: AC+VfDxh4TYkMfUZ5RKQKvBDfN4URYq1vZ0VImDNBkW/lZo/oKBsWRpC
 zgk3IESb+O7jP1q+MmWgICRRIfCR4MczCm6Y2yE=
X-Google-Smtp-Source: ACHHUZ46H5t71fq0ZZP+06PI1ScoGmGYza2WhYUSnA3oxBoAY1Kdo2Li1PoQxWKdFRydaCTuRRggwua5oiYc1ELvMRQ=
X-Received: by 2002:a1f:48c3:0:b0:43f:bbd9:4499 with SMTP id
 v186-20020a1f48c3000000b0043fbbd94499mr93254vka.2.1685068106734; Thu, 25 May
 2023 19:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230523135939.299246-1-liweiwei@iscas.ac.cn>
 <20230523135939.299246-7-liweiwei@iscas.ac.cn>
In-Reply-To: <20230523135939.299246-7-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 12:28:00 +1000
Message-ID: <CAKmqyKO0UPO85s1oBMUa+=CQ7ivzZWE=hAHyxPfh3Fh0G9JYVA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] target/riscv: Enable PC-relative translation
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
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

On Wed, May 24, 2023 at 12:12=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> Add a base pc_save for PC-relative translation(CF_PCREL).
> Diable the directly sync pc from tb by riscv_cpu_synchronize_from_tb.
> Use gen_pc_plus_diff to get the pc-relative address.
> Enable CF_PCREL in System mode.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                        | 31 ++++++++++-----
>  target/riscv/insn_trans/trans_rvi.c.inc   | 12 +++++-
>  target/riscv/insn_trans/trans_rvzce.c.inc |  4 +-
>  target/riscv/translate.c                  | 47 +++++++++++++++++++----
>  4 files changed, 74 insertions(+), 20 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index db0875fb43..e4606c0b2e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -690,16 +690,18 @@ static vaddr riscv_cpu_get_pc(CPUState *cs)
>  static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>                                            const TranslationBlock *tb)
>  {
> -    RISCVCPU *cpu =3D RISCV_CPU(cs);
> -    CPURISCVState *env =3D &cpu->env;
> -    RISCVMXL xl =3D FIELD_EX32(tb->flags, TB_FLAGS, XL);
> +    if (!(tb_cflags(tb) & CF_PCREL)) {
> +        RISCVCPU *cpu =3D RISCV_CPU(cs);
> +        CPURISCVState *env =3D &cpu->env;
> +        RISCVMXL xl =3D FIELD_EX32(tb->flags, TB_FLAGS, XL);
>
> -    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
> +        tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
>
> -    if (xl =3D=3D MXL_RV32) {
> -        env->pc =3D (int32_t) tb->pc;
> -    } else {
> -        env->pc =3D tb->pc;
> +        if (xl =3D=3D MXL_RV32) {
> +            env->pc =3D (int32_t) tb->pc;
> +        } else {
> +            env->pc =3D tb->pc;
> +        }
>      }
>  }
>
> @@ -725,11 +727,18 @@ static void riscv_restore_state_to_opc(CPUState *cs=
,
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      CPURISCVState *env =3D &cpu->env;
>      RISCVMXL xl =3D FIELD_EX32(tb->flags, TB_FLAGS, XL);
> +    target_ulong pc;
> +
> +    if (tb_cflags(tb) & CF_PCREL) {
> +        pc =3D (env->pc & TARGET_PAGE_MASK) | data[0];
> +    } else {
> +        pc =3D data[0];
> +    }
>
>      if (xl =3D=3D MXL_RV32) {
> -        env->pc =3D (int32_t)data[0];
> +        env->pc =3D (int32_t)pc;
>      } else {
> -        env->pc =3D data[0];
> +        env->pc =3D pc;
>      }
>      env->bins =3D data[1];
>  }
> @@ -1246,6 +1255,8 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
>
>
>  #ifndef CONFIG_USER_ONLY
> +    cs->tcg_cflags |=3D CF_PCREL;
> +
>      if (cpu->cfg.ext_sstc) {
>          riscv_timer_init(cpu);
>      }
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
> index d6eef67b45..28fe69c34b 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -38,7 +38,9 @@ static bool trans_lui(DisasContext *ctx, arg_lui *a)
>
>  static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
>  {
> -    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
> +    TCGv target_pc =3D dest_gpr(ctx, a->rd);
> +    gen_pc_plus_diff(target_pc, ctx, a->imm);
> +    gen_set_gpr(ctx, a->rd, target_pc);
>      return true;
>  }
>
> @@ -52,6 +54,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>  {
>      TCGLabel *misaligned =3D NULL;
>      TCGv target_pc =3D tcg_temp_new();
> +    TCGv succ_pc =3D dest_gpr(ctx, a->rd);
>
>      tcg_gen_addi_tl(target_pc, get_gpr(ctx, a->rs1, EXT_NONE), a->imm);
>      tcg_gen_andi_tl(target_pc, target_pc, (target_ulong)-2);
> @@ -68,7 +71,9 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>          tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
>      }
>
> -    gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
> +    gen_pc_plus_diff(succ_pc, ctx, ctx->cur_insn_len);
> +    gen_set_gpr(ctx, a->rd, succ_pc);
> +
>      tcg_gen_mov_tl(cpu_pc, target_pc);
>      lookup_and_goto_ptr(ctx);
>
> @@ -158,6 +163,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, T=
CGCond cond)
>      TCGLabel *l =3D gen_new_label();
>      TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_SIGN);
>      TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_SIGN);
> +    target_ulong orig_pc_save =3D ctx->pc_save;
>
>      if (get_xl(ctx) =3D=3D MXL_RV128) {
>          TCGv src1h =3D get_gprh(ctx, a->rs1);
> @@ -171,6 +177,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, T=
CGCond cond)
>          tcg_gen_brcond_tl(cond, src1, src2, l);
>      }
>      gen_goto_tb(ctx, 1, ctx->cur_insn_len);
> +    ctx->pc_save =3D orig_pc_save;
>
>      gen_set_label(l); /* branch taken */
>
> @@ -182,6 +189,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, T=
CGCond cond)
>      } else {
>          gen_goto_tb(ctx, 0, a->imm);
>      }
> +    ctx->pc_save =3D -1;
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>
>      return true;
> diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/ins=
n_trans/trans_rvzce.c.inc
> index 450b79dcbc..8d8a64f493 100644
> --- a/target/riscv/insn_trans/trans_rvzce.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzce.c.inc
> @@ -302,7 +302,9 @@ static bool trans_cm_jalt(DisasContext *ctx, arg_cm_j=
alt *a)
>
>      /* c.jt vs c.jalt depends on the index. */
>      if (a->index >=3D 32) {
> -        gen_set_gpri(ctx, xRA, ctx->pc_succ_insn);
> +        TCGv succ_pc =3D dest_gpr(ctx, xRA);
> +        gen_pc_plus_diff(succ_pc, ctx, ctx->cur_insn_len);
> +        gen_set_gpr(ctx, xRA, succ_pc);
>      }
>
>      tcg_gen_lookup_and_goto_ptr();
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index c6ae489788..538187f93b 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -60,6 +60,7 @@ typedef struct DisasContext {
>      /* pc_succ_insn points to the instruction following base.pc_next */
>      target_ulong pc_succ_insn;
>      target_ulong cur_insn_len;
> +    target_ulong pc_save;
>      target_ulong priv_ver;
>      RISCVMXL misa_mxl_max;
>      RISCVMXL xl;
> @@ -228,15 +229,24 @@ static void gen_pc_plus_diff(TCGv target, DisasCont=
ext *ctx,
>  {
>      target_ulong dest =3D ctx->base.pc_next + diff;
>
> -    if (get_xl(ctx) =3D=3D MXL_RV32) {
> -        dest =3D (int32_t)dest;
> +    assert(ctx->pc_save !=3D -1);
> +    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
> +        tcg_gen_addi_tl(target, cpu_pc, dest - ctx->pc_save);
> +        if (get_xl(ctx) =3D=3D MXL_RV32) {
> +            tcg_gen_ext32s_tl(target, target);
> +        }
> +    } else {
> +        if (get_xl(ctx) =3D=3D MXL_RV32) {
> +            dest =3D (int32_t)dest;
> +        }
> +        tcg_gen_movi_tl(target, dest);
>      }
> -    tcg_gen_movi_tl(target, dest);
>  }
>
>  static void gen_update_pc(DisasContext *ctx, target_long diff)
>  {
>      gen_pc_plus_diff(cpu_pc, ctx, diff);
> +    ctx->pc_save =3D ctx->base.pc_next + diff;
>  }
>
>  static void generate_exception(DisasContext *ctx, int excp)
> @@ -292,8 +302,21 @@ static void gen_goto_tb(DisasContext *ctx, int n, ta=
rget_long diff)
>        * direct block chain benefits will be small.
>        */
>      if (translator_use_goto_tb(&ctx->base, dest) && !ctx->itrigger) {
> -        tcg_gen_goto_tb(n);
> -        gen_update_pc(ctx, diff);
> +        /*
> +         * For pcrel, the pc must always be up-to-date on entry to
> +         * the linked TB, so that it can use simple additions for all
> +         * further adjustments.  For !pcrel, the linked TB is compiled
> +         * to know its full virtual address, so we can delay the
> +         * update to pc to the unlinked path.  A long chain of links
> +         * can thus avoid many updates to the PC.
> +         */
> +        if (tb_cflags(ctx->base.tb) & CF_PCREL) {
> +            gen_update_pc(ctx, diff);
> +            tcg_gen_goto_tb(n);
> +        } else {
> +            tcg_gen_goto_tb(n);
> +            gen_update_pc(ctx, diff);
> +        }
>          tcg_gen_exit_tb(ctx->base.tb, n);
>      } else {
>          gen_update_pc(ctx, diff);
> @@ -547,6 +570,8 @@ static void gen_set_fpr_d(DisasContext *ctx, int reg_=
num, TCGv_i64 t)
>
>  static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>  {
> +    TCGv succ_pc =3D dest_gpr(ctx, rd);
> +
>      /* check misaligned: */
>      if (!ctx->cfg_ptr->ext_zca) {
>          if ((imm & 0x3) !=3D 0) {
> @@ -557,7 +582,9 @@ static void gen_jal(DisasContext *ctx, int rd, target=
_ulong imm)
>          }
>      }
>
> -    gen_set_gpri(ctx, rd, ctx->pc_succ_insn);
> +    gen_pc_plus_diff(succ_pc, ctx, ctx->cur_insn_len);
> +    gen_set_gpr(ctx, rd, succ_pc);
> +
>      gen_goto_tb(ctx, 0, imm); /* must use this for safety */
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
> @@ -1154,6 +1181,7 @@ static void riscv_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      uint32_t tb_flags =3D ctx->base.tb->flags;
>
> +    ctx->pc_save =3D ctx->base.pc_first;
>      ctx->pc_succ_insn =3D ctx->base.pc_first;
>      ctx->priv =3D FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
>      ctx->mem_idx =3D FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
> @@ -1189,8 +1217,13 @@ static void riscv_tr_tb_start(DisasContextBase *db=
, CPUState *cpu)
>  static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
>  {
>      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
> +    target_ulong pc_next =3D ctx->base.pc_next;
> +
> +    if (tb_cflags(dcbase->tb) & CF_PCREL) {
> +        pc_next &=3D ~TARGET_PAGE_MASK;
> +    }
>
> -    tcg_gen_insn_start(ctx->base.pc_next, 0);
> +    tcg_gen_insn_start(pc_next, 0);
>      ctx->insn_start =3D tcg_last_op();
>  }
>
> --
> 2.25.1
>
>

