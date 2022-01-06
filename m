Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5ZtZ-0002lK-Vk
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 16:02:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5ZtS-0002WI-Jx; Thu, 06 Jan 2022 16:01:55 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:56440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5ZtP-0002j7-Lr; Thu, 06 Jan 2022 16:01:54 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id D5B3340429;
 Thu,  6 Jan 2022 22:01:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1641502883;
 bh=vBL3U3GwKA5bwULNGC2oIcIHG4tCVcNEoxPnp41PKLk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G1PlSdo7FCMnTXGXOOPJrTFyKi33u1A3kaJbBQJyF+NLJUyxQ0rLWvnrSihFy3fk5
 LsVGicrUItNGdC/sPMDQmvh9o4FVWVoyKMbSJtLPpMojUzmLjsojqHrmBqSNHvBMQu
 E5OBQv9HVAFlma1I+jzo7/f4T/TK3U7eRvVCLn7IvGR/UrIyD+jK6zWtcocnLBwT94
 Df5mhzkf9cgi9OlobvWoWh8Kosr+blQbaQUNGvMrHEdCVVgz5qBH1yrmaZR0CuTuzt
 3M6gntYyLQxZEWBCqI8Fl1MtnR5ASJqeL43A8y+Yr0/WGsksHox34id5/p3PwbzZhN
 NBHESgVlXHmZg==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id BDC2460074;
 Thu,  6 Jan 2022 22:01:23 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 8777F14007F;
 Thu,  6 Jan 2022 22:01:23 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, f4bug@amsat.org, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v8 12/18] target/riscv: support for 128-bit shift instructions
Date: Thu,  6 Jan 2022 22:01:02 +0100
Message-Id: <20220106210108.138226-13-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Jan 2022 21:01:57 -0000

Handling shifts for 32, 64 and 128 operation length for RV128, following the
general framework for handling various olens proposed by Richard.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  10 ++
 target/riscv/translate.c                |  58 ++++--
 target/riscv/insn_trans/trans_rvb.c.inc |  22 +--
 target/riscv/insn_trans/trans_rvi.c.inc | 224 ++++++++++++++++++++++--
 4 files changed, 270 insertions(+), 44 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ddbf0da03c..a992c6d369 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -22,6 +22,7 @@
 %rs1       15:5
 %rd        7:5
 %sh5       20:5
+%sh6       20:6
 
 %sh7    20:7
 %csr    20:12
@@ -91,6 +92,9 @@
 # Formats 64:
 @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
 
+# Formats 128:
+@sh6       ...... ...... ..... ... ..... ....... &shift shamt=%sh6 %rs1 %rd
+
 # *** Privileged Instructions ***
 ecall       000000000000     00000 000 00000 1110011
 ebreak      000000000001     00000 000 00000 1110011
@@ -166,6 +170,12 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
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
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ba1ad1be5f..89220a5fae 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -635,7 +635,8 @@ static bool gen_arith_per_ol(DisasContext *ctx, arg_r *a, DisasExtend ext,
 }
 
 static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
