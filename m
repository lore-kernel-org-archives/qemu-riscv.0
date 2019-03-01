Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq2p-0002rO-R6
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:50:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq2h-0002gr-69
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq2e-0001kr-Vv
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:07 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:47069)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq2d-0001aM-Ke
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:04 -0500
Received: by mail-pf1-x434.google.com with SMTP id g6so12005930pfh.13
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=EMyDDf5d5XrXAV5l8TOTa7/D/r2LPeMAptjREHgh7js=;
	b=YFNQdwisjLFCrs5EkznBXtvvJmKQNVMi57Ji/9Ib/SngiRN7UfW9JsFkF3HqmgO6cm
	AQ5SjBpn2cuheDmTz1Ipywq8emQxArjl1/VsUSgmOFC6zw/qBGIoA94f5NHQgSMu7CB+
	CjS0YtcZnY42hBfgLQKRUwYdprd1CDaWKNXWzCmuB3bFsmKYOV0CtW5scXKGP2B2PVbz
	aYVa3jqUq5X6KDP5lEgT26gWWiaSnaEscChn21AqiLOcT9Bu4YQEa45FTu+An+CWJE8m
	aBAySkZlIye+3ex4ZlS3pARWRczxgXMLHceo/W0RZfMtsavoYagUZ+rjXfOd9SqLH0mp
	Yvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=EMyDDf5d5XrXAV5l8TOTa7/D/r2LPeMAptjREHgh7js=;
	b=MjGj9RLsfJINpDUsATtWffeLJE/yXUPKFMLMD1//0UjHNCGW73e8aPTEOGMji5BRhq
	xkJwni7/AbkoxCCx65xqp19ALuGVPi3ECsOgSNGfwdPrA7Gpx9PunXZb9G7pqUv1M7Ml
	rEEfnddrFGodwsXaXI/ry/MkDAQt8IAozgqXagG022Dd2+iSaLCAwthWTgjdTx9K3ks3
	urTDZQzERgrKAAmhZCX5RKvKzOKc+TYsOGXth1cuh3gUuNH/N1GazoY3DkSUv1/d+Ae9
	cXQEBGtIKYf1RmM/o6mC5qa03wjkVoHQPQIwU6C3O8yIVNwQftVCJoE4Pg+9IoWZ31K2
	Na/A==
X-Gm-Message-State: APjAAAVQfsP9AbjBFwPGuYwxqlTRQ2bKS5njS9UGJNbeyb84XLItNX3/
	bzJXavmr4tJZY2z8SJkbZhfoIQ==
X-Google-Smtp-Source: APXvYqzRbhD007rTpFn65fuQwbRE0jfavTB4kcBRALksRks4bQKQVyoWvJ8KeUODJPYY9X/okCThaA==
X-Received: by 2002:a63:360e:: with SMTP id d14mr7037114pga.179.1551476998269; 
	Fri, 01 Mar 2019 13:49:58 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	23sm45399774pft.187.2019.03.01.13.49.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:49:57 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:12 -0800
Message-Id: <20190301214945.4353-2-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::434
Subject: [Qemu-riscv] [PULL 01/34] target/riscv: Activate decodetree and
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
X-List-Received-Date: Fri, 01 Mar 2019 21:50:09 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

for now only LUI & AUIPC are decoded and translated. If decodetree fails, we
fall back to the old decoder.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/Makefile.objs              | 10 +++++++
 target/riscv/insn32.decode              | 30 +++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.inc.c | 35 +++++++++++++++++++++++++
 target/riscv/translate.c                | 31 ++++++++++++----------
 4 files changed, 92 insertions(+), 14 deletions(-)
 create mode 100644 target/riscv/insn32.decode
 create mode 100644 target/riscv/insn_trans/trans_rvi.inc.c

diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
index 4072abe3e45c..bf0a268033a0 100644
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
index 000000000000..44d4e922b6fa
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
index 000000000000..9885a8d27551
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
index b7176cbf98e1..a273ac827448 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1874,6 +1874,19 @@ static void decode_RV32_64C(DisasContext *ctx)
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
 static void decode_RV32_64G(DisasContext *ctx)
 {
     int rs1;
@@ -1894,19 +1907,6 @@ static void decode_RV32_64G(DisasContext *ctx)
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
         gen_jal(ctx, rd, imm);
@@ -2011,7 +2011,10 @@ static void decode_opc(DisasContext *ctx)
         }
     } else {
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
-        decode_RV32_64G(ctx);
+        if (!decode_insn32(ctx, ctx->opcode)) {
+            /* fallback to old decoder */
+            decode_RV32_64G(ctx);
+        }
     }
 }
 
-- 
2.18.1


