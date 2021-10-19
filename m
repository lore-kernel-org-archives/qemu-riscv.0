Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mclju-000154-0Z
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 05:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljq-0000rA-RI; Tue, 19 Oct 2021 05:48:54 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:54848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljo-0006YD-9J; Tue, 19 Oct 2021 05:48:54 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id CEF0E4202A;
 Tue, 19 Oct 2021 11:48:28 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id B48A0601D5;
 Tue, 19 Oct 2021 11:48:28 +0200 (CEST)
Received: from palmier.u-ga.fr (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 8F03D14005D;
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
Subject: [PATCH v3 12/21] target/riscv: support for 128-bit U-type instructions
Date: Tue, 19 Oct 2021 11:48:03 +0200
Message-Id: <20211019094812.614056-13-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Tue, 19 Oct 2021 09:48:55 -0000

Adding the 128-bit version of lui and auipc.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 92f41f3a86..b5e292a2aa 100644
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
+        if (get_xl_max(ctx) == MXL_RV128) {
+            tcg_gen_movi_tl(cpu_gprh[a->rd], -(a->imm < 0));
+        }
     }
     return true;
 }
@@ -41,7 +44,19 @@ static bool trans_lui(DisasContext *ctx, arg_lui *a)
 static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
 {
     if (a->rd != 0) {
+        if (get_xl_max(ctx) == MXL_RV128) {
+            /* TODO : when pc is 128 bits, use all its bits */
+            TCGv pc = tcg_constant_tl(ctx->base.pc_next),
+                 imml = tcg_constant_tl(a->imm),
+                 immh = tcg_constant_tl(-(a->imm < 0)),
+                 zero = tcg_constant_tl(0);
+            tcg_gen_add2_tl(cpu_gpr[a->rd], cpu_gprh[a->rd],
+                            pc, zero,
+                            imml, immh);
+            return true;
+        }
         tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm + ctx->base.pc_next);
+        return true;
     }
     return true;
 }
-- 
2.33.0