-                             void (*func)(TCGv, TCGv, target_long))
+                             void (*func)(TCGv, TCGv, target_long),
+                             void (*f128)(TCGv, TCGv, TCGv, TCGv, target_long))
 {
     TCGv dest, src1;
     int max_len = get_olen(ctx);
@@ -647,26 +648,38 @@ static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
     dest = dest_gpr(ctx, a->rd);
     src1 = get_gpr(ctx, a->rs1, ext);
 
-    func(dest, src1, a->shamt);
+    if (max_len < 128) {
+        func(dest, src1, a->shamt);
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
+        TCGv src1h = get_gprh(ctx, a->rs1);
+        TCGv desth = dest_gprh(ctx, a->rd);
 
-    gen_set_gpr(ctx, a->rd, dest);
+        if (f128 == NULL) {
+            return false;
+        }
+        f128(dest, desth, src1, src1h, a->shamt);
+        gen_set_gpr128(ctx, a->rd, dest, desth);
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
@@ -690,34 +703,49 @@ static bool gen_shift_imm_tl(DisasContext *ctx, arg_shift *a, DisasExtend ext,
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
+    int max_len = get_olen(ctx);
 
-    tcg_gen_andi_tl(ext2, src2, get_olen(ctx) - 1);
-    func(dest, src1, ext2);
+    tcg_gen_andi_tl(ext2, src2, max_len - 1);
 
-    gen_set_gpr(ctx, a->rd, dest);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
+
+    if (max_len < 128) {
+        func(dest, src1, ext2);
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
+        TCGv src1h = get_gprh(ctx, a->rs1);
+        TCGv desth = dest_gprh(ctx, a->rd);
+
+        if (f128 == NULL) {
+            return false;
+        }
+        f128(dest, desth, src1, src1h, ext2);
+        gen_set_gpr128(ctx, a->rd, dest, desth);
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
index de2cd613b1..ad6548320f 100644
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
@@ -405,7 +405,7 @@ static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
     ctx->ol = MXL_RV32;
-    return gen_shift(ctx, a, EXT_NONE, gen_rorw);
+    return gen_shift(ctx, a, EXT_NONE, gen_rorw, NULL);
 }
 
 static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
@@ -413,7 +413,7 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
     ctx->ol = MXL_RV32;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw, NULL);
 }
 
 static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
@@ -421,7 +421,7 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
     ctx->ol = MXL_RV32;
-    return gen_shift(ctx, a, EXT_NONE, gen_rolw);
+    return gen_shift(ctx, a, EXT_NONE, gen_rolw, NULL);
 }
 
 #define GEN_SHADD_UW(SHAMT)                                       \
@@ -478,7 +478,7 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBA(ctx);
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw, NULL);
 }
 
 static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 6113acc669..2e3a6c6041 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -353,9 +353,22 @@ static bool trans_andi(DisasContext *ctx, arg_andi *a)
     return gen_logic_imm_fn(ctx, a, tcg_gen_andi_tl);
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
@@ -363,10 +376,23 @@ static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
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
@@ -374,10 +400,23 @@ static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
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
@@ -390,9 +429,44 @@ static bool trans_sub(DisasContext *ctx, arg_sub *a)
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
 }
 
+static void gen_sll_i128(TCGv destl, TCGv desth,
+                         TCGv src1l, TCGv src1h, TCGv shamt)
+{
+    TCGv ls = tcg_temp_new();
+    TCGv rs = tcg_temp_new();
+    TCGv hs = tcg_temp_new();
+    TCGv ll = tcg_temp_new();
+    TCGv lr = tcg_temp_new();
+    TCGv h0 = tcg_temp_new();
+    TCGv h1 = tcg_temp_new();
+    TCGv zero = tcg_constant_tl(0);
+
+    tcg_gen_andi_tl(hs, shamt, 64);
+    tcg_gen_andi_tl(ls, shamt, 63);
+    tcg_gen_neg_tl(shamt, shamt);
+    tcg_gen_andi_tl(rs, shamt, 63);
+
+    tcg_gen_shl_tl(ll, src1l, ls);
+    tcg_gen_shl_tl(h0, src1h, ls);
+    tcg_gen_shr_tl(lr, src1l, rs);
+    tcg_gen_movcond_tl(TCG_COND_NE, lr, shamt, zero, lr, zero);
+    tcg_gen_or_tl(h1, h0, lr);
+
+    tcg_gen_movcond_tl(TCG_COND_NE, destl, hs, zero, zero, ll);
+    tcg_gen_movcond_tl(TCG_COND_NE, desth, hs, zero, ll, h1);
+
+    tcg_temp_free(ls);
+    tcg_temp_free(rs);
+    tcg_temp_free(hs);
+    tcg_temp_free(ll);
+    tcg_temp_free(lr);
+    tcg_temp_free(h0);
+    tcg_temp_free(h1);
+}
+
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
 {
-    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl);
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl, gen_sll_i128);
 }
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
@@ -405,14 +479,85 @@ static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
     return gen_arith(ctx, a, EXT_SIGN, gen_sltu);
 }
 
