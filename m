Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIG32-0006fw-48
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 15:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2x-0006P1-DM
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:51 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2n-00038U-I8
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:50 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso209047pjh.5
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 12:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fZAM2SGkj/Iqq4oVYHOzChREwzJhngSQybF7s9vf1Pg=;
 b=gYrRJG5COU5+g/km7SHi/7AGexA0vt4K1GHIO6sqzRFLeEaWzT5pCQCkfzokFIXWng
 j8DGHkJm7VSBa03aBsV05UJAIytnpzY2fHkW6o1QgtWMjAfQvuIxrqozxZtN0graz50o
 x6eR+UuoWBm6JlroV5V5hCc965ifPOhHnsyvcSE5MiaPLMSCuJP4X0dk1OjlLVsGSCaS
 1LeSGMiKCJB+knC2GaYnY9PEGKvCZj3AfXXx3wI8lIdW0+nRz6L6DJ36TobFeHA0SnMo
 OZ5MynnIKyMkhfFDAuItRFnfJJj9Y5YKYShSwJ4Chwv3rNKJmKO8VzlEwRtzaaYi6fRz
 rWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fZAM2SGkj/Iqq4oVYHOzChREwzJhngSQybF7s9vf1Pg=;
 b=ZxhdQ3c0tISDEcGFpHXE0279h2f+kwrmniRItWSOLJi+VmlTxKVMwfNzHArAq9ojhM
 YIaUaylQerByBCmzBbB2MeAZpWZONH9RuVv1NuzF02koBRoUT35vxCNz5rdxbP44iblL
 ey8b9SeJrl8LwpvayE3qvH7aPw32LiEfWnhs9eiHV/72gKd4fIqA0jjOnJtSdf/T3KoV
 6YKnt72Kw0GnD5kxtlO0IUuOQjf0XelAnyY+VrTgKChOVCBzj7O8OhIx815x1ST0GD+Z
 m7kTSi1wwFty5RWx56iep2AVUcpU8TwHDmtYjnWEMHQ6VQtwSCskIGorXgosWW8OS9dM
 swzw==
X-Gm-Message-State: AOAM530uVi8Afsj4ONnE/O+I0+aOD+8ZEcMRntSeQUGQPWBht+OXlAKf
 LP0tw7N/s9BEgDeko57ge5+eRQ==
X-Google-Smtp-Source: ABdhPJzEUeVVxDjsm3KUgkpXFikAy3dk3JRCsj8/tZnzTp8/g4ox6WDfUAuQMxzRydI8koBrLA6DNw==
X-Received: by 2002:a17:902:6bc7:b0:12d:aa67:695e with SMTP id
 m7-20020a1709026bc700b0012daa67695emr29850408plt.76.1629748540142; 
 Mon, 23 Aug 2021 12:55:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v5 12/24] target/riscv: Use DisasExtend in shift operations
Date: Mon, 23 Aug 2021 12:55:17 -0700
Message-Id: <20210823195529.560295-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 19:55:51 -0000

These operations are greatly simplified by ctx->w, which allows
us to fold gen_shiftw into gen_shift.  Split gen_shifti into
gen_shift_imm_{fn,tl} like we do for gen_arith_imm_{fn,tl}.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 110 +++++++++-----------
 target/riscv/insn_trans/trans_rvb.c.inc | 129 +++++++++++-------------
 target/riscv/insn_trans/trans_rvi.c.inc |  88 ++++------------
 3 files changed, 125 insertions(+), 202 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 785e9e58cc..e44254e878 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -99,6 +99,13 @@ static inline bool is_32bit(DisasContext *ctx)
 }
 #endif
 
