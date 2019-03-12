Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUu-0004C1-JX
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:31:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUi-00031W-Fb
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:31:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hG2-0007o4-IA
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:15:51 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42931)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hG2-0007n1-BH
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:15:50 -0400
Received: by mail-pg1-x52c.google.com with SMTP id b2so1803292pgl.9
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=g0R13B1WEQeKeriWzo0umCb+jWOpIPzUDVeIGTlUj6Y=;
	b=cQTC3PgWbvYNV3Tn/35e//AmunqjqaCb0oeS8Foxow3Gbdk4zvAtoV3Rp5PQ8xFMYi
	NKKk70ZRfdzk2GYmBrP9l5HKIK9UJDKDCBzutyIOtixwOFBmyGkqDvTFifxfWSv+3M0s
	569q5y+wZikT3S0Wxy4OOa79QpP7eNpb90jRqkIpCsvEIOkTjJWIDbxhnDS8ViX/TwJE
	0+5FocU9MvjuOlah+ABy2BCN1khDPgl8FV17pqhRDFgwnirUNr22HsUgihkVnT1jF4M9
	vAn/S3EhngLCMUV7XxQiZi3D0AL6ol1SZlrW+xSCh1knOaj7k0uIS4CmDjJrYBvvPTGr
	LhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=g0R13B1WEQeKeriWzo0umCb+jWOpIPzUDVeIGTlUj6Y=;
	b=tHgBSasvq3XHrVHLD/JSmNmVLShry7/WrpZbwHnR5w53OLLYj3rBUEg5VuiYoNVvhR
	a4rSzP+rp3Xi0W1PdsGYwtQk05Gv7LUTlaXzg0H92Po6yOcqXxQ/tfOrsepBdXqTrGua
	WU64TkZNbTnyw8cQgw5sFeD02JXQq7X+Dh6YGZGQHBwpiM7jNUUC+Y000hswY7Wumgk9
	n0XISGfgnetYs97lWhhFVwQa7KqenHdNmw4c7CkG0YxstqxLL2YuZD2eUYgayEcLOxcJ
	5rfePEGamkeP9KgCBL/KtS8VSTXOaA4wcOs6ZZYAP7pzJON5wfd5AamcUIQA3aDAYFFV
	hEAw==
X-Gm-Message-State: APjAAAUmqOTWqS1HxyBJNw+U/9Pzv8daQn+sT5ylzIWCMDUXYp9w0jmc
	dX7qXccnQLKhcq3aznir7h0r4nG7A7UxQ4qF
X-Google-Smtp-Source: APXvYqzjsxJ3xwF9et4HkNHt0PAowB6Y/9xUE1R1aCx2uyMsbtDgmnRa5jnmPyRzDelMcsrmHqR5Xw==
X-Received: by 2002:a17:902:2ae8:: with SMTP id
	j95mr39434065plb.292.1552396549288; 
	Tue, 12 Mar 2019 06:15:49 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	l79sm19855271pfb.102.2019.03.12.06.15.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:15:47 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:14:59 -0700
Message-Id: <20190312131526.14710-3-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::52c
Subject: [Qemu-riscv] [PULL 02/29] target/riscv: Convert RVXI branch insns
 to decodetree
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
X-List-Received-Date: Tue, 12 Mar 2019 13:31:04 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn32.decode              | 19 ++++++++++
 target/riscv/insn_trans/trans_rvi.inc.c | 49 +++++++++++++++++++++++++
 target/riscv/translate.c                | 12 +-----
 3 files changed, 69 insertions(+), 11 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 44d4e922b6fa..81f56c16b45f 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -17,14 +17,33 @@
 # this program.  If not, see <http://www.gnu.org/licenses/>.
 
 # Fields:
+%rs2       20:5
+%rs1       15:5
 %rd        7:5
 
 # immediates:
+%imm_i    20:s12
+%imm_b    31:s1 7:1 25:6 8:4     !function=ex_shift_1
+%imm_j    31:s1 12:8 20:1 21:10  !function=ex_shift_1
 %imm_u    12:s20                 !function=ex_shift_12
 
