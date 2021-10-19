Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcljw-0001Eo-79
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 05:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljv-0001A8-4w; Tue, 19 Oct 2021 05:48:59 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:54918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljr-0006co-QK; Tue, 19 Oct 2021 05:48:58 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 31F0F41FF1;
 Tue, 19 Oct 2021 11:48:34 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 15C2F601E2;
 Tue, 19 Oct 2021 11:48:34 +0200 (CEST)
Received: from palmier.u-ga.fr (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id E37D814005D;
 Tue, 19 Oct 2021 11:48:33 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v3 14/21] target/riscv: support for 128-bit arithmetic
 instructions
Date: Tue, 19 Oct 2021 11:48:05 +0200
Message-Id: <20211019094812.614056-15-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Tue, 19 Oct 2021 09:48:59 -0000

Addition of 128-bit adds and subs in their various sizes.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/insn32.decode              |   3 +
 target/riscv/translate.c                | 105 ++++++++++++---
 target/riscv/insn_trans/trans_rvb.c.inc |  20 +--
 target/riscv/insn_trans/trans_rvi.c.inc | 169 ++++++++++++++++++++++--
 target/riscv/insn_trans/trans_rvm.c.inc |  26 ++--
 5 files changed, 266 insertions(+), 57 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c642f6d09d..3556bf49cc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -171,9 +171,12 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
 ldu      ............   ..... 111 ..... 0000011 @i
 lq       ............   ..... 010 ..... 0001111 @i
 sq       ............   ..... 100 ..... 0100011 @s
+addid    ............  .....  000 ..... 1011011 @i
 sllid    000000 ......  ..... 001 ..... 1011011 @sh6
 srlid    000000 ......  ..... 101 ..... 1011011 @sh6
 sraid    010000 ......  ..... 101 ..... 1011011 @sh6
+addd     0000000 ..... .....  000 ..... 1111011 @r
+subd     0100000 ..... .....  000 ..... 1111011 @r
 slld     0000000 ..... .....  001 ..... 1111011 @r
 srld     0000000 ..... .....  101 ..... 1111011 @r
 srad     0100000 ..... .....  101 ..... 1111011 @r
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 67a82a0855..332a5d0384 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -485,57 +485,122 @@ static bool gen_logic(DisasContext *ctx, arg_r *a, DisasExtend ext,
 }
 
 static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
-                             void (*func)(TCGv, TCGv, target_long))
+                             void (*func)(TCGv, TCGv, target_long),
+                             void (*f128)(TCGv, TCGv, TCGv, TCGv, target_long))
 {
-    TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_gpr(ctx, a->rs1, ext);
+    if (get_xl_max(ctx) < MXL_RV128) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv src1 = get_gpr(ctx, a->rs1, ext);
 
-    func(dest, src1, a->imm);
+        func(dest, src1, a->imm);
 
-    gen_set_gpr(ctx, a->rd, dest);
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
+        TCGv src1l = get_gpr(ctx, a->rs1, ext),
+             src1h = get_gprh(ctx, a->rs1),
+             destl = tcg_temp_new(),
+             desth = tcg_temp_new();
+
+        if (get_ol(ctx) < MXL_RV128) {
+            func(destl, src1l, a->imm);
+            gen_set_gpr(ctx, a->rd, destl);
+            gen_set_gprh(ctx, a->rd, desth);
+        } else {
+            assert(f128 != NULL);
+            f128(destl, desth, src1l, src1h, a->imm);
+            gen_set_gpr(ctx, a->rd, destl);
+            gen_set_gprh(ctx, a->rd, desth);
+        }
+
+        tcg_temp_free(destl);
+        tcg_temp_free(desth);
+    }
     return true;
 }
 
 static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a, DisasExtend ext,
-                             void (*func)(TCGv, TCGv, TCGv))
+                             void (*func)(TCGv, TCGv, TCGv),
+                             void (*f128)(TCGv, TCGv, TCGv, TCGv, TCGv, TCGv))
 {
-    TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_gpr(ctx, a->rs1, ext);
-    TCGv src2 = tcg_constant_tl(a->imm);
 
-    func(dest, src1, src2);
+    if (get_xl_max(ctx) < MXL_RV128) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv src1 = get_gpr(ctx, a->rs1, ext);
+        TCGv src2 = tcg_constant_tl(a->imm);
 
-    gen_set_gpr(ctx, a->rd, dest);
+        func(dest, src1, src2);
+
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
+        TCGv src1l = get_gpr(ctx, a->rs1, ext),
+             src1h = get_gprh(ctx, a->rs1),
+             src2l = tcg_constant_tl(a->imm),
+             src2h = tcg_constant_tl(-(a->imm < 0)),
+             destl = tcg_temp_new(),
+             desth = tcg_temp_new();
+
+        assert(f128 != NULL);
+        f128(destl, desth, src1l, src1h, src2l, src2h);
+        gen_set_gpr(ctx, a->rd, destl);
+        gen_set_gprh(ctx, a->rd, desth);
+        tcg_temp_free(destl);
+        tcg_temp_free(desth);
+    }
     return true;
 }
 
 static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
