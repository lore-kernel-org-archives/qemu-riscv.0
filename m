Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEU5-0008Ms-F0
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETj-00081O-Vv; Wed, 06 Oct 2021 17:29:32 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETh-00081d-AF; Wed, 06 Oct 2021 17:29:31 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 636E441DAB;
 Wed,  6 Oct 2021 23:29:27 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 4D62760066;
 Wed,  6 Oct 2021 23:29:27 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id E907E14005C;
 Wed,  6 Oct 2021 23:29:26 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 08/27] target/riscv: refactoring calls to gen_shift
Date: Wed,  6 Oct 2021 23:28:14 +0200
Message-Id: <20211006212833.108706-9-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Wed, 06 Oct 2021 21:29:34 -0000

As for arithmetic operations, we now pass functions pointers to deal with
32, 64 and 128-bit shift operations, and to change all call sites accordingly.
For now, 128-bit operations are still not handled.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/translate.c                | 77 ++++++++++++++++++-------
 target/riscv/insn_trans/trans_rvb.c.inc | 47 +++++++--------
 target/riscv/insn_trans/trans_rvi.c.inc | 34 ++++++-----
 3 files changed, 101 insertions(+), 57 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c940698478..0700c82a36 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -502,21 +502,41 @@ static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
 }
 
 static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
-                             void (*func)(TCGv, TCGv, target_long))
+                             void (*fn32)(TCGv, TCGv, target_long),
+                             void (*fn64)(TCGv, TCGv, target_long),
+                             void (*fn128)(TCGv, TCGv, TCGv, TCGv, target_long))
 {
-    TCGv dest, src1;
-    int max_len = oper_len(ctx);
+    if (is_32bit(ctx)) {
+        TCGv dest, src1;
+        int max_len = oper_len(ctx);
 
-    if (a->shamt >= max_len) {
+        if (a->shamt >= max_len) {
+            return false;
+        }
+
+        dest = dest_gpr(ctx, a->rd);
+        src1 = get_gpr(ctx, a->rs1, ext);
+
+        fn32(dest, src1, a->shamt);
+
+        gen_set_gpr(ctx, a->rd, dest);
+    } else if (is_64bit(ctx)) {
+        TCGv dest, src1;
+        int max_len = oper_len(ctx);
+
+        if (a->shamt >= max_len) {
+            return false;
+        }
+
+        dest = dest_gpr(ctx, a->rd);
+        src1 = get_gpr(ctx, a->rs1, ext);
+
+        fn64(dest, src1, a->shamt);
+
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
         return false;
     }
-
-    dest = dest_gpr(ctx, a->rd);
-    src1 = get_gpr(ctx, a->rs1, ext);
-
-    func(dest, src1, a->shamt);
-
-    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -541,18 +561,35 @@ static bool gen_shift_imm_tl(DisasContext *ctx, arg_shift *a, DisasExtend ext,
 }
 
 static bool gen_shift(DisasContext *ctx, arg_r *a, DisasExtend ext,
-                      void (*func)(TCGv, TCGv, TCGv))
+                             void (*fn32)(TCGv, TCGv, TCGv),
+                             void (*fn64)(TCGv, TCGv, TCGv),
+                             void (*fn128)(TCGv, TCGv, TCGv, TCGv, TCGv))
 {
-    TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_gpr(ctx, a->rs1, ext);
-    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
-    TCGv ext2 = tcg_temp_new();
+    if (is_32bit(ctx)) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv src1 = get_gpr(ctx, a->rs1, ext);
+        TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+        TCGv ext2 = tcg_temp_new();
 
-    tcg_gen_andi_tl(ext2, src2, oper_len(ctx) - 1);
-    func(dest, src1, ext2);
+        tcg_gen_andi_tl(ext2, src2, oper_len(ctx) - 1);
+        fn32(dest, src1, ext2);
 
-    gen_set_gpr(ctx, a->rd, dest);
-    tcg_temp_free(ext2);
+        gen_set_gpr(ctx, a->rd, dest);
+        tcg_temp_free(ext2);
+    } else if (is_64bit(ctx)) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv src1 = get_gpr(ctx, a->rs1, ext);
+        TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+        TCGv ext2 = tcg_temp_new();
+
+        tcg_gen_andi_tl(ext2, src2, oper_len(ctx) - 1);
+        fn64(dest, src1, ext2);
+
+        gen_set_gpr(ctx, a->rd, dest);
+        tcg_temp_free(ext2);
+    } else {
+        return false;
+    }
     return true;
 }
 
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index fef239eed9..cdae9671ff 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -160,7 +160,7 @@ static void gen_bset(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_bset(DisasContext *ctx, arg_bset *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_NONE, gen_bset);
+    return gen_shift(ctx, a, EXT_NONE, gen_bset, gen_bset, NULL);
 }
 
 static bool trans_bseti(DisasContext *ctx, arg_bseti *a)
