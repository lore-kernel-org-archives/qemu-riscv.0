Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pH5Xd-0003wk-7s
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 11:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pH5XI-0003tt-0K
 for qemu-riscv@nongnu.org; Sun, 15 Jan 2023 11:07:09 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pH5XF-0002l8-2d
 for qemu-riscv@nongnu.org; Sun, 15 Jan 2023 11:07:07 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 u1-20020a17090a450100b0022936a63a21so5182092pjg.4
 for <qemu-riscv@nongnu.org>; Sun, 15 Jan 2023 08:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UWv9juEM30TaG2ZFbroRk3W9f3EJ/62euGE8qgUSwqI=;
 b=drpqhCMrAm+voinh4wQ4z+vF4cdkJ9MMQXohQytUB6e33Memlg+pjisHGZIJ8/4WMz
 ElcgkhoTxEPNwvsNZ//f1E7Equ7NQArfC9Pq2PHE3ZDfE/PL9wEi4IaTiK+N6zbAXhB6
 WAKKpb/huIEFcS7VZAhMR1U4xAmMEn1faPof5rgrWOfEb9PfCAUzubmeLk/zGZiN2iJw
 k3oFQfFKc0PPpOg7XNBMYIDrhqHOyqknZKSwdWlNUapX9hnu+vRatGSz4GuURxoFlqU5
 S7NCTGY9hYLeKV1ugsqCUqYv2HUdy0Az0hx69g2FWtfYRQWkiLlrWIG1GN+iT4Oc/vlM
 tb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UWv9juEM30TaG2ZFbroRk3W9f3EJ/62euGE8qgUSwqI=;
 b=fQmAVVKQjY8RfIZ/cEApMI3dP9lBpCPtnS/YV8J13az/N1ms+zi7Vj4eL8H9+ofn/5
 YZYgekiOouFb8y/k7A8yiYI+YxvSNb0FjwmkF+NaJ7sC5moCb1xRsQ9wHdsgBHcCo3jw
 MOD5dC23ViDK1jRwS/uzig9Tkgo7eSCYOYthdE8CRfNmBe1bzAPv4VH2/owptlaUyTFh
 zXGOP3DrBu95dnHm0vw4mcP9y6HB2Aon6GglxMvyS3qRXW2qPypjS8hAlXmLYml+Vo77
 HWcHBG8Lx52lBk6nNJLnSLUgAgp028vZh1Z20dxMlt8wU/LOC1US3HXSyPJI+FTQ0EYL
 yarA==
X-Gm-Message-State: AFqh2kr9KwuvEKlQKLotEA1z/Hg5/2khURGfQrsh3Cra82TwV20Jh7Hb
 nkTBmkVEr6eihze0Xiqtzu0njg==
X-Google-Smtp-Source: AMrXdXs/yBB0VVxXrCYncxYQEdyG06qSYjZeq3rNHNqOtQQlkXE257Ezrn60q098cvpwXmj4KMohUg==
X-Received: by 2002:a05:6a20:1a8a:b0:b8:65b8:a37 with SMTP id
 ci10-20020a056a201a8a00b000b865b80a37mr2911364pzb.53.1673798822892; 
 Sun, 15 Jan 2023 08:07:02 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c76-20020a624e4f000000b00589c467ed88sm11422735pfb.69.2023.01.15.08.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 08:07:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bin.meng@windriver.com,
 abdulras@google.com
Subject: [PATCH 1/2] target/arm: Introduce helper_set_rounding_mode_chkfrm
Date: Sun, 15 Jan 2023 06:06:56 -1000
Message-Id: <20230115160657.3169274-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115160657.3169274-1-richard.henderson@linaro.org>
References: <20230115160657.3169274-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 15 Jan 2023 16:07:12 -0000

The new helper always validates the contents of FRM, even
if the new rounding mode is not DYN.  This is required by
the vector unit.

Track whether we've validated FRM separately from whether
we've updated fp_status with a given rounding mode, so that
we can elide calls correctly.

This partially reverts d6c4d3f2a69 which attempted the to do
the same thing, but with two calls to gen_set_rm(), which is
both inefficient and tickles an assertion in decode_save_opc.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1441
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |  1 +
 target/riscv/fpu_helper.c               | 37 +++++++++++++++++++++++++
 target/riscv/translate.c                | 19 +++++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc | 24 +++-------------
 4 files changed, 61 insertions(+), 20 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 227c7122ef..9792ab5086 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -3,6 +3,7 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
