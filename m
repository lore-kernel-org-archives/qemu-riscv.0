Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmEo0-0000HR-1P
	for mharc-qemu-riscv@gnu.org; Wed, 23 Jan 2019 04:26:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gmEnv-0000Cl-VQ
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 04:26:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gmEnu-0007OW-I8
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 04:26:39 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:35962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gmEnt-0007N9-0R; Wed, 23 Jan 2019 04:26:38 -0500
Received: from wormulon.uni-paderborn.de ([131.234.189.22]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 spheron)
	id 1gmEnq-0004Xi-Hl; Wed, 23 Jan 2019 10:26:34 +0100
Received: from mail.uni-paderborn.de by wormulon with queue id 3103316-5;
	Wed, 23 Jan 2019 09:26:33 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: sagark@eecs.berkeley.edu, palmer@sifive.com, kbastian@mail.uni-paderborn.de
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	richard.henderson@linaro.org, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>
Date: Wed, 23 Jan 2019 10:25:14 +0100
Message-Id: <20190123092538.8004-12-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
References: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.23.91816, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.18.5561000
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH v6 11/35] target/riscv: Convert RV64A insns to
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
X-List-Received-Date: Wed, 23 Jan 2019 09:26:41 -0000

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn32-64.decode           |  13 +++
 target/riscv/insn_trans/trans_rva.inc.c |  58 ++++++++++
 target/riscv/translate.c                | 140 ------------------------
 3 files changed, 71 insertions(+), 140 deletions(-)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 008f100546..0bee95c984 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -43,3 +43,16 @@ divw     0000001 .....  ..... 100 ..... 0111011 @r
 divuw    0000001 .....  ..... 101 ..... 0111011 @r
 remw     0000001 .....  ..... 110 ..... 0111011 @r
 remuw    0000001 .....  ..... 111 ..... 0111011 @r
+
+# *** RV64A Standard Extension (in addition to RV32A) ***
+lr_d       00010 . . 00000 ..... 011 ..... 0101111 @atom_ld
+sc_d       00011 . . ..... ..... 011 ..... 0101111 @atom_st
+amoswap_d  00001 . . ..... ..... 011 ..... 0101111 @atom_st
+amoadd_d   00000 . . ..... ..... 011 ..... 0101111 @atom_st
+amoxor_d   00100 . . ..... ..... 011 ..... 0101111 @atom_st
+amoand_d   01100 . . ..... ..... 011 ..... 0101111 @atom_st
+amoor_d    01000 . . ..... ..... 011 ..... 0101111 @atom_st
+amomin_d   10000 . . ..... ..... 011 ..... 0101111 @atom_st
+amomax_d   10100 . . ..... ..... 011 ..... 0101111 @atom_st
+amominu_d  11000 . . ..... ..... 011 ..... 0101111 @atom_st
+amomaxu_d  11100 . . ..... ..... 011 ..... 0101111 @atom_st
diff --git a/target/riscv/insn_trans/trans_rva.inc.c b/target/riscv/insn_trans/trans_rva.inc.c
index ab6ccf0e90..11620e030e 100644
--- a/target/riscv/insn_trans/trans_rva.inc.c
+++ b/target/riscv/insn_trans/trans_rva.inc.c
@@ -147,3 +147,61 @@ static bool trans_amomaxu_w(DisasContext *ctx, arg_amomaxu_w *a)
 {
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO_TESL));
 }
