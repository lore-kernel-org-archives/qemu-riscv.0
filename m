Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIIBF-0007EJ-Sm
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 18:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIIBD-0007Dt-Ak; Wed, 18 Jan 2023 18:49:19 -0500
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIIBB-0003x6-8a; Wed, 18 Jan 2023 18:49:19 -0500
Received: by mail-vk1-xa35.google.com with SMTP id c21so142501vkn.10;
 Wed, 18 Jan 2023 15:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vna0pPr5HnnTDVV9ZDjbi0QYm8u2GZiyqeS0n87r68Y=;
 b=guZBighPl3xqX1uH697deqO1idGLhQ6ZTziviRAvDjoa5TRt8B+ZIBruKpHiV+sjBh
 2qAGxBbuyCTKpqSYClB92Fim7Buoeu/5T5mbqMHEk5X3MmhCJLcWsJeqLRvbnUwgQzBo
 sYfe+fRkk0p48+obYAtY5qLdad06pJYZA7f1aN8jYCsi/N7bfwxq/J2uG0oyqQXXDR6/
 E8uE2gGdVo0qRporY623CszNHsxVtBMG/zT7pc3HCIk8EpjI/ahX2rq2BSKZ/LZxZW+e
 SWHZ0esDuYliM93pnkQIjM6Krccu53lwsQtI+R/Fv01ydwcdNCmFPQpnlU38azE10lgi
 NwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vna0pPr5HnnTDVV9ZDjbi0QYm8u2GZiyqeS0n87r68Y=;
 b=PZ81Ovaf3sBNVS5JqN0QaT9md4ahdlx+dR6dbfMzTuJhVyKifI4PHvHN7GFIasRHUY
 V5Qn8OgpsEegXvl0mUdvKrcSD0XKwuGnNEZeGYNLiIidG9siuruD4KfAlzolanS/C2Tj
 5gP9j6haGQA2JZDxBNZjOQycE9guXdE0QGuxC4MWxlglTYYUr5Q98nJFzfg7l/84dulV
 rsQcG4T3SnAtlXgi0NBjETWyHic2ltFP16wE0DHXKTVuYAsx66BjCPgfK5IhtdvlFfYX
 ccMHR+mj5bh7A/uG1OoAhB/nYNsFlwgHtU/9RpJGt2U5wrgCzdXA9JjgFbarLQgzyW6r
 CQUg==
X-Gm-Message-State: AFqh2koVUv9CNK6lqIHrvOr1/9qf2tKAc+aRZIyUp6MG8AFYzQq+qLIC
 /aVXJ6samxJilsdvEqe3bnwUhJA6mHOTIXwq9p8=
X-Google-Smtp-Source: AMrXdXvriwthG4ECLLHLbxfXjvnhnUCBQW9CM/40Ol0YHGgpeVd+1iCtz8Kyw70DkqnZV4tKU7HoZHPzZQOUdvgQNPE=
X-Received: by 2002:a1f:a7ca:0:b0:3d5:86ff:6638 with SMTP id
 q193-20020a1fa7ca000000b003d586ff6638mr1247336vke.30.1674085755524; Wed, 18
 Jan 2023 15:49:15 -0800 (PST)
MIME-Version: 1.0
References: <20230115160657.3169274-1-richard.henderson@linaro.org>
 <20230115160657.3169274-2-richard.henderson@linaro.org>
 <a6908613-9750-473a-161d-a7cb8c8fd14f@ventanamicro.com>
In-Reply-To: <a6908613-9750-473a-161d-a7cb8c8fd14f@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Jan 2023 09:49:00 +1000
Message-ID: <CAKmqyKPozVWp7ujJzd1P+KMK12uC+t-Qf0i1g7_8qYvXNn27mg@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Introduce helper_set_rounding_mode_chkfrm
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, alistair.francis@wdc.com, bin.meng@windriver.com, 
 abdulras@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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
X-List-Received-Date: Wed, 18 Jan 2023 23:49:19 -0000

On Wed, Jan 18, 2023 at 8:02 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> s/arm/riscv in subject/commit title ^

