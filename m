Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwt7-0001ga-KR
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:55:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwt3-0001cv-Nz
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwsr-0002EL-2Y
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:41 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:32782)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwso-000113-UK
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:36 -0500
Received: by mail-pl1-x643.google.com with SMTP id y10so1359518plp.0
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=sAib+0ImwrCKDVdMy1IS6ls4fK2/5kQQzAdcIjQqNIU=;
	b=WJCKb8Nw7fvSE2UX/yNfoVUIASjtbpVTTMg03tYFGnzyy52tv01hdP2S1/uGT5sHMg
	grvKtBQbNjJHZtWJ8PwZJqKDtPtLn8Oxeq8LUvFpLQx+ok9ZmDIctsbDPQ3s26egbjxm
	ahyM/KoiQMGlL9CWdBriVe8kV3sOgTUtr4at3+6g+dwwSDENse6904ij1e6rww8Wact3
	3PSh2F4prPcxmgLfz+6anMFPJmtWGZjXTvRfGhLJ52VMWm3Ai6CdIAPTcIMSg6eRKHt0
	vXVYo/H23H/ACS6lrRKbcPWwRBPtIhNGT9Y+76vRUao+Fs3aBQA6Af6KzYyi71w5ttmh
	x+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=sAib+0ImwrCKDVdMy1IS6ls4fK2/5kQQzAdcIjQqNIU=;
	b=JIx6l04Wk3R/q+F20inLqRRloMd0EInokqQdMgsjeos6lyhSQAyiibhy6q+hw3SVeX
	lduKvQwir94dj1UFeNi5lUosxqgHcKCpOYVG1bziROoFo3d+iJTcywe9H4uEr0MQU2As
	x7lsMFZgUL7NUr8Dv8S9fds3xqmagThxJHmYMxtVJKLFojmGxk0Cj4oyXDOIwuo1yRAs
	ku7q7Qjdg2ptyiYa3eDR03lF1P7EVbq9VyDeRilIhGSlSg59ty8ERxJZtaLBHYVmcHYP
	T1tHplSPFveKZK4XXuqw1d/v5Dt6qbg2+XEA4xEWAuet+z16B+n/NmshQuY/SOoH/L0R
	FOvw==
X-Gm-Message-State: AHQUAuYVUcoDFgfX88SQvH/BiR29TazuVyQXp96OPW5pR5i5pA8LPxJ/
	WJx4QC0I+DwkF2woHZ2OcrFz5w==
X-Google-Smtp-Source: AHgI3IarFEzcqo0FcXebbtM0U9IxI8/K5RAUAVcrCjeHHWE0XF+jgzMtRQg4OmU+f6X1LwNWmMlTXA==
X-Received: by 2002:a17:902:e486:: with SMTP id
	cj6mr1199781plb.86.1550073286526; 
	Wed, 13 Feb 2019 07:54:46 -0800 (PST)
Received: from localhost ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id t3sm9384441pga.31.2019.02.13.07.54.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:54:45 -0800 (PST)
Date: Wed, 13 Feb 2019 07:53:45 -0800
Message-Id: <20190213155414.22285-7-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-riscv] [PATCH v7 06/35] target/riscv: Convert RVXI arithmetic
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
X-List-Received-Date: Wed, 13 Feb 2019 15:55:52 -0000

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
index 3b0bcc33d0fe..bb02ef23e791 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1909,15 +1909,6 @@ static void decode_RV32_64G(DisasContext *ctx)
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
2.18.1


