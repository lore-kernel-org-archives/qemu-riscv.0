Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEUY-0000Ch-2R
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUD-0008SF-PL; Wed, 06 Oct 2021 17:30:03 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEU8-000876-Pk; Wed, 06 Oct 2021 17:30:01 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 477B341E5F;
 Wed,  6 Oct 2021 23:29:35 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 323BB60067;
 Wed,  6 Oct 2021 23:29:35 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id D560614005C;
 Wed,  6 Oct 2021 23:29:34 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 15/27] target/riscv: 128-bit support for instructions using
 gen_shift
Date: Wed,  6 Oct 2021 23:28:21 +0200
Message-Id: <20211006212833.108706-16-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Wed, 06 Oct 2021 21:30:07 -0000

Support for the base shift instructions working on 128-bit registers.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 224 ++++++++++++++++++++++--
 1 file changed, 209 insertions(+), 15 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 814aa5f1b7..eca9a76ad5 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -421,22 +421,61 @@ static bool trans_andi(DisasContext *ctx, arg_andi *a)
     return gen_logic_imm_fn(ctx, a, EXT_NONE, tcg_gen_andi_tl);
 }
 
+static void gen_slli_i128(TCGv retl, TCGv reth,
+                          TCGv src1l, TCGv src1h,
+                          target_long shamt)
+{
+    if (shamt >= 64) {
+        tcg_gen_shli_tl(reth, src1l, shamt - 64);
+        tcg_gen_movi_tl(retl, 0);
+    } else {
+        tcg_gen_extract2_tl(reth, src1l, src1h, 64 - shamt);
+        tcg_gen_shli_tl(retl, src1l, shamt);
+    }
+}
+
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
     return gen_shift_imm_fn(ctx, a, EXT_NONE,
-                            tcg_gen_shli_tl, tcg_gen_shli_tl, NULL);
+                            tcg_gen_shli_tl, tcg_gen_shli_tl, gen_slli_i128);
+}
+
+static void gen_srli_i128(TCGv retl, TCGv reth,
+                          TCGv src1l, TCGv src1h,
+                          target_long shamt)
+{
+    if (shamt >= 64) {
+        tcg_gen_shri_tl(retl, src1h, shamt - 64);
+        tcg_gen_movi_tl(reth, 0);
+    } else {
+        tcg_gen_extract2_tl(retl, src1l, src1h, shamt);
+        tcg_gen_shri_tl(reth, src1h, shamt);
+    }
 }
 
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
     return gen_shift_imm_fn(ctx, a, EXT_ZERO,
-                            tcg_gen_shri_tl, tcg_gen_shri_tl, NULL);
+                            tcg_gen_shri_tl, tcg_gen_shri_tl, gen_srli_i128);
+}
+
+static void gen_srai_i128(TCGv retl, TCGv reth,
+                          TCGv src1l, TCGv src1h,
+                          target_long shamt)
+{
+    if (shamt >= 64) {
+        tcg_gen_sari_tl(retl, src1h, shamt - 64);
+        tcg_gen_sari_tl(reth, src1h, 63);
+    } else {
+        tcg_gen_extract2_tl(retl, src1l, src1h, shamt);
+        tcg_gen_sari_tl(reth, src1h, shamt);
+    }
 }
 
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
     return gen_shift_imm_fn(ctx, a, EXT_SIGN,
-                            tcg_gen_sari_tl, tcg_gen_sari_tl, NULL);
+                            tcg_gen_sari_tl, tcg_gen_sari_tl, gen_srai_i128);
 }
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
@@ -451,10 +490,76 @@ static bool trans_sub(DisasContext *ctx, arg_sub *a)
                      tcg_gen_sub_tl, tcg_gen_sub_tl, tcg_gen_sub2_tl);
 }
 