+/* The word size for this operation. */
+static inline int oper_len(DisasContext *ctx)
+{
+    return ctx->w ? 32 : TARGET_LONG_BITS;
+}
+
+
 /*
  * RISC-V requires NaN-boxing of narrower width floating point values.
  * This applies when a 32-bit value is assigned to a 64-bit FP register.
@@ -393,88 +400,58 @@ static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
     return true;
 }
 
-static bool gen_shift(DisasContext *ctx, arg_r *a,
-                        void(*func)(TCGv, TCGv, TCGv))
+static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
+                             void (*func)(TCGv, TCGv, target_long))
 {
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
+    TCGv dest, src1;
+    int max_len = oper_len(ctx);
 
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
-    (*func)(source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
-}
-
-static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
-{
-    DisasContext *ctx = container_of(dcbase, DisasContext, base);
-    CPUState *cpu = ctx->cs;
-    CPURISCVState *env = cpu->env_ptr;
-
-    return cpu_ldl_code(env, pc);
-}
-
-static bool gen_shifti(DisasContext *ctx, arg_shift *a,
-                       void(*func)(TCGv, TCGv, TCGv))
-{
-    if (a->shamt >= TARGET_LONG_BITS) {
+    if (a->shamt >= max_len) {
         return false;
     }
 
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
+    dest = dest_gpr(ctx, a->rd);
+    src1 = get_gpr(ctx, a->rs1, ext);
 
-    gen_get_gpr(ctx, source1, a->rs1);
+    func(dest, src1, a->shamt);
 
-    tcg_gen_movi_tl(source2, a->shamt);
-    (*func)(source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
-static bool gen_shiftw(DisasContext *ctx, arg_r *a,
-                       void(*func)(TCGv, TCGv, TCGv))
+static bool gen_shift_imm_tl(DisasContext *ctx, arg_shift *a, DisasExtend ext,
+                             void (*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
+    TCGv dest, src1, src2;
+    int max_len = oper_len(ctx);
 
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
+    if (a->shamt >= max_len) {
+        return false;
+    }
 
-    tcg_gen_andi_tl(source2, source2, 31);
-    (*func)(source1, source1, source2);
-    tcg_gen_ext32s_tl(source1, source1);
+    dest = dest_gpr(ctx, a->rd);
+    src1 = get_gpr(ctx, a->rs1, ext);
+    src2 = tcg_constant_tl(a->shamt);
 
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    func(dest, src1, src2);
+
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
-static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
-                        void(*func)(TCGv, TCGv, TCGv))
+static bool gen_shift(DisasContext *ctx, arg_r *a, DisasExtend ext,
+                      void (*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv ext2 = tcg_temp_new();
 
-    gen_get_gpr(ctx, source1, a->rs1);
-    tcg_gen_movi_tl(source2, a->shamt);
+    tcg_gen_andi_tl(ext2, src2, oper_len(ctx) - 1);
+    func(dest, src1, ext2);
 
-    (*func)(source1, source1, source2);
-    tcg_gen_ext32s_tl(source1, source1);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    gen_set_gpr(ctx, a->rd, dest);
+    tcg_temp_free(ext2);
     return true;
 }
 
@@ -490,6 +467,15 @@ static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
     return true;
 }
 
+static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    CPUState *cpu = ctx->cs;
+    CPURISCVState *env = cpu->env_ptr;
+
+    return cpu_ldl_code(env, pc);
+}
+
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.c.inc"
 #include "insn_trans/trans_rvm.c.inc"
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index e255678fff..b97c3ca5da 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -160,13 +160,13 @@ static void gen_bset(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_bset(DisasContext *ctx, arg_bset *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_bset);
+    return gen_shift(ctx, a, EXT_NONE, gen_bset);
 }
 
 static bool trans_bseti(DisasContext *ctx, arg_bseti *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_bset);
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bset);
 }
 
 static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
@@ -182,13 +182,13 @@ static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_bclr);
+    return gen_shift(ctx, a, EXT_NONE, gen_bclr);
 }
 
 static bool trans_bclri(DisasContext *ctx, arg_bclri *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_bclr);
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bclr);
 }
 
 static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
@@ -204,13 +204,13 @@ static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_binv(DisasContext *ctx, arg_binv *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_binv);
+    return gen_shift(ctx, a, EXT_NONE, gen_binv);
 }
 
 static bool trans_binvi(DisasContext *ctx, arg_binvi *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_binv);
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_binv);
 }
 
 static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
@@ -222,13 +222,13 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_bext(DisasContext *ctx, arg_bext *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_bext);
+    return gen_shift(ctx, a, EXT_NONE, gen_bext);
 }
 
 static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_bext);
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
 }
 
 static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
@@ -241,13 +241,13 @@ static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_slo(DisasContext *ctx, arg_slo *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_slo);
+    return gen_shift(ctx, a, EXT_NONE, gen_slo);
 }
 
 static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_slo);
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_slo);
 }
 
 static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
@@ -260,82 +260,65 @@ static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_sro(DisasContext *ctx, arg_sro *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_sro);
+    return gen_shift(ctx, a, EXT_ZERO, gen_sro);
 }
 
 static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_sro);
+    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_sro);
 }
 
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, tcg_gen_rotr_tl);
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotr_tl);
 }
 
 static bool trans_rori(DisasContext *ctx, arg_rori *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, tcg_gen_rotr_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_rotri_tl);
 }
 
 static bool trans_rol(DisasContext *ctx, arg_rol *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, tcg_gen_rotl_tl);
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
 }
 
 static bool trans_grev(DisasContext *ctx, arg_grev *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_helper_grev);
+    return gen_shift(ctx, a, EXT_NONE, gen_helper_grev);
 }
 
-static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
+static void gen_grevi(TCGv dest, TCGv src, target_long shamt)
 {
-    TCGv source1 = tcg_temp_new();
-    TCGv source2;
-
-    gen_get_gpr(ctx, source1, a->rs1);
-
-    if (a->shamt == (TARGET_LONG_BITS - 8)) {
+    if (shamt == TARGET_LONG_BITS - 8) {
         /* rev8, byte swaps */
