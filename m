Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHqxA-00063v-1n
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 09:54:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gHqQr-00048h-SB
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 09:21:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gHqQi-0002PW-V8
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 09:21:12 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:53000)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gHqQY-00029r-Rw; Wed, 31 Oct 2018 09:20:55 -0400
Received: from wormulon.uni-paderborn.de ([131.234.189.22]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 telepax)
	id 1gHqQX-0007BJ-4x; Wed, 31 Oct 2018 14:20:53 +0100
Received: from mail.uni-paderborn.de by wormulon with queue id 2965935-5;
	Wed, 31 Oct 2018 13:20:53 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
Received: from [131.234.87.238] (helo=mustique.hni.uni-paderborn.de)
	by mail.uni-paderborn.de with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89 nylar)
	id 1gHqQX-0005dh-NN; Wed, 31 Oct 2018 14:20:53 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: mjc@sifive.com, sagark@eecs.berkeley.edu, palmer@sifive.com,
	kbastian@mail.uni-paderborn.de, Alistair.Francis@wdc.com
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Date: Wed, 31 Oct 2018 14:19:59 +0100
Message-Id: <20181031132029.4887-6-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.5.2775670, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2018.10.31.131216, AntiVirus-Engine: 5.53.0,
	AntiVirus-Data: 2018.10.10.5530001
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
X-Mailman-Approved-At: Wed, 31 Oct 2018 09:54:25 -0400
Subject: [Qemu-riscv] [PATCH v3 05/35] target/riscv: Convert RV64I
 load/store insns to decodetree
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
X-List-Received-Date: Wed, 31 Oct 2018 13:21:17 -0000

this splits the 64-bit only instructions into its own decode file such
that we generate the decoder for these instructions only for the RISC-V
64 bit target.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/Makefile.objs              |  8 +++++---
 target/riscv/insn64.decode              | 25 +++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.inc.c | 20 ++++++++++++++++++++
 target/riscv/translate.c                |  7 -------
 4 files changed, 50 insertions(+), 10 deletions(-)
 create mode 100644 target/riscv/insn64.decode

diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
index ee995b3fc7..b9b8152cc2 100644
--- a/target/riscv/Makefile.objs
+++ b/target/riscv/Makefile.objs
@@ -2,10 +2,12 @@ obj-y += translate.o op_helper.o cpu_helper.o cpu.o fpu_helper.o gdbstub.o pmp.o
 
 DECODETREE = $(SRC_PATH)/scripts/decodetree.py
 
-target/riscv/decode_insn32.inc.c: \
-  $(SRC_PATH)/target/riscv/insn32.decode $(DECODETREE)
+decode32-y = $(SRC_PATH)/target/riscv/insn32.decode
+decode32-$(TARGET_RISCV64) += $(SRC_PATH)/target/riscv/insn64.decode
+
+target/riscv/decode_insn32.inc.c: $(decode32-y) $(DECODETREE)
 	$(call quiet-command, \
-	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn32 $<, \
+	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn32 $(decode32-y), \
 	  "GEN", $(TARGET_DIR)$@)
 
 target/riscv/translate.o: target/riscv/decode_insn32.inc.c
diff --git a/target/riscv/insn64.decode b/target/riscv/insn64.decode
new file mode 100644
index 0000000000..439d4e2c58
--- /dev/null
+++ b/target/riscv/insn64.decode
@@ -0,0 +1,25 @@
+#
+# RISC-V translation routines for the RV Instruction Set.
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
+# This is concatenated with insn32.decode for risc64 targets.
+# Most of the fields and formats are there.
+
+# *** RV64I Base Instruction Set (in addition to RV32I) ***
+lwu      ............   ..... 110 ..... 0000011 @i
+ld       ............   ..... 011 ..... 0000011 @i
+sd       ....... .....  ..... 011 ..... 0100011 @s
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index f3b88ebb69..39a20a70e8 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -130,3 +130,23 @@ static bool trans_sw(DisasContext *ctx, arg_sw *a)
     gen_store(ctx, OPC_RISC_SW, a->rs1, a->rs2, a->imm);
     return true;
 }
+
+#ifdef TARGET_RISCV64
+static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
+{
+    gen_load(ctx, OPC_RISC_LWU, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_ld(DisasContext *ctx, arg_ld *a)
+{
+    gen_load(ctx, OPC_RISC_LD, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_sd(DisasContext *ctx, arg_sd *a)
+{
+    gen_store(ctx, OPC_RISC_SD, a->rs1, a->rs2, a->imm);
+    return true;
+}
+#endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 909f7cd013..244855c82d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1701,13 +1701,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
     imm = GET_IMM(ctx->opcode);
 
     switch (op) {
-    case OPC_RISC_LOAD:
-        gen_load(ctx, MASK_OP_LOAD(ctx->opcode), rd, rs1, imm);
-        break;
-    case OPC_RISC_STORE:
-        gen_store(ctx, MASK_OP_STORE(ctx->opcode), rs1, rs2,
-                  GET_STORE_IMM(ctx->opcode));
-        break;
     case OPC_RISC_ARITH_IMM:
 #if defined(TARGET_RISCV64)
     case OPC_RISC_ARITH_IMM_W:
-- 
2.19.1


