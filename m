Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGdzE-0005t0-8T
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 05:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzC-0005oL-Dj
 for qemu-riscv@nongnu.org; Thu, 19 Aug 2021 05:05:18 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzA-00007q-ME
 for qemu-riscv@nongnu.org; Thu, 19 Aug 2021 05:05:18 -0400
Received: by mail-pg1-x535.google.com with SMTP id k24so5276694pgh.8
 for <qemu-riscv@nongnu.org>; Thu, 19 Aug 2021 02:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mOWMh86oNcKl1xi7/Rwpyefm+loB+fvzToF4AezNhog=;
 b=jYQARrtO4UwpHCEA2v8A7IMDCK+2OJ9qsaJgFqU2iuqJjoL5ZBmRzlRDEdufzohgfk
 7QZgWetMq7wD769Vbzr9rLJiLnqOfSyGiy78XgP5hbzywTCXtCuqwb/Fy/Nk/iKFoakX
 zehQua90w20SDy5oLpkt5QD5psAU13+emB0tJPBJO5+7/nr3XNGhpJNZVLHbUmO0nnWS
 E+g9a91fUFcMrwShNNxi6XbiKeeyfq1McBVNJ3E28v5qf/SJOI9r7CFCyudecKBAZyTN
 EebXE77rdlrxINbddOqKYNgnIQason8DhRigO7SsZBGlhj5MiVCG0vOrtdp9COE5sy6P
 0rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mOWMh86oNcKl1xi7/Rwpyefm+loB+fvzToF4AezNhog=;
 b=gxLi4CR2kAuyqMHFhRYbP1/PGBubD6bzS2aobxDqNZbVDPTLwL0OewdEGdBqpsSLE3
 xMZFWk4mYLrR4e48TDlzIkseBPGBdCZUY9/NFA+4r+nOpEedCx21S6E6fYvXlzzvj01h
 Dg/2HbTG3G15L6tsknvvEB6vYVvc2dKs2vXUG8FC+E5+SPJ53lwaLeCbugEeZauJjN3y
 MjzU6dOluw24RG9gicQDyOeG+iQ/mjec0WNBGFYmvMZ+LtfPTpRL4vXlT/cCDMg8FEmh
 FIQFJXL8vLXGcFMS5F2y6B5HbBY5Diq2Hd9Ng/l3zgAG2C/fVfG1od+kO01+/RVSqopq
 KXpg==
X-Gm-Message-State: AOAM532T7lv6M+nLP4CZDb3GXrtFV0cErEIIzh73cfD8w3oxk6TcFZ5a
 boUJcWfnuI7gFxFgC1VOxAL8Rg==
X-Google-Smtp-Source: ABdhPJyzRs/1mH+WYCi0hoa8Oi8s1s0v+TJ9t4tpNuDdvVQm9QRgy26Y5Jxz7Ho/hW3U8nCDddbdgg==
X-Received: by 2002:a65:6a54:: with SMTP id o20mr13079111pgu.31.1629363915136; 
 Thu, 19 Aug 2021 02:05:15 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j13sm2944707pgp.29.2021.08.19.02.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:05:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 06/21] target/riscv: Remove gen_arith_div*
Date: Wed, 18 Aug 2021 23:04:47 -1000
Message-Id: <20210819090502.428068-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819090502.428068-1-richard.henderson@linaro.org>
References: <20210819090502.428068-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 09:05:18 -0000

Use ctx->w and the enhanced gen_arith function.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 42 -------------------------
 target/riscv/insn_trans/trans_rvm.c.inc | 16 +++++-----
 2 files changed, 8 insertions(+), 50 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d862d0d0dd..bc40b9c701 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -495,48 +495,6 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a, DisasExtend ext,
     return true;
 }
 
-static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
-                            void(*func)(TCGv, TCGv, TCGv))
-{
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-    tcg_gen_ext32s_tl(source1, source1);
-    tcg_gen_ext32s_tl(source2, source2);
-
-    (*func)(source1, source1, source2);
-
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
-}
-
-static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
-                            void(*func)(TCGv, TCGv, TCGv))
-{
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-    tcg_gen_ext32u_tl(source1, source1);
-    tcg_gen_ext32u_tl(source2, source2);
-
-    (*func)(source1, source1, source2);
-
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
-}
-
 static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
 {
     tcg_gen_deposit_tl(ret, arg1, arg2,
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 013b3f7009..3d93b24c25 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -99,30 +99,30 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_w(ctx, a, &gen_div);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_SIGN, gen_div);
 }
 
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_uw(ctx, a, &gen_divu);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_ZERO, gen_divu);
 }
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_w(ctx, a, &gen_rem);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_SIGN, gen_rem);
 }
 
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_uw(ctx, a, &gen_remu);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_ZERO, gen_remu);
 }
-- 
2.25.1