-        tcg_gen_bswap_tl(source1, source1);
+        tcg_gen_bswap_tl(dest, src);
     } else {
-        source2 = tcg_temp_new();
-        tcg_gen_movi_tl(source2, a->shamt);
-        gen_helper_grev(source1, source1, source2);
-        tcg_temp_free(source2);
+        gen_helper_grev(dest, src, tcg_constant_tl(shamt));
     }
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    return true;
 }
 
 static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
 {
     REQUIRE_EXT(ctx, RVB);
-
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    return gen_grevi(ctx, a);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_grevi);
 }
 
 static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_helper_gorc);
+    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
 }
 
 static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_helper_gorc);
+    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
 }
 
 #define GEN_SHADD(SHAMT)                                       \
@@ -433,77 +416,88 @@ static bool trans_bsetw(DisasContext *ctx, arg_bsetw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_bset);
+    ctx->w = true;
+    return gen_shift(ctx, a, EXT_NONE, gen_bset);
 }
 
 static bool trans_bsetiw(DisasContext *ctx, arg_bsetiw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_bset);
+    ctx->w = true;
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bset);
 }
 
 static bool trans_bclrw(DisasContext *ctx, arg_bclrw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_bclr);
+    ctx->w = true;
+    return gen_shift(ctx, a, EXT_NONE, gen_bclr);
 }
 
 static bool trans_bclriw(DisasContext *ctx, arg_bclriw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_bclr);
+    ctx->w = true;
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bclr);
 }
 
 static bool trans_binvw(DisasContext *ctx, arg_binvw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_binv);
+    ctx->w = true;
+    return gen_shift(ctx, a, EXT_NONE, gen_binv);
 }
 
 static bool trans_binviw(DisasContext *ctx, arg_binviw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_binv);
+    ctx->w = true;
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_binv);
 }
 
 static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_bext);
+    ctx->w = true;
+    return gen_shift(ctx, a, EXT_NONE, gen_bext);
 }
 
 static bool trans_slow(DisasContext *ctx, arg_slow *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_slo);
+    ctx->w = true;
+    return gen_shift(ctx, a, EXT_NONE, gen_slo);
 }
 
 static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_slo);
+    ctx->w = true;
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_slo);
 }
 
 static bool trans_srow(DisasContext *ctx, arg_srow *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_sro);
+    ctx->w = true;
+    return gen_shift(ctx, a, EXT_ZERO, gen_sro);
 }
 
 static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_sro);
+    ctx->w = true;
+    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_sro);
 }
 
 static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
@@ -528,14 +522,16 @@ static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_rorw);
+    ctx->w = true;
+    return gen_shift(ctx, a, EXT_NONE, gen_rorw);
 }
 
 static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_rorw);
+    ctx->w = true;
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_rorw);
 }
 
 static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