-                      void (*func)(TCGv, TCGv, TCGv))
+                      void (*func)(TCGv, TCGv, TCGv),
+                      void (*f128)(TCGv, TCGv, TCGv, TCGv, TCGv, TCGv))
 {
-    TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_gpr(ctx, a->rs1, ext);
-    TCGv src2 = get_gpr(ctx, a->rs2, ext);
+    if (get_xl_max(ctx) < MXL_RV128) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv src1 = get_gpr(ctx, a->rs1, ext);
+        TCGv src2 = get_gpr(ctx, a->rs2, ext);
 
-    func(dest, src1, src2);
+        func(dest, src1, src2);
 
-    gen_set_gpr(ctx, a->rd, dest);
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
+        TCGv src1l = get_gpr(ctx, a->rs1, ext),
+             src1h = get_gprh(ctx, a->rs1),
+             src2l = get_gpr(ctx, a->rs2, ext),
+             src2h = get_gprh(ctx, a->rs2),
+             destl = tcg_temp_new(),
+             desth = tcg_temp_new();
+
+        if (get_ol(ctx) < MXL_RV128) {
+            func(destl, src1l, src2l);
+            gen_set_gpr(ctx, a->rd, destl);
+            gen_set_gprh(ctx, a->rd, desth);
+        } else {
+            assert(f128 != NULL);
+            f128(destl, desth, src1l, src1h, src2l, src2h);
+            gen_set_gpr(ctx, a->rd, destl);
+            gen_set_gprh(ctx, a->rd, desth);
+        }
+
+        tcg_temp_free(destl);
+        tcg_temp_free(desth);
+    }
     return true;
 }
 
 static bool gen_arith_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ext,
                              void (*f_tl)(TCGv, TCGv, TCGv),
-                             void (*f_32)(TCGv, TCGv, TCGv))
+                             void (*f_32)(TCGv, TCGv, TCGv),
+                             void (*f_128)(TCGv, TCGv, TCGv, TCGv, TCGv, TCGv))
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
-    return gen_arith(ctx, a, ext, f_tl);
+    return gen_arith(ctx, a, ext, f_tl, f_128);
 }
 
 static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index cae97ed842..764c0b7122 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -104,25 +104,25 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
 static bool trans_min(DisasContext *ctx, arg_min *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smin_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smin_tl, NULL);
 }
 
 static bool trans_max(DisasContext *ctx, arg_max *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smax_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smax_tl, NULL);
 }
 
 static bool trans_minu(DisasContext *ctx, arg_minu *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umin_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umin_tl, NULL);
 }
 
 static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umax_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umax_tl, NULL);
 }
 
 static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
@@ -354,7 +354,7 @@ GEN_SHADD(3)
 static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
 {                                                                          \
     REQUIRE_ZBA(ctx);                                                      \
-    return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add);                \
+    return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add, NULL);          \
 }
 
 GEN_TRANS_SHADD(1)
@@ -444,7 +444,7 @@ static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
 {                                                             \
     REQUIRE_64BIT(ctx);                                       \
     REQUIRE_ZBA(ctx);                                         \
-    return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add_uw);  \
+    return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add_uw, NULL); \
 }
 
 GEN_TRANS_SHADD_UW(1)
@@ -463,7 +463,7 @@ static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBA(ctx);
-    return gen_arith(ctx, a, EXT_NONE, gen_add_uw);
+    return gen_arith(ctx, a, EXT_NONE, gen_add_uw, NULL);
 }
 
 static void gen_slli_uw(TCGv dest, TCGv src, target_long shamt)
@@ -481,7 +481,7 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
 {
     REQUIRE_ZBC(ctx);
-    return gen_arith(ctx, a, EXT_NONE, gen_helper_clmul);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_clmul, NULL);
 }
 
 static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)
@@ -493,11 +493,11 @@ static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)
 static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
 {
     REQUIRE_ZBC(ctx);
-    return gen_arith(ctx, a, EXT_NONE, gen_clmulh);
+    return gen_arith(ctx, a, EXT_NONE, gen_clmulh, NULL);
 }
 
 static bool trans_clmulr(DisasContext *ctx, arg_clmulh *a)
 {
     REQUIRE_ZBC(ctx);
-    return gen_arith(ctx, a, EXT_NONE, gen_helper_clmulr);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_clmulr, NULL);
 }
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 6e2c89cd5e..6497338842 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -97,13 +97,121 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
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
+    if (get_xl(ctx) == MXL_RV128) {
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
@@ -370,9 +478,30 @@ static bool trans_sq(DisasContext *ctx, arg_sq *a)
     return gen_store(ctx, a, MO_TEO);
 }
 
+static bool trans_addd(DisasContext *ctx, arg_addd *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol = MXL_RV64;
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl, NULL);
+}
+
+static bool trans_addid(DisasContext *ctx, arg_addid *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol = MXL_RV64;
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl, NULL);
+}
+
+static bool trans_subd(DisasContext *ctx, arg_subd *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->ol = MXL_RV64;
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl, NULL);
+}
+
 static bool trans_addi(DisasContext *ctx, arg_addi *a)
 {
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl, gen_addi2_i128);
 }
 
 static void gen_slt(TCGv ret, TCGv s1, TCGv s2)
