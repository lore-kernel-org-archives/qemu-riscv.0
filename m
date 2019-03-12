Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUx-0004Fp-44
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:31:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUk-0002wr-OP
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:31:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hFz-0007kr-9K
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:15:48 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33501)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hFy-0007k7-V4
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:15:47 -0400
Received: by mail-pf1-x42d.google.com with SMTP id i19so1835492pfd.0
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=xd2c5jHrn/6ygkPZ5at+TkAjyuAQKCtiNh5SCc4x7l8=;
	b=g18NAMfc/yfOqfO7BmTQPxZIGG6H8dVObHpTcYYUQIzARHD+vKvi7OQSJheOdETb4D
	s3iQDKaOcNWZtmtj21r3L67oBH2H+gtthjIWivovQy0Om+ipmAXz+cSmIbzlGcCVdb1a
	S+Jne/0HBzsdbnFRh3AZIag0Vv96LojAFdXyhVWyF2vPA3pUxszII9P0NV3E26dr+Z6k
	kkTfZQsiWEWGU0vQhdX+Sfp+oRDY+7i9QYgYWKYDiPK2W9SX+F7uMh6BK3W5uOoSWR0/
	qPPcm7rTsQSgZ5yj2y6qwZdws1jseo6EVVXArBqiGEn3F+PdSNRBKhzQDcy/56bfma9T
	qUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=xd2c5jHrn/6ygkPZ5at+TkAjyuAQKCtiNh5SCc4x7l8=;
	b=KdpQdl/Mpmhx/vXVfMgdWio0ie2ILfjW58SvhFCKNSqekT2EqMlzlaQtBaANK4HKQv
	eqBbIsDDASAC1RKjIftC0Hi8wTSfmQwbdAFktf7dLxWlYSQD3QNs9NnPT+Iwl1CI/BBS
	3FYksZiqfuKQbUXU+mn5vhRkbpBWRoaHGECYiDjiVN36lcbU9pmk3icqRGAFRNzuxiM5
	KhJKMNjHVUFUuOPW5EsOT2YGk9biP0ucIn5PEkusp0mr8OQt7z6YlfEH8y9GtKLGJ0+/
	ga4mzYTgtdTTAZKK0du6rSYVV/Fr1ZqngiSWylgCw2pKm97+ZprfQOJnvYt25jug1Z82
	4P4Q==
X-Gm-Message-State: APjAAAWYKZYRIgFzEnvLFk8VgU+XkWiDqvVjyzZK+LIDf3nIlxOc3QKe
	IswyGK5P+DE2DmPvKZNkMh0Q7A==
X-Google-Smtp-Source: APXvYqwWvl1IgveOuoByNL+8yAhI79OlLCSc0zMnBBIlSUYZoMMqAph4M5DdHFGyxKkF87hxzt5Vpw==
X-Received: by 2002:a17:902:a981:: with SMTP id
	bh1mr40348467plb.88.1552396545664; 
	Tue, 12 Mar 2019 06:15:45 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	p6sm11273563pgd.69.2019.03.12.06.15.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:15:44 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:14:58 -0700
Message-Id: <20190312131526.14710-2-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190312131526.14710-1-palmer@sifive.com>
References: <20190312131526.14710-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42d
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
X-List-Received-Date: Tue, 12 Mar 2019 13:31:10 -0000

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
2.19.2