+DEF_HELPER_FLAGS_2(set_rounding_mode_chkfrm, TCG_CALL_NO_WG, void, env, i32)
 DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
 
 /* Floating Point - fused */
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 5699c9517f..96817df8ef 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -81,6 +81,43 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
     set_float_rounding_mode(softrm, &env->fp_status);
 }
 
+void helper_set_rounding_mode_chkfrm(CPURISCVState *env, uint32_t rm)
+{
+    int softrm;
+
+    /* Always validate frm, even if rm != DYN. */
+    if (unlikely(env->frm >= 5)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+    if (rm == RISCV_FRM_DYN) {
+        rm = env->frm;
+    }
+    switch (rm) {
+    case RISCV_FRM_RNE:
+        softrm = float_round_nearest_even;
+        break;
+    case RISCV_FRM_RTZ:
+        softrm = float_round_to_zero;
+        break;
+    case RISCV_FRM_RDN:
+        softrm = float_round_down;
+        break;
+    case RISCV_FRM_RUP:
+        softrm = float_round_up;
+        break;
+    case RISCV_FRM_RMM:
+        softrm = float_round_ties_away;
+        break;
+    case RISCV_FRM_ROD:
+        softrm = float_round_to_odd;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    set_float_rounding_mode(softrm, &env->fp_status);
+}
+
 void helper_set_rod_rounding_mode(CPURISCVState *env)
 {
     set_float_rounding_mode(float_round_to_odd, &env->fp_status);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index df38db7553..493c3815e1 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -114,6 +114,8 @@ typedef struct DisasContext {
     bool pm_base_enabled;
     /* Use icount trigger for native debug */
     bool itrigger;
+    /* FRM is known to contain a valid value. */
+    bool frm_valid;
     /* TCG of the current insn_start */
     TCGOp *insn_start;
 } DisasContext;
@@ -674,12 +676,29 @@ static void gen_set_rm(DisasContext *ctx, int rm)
         gen_helper_set_rod_rounding_mode(cpu_env);
         return;
     }
+    if (rm == RISCV_FRM_DYN) {
+        /* The helper will return only if frm valid. */
+        ctx->frm_valid = true;
+    }
 
     /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
     decode_save_opc(ctx);
     gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
 }
 
+static void gen_set_rm_chkfrm(DisasContext *ctx, int rm)
+{
+    if (ctx->frm == rm && ctx->frm_valid) {
+        return;
+    }
+    ctx->frm = rm;
+    ctx->frm_valid = true;
+
+    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
+    decode_save_opc(ctx);
+    gen_helper_set_rounding_mode_chkfrm(cpu_env, tcg_constant_i32(rm));
+}
+
 static int ex_plus_1(DisasContext *ctx, int nf)
 {
     return nf + 1;
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index d455acedbf..bbb5c3a7b5 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2679,13 +2679,9 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
                     int rm)
 {
     if (checkfn(s, a)) {
-        if (rm != RISCV_FRM_DYN) {
-            gen_set_rm(s, RISCV_FRM_DYN);
-        }
-
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
-        gen_set_rm(s, rm);
+        gen_set_rm_chkfrm(s, rm);
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
 
@@ -2882,17 +2878,13 @@ static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (CHECK(s, a)) {                                             \
-        if (FRM != RISCV_FRM_DYN) {                                \
-            gen_set_rm(s, RISCV_FRM_DYN);                          \
-        }                                                          \
-                                                                   \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[2] = {            \
             gen_helper_##HELPER##_h,                               \
             gen_helper_##HELPER##_w,                               \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, FRM);                                        \
+        gen_set_rm_chkfrm(s, FRM);                                 \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
@@ -3005,17 +2997,13 @@ static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (CHECK(s, a)) {                                             \
-        if (FRM != RISCV_FRM_DYN) {                                \
-            gen_set_rm(s, RISCV_FRM_DYN);                          \
-        }                                                          \
-                                                                   \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[2] = {            \
             gen_helper_##HELPER##_h,                               \
             gen_helper_##HELPER##_w,                               \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, FRM);                                        \
+        gen_set_rm_chkfrm(s, FRM);                                 \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
@@ -3060,10 +3048,6 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (opxfv_narrow_check(s, a)) {                                \
-        if (FRM != RISCV_FRM_DYN) {                                \
-            gen_set_rm(s, RISCV_FRM_DYN);                          \
-        }                                                          \
-                                                                   \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[3] = {            \
             gen_helper_##HELPER##_b,                               \
@@ -3071,7 +3055,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##HELPER##_w,                               \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, FRM);                                        \
+        gen_set_rm_chkfrm(s, FRM);                                 \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
-- 
2.34.1


