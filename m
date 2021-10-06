Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYETz-0008Hz-MV
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETh-0007ya-86; Wed, 06 Oct 2021 17:29:29 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETe-0007yq-OE; Wed, 06 Oct 2021 17:29:28 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 2511F412F4;
 Wed,  6 Oct 2021 23:29:25 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 0E37160066;
 Wed,  6 Oct 2021 23:29:25 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id C478D14005C;
 Wed,  6 Oct 2021 23:29:24 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 06/27] target/riscv: separation of bitwise logic and
 aritmetic helpers
Date: Wed,  6 Oct 2021 23:28:12 +0200
Message-Id: <20211006212833.108706-7-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Wed, 06 Oct 2021 21:29:29 -0000

Introduction of a gen_logic function for bitwise logic to implement
instructions in which not propagation of information occurs between bits and
use of this function on the bitwise instructions.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/translate.c                | 27 +++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 16 +++++++--------
 target/riscv/insn_trans/trans_rvi.c.inc | 12 +++++------
 3 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 96a1e40606..86623f81e8 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -394,6 +394,19 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode-insn32.c.inc"
 
+static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
+                             void (*func)(TCGv, TCGv, target_long))
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
+
+    func(dest, src1, a->imm);
+
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
 static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
                              void (*func)(TCGv, TCGv, target_long))
 {
@@ -419,6 +432,20 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a, DisasExtend ext,
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
 static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
                       void (*func)(TCGv, TCGv, TCGv))
 {
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index b72e76255c..326d9939a0 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -49,19 +49,19 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_andc_tl);
+    return gen_logic(ctx, a, EXT_NONE, tcg_gen_andc_tl);
 }
 
 static bool trans_orn(DisasContext *ctx, arg_orn *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_orc_tl);
+    return gen_logic(ctx, a, EXT_NONE, tcg_gen_orc_tl);
 }
 
 static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_eqv_tl);
+    return gen_logic(ctx, a, EXT_NONE, tcg_gen_eqv_tl);
 }
 
 static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
@@ -74,7 +74,7 @@ static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_pack(DisasContext *ctx, arg_pack *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_NONE, gen_pack);
+    return gen_logic(ctx, a, EXT_NONE, gen_pack);
 }
 
 static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
@@ -88,7 +88,7 @@ static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_packu(DisasContext *ctx, arg_packu *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_NONE, gen_packu);
+    return gen_logic(ctx, a, EXT_NONE, gen_packu);
 }
 
 static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
@@ -102,7 +102,7 @@ static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_packh(DisasContext *ctx, arg_packh *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_NONE, gen_packh);
+    return gen_logic(ctx, a, EXT_NONE, gen_packh);
 }
 
 static bool trans_min(DisasContext *ctx, arg_min *a)
@@ -393,7 +393,7 @@ static bool trans_packw(DisasContext *ctx, arg_packw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_NONE, gen_packw);
+    return gen_logic(ctx, a, EXT_NONE, gen_packw);
 }
 
 static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
@@ -409,7 +409,7 @@ static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, EXT_NONE, gen_packuw);
+    return gen_logic(ctx, a, EXT_NONE, gen_packuw);
 }
 
 static bool trans_bsetw(DisasContext *ctx, arg_bsetw *a)
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 920ae0edb3..844080ec2b 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -252,17 +252,17 @@ static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
 {
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_xori_tl);
+    return gen_logic_imm_fn(ctx, a, EXT_NONE, tcg_gen_xori_tl);
 }
 
 static bool trans_ori(DisasContext *ctx, arg_ori *a)
 {
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_ori_tl);
+    return gen_logic_imm_fn(ctx, a, EXT_NONE, tcg_gen_ori_tl);
 }
 
 static bool trans_andi(DisasContext *ctx, arg_andi *a)
 {
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_andi_tl);
+    return gen_logic_imm_fn(ctx, a, EXT_NONE, tcg_gen_andi_tl);
 }
 
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
@@ -307,7 +307,7 @@ static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
 {
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_xor_tl);
+    return gen_logic(ctx, a, EXT_NONE, tcg_gen_xor_tl);
 }
 
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
@@ -322,12 +322,12 @@ static bool trans_sra(DisasContext *ctx, arg_sra *a)
 
 static bool trans_or(DisasContext *ctx, arg_or *a)
 {
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_or_tl);
+    return gen_logic(ctx, a, EXT_NONE, tcg_gen_or_tl);
 }
 
 static bool trans_and(DisasContext *ctx, arg_and *a)
 {
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_and_tl);
+    return gen_logic(ctx, a, EXT_NONE, tcg_gen_and_tl);
 }
 
 static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
-- 
2.33.0


