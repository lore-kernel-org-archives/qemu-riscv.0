Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1i6F-0006oh-M8
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 00:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i64-0006aY-M5
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:42 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:34653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5k-0001Xk-4l
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:40 -0400
Received: by mail-pf1-x42f.google.com with SMTP id o201so2512824pfd.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Jul 2021 21:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bpo+nkLeBkcurb9p7fZinAdhuAJacCJMR3e5BDqkiuc=;
 b=wk5KrkB0hMZQ2JDMo0InJ8C4B9Xl4+C2e5UFxiu+nHRNLi0SpZta7A+baOueUklqMw
 Py9IzA4FD+pTsHEOnVhMTSOiPvy9/tu/yzIqE+rkJQjaJKivGQtJ0gZmUcVS7Y2N1lSL
 yNnMGgu8wOdMpsoEPNjrPYDbvTEwiICT84huxobWaR4200Imd5x7l40HtRTIyK2daXcp
 tbLE2nh0CzV6e3+lf13Fa4IfKcn2QgUt9tkXrQyTBRdet1cjZwrItFWUqKWJtdCgio9s
 f+AnEAcxfoRtm38AOpIpsoDrXbbH3LUHP038zZSoMelrFc3AbJRr89PgaC6XzRxi/6rt
 a/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bpo+nkLeBkcurb9p7fZinAdhuAJacCJMR3e5BDqkiuc=;
 b=DgISMQ451yLYyF12MVSqCSq+gMkfKM6Z/HWvMvoW8KrRQMGdB6AhF9n1ATpf4/6AjZ
 eaX+PulUeyH072gvqlxhVQl+SR9idU9vJ1cAtM4SyhLVbAIvdaoDysi+JWgMcorYSv9l
 i/633U+wmJY/LB+inU/wITq0Ik9xgAeuZ6xtZ159b+4Hh8gmV1N1EIBj1MiYlQnuAlpH
 cEbI5OO3ke8IHiH0VlpLNupbe0ramviFV5RmSQwj5yBeWvaBr0SS3rYpLXe4dyxpWZ20
 hfhisIM+GQX6UYzbVfzkLYuHWNnBKFFM3FjC4GuvCiitX1388Pcnvi45WGxD9wXkgzoX
 UVeg==
X-Gm-Message-State: AOAM533SDfq8OCYvVvVfecCFpqT5DQ9Fgc5+67xi1syNj5Aq8PTTwh7w
 e71MlpEKP+0Y6VyN+9q1G7K/TCdM7YiTzQ==
X-Google-Smtp-Source: ABdhPJybOtC5YF2pfFGGZrPqGh84a0Fju5FlzbHVOhX6DnbXzwI1pqj79SiU9yOJldZ0M7laejXpWg==
X-Received: by 2002:a63:4719:: with SMTP id u25mr36111237pga.193.1625804778231; 
 Thu, 08 Jul 2021 21:26:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Subject: [PATCH 14/17] target/riscv: Tidy trans_rvh.c.inc
Date: Thu,  8 Jul 2021 21:26:05 -0700
Message-Id: <20210709042608.883256-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Fri, 09 Jul 2021 04:26:42 -0000

Exit early if check_access fails.
Split out do_hlv, do_hsv, do_hlvx subroutines.
Use gpr_src, gpr_dst in the new subroutines.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |   1 +
 target/riscv/insn_trans/trans_rvh.c.inc | 264 +++++-------------------
 2 files changed, 55 insertions(+), 210 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f09f8d5faf..2cd921d51c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -42,6 +42,7 @@
 &j    imm rd
 &r    rd rs1 rs2
 &r2   rd rs1
+&r2_s rs1 rs2
 &s    imm rs1 rs2
 &u    imm rd
 &shift     shamt rs1 rd
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index 6b5edf82b7..dac732024b 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -17,281 +17,137 @@
  */
 
 #ifndef CONFIG_USER_ONLY
