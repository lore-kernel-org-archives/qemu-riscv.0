Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mH8YS-0006Mi-Sl
	for mharc-qemu-riscv@gnu.org; Fri, 20 Aug 2021 13:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8YJ-00064g-L9
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:35 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:47007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8YE-00042g-EE
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:35 -0400
Received: by mail-pf1-x435.google.com with SMTP id y11so9226865pfl.13
 for <qemu-riscv@nongnu.org>; Fri, 20 Aug 2021 10:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Nkzm7eBwwK6YNx3T/orn7JiGzqUz9K0xgscSXV8LIM=;
 b=WLvoWJFNhoJkIXcj7mDqLEJgwApGSvYtf4WVIIDu98BaeLtX+SZZjBRRvSs4bvlZWO
 /QdklOVNwBow6soQQ8dDD/RyInvDC3kjG47ueGECKaln/92dNeQo1g2PVevMFM1599iu
 78fcNAuqV6buGv8SCdJi3Xx5ptEBmKxnUz04wQvYhwXWAKe3YEaDl093dEoWPEKar5yt
 Ooo1ZS5cTfPhcPACTlULuA1xCI2o+52OMSU/k3XtRJpKO5uZPse6JETTYB207d5QUDLy
 J9UQgG7k1Gx5IB3DG/XDBuquObj1Uv0ajyfUz9ZLWImH3bsJe5/ngN3rdPR7o2D85wkm
 0akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Nkzm7eBwwK6YNx3T/orn7JiGzqUz9K0xgscSXV8LIM=;
 b=DeqIHhzIln0HARp6yLni+mdh8qsO8ljdD7WlBSlrr1rez08KloM77OmIbyhVxTfkUN
 p+O4XWiHe8ZkkBrxY58b3lxW48/dvf1FKoy9xugNcRzYONfP/2aLbG71a9Hkdat+9+7i
 1Pe/mRJnOgh1brgPQedzeCsEsYGheChz5Yha5eBCDa0IFLiYGPetbvytYwxBH+T6DfxT
 obwJxUmhrl9GM5qUFc4lu2Cz/VZ7wuE8eaIBPMvNj4+LETHp9CttREVl0AZ0j9fJUp1m
 nU1d5l/SJ70+lHwyPwxrrIIo5KpqBzp+jYTfDWzUOE/is3tK9Uyb5PtWCZO2LeAxxdZl
 Ta7w==
X-Gm-Message-State: AOAM532jOvVK56F2BHjrWJ0yn3Smxguqnyk4dzzNcN4lgJ5unLh8NdmX
 Df1yk4v8JhJVadp5j9oTBT0uKGxMYMoS4w==
X-Google-Smtp-Source: ABdhPJz6LWOlnBZ/6d8Pu4CO+v43JFJMGmk1UlkUZWm+QuUqli9t/Ei3hmQLHi9F7uh2fhLnLsICaQ==
X-Received: by 2002:a63:5862:: with SMTP id i34mr19544168pgm.117.1629481408987; 
 Fri, 20 Aug 2021 10:43:28 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v4 18/21] target/riscv: Use {get,dest}_gpr for RVF
Date: Fri, 20 Aug 2021 07:42:54 -1000
Message-Id: <20210820174257.548286-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Fri, 20 Aug 2021 17:43:36 -0000

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvf.c.inc | 146 ++++++++++++------------
 1 file changed, 70 insertions(+), 76 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index fb9f7f9c00..bddbd418d9 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -25,32 +25,43 @@
 
 static bool trans_flw(DisasContext *ctx, arg_flw *a)
 {
+    TCGv_i64 dest;
+    TCGv addr;
+
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
 
-    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEUL);
-    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
+    addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp = temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    dest = cpu_fpr[a->rd];
+    tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_TEUL);
+    gen_nanbox_s(dest, dest);
 
-    tcg_temp_free(t0);
     mark_fs_dirty(ctx);
     return true;
 }
 
 static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
 {
+    TCGv addr;
+
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
 
-    tcg_gen_addi_tl(t0, t0, a->imm);
+    addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
 
-    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
+    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUL);
 
-    tcg_temp_free(t0);
     return true;
 }
 
@@ -271,12 +282,11 @@ static bool trans_fcvt_w_s(DisasContext *ctx, arg_fcvt_w_s *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_w_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_w_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -285,12 +295,11 @@ static bool trans_fcvt_wu_s(DisasContext *ctx, arg_fcvt_wu_s *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_wu_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_wu_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -300,17 +309,15 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
 
 #if defined(TARGET_RISCV64)
-    tcg_gen_ext32s_tl(t0, cpu_fpr[a->rs1]);
+    tcg_gen_ext32s_tl(dest, cpu_fpr[a->rs1]);
 #else
-    tcg_gen_extrl_i64_i32(t0, cpu_fpr[a->rs1]);
+    tcg_gen_extrl_i64_i32(dest, cpu_fpr[a->rs1]);
 #endif
 
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
-
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -318,10 +325,11 @@ static bool trans_feq_s(DisasContext *ctx, arg_feq_s *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    TCGv t0 = tcg_temp_new();
-    gen_helper_feq_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_feq_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -329,10 +337,11 @@ static bool trans_flt_s(DisasContext *ctx, arg_flt_s *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    TCGv t0 = tcg_temp_new();
-    gen_helper_flt_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_flt_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -340,10 +349,11 @@ static bool trans_fle_s(DisasContext *ctx, arg_fle_s *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    TCGv t0 = tcg_temp_new();
-    gen_helper_fle_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_fle_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -352,13 +362,10 @@ static bool trans_fclass_s(DisasContext *ctx, arg_fclass_s *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-
-    gen_helper_fclass_s(t0, cpu_fpr[a->rs1]);
-
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_helper_fclass_s(dest, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -367,15 +374,12 @@ static bool trans_fcvt_s_w(DisasContext *ctx, arg_fcvt_s_w *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_w(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_s_w(cpu_fpr[a->rd], cpu_env, src);
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -384,15 +388,12 @@ static bool trans_fcvt_s_wu(DisasContext *ctx, arg_fcvt_s_wu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_wu(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_s_wu(cpu_fpr[a->rd], cpu_env, src);
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -402,15 +403,12 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
-    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], t0);
+    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], src);
     gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -420,11 +418,11 @@ static bool trans_fcvt_l_s(DisasContext *ctx, arg_fcvt_l_s *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_l_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_l_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -434,11 +432,11 @@ static bool trans_fcvt_lu_s(DisasContext *ctx, arg_fcvt_lu_s *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_lu_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_lu_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -448,14 +446,12 @@ static bool trans_fcvt_s_l(DisasContext *ctx, arg_fcvt_s_l *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, src);
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
     return true;
 }
 
@@ -465,13 +461,11 @@ static bool trans_fcvt_s_lu(DisasContext *ctx, arg_fcvt_s_lu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, src);
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
     return true;
 }
-- 
2.25.1


