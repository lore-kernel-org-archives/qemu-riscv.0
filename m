Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIG3A-0007CO-T4
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 15:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG38-00072F-6h
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:56:02 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2w-0003GX-CQ
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:56:01 -0400
Received: by mail-pl1-x62c.google.com with SMTP id j2so6401433pll.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 12:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pDZariy0iIfddULLdRqhpSRL42jFJPN9KfRe1+PxB8k=;
 b=oSh/Ety7DQvfewkH28eAuYRzCSK49m1cqT+qi/4/b/+NIEPNPVFCZTgl8aF3WCpxcY
 FFiO9d5xmPIL937Bka8uHqko5L1banTeLeeUS5EoP033Psa67/4YW94+LyzpXTgHLEvv
 e5rvOptLL1Z6N1Y8FNEgz/ZIQmIfTZJ6kYqzd1MiKYorbpO0ZA3ZNGKMbXSZWntIg7jJ
 b5AWBZuAHBG0k3/NoJqyak6VrbyT9WheRk4Y2rAwWtPslG/fYnnANNkHtXo62Fe9U9HW
 HtRQmFSBUil/BY71oBTQCNOtUBd3STxlN2xdQ7tDIYoHOVwoP9+8LwKG1L/kACWvJbuJ
 3dYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pDZariy0iIfddULLdRqhpSRL42jFJPN9KfRe1+PxB8k=;
 b=V9w1FMHQz1rLaaUYh1I81vXWJG6bC6tTvXoCkkv05Q/cAd/58jmH7rCJzCLxR93U8f
 BryAShAfwfD/nwKpuGMv1ZA00mCwS4QBoNZhl6oKCAhV+YjLnotukSPTL74XKO+XNO1W
 1XIk08hmSlIeLLdyP7J/xbBp4KPnfbur55onL6vurzQM7rUdqtxwekcrrUwrXSpBdTOF
 xdrqJrziWs4P8YVBxcB/ilZLYlIKNu7tL50Rj2DKQ8GRhIEhAnyjwY9go1+LEAs4dz2R
 hmJjnW1t5/ibb/zrInymlQqOMQN+z629wnYXxrELc4MNnGNsAYHYEYc8xU4adqoX1Ggi
 LTFA==
X-Gm-Message-State: AOAM532rE/KwqZGhhM2WskuRIQR0Tq0cghuXSkVNHqPjYOnGGLHE+rBQ
 MG3l1SR+jxbdx3Jb/7zlcHM53Q==
X-Google-Smtp-Source: ABdhPJzq6v9tba643ZIGfGPXguhZmoBWL2uEMF6JoDQkR9YAgs53Jv9c7jDZdxri2s1xDU/+X2U4HQ==
X-Received: by 2002:a17:90a:2c01:: with SMTP id
 m1mr257106pjd.134.1629748547495; 
 Mon, 23 Aug 2021 12:55:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	bin.meng@windriver.com,
	alistair.francis@wdc.com
Subject: [PATCH v5 24/24] target/riscv: Use {get,dest}_gpr for RVV
Date: Mon, 23 Aug 2021 12:55:29 -0700
Message-Id: <20210823195529.560295-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Mon, 23 Aug 2021 19:56:03 -0000

Remove gen_get_gpr, as the function becomes unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 13 ++---
 target/riscv/insn_trans/trans_rvv.c.inc | 74 +++++++------------------
 2 files changed, 26 insertions(+), 61 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e44254e878..e356fc6c46 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -232,11 +232,6 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
     g_assert_not_reached();
 }
 