+enum M128_DIR {
+    M128_LEFT,
+    M128_RIGHT,
+    M128_RIGHT_ARITH
+};
+/* 127 <= arg2 <= 0 */
+static void gen_shift_mod128(TCGv ret, TCGv arg1, TCGv arg2, enum M128_DIR dir)
+{
+    TCGv tmp1 = tcg_temp_new(),
+         tmp2 = tcg_temp_new(),
+         sgn = tcg_temp_new(),
+         cnst_zero = tcg_constant_tl(0);
+
+    tcg_gen_setcondi_tl(TCG_COND_GEU, tmp1, arg2, 64);
+
+    tcg_gen_andi_tl(tmp2, arg2, 0x3f);
+    switch (dir) {
+    case M128_LEFT:
+        tcg_gen_shl_tl(tmp2, arg1, tmp2);
+        break;
+    case M128_RIGHT:
+        tcg_gen_shr_tl(tmp2, arg1, tmp2);
+        break;
+    case M128_RIGHT_ARITH:
+        tcg_gen_sar_tl(tmp2, arg1, tmp2);
+        break;
+    }
+
+    if (dir == M128_RIGHT_ARITH) {
+        tcg_gen_sari_tl(sgn, arg1, 63);
+        tcg_gen_movcond_tl(TCG_COND_NE, ret, tmp1, cnst_zero, sgn, tmp2);
+    } else {
+        tcg_gen_movcond_tl(TCG_COND_NE, ret, tmp1, cnst_zero, cnst_zero, tmp2);
+    }
+
+    tcg_temp_free(tmp1);
+    tcg_temp_free(tmp2);
+    tcg_temp_free(sgn);
+    return;
+}
+
+static void gen_sll_i128(TCGv destl, TCGv desth,
+                         TCGv src1l, TCGv src1h, TCGv shamt)
+{
+        TCGv tmp = tcg_temp_new();
+        /*
+         * From Hacker's Delight 2.17:
+         *  y1 = x1 << n | x0 u>> (64 - n) | x0 << (n - 64)
+         */
+        gen_shift_mod128(desth, src1h, shamt, M128_LEFT);
+
+        tcg_gen_movi_tl(tmp, 64);
+        tcg_gen_sub_tl(tmp, tmp, shamt);
+        gen_shift_mod128(tmp, src1l, tmp, M128_RIGHT);
+        tcg_gen_or_tl(desth, desth, tmp);
+
+        tcg_gen_subi_tl(tmp, shamt, 64);
+        gen_shift_mod128(tmp, src1l, tmp, M128_LEFT);
+        tcg_gen_or_tl(desth, desth, tmp);
+
+        /* From Hacker's Delight 2.17: y0 = x0 << n */
+        gen_shift_mod128(destl, src1l, shamt, M128_LEFT);
+
+        tcg_temp_free(tmp);
+}
+
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
 {
     return gen_shift(ctx, a, EXT_NONE,
-                     tcg_gen_shl_tl, tcg_gen_shl_tl, NULL);
+                     tcg_gen_shl_tl, tcg_gen_shl_tl, gen_sll_i128);
 }
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
@@ -469,16 +574,69 @@ static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
                      gen_sltu_tl, gen_sltu_tl, gen_sltu_i128);
 }
 
+static void gen_srl_i128(TCGv destl, TCGv desth,
+                         TCGv src1l, TCGv src1h, TCGv shamt)
+{
+    TCGv tmp = tcg_temp_new();
+    /*
+     * From Hacker's Delight 2.17:
+     * y0 = x0 u>> n | x1 << (64 - n) | x1 u>> (n - 64)
+     */
+    gen_shift_mod128(destl, src1l, shamt, M128_RIGHT);
+
+    tcg_gen_movi_tl(tmp, 64);
+    tcg_gen_sub_tl(tmp, tmp, shamt);
+    gen_shift_mod128(tmp, src1h, tmp, M128_LEFT);
+    tcg_gen_or_tl(destl, destl, tmp);
+
+    tcg_gen_subi_tl(tmp, shamt, 64);
+    gen_shift_mod128(tmp, src1h, tmp, M128_RIGHT);
+    tcg_gen_or_tl(destl, destl, tmp);
+
+    /* From Hacker's Delight 2.17 : y1 = x1 u>> n */
+    gen_shift_mod128(desth, src1h, shamt, M128_RIGHT);
+
+    tcg_temp_free(tmp);
+}
+
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
 {
     return gen_shift(ctx, a, EXT_ZERO,
-                     tcg_gen_shr_tl, tcg_gen_shr_tl, NULL);
+                     tcg_gen_shr_tl, tcg_gen_shr_tl, gen_srl_i128);
+}
+
+static void gen_sra_i128(TCGv destl, TCGv desth,
+                         TCGv src1l, TCGv src1h, TCGv shamt)
+{
+    TCGv tmp1 = tcg_temp_new(),
+         tmp2 = tcg_temp_new(),
+         const64 = tcg_constant_tl(64);
+
+    /* Compute y0 value if n < 64: x0 u>> n | x1 << (64 - n) */
+    gen_shift_mod128(tmp1, src1l, shamt, M128_RIGHT);
+    tcg_gen_movi_tl(tmp2, 64);
+    tcg_gen_sub_tl(tmp2, tmp2, shamt);
+    gen_shift_mod128(tmp2, src1h, tmp2, M128_LEFT);
+    tcg_gen_or_tl(tmp1, tmp1, tmp2);
+
+    /* Compute y0 value if n >= 64: x1 s>> (n - 64) */
+    tcg_gen_subi_tl(tmp2, shamt, 64);
+    gen_shift_mod128(tmp2, src1h, tmp2, M128_RIGHT_ARITH);
+
+    /* Conditionally move one value or the other */
+    tcg_gen_movcond_tl(TCG_COND_LT, destl, shamt, const64, tmp1, tmp2);
+
+    /* y1 = x1 s>> n */
+    gen_shift_mod128(desth, src1h, shamt, M128_RIGHT_ARITH);
+
+    tcg_temp_free(tmp1);
+    tcg_temp_free(tmp2);
 }
 
 static bool trans_sra(DisasContext *ctx, arg_sra *a)
 {
     return gen_shift(ctx, a, EXT_SIGN,
-                     tcg_gen_sar_tl, tcg_gen_sar_tl, NULL);
+                     tcg_gen_sar_tl, tcg_gen_sar_tl, gen_sra_i128);
 }
 
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
@@ -510,12 +668,18 @@ static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
                             NULL, tcg_gen_addi_tl, gen_addiw_i128);
 }
 
