Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1i6Q-0007Kx-30
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 00:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i6A-0006eP-JH
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:47 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5k-0001XQ-4T
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:46 -0400
Received: by mail-pg1-x534.google.com with SMTP id 62so8727811pgf.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Jul 2021 21:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6HbbkfJ+bykUVMcUtfXP5XxX4C861myEUuDfLalAZI0=;
 b=bA2CT54Lu4kcSuld9DUdIeLYl7mM/2c9emyxQ3OUo5dtYApfa9ev2OGiqsMktR2YTO
 QOt3vUKJAbOtGYCjSqtgVMa0Q6xpYEIqeOJ1xXFz7Tho+BLtzVSxLx60u0OqNNjjwy6/
 DcA2UQ5kwVDIUpao3tIadXCXuBPbUOfKSYDh4InrfASe7iMclS879Qt9YGpDst+Xw9sB
 iFMioM2exSM+UMHpeFawzBwNic7T70twU1FWUPHZBxblRHLjyHilsF34O9zh8PYG/2Iz
 ta7S2IV+sT1mrMgbKU/xOSDjgpZc3dv3PfyTrp3LuZpj6yAHVz1JOaGwN7+EL0ximckI
 1VhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6HbbkfJ+bykUVMcUtfXP5XxX4C861myEUuDfLalAZI0=;
 b=avi3OWZtpnh9Ld7HhM4wRB8kAYAomC5xL7AXnmzlaxiyXhgsYup0ul8RaYfQoaiCKT
 tiYPQziMkqRxLw7/ZwkfXCM0Ml9FWj7o/sracGmj7r0+hShXCOoicn7QZmEeA8ucC0x1
 Qn+bZCzWRmLODmQhJgzB/0oJCEWC7DQN6jE8TkFk3v8cW7v6HcGOw99SiaPoHo2ZKjxM
 SzFTHKGckroPCkUHF2M5gdmds9wJbAyk9eXF/2FmwveO86wGOICAp4InGOMaSc/hm4Ol
 UiKqEQTPTLeYL9IKKG+xU9Uh+NMJsrN/nzMutyXH8OJcWkitVKaZIFqxYWMT81s0FHOT
 Ek1A==
X-Gm-Message-State: AOAM533az2kwazBQK/vI3BUdtATdkft+e4zvvRTcRVxRrIjdtzNRrcsA
 E/GeY622rcRVBYeO5e5Ove1q3iRKQL6+sw==
X-Google-Smtp-Source: ABdhPJye2O4F6nSkGVy67hgN6lR4mVGRGMNUfJK/6ODwvJ8ARHrQ4OQejLMA2znjXXmgyUbO1aaxvQ==
X-Received: by 2002:a65:5186:: with SMTP id h6mr35499502pgq.62.1625804777586; 
 Thu, 08 Jul 2021 21:26:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Subject: [PATCH 13/17] target/riscv: Use gpr_{src,dst} for RVD
Date: Thu,  8 Jul 2021 21:26:04 -0700
Message-Id: <20210709042608.883256-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Jul 2021 04:26:48 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvd.c.inc | 116 +++++++++---------------
 1 file changed, 44 insertions(+), 72 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 7e45538ae0..9bb15fdc12 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -22,14 +22,22 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
 
-    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEQ);
+    TCGv addr = gpr_src(ctx, a->rs1);
+    TCGv temp = NULL;
 
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEQ);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
     return true;
 }
 
@@ -37,13 +45,21 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
 
-    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
+    TCGv addr = gpr_src(ctx, a->rs1);
+    TCGv temp = NULL;
 
-    tcg_temp_free(t0);
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEQ);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
     return true;
 }
 
@@ -252,11 +268,8 @@ static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_feq_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
-
+    gen_helper_feq_d(gpr_dst(ctx, a->rd), cpu_env,
+                     cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
     return true;
 }
 
@@ -265,11 +278,8 @@ static bool trans_flt_d(DisasContext *ctx, arg_flt_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_flt_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
-
+    gen_helper_flt_d(gpr_dst(ctx, a->rd), cpu_env,
+                     cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
     return true;
 }
 
@@ -278,11 +288,8 @@ static bool trans_fle_d(DisasContext *ctx, arg_fle_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_fle_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
-
+    gen_helper_fle_d(gpr_dst(ctx, a->rd), cpu_env,
+                     cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
     return true;
 }
 
@@ -291,10 +298,7 @@ static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_fclass_d(t0, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fclass_d(gpr_dst(ctx, a->rd), cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -303,12 +307,8 @@ static bool trans_fcvt_w_d(DisasContext *ctx, arg_fcvt_w_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_w_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
-
+    gen_helper_fcvt_w_d(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -317,12 +317,8 @@ static bool trans_fcvt_wu_d(DisasContext *ctx, arg_fcvt_wu_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_wu_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
-
+    gen_helper_fcvt_wu_d(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -331,12 +327,8 @@ static bool trans_fcvt_d_w(DisasContext *ctx, arg_fcvt_d_w *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
 
     mark_fs_dirty(ctx);
     return true;
@@ -347,12 +339,8 @@ static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
 
     mark_fs_dirty(ctx);
     return true;
@@ -364,11 +352,8 @@ static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_l_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_l_d(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -378,11 +363,8 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_lu_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_lu_d(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -406,12 +388,9 @@ static bool trans_fcvt_d_l(DisasContext *ctx, arg_fcvt_d_l *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
+
     mark_fs_dirty(ctx);
     return true;
 }
@@ -422,12 +401,9 @@ static bool trans_fcvt_d_lu(DisasContext *ctx, arg_fcvt_d_lu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
+
     mark_fs_dirty(ctx);
     return true;
 }
@@ -439,11 +415,7 @@ static bool trans_fmv_d_x(DisasContext *ctx, arg_fmv_d_x *a)
     REQUIRE_EXT(ctx, RVD);
 
 #ifdef TARGET_RISCV64
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-
-    tcg_gen_mov_tl(cpu_fpr[a->rd], t0);
-    tcg_temp_free(t0);
+    tcg_gen_mov_tl(cpu_fpr[a->rd], gpr_src(ctx, a->rs1));
     mark_fs_dirty(ctx);
     return true;
 #else
-- 
2.25.1


