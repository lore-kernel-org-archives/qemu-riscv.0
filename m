Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq3J-0003IL-Ke
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:50:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3C-0003DV-Rp
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq35-0002Tw-9K
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:34 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:33397)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq2l-00020d-7p
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:19 -0500
Received: by mail-pf1-x42c.google.com with SMTP id i19so12037086pfd.0
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=k7YXuJCdnu7dBT04ziwhteQh8BJdHpN0ltUpWILwtpY=;
	b=Vjjd6E64raTC7ccG74SirAyNAnFIpyFC80K5GTC62hhxPhciO8geHmJ/4fZob0qIpN
	D2ewYTcvDQ3thZoDbLtCDZU3rEe1JT31iGHHUNJ6ltrIUxzamYQjc3qIc+IDs0njY+8D
	4aDj6aHWx5WWIa8JozgvoC+q1xCBjfNfTKFImoYLhQhshB7pk2gXJhvISrtu+EbBa0mo
	f25kqjMqW9mbykkjuO3pUS2l0gAAE2N2NlnV1DWIWUu4722+13FQNwOUJMXOmeB/nWWZ
	AQFz2IMe9VyM4RQ0ZzzmSAcN0b3Rk2y9CEA9OZhwpTQ+vvP6uwm+bQfaPqugrKJ7myPp
	eV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=k7YXuJCdnu7dBT04ziwhteQh8BJdHpN0ltUpWILwtpY=;
	b=eyqR1ZEEWbQHkz4/vjcfpR1wR2rGlGY3LNPVVVpp3WlNvGt0A4F5trWVgfDW53hozb
	Owo0EdnjQ+GYswrV9bkRcFdlzPeNbsli1zSOAhZHN0urYgyqoL20OgJlRGrC/+ccJ656
	QhKjiturV89kMWFL9qtV0jiuxvAOunR6prPT6Vzuk2otTSPyOo+2tosUMNbW/hQR48dK
	zfrmDVHJzCjAGm1xPdGT5kQEWgnwEoRrU0dHTrloVQ2upXp8qRpq5LFhlTP9liNdHJKh
	IY6w2ewrr7/oUEWr3HUR+AT4w7CCLYNQzbe9yptj6QI9nj51V89OIU5vJ7ExIUazAI4t
	0hiQ==
X-Gm-Message-State: APjAAAWO2CPqN+2qNkiakb+K+2w4/I8U7JwMPWgLnE5jRxTduiOF+4Ed
	5HtOUdmaW41/znGi/Wwnfk1FNBZUhHQ=
X-Google-Smtp-Source: APXvYqwB8/haBmYWGnh4GlEb15YtWDRU3N5Us37LkG7po6VA3Ml7wEP/LcaZQCKIknPD5wUOYfTSJA==
X-Received: by 2002:a65:6651:: with SMTP id z17mr6610128pgv.95.1551477009916; 
	Fri, 01 Mar 2019 13:50:09 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	g3sm29902016pgg.41.2019.03.01.13.50.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:09 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:19 -0800
Message-Id: <20190301214945.4353-9-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::42c
Subject: [Qemu-riscv] [PULL 08/34] target/riscv: Convert RVXM insns to
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
X-List-Received-Date: Fri, 01 Mar 2019 21:50:41 -0000

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
2.18.1


