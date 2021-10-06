Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEU5-0008MD-8X
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETj-00080n-5b; Wed, 06 Oct 2021 17:29:31 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETf-0007zl-Q1; Wed, 06 Oct 2021 17:29:30 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 336DE41D91;
 Wed,  6 Oct 2021 23:29:26 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 1AB9460067;
 Wed,  6 Oct 2021 23:29:26 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id C7C0214005C;
 Wed,  6 Oct 2021 23:29:25 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 07/27] target/riscv: refactoring calls to gen_arith
Date: Wed,  6 Oct 2021 23:28:13 +0200
Message-Id: <20211006212833.108706-8-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Wed, 06 Oct 2021 21:29:32 -0000

gen_arith now takes three functions instead of one as arguments, one for
each register size.
All call sites changed to use this refactored version, without yet
supporting sizes other than 32 and 64.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/translate.c                | 100 +++++++++++++++++-------
 target/riscv/insn_trans/trans_rvb.c.inc |  17 ++--
 target/riscv/insn_trans/trans_rvi.c.inc |  26 +++---
 target/riscv/insn_trans/trans_rvm.c.inc |  39 ++++++---
 4 files changed, 123 insertions(+), 59 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 86623f81e8..c940698478 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -407,55 +407,97 @@ static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
     return true;
 }
 
+static bool gen_logic(DisasContext *ctx, arg_r *a, DisasExtend ext,
+                      void (*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
+    TCGv src2 = get_gpr(ctx, a->rs2, ext);
+
+    func(dest, src1, src2);
+
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
 static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
-                             void (*func)(TCGv, TCGv, target_long))
+                             void (*fn32)(TCGv, TCGv, target_long),
+                             void (*fn64)(TCGv, TCGv, target_long),
+                             void (*fn128)(TCGv, TCGv, TCGv, TCGv, target_long))
 {
-    TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_gpr(ctx, a->rs1, ext);
+    if (is_32bit(ctx)) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv src1 = get_gpr(ctx, a->rs1, ext);
 
-    func(dest, src1, a->imm);
+        fn32(dest, src1, a->imm);
 
-    gen_set_gpr(ctx, a->rd, dest);
+        gen_set_gpr(ctx, a->rd, dest);
+    } else if (is_64bit(ctx)) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv src1 = get_gpr(ctx, a->rs1, ext);
+
+        fn64(dest, src1, a->imm);
+
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
+        return false;
+    }
     return true;
 }
 
 static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a, DisasExtend ext,
-                             void (*func)(TCGv, TCGv, TCGv))
+                             void (*fn32)(TCGv, TCGv, TCGv),
+                             void (*fn64)(TCGv, TCGv, TCGv),
+                             void (*fn128)(TCGv, TCGv, TCGv, TCGv, TCGv, TCGv))
 {
-    TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_gpr(ctx, a->rs1, ext);
-    TCGv src2 = tcg_constant_tl(a->imm);
+    if (is_32bit(ctx)) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv src1 = get_gpr(ctx, a->rs1, ext);
+        TCGv src2 = tcg_constant_tl(a->imm);
 
-    func(dest, src1, src2);
+        fn32(dest, src1, src2);
 
-    gen_set_gpr(ctx, a->rd, dest);
-    return true;
-}
+        gen_set_gpr(ctx, a->rd, dest);
+    } else if (is_64bit(ctx)) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv src1 = get_gpr(ctx, a->rs1, ext);
+        TCGv src2 = tcg_constant_tl(a->imm);
 
-static bool gen_logic(DisasContext *ctx, arg_r *a, DisasExtend ext,
-                      void (*func)(TCGv, TCGv, TCGv))
-{
-    TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_gpr(ctx, a->rs1, ext);
-    TCGv src2 = get_gpr(ctx, a->rs2, ext);
-
-    func(dest, src1, src2);
-
-    gen_set_gpr(ctx, a->rd, dest);
+        fn64(dest, src1, src2);
 
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
+        return false;
+    }
     return true;
 }
 
 static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
