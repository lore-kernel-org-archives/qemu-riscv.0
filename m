Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHqx7-0005zD-1A
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 09:54:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gHqQo-00046u-4O
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 09:21:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gHqQf-0002Mx-NB
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 09:21:08 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:39846)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gHqQY-00029P-JN; Wed, 31 Oct 2018 09:20:54 -0400
Received: from magmaria.uni-paderborn.de ([131.234.189.24]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 nylar)
	id 1gHqQX-0005gM-NN; Wed, 31 Oct 2018 14:20:53 +0100
Received: from mail.uni-paderborn.de by magmaria with queue id 2959331-3;
	Wed, 31 Oct 2018 13:20:53 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
Received: from [131.234.87.238] (helo=mustique.hni.uni-paderborn.de)
	by mail.uni-paderborn.de with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89 nylar)
	id 1gHqQX-0005dh-Mt; Wed, 31 Oct 2018 14:20:53 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: mjc@sifive.com, sagark@eecs.berkeley.edu, palmer@sifive.com,
	kbastian@mail.uni-paderborn.de, Alistair.Francis@wdc.com
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Date: Wed, 31 Oct 2018 14:19:58 +0100
Message-Id: <20181031132029.4887-5-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.5.2775670, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2018.10.31.131216, AntiVirus-Engine: 5.53.0,
	AntiVirus-Data: 2018.10.10.5530001
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
X-Mailman-Approved-At: Wed, 31 Oct 2018 09:54:24 -0400
Subject: [Qemu-riscv] [PATCH v3 04/35] target/riscv: Convert RV32I
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
X-List-Received-Date: Wed, 31 Oct 2018 13:21:11 -0000

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
v2 -> v3:
    - split into two patches for RV32 and RV64
    - dropped insn argument of trans_foo functions

 target/riscv/insn32.decode              | 10 ++++
 target/riscv/insn_trans/trans_rvi.inc.c | 64 +++++++++++++++++++++----
 2 files changed, 66 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 81f56c16b4..076de873c4 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -23,6 +23,7 @@
 
 # immediates:
 %imm_i    20:s12
+%imm_s    25:s7 7:5
 %imm_b    31:s1 7:1 25:6 8:4     !function=ex_shift_1
 %imm_j    31:s1 12:8 20:1 21:10  !function=ex_shift_1
 %imm_u    12:s20                 !function=ex_shift_12
@@ -33,6 +34,7 @@
 # Formats 32:
 @i       ............    ..... ... ..... .......         imm=%imm_i     %rs1 %rd
 @b       .......   ..... ..... ... ..... ....... &b      imm=%imm_b %rs2 %rs1
+@s       .......   ..... ..... ... ..... .......         imm=%imm_s %rs2 %rs1
 @u       ....................      ..... .......         imm=%imm_u          %rd
 @j       ....................      ..... .......         imm=%imm_j          %rd
 
@@ -47,3 +49,11 @@ blt      ....... .....    ..... 100 ..... 1100011 @b
 bge      ....... .....    ..... 101 ..... 1100011 @b
 bltu     ....... .....    ..... 110 ..... 1100011 @b
 bgeu     ....... .....    ..... 111 ..... 1100011 @b
+lb       ............     ..... 000 ..... 0000011 @i
+lh       ............     ..... 001 ..... 0000011 @i
+lw       ............     ..... 010 ..... 0000011 @i
+lbu      ............     ..... 100 ..... 0000011 @i
+lhu      ............     ..... 101 ..... 0000011 @i
+sb       .......  .....   ..... 000 ..... 0100011 @s
+sh       .......  .....   ..... 001 ..... 0100011 @s
+sw       .......  .....   ..... 010 ..... 0100011 @s
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index eaeab20282..f3b88ebb69 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -34,51 +34,99 @@ static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
     return true;
 }
 
-static bool trans_jal(DisasContext *ctx, arg_jal *a, uint32_t insn)
+static bool trans_jal(DisasContext *ctx, arg_jal *a)
 {
     gen_jal(ctx->env, ctx, a->rd, a->imm);
     return true;
 }
 
-static bool trans_jalr(DisasContext *ctx, arg_jalr *a, uint32_t insn)
+static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
 {
     gen_jalr(ctx->env, ctx, OPC_RISC_JALR, a->rd, a->rs1, a->imm);
     return true;
 }
 
-static bool trans_beq(DisasContext *ctx, arg_beq *a, uint32_t insn)
+static bool trans_beq(DisasContext *ctx, arg_beq *a)
 {
     gen_branch(ctx->env, ctx, OPC_RISC_BEQ, a->rs1, a->rs2, a->imm);
     return true;
 }
 
-static bool trans_bne(DisasContext *ctx, arg_bne *a, uint32_t insn)
+static bool trans_bne(DisasContext *ctx, arg_bne *a)
 {
     gen_branch(ctx->env, ctx, OPC_RISC_BNE, a->rs1, a->rs2, a->imm);
     return true;
 }
 
-static bool trans_blt(DisasContext *ctx, arg_blt *a, uint32_t insn)
+static bool trans_blt(DisasContext *ctx, arg_blt *a)
 {
     gen_branch(ctx->env, ctx, OPC_RISC_BLT, a->rs1, a->rs2, a->imm);
     return true;
 }
 
-static bool trans_bge(DisasContext *ctx, arg_bge *a, uint32_t insn)
+static bool trans_bge(DisasContext *ctx, arg_bge *a)
 {
     gen_branch(ctx->env, ctx, OPC_RISC_BGE, a->rs1, a->rs2, a->imm);
     return true;
 }
 
-static bool trans_bltu(DisasContext *ctx, arg_bltu *a, uint32_t insn)
+static bool trans_bltu(DisasContext *ctx, arg_bltu *a)
 {
     gen_branch(ctx->env, ctx, OPC_RISC_BLTU, a->rs1, a->rs2, a->imm);
     return true;
 }
 
-static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a, uint32_t insn)
+static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
 {
 
     gen_branch(ctx->env, ctx, OPC_RISC_BGEU, a->rs1, a->rs2, a->imm);
     return true;
 }
+
+static bool trans_lb(DisasContext *ctx, arg_lb *a)
+{
+    gen_load(ctx, OPC_RISC_LB, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_lh(DisasContext *ctx, arg_lh *a)
+{
+    gen_load(ctx, OPC_RISC_LH, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_lw(DisasContext *ctx, arg_lw *a)
+{
+    gen_load(ctx, OPC_RISC_LW, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_lbu(DisasContext *ctx, arg_lbu *a)
+{
+    gen_load(ctx, OPC_RISC_LBU, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
+{
+    gen_load(ctx, OPC_RISC_LHU, a->rd, a->rs1, a->imm);
+    return true;
+}
+
+static bool trans_sb(DisasContext *ctx, arg_sb *a)
+{
+    gen_store(ctx, OPC_RISC_SB, a->rs1, a->rs2, a->imm);
+    return true;
+}
+
+static bool trans_sh(DisasContext *ctx, arg_sh *a)
+{
+    gen_store(ctx, OPC_RISC_SH, a->rs1, a->rs2, a->imm);
+    return true;
+}
+
+static bool trans_sw(DisasContext *ctx, arg_sw *a)
+{
+    gen_store(ctx, OPC_RISC_SW, a->rs1, a->rs2, a->imm);
+    return true;
+}
-- 
2.19.1


