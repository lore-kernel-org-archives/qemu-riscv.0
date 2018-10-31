Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHqx8-00060n-5E
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 09:54:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gHqRV-0004i6-IZ
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 09:21:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gHqRS-0002ze-Pa
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 09:21:53 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:45586)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gHqRN-0002DT-Au; Wed, 31 Oct 2018 09:21:45 -0400
Received: from tweenies.uni-paderborn.de ([131.234.189.21]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 hoth)
	id 1gHqQa-00036G-SJ; Wed, 31 Oct 2018 14:20:56 +0100
Received: from mail.uni-paderborn.de by tweenies with queue id 2934695-4;
	Wed, 31 Oct 2018 13:20:56 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
Received: from [131.234.87.238] (helo=mustique.hni.uni-paderborn.de)
	by mail.uni-paderborn.de with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89 nylar)
	id 1gHqQa-0005dh-OV; Wed, 31 Oct 2018 14:20:56 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: mjc@sifive.com, sagark@eecs.berkeley.edu, palmer@sifive.com,
	kbastian@mail.uni-paderborn.de, Alistair.Francis@wdc.com
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Date: Wed, 31 Oct 2018 14:20:15 +0100
Message-Id: <20181031132029.4887-22-kbastian@mail.uni-paderborn.de>
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
X-Mailman-Approved-At: Wed, 31 Oct 2018 09:54:25 -0400
Subject: [Qemu-riscv] [PATCH v3 21/35] target/riscv: Remove manual decoding
 from gen_branch()
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
X-List-Received-Date: Wed, 31 Oct 2018 13:21:55 -0000

We now utilizes argument-sets of decodetree such that no manual
decoding is necessary.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 46 +++++++++++++++++-------
 target/riscv/translate.c                | 47 -------------------------
 2 files changed, 33 insertions(+), 60 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 4d090d68e7..4f63b904a3 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -72,41 +72,61 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     return true;
 }
 
-static bool trans_beq(DisasContext *ctx, arg_beq *a)
+static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 {
-    gen_branch(ctx->env, ctx, OPC_RISC_BEQ, a->rs1, a->rs2, a->imm);
+    TCGLabel *l = gen_new_label();
+    TCGv source1, source2;
+    source1 = tcg_temp_new();
+    source2 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    tcg_gen_brcond_tl(cond, source1, source2, l);
+    gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
+    gen_set_label(l); /* branch taken */
+
+    if (!riscv_has_ext(ctx->env, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
+        /* misaligned */
+        gen_exception_inst_addr_mis(ctx);
+    } else {
+        gen_goto_tb(ctx, 0, ctx->base.pc_next + a->imm);
+    }
+    ctx->base.is_jmp = DISAS_NORETURN;
+
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+
     return true;
 }
 
+static bool trans_beq(DisasContext *ctx, arg_beq *a)
+{
+    return gen_branch(ctx, a, TCG_COND_EQ);
+}
+
 static bool trans_bne(DisasContext *ctx, arg_bne *a)
 {
-    gen_branch(ctx->env, ctx, OPC_RISC_BNE, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_branch(ctx, a, TCG_COND_NE);
 }
 
 static bool trans_blt(DisasContext *ctx, arg_blt *a)
 {
-    gen_branch(ctx->env, ctx, OPC_RISC_BLT, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_branch(ctx, a, TCG_COND_LT);
 }
 
 static bool trans_bge(DisasContext *ctx, arg_bge *a)
 {
-    gen_branch(ctx->env, ctx, OPC_RISC_BGE, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_branch(ctx, a, TCG_COND_GE);
 }
 
 static bool trans_bltu(DisasContext *ctx, arg_bltu *a)
 {
-    gen_branch(ctx->env, ctx, OPC_RISC_BLTU, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_branch(ctx, a, TCG_COND_LTU);
 }
 
 static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
 {
-
-    gen_branch(ctx->env, ctx, OPC_RISC_BGEU, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_branch(ctx, a, TCG_COND_GEU);
 }
 
 static bool trans_lb(DisasContext *ctx, arg_lb *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b78e423d94..585378d1e1 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -489,53 +489,6 @@ static void gen_jal(CPURISCVState *env, DisasContext *ctx, int rd,
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_branch(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
-                       int rs1, int rs2, target_long bimm)
-{
-    TCGLabel *l = gen_new_label();
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
-    gen_get_gpr(source1, rs1);
-    gen_get_gpr(source2, rs2);
-
-    switch (opc) {
-    case OPC_RISC_BEQ:
-        tcg_gen_brcond_tl(TCG_COND_EQ, source1, source2, l);
-        break;
-    case OPC_RISC_BNE:
-        tcg_gen_brcond_tl(TCG_COND_NE, source1, source2, l);
-        break;
-    case OPC_RISC_BLT:
-        tcg_gen_brcond_tl(TCG_COND_LT, source1, source2, l);
-        break;
-    case OPC_RISC_BGE:
-        tcg_gen_brcond_tl(TCG_COND_GE, source1, source2, l);
-        break;
-    case OPC_RISC_BLTU:
-        tcg_gen_brcond_tl(TCG_COND_LTU, source1, source2, l);
-        break;
-    case OPC_RISC_BGEU:
-        tcg_gen_brcond_tl(TCG_COND_GEU, source1, source2, l);
-        break;
-    default:
-        gen_exception_illegal(ctx);
-        return;
-    }
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-
-    gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
-    gen_set_label(l); /* branch taken */
-    if (!riscv_has_ext(env, RVC) && ((ctx->base.pc_next + bimm) & 0x3)) {
-        /* misaligned */
-        gen_exception_inst_addr_mis(ctx);
-    } else {
-        gen_goto_tb(ctx, 0, ctx->base.pc_next + bimm);
-    }
-    ctx->base.is_jmp = DISAS_NORETURN;
-}
-
 static void gen_load(DisasContext *ctx, uint32_t opc, int rd, int rs1,
         target_long imm)
 {
-- 
2.19.1


