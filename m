Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUj-00045D-RH
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:31:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUe-0002y9-Ac
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:30:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hGN-0008HI-HE
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:13 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40404)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hGL-00086W-Eg
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:09 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y124so819295pfy.7
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=tc0PDXayNFl3pTZvWOKGrleXIC3xDndCWcD2Cg/cKdk=;
	b=I2cWjhm0Sax+0rwBPopQHOm9YQidlwuV0iqpZqwAyaiS4C3QyD+CS9ppqXmOzltnMC
	YlTEOszO3Nj8mddekujsHQpASh5U2C331tAvwwiVRQOkVI/H/vRsQWdgUQS9+8j5giWq
	Wv1GQAI5Q9F4Dg/2NXnKKKMKZ3id602j+uOdORg6JOq9TwSlyBNGXf9j6HTRwIm1uVDU
	cwHImIyV6jTUAWZKkosSQgj7C4LtNPgnJdTc1ZJ2RAE4+wSwGqflJbW/jWNgrrP4q0w+
	2x/IshlXsQ/GzYPy489HTj+6wU8rCO89upEWicNmVMCPD2vDFF1M0rnCFN+94VytSpyx
	yOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=tc0PDXayNFl3pTZvWOKGrleXIC3xDndCWcD2Cg/cKdk=;
	b=Nuw2EG3wGV2PoS36dHdQOgIGJvOGQqdItEp3iCfdTx4dCjKlYg5dA+yK909avgXgwG
	L8AXgQblWqJ8PAHQ20wjpV28X9Ky2oWI5TwAYRPAIcHZnjPTFZkfApiQb6Sf7ZbpfPFs
	G0pDkm70buYXmoShxwIGCye7qaTO8SmjKb0aQA8UA9gGjAxrSsvacoo3fW0OdqOud9rr
	u/JGG0RwZLDylYpUtofrkqHDbox/7sztClklAdRmuiFjsM+fyGy67o4JRqIn3lOxkOWj
	U4rztmNKAsNB8R4BjwbYlHoW7/CaKt3GwU3ImPiwBiyQuHvWB9MypiHVyK7oyZIYnS5N
	bcIg==
X-Gm-Message-State: APjAAAXN8Al12AV8OqSjnSYhd2fidlX/WsstNOxUNWs/ePcO2uOJLDQ+
	plBCZ0F32/xNxSnutgb8vf6pfw==
X-Google-Smtp-Source: APXvYqy7MBXa30ogZBZ8zoQQ3PDYLivWqdJhvz9B4OaWMQ+g6QL7nwq3d9XlMWtFVibwdtXHATbrRA==
X-Received: by 2002:a63:4e45:: with SMTP id o5mr9339456pgl.220.1552396566764; 
	Tue, 12 Mar 2019 06:16:06 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id n5sm604749pgp.63.2019.03.12.06.16.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:16:05 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:05 -0700
Message-Id: <20190312131526.14710-9-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::42f
Subject: [Qemu-riscv] [PULL 08/29] target/riscv: Convert RVXM insns to
 decodetree
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
X-List-Received-Date: Tue, 12 Mar 2019 13:30:58 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn32-64.decode           |   7 ++
 target/riscv/insn32.decode              |  10 +++
 target/riscv/insn_trans/trans_rvm.inc.c | 113 ++++++++++++++++++++++++
 target/riscv/translate.c                |  16 ++--
 4 files changed, 137 insertions(+), 9 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvm.inc.c

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 9a35f2aa1920..008f1005469e 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -36,3 +36,10 @@ subw     0100000 .....  ..... 000 ..... 0111011 @r
 sllw     0000000 .....  ..... 001 ..... 0111011 @r
 srlw     0000000 .....  ..... 101 ..... 0111011 @r
 sraw     0100000 .....  ..... 101 ..... 0111011 @r