Fixed when committing

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> On 1/15/23 13:06, Richard Henderson wrote:
>
> The new helper always validates the contents of FRM, even
> if the new rounding mode is not DYN.  This is required by
> the vector unit.
>
> Track whether we've validated FRM separately from whether
> we've updated fp_status with a given rounding mode, so that
> we can elide calls correctly.
>
> This partially reverts d6c4d3f2a69 which attempted the to do
> the same thing, but with two calls to gen_set_rm(), which is
> both inefficient and tickles an assertion in decode_save_opc.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1441
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>
>  target/riscv/helper.h                   |  1 +
>  target/riscv/fpu_helper.c               | 37 +++++++++++++++++++++++++
>  target/riscv/translate.c                | 19 +++++++++++++
>  target/riscv/insn_trans/trans_rvv.c.inc | 24 +++-------------
>  4 files changed, 61 insertions(+), 20 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 227c7122ef..9792ab5086 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -3,6 +3,7 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
>
>  /* Floating Point - rounding mode */
>  DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
> +DEF_HELPER_FLAGS_2(set_rounding_mode_chkfrm, TCG_CALL_NO_WG, void, env, i32)
>  DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
>
>  /* Floating Point - fused */
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 5699c9517f..96817df8ef 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -81,6 +81,43 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
>      set_float_rounding_mode(softrm, &env->fp_status);
>  }
>
> +void helper_set_rounding_mode_chkfrm(CPURISCVState *env, uint32_t rm)
> +{
> +    int softrm;
> +
> +    /* Always validate frm, even if rm != DYN. */
> +    if (unlikely(env->frm >= 5)) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +    }
> +    if (rm == RISCV_FRM_DYN) {
> +        rm = env->frm;
> +    }
> +    switch (rm) {
> +    case RISCV_FRM_RNE:
> +        softrm = float_round_nearest_even;
> +        break;
> +    case RISCV_FRM_RTZ:
> +        softrm = float_round_to_zero;
> +        break;
> +    case RISCV_FRM_RDN:
> +        softrm = float_round_down;
> +        break;
> +    case RISCV_FRM_RUP:
> +        softrm = float_round_up;
> +        break;
> +    case RISCV_FRM_RMM:
> +        softrm = float_round_ties_away;
> +        break;
> +    case RISCV_FRM_ROD:
> +        softrm = float_round_to_odd;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    set_float_rounding_mode(softrm, &env->fp_status);
> +}
> +
>  void helper_set_rod_rounding_mode(CPURISCVState *env)
>  {
>      set_float_rounding_mode(float_round_to_odd, &env->fp_status);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index df38db7553..493c3815e1 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -114,6 +114,8 @@ typedef struct DisasContext {
>      bool pm_base_enabled;
>      /* Use icount trigger for native debug */
>      bool itrigger;
> +    /* FRM is known to contain a valid value. */
> +    bool frm_valid;
>      /* TCG of the current insn_start */
>      TCGOp *insn_start;
>  } DisasContext;
> @@ -674,12 +676,29 @@ static void gen_set_rm(DisasContext *ctx, int rm)
>          gen_helper_set_rod_rounding_mode(cpu_env);
>          return;
>      }
> +    if (rm == RISCV_FRM_DYN) {
> +        /* The helper will return only if frm valid. */
> +        ctx->frm_valid = true;
> +    }
>
>      /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
>      decode_save_opc(ctx);
>      gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
>  }
>
> +static void gen_set_rm_chkfrm(DisasContext *ctx, int rm)
> +{
> +    if (ctx->frm == rm && ctx->frm_valid) {
> +        return;
> +    }
> +    ctx->frm = rm;
> +    ctx->frm_valid = true;
> +
> +    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
> +    decode_save_opc(ctx);
> +    gen_helper_set_rounding_mode_chkfrm(cpu_env, tcg_constant_i32(rm));
> +}
> +
>  static int ex_plus_1(DisasContext *ctx, int nf)
>  {
>      return nf + 1;
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index d455acedbf..bbb5c3a7b5 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2679,13 +2679,9 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
>                      int rm)
>  {
>      if (checkfn(s, a)) {
> -        if (rm != RISCV_FRM_DYN) {
> -            gen_set_rm(s, RISCV_FRM_DYN);
> -        }
> -
>          uint32_t data = 0;
>          TCGLabel *over = gen_new_label();
> -        gen_set_rm(s, rm);
> +        gen_set_rm_chkfrm(s, rm);
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
> @@ -2882,17 +2878,13 @@ static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
>  static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>  {                                                                  \
>      if (CHECK(s, a)) {                                             \
> -        if (FRM != RISCV_FRM_DYN) {                                \
> -            gen_set_rm(s, RISCV_FRM_DYN);                          \
> -        }                                                          \
> -                                                                   \
>          uint32_t data = 0;                                         \
>          static gen_helper_gvec_3_ptr * const fns[2] = {            \
>              gen_helper_##HELPER##_h,                               \
>              gen_helper_##HELPER##_w,                               \
>          };                                                         \
>          TCGLabel *over = gen_new_label();                          \
> -        gen_set_rm(s, FRM);                                        \
> +        gen_set_rm_chkfrm(s, FRM);                                 \
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
> @@ -3005,17 +2997,13 @@ static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
>  static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>  {                                                                  \
>      if (CHECK(s, a)) {                                             \
> -        if (FRM != RISCV_FRM_DYN) {                                \
> -            gen_set_rm(s, RISCV_FRM_DYN);                          \
> -        }                                                          \
> -                                                                   \
>          uint32_t data = 0;                                         \
>          static gen_helper_gvec_3_ptr * const fns[2] = {            \
>              gen_helper_##HELPER##_h,                               \
>              gen_helper_##HELPER##_w,                               \
>          };                                                         \
>          TCGLabel *over = gen_new_label();                          \
> -        gen_set_rm(s, FRM);                                        \
> +        gen_set_rm_chkfrm(s, FRM);                                 \
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
> @@ -3060,10 +3048,6 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
>  static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>  {                                                                  \
>      if (opxfv_narrow_check(s, a)) {                                \
> -        if (FRM != RISCV_FRM_DYN) {                                \
> -            gen_set_rm(s, RISCV_FRM_DYN);                          \
> -        }                                                          \
> -                                                                   \
>          uint32_t data = 0;                                         \
>          static gen_helper_gvec_3_ptr * const fns[3] = {            \
>              gen_helper_##HELPER##_b,                               \
> @@ -3071,7 +3055,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>              gen_helper_##HELPER##_w,                               \
>          };                                                         \
>          TCGLabel *over = gen_new_label();                          \
> -        gen_set_rm(s, FRM);                                        \
> +        gen_set_rm_chkfrm(s, FRM);                                 \
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>          tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>
>

