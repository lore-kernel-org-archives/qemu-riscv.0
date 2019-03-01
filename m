Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq2l-0002mB-II
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:50:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq2h-0002gs-Ne
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq2f-0001li-9C
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:07 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq2e-0001bk-0K
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:05 -0500
Received: by mail-pf1-x429.google.com with SMTP id u9so12035054pfn.1
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=IHFRb/uohgXvKCA9RSkbhFxt1pQb102pHlM16Aca788=;
	b=cK0eyAhxnLbJWuEUiLH+gavd+ahXKQeLJg++i18jdNDHPvgBWERDZDErXbZZidtIRR
	Zmp9QNXXYUE5td7wetLenQIGRYNvlrGf8LcOS7ogIcygVfEK+MlElU0jJVmQE2HY398M
	uGFtZnRWcpWMX9MoxC0ZNmilUGC8dav779322/k3GzxsVZ2EmOVqsfmk5gM9BuVuOy4c
	UPMzGNZlwdXcVvu1sn5rLPu4OeDSjhPLzCC47ZoVvMdVA5A/8HdGkHT1XwDKlMwmhug4
	XK98Q/nKfc+8eLx9OaAyqIZPCTew6J7M0ByQALYaOXNhvBq9y4Ag1ViDe626oFSBK6a8
	kjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=IHFRb/uohgXvKCA9RSkbhFxt1pQb102pHlM16Aca788=;
	b=rCcyf67RJgFItVTlY5CcR6hL8RCYzXn2KJMAk4vVYxeoYUheNRF3e08KqeZQ+yc3v+
	ZteoMQA/1jsPWExZTIlIBGykU3V+NN40CAEWmWg21e/xU5RYaBbsR7JREM0Y0Jw5eYes
	47CCvxwjOKT+9xT2XU2JzXLfPa76+ienkI7rixomq/fnKZF9IaINkPwZJrHLf2/faed5
	aNyMKwq05G4MQTFLdhIIua45NTCsUKJ2kEgSywJZQMjnxbHJWkVo7bIkNYSHFXW0zFec
	NgZ7/mLullmpTH3SRvO4xvHfxFad67xYIfapelLZS2X2hQkAYuoqC6aupSb/xqzm4yWd
	aRdg==
X-Gm-Message-State: AHQUAuZZ5yvsCDzEcnY9gv45HHOyX14+VjONhjfZdypJhhsBM7WOmG5E
	SjHgzMKK6XXv/0LzbnWaIA6PNQ==
X-Google-Smtp-Source: AHgI3IY3hWMEto6DL2pMpeUfpBgWNZ59DpgC7BfGe/ILWInBrqLKOc1BR5FP4FCPZkMfjgIF2ov+Yg==
X-Received: by 2002:aa7:83cb:: with SMTP id j11mr7878618pfn.117.1551476999830; 
	Fri, 01 Mar 2019 13:49:59 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	j4sm30205916pfn.132.2019.03.01.13.49.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:49:59 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:13 -0800
Message-Id: <20190301214945.4353-3-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::429
Subject: [Qemu-riscv] [PULL 02/34] target/riscv: Convert RVXI branch insns
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
X-List-Received-Date: Fri, 01 Mar 2019 21:50:09 -0000

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
2.18.1