+
+# *** RV64M Standard Extension (in addition to RV32M) ***
+mulw     0000001 .....  ..... 000 ..... 0111011 @r
+divw     0000001 .....  ..... 100 ..... 0111011 @r
+divuw    0000001 .....  ..... 101 ..... 0111011 @r
+remw     0000001 .....  ..... 110 ..... 0111011 @r
+remuw    0000001 .....  ..... 111 ..... 0111011 @r
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 977b1b10a330..e53944bf0e40 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -92,3 +92,13 @@ csrrc    ............     ..... 011 ..... 1110011 @csr
 csrrwi   ............     ..... 101 ..... 1110011 @csr
 csrrsi   ............     ..... 110 ..... 1110011 @csr
 csrrci   ............     ..... 111 ..... 1110011 @csr
+
+# *** RV32M Standard Extension ***
+mul      0000001 .....  ..... 000 ..... 0110011 @r
+mulh     0000001 .....  ..... 001 ..... 0110011 @r
+mulhsu   0000001 .....  ..... 010 ..... 0110011 @r
+mulhu    0000001 .....  ..... 011 ..... 0110011 @r
+div      0000001 .....  ..... 100 ..... 0110011 @r
+divu     0000001 .....  ..... 101 ..... 0110011 @r
+rem      0000001 .....  ..... 110 ..... 0110011 @r
+remu     0000001 .....  ..... 111 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvm.inc.c b/target/riscv/insn_trans/trans_rvm.inc.c
new file mode 100644
index 000000000000..69631c9e3783
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvm.inc.c
@@ -0,0 +1,113 @@
+/*
+ * RISC-V translation routines for the RV64M Standard Extension.
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
+
+static bool trans_mul(DisasContext *ctx, arg_mul *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    gen_arith(ctx, OPC_RISC_MUL, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    gen_arith(ctx, OPC_RISC_MULH, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    gen_arith(ctx, OPC_RISC_MULHSU, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    gen_arith(ctx, OPC_RISC_MULHU, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_div(DisasContext *ctx, arg_div *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    gen_arith(ctx, OPC_RISC_DIV, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_divu(DisasContext *ctx, arg_divu *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    gen_arith(ctx, OPC_RISC_DIVU, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_rem(DisasContext *ctx, arg_rem *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    gen_arith(ctx, OPC_RISC_REM, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_remu(DisasContext *ctx, arg_remu *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    gen_arith(ctx, OPC_RISC_REMU, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+#ifdef TARGET_RISCV64
+static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    gen_arith(ctx, OPC_RISC_MULW, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_divw(DisasContext *ctx, arg_divw *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    gen_arith(ctx, OPC_RISC_DIVW, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    gen_arith(ctx, OPC_RISC_DIVUW, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_remw(DisasContext *ctx, arg_remw *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    gen_arith(ctx, OPC_RISC_REMW, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    gen_arith(ctx, OPC_RISC_REMUW, a->rd, a->rs1, a->rs2);
+    return true;
+}
+#endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 18555000af35..783ccade5180 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1841,11 +1841,18 @@ static void decode_RV32_64C(DisasContext *ctx)
 EX_SH(1)
 EX_SH(12)
 
+#define REQUIRE_EXT(ctx, ext) do { \
+    if (!has_ext(ctx, ext)) {      \
+        return false;              \
+    }                              \
+} while (0)
+
 bool decode_insn32(DisasContext *ctx, uint32_t insn);
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode_insn32.inc.c"
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.inc.c"
+#include "insn_trans/trans_rvm.inc.c"
 
 static void decode_RV32_64G(DisasContext *ctx)
 {
@@ -1867,15 +1874,6 @@ static void decode_RV32_64G(DisasContext *ctx)
     imm = GET_IMM(ctx->opcode);
 
     switch (op) {
-    case OPC_RISC_ARITH:
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_ARITH_W:
-#endif
-        if (rd == 0) {
-            break; /* NOP */
-        }
-        gen_arith(ctx, MASK_OP_ARITH(ctx->opcode), rd, rs1, rs2);
-        break;
     case OPC_RISC_FP_LOAD:
         gen_fp_load(ctx, MASK_OP_FP_LOAD(ctx->opcode), rd, rs1, imm);
         break;
-- 
2.19.2


