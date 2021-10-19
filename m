Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mclk1-0001Y7-4e
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 05:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljw-0001EP-23; Tue, 19 Oct 2021 05:49:00 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:54896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljr-0006cQ-MQ; Tue, 19 Oct 2021 05:48:59 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 0569E41F91;
 Tue, 19 Oct 2021 11:48:34 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id E2034601D5;
 Tue, 19 Oct 2021 11:48:33 +0200 (CEST)
Received: from palmier.u-ga.fr (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id B9B8914005A;
 Tue, 19 Oct 2021 11:48:28 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v3 13/21] target/riscv: support for 128-bit shift instructions
Date: Tue, 19 Oct 2021 11:48:04 +0200
Message-Id: <20211019094812.614056-14-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Tue, 19 Oct 2021 09:49:00 -0000

Handling shifts for 32, 64 and 128 operation length for RV128, following the
general framework for handling various olens proposed by Richard.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/insn32.decode              |  10 +
 target/riscv/translate.c                |  96 ++++++++--
 target/riscv/insn_trans/trans_rvb.c.inc |  22 +--
 target/riscv/insn_trans/trans_rvi.c.inc | 238 ++++++++++++++++++++++--
 4 files changed, 321 insertions(+), 45 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1e7ddecc22..c642f6d09d 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -22,6 +22,7 @@
 %rs1       15:5
 %rd        7:5
 %sh5       20:5
+%sh6       20:6
 
 %sh7    20:7
 %csr    20:12
@@ -92,6 +93,9 @@
 # Formats 64:
 @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
 
+# Formats 128:
+@sh6       ...... ...... ..... ... ..... ....... &shift shamt=%sh6 %rs1 %rd
+
 # *** Privileged Instructions ***
 ecall       000000000000     00000 000 00000 1110011
 ebreak      000000000001     00000 000 00000 1110011
@@ -167,6 +171,12 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
 ldu      ............   ..... 111 ..... 0000011 @i
 lq       ............   ..... 010 ..... 0001111 @i
 sq       ............   ..... 100 ..... 0100011 @s
+sllid    000000 ......  ..... 001 ..... 1011011 @sh6
+srlid    000000 ......  ..... 101 ..... 1011011 @sh6
+sraid    010000 ......  ..... 101 ..... 1011011 @sh6
+slld     0000000 ..... .....  001 ..... 1111011 @r
+srld     0000000 ..... .....  101 ..... 1111011 @r
+srad     0100000 ..... .....  101 ..... 1111011 @r
 # *** RV32M Standard Extension ***
 mul      0000001 .....  ..... 000 ..... 0110011 @r
 mulh     0000001 .....  ..... 001 ..... 0110011 @r
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 71982f6284..67a82a0855 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -419,6 +419,22 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode-insn32.c.inc"
 
+/*
+ *  xlm  xl   ol   tl   func   remark
+ * ----+----+----+----+------+-------------------
+ *  32   32   32   32   f_tl
+ *  64   64   64   64   f_tl
+ *  64   64   32   64   f_32  sign extends to 64
+ *  64   32   32   64   f_32  sign extends to 64
+ * 128  128  128   64   f_128
+ * 128  128   64   64   f_tl  sign extends to 128
+ * 128  128   32   64   f_32  sign extends to 128
+ * 128   64   64   64   f_tl  sign extends to 128
+ * 128   64   32   64   f_32  sign extends to 128
+ * 128   32   32   64   f_32  sign extends to 128
+ * ----+----+----+----+------+-------------------
+ */
+
 static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
                              void (*func)(TCGv, TCGv, target_long))
 {
@@ -523,7 +539,8 @@ static bool gen_arith_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ext,
 }
 
 static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
-                             void (*func)(TCGv, TCGv, target_long))
+                             void (*func)(TCGv, TCGv, target_long),
+                             void (*f128)(TCGv, TCGv, TCGv, TCGv, target_long))
 {
     TCGv dest, src1;
     int max_len = get_olen(ctx);
@@ -532,29 +549,52 @@ static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
         return false;
     }
 
