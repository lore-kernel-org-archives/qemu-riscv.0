Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtN-0001xr-Su
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtJ-0001t4-EG
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtF-0002j8-H8
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:05 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44270)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtE-0000rl-5d
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:01 -0500
Received: by mail-pl1-x641.google.com with SMTP id p4so1339512plq.11
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=YTywSyGfUdsMsgUV9OyqsA5v/+OwL5Q3cUHpeFPt9OM=;
	b=TcG3rKqMQOMtjXfm1TNsK65pxJzBvbduTgK8FDtjDm29tGw6iuFfYMnA1edtESKDyV
	nzgAju6qmSwgyBqIvHU66aWZTlCnKKl9Lk4/Ucd3th5D4B4cjDgW0lCBiOWZV9Y0Ir4N
	YkgDnYRjXZD+qta0MSHPEWjGchHHLKiu9vJknWxzAmX1FcV+bEDtAzgY2u6hUMY6GUV1
	Q6IA5si8fK1c+mEJX68mPncfwl78mtzKs76rydhnrxd6QgUfiK0pNc3FeSHG3RUGub4s
	0ICP5jnlLH4VXekKIVIvxrovWmXMlw9rkSRZMn5jQ+fo2YNK9IzE4WLcw6B3h4ELjrQ7
	PGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=YTywSyGfUdsMsgUV9OyqsA5v/+OwL5Q3cUHpeFPt9OM=;
	b=SB3hlfc7XH2l/5wiMn5B2JcSIBaa4mdY27BOEH430se/dsbxc+/NGHnYRc0qSaEzTP
	vP+dG3DZLFq+D+r6gEWA90lGx0+0bxtVeCM7KMYcGdsLEjONh8MLH7i8qCS7TlSpyrDY
	1PstX/pg334AQYYeMzVeg58NYG3N9wKKdJmF2RK9rCruUso85j5RPBQvHZAYuNHyflyj
	8KwmEjjAd4djbK7iqmtf/2LpN8rzCkL0+5NBNSPou43S5wFagEFbDRS9ySblGhSwcXaF
	HeLpHK+0ZW6K3IB8t/+/duvSr3rkAU3NT/la5NukfWUkZsF6/Slqo6k5Cp1nDEoENSIW
	ZMSw==
X-Gm-Message-State: AHQUAuZhipkXQXk7qR1VC7mKh9TzurXCVgZThiKiswwj8H9vhPsSQ65E
	7sFAN0Dvchl4WM6sZEENT0s+aA==
X-Google-Smtp-Source: AHgI3IZgqUu8Xf/xU9mxtycb9OpLU6//2ZxbDi02UVVWpwcwiNzFQMnvgQCVRfru63QMoUFwYBInDg==
X-Received: by 2002:a17:902:2aa8:: with SMTP id
	j37mr1134802plb.226.1550073279979; 
	Wed, 13 Feb 2019 07:54:39 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	x11sm1814845pgp.88.2019.02.13.07.54.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:54:39 -0800 (PST)
Date: Wed, 13 Feb 2019 07:53:41 -0800
Message-Id: <20190213155414.22285-3-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-riscv] [PATCH v7 02/35] target/riscv: Activate decodetree and
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
X-List-Received-Date: Wed, 13 Feb 2019 15:56:07 -0000

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
index 9e06eb8c2de5..4076f28b3c8b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1875,6 +1875,19 @@ static void decode_RV32_64C(DisasContext *ctx)
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
@@ -1895,19 +1908,6 @@ static void decode_RV32_64G(DisasContext *ctx)
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
@@ -2012,7 +2012,10 @@ static void decode_opc(DisasContext *ctx)
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


