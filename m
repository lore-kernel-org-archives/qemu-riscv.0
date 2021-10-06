Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEUY-0000EL-Kz
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUD-0008SG-Q1; Wed, 06 Oct 2021 17:30:04 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEU7-00085h-KZ; Wed, 06 Oct 2021 17:30:00 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id E53F041E28;
 Wed,  6 Oct 2021 23:29:32 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id CF62460066;
 Wed,  6 Oct 2021 23:29:32 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 9561B14005C;
 Wed,  6 Oct 2021 23:29:32 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 13/27] target/riscv: rename a few gen function helpers
Date: Wed,  6 Oct 2021 23:28:19 +0200
Message-Id: <20211006212833.108706-14-frederic.petrot@univ-grenoble-alpes.fr>
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

Add the tl suffix to the existing integer gen_xxx functions that apply to
target_long types for which a 128-bit version will also exist, so
that it is immediately visible which function is for which type(s).

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 34 ++++++++++++++++---------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 9e5782d1f5..ab85693364 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -136,7 +136,7 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
     return gen_branch(ctx, a, TCG_COND_GEU);
 }
 
-static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
+static bool gen_load_tl(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
     TCGv dest = dest_gpr(ctx, a->rd);
     TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
@@ -152,6 +152,11 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
     return true;
 }
 
+static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
+{
+    return gen_load_tl(ctx, a, memop);
+}
+
 static bool trans_lb(DisasContext *ctx, arg_lb *a)
 {
     return gen_load(ctx, a, MO_SB);
@@ -189,7 +194,7 @@ static bool trans_ld(DisasContext *ctx, arg_ld *a)
     return gen_load(ctx, a, MO_TEQ);
 }
 
-static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
+static bool gen_store_tl(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
     TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
     TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
@@ -204,6 +209,11 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
     return true;
 }
 
+static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
+{
+    return gen_store_tl(ctx, a, memop);
+}
+
 static bool trans_sb(DisasContext *ctx, arg_sb *a)
 {
     return gen_store(ctx, a, MO_SB);
@@ -231,12 +241,12 @@ static bool trans_addi(DisasContext *ctx, arg_addi *a)
                             tcg_gen_addi_tl, tcg_gen_addi_tl, NULL);
 }
 
-static void gen_slt(TCGv ret, TCGv s1, TCGv s2)
+static void gen_slt_tl(TCGv ret, TCGv s1, TCGv s2)
 {
     tcg_gen_setcond_tl(TCG_COND_LT, ret, s1, s2);
 }
 
-static void gen_sltu(TCGv ret, TCGv s1, TCGv s2)
+static void gen_sltu_tl(TCGv ret, TCGv s1, TCGv s2)
 {
     tcg_gen_setcond_tl(TCG_COND_LTU, ret, s1, s2);
 }
@@ -244,13 +254,13 @@ static void gen_sltu(TCGv ret, TCGv s1, TCGv s2)
 static bool trans_slti(DisasContext *ctx, arg_slti *a)
 {
     return gen_arith_imm_tl(ctx, a, EXT_SIGN,
-                            gen_slt, gen_slt, NULL);
+                            gen_slt_lt, gen_slt_lt, NULL);
 }
 
 static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 {
     return gen_arith_imm_tl(ctx, a, EXT_SIGN,
-                            gen_sltu, gen_sltu, NULL);
+                            gen_sltu_lt, gen_sltu_lt, NULL);
 }
 
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
@@ -306,12 +316,12 @@ static bool trans_sll(DisasContext *ctx, arg_sll *a)
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
 {
-    return gen_arith(ctx, a, EXT_SIGN, gen_slt, gen_slt, NULL);
+    return gen_arith(ctx, a, EXT_SIGN, gen_slt_lt, gen_slt_lt, NULL);
 }
 
 static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 {
-    return gen_arith(ctx, a, EXT_SIGN, gen_sltu, gen_sltu, NULL);
+    return gen_arith(ctx, a, EXT_SIGN, gen_sltu_lt, gen_sltu_lt, NULL);
 }
 
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
@@ -353,7 +363,7 @@ static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
     return gen_shift_imm_fn(ctx, a, EXT_NONE, NULL, tcg_gen_shli_tl, NULL);
 }
 
-static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
+static void gen_srliw_tl(TCGv dst, TCGv src, target_long shamt)
 {
     tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
 }
@@ -362,10 +372,10 @@ static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, NULL, gen_srliw, NULL);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, NULL, gen_srliw_tl, NULL);
 }
 
-static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
+static void gen_sraiw_tl(TCGv dst, TCGv src, target_long shamt)
 {
     tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
 }
@@ -374,7 +384,7 @@ static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, NULL, gen_sraiw, NULL);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, NULL, gen_sraiw_tl, NULL);
 }
 
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
-- 
2.33.0