@@ -182,7 +182,7 @@ static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_NONE, gen_bclr);
+    return gen_shift(ctx, a, EXT_NONE, gen_bclr, gen_bclr, NULL);
 }
 
 static bool trans_bclri(DisasContext *ctx, arg_bclri *a)
@@ -204,7 +204,7 @@ static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_binv(DisasContext *ctx, arg_binv *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_NONE, gen_binv);
+    return gen_shift(ctx, a, EXT_NONE, gen_binv, gen_binv, NULL);
 }
 
 static bool trans_binvi(DisasContext *ctx, arg_binvi *a)
@@ -222,7 +222,7 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
 static bool trans_bext(DisasContext *ctx, arg_bext *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_NONE, gen_bext);
+    return gen_shift(ctx, a, EXT_NONE, gen_bext, gen_bext, NULL);
 }
 
 static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
@@ -241,7 +241,7 @@ static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_slo(DisasContext *ctx, arg_slo *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_NONE, gen_slo);
+    return gen_shift(ctx, a, EXT_NONE, gen_slo, gen_slo, NULL);
 }
 
 static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
@@ -260,7 +260,7 @@ static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_sro(DisasContext *ctx, arg_sro *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_ZERO, gen_sro);
+    return gen_shift(ctx, a, EXT_ZERO, gen_sro, gen_sro, NULL);
 }
 
 static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
@@ -272,25 +272,26 @@ static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotr_tl);
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotr_tl, tcg_gen_rotr_tl, NULL);
 }
 
 static bool trans_rori(DisasContext *ctx, arg_rori *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_rotri_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE,
+                            tcg_gen_rotri_tl, tcg_gen_rotri_tl, NULL);
 }
 
 static bool trans_rol(DisasContext *ctx, arg_rol *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
+    return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl, tcg_gen_rotl_tl, NULL);
 }
 
 static bool trans_grev(DisasContext *ctx, arg_grev *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_NONE, gen_helper_grev);
+    return gen_shift(ctx, a, EXT_NONE, gen_helper_grev, gen_helper_grev, NULL);
 }
 
 static void gen_grevi(TCGv dest, TCGv src, target_long shamt)
@@ -306,13 +307,13 @@ static void gen_grevi(TCGv dest, TCGv src, target_long shamt)
 static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_grevi);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_grevi, gen_grevi, NULL);
 }
 
 static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
+    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc, gen_helper_gorc, NULL);
 }
 
 static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
@@ -418,7 +419,7 @@ static bool trans_bsetw(DisasContext *ctx, arg_bsetw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
     ctx->w = true;
-    return gen_shift(ctx, a, EXT_NONE, gen_bset);
+    return gen_shift(ctx, a, EXT_NONE, NULL, gen_bset, NULL);
 }
 
 static bool trans_bsetiw(DisasContext *ctx, arg_bsetiw *a)
@@ -434,7 +435,7 @@ static bool trans_bclrw(DisasContext *ctx, arg_bclrw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
     ctx->w = true;
-    return gen_shift(ctx, a, EXT_NONE, gen_bclr);
+    return gen_shift(ctx, a, EXT_NONE, NULL, gen_bclr, NULL);
 }
 
 static bool trans_bclriw(DisasContext *ctx, arg_bclriw *a)
@@ -450,7 +451,7 @@ static bool trans_binvw(DisasContext *ctx, arg_binvw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
     ctx->w = true;
-    return gen_shift(ctx, a, EXT_NONE, gen_binv);
+    return gen_shift(ctx, a, EXT_NONE, NULL, gen_binv, NULL);
 }
 
 static bool trans_binviw(DisasContext *ctx, arg_binviw *a)
@@ -466,7 +467,7 @@ static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
     ctx->w = true;
-    return gen_shift(ctx, a, EXT_NONE, gen_bext);
+    return gen_shift(ctx, a, EXT_NONE, NULL, gen_bext, NULL);
 }
 
 static bool trans_slow(DisasContext *ctx, arg_slow *a)
