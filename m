Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1glsW0-00071U-PI
	for mharc-qemu-riscv@gnu.org; Tue, 22 Jan 2019 04:38:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1glsVu-00068S-Is
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 04:38:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1glsNS-0004br-DU
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 04:29:52 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:54908)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1glsNQ-0004aJ-C7; Tue, 22 Jan 2019 04:29:50 -0500
Received: from pova.uni-paderborn.de ([131.234.189.23]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 telepax)
	id 1glsNM-0001r9-5m; Tue, 22 Jan 2019 10:29:44 +0100
Received: from mail.uni-paderborn.de by pova with queue id 3098398-2;
	Tue, 22 Jan 2019 09:29:43 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: sagark@eecs.berkeley.edu, palmer@sifive.com, kbastian@mail.uni-paderborn.de
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>
Date: Tue, 22 Jan 2019 10:28:36 +0100
Message-Id: <20190122092909.5341-3-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190122092909.5341-1-kbastian@mail.uni-paderborn.de>
References: <20190122092909.5341-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.22.92116, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.18.5561000
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH v5 02/35] target/riscv: Activate decodetree and
 implemnt LUI & AUIPC
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
X-List-Received-Date: Tue, 22 Jan 2019 09:38:36 -0000

for now only LUI & AUIPC are decoded and translated. If decodetree fails, we
fall back to the old decoder.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/Makefile.objs              | 10 +++++++
 target/riscv/insn32.decode              | 30 +++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.inc.c | 35 +++++++++++++++++++++++++
 target/riscv/translate.c                | 31 ++++++++++++----------
 4 files changed, 92 insertions(+), 14 deletions(-)
 create mode 100644 target/riscv/insn32.decode
 create mode 100644 target/riscv/insn_trans/trans_rvi.inc.c

diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
index 4072abe3e4..bf0a268033 100644
--- a/target/riscv/Makefile.objs
+++ b/target/riscv/Makefile.objs
@@ -1 +1,11 @@
 obj-y += translate.o op_helper.o cpu_helper.o cpu.o csr.o fpu_helper.o gdbstub.o pmp.o
+
+DECODETREE = $(SRC_PATH)/scripts/decodetree.py
+
+target/riscv/decode_insn32.inc.c: \
+  $(SRC_PATH)/target/riscv/insn32.decode $(DECODETREE)
+	$(call quiet-command, \
+	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn32 $<, \
+	  "GEN", $(TARGET_DIR)$@)
+
+target/riscv/translate.o: target/riscv/decode_insn32.inc.c
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
new file mode 100644
index 0000000000..44d4e922b6
--- /dev/null
+++ b/target/riscv/insn32.decode
@@ -0,0 +1,30 @@
+#
+# RISC-V translation routines for the RVXI Base Integer Instruction Set.
+#
+# Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
+#                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2 or later, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+# You should have received a copy of the GNU General Public License along with
+# this program.  If not, see <http://www.gnu.org/licenses/>.
+
+# Fields:
+%rd        7:5
+
+# immediates:
+%imm_u    12:s20                 !function=ex_shift_12
+
+# Formats 32:
+@u       ....................      ..... .......         imm=%imm_u          %rd
+
+# *** RV32I Base Instruction Set ***
+lui      ....................       ..... 0110111 @u
+auipc    ....................       ..... 0010111 @u
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
new file mode 100644
index 0000000000..9885a8d275
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -0,0 +1,35 @@
+/*
+ * RISC-V translation routines for the RVXI Base Integer Instruction Set.
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
+static bool trans_lui(DisasContext *ctx, arg_lui *a)
+{
+    if (a->rd != 0) {
+        tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm);
+    }
+    return true;
+}
+
+static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
+{
+    if (a->rd != 0) {
+        tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm + ctx->base.pc_next);
+    }
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c4a4d8115c..99829a600d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1677,6 +1677,19 @@ static void decode_RV32_64C(CPURISCVState *env, DisasContext *ctx)
     }
 }
 
+#define EX_SH(amount) \
+    static int ex_shift_##amount(int imm) \
+    {                                         \
+        return imm << amount;                 \
+    }
+EX_SH(12)
+
+bool decode_insn32(DisasContext *ctx, uint32_t insn);
+/* Include the auto-generated decoder for 32 bit insn */
+#include "decode_insn32.inc.c"
+/* Include insn module translation function */
+#include "insn_trans/trans_rvi.inc.c"
+
 static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
 {
     int rs1;
@@ -1697,19 +1710,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
     imm = GET_IMM(ctx->opcode);
 
     switch (op) {
-    case OPC_RISC_LUI:
-        if (rd == 0) {
-            break; /* NOP */
-        }
-        tcg_gen_movi_tl(cpu_gpr[rd], sextract64(ctx->opcode, 12, 20) << 12);
-        break;
-    case OPC_RISC_AUIPC:
-        if (rd == 0) {
-            break; /* NOP */
-        }
-        tcg_gen_movi_tl(cpu_gpr[rd], (sextract64(ctx->opcode, 12, 20) << 12) +
-               ctx->base.pc_next);
-        break;
     case OPC_RISC_JAL:
         imm = GET_JAL_IMM(ctx->opcode);
         gen_jal(env, ctx, rd, imm);
@@ -1810,7 +1810,10 @@ static void decode_opc(DisasContext *ctx)
         }
     } else {
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
-        decode_RV32_64G(ctx->env, ctx);
+        if (!decode_insn32(ctx, ctx->opcode)) {
+            /* fallback to old decoder */
+            decode_RV32_64G(ctx->env, ctx);
+        }
     }
 }
 
-- 
2.20.1


