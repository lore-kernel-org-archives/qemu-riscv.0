Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h456E-0000wG-Ry
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h456A-0000SZ-8K
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h450e-00048T-Ei
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:33 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:45595)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h450e-00047o-6f
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:32 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 125so1646478pgc.12
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=tRzdWmbhdaSthZX56ZLfNSSoBAQPAoQRsAqr4Up4Fh4=;
	b=O0I7JURgP/FxX3fapCP+pIMiIydAuyvkdZ/R8A4fyHIubSFMdE5N4Rc0RZEKAym7zh
	YrAZw6199LjQlxRjbzgTOnBZMWOMPxIuN1vn5ZajGNPj4fcoMphOWb0iidLwdv0Mq1yz
	D4OcAIhzoq+evAF4+k9kF495cmvXX1yzj+Ed1dCzXIOsnsdpx3XS7BdNZ0898ir2a91P
	3I1SgVLZbEJ7rUIJc3XXqbPAhaI5LZ5z3938EaMNg42Zr+Wtb3uCVZRxKQFTU3mJv32q
	SZIyS/XObCXcZFyRzsG87kIDQzu+NXhxTFFNrlok5jE8D1WAQiucJIPf5zBmh5QbKopm
	FfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=tRzdWmbhdaSthZX56ZLfNSSoBAQPAoQRsAqr4Up4Fh4=;
	b=Ye6p8R61M6TcSiGzD4iTjBJjWqiFCJ34G6TptIEceXQBmxpMiu2KSnJINA/z3KD7lG
	gTiNvPRVA82qgsrZeGoGSUNvnRelULdQbxgB3o5ooKbi541wMZJP/5bXXb3n+CYvbdTi
	dBcfKeoAGLY++DF9jJwEkVnrkBMPLkYuz2K3TGgqgNS06EAG6T7Db9lj2/3fs+4LYtjf
	okDT9+5A9yt87CTkbWfoJBh2gC5FxvN+WTYNqp1fQ+jKeS+iKtlRNpiXnhJllQQB/pVG
	QolqYg2c/PvJRcinvMIb+Ztk5te6VJU/z+bOKmxQ3Rt2CJXMZl2P762Y7rwdBlUt1Koi
	xHwQ==
X-Gm-Message-State: APjAAAWpFapQvE5ISyQoDXYR6R1XPmx4M9NfEjy4rkTRqJWeIwx1OJSQ
	l1HVlnHfwpuOQiULkZDK9Qp/pxQK7peS3S/4
X-Google-Smtp-Source: APXvYqxbNns3ruQhUAq76Acbcy0BqhHFKQoEvpU7rRD2qlplj5bw691X/BttYRfIihBZ4rFLahYCrg==
X-Received: by 2002:a63:d449:: with SMTP id i9mr40898011pgj.449.1552487850816; 
	Wed, 13 Mar 2019 07:37:30 -0700 (PDT)
Received: from localhost ([122.146.90.161]) by smtp.gmail.com with ESMTPSA id
	f15sm18863374pfa.11.2019.03.13.07.37.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:37:30 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:41 -0700
Message-Id: <20190313143705.29129-6-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::52c
Subject: [Qemu-riscv] [PULL 05/29] target/riscv: Convert RVXI arithmetic
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
X-List-Received-Date: Wed, 13 Mar 2019 14:43:15 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

we cannot remove the call to gen_arith() in decode_RV32_64G() since it
is used to translate multiply instructions.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn32-64.decode           |  13 ++
 target/riscv/insn32.decode              |  25 ++++
 target/riscv/insn_trans/trans_rvi.inc.c | 168 ++++++++++++++++++++++++
 target/riscv/translate.c                |   9 --
 4 files changed, 206 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 439d4e2c587b..9a35f2aa1920 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -19,7 +19,20 @@
 # This is concatenated with insn32.decode for risc64 targets.
 # Most of the fields and formats are there.
 
+%sh5    20:5
+
+@sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
+
 # *** RV64I Base Instruction Set (in addition to RV32I) ***
 lwu      ............   ..... 110 ..... 0000011 @i
 ld       ............   ..... 011 ..... 0000011 @i
 sd       ....... .....  ..... 011 ..... 0100011 @s
