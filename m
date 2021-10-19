Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcljv-0001C7-J8
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 05:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljq-0000pi-Gc; Tue, 19 Oct 2021 05:48:54 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:54846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljn-0006YC-CX; Tue, 19 Oct 2021 05:48:54 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id A0F3A42023;
 Tue, 19 Oct 2021 11:48:28 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 8B6BC601D5;
 Tue, 19 Oct 2021 11:48:28 +0200 (CEST)
Received: from palmier.u-ga.fr (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 66E6314005A;
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
Subject: [PATCH v3 11/21] target/riscv: support for 128-bit bitwise
 instructions
Date: Tue, 19 Oct 2021 11:48:02 +0200
Message-Id: <20211019094812.614056-12-frederic.petrot@univ-grenoble-alpes.fr>
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

The 128-bit bitwise instructions do not need any function prototype change
as the functions can be applied independently on the lower and upper part of
the registers.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/translate.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e8f08f921e..71982f6284 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -429,6 +429,17 @@ static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
 
     gen_set_gpr(ctx, a->rd, dest);
 
+    if (get_xl_max(ctx) == MXL_RV128) {
+        if (get_ol(ctx) ==  MXL_RV128) {
+            uint64_t immh = -(a->imm < 0);
+            src1 = get_gprh(ctx, a->rs1);
+            dest = dest_gprh(ctx, a->rd);
+
+            func(dest, src1, immh);
+        }
+        gen_set_gprh(ctx, a->rd, dest);
+    }
+
     return true;
 }
 
@@ -443,6 +454,17 @@ static bool gen_logic(DisasContext *ctx, arg_r *a, DisasExtend ext,
 
     gen_set_gpr(ctx, a->rd, dest);
 
+    if (get_xl_max(ctx) == MXL_RV128) {
+        if (get_ol(ctx) ==  MXL_RV128) {
+            dest = dest_gprh(ctx, a->rd);
+            src1 = get_gprh(ctx, a->rs1);
+            src2 = get_gprh(ctx, a->rs2);
+
+            func(dest, src1, src2);
+        }
+        gen_set_gprh(ctx, a->rd, dest);
+    }
+
     return true;
 }
 
-- 
2.33.0


