Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mclje-0000aa-72
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 05:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljW-0000SU-K9; Tue, 19 Oct 2021 05:48:36 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:54784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljT-0006W3-R1; Tue, 19 Oct 2021 05:48:33 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 56CA041F73;
 Tue, 19 Oct 2021 11:48:28 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 3EC2B601E2;
 Tue, 19 Oct 2021 11:48:28 +0200 (CEST)
Received: from palmier.u-ga.fr (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 2373D14005A;
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
Subject: [PATCH v3 09/21] target/riscv: moving some insns close to similar
 insns
Date: Tue, 19 Oct 2021 11:48:00 +0200
Message-Id: <20211019094812.614056-10-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Tue, 19 Oct 2021 09:48:37 -0000

lwu and ld are functionally close to the other loads, but were after the
stores in the source file.
Similarly, xor was away from or and and by two arithmetic functions, while
the immediate versions were nicely put together.
This patch moves the aforementioned loads after lhu, and xor above or,
where they more logically belong.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 34 ++++++++++++-------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index ed138f748e..5c2a117a70 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -175,6 +175,18 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
     return gen_load(ctx, a, MO_TEUW);
 }
 
+static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_load(ctx, a, MO_TEUL);
+}
+
+static bool trans_ld(DisasContext *ctx, arg_ld *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_load(ctx, a, MO_TEQ);
+}
+
 static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
     TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
@@ -205,18 +217,6 @@ static bool trans_sw(DisasContext *ctx, arg_sw *a)
     return gen_store(ctx, a, MO_TESL);
 }
 
-static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
-{
-    REQUIRE_64BIT(ctx);
-    return gen_load(ctx, a, MO_TEUL);
-}
-
-static bool trans_ld(DisasContext *ctx, arg_ld *a)
-{
-    REQUIRE_64BIT(ctx);
-    return gen_load(ctx, a, MO_TEQ);
-}
-
 static bool trans_sd(DisasContext *ctx, arg_sd *a)
 {
     REQUIRE_64BIT(ctx);
@@ -315,11 +315,6 @@ static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
     return gen_arith(ctx, a, EXT_SIGN, gen_sltu);
 }
 
-static bool trans_xor(DisasContext *ctx, arg_xor *a)
-{
-    return gen_logic(ctx, a, EXT_NONE, tcg_gen_xor_tl);
-}
-
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
 {
     return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
@@ -330,6 +325,11 @@ static bool trans_sra(DisasContext *ctx, arg_sra *a)
     return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
 }
 
+static bool trans_xor(DisasContext *ctx, arg_xor *a)
+{
+    return gen_logic(ctx, a, EXT_NONE, tcg_gen_xor_tl);
+}
+
 static bool trans_or(DisasContext *ctx, arg_or *a)
 {
     return gen_logic(ctx, a, EXT_NONE, tcg_gen_or_tl);
-- 
2.33.0