-static void gen_get_gpr(DisasContext *ctx, TCGv t, int reg_num)
-{
-    tcg_gen_mov_tl(t, get_gpr(ctx, reg_num, EXT_NONE));
-}
-
 static TCGv dest_gpr(DisasContext *ctx, int reg_num)
 {
     if (reg_num == 0 || ctx->w) {
@@ -637,9 +632,11 @@ void riscv_translate_init(void)
 {
     int i;
 
-    /* cpu_gpr[0] is a placeholder for the zero register. Do not use it. */
-    /* Use the gen_set_gpr and gen_get_gpr helper functions when accessing */
-    /* registers, unless you specifically block reads/writes to reg 0 */
+    /*
+     * cpu_gpr[0] is a placeholder for the zero register. Do not use it.
+     * Use the gen_set_gpr and get_gpr helper functions when accessing regs,
+     * unless you specifically block reads/writes to reg 0.
+     */
     cpu_gpr[0] = NULL;
 
     for (i = 1; i < 32; i++) {
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index de580c493c..fa451938f1 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -27,27 +27,22 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
         return false;
     }
 
-    s2 = tcg_temp_new();
-    dst = tcg_temp_new();
+    s2 = get_gpr(ctx, a->rs2, EXT_ZERO);
+    dst = dest_gpr(ctx, a->rd);
 
     /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
     if (a->rs1 == 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
         s1 = tcg_constant_tl(RV_VLEN_MAX);
     } else {
-        s1 = tcg_temp_new();
-        gen_get_gpr(ctx, s1, a->rs1);
+        s1 = get_gpr(ctx, a->rs1, EXT_ZERO);
     }
-    gen_get_gpr(ctx, s2, a->rs2);
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
     gen_set_gpr(ctx, a->rd, dst);
+
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
     lookup_and_goto_ptr(ctx);
     ctx->base.is_jmp = DISAS_NORETURN;
-
-    tcg_temp_free(s1);
-    tcg_temp_free(s2);
-    tcg_temp_free(dst);
     return true;
 }
 
@@ -60,23 +55,20 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
     }
 
     s2 = tcg_constant_tl(a->zimm);
-    dst = tcg_temp_new();
+    dst = dest_gpr(ctx, a->rd);
 
     /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
     if (a->rs1 == 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
         s1 = tcg_constant_tl(RV_VLEN_MAX);
     } else {
-        s1 = tcg_temp_new();
-        gen_get_gpr(ctx, s1, a->rs1);
+        s1 = get_gpr(ctx, a->rs1, EXT_ZERO);
     }
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
     gen_set_gpr(ctx, a->rd, dst);
+
     gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
     ctx->base.is_jmp = DISAS_NORETURN;
-
-    tcg_temp_free(s1);
-    tcg_temp_free(dst);
     return true;
 }
 
@@ -173,7 +165,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
 
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
-    base = tcg_temp_new();
+    base = get_gpr(s, rs1, EXT_NONE);
 
     /*
      * As simd_desc supports at most 256 bytes, and in this implementation,
@@ -184,7 +176,6 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
      */
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
-    gen_get_gpr(s, base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
@@ -192,7 +183,6 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
 
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
-    tcg_temp_free(base);
     gen_set_label(over);
     return true;
 }
@@ -330,12 +320,10 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
 
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
-    base = tcg_temp_new();
-    stride = tcg_temp_new();
+    base = get_gpr(s, rs1, EXT_NONE);
+    stride = get_gpr(s, rs2, EXT_NONE);
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
-    gen_get_gpr(s, base, rs1);
-    gen_get_gpr(s, stride, rs2);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
@@ -343,8 +331,6 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
 
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
-    tcg_temp_free(base);
-    tcg_temp_free(stride);
     gen_set_label(over);
     return true;
 }
@@ -458,10 +444,9 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     index = tcg_temp_new_ptr();
-    base = tcg_temp_new();
+    base = get_gpr(s, rs1, EXT_NONE);
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
-    gen_get_gpr(s, base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(index, cpu_env, vreg_ofs(s, vs2));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -471,7 +456,6 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(index);
-    tcg_temp_free(base);
     gen_set_label(over);
     return true;
 }
@@ -589,10 +573,9 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
 
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
-    base = tcg_temp_new();
+    base = get_gpr(s, rs1, EXT_NONE);
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
-    gen_get_gpr(s, base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
@@ -600,7 +583,6 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
 
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
-    tcg_temp_free(base);
     gen_set_label(over);
     return true;
 }