-                      void (*func)(TCGv, TCGv, TCGv))
+                      void (*fn32)(TCGv, TCGv, TCGv),
+                      void (*fn64)(TCGv, TCGv, TCGv),
+                      void (*fn128)(TCGv, TCGv, TCGv, TCGv, TCGv, TCGv))
 {
-    TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_gpr(ctx, a->rs1, ext);
-    TCGv src2 = get_gpr(ctx, a->rs2, ext);
 
-    func(dest, src1, src2);
+    if (is_32bit(ctx)) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv src1 = get_gpr(ctx, a->rs1, ext);
+        TCGv src2 = get_gpr(ctx, a->rs2, ext);
 
-    gen_set_gpr(ctx, a->rd, dest);
+        fn32(dest, src1, src2);
+
+        gen_set_gpr(ctx, a->rd, dest);
+    } else if (is_64bit(ctx)) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv src1 = get_gpr(ctx, a->rs1, ext);
+        TCGv src2 = get_gpr(ctx, a->rs2, ext);
+
+        fn64(dest, src1, src2);
+
+        gen_set_gpr(ctx, a->rd, dest);
+    } else {
+        return false;
+    }
     return true;
 }
 
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 326d9939a0..fef239eed9 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -108,25 +108,25 @@ static bool trans_packh(DisasContext *ctx, arg_packh *a)
 static bool trans_min(DisasContext *ctx, arg_min *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smin_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smin_tl, tcg_gen_smin_tl, NULL);
 }
 
 static bool trans_max(DisasContext *ctx, arg_max *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smax_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smax_tl, tcg_gen_smax_tl, NULL);
 }
 
 static bool trans_minu(DisasContext *ctx, arg_minu *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umin_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umin_tl, tcg_gen_umin_tl, NULL);
 }
 
 static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umax_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umax_tl, tcg_gen_umax_tl, NULL);
 }
 
 static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
@@ -340,7 +340,8 @@ GEN_SHADD(3)
 static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
 {                                                                          \
     REQUIRE_EXT(ctx, RVB);                                                 \
-    return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add);                \
+    return gen_arith(ctx, a, EXT_NONE,                                     \
+           gen_sh##SHAMT##add, gen_sh##SHAMT##add, NULL);                  \
 }
 
 GEN_TRANS_SHADD(1)
@@ -615,7 +616,9 @@ static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
 {                                                             \
     REQUIRE_64BIT(ctx);                                       \
     REQUIRE_EXT(ctx, RVB);                                    \
-    return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add_uw);  \
+    return gen_arith(ctx, a, EXT_NONE,                        \
+                     gen_sh##SHAMT##add_uw,                   \
+                     gen_sh##SHAMT##add_uw, NULL);            \
 }
 
 GEN_TRANS_SHADD_UW(1)
@@ -632,7 +635,7 @@ static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_NONE, gen_add_uw);
+    return gen_arith(ctx, a, EXT_NONE, gen_add_uw, gen_add_uw, NULL);
 }
 
 static void gen_slli_uw(TCGv dest, TCGv src, target_long shamt)
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 844080ec2b..c284dd19b3 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -227,7 +227,8 @@ static bool trans_sd(DisasContext *ctx, arg_sd *a)
 
 static bool trans_addi(DisasContext *ctx, arg_addi *a)
 {
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE,
+                            tcg_gen_addi_tl, tcg_gen_addi_tl, NULL);
 }
 
 static void gen_slt(TCGv ret, TCGv s1, TCGv s2)