+addiw    ............   ..... 000 ..... 0011011 @i
+slliw    0000000 .....  ..... 001 ..... 0011011 @sh5
+srliw    0000000 .....  ..... 101 ..... 0011011 @sh5
+sraiw    0100000 .....  ..... 101 ..... 0011011 @sh5
+addw     0000000 .....  ..... 000 ..... 0111011 @r
+subw     0100000 .....  ..... 000 ..... 0111011 @r
+sllw     0000000 .....  ..... 001 ..... 0111011 @r
+srlw     0000000 .....  ..... 101 ..... 0111011 @r
+sraw     0100000 .....  ..... 101 ..... 0111011 @r
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 076de873c4f1..1f5bf1f6f97d 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -21,6 +21,8 @@
 %rs1       15:5
 %rd        7:5
 
+%sh10    20:10
+
 # immediates:
 %imm_i    20:s12
 %imm_s    25:s7 7:5
@@ -30,14 +32,18 @@
 
 # Argument sets:
 &b    imm rs2 rs1
+&shift     shamt rs1 rd
 
 # Formats 32:
+@r       .......   ..... ..... ... ..... .......                   %rs2 %rs1 %rd
 @i       ............    ..... ... ..... .......         imm=%imm_i     %rs1 %rd
 @b       .......   ..... ..... ... ..... ....... &b      imm=%imm_b %rs2 %rs1
 @s       .......   ..... ..... ... ..... .......         imm=%imm_s %rs2 %rs1
 @u       ....................      ..... .......         imm=%imm_u          %rd
 @j       ....................      ..... .......         imm=%imm_j          %rd
 
+@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
+
 # *** RV32I Base Instruction Set ***
 lui      ....................       ..... 0110111 @u
 auipc    ....................       ..... 0010111 @u
@@ -57,3 +63,22 @@ lhu      ............     ..... 101 ..... 0000011 @i
 sb       .......  .....   ..... 000 ..... 0100011 @s
 sh       .......  .....   ..... 001 ..... 0100011 @s
 sw       .......  .....   ..... 010 ..... 0100011 @s
+addi     ............     ..... 000 ..... 0010011 @i
+slti     ............     ..... 010 ..... 0010011 @i
+sltiu    ............     ..... 011 ..... 0010011 @i
+xori     ............     ..... 100 ..... 0010011 @i
+ori      ............     ..... 110 ..... 0010011 @i
+andi     ............     ..... 111 ..... 0010011 @i
+slli     00.... ......    ..... 001 ..... 0010011 @sh
+srli     00.... ......    ..... 101 ..... 0010011 @sh
+srai     01.... ......    ..... 101 ..... 0010011 @sh
+add      0000000 .....    ..... 000 ..... 0110011 @r
+sub      0100000 .....    ..... 000 ..... 0110011 @r
+sll      0000000 .....    ..... 001 ..... 0110011 @r
+slt      0000000 .....    ..... 010 ..... 0110011 @r
+sltu     0000000 .....    ..... 011 ..... 0110011 @r
+xor      0000000 .....    ..... 100 ..... 0110011 @r
+srl      0000000 .....    ..... 101 ..... 0110011 @r
+sra      0100000 .....    ..... 101 ..... 0110011 @r
+or       0000000 .....    ..... 110 ..... 0110011 @r
+and      0000000 .....    ..... 111 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 61f708dba144..136fa54d0655 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -150,3 +150,171 @@ static bool trans_sd(DisasContext *ctx, arg_sd *a)
     return true;
 }
 #endif
