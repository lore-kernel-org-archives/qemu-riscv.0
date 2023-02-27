Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW2U-000130-VL
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW28-0000G8-PN
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:46 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW23-0007sw-88
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:43 -0500
Received: by mail-pl1-x62c.google.com with SMTP id h8so2226285plf.10
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZNvQrfS+0eakfNbAWA5HLC8WozWUcIxZIzfYvhnwHQw=;
 b=SwZ1MeUeT13jrJ+W9Kk+gjsvEfTbyAo2TkO4B2X/4qhprDKIm+bXclpmmmljXGsOr6
 53C+9SXxRoRdwQr+ylkRGtjlNukpv1KLu2Qxt+e9nB8FyMq8Q9GF8IFJd0y/SoJncouu
 bfJsRx1ZWbfMMw1nhb1rP8ngCXxbNAiKdq+deKD5USXBK9elaIG/5yQs7bfwCPj1LxIs
 5eSaxROTFzVTANu8+W0iYWdba59lM7ayIFGgL0244LeTvBlPJ9Pk1Ws/WoTbctlDJx0j
 5nsar2ztFU0iTOYIUwJJq1SMLorID17mDRgYPUv6dH0RT63iPHoBxGrpTQalunkbXll0
 We2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZNvQrfS+0eakfNbAWA5HLC8WozWUcIxZIzfYvhnwHQw=;
 b=gx0RKHP2ax5HWICpS+QKgafFjqtWLnjrMaWflvqkqcausuvZfiu5wEyuSbjO18oXBe
 ZWGZs0BmkNsh+5G+Ne4y5xEmyxwF4mai11k3GFn48fJSDJ6uVKQBvLXBnbLBPPLbcYkY
 4+LJdrySTqI246JZcFayD6cWhBTB3ejCW9QSMZCP+xia5cJuiUiyzimt5VqIDSohDI1o
 DyWQoak5ZtbbLi+P0j3MreLQ+sE+bj2n8eYNJUk4/+Q1EFPtRxSX/7yiwGPn+nHrJv8i
 KWh2aWJdfzOaHoyoDfe5dEytZFa7XGKd5rKotMmz8k/YAPvHB37hwqpDlC3HPglmQ1ff
 nGAA==
X-Gm-Message-State: AO0yUKUVDBy4vxnOpkBUs8pAXbuqgawxforlpS1jnzWXDCD1XPGcYO+I
 bVMQRCFdwrlraXXwXtsG9vDm+Q==
X-Google-Smtp-Source: AK7set8hJMxKmL59VJNxVTi0EaRMvAoi7ESiJWVaiiO8eVA1gglUReJhUYCVF4ABHB80bnbXdsPj1g==
X-Received: by 2002:a17:90b:33c3:b0:238:e9:8994 with SMTP id
 lk3-20020a17090b33c300b0023800e98994mr2659698pjb.0.1677475597920; 
 Sun, 26 Feb 2023 21:26:37 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 32/76] target/loongarch: Drop tcg_temp_free
Date: Sun, 26 Feb 2023 19:24:21 -1000
Message-Id: <20230227052505.352889-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:26:51 -0000

Translators are no longer required to free tcg temporaries.

Reviewed-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/insn_trans/trans_arith.c.inc | 12 -------
 .../loongarch/insn_trans/trans_atomic.c.inc   |  3 --
 target/loongarch/insn_trans/trans_bit.c.inc   | 12 -------
 target/loongarch/insn_trans/trans_fcmp.c.inc  |  3 --
 .../loongarch/insn_trans/trans_fmemory.c.inc  | 20 ++---------
 target/loongarch/insn_trans/trans_fmov.c.inc  |  6 ----
 .../loongarch/insn_trans/trans_memory.c.inc   | 34 +++----------------
 .../insn_trans/trans_privileged.c.inc         |  4 ---
 target/loongarch/insn_trans/trans_shift.c.inc | 11 ------
 9 files changed, 6 insertions(+), 99 deletions(-)

diff --git a/target/loongarch/insn_trans/trans_arith.c.inc b/target/loongarch/insn_trans/trans_arith.c.inc
index 8e45eadbc8..43d6cf261d 100644
--- a/target/loongarch/insn_trans/trans_arith.c.inc
+++ b/target/loongarch/insn_trans/trans_arith.c.inc
@@ -100,14 +100,12 @@ static void gen_mulh_d(TCGv dest, TCGv src1, TCGv src2)
 {
     TCGv discard = tcg_temp_new();
     tcg_gen_muls2_tl(discard, dest, src1, src2);
-    tcg_temp_free(discard);
 }
 
 static void gen_mulh_du(TCGv dest, TCGv src1, TCGv src2)
 {
     TCGv discard = tcg_temp_new();
     tcg_gen_mulu2_tl(discard, dest, src1, src2);
-    tcg_temp_free(discard);
 }
 
 static void prep_divisor_d(TCGv ret, TCGv src1, TCGv src2)