@@ -474,7 +475,7 @@ static bool trans_slow(DisasContext *ctx, arg_slow *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
     ctx->w = true;
-    return gen_shift(ctx, a, EXT_NONE, gen_slo);
+    return gen_shift(ctx, a, EXT_NONE, NULL, gen_slo, NULL);
 }
 
 static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
@@ -490,7 +491,7 @@ static bool trans_srow(DisasContext *ctx, arg_srow *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
     ctx->w = true;
-    return gen_shift(ctx, a, EXT_ZERO, gen_sro);
+    return gen_shift(ctx, a, EXT_ZERO, NULL, gen_sro, NULL);
 }
 
 static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
@@ -524,7 +525,7 @@ static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
     ctx->w = true;
-    return gen_shift(ctx, a, EXT_NONE, gen_rorw);
+    return gen_shift(ctx, a, EXT_NONE, NULL, gen_rorw, NULL);
 }
 
 static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
@@ -558,7 +559,7 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
     ctx->w = true;
-    return gen_shift(ctx, a, EXT_NONE, gen_rolw);
+    return gen_shift(ctx, a, EXT_NONE, NULL, gen_rolw, NULL);
 }
 
 static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
@@ -566,7 +567,7 @@ static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
     ctx->w = true;
-    return gen_shift(ctx, a, EXT_ZERO, gen_helper_grev);
+    return gen_shift(ctx, a, EXT_ZERO, NULL, gen_helper_grev, NULL);
 }
 
 static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
@@ -582,7 +583,7 @@ static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
     ctx->w = true;
-    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
+    return gen_shift(ctx, a, EXT_ZERO, NULL, gen_helper_gorc, NULL);
 }
 
 static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
@@ -647,5 +648,5 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, NULL, gen_slli_uw, NULL);
 }
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index c284dd19b3..aa1e3f07e5 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -270,17 +270,20 @@ static bool trans_andi(DisasContext *ctx, arg_andi *a)
 
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE,
+                            tcg_gen_shli_tl, tcg_gen_shli_tl, NULL);
 }
 
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
-    return gen_shift_imm_fn(ctx, a, EXT_ZERO, tcg_gen_shri_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_ZERO,
+                            tcg_gen_shri_tl, tcg_gen_shri_tl, NULL);
 }
 
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
-    return gen_shift_imm_fn(ctx, a, EXT_SIGN, tcg_gen_sari_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_SIGN,
+                            tcg_gen_sari_tl, tcg_gen_sari_tl, NULL);
 }
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
@@ -297,7 +300,8 @@ static bool trans_sub(DisasContext *ctx, arg_sub *a)
 
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
 {
-    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl);
+    return gen_shift(ctx, a, EXT_NONE,
+                     tcg_gen_shl_tl, tcg_gen_shl_tl, NULL);
 }
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
@@ -317,12 +321,12 @@ static bool trans_xor(DisasContext *ctx, arg_xor *a)
 
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
 {
-    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
+    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl, tcg_gen_shr_tl, NULL);
 }
 
 static bool trans_sra(DisasContext *ctx, arg_sra *a)
 {
-    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
+    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, tcg_gen_sar_tl, NULL);
 }
 
 static bool trans_or(DisasContext *ctx, arg_or *a)
@@ -339,15 +343,14 @@ static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_arith_imm_fn(ctx, a, EXT_NONE,
-                            NULL, tcg_gen_addi_tl, NULL);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, NULL, tcg_gen_addi_tl, NULL);
 }
 
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, NULL, tcg_gen_shli_tl, NULL);
 }
 
 static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
@@ -359,7 +362,7 @@ static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, NULL, gen_srliw, NULL);
 }
 
 static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
@@ -371,7 +374,7 @@ static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_sraiw);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, NULL, gen_sraiw, NULL);
 }
 
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
@@ -392,21 +395,24 @@ static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_shift(ctx, a, EXT_NONE, tcg_gen_shl_tl);
+    return gen_shift(ctx, a, EXT_NONE,
+                     tcg_gen_shl_tl, tcg_gen_shl_tl, NULL);
 }
 
 static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
+    return gen_shift(ctx, a, EXT_ZERO,
+                     NULL, tcg_gen_shr_tl, NULL);
 }
 
 static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
+    return gen_shift(ctx, a, EXT_SIGN,
+                     NULL, tcg_gen_sar_tl, NULL);
 }
 
 static bool trans_fence(DisasContext *ctx, arg_fence *a)
-- 
2.33.0


