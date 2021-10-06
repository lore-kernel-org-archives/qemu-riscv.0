Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEUZ-0000HI-Ow
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUB-0008Ri-TP; Wed, 06 Oct 2021 17:30:03 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEU7-00086Z-LQ; Wed, 06 Oct 2021 17:29:59 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 0037541E3E;
 Wed,  6 Oct 2021 23:29:33 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id DDEF360067;
 Wed,  6 Oct 2021 23:29:33 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 9CB5114005C;
 Wed,  6 Oct 2021 23:29:33 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 14/27] target/riscv: 128-bit support for instructions using
 gen_arith/gen_logic
Date: Wed,  6 Oct 2021 23:28:20 +0200
Message-Id: <20211006212833.108706-15-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 06 Oct 2021 21:30:10 -0000

The RISCV ISA is such that the arithmetic and logic instructions have the
same opcode, irrelevant of the base register size.
So, for all arithmetic and logic insns existing for the 3 register sizes,
excluding shifts, this patch adds the support for the 128-bit computations.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 223 +++++++++++++++++++++---
 1 file changed, 198 insertions(+), 25 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index ab85693364..814aa5f1b7 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -26,14 +26,17 @@ static bool trans_illegal(DisasContext *ctx, arg_empty *a)
 
 static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
 {
-     REQUIRE_64BIT(ctx);
-     return trans_illegal(ctx, a);
+    REQUIRE_64_OR_128BIT(ctx);
+    return trans_illegal(ctx, a);
 }
 
 static bool trans_lui(DisasContext *ctx, arg_lui *a)
 {
     if (a->rd != 0) {
         tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm);
+        if (is_128bit(ctx)) {
+            tcg_gen_movi_tl(cpu_gprh_check(ctx, a->rd), -(a->imm < 0));
+        }
     }
     return true;
 }
@@ -41,7 +44,19 @@ static bool trans_lui(DisasContext *ctx, arg_lui *a)
 static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
 {
     if (a->rd != 0) {
+        if (is_128bit(ctx)) {
+            /* TODO : when pc is 128 bits, use all its bits */
+            TCGv pc = tcg_constant_tl(ctx->base.pc_next),
+                 imm = tcg_constant_tl(a->imm),
+                 immh = tcg_constant_tl(-(a->imm < 0)),
+                 zero = tcg_constant_tl(0);
+            tcg_gen_add2_tl(cpu_gpr[a->rd], cpu_gprh_check(ctx, a->rd),
+                            pc, zero,
+                            imm, immh);
+            return true;
+        }
         tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm + ctx->base.pc_next);
+        return true;
     }
     return true;
 }
@@ -84,13 +99,121 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     return true;
 }
 