@@ -242,12 +243,14 @@ static void gen_sltu(TCGv ret, TCGv s1, TCGv s2)
 
 static bool trans_slti(DisasContext *ctx, arg_slti *a)
 {
-    return gen_arith_imm_tl(ctx, a, EXT_SIGN, gen_slt);
+    return gen_arith_imm_tl(ctx, a, EXT_SIGN,
+                            gen_slt, gen_slt, NULL);
 }
 
 static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 {
-    return gen_arith_imm_tl(ctx, a, EXT_SIGN, gen_sltu);
+    return gen_arith_imm_tl(ctx, a, EXT_SIGN,
+                            gen_sltu, gen_sltu, NULL);
 }
 
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
@@ -282,12 +285,14 @@ static bool trans_srai(DisasContext *ctx, arg_srai *a)
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
 {
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl);
+    return gen_arith(ctx, a, EXT_NONE,
+                     tcg_gen_add_tl, tcg_gen_add_tl, NULL);
 }
 
 static bool trans_sub(DisasContext *ctx, arg_sub *a)
 {
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
+    return gen_arith(ctx, a, EXT_NONE,
+                     tcg_gen_sub_tl, tcg_gen_sub_tl, NULL);
 }
 
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
@@ -297,12 +302,12 @@ static bool trans_sll(DisasContext *ctx, arg_sll *a)
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
 {
-    return gen_arith(ctx, a, EXT_SIGN, gen_slt);
+    return gen_arith(ctx, a, EXT_SIGN, gen_slt, gen_slt, NULL);
 }
 
 static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 {
-    return gen_arith(ctx, a, EXT_SIGN, gen_sltu);
+    return gen_arith(ctx, a, EXT_SIGN, gen_sltu, gen_sltu, NULL);
 }
 
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
@@ -334,7 +339,8 @@ static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE,
+                            NULL, tcg_gen_addi_tl, NULL);
 }
 
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
@@ -372,14 +378,14 @@ static bool trans_addw(DisasContext *ctx, arg_addw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl);
+    return gen_arith(ctx, a, EXT_NONE, NULL, tcg_gen_add_tl, NULL);
 }
 
 static bool trans_subw(DisasContext *ctx, arg_subw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
+    return gen_arith(ctx, a, EXT_NONE, NULL, tcg_gen_sub_tl, NULL);
 }
 
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index b89a85ad3a..0c5f1ba548 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -22,7 +22,8 @@
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
+    return gen_arith(ctx, a, EXT_NONE,
+                     tcg_gen_mul_tl, tcg_gen_mul_tl, NULL);
 }
 
 static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
@@ -36,7 +37,8 @@ static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulh);
+    return gen_arith(ctx, a, EXT_NONE,
+                     gen_mulh, gen_mulh, NULL);
 }
 
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
@@ -57,7 +59,8 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
+    return gen_arith(ctx, a, EXT_NONE,
+                     gen_mulhsu, gen_mulhsu, NULL);
 }
 
 static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
@@ -71,7 +74,8 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
+    return gen_arith(ctx, a, EXT_NONE,
+                     gen_mulhu, gen_mulhu, NULL);
 }
 
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
@@ -110,7 +114,8 @@ static void gen_div(TCGv ret, TCGv source1, TCGv source2)
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_SIGN, gen_div);
+    return gen_arith(ctx, a, EXT_SIGN,
+                     gen_div, gen_div, NULL);
 }
 
 static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
@@ -138,7 +143,8 @@ static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_ZERO, gen_divu);
+    return gen_arith(ctx, a, EXT_ZERO,
+                     gen_divu, gen_divu, NULL);
 }
 
 static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
@@ -179,7 +185,8 @@ static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_SIGN, gen_rem);
+    return gen_arith(ctx, a, EXT_SIGN,
+                     gen_rem, gen_rem, NULL);
 }
 
 static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
@@ -207,7 +214,8 @@ static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_ZERO, gen_remu);
+    return gen_arith(ctx, a, EXT_ZERO,
+                     gen_remu, gen_remu, NULL);
 }
 
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
@@ -215,7 +223,8 @@ static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->w = true;
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
+    return gen_arith(ctx, a, EXT_NONE,
+                     tcg_gen_mul_tl, tcg_gen_mul_tl, NULL);
 }
 
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
@@ -223,7 +232,8 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->w = true;
-    return gen_arith(ctx, a, EXT_SIGN, gen_div);
+    return gen_arith(ctx, a, EXT_SIGN,
+                     gen_div, gen_div, NULL);
 }
 
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
@@ -231,7 +241,8 @@ static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->w = true;
-    return gen_arith(ctx, a, EXT_ZERO, gen_divu);
+    return gen_arith(ctx, a, EXT_ZERO,
+                     gen_divu, gen_divu, NULL);
 }
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
@@ -239,7 +250,8 @@ static bool trans_remw(DisasContext *ctx, arg_remw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->w = true;
-    return gen_arith(ctx, a, EXT_SIGN, gen_rem);
+    return gen_arith(ctx, a, EXT_SIGN,
+                     gen_rem, gen_rem, NULL);
 }
 
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
@@ -247,5 +259,6 @@ static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->w = true;
-    return gen_arith(ctx, a, EXT_ZERO, gen_remu);
+    return gen_arith(ctx, a, EXT_ZERO,
+                     gen_remu, gen_remu, NULL);
 }
-- 
2.33.0