+
+static bool trans_addi(DisasContext *ctx, arg_addi *a)
+{
+    gen_arith_imm(ctx, OPC_RISC_ADDI, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_slti(DisasContext *ctx, arg_slti *a)
+{
+    gen_arith_imm(ctx, OPC_RISC_SLTI, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
+{
+    gen_arith_imm(ctx, OPC_RISC_SLTIU, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_xori(DisasContext *ctx, arg_xori *a)
+{
+    gen_arith_imm(ctx, OPC_RISC_XORI, a->rd, a->rs1, a->imm);
+    return true;
+}
+static bool trans_ori(DisasContext *ctx, arg_ori *a)
+{
+    gen_arith_imm(ctx, OPC_RISC_ORI, a->rd, a->rs1, a->imm);
+    return true;
+}
+static bool trans_andi(DisasContext *ctx, arg_andi *a)
+{
+    gen_arith_imm(ctx, OPC_RISC_ANDI, a->rd, a->rs1, a->imm);
+    return true;
+}
+static bool trans_slli(DisasContext *ctx, arg_slli *a)
+{
+    gen_arith_imm(ctx, OPC_RISC_SLLI, a->rd, a->rs1, a->shamt);
+    return true;
+}
+
+static bool trans_srli(DisasContext *ctx, arg_srli *a)
+{
+    gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_I, a->rd, a->rs1, a->shamt);
+    return true;
+}
+
+static bool trans_srai(DisasContext *ctx, arg_srai *a)
+{
+    gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_I, a->rd, a->rs1, a->shamt | 0x400);
+    return true;
+}
+
+static bool trans_add(DisasContext *ctx, arg_add *a)
+{
+    gen_arith(ctx, OPC_RISC_ADD, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_sub(DisasContext *ctx, arg_sub *a)
+{
+    gen_arith(ctx, OPC_RISC_SUB, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_sll(DisasContext *ctx, arg_sll *a)
+{
+    gen_arith(ctx, OPC_RISC_SLL, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_slt(DisasContext *ctx, arg_slt *a)
+{
+    gen_arith(ctx, OPC_RISC_SLT, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
+{
+    gen_arith(ctx, OPC_RISC_SLTU, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_xor(DisasContext *ctx, arg_xor *a)
+{
+    gen_arith(ctx, OPC_RISC_XOR, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_srl(DisasContext *ctx, arg_srl *a)
+{
+    gen_arith(ctx, OPC_RISC_SRL, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_sra(DisasContext *ctx, arg_sra *a)
+{
+    gen_arith(ctx, OPC_RISC_SRA, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_or(DisasContext *ctx, arg_or *a)
+{
+    gen_arith(ctx, OPC_RISC_OR, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_and(DisasContext *ctx, arg_and *a)
+{
+    gen_arith(ctx, OPC_RISC_AND, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+#ifdef TARGET_RISCV64
+static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
+{
+    gen_arith_imm(ctx, OPC_RISC_ADDIW, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
+{
+    gen_arith_imm(ctx, OPC_RISC_SLLIW, a->rd, a->rs1, a->shamt);
+    return true;
+}
+
+static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
+{
+    gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_IW, a->rd, a->rs1, a->shamt);
+    return true;
+}
+
+static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
+{
+    gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_IW , a->rd, a->rs1,
+                  a->shamt | 0x400);
+    return true;
+}
+
+static bool trans_addw(DisasContext *ctx, arg_addw *a)
+{
+    gen_arith(ctx, OPC_RISC_ADDW, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_subw(DisasContext *ctx, arg_subw *a)
+{
+    gen_arith(ctx, OPC_RISC_SUBW, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
+{
+    gen_arith(ctx, OPC_RISC_SLLW, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
+{
+    gen_arith(ctx, OPC_RISC_SRLW, a->rd, a->rs1, a->rs2);
+    return true;
+}
+
+static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
+{
+    gen_arith(ctx, OPC_RISC_SRAW, a->rd, a->rs1, a->rs2);
+    return true;
+}
+#endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 2e35142ca2a4..1ae84dcd5992 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1908,15 +1908,6 @@ static void decode_RV32_64G(DisasContext *ctx)
     imm = GET_IMM(ctx->opcode);
 
     switch (op) {
-    case OPC_RISC_ARITH_IMM:
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_ARITH_IMM_W:
-#endif
-        if (rd == 0) {
-            break; /* NOP */
-        }
-        gen_arith_imm(ctx, MASK_OP_ARITH_IMM(ctx->opcode), rd, rs1, imm);
-        break;
     case OPC_RISC_ARITH:
 #if defined(TARGET_RISCV64)
     case OPC_RISC_ARITH_W:
-- 
2.19.2