@@ -129,9 +127,6 @@ static void prep_divisor_d(TCGv ret, TCGv src1, TCGv src2)
     tcg_gen_and_tl(ret, ret, t0);
     tcg_gen_or_tl(ret, ret, t1);
     tcg_gen_movcond_tl(TCG_COND_NE, ret, ret, zero, ret, src2);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void prep_divisor_du(TCGv ret, TCGv src2)
@@ -152,7 +147,6 @@ static void gen_div_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     prep_divisor_d(t0, src1, src2);
     tcg_gen_div_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
@@ -160,7 +154,6 @@ static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     prep_divisor_d(t0, src1, src2);
     tcg_gen_rem_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_div_du(TCGv dest, TCGv src1, TCGv src2)
@@ -168,7 +161,6 @@ static void gen_div_du(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     prep_divisor_du(t0, src2);
     tcg_gen_divu_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
@@ -176,7 +168,6 @@ static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     prep_divisor_du(t0, src2);
     tcg_gen_remu_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_div_w(TCGv dest, TCGv src1, TCGv src2)
@@ -185,7 +176,6 @@ static void gen_div_w(TCGv dest, TCGv src1, TCGv src2)
     /* We need not check for integer overflow for div_w. */
     prep_divisor_du(t0, src2);
     tcg_gen_div_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_rem_w(TCGv dest, TCGv src1, TCGv src2)
@@ -194,7 +184,6 @@ static void gen_rem_w(TCGv dest, TCGv src1, TCGv src2)
     /* We need not check for integer overflow for rem_w. */
     prep_divisor_du(t0, src2);
     tcg_gen_rem_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_alsl(TCGv dest, TCGv src1, TCGv src2, target_long sa)
@@ -202,7 +191,6 @@ static void gen_alsl(TCGv dest, TCGv src1, TCGv src2, target_long sa)
     TCGv t0 = tcg_temp_new();
     tcg_gen_shli_tl(t0, src1, sa);
     tcg_gen_add_tl(dest, t0, src2);
-    tcg_temp_free(t0);
 }
 
 static bool trans_lu32i_d(DisasContext *ctx, arg_lu32i_d *a)
diff --git a/target/loongarch/insn_trans/trans_atomic.c.inc b/target/loongarch/insn_trans/trans_atomic.c.inc
index 6763c1c301..612709f2a7 100644
--- a/target/loongarch/insn_trans/trans_atomic.c.inc
+++ b/target/loongarch/insn_trans/trans_atomic.c.inc
@@ -14,7 +14,6 @@ static bool gen_ll(DisasContext *ctx, arg_rr_i *a, MemOp mop)
     tcg_gen_st_tl(t0, cpu_env, offsetof(CPULoongArchState, lladdr));
     tcg_gen_st_tl(dest, cpu_env, offsetof(CPULoongArchState, llval));
     gen_set_gpr(a->rd, dest, EXT_NONE);
-    tcg_temp_free(t0);
 
     return true;
 }
@@ -43,8 +42,6 @@ static bool gen_sc(DisasContext *ctx, arg_rr_i *a, MemOp mop)
     tcg_gen_setcond_tl(TCG_COND_EQ, dest, t0, cpu_llval);
     gen_set_label(done);
     gen_set_gpr(a->rd, dest, EXT_NONE);
-    tcg_temp_free(t0);
-    tcg_temp_free(val);
 
     return true;
 }
diff --git a/target/loongarch/insn_trans/trans_bit.c.inc b/target/loongarch/insn_trans/trans_bit.c.inc
index b01e4aeb23..25b4d7858b 100644
--- a/target/loongarch/insn_trans/trans_bit.c.inc
+++ b/target/loongarch/insn_trans/trans_bit.c.inc
@@ -122,9 +122,6 @@ static void gen_revb_2h(TCGv dest, TCGv src1)
     tcg_gen_and_tl(t1, src1, mask);
     tcg_gen_shli_tl(t1, t1, 8);
     tcg_gen_or_tl(dest, t0, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_revb_4h(TCGv dest, TCGv src1)
@@ -138,9 +135,6 @@ static void gen_revb_4h(TCGv dest, TCGv src1)
     tcg_gen_and_tl(t1, src1, mask);
     tcg_gen_shli_tl(t1, t1, 8);
     tcg_gen_or_tl(dest, t0, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_revh_2w(TCGv dest, TCGv src1)
@@ -154,9 +148,6 @@ static void gen_revh_2w(TCGv dest, TCGv src1)
     tcg_gen_and_i64(t0, t0, mask);
     tcg_gen_shli_i64(t1, t1, 16);
     tcg_gen_or_i64(dest, t1, t0);
-
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
 }
 
 static void gen_revh_d(TCGv dest, TCGv src1)
@@ -171,9 +162,6 @@ static void gen_revh_d(TCGv dest, TCGv src1)
     tcg_gen_shli_tl(t0, t0, 16);
     tcg_gen_or_tl(t0, t0, t1);
     tcg_gen_rotri_tl(dest, t0, 32);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_maskeqz(TCGv dest, TCGv src1, TCGv src2)
diff --git a/target/loongarch/insn_trans/trans_fcmp.c.inc b/target/loongarch/insn_trans/trans_fcmp.c.inc
index 2ccf646ccb..3b0da2b9f4 100644
--- a/target/loongarch/insn_trans/trans_fcmp.c.inc
+++ b/target/loongarch/insn_trans/trans_fcmp.c.inc
@@ -38,7 +38,6 @@ static bool trans_fcmp_cond_s(DisasContext *ctx, arg_fcmp_cond_s *a)
     fn(var, cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk], tcg_constant_i32(flags));
 
     tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd]));
