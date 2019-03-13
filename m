Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h456M-00017z-6a
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h456C-0000SU-E6
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h450S-0003sO-Fk
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:21 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36954)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h450S-0003rZ-8E
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:20 -0400
Received: by mail-pf1-x434.google.com with SMTP id s22so1527820pfh.4
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=9plQdA/XmJsAw3BOCvfKsI0g4SR9lLq8kms68V/AsJI=;
	b=KI+ne02nxoyRU2D0AkW5u/3wHhjUP9VXm8McEHK1PN2wHr9H+mCVGgZZU+Hq9L9urb
	qDKmx/pF/IHULvFjqRkrNPtD7B7p4dmjX7Vc5kYnKTykBnRgmKvuAJyX3AVSbk1sUmle
	a4jvCT0M6v8/nyEKNNWxr1Zuo6JBimvGbM4st6ib+EQmEZEw0/OHUGKzEK+7Ywwd022o
	4oz4J4oKDIVlll/hoctiVjoQBwc9w07769i8QzKPLdTqnAkz0SbS2eeI3ytbHz6nnDmX
	V9wLhh1w7G59LnLWOGPDR7MZ9xAK72rk0E5SOx8iAIwt1kZYr1TX4xA0dGz975u1LcJz
	dxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=9plQdA/XmJsAw3BOCvfKsI0g4SR9lLq8kms68V/AsJI=;
	b=l1hj5d63f5hbcCNXJZ1E7IJTMmY6xaCCzWnlkSS/8HEvVqTHvHWmUHrCdbsyW0cRNf
	RxNefuIiGgjMHu2Ex1xnEDa+korAfgIcOeDzo5/4vKCoVBf3cTT9QessPlbhiVc7Vk26
	MFWKIoWoZOWA7t0aGouSXUcI4aO+W3ggUj03K+i8CLLV6fOw1d4ZCbcSBboI0gxZfmbG
	LQZJsQ9P7csqhcY5vbgz7BU9h2imozY5o4z3NC05GguK+DgZMiqOHHcyMfNYjzMhE0mU
	kWzwIPY3O1qIhUeCgVazLRkum1dXm4hoPC/L44vd2u9MdgRsBUPTu5+u+TG8nIlE/snZ
	qJvg==
X-Gm-Message-State: APjAAAWJBliCmYuQtnK9K7o7lQ3HPW8KnOC/MXo126LgY1z2f3+WsoEq
	+G7xyUvtOVdUUwPN0WSbBM2VbgYbD+65aCrG
X-Google-Smtp-Source: APXvYqxQSifbBfc8Tu7Q7VdcXA0g9hfpoVFDmoazTbBHeqlnfWifP9M5D8wKr9M7NNcXbC4eJ7nuuw==
X-Received: by 2002:a17:902:930b:: with SMTP id
	bc11mr46787849plb.101.1552487838843; 
	Wed, 13 Mar 2019 07:37:18 -0700 (PDT)
Received: from localhost ([122.146.90.161]) by smtp.gmail.com with ESMTPSA id
	g6sm14294987pgq.54.2019.03.13.07.37.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:37:18 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:37 -0700
Message-Id: <20190313143705.29129-2-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190313143705.29129-1-palmer@sifive.com>
References: <20190313143705.29129-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::434
Subject: [Qemu-riscv] [PULL 01/29] target/riscv: Activate decodetree and
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
X-List-Received-Date: Wed, 13 Mar 2019 14:43:17 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

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
2.19.2


