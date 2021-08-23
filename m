Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIG2y-0006TT-S3
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 15:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2t-0006HI-20
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:50 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2n-00037o-1K
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:46 -0400
Received: by mail-pl1-x632.google.com with SMTP id w6so10807101plg.9
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 12:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kVyJzLAMP/AO1yuDPHJJ+rMmTd5Fqy79KswtGPvssO8=;
 b=rpOBlLK+JV5zPYTom0I/4+eKSANnWByUniSHLlNbSdWrAvtEauDzJSc9MGe43UKhcj
 D6/CP1Hefrfqt/mkgaCj8CKf3yMLOQ4uefgHmt1oqR6a4yACe6oxx1xkuXkqxnjSeDpS
 FJ30nwm2sDLFTrosnJZoP4e6e+m4++llJ6k1PxypEG+dSxkujggStAT7Ckm/wVA/5Ftw
 Jiy8DbKPo1bQPc6ejlscAfFN0mmo66yL0JEmYJKleSuvU0a66dTYHpScAemX3fw5Dkie
 V1/MjVwMwPljnFteKnDigeIZijH+4sFc7Ex2udNG62yND8YWIAxDPlUEX2E92OKpiEj+
 8GqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kVyJzLAMP/AO1yuDPHJJ+rMmTd5Fqy79KswtGPvssO8=;
 b=DIbcTL7FHiBvKoiQsywPGoA841/aF5xzbyWciNzJnyfLuNg2IyAR/SvX+QZbeEBSHH
 Hxz2Y+78WswJU1Tbul+ci4Lj2TjGH8d0bs+kX/hbvrAr6OKXroETFS0jRbuVuAogyQNk
 gC2fY2FL4lVMJZKMvZh6sTTrFU9gGw8kYr0SUXx/g6YCC8RwT2h8yxooeZLyJ/wvu/za
 N80/OvFtxp88UVR57w/l3ea8Ku60mXndiJ8Gt+dykhapzF1jLqKTBOTXNvlqr1RaFZ6A
 JXR7babYFy6edHsr8+fItU28LguB1MHEwNIPMVfbMiHYEk3e1yufj/qDswrXeX4lTKeZ
 PJXA==
X-Gm-Message-State: AOAM532jL3I1XNLiayWhINcv92oe64KZ3xpoLwoJzrB2y0r26N/+06Mg
 EmNEJfVstFzIFwlfKExPqY53rg==
X-Google-Smtp-Source: ABdhPJx7eCEHRsU5R1CSHf86Ejlq8um8bOtkM0xyYRUxkX1ryG+PMKhqPLbC2WD1xdsxgPG0qXTXdA==
X-Received: by 2002:a17:90a:5107:: with SMTP id t7mr268771pjh.74.1629748539453; 
 Mon, 23 Aug 2021 12:55:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	bin.meng@windriver.com,
	alistair.francis@wdc.com
Subject: [PATCH v5 11/24] target/riscv: Add DisasExtend to gen_unary
Date: Mon, 23 Aug 2021 12:55:16 -0700
Message-Id: <20210823195529.560295-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 19:55:50 -0000

Use ctx->w for ctpopw, which is the only one that can
re-use the generic algorithm for the narrow operation.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 14 ++++++--------
 target/riscv/insn_trans/trans_rvb.c.inc | 24 +++++++++---------------
 2 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 09853530c4..785e9e58cc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -478,17 +478,15 @@ static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
     return true;
 }
 
-static bool gen_unary(DisasContext *ctx, arg_r2 *a,
-                      void(*func)(TCGv, TCGv))
+static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
+                      void (*func)(TCGv, TCGv))
 {
-    TCGv source = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
 
-    gen_get_gpr(ctx, source, a->rs1);
+    func(dest, src1);
 
-    (*func)(source, source);
-
-    gen_set_gpr(ctx, a->rd, source);
-    tcg_temp_free(source);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 73f088be23..e255678fff 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -26,7 +26,7 @@ static void gen_clz(TCGv ret, TCGv arg1)
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_clz);
+    return gen_unary(ctx, a, EXT_ZERO, gen_clz);
 }
 
 static void gen_ctz(TCGv ret, TCGv arg1)
@@ -37,13 +37,13 @@ static void gen_ctz(TCGv ret, TCGv arg1)
 static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_ctz);
+    return gen_unary(ctx, a, EXT_ZERO, gen_ctz);
 }
 
 static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, tcg_gen_ctpop_tl);
+    return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
 
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
@@ -132,13 +132,13 @@ static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
 static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, tcg_gen_ext8s_tl);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext8s_tl);
 }
 
 static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, tcg_gen_ext16s_tl);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16s_tl);
 }
 
 static void gen_sbop_mask(TCGv ret, TCGv shamt)
@@ -366,7 +366,6 @@ GEN_TRANS_SHADD(3)
 
 static void gen_clzw(TCGv ret, TCGv arg1)
 {
-    tcg_gen_ext32u_tl(ret, arg1);
     tcg_gen_clzi_tl(ret, ret, 64);
     tcg_gen_subi_tl(ret, ret, 32);
 }
@@ -375,7 +374,7 @@ static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_clzw);
+    return gen_unary(ctx, a, EXT_ZERO, gen_clzw);
 }
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
@@ -388,20 +387,15 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_ctzw);
-}
-
-static void gen_cpopw(TCGv ret, TCGv arg1)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    tcg_gen_ctpop_tl(ret, arg1);
+    return gen_unary(ctx, a, EXT_NONE, gen_ctzw);
 }
 
 static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_cpopw);
+    ctx->w = true;
+    return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
 
 static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
-- 
2.25.1