+# Argument sets:
+&b    imm rs2 rs1
+
 # Formats 32:
+@i       ............    ..... ... ..... .......         imm=%imm_i     %rs1 %rd
+@b       .......   ..... ..... ... ..... ....... &b      imm=%imm_b %rs2 %rs1
 @u       ....................      ..... .......         imm=%imm_u          %rd
+@j       ....................      ..... .......         imm=%imm_j          %rd
 
 # *** RV32I Base Instruction Set ***
 lui      ....................       ..... 0110111 @u
 auipc    ....................       ..... 0010111 @u
+jal      ....................       ..... 1101111 @j
+jalr     ............     ..... 000 ..... 1100111 @i
+beq      ....... .....    ..... 000 ..... 1100011 @b
+bne      ....... .....    ..... 001 ..... 1100011 @b
+blt      ....... .....    ..... 100 ..... 1100011 @b
+bge      ....... .....    ..... 101 ..... 1100011 @b
+bltu     ....... .....    ..... 110 ..... 1100011 @b
+bgeu     ....... .....    ..... 111 ..... 1100011 @b
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 9885a8d27551..bcf20def50eb 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -33,3 +33,52 @@ static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
     }
     return true;
 }
+
+static bool trans_jal(DisasContext *ctx, arg_jal *a)
+{
+    gen_jal(ctx, a->rd, a->imm);
+    return true;
+}
+
+static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
+{
+    gen_jalr(ctx, OPC_RISC_JALR, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_beq(DisasContext *ctx, arg_beq *a)
+{
+    gen_branch(ctx, OPC_RISC_BEQ, a->rs1, a->rs2, a->imm);
+    return true;
+}
+
+static bool trans_bne(DisasContext *ctx, arg_bne *a)
+{
+    gen_branch(ctx, OPC_RISC_BNE, a->rs1, a->rs2, a->imm);
+    return true;
+}
+
+static bool trans_blt(DisasContext *ctx, arg_blt *a)
+{
+    gen_branch(ctx, OPC_RISC_BLT, a->rs1, a->rs2, a->imm);
+    return true;
+}
+
+static bool trans_bge(DisasContext *ctx, arg_bge *a)
+{
+    gen_branch(ctx, OPC_RISC_BGE, a->rs1, a->rs2, a->imm);
+    return true;
+}
+
+static bool trans_bltu(DisasContext *ctx, arg_bltu *a)
+{
+    gen_branch(ctx, OPC_RISC_BLTU, a->rs1, a->rs2, a->imm);
+    return true;
+}
+
+static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
+{
+
+    gen_branch(ctx, OPC_RISC_BGEU, a->rs1, a->rs2, a->imm);
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a273ac827448..fb284a5e08d6 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1879,6 +1879,7 @@ static void decode_RV32_64C(DisasContext *ctx)
     {                                         \
         return imm << amount;                 \
     }
+EX_SH(1)
 EX_SH(12)
 
 bool decode_insn32(DisasContext *ctx, uint32_t insn);
@@ -1907,17 +1908,6 @@ static void decode_RV32_64G(DisasContext *ctx)
     imm = GET_IMM(ctx->opcode);
 
     switch (op) {
-    case OPC_RISC_JAL:
-        imm = GET_JAL_IMM(ctx->opcode);
-        gen_jal(ctx, rd, imm);
-        break;
-    case OPC_RISC_JALR:
-        gen_jalr(ctx, MASK_OP_JALR(ctx->opcode), rd, rs1, imm);
-        break;
-    case OPC_RISC_BRANCH:
-        gen_branch(ctx, MASK_OP_BRANCH(ctx->opcode), rs1, rs2,
-                   GET_B_IMM(ctx->opcode));
-        break;
     case OPC_RISC_LOAD:
         gen_load(ctx, MASK_OP_LOAD(ctx->opcode), rd, rs1, imm);
         break;
-- 
2.19.2


