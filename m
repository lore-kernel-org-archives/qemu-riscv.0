Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtZ-00029B-6e
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtO-0001yk-IJ
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtL-0002vZ-Fa
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:10 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtJ-0000xK-Ei
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:07 -0500
Received: by mail-pl1-x632.google.com with SMTP id o6so1333341pls.13
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=w7VQRx07PCvyefnek535b7w+gwAuVbOr1bTDkd1rg44=;
	b=ACa08nWLFQ5v2ew7KU58/FLJAlG4na7E6UGwkHysnsFw+6RGAQgd/Hz5u7OsYAh3Sj
	QTMYjHTxk7PCei1NSdD9Qkroxozhbh3tHXe4w/kQJv4RIVmTys8rhqhbPpHP3Eaj8KMy
	I+Bl6HP6AwsbVgORW9i95lmG2h+G0qqdj9O5tTqUs10yh75fhr3IlDwlKAiQUSxK1VOT
	amLHyXrBgwqYPzZ1Esf83tC+e3Zow0HTbfKPbUxULl3s3+53bOXdMoU3qIS4aPe2TfPu
	ijSeKl4K6aZcRY6+x+1dET7cJnttHKlECpIZLIdwQMbioKD63fyYn8nmKrnZSIeun4Fg
	emoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=w7VQRx07PCvyefnek535b7w+gwAuVbOr1bTDkd1rg44=;
	b=ufIMKjUqddLSTB5xre8arihAxVAWZZGQigsvGfrbEDKK2wPg0ja002C79ALQFodVIz
	aS7Q42WAiOuhTWKx768D2eAHwxiYkJ3weqh5mfZAGWj5KHj8KQQCKZUMOV9tn99FhZwf
	eGA9z17pu0slJlx78WoJkzjiIg4VrC6bp2ov5lwUcFf+TjT3SgBaBFAcvFNYYpMQzaj1
	1d/KmJ5DEIab0H8BzrUw0+J+7r3KU3feOOm1SKNF3xq81XP86YtUVCZVKhMGlgA80Vvs
	9bxuHThENU4Mr0z140yrG+tj/lSz9FlwvSzSZD9bSMEjg+SDDGe4BjH3aZjVNViOQ+mi
	A+0g==
X-Gm-Message-State: AHQUAublkFrbIMj01naXYUIX4eaxaAq/uj8xU80tcrhryLNxeTDkO7nQ
	m3FLAtRKIPsIe1V9929NYupiwg==
X-Google-Smtp-Source: AHgI3IbpZUY1vf82XWUjixdL4m2O2UAzIuYcEK3aqhA5LoFtjQSkewAi05ihhotzTiRCMm5VsewI/A==
X-Received: by 2002:a17:902:b715:: with SMTP id
	d21mr1192473pls.242.1550073284947; 
	Wed, 13 Feb 2019 07:54:44 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	h79sm31626526pfj.186.2019.02.13.07.54.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:54:44 -0800 (PST)
Date: Wed, 13 Feb 2019 07:53:44 -0800
Message-Id: <20190213155414.22285-6-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::632
Subject: [Qemu-riscv] [PATCH v7 05/35] target/riscv: Convert RV64I
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
X-List-Received-Date: Wed, 13 Feb 2019 15:56:20 -0000

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
index c5bcfd6b9756..3b0bcc33d0fe 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1909,13 +1909,6 @@ static void decode_RV32_64G(DisasContext *ctx)
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