@@ -380,19 +509,31 @@ static void gen_slt(TCGv ret, TCGv s1, TCGv s2)
     tcg_gen_setcond_tl(TCG_COND_LT, ret, s1, s2);
 }
 
+static void gen_slt_i128(TCGv retl, TCGv reth,
+                         TCGv s1l, TCGv s1h, TCGv s2l, TCGv s2h)
+{
+    gen_setcond_i128(retl, reth, s1l, s1h, s2l, s2h, TCG_COND_LT);
+}
+
 static void gen_sltu(TCGv ret, TCGv s1, TCGv s2)
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
-    return gen_arith_imm_tl(ctx, a, EXT_SIGN, gen_slt);
+    return gen_arith_imm_tl(ctx, a, EXT_SIGN, gen_slt, gen_slt_i128);
 }
 
 static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 {
-    return gen_arith_imm_tl(ctx, a, EXT_SIGN, gen_sltu);
+    return gen_arith_imm_tl(ctx, a, EXT_SIGN, gen_sltu, gen_sltu_i128);
 }
 
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
@@ -478,12 +619,12 @@ static bool trans_srai(DisasContext *ctx, arg_srai *a)
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
 {
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl, tcg_gen_add2_tl);
 }
 
 static bool trans_sub(DisasContext *ctx, arg_sub *a)
 {
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl, tcg_gen_sub2_tl);
 }
 
 enum M128_DIR {
@@ -559,12 +700,12 @@ static bool trans_sll(DisasContext *ctx, arg_sll *a)
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
 {
-    return gen_arith(ctx, a, EXT_SIGN, gen_slt);
+    return gen_arith(ctx, a, EXT_SIGN, gen_slt, gen_slt_i128);
 }
 
 static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 {
-    return gen_arith(ctx, a, EXT_SIGN, gen_sltu);
+    return gen_arith(ctx, a, EXT_SIGN, gen_sltu, gen_sltu_i128);
 }
 
 static void gen_srl_i128(TCGv destl, TCGv desth,
@@ -647,9 +788,9 @@ static bool trans_and(DisasContext *ctx, arg_and *a)
 
 static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol = MXL_RV32;
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl, NULL);
 }
 
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
@@ -697,16 +838,16 @@ static bool trans_sraid(DisasContext *ctx, arg_sraid *a)
 
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol = MXL_RV32;
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl, NULL);
 }
 
 static bool trans_subw(DisasContext *ctx, arg_subw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     ctx->ol = MXL_RV32;
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl, NULL);
 }
 
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 2af0e5c139..efe25dfc11 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -22,7 +22,7 @@
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
 }
 
 static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
@@ -42,7 +42,7 @@ static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w);
+    return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w, NULL);
 }
 
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
@@ -76,7 +76,7 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w);
+    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w, NULL);
 }
 
 static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
@@ -91,7 +91,7 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
     /* gen_mulh_w works for either sign as input. */
-    return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w);
+    return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w, NULL);
 }
 
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
@@ -130,7 +130,7 @@ static void gen_div(TCGv ret, TCGv source1, TCGv source2)
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_SIGN, gen_div);
+    return gen_arith(ctx, a, EXT_SIGN, gen_div, NULL);
 }
 
 static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
@@ -158,7 +158,7 @@ static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_ZERO, gen_divu);
+    return gen_arith(ctx, a, EXT_ZERO, gen_divu, NULL);
 }
 
 static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
@@ -199,7 +199,7 @@ static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_SIGN, gen_rem);
+    return gen_arith(ctx, a, EXT_SIGN, gen_rem, NULL);
 }
 
 static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
@@ -227,7 +227,7 @@ static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_ZERO, gen_remu);
+    return gen_arith(ctx, a, EXT_ZERO, gen_remu, NULL);
 }
 
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
@@ -235,7 +235,7 @@ static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
 }
 
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
@@ -243,7 +243,7 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
-    return gen_arith(ctx, a, EXT_SIGN, gen_div);
+    return gen_arith(ctx, a, EXT_SIGN, gen_div, NULL);
 }
 
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
@@ -251,7 +251,7 @@ static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
-    return gen_arith(ctx, a, EXT_ZERO, gen_divu);
+    return gen_arith(ctx, a, EXT_ZERO, gen_divu, NULL);
 }
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
@@ -259,7 +259,7 @@ static bool trans_remw(DisasContext *ctx, arg_remw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
-    return gen_arith(ctx, a, EXT_SIGN, gen_rem);
+    return gen_arith(ctx, a, EXT_SIGN, gen_rem, NULL);
 }
 
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
@@ -267,5 +267,5 @@ static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
-    return gen_arith(ctx, a, EXT_ZERO, gen_remu);
+    return gen_arith(ctx, a, EXT_ZERO, gen_remu, NULL);
 }
-- 
2.33.0


