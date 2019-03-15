Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4nSw-0003ep-PM
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 10:05:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1h4nSr-0002vO-CN
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 10:05:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1h4nFl-0000tZ-OU
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:52:06 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:43052)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1h4nFj-0000jN-RI; Fri, 15 Mar 2019 09:52:04 -0400
Received: from pova.uni-paderborn.de ([131.234.189.23]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 nylar)
	id 1h4nFR-0003FZ-OO; Fri, 15 Mar 2019 14:51:45 +0100
Received: from mail.uni-paderborn.de by pova with queue id 3209400-2;
	Fri, 15 Mar 2019 13:51:44 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, palmer@sifive.com,
	kbastian@mail.uni-paderborn.de
Cc: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 15 Mar 2019 14:51:40 +0100
Message-Id: <20190315135140.10507-1-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.3.15.134216, AntiVirus-Engine: 5.58.0,
	AntiVirus-Data: 2019.2.22.5580002
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH] target/riscv: Fix manually parsed 16 bit insn
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Mar 2019 14:05:38 -0000

during the refactor to decodetree we removed the manual decoding that is
necessary for c.jal/c.addiw and removed the translation of c.flw/c.ld
and c.fsw/c.sd. This reintroduces the manual parsing and the
omited implementation.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/riscv/insn_trans/trans_rvc.inc.c | 30 ++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvc.inc.c b/target/riscv/insn_trans/trans_rvc.inc.c
index bcdf64d3b7..5819f53f90 100644
--- a/target/riscv/insn_trans/trans_rvc.inc.c
+++ b/target/riscv/insn_trans/trans_rvc.inc.c
@@ -44,10 +44,19 @@ static bool trans_c_flw_ld(DisasContext *ctx, arg_c_flw_ld *a)
 {
 #ifdef TARGET_RISCV32
     /* C.FLW ( RV32FC-only ) */
-    return false;
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    arg_c_lw tmp;
+    decode_insn16_extract_cl_w(&tmp, ctx->opcode);
+    arg_flw arg = { .rd = tmp.rd, .rs1 = tmp.rs1, .imm = tmp.uimm };
+    return trans_flw(ctx, &arg);
 #else
     /* C.LD ( RV64C/RV128C-only ) */
-    return false;
+    arg_c_fld tmp;
+    decode_insn16_extract_cl_d(&tmp, ctx->opcode);
+    arg_ld arg = { .rd = tmp.rd, .rs1 = tmp.rs1, .imm = tmp.uimm };
+    return trans_ld(ctx, &arg);
 #endif
 }
 
@@ -67,10 +76,19 @@ static bool trans_c_fsw_sd(DisasContext *ctx, arg_c_fsw_sd *a)
 {
 #ifdef TARGET_RISCV32
     /* C.FSW ( RV32FC-only ) */
-    return false;
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    arg_c_sw tmp;
+    decode_insn16_extract_cs_w(&tmp, ctx->opcode);
+    arg_fsw arg = { .rs1 = tmp.rs1, .rs2 = tmp.rs2, .imm = tmp.uimm };
+    return trans_fsw(ctx, &arg);
 #else
     /* C.SD ( RV64C/RV128C-only ) */
-    return false;
+    arg_c_fsd tmp;
+    decode_insn16_extract_cs_d(&tmp, ctx->opcode);
+    arg_sd arg = { .rs1 = tmp.rs1, .rs2 = tmp.rs2, .imm = tmp.uimm };
+    return trans_sd(ctx, &arg);
 #endif
 }
 
@@ -88,7 +106,9 @@ static bool trans_c_jal_addiw(DisasContext *ctx, arg_c_jal_addiw *a)
 {
 #ifdef TARGET_RISCV32
     /* C.JAL */
-    arg_jal arg = { .rd = 1, .imm = a->imm };
+    arg_c_j tmp;
+    decode_insn16_extract_cj(&tmp, ctx->opcode);
+    arg_jal arg = { .rd = 1, .imm = tmp.imm };
     return trans_jal(ctx, &arg);
 #else
     /* C.ADDIW */
-- 
2.21.0