@@ -560,47 +556,40 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_rolw);
-}
-
-static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    gen_helper_grev(ret, arg1, arg2);
+    ctx->w = true;
+    return gen_shift(ctx, a, EXT_NONE, gen_rolw);
 }
 
 static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_grevw);
+    ctx->w = true;
+    return gen_shift(ctx, a, EXT_ZERO, gen_helper_grev);
 }
 
 static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_grevw);
-}
-
-static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    gen_helper_gorcw(ret, arg1, arg2);
+    ctx->w = true;
+    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_grev);
 }
 
 static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_gorcw);
+    ctx->w = true;
+    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
 }
 
 static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_gorcw);
+    ctx->w = true;
+    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
 }
 
 #define GEN_SHADD_UW(SHAMT)                                       \
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index bd80476852..e4726e618c 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -270,17 +270,17 @@ static bool trans_andi(DisasContext *ctx, arg_andi *a)
 
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
-    return gen_shifti(ctx, a, tcg_gen_shl_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
 }
 
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
-    return gen_shifti(ctx, a, tcg_gen_shr_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_ZERO, tcg_gen_shri_tl);
 }
 
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
-    return gen_shifti(ctx, a, tcg_gen_sar_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_SIGN, tcg_gen_sari_tl);
 }
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
@@ -295,7 +295,7 @@ static bool trans_sub(DisasContext *ctx, arg_sub *a)
 
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
 {
-    return gen_shift(ctx, a, &tcg_gen_shl_tl);
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl);
 }
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
@@ -315,12 +315,12 @@ static bool trans_xor(DisasContext *ctx, arg_xor *a)
 
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
 {
-    return gen_shift(ctx, a, &tcg_gen_shr_tl);
+    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
 }
 
 static bool trans_sra(DisasContext *ctx, arg_sra *a)
 {
-    return gen_shift(ctx, a, &tcg_gen_sar_tl);
+    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
 }
 
 static bool trans_or(DisasContext *ctx, arg_or *a)
@@ -343,31 +343,22 @@ static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_shiftiw(ctx, a, tcg_gen_shl_tl);
+    ctx->w = true;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
 }
 
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv t = tcg_temp_new();
-    gen_get_gpr(ctx, t, a->rs1);
-    tcg_gen_extract_tl(t, t, a->shamt, 32 - a->shamt);
-    /* sign-extend for W instructions */
-    tcg_gen_ext32s_tl(t, t);
-    gen_set_gpr(ctx, a->rd, t);
-    tcg_temp_free(t);
-    return true;
+    ctx->w = true;
+    return gen_shift_imm_fn(ctx, a, EXT_ZERO, tcg_gen_shri_tl);
 }
 
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv t = tcg_temp_new();
-    gen_get_gpr(ctx, t, a->rs1);
-    tcg_gen_sextract_tl(t, t, a->shamt, 32 - a->shamt);
-    gen_set_gpr(ctx, a->rd, t);
-    tcg_temp_free(t);
-    return true;
+    ctx->w = true;
+    return gen_shift_imm_fn(ctx, a, EXT_SIGN, tcg_gen_sari_tl);
 }
 
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
@@ -387,65 +378,22 @@ static bool trans_subw(DisasContext *ctx, arg_subw *a)
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    tcg_gen_andi_tl(source2, source2, 0x1F);
-    tcg_gen_shl_tl(source1, source1, source2);
-
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    ctx->w = true;
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl);
 }
 
 static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    /* clear upper 32 */
-    tcg_gen_ext32u_tl(source1, source1);
-    tcg_gen_andi_tl(source2, source2, 0x1F);
-    tcg_gen_shr_tl(source1, source1, source2);
-
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    ctx->w = true;
+    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
 }
 
 static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    /*
-     * first, trick to get it to act like working on 32 bits (get rid of
-     * upper 32, sign extend to fill space)
-     */
-    tcg_gen_ext32s_tl(source1, source1);
-    tcg_gen_andi_tl(source2, source2, 0x1F);
-    tcg_gen_sar_tl(source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-
-    return true;
+    ctx->w = true;
+    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
 }
 
 static bool trans_fence(DisasContext *ctx, arg_fence *a)
-- 
2.25.1


