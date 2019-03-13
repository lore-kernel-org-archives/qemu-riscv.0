Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h456L-00017e-W0
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h456C-0000I0-CK
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h450W-0003wF-0a
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:25 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41540)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h450V-0003uf-Qc
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:23 -0400
Received: by mail-pf1-x42c.google.com with SMTP id d25so1512095pfn.8
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=P9FjnbEFkBTQ8rWMfxLuhdE8g4DmS/Hmjl3GuCPBGOY=;
	b=LZG4wgfOq8MmIs334taCF1t59z9cT71yi4JAkOcM4fqDvvZKwpqr+TZboQ/bQgXptF
	aj79qdGu+O8lwzQtOj73N+X237Xh2OP08P6uhiYkrfOXD2ny9c8BZ80+2NQGvtph/v3y
	aBd1ogZUbGiqISUb4qebV062NygjnL4lUqvZHQeG/MHiD1dxypbdggKj47CtrGApEIYo
	vGgfHslQj+3MW/RSoWcz/psi0MRG+lE+JqstZdtkrNs6YkOMttlt+ImNbadESR6SrzH6
	DDLCNNzGHjFbmmy5tulstCchSDGJW/i6aFOXOCYuGiYK9NDvE9h0PmJBv/aD7JQZp/AR
	T2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=P9FjnbEFkBTQ8rWMfxLuhdE8g4DmS/Hmjl3GuCPBGOY=;
	b=caWn9AYegW0bO7jU//I4+1/A9Js4Dh6VFr1AR/GKkOecXPGBYJFgkFa1T4IHGGFShI
	YC3yvMU3ASFHi1/xPvLk+QUf6lVJxIcqNPAnL0FgvdGqo9oNaG3Zx+8z0zUK5JxF48Z5
	kPKwT7mZpoRMTVCqmFKgkLbZXD6kQiuRKMWeTG8kAfnHT3oZIEDrTnGvG3nFSjIu6qQC
	XtZ1G1t7n/DKq3HNoaCkyFjKGV3ydlLyiVCOeRNreBO3sdgKfk9O4CP7KEW05OrBiG6G
	JTl+s3vD2brq1O8ylYnH4MIHTleSzwo6rdzw6TdYve5cyAVjtzJAoPDqygU0jIJrv534
	mLfg==
X-Gm-Message-State: APjAAAUf/rfPU6RGz8uwglxUOXVML0T0TI1QQwgW4og8KWlFvu8c5Us4
	J2mCF9A7/MUYSvYBodCkjQzDgGDVfTrBm05W
X-Google-Smtp-Source: APXvYqwZybMMcNucvb4rtsO6rPNWudA01E1TfD4aiK+UoJV2U4RjxEkhnqNxrm+xr+OHfJpYkhFSwg==
X-Received: by 2002:a17:902:8303:: with SMTP id
	bd3mr46586930plb.10.1552487842506; 
	Wed, 13 Mar 2019 07:37:22 -0700 (PDT)
Received: from localhost ([122.146.90.161]) by smtp.gmail.com with ESMTPSA id
	m67sm17841837pfj.70.2019.03.13.07.37.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:37:21 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:38 -0700
Message-Id: <20190313143705.29129-3-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::42c
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
X-List-Received-Date: Wed, 13 Mar 2019 14:43:17 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
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