+static void gen_slliwd_i128(TCGv retl, TCGv reth,
+                           TCGv srcl, TCGv srch, target_long shamt)
+{
+    tcg_gen_shli_tl(retl, srcl, shamt);
+}
+
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
     REQUIRE_64_OR_128BIT(ctx);
     ctx->w = true;
     return gen_shift_imm_fn(ctx, a, EXT_NONE,
-                            NULL, tcg_gen_shli_tl, NULL);
+                            NULL, tcg_gen_shli_tl, gen_slliwd_i128);
 }
 
 static void gen_srliw_tl(TCGv dst, TCGv src, target_long shamt)
@@ -523,12 +687,18 @@ static void gen_srliw_tl(TCGv dst, TCGv src, target_long shamt)
     tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
 }
 
+static void gen_srliw_i128(TCGv retl, TCGv reth,
+                           TCGv srcl, TCGv srch, target_long shamt)
+{
+    gen_srliw_tl(retl, srcl, shamt);
+}
+
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
     REQUIRE_64_OR_128BIT(ctx);
     ctx->w = true;
     return gen_shift_imm_fn(ctx, a, EXT_NONE,
-                            NULL, gen_srliw_tl, NULL);
+                            NULL, gen_srliw_tl, gen_srliw_i128);
 }
 
 static void gen_sraiw_tl(TCGv dst, TCGv src, target_long shamt)
@@ -536,12 +706,18 @@ static void gen_sraiw_tl(TCGv dst, TCGv src, target_long shamt)
     tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
 }
 
+static void gen_sraiw_i128(TCGv retl, TCGv reth,
+                            TCGv srcl, TCGv srch, target_long shamt)
+{
+    gen_sraiw_tl(retl, srcl, shamt);
+}
+
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
     REQUIRE_64_OR_128BIT(ctx);
     ctx->w = true;
     return gen_shift_imm_fn(ctx, a, EXT_NONE,
-                            NULL, gen_sraiw_tl, NULL);
+                            NULL, gen_sraiw_tl, gen_sraiw_i128);
 }
 
 static void gen_addw_i128(TCGv retl, TCGv reth,
@@ -574,28 +750,46 @@ static bool trans_subw(DisasContext *ctx, arg_subw *a)
                      NULL, tcg_gen_sub_tl, gen_subw_i128);
 }
 
+static void gen_sllwd_i128(TCGv destl, TCGv desth,
+                           TCGv src1l, TCGv src1h, TCGv shamt)
+{
+    tcg_gen_shl_tl(destl, src1l, shamt);
+}
+
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->w = true;
     return gen_shift(ctx, a, EXT_NONE,
-                     NULL, tcg_gen_shl_tl, NULL);
+                     NULL, tcg_gen_shl_tl, gen_sllwd_i128);
+}
+
+static void gen_srlwd_i128(TCGv destl, TCGv desth,
+                           TCGv src1l, TCGv src1h, TCGv shamt)
+{
+    tcg_gen_shr_tl(destl, src1l, shamt);
 }
 
 static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->w = true;
     return gen_shift(ctx, a, EXT_ZERO,
-                     NULL, tcg_gen_shr_tl, NULL);
+                     NULL, tcg_gen_shr_tl, gen_srlwd_i128);
+}
+
+static void gen_srawd_i128(TCGv destl, TCGv desth,
+                           TCGv src1l, TCGv src1h, TCGv shamt)
+{
+    tcg_gen_sar_tl(destl, src1l, shamt);
 }
 
 static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->w = true;
     return gen_shift(ctx, a, EXT_SIGN,
-                     NULL, tcg_gen_sar_tl, NULL);
+                     NULL, tcg_gen_sar_tl, gen_srawd_i128);
 }
 
 static bool trans_fence(DisasContext *ctx, arg_fence *a)
-- 
2.33.0