+
+#ifdef TARGET_RISCV64
+
+static bool trans_lr_d(DisasContext *ctx, arg_lr_d *a)
+{
+    return gen_lr(ctx, a, MO_ALIGN | MO_TEQ);
+}
+
+static bool trans_sc_d(DisasContext *ctx, arg_sc_d *a)
+{
+    return gen_sc(ctx, a, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amoswap_d(DisasContext *ctx, arg_amoswap_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amoadd_d(DisasContext *ctx, arg_amoadd_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amoxor_d(DisasContext *ctx, arg_amoxor_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amoand_d(DisasContext *ctx, arg_amoand_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amoor_d(DisasContext *ctx, arg_amoor_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amomin_d(DisasContext *ctx, arg_amomin_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amomax_d(DisasContext *ctx, arg_amomax_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amominu_d(DisasContext *ctx, arg_amominu_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amomaxu_d(DisasContext *ctx, arg_amomaxu_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO_TEQ));
+}
+#endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 98180002ef..944836dd7c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -711,143 +711,6 @@ static void gen_fp_store(DisasContext *ctx, uint32_t opc, int rs1,
     tcg_temp_free(t0);
 }
 
-static void gen_atomic(DisasContext *ctx, uint32_t opc,
-                      int rd, int rs1, int rs2)
-{
-    TCGv src1, src2, dat;
-    TCGLabel *l1, *l2;
-    TCGMemOp mop;
-    bool aq, rl;
-
-    /* Extract the size of the atomic operation.  */
-    switch (extract32(opc, 12, 3)) {
-    case 2: /* 32-bit */
-        mop = MO_ALIGN | MO_TESL;
-        break;
-#if defined(TARGET_RISCV64)
-    case 3: /* 64-bit */
-        mop = MO_ALIGN | MO_TEQ;
-        break;
-#endif
-    default:
-        gen_exception_illegal(ctx);
-        return;
-    }
-    rl = extract32(opc, 25, 1);
-    aq = extract32(opc, 26, 1);
-
-    src1 = tcg_temp_new();
-    src2 = tcg_temp_new();
-
-    switch (MASK_OP_ATOMIC_NO_AQ_RL_SZ(opc)) {
-    case OPC_RISC_LR:
-        /* Put addr in load_res, data in load_val.  */
-        gen_get_gpr(src1, rs1);
-        if (rl) {
-            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-        }
-        tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
-        if (aq) {
-            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
-        }
-        tcg_gen_mov_tl(load_res, src1);
-        gen_set_gpr(rd, load_val);
-        break;
-
-    case OPC_RISC_SC:
-        l1 = gen_new_label();
-        l2 = gen_new_label();
-        dat = tcg_temp_new();
-
-        gen_get_gpr(src1, rs1);
-        tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
-
-        gen_get_gpr(src2, rs2);
-        /* Note that the TCG atomic primitives are SC,
-           so we can ignore AQ/RL along this path.  */
-        tcg_gen_atomic_cmpxchg_tl(src1, load_res, load_val, src2,
-                                  ctx->mem_idx, mop);
-        tcg_gen_setcond_tl(TCG_COND_NE, dat, src1, load_val);
-        gen_set_gpr(rd, dat);
-        tcg_gen_br(l2);
-
-        gen_set_label(l1);
-        /* Address comparion failure.  However, we still need to
-           provide the memory barrier implied by AQ/RL.  */
-        tcg_gen_mb(TCG_MO_ALL + aq * TCG_BAR_LDAQ + rl * TCG_BAR_STRL);
-        tcg_gen_movi_tl(dat, 1);
-        gen_set_gpr(rd, dat);
-
-        gen_set_label(l2);
-        tcg_temp_free(dat);
-        break;
-
-    case OPC_RISC_AMOSWAP:
-        /* Note that the TCG atomic primitives are SC,
-           so we can ignore AQ/RL along this path.  */
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_xchg_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOADD:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_add_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOXOR:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_xor_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOAND:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_and_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOOR:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_or_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOMIN:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_smin_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOMAX:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_smax_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOMINU:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_umin_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOMAXU:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_umax_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-
-    default:
-        gen_exception_illegal(ctx);
-        break;
-    }
-
-    tcg_temp_free(src1);
-    tcg_temp_free(src2);
-}
-
 static void gen_set_rm(DisasContext *ctx, int rm)
 {
     TCGv_i32 t0;
@@ -1679,9 +1542,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
         gen_fp_store(ctx, MASK_OP_FP_STORE(ctx->opcode), rs1, rs2,
                      GET_STORE_IMM(ctx->opcode));
         break;
-    case OPC_RISC_ATOMIC:
-        gen_atomic(ctx, MASK_OP_ATOMIC(ctx->opcode), rd, rs1, rs2);
-        break;
     case OPC_RISC_FMADD:
         gen_fp_fmadd(ctx, MASK_OP_FP_FMADD(ctx->opcode), rd, rs1, rs2,
                      GET_RS3(ctx->opcode), GET_RM(ctx->opcode));
-- 
2.20.1


