Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUo-00048c-Jj
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:31:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUh-00033q-91
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:31:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hG8-0007tV-Hn
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:15:58 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34010)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hG8-0007sn-5z
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:15:56 -0400
Received: by mail-pg1-x532.google.com with SMTP id v12so1838254pgq.1
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=KRdR6FRJvYjFCTpCcfewpyOvfDv7iI4lTximzGSasHI=;
	b=ld1xIMWtpPR/QMaGNO5ig2Ly9Hk9gKkcuoIWtir3hb6X4C48XDlj4xfNLCo7BQQkaD
	DbO7Pzi+N4gdaiUrnzrP264df3/C4PXxQjS9f7Va82f1HUgyPma2h5bAiWIHmcotSAiC
	TVD12FFG3OD6DctM6x3uOOL8Bz8DoaeqEepXaLZfVNtzy0kZLDaG2fOkFMbYeZ5jqM7q
	6NkvZuKcgv6oiwfoIBGiwFABmZ8mhFdv+RAz42NqN/HgDvWl9TLpZxprjMateZnlcw5A
	GKAT2DUI2Mt4Lom2vMECwobQienz43H7qqzHlE8VwkhWmVGSXYC9sn1XBeNfXDYedAZy
	f6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=KRdR6FRJvYjFCTpCcfewpyOvfDv7iI4lTximzGSasHI=;
	b=V9YWUZY+zczeimUe1jDSFXi0c35pIuD287N3pxKum1uaMQCuC3o8ajEERxXVwqmb/I
	XBvX9Bm+ZKneZ2TKc1HPAp8qhD/byMnosmTmwFEoYxZUUdWACBja+7AwypyKsBs38fsb
	gJjmZKcq76RlER9zyvrNP4de2zQ6hO/UmETPUo6yGIRjod+EQJlSTOrR1a1vyss7TSm6
	lO65sfOVWFzxonTDL7pvx+6w76tPMp/e7GVeX+qhypki0UTtxZzoLbZVTpYxeIijawvg
	w+CBwgTAcWmI67C8GIx5gGIavi8dGzc91yIfTPDEqA6d9hQV79BBdhqpD/4RWMnCr1DN
	WKbg==
X-Gm-Message-State: APjAAAVHsculufE5tLbbRq3n8otrNVFAuCqUVE2tCFzF/uvP0d/yS5WZ
	R7Ztj6fmIAZF4wm9zuVVtnUVjg==
X-Google-Smtp-Source: APXvYqz6mcjCnQ8DRuE0A4DeHhuTTfSy+IpgMZFfhWrHVqdRZcn0yGIed/hKpHbG6Ocdu8+hz4Dkjw==
X-Received: by 2002:a17:902:e3:: with SMTP id
	a90mr38835930pla.45.1552396555097; 
	Tue, 12 Mar 2019 06:15:55 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	y68sm10742307pgy.67.2019.03.12.06.15.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:15:54 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:01 -0700
Message-Id: <20190312131526.14710-5-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::532
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
X-List-Received-Date: Tue, 12 Mar 2019 13:31:02 -0000

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
2.19.2


