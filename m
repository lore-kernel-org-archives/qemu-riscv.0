Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOJU3-0001sz-QM
	for mharc-qemu-riscv@gnu.org; Mon, 22 Mar 2021 08:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1lOJU1-0001r5-0f; Mon, 22 Mar 2021 08:16:33 -0400
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:52977
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1lOJTr-0000z5-M5; Mon, 22 Mar 2021 08:16:27 -0400
Received: from [95.168.140.111] (helo=broc.lan)
 by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) id 1lOJTj-0000Vv-N8; Mon, 22 Mar 2021 13:16:15 +0100
From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Subject: [PATCH v2] target/riscv: Prevent lost illegal instruction exceptions
Date: Mon, 22 Mar 2021 13:16:09 +0100
Message-Id: <20210322121609.3097928-1-georg.kotheimer@kernkonzept.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2a01:4f8:1c1c:b490::2;
 envelope-from=georg.kotheimer@kernkonzept.com; helo=mx.kernkonzept.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Mar 2021 12:16:34 -0000

When decode_insn16() fails, we fall back to decode_RV32_64C() for
further compressed instruction decoding. However, prior to this change,
we did not raise an illegal instruction exception, if decode_RV32_64C()
fails to decode the instruction. This means that we skipped illegal
compressed instructions instead of raising an illegal instruction
exception.

Instead of patching decode_RV32_64C(), we can just remove it,
as it is dead code since f330433b363 anyway.

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
---
 target/riscv/translate.c | 179 +--------------------------------------
 1 file changed, 1 insertion(+), 178 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0f28b5f41e..2f9f5ccc62 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -67,20 +67,6 @@ typedef struct DisasContext {
     CPUState *cs;
 } DisasContext;
 
-#ifdef TARGET_RISCV64
-/* convert riscv funct3 to qemu memop for load/store */
-static const int tcg_memop_lookup[8] = {
-    [0 ... 7] = -1,
-    [0] = MO_SB,
-    [1] = MO_TESW,
-    [2] = MO_TESL,
-    [3] = MO_TEQ,
-    [4] = MO_UB,
-    [5] = MO_TEUW,
-    [6] = MO_TEUL,
-};
-#endif
-
 #ifdef TARGET_RISCV64
 #define CASE_OP_32_64(X) case X: case glue(X, W)
 #else