@@ -665,10 +647,9 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     index = tcg_temp_new_ptr();
-    base = tcg_temp_new();
+    base = get_gpr(s, rs1, EXT_NONE);
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
-    gen_get_gpr(s, base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(index, cpu_env, vreg_ofs(s, vs2));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -678,7 +659,6 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(index);
-    tcg_temp_free(base);
     gen_set_label(over);
     return true;
 }
@@ -862,8 +842,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     src2 = tcg_temp_new_ptr();
-    src1 = tcg_temp_new();
-    gen_get_gpr(s, src1, rs1);
+    src1 = get_gpr(s, rs1, EXT_NONE);
 
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, vm);
@@ -879,7 +858,6 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
-    tcg_temp_free(src1);
     gen_set_label(over);
     return true;
 }
@@ -905,15 +883,12 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
 
     if (a->vm && s->vl_eq_vlmax) {
         TCGv_i64 src1 = tcg_temp_new_i64();
-        TCGv tmp = tcg_temp_new();
 
-        gen_get_gpr(s, tmp, a->rs1);
-        tcg_gen_ext_tl_i64(src1, tmp);
+        tcg_gen_ext_tl_i64(src1, get_gpr(s, a->rs1, EXT_SIGN));
         gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
                 src1, MAXSZ(s), MAXSZ(s));
 
         tcg_temp_free_i64(src1);
-        tcg_temp_free(tmp);
         return true;
     }
     return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
@@ -1398,16 +1373,13 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVecGen2sFn32 *gvec_fn,
 
     if (a->vm && s->vl_eq_vlmax) {
         TCGv_i32 src1 = tcg_temp_new_i32();
-        TCGv tmp = tcg_temp_new();
 
-        gen_get_gpr(s, tmp, a->rs1);
-        tcg_gen_trunc_tl_i32(src1, tmp);
+        tcg_gen_trunc_tl_i32(src1, get_gpr(s, a->rs1, EXT_NONE));
         tcg_gen_extract_i32(src1, src1, 0, s->sew + 3);
         gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
                 src1, MAXSZ(s), MAXSZ(s));
 
         tcg_temp_free_i32(src1);
-        tcg_temp_free(tmp);
         return true;
     }
     return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
@@ -1665,8 +1637,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
-        s1 = tcg_temp_new();
-        gen_get_gpr(s, s1, a->rs1);
+        s1 = get_gpr(s, a->rs1, EXT_SIGN);
 
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
@@ -1690,7 +1661,6 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
             tcg_temp_free_i64(s1_i64);
         }
 
-        tcg_temp_free(s1);
         gen_set_label(over);
         return true;
     }
@@ -2412,7 +2382,7 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
 
         mask = tcg_temp_new_ptr();
         src2 = tcg_temp_new_ptr();
-        dst = tcg_temp_new();
+        dst = dest_gpr(s, a->rd);
         desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
@@ -2423,7 +2393,6 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
 
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
-        tcg_temp_free(dst);
         return true;
     }
     return false;
@@ -2443,7 +2412,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
 
         mask = tcg_temp_new_ptr();
         src2 = tcg_temp_new_ptr();
-        dst = tcg_temp_new();
+        dst = dest_gpr(s, a->rd);
         desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
@@ -2454,7 +2423,6 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
 
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
-        tcg_temp_free(dst);
         return true;
     }
     return false;
@@ -2638,7 +2606,7 @@ static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
 static bool trans_vext_x_v(DisasContext *s, arg_r *a)
 {
     TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGv dest = tcg_temp_new();
+    TCGv dest = dest_gpr(s, a->rd);
 
     if (a->rs1 == 0) {
         /* Special case vmv.x.s rd, vs2. */
@@ -2648,10 +2616,10 @@ static bool trans_vext_x_v(DisasContext *s, arg_r *a)
         int vlmax = s->vlen >> (3 + s->sew);
         vec_element_loadx(s, tmp, a->rs2, cpu_gpr[a->rs1], vlmax);
     }
+
     tcg_gen_trunc_i64_tl(dest, tmp);
     gen_set_gpr(s, a->rd, dest);
 
-    tcg_temp_free(dest);
     tcg_temp_free_i64(tmp);
     return true;
 }
-- 
2.25.1