-    tcg_temp_free(var);
     return true;
 }
 
@@ -57,7 +56,5 @@ static bool trans_fcmp_cond_d(DisasContext *ctx, arg_fcmp_cond_d *a)
     fn(var, cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk], tcg_constant_i32(flags));
 
     tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd]));
-
-    tcg_temp_free(var);
     return true;
 }
diff --git a/target/loongarch/insn_trans/trans_fmemory.c.inc b/target/loongarch/insn_trans/trans_fmemory.c.inc
index 3025a1d3e9..0d11843873 100644
--- a/target/loongarch/insn_trans/trans_fmemory.c.inc
+++ b/target/loongarch/insn_trans/trans_fmemory.c.inc
@@ -13,12 +13,11 @@ static void maybe_nanbox_load(TCGv freg, MemOp mop)
 static bool gen_fload_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
 {
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     CHECK_FPE;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
@@ -26,31 +25,22 @@ static bool gen_fload_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     maybe_nanbox_load(cpu_fpr[a->fd], mop);
 
-    if (temp) {
-        tcg_temp_free(temp);
-    }
-
     return true;
 }
 
 static bool gen_fstore_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
 {
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     CHECK_FPE;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-
-    if (temp) {
-        tcg_temp_free(temp);
-    }
     return true;
 }
 