-    dest = dest_gpr(ctx, a->rd);
-    src1 = get_gpr(ctx, a->rs1, ext);
+    if (get_xl_max(ctx) < MXL_RV128) {
+        dest = dest_gpr(ctx, a->rd);
+        src1 = get_gpr(ctx, a->rs1, ext);
 
-    func(dest, src1, a->shamt);
+        func(dest, src1, a->shamt);
 
-    gen_set_gpr(ctx, a->rd, dest);
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
+        TCGv src1l = get_gpr(ctx, a->rs1, ext),
+             src1h = get_gprh(ctx, a->rs1),
+             destl = tcg_temp_new(),
+             desth = tcg_temp_new();
+
+        if (max_len < 128) {
+            func(destl, src1l, a->shamt);
+            gen_set_gpr(ctx, a->rd, destl);
+            gen_set_gprh(ctx, a->rd, desth);
+        } else {
+            assert(f128 != NULL);
+            f128(destl, desth, src1l, src1h, a->shamt);
+            gen_set_gpr(ctx, a->rd, destl);
+            gen_set_gprh(ctx, a->rd, desth);
+        }
+
+        tcg_temp_free(destl);
+        tcg_temp_free(desth);
+    }
     return true;
 }
 
 static bool gen_shift_imm_fn_per_ol(DisasContext *ctx, arg_shift *a,
                                     DisasExtend ext,
                                     void (*f_tl)(TCGv, TCGv, target_long),
-                                    void (*f_32)(TCGv, TCGv, target_long))
+                                    void (*f_32)(TCGv, TCGv, target_long),
+                                    void (*f_128)(TCGv, TCGv, TCGv, TCGv,
+                                                  target_long))
 {
     int olen = get_olen(ctx);
     if (olen != TARGET_LONG_BITS) {
         if (olen == 32) {
             f_tl = f_32;
-        } else {
+        } else if (olen != 128) {
             g_assert_not_reached();
         }
     }
-    return gen_shift_imm_fn(ctx, a, ext, f_tl);
+    return gen_shift_imm_fn(ctx, a, ext, f_tl, f_128);
 }
 
 static bool gen_shift_imm_tl(DisasContext *ctx, arg_shift *a, DisasExtend ext,
@@ -578,34 +618,58 @@ static bool gen_shift_imm_tl(DisasContext *ctx, arg_shift *a, DisasExtend ext,
 }
 
 static bool gen_shift(DisasContext *ctx, arg_r *a, DisasExtend ext,
-                      void (*func)(TCGv, TCGv, TCGv))
+                      void (*func)(TCGv, TCGv, TCGv),
+                      void (*f128)(TCGv, TCGv, TCGv, TCGv, TCGv))
 {
-    TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_gpr(ctx, a->rs1, ext);
     TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
     TCGv ext2 = tcg_temp_new();
 
     tcg_gen_andi_tl(ext2, src2, get_olen(ctx) - 1);
-    func(dest, src1, ext2);
 
-    gen_set_gpr(ctx, a->rd, dest);
+    if (get_xl_max(ctx) < MXL_RV128) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv src1 = get_gpr(ctx, a->rs1, ext);
+        func(dest, src1, ext2);
+
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
+        TCGv src1l = get_gpr(ctx, a->rs1, ext),
+             src1h = get_gprh(ctx, a->rs1),
+             destl = tcg_temp_new(),
+             desth = tcg_temp_new();
+
+        if (get_olen(ctx) < 128) {
+            func(destl, src1l, ext2);
+            gen_set_gpr(ctx, a->rd, destl);
+            gen_set_gprh(ctx, a->rd, desth);
+        } else {
+            assert(f128 != NULL);
+            f128(destl, desth, src1l, src1h, ext2);
+            gen_set_gpr(ctx, a->rd, destl);
+            gen_set_gprh(ctx, a->rd, desth);
+        }
+
+        tcg_temp_free(destl);
+        tcg_temp_free(desth);
+    }
     tcg_temp_free(ext2);
     return true;
 }
 
 static bool gen_shift_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ext,
                              void (*f_tl)(TCGv, TCGv, TCGv),
-                             void (*f_32)(TCGv, TCGv, TCGv))
+                             void (*f_32)(TCGv, TCGv, TCGv),
+                             void (*f_128)(TCGv, TCGv, TCGv, TCGv, TCGv))
 {
     int olen = get_olen(ctx);
     if (olen != TARGET_LONG_BITS) {
         if (olen == 32) {
             f_tl = f_32;
-        } else {
+        } else if (olen != 128) {
             g_assert_not_reached();
         }
     }
-    return gen_shift(ctx, a, ext, f_tl);
+    return gen_shift(ctx, a, ext, f_tl, f_128);
 }
 
 static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 28f911f95d..cae97ed842 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -156,7 +156,7 @@ static void gen_bset(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_bset(DisasContext *ctx, arg_bset *a)
 {
     REQUIRE_ZBS(ctx);
-    return gen_shift(ctx, a, EXT_NONE, gen_bset);
+    return gen_shift(ctx, a, EXT_NONE, gen_bset, NULL);
 }
 
 static bool trans_bseti(DisasContext *ctx, arg_bseti *a)
@@ -178,7 +178,7 @@ static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
 {
     REQUIRE_ZBS(ctx);
-    return gen_shift(ctx, a, EXT_NONE, gen_bclr);
+    return gen_shift(ctx, a, EXT_NONE, gen_bclr, NULL);
 }
 
 static bool trans_bclri(DisasContext *ctx, arg_bclri *a)
@@ -200,7 +200,7 @@ static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_binv(DisasContext *ctx, arg_binv *a)
 {
     REQUIRE_ZBS(ctx);
-    return gen_shift(ctx, a, EXT_NONE, gen_binv);
+    return gen_shift(ctx, a, EXT_NONE, gen_binv, NULL);
 }
 
 static bool trans_binvi(DisasContext *ctx, arg_binvi *a)
@@ -218,7 +218,7 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_bext(DisasContext *ctx, arg_bext *a)
 {
     REQUIRE_ZBS(ctx);
-    return gen_shift(ctx, a, EXT_NONE, gen_bext);
+    return gen_shift(ctx, a, EXT_NONE, gen_bext, NULL);
 }
 
 static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
@@ -248,7 +248,7 @@ static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotr_tl, gen_rorw);
+    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotr_tl, gen_rorw, NULL);
 }
 
 static void gen_roriw(TCGv ret, TCGv arg1, target_long shamt)
