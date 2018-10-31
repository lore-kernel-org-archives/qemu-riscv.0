Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHqxC-00067T-Sc
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 09:54:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gHqRZ-0004kr-LY
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 09:21:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gHqRX-00033g-8U
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 09:21:57 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:60478)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gHqRW-0002EO-Pt; Wed, 31 Oct 2018 09:21:55 -0400
Received: from magmaria.uni-paderborn.de ([131.234.189.24]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 spheron)
	id 1gHqQb-0004qK-G9; Wed, 31 Oct 2018 14:20:57 +0100
Received: from mail.uni-paderborn.de by magmaria with queue id 2959336-3;
	Wed, 31 Oct 2018 13:20:56 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
Received: from [131.234.87.238] (helo=mustique.hni.uni-paderborn.de)
	by mail.uni-paderborn.de with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89 nylar)
	id 1gHqQa-0005dh-P7; Wed, 31 Oct 2018 14:20:56 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: mjc@sifive.com, sagark@eecs.berkeley.edu, palmer@sifive.com,
	kbastian@mail.uni-paderborn.de, Alistair.Francis@wdc.com
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Date: Wed, 31 Oct 2018 14:20:16 +0100
Message-Id: <20181031132029.4887-23-kbastian@mail.uni-paderborn.de>
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
Subject: [Qemu-riscv] [PATCH v3 22/35] target/riscv: Remove manual decoding
 from gen_load()
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
X-List-Received-Date: Wed, 31 Oct 2018 13:21:59 -0000

With decodetree we don't need to convert RISC-V opcodes into to MemOps
as the old gen_load() did.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de><Paste>
---
v2 -> v3:
    - Since trans_c_flw_ld and trans_c_fsw_sd still rely on the old decoder
      we need to keep gen_load(). Thus we renamed it to gen_load_c.

 target/riscv/insn_trans/trans_rvi.inc.c | 35 +++++++++++++++----------
 target/riscv/translate.c                |  6 +++--
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 4f63b904a3..2816c77375 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -129,34 +129,43 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
     return gen_branch(ctx, a, TCG_COND_GEU);
 }
 
-static bool trans_lb(DisasContext *ctx, arg_lb *a)
+static bool gen_load(DisasContext *ctx, arg_lb *a, int memop)
 {
-    gen_load(ctx, OPC_RISC_LB, a->rd, a->rs1, a->imm);
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+    tcg_gen_addi_tl(t0, t0, a->imm);
+
+    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
+    gen_set_gpr(a->rd, t1);
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
     return true;
 }
 
+static bool trans_lb(DisasContext *ctx, arg_lb *a)
+{
+    return gen_load(ctx, a, MO_SB);
+}
+
 static bool trans_lh(DisasContext *ctx, arg_lh *a)
 {
-    gen_load(ctx, OPC_RISC_LH, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_load(ctx, a, MO_TESW);
 }
 
 static bool trans_lw(DisasContext *ctx, arg_lw *a)
 {
-    gen_load(ctx, OPC_RISC_LW, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_load(ctx, a, MO_TESL);
 }
 
 static bool trans_lbu(DisasContext *ctx, arg_lbu *a)
 {
-    gen_load(ctx, OPC_RISC_LBU, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_load(ctx, a, MO_UB);
 }
 
 static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
 {
-    gen_load(ctx, OPC_RISC_LHU, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_load(ctx, a, MO_TEUW);
 }
 
 static bool trans_sb(DisasContext *ctx, arg_sb *a)
@@ -180,14 +189,12 @@ static bool trans_sw(DisasContext *ctx, arg_sw *a)
 #ifdef TARGET_RISCV64
 static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
 {
-    gen_load(ctx, OPC_RISC_LWU, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_load(ctx, a, MO_TEUL);
 }
 
 static bool trans_ld(DisasContext *ctx, arg_ld *a)
 {
-    gen_load(ctx, OPC_RISC_LD, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_load(ctx, a, MO_TEQ);
 }
 
 static bool trans_sd(DisasContext *ctx, arg_sd *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 585378d1e1..605742989d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -489,7 +489,8 @@ static void gen_jal(CPURISCVState *env, DisasContext *ctx, int rd,
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_load(DisasContext *ctx, uint32_t opc, int rd, int rs1,
+#ifdef TARGET_RISCV64
+static void gen_load_c(DisasContext *ctx, uint32_t opc, int rd, int rs1,
         target_long imm)
 {
     TCGv t0 = tcg_temp_new();
@@ -508,6 +509,7 @@ static void gen_load(DisasContext *ctx, uint32_t opc, int rd, int rs1,
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 }
+#endif
 
 static void gen_store(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
         target_long imm)
@@ -641,7 +643,7 @@ static void decode_RV32_64C0(DisasContext *ctx)
     case 3:
 #if defined(TARGET_RISCV64)
         /* C.LD(RV64/128) -> ld rd', offset[7:3](rs1')*/
-        gen_load(ctx, OPC_RISC_LD, rd_rs2, rs1s,
+        gen_load_c(ctx, OPC_RISC_LD, rd_rs2, rs1s,
                  GET_C_LD_IMM(ctx->opcode));
 #else
         /* C.FLW (RV32) -> flw rd', offset[6:2](rs1')*/
-- 
2.19.1


