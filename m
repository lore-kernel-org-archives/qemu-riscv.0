Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1i6C-0006hI-89
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 00:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i61-0006UC-8E
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:37 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5i-0001XA-5Q
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:36 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y4so7560738pfi.9
 for <qemu-riscv@nongnu.org>; Thu, 08 Jul 2021 21:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WW1i6QXBGQYoB4yy+7PZLlIEEYonhARpGvkyI1qitrE=;
 b=LPgnAW8JKS0BEu4NBa9F9EMO+pneQHg8H7zu5qN6QAk6Pea0FkGNMqOMZMJl161EYx
 0XRDVilfvERG1aeiksKWUET3EYGjRKTxX9aXUCbR6SphTzWnMGjHrL+ieGh0HDx6ZnTb
 MkoN59L9vDbM/dKuHX5xKnGFrXPxpsLuxGma/LwJy323WiDiDMIgHnR4S5eW3+XWjP+z
 ux5+8DvjApyHDOcTk/h2iTPHEgVnzGMugPId2qUYDJ5J9rRbOAtkHtO+GC5CzCMMQvNs
 NpT4KzPksyU3jeyZyDxD4E0m5XL9OHF/hfXVi5jkd58d0rrUJ9TXJJ2WPTBJ6xIMPsFV
 YBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WW1i6QXBGQYoB4yy+7PZLlIEEYonhARpGvkyI1qitrE=;
 b=E5SWFf6rDHXjlL3usPsD/+hW+W5NEGcrUcDXvslrvu1XWFdR78U9MBIkmteqgGSndj
 9CLx6bZdq8yyQfzPf9u/3FR7nmgXMJI3GXlAOT20+WH2GWOlGzfJPXi3LyBJtNkj5f0b
 +wG87rw+CMnF8TAzWf9BsJo7bdJNNpg86FivcBGWuA1dC4Q7pMeytYT0HFTg8bpLlzJJ
 b2L+WemmP2ixI8QQt5EU/+qA4k0vQJcVJZiV6GC454ZQgH9oQq+kt9bUUPyUA8I6youJ
 Zj3Fq8VDQhn3MR5uF64qhZKDvVDXwKQkAvSaIFIbER5HUAXvo42x2wZ0LVLqjIX3t/TO
 O9uw==
X-Gm-Message-State: AOAM532NkFC1Ri9BrMJG3JeulShIUhgVJnKyXSGOoRmFAhtLpWzfYENc
 9Yk+tz5XUX7HhQAI+LCU5IqP2g==
X-Google-Smtp-Source: ABdhPJyLgHiyhxmu6WwBWR7IgqYiMoqeuw433LjaAQTjMZW97Np6pFQuLXF/QVhxkGuMO0X5LI8Gxg==
X-Received: by 2002:a65:68c1:: with SMTP id k1mr35585393pgt.335.1625804776971; 
 Thu, 08 Jul 2021 21:26:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Subject: [PATCH 12/17] target/riscv: Use gpr_{src,dst} for RVF
Date: Thu,  8 Jul 2021 21:26:03 -0700
Message-Id: <20210709042608.883256-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Jul 2021 04:26:37 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvf.c.inc | 131 +++++++++---------------
 1 file changed, 49 insertions(+), 82 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 89f78701e7..ff8e942199 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -27,14 +27,23 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
 
-    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEUL);
-    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
+    TCGv addr = gpr_src(ctx, a->rs1);
+    TCGv temp = NULL;
 
-    tcg_temp_free(t0);
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    TCGv_i64 dest = cpu_fpr[a->rd];
+    tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_TEUL);
+    gen_nanbox_s(dest, dest);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
     mark_fs_dirty(ctx);
     return true;
 }
@@ -43,14 +52,21 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
 
-    tcg_gen_addi_tl(t0, t0, a->imm);
+    TCGv addr = gpr_src(ctx, a->rs1);
+    TCGv temp = NULL;
 
-    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
 
-    tcg_temp_free(t0);
+    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUL);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
     return true;
 }
 
@@ -271,12 +287,8 @@ static bool trans_fcvt_w_s(DisasContext *ctx, arg_fcvt_w_s *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_w_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
-
+    gen_helper_fcvt_w_s(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -285,12 +297,8 @@ static bool trans_fcvt_wu_s(DisasContext *ctx, arg_fcvt_wu_s *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_wu_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
-
+    gen_helper_fcvt_wu_s(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -300,17 +308,14 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
 
 #if defined(TARGET_RISCV64)
-    tcg_gen_ext32s_tl(t0, cpu_fpr[a->rs1]);
+    tcg_gen_ext32s_tl(dest, cpu_fpr[a->rs1]);
 #else
-    tcg_gen_extrl_i64_i32(t0, cpu_fpr[a->rs1]);
+    tcg_gen_extrl_i64_i32(dest, cpu_fpr[a->rs1]);
 #endif
 
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -318,10 +323,9 @@ static bool trans_feq_s(DisasContext *ctx, arg_feq_s *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    TCGv t0 = tcg_temp_new();
-    gen_helper_feq_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
+
+    gen_helper_feq_s(gpr_dst(ctx, a->rd), cpu_env,
+                     cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
     return true;
 }
 
@@ -329,10 +333,9 @@ static bool trans_flt_s(DisasContext *ctx, arg_flt_s *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    TCGv t0 = tcg_temp_new();
-    gen_helper_flt_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
+
+    gen_helper_flt_s(gpr_dst(ctx, a->rd), cpu_env,
+                     cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
     return true;
 }
 
@@ -340,10 +343,9 @@ static bool trans_fle_s(DisasContext *ctx, arg_fle_s *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    TCGv t0 = tcg_temp_new();
-    gen_helper_fle_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
+
+    gen_helper_fle_s(gpr_dst(ctx, a->rd), cpu_env,
+                     cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
     return true;
 }
 
@@ -352,13 +354,7 @@ static bool trans_fclass_s(DisasContext *ctx, arg_fclass_s *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-
-    gen_helper_fclass_s(t0, cpu_fpr[a->rs1]);
-
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
-
+    gen_helper_fclass_s(gpr_dst(ctx, a->rd), cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -367,15 +363,10 @@ static bool trans_fcvt_s_w(DisasContext *ctx, arg_fcvt_s_w *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_w(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_s_w(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -384,15 +375,10 @@ static bool trans_fcvt_s_wu(DisasContext *ctx, arg_fcvt_s_wu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_wu(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_s_wu(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -402,15 +388,10 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-
-    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], t0);
+    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], gpr_src(ctx, a->rs1));
     gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -420,11 +401,8 @@ static bool trans_fcvt_l_s(DisasContext *ctx, arg_fcvt_l_s *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_l_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_l_s(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -434,11 +412,8 @@ static bool trans_fcvt_lu_s(DisasContext *ctx, arg_fcvt_lu_s *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_lu_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_lu_s(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -448,14 +423,10 @@ static bool trans_fcvt_s_l(DisasContext *ctx, arg_fcvt_s_l *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
     return true;
 }
 
@@ -465,13 +436,9 @@ static bool trans_fcvt_s_lu(DisasContext *ctx, arg_fcvt_s_lu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
     return true;
 }
-- 
2.25.1