@@ -266,7 +266,7 @@ static bool trans_rori(DisasContext *ctx, arg_rori *a)
 {
     REQUIRE_ZBB(ctx);
     return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
-                                   tcg_gen_rotri_tl, gen_roriw);
+                                   tcg_gen_rotri_tl, gen_roriw, NULL);
 }
 
 static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
@@ -290,7 +290,7 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_rol(DisasContext *ctx, arg_rol *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotl_tl, gen_rolw);
+    return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotl_tl, gen_rolw, NULL);
 }
 
 static void gen_rev8_32(TCGv ret, TCGv src1)
@@ -402,7 +402,7 @@ static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
     ctx->ol = MXL_RV32;
-    return gen_shift(ctx, a, EXT_NONE, gen_rorw);
+    return gen_shift(ctx, a, EXT_NONE, gen_rorw, NULL);
 }
 
 static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
@@ -410,7 +410,7 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
     ctx->ol = MXL_RV32;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw, NULL);
 }
 
 static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
@@ -418,7 +418,7 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
     ctx->ol = MXL_RV32;
-    return gen_shift(ctx, a, EXT_NONE, gen_rolw);
+    return gen_shift(ctx, a, EXT_NONE, gen_rolw, NULL);
 }
 
 #define GEN_SHADD_UW(SHAMT)                                       \
@@ -475,7 +475,7 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBA(ctx);
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw, NULL);
 }
 
 static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index b5e292a2aa..6e2c89cd5e 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -410,9 +410,22 @@ static bool trans_andi(DisasContext *ctx, arg_andi *a)
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
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl, gen_slli_i128);
 }
 
 static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
@@ -420,10 +433,23 @@ static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
     tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
 }
 
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
+}
+
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
     return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
-                                   tcg_gen_shri_tl, gen_srliw);
+                                   tcg_gen_shri_tl, gen_srliw, gen_srli_i128);
 }
 
 static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
@@ -431,10 +457,23 @@ static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
     tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
 }
 
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
+}
+
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
     return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
-                                   tcg_gen_sari_tl, gen_sraiw);
+                                   tcg_gen_sari_tl, gen_sraiw, gen_srai_i128);
 }
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
@@ -447,9 +486,75 @@ static bool trans_sub(DisasContext *ctx, arg_sub *a)
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
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
+                     TCGv src1l, TCGv src1h, TCGv shamt)
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
-    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl);
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl, gen_sll_i128);
 }
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
@@ -462,14 +567,67 @@ static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
     return gen_arith(ctx, a, EXT_SIGN, gen_sltu);
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
-    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
+    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl, gen_srl_i128);
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
-    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
+    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, gen_sra_i128);
 }
 
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
@@ -496,25 +654,47 @@ static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol = MXL_RV32;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl, NULL);
 }
 
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol = MXL_RV32;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw, NULL);
 }
 
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol = MXL_RV32;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_sraiw);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_sraiw, NULL);
 }
 
+static bool trans_sllid(DisasContext *ctx, arg_sllid *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol = MXL_RV64;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl, NULL);
+}
+
+static bool trans_srlid(DisasContext *ctx, arg_srlid *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol = MXL_RV64;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shri_tl, NULL);
+}
+
+static bool trans_sraid(DisasContext *ctx, arg_sraid *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol = MXL_RV64;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_sari_tl,  NULL);
+}
+
+
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -531,25 +711,47 @@ static bool trans_subw(DisasContext *ctx, arg_subw *a)
 
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol = MXL_RV32;
-    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl);
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl, NULL);
 }
 
 static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol = MXL_RV32;
-    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
+    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl, NULL);
 }
 
 static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol = MXL_RV32;
-    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
+    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, NULL);
 }
 
+static bool trans_slld(DisasContext *ctx, arg_slld *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol = MXL_RV64;
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl, NULL);
+}
+
+static bool trans_srld(DisasContext *ctx, arg_srld *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol = MXL_RV64;
+    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl, NULL);
+}
+
+static bool trans_srad(DisasContext *ctx, arg_srad *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol = MXL_RV64;
+    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, NULL);
+}
+
+
 static bool trans_fence(DisasContext *ctx, arg_fence *a)
 {
     /* FENCE is a full memory barrier. */
-- 
2.33.0