+/*
+ * Comparison predicates using bitwise logic taken from Hacker's Delight, 2.12
+ * We are just interested in the sign bit, so rl is not used but for subtracting
+ */
+static bool gen_setcond_i128(TCGv rl, TCGv rh,
+                             TCGv al, TCGv ah,
+                             TCGv bl, TCGv bh,
+                             TCGCond cond)
+{
+    switch (cond) {
+    case TCG_COND_EQ:
+        tcg_gen_setcond_tl(TCG_COND_EQ, rl, al, bl);
+        tcg_gen_setcond_tl(TCG_COND_EQ, rh, ah, bh);
+        tcg_gen_and_tl(rl, rl, rh);
+        break;
+
+    case TCG_COND_NE:
+        tcg_gen_setcond_tl(TCG_COND_NE, rl, al, bl);
+        tcg_gen_setcond_tl(TCG_COND_NE, rh, ah, bh);
+        tcg_gen_or_tl(rl, rl, rh);
+        break;
+
+    case TCG_COND_LT:
+    {
+        TCGv tmp1 = tcg_temp_new(),
+             tmp2 = tcg_temp_new();
+
+        tcg_gen_sub2_tl(rl, rh, al, ah, bl, bh);
+        tcg_gen_xor_tl(tmp1, rh, ah);
+        tcg_gen_xor_tl(tmp2, ah, bh);
+        tcg_gen_and_tl(tmp1, tmp1, tmp2);
+        tcg_gen_xor_tl(tmp1, rh, tmp1);
+        tcg_gen_shri_tl(rl, tmp1, 63);
+
+        tcg_temp_free(tmp1);
+        tcg_temp_free(tmp2);
+        break;
+    }
+
+    case TCG_COND_GE:
+        /* Invert result of TCG_COND_LT */
+        gen_setcond_i128(rl, rh, al, ah, bl, bh, TCG_COND_LT);
+        tcg_gen_xori_tl(rl, rl, 1);
+        break;
+
+    case TCG_COND_LTU:
+    {
+        TCGv tmp1 = tcg_temp_new(),
+             tmp2 = tcg_temp_new();
+
+        tcg_gen_sub2_tl(rl, rh, al, ah, bl, bh);
+        tcg_gen_eqv_tl(tmp1, ah, bh);
+        tcg_gen_and_tl(tmp1, tmp1, rh);
+        tcg_gen_andc_tl(tmp2, bh, ah);
+        tcg_gen_or_tl(tmp1, tmp1, tmp2);
+        tcg_gen_shri_tl(rl, tmp1, 63);
+
+        tcg_temp_free(tmp1);
+        tcg_temp_free(tmp2);
+        break;
+    }
+
+    case TCG_COND_GEU:
+        /* Invert result of TCG_COND_LTU */
+        gen_setcond_i128(rl, rh, al, ah, bl, bh, TCG_COND_LTU);
+        tcg_gen_xori_tl(rl, rl, 1);
+        break;
+
+    default:
+        return false;
+    }
+    tcg_gen_movi_tl(rh, 0);
+    return true;
+}
+
 static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 {
     TCGLabel *l = gen_new_label();
     TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
     TCGv src2 = get_gpr(ctx, a->rs2, EXT_SIGN);
 
-    tcg_gen_brcond_tl(cond, src1, src2, l);
+    if (is_128bit(ctx)) {
+        TCGv src1h = get_gprh(ctx, a->rs1),
+             src2h = get_gprh(ctx, a->rs2),
+             tmpl = tcg_temp_new(),
+             tmph = tcg_temp_new();
+
+        /*
+         * Do not use gen_setcond_i128 for EQ and NE as these conditions are
+         * often met and can be more efficiently implemented.
+         */
+        if (cond == TCG_COND_EQ || cond == TCG_COND_NE) {
+            /*
+             * bnez and beqz being used quite often too, lets optimize them,
+             * although QEMU's tcg optimizer handles these cases nicely
+             */
+            if (a->rs2 == 0) {
+                tcg_gen_or_tl(tmpl, src1, src1h);
+                tcg_gen_brcondi_tl(cond, tmpl, 0, l);
+            } else {
+                tcg_gen_xor_tl(tmpl, src1, src2);
+                tcg_gen_xor_tl(tmph, src1h, src2h);
+                tcg_gen_or_tl(tmpl, tmpl, tmph);
+                tcg_gen_brcondi_tl(cond, tmpl, 0, l);
+            }
+        } else {
+            gen_setcond_i128(tmpl, tmph, src1, src1h, src2, src2h, cond);
+            tcg_gen_brcondi_tl(TCG_COND_NE, tmpl, 0, l);
+        }
+
+        tcg_temp_free(tmph);
+        tcg_temp_free(tmpl);
+    } else {
+        tcg_gen_brcond_tl(cond, src1, src2, l);
+    }
     gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
 
     gen_set_label(l); /* branch taken */
@@ -235,10 +358,18 @@ static bool trans_sd(DisasContext *ctx, arg_sd *a)
     return gen_store(ctx, a, MO_TEQ);
 }
 
+static void gen_addi2_i128(TCGv retl, TCGv reth,
+                           TCGv srcl, TCGv srch, target_long imm)
+{
+    TCGv imml  = tcg_constant_tl(imm),
+         immh  = tcg_constant_tl(-(imm < 0));
+    tcg_gen_add2_tl(retl, reth, srcl, srch, imml, immh);
+}
+
 static bool trans_addi(DisasContext *ctx, arg_addi *a)
 {
     return gen_arith_imm_fn(ctx, a, EXT_NONE,
-                            tcg_gen_addi_tl, tcg_gen_addi_tl, NULL);
+                            tcg_gen_addi_tl, tcg_gen_addi_tl, gen_addi2_i128);
 }
 
 static void gen_slt_tl(TCGv ret, TCGv s1, TCGv s2)
@@ -246,21 +377,33 @@ static void gen_slt_tl(TCGv ret, TCGv s1, TCGv s2)
     tcg_gen_setcond_tl(TCG_COND_LT, ret, s1, s2);
 }
 
+static void gen_slt_i128(TCGv retl, TCGv reth,
+                         TCGv s1l, TCGv s1h, TCGv s2l, TCGv s2h)
+{
+    gen_setcond_i128(retl, reth, s1l, s1h, s2l, s2h, TCG_COND_LT);
+}
+
 static void gen_sltu_tl(TCGv ret, TCGv s1, TCGv s2)
 {
     tcg_gen_setcond_tl(TCG_COND_LTU, ret, s1, s2);
 }
 
