Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq2l-0002mT-ON
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:50:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq2i-0002h2-GP
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq2g-0001ok-E2
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:08 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39270)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq2e-0001gJ-8k
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:06 -0500
Received: by mail-pg1-x529.google.com with SMTP id h8so11537256pgp.6
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=o+7km63cYg7dc+TWhtpqn/foqlwh7bTh9e67m4VO3lo=;
	b=K/jCsVxP+06QJ7cmPfO0hPooZwUEu2G7s8J2mlvTAlU1M0o+AAJ4sPeZy6jZ4ZaCEd
	++JTAx8/7LONmFerEQw6YcTsNtO56jl71v/8k+Npl5aYHBYHuQMKvW3HJ9FNjiWWM52P
	AkKZbHEZz9+lMVdzWu0G7CkO3m+J4ol2PpSuR2vmGKAb969NTM4fIiMiMUQ+1jYfcv1M
	dc4qYf3/gWyEVWp9AalCB422pZLYqHprDpfrAgv3Q/XihBnQ4rX7SuY9FTqMCaY1gTx2
	Px7FAm6B1MBDU4WeN4KrHDmGJkGoqHj+RMNckOV7pgN7Bs2Peq0AovEO/+GjSMX9badD
	TqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=o+7km63cYg7dc+TWhtpqn/foqlwh7bTh9e67m4VO3lo=;
	b=EcP+p9tTMnxLyvUiEgyz3yQXPC0Uaw/oQvVnzsuZCNbxpPnODL/MrVIiqNqrF/Lg/a
	omy0XNeB+4w7H50EwA+CAm+M8J/svSlmf/J4xDShGTzeKqeUN/nCzeStr8rxAMhM0uH2
	QXPmukR/3/hvcHXRtLD0q38P3XDqH9x1UspbVQoj6ElZJMtv7MsdQE9F5oSVSBzEInVZ
	PvGyy7XOs+lNtbkJe7K+/mGh1K7umtokckn0KEKTSx6Gl6EyopPQC3/VNHKtfedQcuXd
	IOthsYzUoDt2JvWwIKA13tgX5hH8hNiTZeQkZ9rYMR5FBpyHUPm30SH7whuxiU2c7JHJ
	8hWg==
X-Gm-Message-State: AHQUAuZ/cxQ/m0zoSWDny4QRntsS+cebbAK5aaW3lBZFXKeRUHtXoyLV
	VKtsV36aEcMUOcAeOmVh/qouRgT27ZI=
X-Google-Smtp-Source: AHgI3Iayw2NI/COvM7dEyrxb737JiqYAyNoLKFIY+vQYMtA7JXgHgptBi9TE0CHHwPT+w8UEEOrA+g==
X-Received: by 2002:aa7:9289:: with SMTP id j9mr7933994pfa.130.1551477003153; 
	Fri, 01 Mar 2019 13:50:03 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	y22sm27846354pfn.136.2019.03.01.13.50.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:02 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:15 -0800
Message-Id: <20190301214945.4353-5-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190301214945.4353-1-palmer@sifive.com>
References: <20190301214945.4353-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::529
Subject: [Qemu-riscv] [PULL 04/34] target/riscv: Convert RV64I load/store
 insns to decodetree
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
X-List-Received-Date: Fri, 01 Mar 2019 21:50:10 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

this splits the 64-bit only instructions into its own decode file such
that we generate the decoder for these instructions only for the RISC-V
64 bit target.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/Makefile.objs              |  8 +++++---
 target/riscv/insn32-64.decode           | 25 +++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.inc.c | 20 ++++++++++++++++++++
 target/riscv/translate.c                |  7 -------
 4 files changed, 50 insertions(+), 10 deletions(-)
 create mode 100644 target/riscv/insn32-64.decode

diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
index bf0a268033a0..05087a91bb85 100644
--- a/target/riscv/Makefile.objs
+++ b/target/riscv/Makefile.objs
@@ -2,10 +2,12 @@ obj-y += translate.o op_helper.o cpu_helper.o cpu.o csr.o fpu_helper.o gdbstub.o
 
 DECODETREE = $(SRC_PATH)/scripts/decodetree.py
 
-target/riscv/decode_insn32.inc.c: \
-  $(SRC_PATH)/target/riscv/insn32.decode $(DECODETREE)
+decode32-y = $(SRC_PATH)/target/riscv/insn32.decode
+decode32-$(TARGET_RISCV64) += $(SRC_PATH)/target/riscv/insn32-64.decode
+
+target/riscv/decode_insn32.inc.c: $(decode32-y) $(DECODETREE)
 	$(call quiet-command, \
-	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn32 $<, \
+	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn32 $(decode32-y), \
 	  "GEN", $(TARGET_DIR)$@)
 
 target/riscv/translate.o: target/riscv/decode_insn32.inc.c
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
new file mode 100644
index 000000000000..439d4e2c587b
--- /dev/null
+++ b/target/riscv/insn32-64.decode
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
index d13b7b2b6d8f..61f708dba144 100644
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
index fb284a5e08d6..2e35142ca2a4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1908,13 +1908,6 @@ static void decode_RV32_64G(DisasContext *ctx)
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
2.18.1


