Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h456H-00011K-Od
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h456B-0000I0-04
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h450b-00044s-Ub
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:31 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33434)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h450b-000447-Ow
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:29 -0400
Received: by mail-pg1-x529.google.com with SMTP id h11so1693231pgl.0
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=yVuiy6i0yAjNXMvSqLi0JukNhiw7lz6GODp5VZtEUiI=;
	b=fXJeBwDVn0A7hX1Psk+CApREjovf3XGvJ6AWvHEWdfYp4zoUQ4Zal9C/QCKCvOeF4r
	z8EAQ9578m2AhM+hGgUnOWBm8BEuoSTg8CF49Q7jFxiXPlwAfj4+KTG6wpHTsiW0g042
	vk5OlSzq/if9wdHcvPPxREkRl3P8tJjwmRjvTfP0CzKHdflc6R33Oc3iAjUdAj/oZMpZ
	VbyKBrQyIAItYGgNu7EENATph9sz0qwpPuOJfEzMdPOuc0Sk9UnY7e4T0iFM3OKNJEzM
	BgwsSxkPcpMc0Er9/XKpztKdr25nAm696MY3G5jinhrqYZs/3pVJ+BfI/vDe8IJUovt5
	5akQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=yVuiy6i0yAjNXMvSqLi0JukNhiw7lz6GODp5VZtEUiI=;
	b=OVOcPTSOjIIYKgR/gyNcZ9GP5++77FM4Yl4gkIyZfCByjYxyYtG9h5CxXyTrGG12rE
	EEqnauEcnzJCjPpkMKuWbQJp15qZ1magi3ZZkKI4ohfkY8rkQYp7ndtIcpNhljg4FfX8
	yN5wwEAQVJCipUMb4neV1XH4zkT54UJWAgzsyT27qDUyi3b997sub9cyrRiFN9xzSoqJ
	83TUKqkxUgkLOOMtgWh0c7dFW0XHod8XceoHBGv3tCYIQcl46JmqEm416U2VhsJoW6uB
	I8fOZkVxYEY1/m/OvXuvBj5Vj9QZEPP3eQ5FEqbNi2AoUW1gFHiYfFV2Q1olOeJKgswv
	HS4A==
X-Gm-Message-State: APjAAAVsjnQI8C2Kdn0/5mw27Bnor09hXbvR4+ujn3isgjszPNok9ZKy
	IHOH6C33/lzcwXsiE56STs3tR8+aSdlsedNA
X-Google-Smtp-Source: APXvYqyOpjJkmp96iFhXcW7IRE/MFajzojZRBJsBRm2Wljm77nWrG3IZn5tbUdalUPmDJwoKMPLdRQ==
X-Received: by 2002:a65:4348:: with SMTP id k8mr40696197pgq.289.1552487848447; 
	Wed, 13 Mar 2019 07:37:28 -0700 (PDT)
Received: from localhost ([122.146.90.161]) by smtp.gmail.com with ESMTPSA id
	d11sm21259046pfh.29.2019.03.13.07.37.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:37:27 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:40 -0700
Message-Id: <20190313143705.29129-5-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::529
Subject: [Qemu-riscv] [PULL 04/29] target/riscv: Convert RV64I load/store
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
X-List-Received-Date: Wed, 13 Mar 2019 14:43:16 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

this splits the 64-bit only instructions into its own decode file such
that we generate the decoder for these instructions only for the RISC-V
64 bit target.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
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
2.19.2