+static void gen_sltu_i128(TCGv retl, TCGv reth,
+                         TCGv s1l, TCGv s1h, TCGv s2l, TCGv s2h)
+{
+    gen_setcond_i128(retl, reth, s1l, s1h, s2l, s2h, TCG_COND_LTU);
+}
+
 static bool trans_slti(DisasContext *ctx, arg_slti *a)
 {
     return gen_arith_imm_tl(ctx, a, EXT_SIGN,
-                            gen_slt_lt, gen_slt_lt, NULL);
+                            gen_slt_tl, gen_slt_tl, gen_slt_i128);
 }
 
 static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 {
     return gen_arith_imm_tl(ctx, a, EXT_SIGN,
-                            gen_sltu_lt, gen_sltu_lt, NULL);
+                            gen_sltu_tl, gen_sltu_tl, gen_sltu_i128);
 }
 
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
@@ -299,13 +442,13 @@ static bool trans_srai(DisasContext *ctx, arg_srai *a)
 static bool trans_add(DisasContext *ctx, arg_add *a)
 {
     return gen_arith(ctx, a, EXT_NONE,
-                     tcg_gen_add_tl, tcg_gen_add_tl, NULL);
+                     tcg_gen_add_tl, tcg_gen_add_tl, tcg_gen_add2_tl);
 }
 
 static bool trans_sub(DisasContext *ctx, arg_sub *a)
 {
     return gen_arith(ctx, a, EXT_NONE,
-                     tcg_gen_sub_tl, tcg_gen_sub_tl, NULL);
+                     tcg_gen_sub_tl, tcg_gen_sub_tl, tcg_gen_sub2_tl);
 }
 
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
@@ -316,22 +459,26 @@ static bool trans_sll(DisasContext *ctx, arg_sll *a)
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
 {
-    return gen_arith(ctx, a, EXT_SIGN, gen_slt_lt, gen_slt_lt, NULL);
+    return gen_arith(ctx, a, EXT_SIGN,
+                     gen_slt_tl, gen_slt_tl, gen_slt_i128);
 }
 
 static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 {
-    return gen_arith(ctx, a, EXT_SIGN, gen_sltu_lt, gen_sltu_lt, NULL);
+    return gen_arith(ctx, a, EXT_SIGN,
+                     gen_sltu_tl, gen_sltu_tl, gen_sltu_i128);
 }
 
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
 {
-    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl, tcg_gen_shr_tl, NULL);
+    return gen_shift(ctx, a, EXT_ZERO,
+                     tcg_gen_shr_tl, tcg_gen_shr_tl, NULL);
 }
 
 static bool trans_sra(DisasContext *ctx, arg_sra *a)
 {
-    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, tcg_gen_sar_tl, NULL);
+    return gen_shift(ctx, a, EXT_SIGN,
+                     tcg_gen_sar_tl, tcg_gen_sar_tl, NULL);
 }
 
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
@@ -349,18 +496,26 @@ static bool trans_and(DisasContext *ctx, arg_and *a)
     return gen_logic(ctx, a, EXT_NONE, tcg_gen_and_tl);
 }
 
+static void gen_addiw_i128(TCGv retl, TCGv reth,
+                           TCGv srcl, TCGv srch, target_long imm)
+{
+        tcg_gen_addi_tl(retl, srcl, imm);
+}
+
 static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->w = true;
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, NULL, tcg_gen_addi_tl, NULL);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE,
+                            NULL, tcg_gen_addi_tl, gen_addiw_i128);
 }
 
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->w = true;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, NULL, tcg_gen_shli_tl, NULL);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE,
+                            NULL, tcg_gen_shli_tl, NULL);
 }
 
 static void gen_srliw_tl(TCGv dst, TCGv src, target_long shamt)
@@ -370,9 +525,10 @@ static void gen_srliw_tl(TCGv dst, TCGv src, target_long shamt)
 
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->w = true;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, NULL, gen_srliw_tl, NULL);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE,
+                            NULL, gen_srliw_tl, NULL);
 }
 
 static void gen_sraiw_tl(TCGv dst, TCGv src, target_long shamt)
@@ -382,23 +538,40 @@ static void gen_sraiw_tl(TCGv dst, TCGv src, target_long shamt)
 
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->w = true;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, NULL, gen_sraiw_tl, NULL);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE,
+                            NULL, gen_sraiw_tl, NULL);
+}
+
+static void gen_addw_i128(TCGv retl, TCGv reth,
+                          TCGv src1l, TCGv src1h,
+                          TCGv src2l, TCGv src2h)
+{
+    tcg_gen_add_tl(retl, src1l, src2l);
 }
 
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->w = true;
-    return gen_arith(ctx, a, EXT_NONE, NULL, tcg_gen_add_tl, NULL);
+    return gen_arith(ctx, a, EXT_NONE,
+                     NULL, tcg_gen_add_tl, gen_addw_i128);
+}
+
+static void gen_subw_i128(TCGv retl, TCGv reth,
+                          TCGv src1l, TCGv src1h,
+                          TCGv src2l, TCGv src2h)
+{
+    tcg_gen_sub_tl(retl, src1l, src2l);
 }
 
 static bool trans_subw(DisasContext *ctx, arg_subw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->w = true;
-    return gen_arith(ctx, a, EXT_NONE, NULL, tcg_gen_sub_tl, NULL);
+    return gen_arith(ctx, a, EXT_NONE,
+                     NULL, tcg_gen_sub_tl, gen_subw_i128);
 }
 
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
@@ -406,7 +579,7 @@ static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
     REQUIRE_64BIT(ctx);
     ctx->w = true;
     return gen_shift(ctx, a, EXT_NONE,
-                     tcg_gen_shl_tl, tcg_gen_shl_tl, NULL);
+                     NULL, tcg_gen_shl_tl, NULL);
 }
 
 static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
-- 
2.33.0


