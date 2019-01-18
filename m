Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkU0o-0005bv-Qt
	for mharc-qemu-riscv@gnu.org; Fri, 18 Jan 2019 08:16:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gkU0c-0005R2-FY
	for qemu-riscv@nongnu.org; Fri, 18 Jan 2019 08:16:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gkU0L-00085x-Ml
	for qemu-riscv@nongnu.org; Fri, 18 Jan 2019 08:16:23 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:53516)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gkU0B-0006WH-D6; Fri, 18 Jan 2019 08:16:04 -0500
Received: from wormulon.uni-paderborn.de ([131.234.189.22]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 hoth)
	id 1gkTzQ-0001rT-QU; Fri, 18 Jan 2019 14:15:16 +0100
Received: from mail.uni-paderborn.de by wormulon with queue id 3093575-5;
	Fri, 18 Jan 2019 13:15:14 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com,
	kbastian@mail.uni-paderborn.de
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	richard.henderson@linaro.org, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>
Date: Fri, 18 Jan 2019 14:14:30 +0100
Message-Id: <20190118131456.32451-10-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
References: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.18.130316, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.18.5561000
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH v4 09/35] target/riscv: Convert RVXM insns to
 decodetree
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
X-List-Received-Date: Fri, 18 Jan 2019 13:16:32 -0000

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn32-64.decode           |   7 ++
 target/riscv/insn32.decode              |  10 +++
 target/riscv/insn_trans/trans_rvm.inc.c | 100 ++++++++++++++++++++++++
 target/riscv/translate.c                |  10 +--
 4 files changed, 118 insertions(+), 9 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvm.inc.c

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 9a35f2aa19..008f100546 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -36,3 +36,10 @@ subw     0100000 .....  ..... 000 ..... 0111011 @r
 sllw     0000000 .....  ..... 001 ..... 0111011 @r
 srlw     0000000 .....  ..... 101 ..... 0111011 @r
 sraw     0100000 .....  ..... 101 ..... 0111011 @r
+
+# *** RV64M Standard Extension (in addition to RV32M) ***
+mulw     0000001 .....  ..... 000 ..... 0111011 @r
+divw     0000001 .....  ..... 100 ..... 0111011 @r
+divuw    0000001 .....  ..... 101 ..... 0111011 @r
+remw     0000001 .....  ..... 110 ..... 0111011 @r
+remuw    0000001 .....  ..... 111 ..... 0111011 @r
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 977b1b10a3..e53944bf0e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -92,3 +92,13 @@ csrrc    ............     ..... 011 ..... 1110011 @csr
 csrrwi   ............     ..... 101 ..... 1110011 @csr
 csrrsi   ............     ..... 110 ..... 1110011 @csr
 csrrci   ............     ..... 111 ..... 1110011 @csr
+
+# *** RV32M Standard Extension ***
+mul      0000001 .....  ..... 000 ..... 0110011 @r
+mulh     0000001 .....  ..... 001 ..... 0110011 @r
+mulhsu   0000001 .....  ..... 010 ..... 0110011 @r
+mulhu    0000001 .....  ..... 011 ..... 0110011 @r
+div      0000001 .....  ..... 100 ..... 0110011 @r
+divu     0000001 .....  ..... 101 ..... 0110011 @r
+rem      0000001 .....  ..... 110 ..... 0110011 @r
+remu     0000001 .....  ..... 111 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvm.inc.c b/target/riscv/insn_trans/trans_rvm.inc.c
new file mode 100644
index 0000000000..ec3197ede8
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvm.inc.c
@@ -0,0 +1,100 @@
+/*
+ * RISC-V translation routines for the RV64M Standard Extension.
+ *
+ * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
+ * Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
+ *                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+
+static bool trans_mul(DisasContext *ctx, arg_mul *a)
+{
+    gen_arith(ctx, OPC_RISC_MUL, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
+{
+    gen_arith(ctx, OPC_RISC_MULH, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
+{
+    gen_arith(ctx, OPC_RISC_MULHSU, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
+{
+    gen_arith(ctx, OPC_RISC_MULHU, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_div(DisasContext *ctx, arg_div *a)
+{
+    gen_arith(ctx, OPC_RISC_DIV, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_divu(DisasContext *ctx, arg_divu *a)
+{
+    gen_arith(ctx, OPC_RISC_DIVU, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_rem(DisasContext *ctx, arg_rem *a)
+{
+    gen_arith(ctx, OPC_RISC_REM, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_remu(DisasContext *ctx, arg_remu *a)
+{
+    gen_arith(ctx, OPC_RISC_REMU, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+#ifdef TARGET_RISCV64
+static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
+{
+    gen_arith(ctx, OPC_RISC_MULW, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_divw(DisasContext *ctx, arg_divw *a)
+{
+    gen_arith(ctx, OPC_RISC_DIVW, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
+{
+    gen_arith(ctx, OPC_RISC_DIVUW, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_remw(DisasContext *ctx, arg_remw *a)
+{
+    gen_arith(ctx, OPC_RISC_REMW, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
+{
+    gen_arith(ctx, OPC_RISC_REMUW, a->rd, a->rs1, a->rs2);
+    return true;
+}
+#endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a020305556..666c039662 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1649,6 +1649,7 @@ bool decode_insn32(DisasContext *ctx, uint32_t insn);
 #include "decode_insn32.inc.c"
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.inc.c"
+#include "insn_trans/trans_rvm.inc.c"
 
 static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
 {
@@ -1670,15 +1671,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
     imm = GET_IMM(ctx->opcode);
 
     switch (op) {
-    case OPC_RISC_ARITH:
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_ARITH_W:
-#endif
-        if (rd == 0) {
-            break; /* NOP */
-        }
-        gen_arith(ctx, MASK_OP_ARITH(ctx->opcode), rd, rs1, rs2);
-        break;
     case OPC_RISC_FP_LOAD:
         gen_fp_load(ctx, MASK_OP_FP_LOAD(ctx->opcode), rd, rs1, imm);
         break;
-- 
2.20.1