+static void gen_srl_i128(TCGv destl, TCGv desth,
+                         TCGv src1l, TCGv src1h, TCGv shamt)
+{
+    TCGv ls = tcg_temp_new();
+    TCGv rs = tcg_temp_new();
+    TCGv hs = tcg_temp_new();
+    TCGv ll = tcg_temp_new();
+    TCGv lr = tcg_temp_new();
+    TCGv h0 = tcg_temp_new();
+    TCGv h1 = tcg_temp_new();
+    TCGv zero = tcg_constant_tl(0);
+
+    tcg_gen_andi_tl(hs, shamt, 64);
+    tcg_gen_andi_tl(rs, shamt, 63);
+    tcg_gen_neg_tl(shamt, shamt);
+    tcg_gen_andi_tl(ls, shamt, 63);
+
+    tcg_gen_shr_tl(lr, src1l, rs);
+    tcg_gen_shr_tl(h1, src1h, rs);
+    tcg_gen_shl_tl(ll, src1h, ls);
+    tcg_gen_movcond_tl(TCG_COND_NE, ll, shamt, zero, ll, zero);
+    tcg_gen_or_tl(h0, ll, lr);
+
+    tcg_gen_movcond_tl(TCG_COND_NE, destl, hs, zero, h1, h0);
+    tcg_gen_movcond_tl(TCG_COND_NE, desth, hs, zero, zero, h1);
+
+    tcg_temp_free(ls);
+    tcg_temp_free(rs);
+    tcg_temp_free(hs);
+    tcg_temp_free(ll);
+    tcg_temp_free(lr);
+    tcg_temp_free(h0);
+    tcg_temp_free(h1);
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
+    TCGv ls = tcg_temp_new();
+    TCGv rs = tcg_temp_new();
+    TCGv hs = tcg_temp_new();
+    TCGv ll = tcg_temp_new();
+    TCGv lr = tcg_temp_new();
+    TCGv h0 = tcg_temp_new();
+    TCGv h1 = tcg_temp_new();
+    TCGv zero = tcg_constant_tl(0);
+
+    tcg_gen_andi_tl(hs, shamt, 64);
+    tcg_gen_andi_tl(rs, shamt, 63);
+    tcg_gen_neg_tl(shamt, shamt);
+    tcg_gen_andi_tl(ls, shamt, 63);
+
+    tcg_gen_shr_tl(lr, src1l, rs);
+    tcg_gen_sar_tl(h1, src1h, rs);
+    tcg_gen_shl_tl(ll, src1h, ls);
+    tcg_gen_movcond_tl(TCG_COND_NE, ll, shamt, zero, ll, zero);
+    tcg_gen_or_tl(h0, ll, lr);
+    tcg_gen_sari_tl(lr, src1h, 63);
+
+    tcg_gen_movcond_tl(TCG_COND_NE, destl, hs, zero, h1, h0);
+    tcg_gen_movcond_tl(TCG_COND_NE, desth, hs, zero, lr, h1);
+
+    tcg_temp_free(ls);
+    tcg_temp_free(rs);
+    tcg_temp_free(hs);
+    tcg_temp_free(ll);
+    tcg_temp_free(lr);
+    tcg_temp_free(h0);
+    tcg_temp_free(h1);
 }
 
 static bool trans_sra(DisasContext *ctx, arg_sra *a)
 {
-    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
+    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, gen_sra_i128);
 }
 
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
@@ -439,23 +584,44 @@ static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 
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
+}
+
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
 }
 
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
@@ -474,25 +640,47 @@ static bool trans_subw(DisasContext *ctx, arg_subw *a)
 
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
2.34.1