@@ -374,48 +360,6 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-#ifdef TARGET_RISCV64
-static void gen_load_c(DisasContext *ctx, uint32_t opc, int rd, int rs1,
-        target_long imm)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    gen_get_gpr(t0, rs1);
-    tcg_gen_addi_tl(t0, t0, imm);
-    int memop = tcg_memop_lookup[(opc >> 12) & 0x7];
-
-    if (memop < 0) {
-        gen_exception_illegal(ctx);
-        return;
-    }
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
-    gen_set_gpr(rd, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-}
-
-static void gen_store_c(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
-        target_long imm)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-    gen_get_gpr(t0, rs1);
-    tcg_gen_addi_tl(t0, t0, imm);
-    gen_get_gpr(dat, rs2);
-    int memop = tcg_memop_lookup[(opc >> 12) & 0x7];
-
-    if (memop < 0) {
-        gen_exception_illegal(ctx);
-        return;
-    }
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-}
-#endif
-
 #ifndef CONFIG_USER_ONLY
 /* The states of mstatus_fs are:
  * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
@@ -447,83 +391,6 @@ static void mark_fs_dirty(DisasContext *ctx)
 static inline void mark_fs_dirty(DisasContext *ctx) { }
 #endif
 
-#if !defined(TARGET_RISCV64)
-static void gen_fp_load(DisasContext *ctx, uint32_t opc, int rd,
-        int rs1, target_long imm)
-{
-    TCGv t0;
-
-    if (ctx->mstatus_fs == 0) {
-        gen_exception_illegal(ctx);
-        return;
-    }
-
-    t0 = tcg_temp_new();
-    gen_get_gpr(t0, rs1);
-    tcg_gen_addi_tl(t0, t0, imm);
-
-    switch (opc) {
-    case OPC_RISC_FLW:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        tcg_gen_qemu_ld_i64(cpu_fpr[rd], t0, ctx->mem_idx, MO_TEUL);
-        /* RISC-V requires NaN-boxing of narrower width floating point values */
-        tcg_gen_ori_i64(cpu_fpr[rd], cpu_fpr[rd], 0xffffffff00000000ULL);
-        break;
-    case OPC_RISC_FLD:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        tcg_gen_qemu_ld_i64(cpu_fpr[rd], t0, ctx->mem_idx, MO_TEQ);
-        break;
-    do_illegal:
-    default:
-        gen_exception_illegal(ctx);
-        break;
-    }
-    tcg_temp_free(t0);
-
-    mark_fs_dirty(ctx);
-}
-
-static void gen_fp_store(DisasContext *ctx, uint32_t opc, int rs1,
-        int rs2, target_long imm)
-{
-    TCGv t0;
-
-    if (ctx->mstatus_fs == 0) {
-        gen_exception_illegal(ctx);
-        return;
-    }
-
-    t0 = tcg_temp_new();
-    gen_get_gpr(t0, rs1);
-    tcg_gen_addi_tl(t0, t0, imm);
-
-    switch (opc) {
-    case OPC_RISC_FSW:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        tcg_gen_qemu_st_i64(cpu_fpr[rs2], t0, ctx->mem_idx, MO_TEUL);
-        break;
-    case OPC_RISC_FSD:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        tcg_gen_qemu_st_i64(cpu_fpr[rs2], t0, ctx->mem_idx, MO_TEQ);
-        break;
-    do_illegal:
-    default:
-        gen_exception_illegal(ctx);
-        break;
-    }
-
-    tcg_temp_free(t0);
-}
-#endif
-
 static void gen_set_rm(DisasContext *ctx, int rm)
 {
     TCGv_i32 t0;
@@ -537,49 +404,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
     tcg_temp_free_i32(t0);
 }
 
-static void decode_RV32_64C0(DisasContext *ctx, uint16_t opcode)
-{
-    uint8_t funct3 = extract16(opcode, 13, 3);
-    uint8_t rd_rs2 = GET_C_RS2S(opcode);
-    uint8_t rs1s = GET_C_RS1S(opcode);
-
-    switch (funct3) {
-    case 3:
-#if defined(TARGET_RISCV64)
-        /* C.LD(RV64/128) -> ld rd', offset[7:3](rs1')*/
-        gen_load_c(ctx, OPC_RISC_LD, rd_rs2, rs1s,
-                 GET_C_LD_IMM(opcode));
-#else
-        /* C.FLW (RV32) -> flw rd', offset[6:2](rs1')*/
-        gen_fp_load(ctx, OPC_RISC_FLW, rd_rs2, rs1s,
-                    GET_C_LW_IMM(opcode));
-#endif
-        break;
-    case 7:
-#if defined(TARGET_RISCV64)
-        /* C.SD (RV64/128) -> sd rs2', offset[7:3](rs1')*/
-        gen_store_c(ctx, OPC_RISC_SD, rs1s, rd_rs2,
-                  GET_C_LD_IMM(opcode));
-#else
-        /* C.FSW (RV32) -> fsw rs2', offset[6:2](rs1')*/
-        gen_fp_store(ctx, OPC_RISC_FSW, rs1s, rd_rs2,
-                     GET_C_LW_IMM(opcode));
-#endif
-        break;
-    }
-}
-
-static void decode_RV32_64C(DisasContext *ctx, uint16_t opcode)
-{
-    uint8_t op = extract16(opcode, 0, 2);
-
-    switch (op) {
-    case 0:
-        decode_RV32_64C0(ctx, opcode);
-        break;
-    }
-}
-
 static int ex_plus_1(DisasContext *ctx, int nf)
 {
     return nf + 1;
@@ -779,8 +603,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         } else {
             ctx->pc_succ_insn = ctx->base.pc_next + 2;
             if (!decode_insn16(ctx, opcode)) {
-                /* fall back to old decoder */
-                decode_RV32_64C(ctx, opcode);
+                gen_exception_illegal(ctx);
             }
         }
     } else {
-- 
2.31.0