-static void check_access(DisasContext *ctx) {
+static bool check_access(DisasContext *ctx)
+{
     if (!ctx->hlsx) {
         if (ctx->virt_enabled) {
             generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
         } else {
             generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
         }
+        return false;
     }
+    return true;
 }
 #endif
 
+static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp mop)
+{
+#ifdef CONFIG_USER_ONLY
+    return false;
+#else
+    if (check_access(ctx)) {
+        TCGv dest = gpr_dst(ctx, a->rd);
+        TCGv addr = gpr_src(ctx, a->rs1);
+        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        tcg_gen_qemu_ld_tl(dest, addr, mem_idx, mop);
+    }
+    return true;
+#endif
+}
+
 static bool trans_hlv_b(DisasContext *ctx, arg_hlv_b *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_SB);
-    gen_set_gpr(a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_SB);
 }
 
 static bool trans_hlv_h(DisasContext *ctx, arg_hlv_h *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESW);
-    gen_set_gpr(a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_TESW);
 }
 
 static bool trans_hlv_w(DisasContext *ctx, arg_hlv_w *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESL);
-    gen_set_gpr(a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_TESL);
 }
 
 static bool trans_hlv_bu(DisasContext *ctx, arg_hlv_bu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_UB);
-    gen_set_gpr(a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_UB);
 }
 
 static bool trans_hlv_hu(DisasContext *ctx, arg_hlv_hu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
+    return do_hlv(ctx, a, MO_TEUW);
+}
 
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEUW);
-    gen_set_gpr(a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
+static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemOp mop)
+{
+#ifdef CONFIG_USER_ONLY
     return false;
+#else
+    if (check_access(ctx)) {
+        TCGv addr = gpr_src(ctx, a->rs1);
+        TCGv data = gpr_src(ctx, a->rs2);
+        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        tcg_gen_qemu_ld_tl(data, addr, mem_idx, mop);
+    }
+    return true;
 #endif
 }
 
 static bool trans_hsv_b(DisasContext *ctx, arg_hsv_b *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-    gen_get_gpr(dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_SB);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return do_hsv(ctx, a, MO_SB);
 }
 
 static bool trans_hsv_h(DisasContext *ctx, arg_hsv_h *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-    gen_get_gpr(dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESW);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return do_hsv(ctx, a, MO_TESW);
 }
 
 static bool trans_hsv_w(DisasContext *ctx, arg_hsv_w *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-    gen_get_gpr(dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESL);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return do_hsv(ctx, a, MO_TESL);
 }
 
 static bool trans_hlv_wu(DisasContext *ctx, arg_hlv_wu *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
-
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEUL);
-    gen_set_gpr(a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_TEUL);
 }
 
 static bool trans_hlv_d(DisasContext *ctx, arg_hlv_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
-
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEQ);
-    gen_set_gpr(a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_TEQ);
 }
 
 static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
+    return do_hsv(ctx, a, MO_TEQ);
+}
 
 #ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-    gen_get_gpr(dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEQ);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
+static bool do_hlvx(DisasContext *ctx, arg_r2 *a,
+                    void (*func)(TCGv, TCGv_env, TCGv))
+{
+    if (check_access(ctx)) {
+        TCGv dest = gpr_dst(ctx, a->rd);
+        TCGv addr = gpr_src(ctx, a->rs1);
+        func(dest, cpu_env, addr);
+    }
     return true;
-#else
-    return false;
-#endif
 }
+#endif
 
 static bool trans_hlvx_hu(DisasContext *ctx, arg_hlvx_hu *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-
-    gen_helper_hyp_hlvx_hu(t1, cpu_env, t0);
-    gen_set_gpr(a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
+    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_hu);
 #else
     return false;
 #endif
@@ -301,19 +157,7 @@ static bool trans_hlvx_wu(DisasContext *ctx, arg_hlvx_wu *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(t0, a->rs1);
-
-    gen_helper_hyp_hlvx_wu(t1, cpu_env, t0);
-    gen_set_gpr(a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
+    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_wu);
 #else
     return false;
 #endif
-- 
2.25.1