@@ -66,7 +56,6 @@ static bool gen_floadx(DisasContext *ctx, arg_frr *a, MemOp mop)
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     maybe_nanbox_load(cpu_fpr[a->fd], mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -82,7 +71,6 @@ static bool gen_fstorex(DisasContext *ctx, arg_frr *a, MemOp mop)
     addr = tcg_temp_new();
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -100,7 +88,6 @@ static bool gen_fload_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     maybe_nanbox_load(cpu_fpr[a->fd], mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -117,7 +104,6 @@ static bool gen_fstore_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
     gen_helper_asrtgt_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -135,7 +121,6 @@ static bool gen_fload_le(DisasContext *ctx, arg_frr *a, MemOp mop)
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     maybe_nanbox_load(cpu_fpr[a->fd], mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -152,7 +137,6 @@ static bool gen_fstore_le(DisasContext *ctx, arg_frr *a, MemOp mop)
     gen_helper_asrtle_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-    tcg_temp_free(addr);
 
     return true;
 }
diff --git a/target/loongarch/insn_trans/trans_fmov.c.inc b/target/loongarch/insn_trans/trans_fmov.c.inc
index 8e5106db4e..069c941665 100644
--- a/target/loongarch/insn_trans/trans_fmov.c.inc
+++ b/target/loongarch/insn_trans/trans_fmov.c.inc
@@ -18,7 +18,6 @@ static bool trans_fsel(DisasContext *ctx, arg_fsel *a)
     tcg_gen_ld8u_tl(cond, cpu_env, offsetof(CPULoongArchState, cf[a->ca]));
     tcg_gen_movcond_tl(TCG_COND_EQ, cpu_fpr[a->fd], cond, zero,
                        cpu_fpr[a->fj], cpu_fpr[a->fk]);
-    tcg_temp_free(cond);
 
     return true;
 }
@@ -82,9 +81,6 @@ static bool trans_movgr2fcsr(DisasContext *ctx, arg_movgr2fcsr *a)
         tcg_gen_andi_i32(fcsr0, fcsr0, ~mask);
         tcg_gen_or_i32(fcsr0, fcsr0, temp);
         tcg_gen_st_i32(fcsr0, cpu_env, offsetof(CPULoongArchState, fcsr0));
-
-        tcg_temp_free_i32(temp);
-        tcg_temp_free_i32(fcsr0);
     }
 
     /*
@@ -134,7 +130,6 @@ static bool trans_movfr2cf(DisasContext *ctx, arg_movfr2cf *a)
     t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, cpu_fpr[a->fj], 0x1);
     tcg_gen_st8_tl(t0, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
-    tcg_temp_free(t0);
 
     return true;
 }
@@ -157,7 +152,6 @@ static bool trans_movgr2cf(DisasContext *ctx, arg_movgr2cf *a)
     t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, gpr_src(ctx, a->rj, EXT_NONE), 0x1);
     tcg_gen_st8_tl(t0, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
-    tcg_temp_free(t0);
 
     return true;
 }
diff --git a/target/loongarch/insn_trans/trans_memory.c.inc b/target/loongarch/insn_trans/trans_memory.c.inc
index d5eb31147c..75cfdf59ad 100644
--- a/target/loongarch/insn_trans/trans_memory.c.inc
+++ b/target/loongarch/insn_trans/trans_memory.c.inc
@@ -7,21 +7,15 @@ static bool gen_load(DisasContext *ctx, arg_rr_i *a, MemOp mop)
 {
     TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
     gen_set_gpr(a->rd, dest, EXT_NONE);
-
-    if (temp) {
-        tcg_temp_free(temp);
-    }
-
     return true;
 }
 
@@ -29,20 +23,14 @@ static bool gen_store(DisasContext *ctx, arg_rr_i *a, MemOp mop)
 {
     TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
-
-    if (temp) {
-        tcg_temp_free(temp);
-    }
-
     return true;
 }
 
@@ -56,7 +44,6 @@ static bool gen_loadx(DisasContext *ctx, arg_rrr *a, MemOp mop)
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
     gen_set_gpr(a->rd, dest, EXT_NONE);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -70,7 +57,6 @@ static bool gen_storex(DisasContext *ctx, arg_rrr *a, MemOp mop)
 
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -146,21 +132,15 @@ static bool gen_ldptr(DisasContext *ctx, arg_rr_i *a, MemOp mop)
 {
     TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
     gen_set_gpr(a->rd, dest, EXT_NONE);
-
-    if (temp) {
-        tcg_temp_free(temp);
-    }
-
     return true;
 }
 
@@ -168,20 +148,14 @@ static bool gen_stptr(DisasContext *ctx, arg_rr_i *a, MemOp mop)
 {
     TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
-
-    if (temp) {
-        tcg_temp_free(temp);
-    }
-
     return true;
 }
 
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index 56f4c45e09..5a04352b01 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -291,10 +291,6 @@ static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
         tcg_gen_st_tl(newv, cpu_env, csr->offset);
     }
     gen_set_gpr(a->rd, oldv, EXT_NONE);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(newv);
-    tcg_temp_free(oldv);
     return true;
 }
 
diff --git a/target/loongarch/insn_trans/trans_shift.c.inc b/target/loongarch/insn_trans/trans_shift.c.inc
index 5260af2337..bf5428a2ba 100644
--- a/target/loongarch/insn_trans/trans_shift.c.inc
+++ b/target/loongarch/insn_trans/trans_shift.c.inc
@@ -8,7 +8,6 @@ static void gen_sll_w(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x1f);
     tcg_gen_shl_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_srl_w(TCGv dest, TCGv src1, TCGv src2)
@@ -16,7 +15,6 @@ static void gen_srl_w(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x1f);
     tcg_gen_shr_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_sra_w(TCGv dest, TCGv src1, TCGv src2)
@@ -24,7 +22,6 @@ static void gen_sra_w(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x1f);
     tcg_gen_sar_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_sll_d(TCGv dest, TCGv src1, TCGv src2)
@@ -32,7 +29,6 @@ static void gen_sll_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x3f);
     tcg_gen_shl_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_srl_d(TCGv dest, TCGv src1, TCGv src2)
@@ -40,7 +36,6 @@ static void gen_srl_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x3f);
     tcg_gen_shr_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_sra_d(TCGv dest, TCGv src1, TCGv src2)
@@ -48,7 +43,6 @@ static void gen_sra_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x3f);
     tcg_gen_sar_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_rotr_w(TCGv dest, TCGv src1, TCGv src2)
@@ -64,10 +58,6 @@ static void gen_rotr_w(TCGv dest, TCGv src1, TCGv src2)
 
     tcg_gen_rotr_i32(t1, t1, t2);
     tcg_gen_ext_i32_tl(dest, t1);
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
-    tcg_temp_free(t0);
 }
 
 static void gen_rotr_d(TCGv dest, TCGv src1, TCGv src2)
@@ -75,7 +65,6 @@ static void gen_rotr_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x3f);
     tcg_gen_rotr_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static bool trans_srai_w(DisasContext *ctx, arg_srai_w *a)
-- 
2.34.1


