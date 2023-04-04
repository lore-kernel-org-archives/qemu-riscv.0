Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjW4y-0002yu-Qi
	for mharc-qemu-riscv@gnu.org; Mon, 03 Apr 2023 22:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjW4x-0002xw-7c; Mon, 03 Apr 2023 22:07:23 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjW4u-000181-5T; Mon, 03 Apr 2023 22:07:22 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAD3_s4+hitkdVLLDQ--.57109S6;
 Tue, 04 Apr 2023 10:06:57 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 4/6] target/riscv: Add support for PC-relative translation
Date: Tue,  4 Apr 2023 10:06:51 +0800
Message-Id: <20230404020653.18911-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230404020653.18911-1-liweiwei@iscas.ac.cn>
References: <20230404020653.18911-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_s4+hitkdVLLDQ--.57109S6
X-Coremail-Antispam: 1UD129KBjvJXoWxtFy3Jw48WFykuFy5Kr1xZrb_yoW3tF45pF
 1fCr42vFWDJFWrZayrWF4UAF45Xa1SkrW0kw1fKw4kKF43trWUGa1DKayakFWUuFZ5ur1Y
 yFZ8AFyUZw4jqFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j
 6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
 IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
 xan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQ
 SdkUUUUU=
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Apr 2023 02:07:23 -0000

Add a base pc_save for PC-relative translation(CF_PCREL).
Diable the directly sync pc from tb by riscv_cpu_synchronize_from_tb.
We can get pc-relative address from following formula:
  real_pc = (old)env->pc + diff, where diff = target_pc - ctx->pc_save.
Use gen_get_target_pc to compute target address of auipc and successor
address of jalr and jal.

The existence of CF_PCREL can improve performance with the guest
kernel's address space randomization.  Each guest process maps libc.so
(et al) at a different virtual address, and this allows those
translations to be shared.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c                      | 29 +++++++++------
 target/riscv/insn_trans/trans_rvi.c.inc | 14 ++++++--
 target/riscv/translate.c                | 48 ++++++++++++++++++++-----
 3 files changed, 70 insertions(+), 21 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e97473af2..646fa31a59 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -658,16 +658,18 @@ static vaddr riscv_cpu_get_pc(CPUState *cs)
 static void riscv_cpu_synchronize_from_tb(CPUState *cs,
                                           const TranslationBlock *tb)
 {
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
+    if (!(tb_cflags(tb) & CF_PCREL)) {
+        RISCVCPU *cpu = RISCV_CPU(cs);
+        CPURISCVState *env = &cpu->env;
+        RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
 
-    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+        tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
 
-    if (xl == MXL_RV32) {
-        env->pc = (int32_t) tb->pc;
-    } else {
-        env->pc = tb->pc;
+        if (xl == MXL_RV32) {
+            env->pc = (int32_t) tb->pc;
+        } else {
+            env->pc = tb->pc;
+        }
     }
 }
 
@@ -693,11 +695,18 @@ static void riscv_restore_state_to_opc(CPUState *cs,
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
+    target_ulong pc;
+
+    if (tb_cflags(tb) & CF_PCREL) {
+        pc = (env->pc & TARGET_PAGE_MASK) | data[0];
+    } else {
+        pc = data[0];
+    }
 
     if (xl == MXL_RV32) {
-        env->pc = (int32_t)data[0];
+        env->pc = (int32_t)pc;
     } else {
-        env->pc = data[0];
+        env->pc = pc;
     }
     env->bins = data[1];
 }
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index cc72864d32..7cbbdac5aa 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -38,7 +38,9 @@ static bool trans_lui(DisasContext *ctx, arg_lui *a)
 
 static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
 {
-    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
+    TCGv target_pc = dest_gpr(ctx, a->rd);
+    gen_pc_plus_diff(target_pc, ctx, a->imm + ctx->base.pc_next);
+    gen_set_gpr(ctx, a->rd, target_pc);
     return true;
 }
 
@@ -52,6 +54,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
 {
     TCGLabel *misaligned = NULL;
     TCGv target_pc = tcg_temp_new();
+    TCGv succ_pc = dest_gpr(ctx, a->rd);
 
     tcg_gen_addi_tl(target_pc, get_gpr(ctx, a->rs1, EXT_NONE), a->imm);
     tcg_gen_andi_tl(target_pc, target_pc, (target_ulong)-2);
@@ -68,7 +71,9 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
         tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
     }
 
-    gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
+    gen_pc_plus_diff(succ_pc, ctx, ctx->pc_succ_insn);
+    gen_set_gpr(ctx, a->rd, succ_pc);
+
     tcg_gen_mov_tl(cpu_pc, target_pc);
     lookup_and_goto_ptr(ctx);
 
@@ -159,6 +164,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
     TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
     TCGv src2 = get_gpr(ctx, a->rs2, EXT_SIGN);
     target_ulong next_pc;
+    target_ulong orig_pc_save = ctx->pc_save;
 
     if (get_xl(ctx) == MXL_RV128) {
         TCGv src1h = get_gprh(ctx, a->rs1);
@@ -175,6 +181,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 
     gen_set_label(l); /* branch taken */
 
+    ctx->pc_save = orig_pc_save;
     next_pc = ctx->base.pc_next + a->imm;
     if (!has_ext(ctx, RVC) && (next_pc & 0x3)) {
         /* misaligned */
@@ -182,8 +189,9 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
         gen_pc_plus_diff(target_pc, ctx, next_pc);
         gen_exception_inst_addr_mis(ctx, target_pc);
     } else {
-        gen_goto_tb(ctx, 0, ctx->base.pc_next + a->imm);
+        gen_goto_tb(ctx, 0, next_pc);
     }
+    ctx->pc_save = -1;
     ctx->base.is_jmp = DISAS_NORETURN;
 
     return true;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d434fedb37..4623749602 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -59,6 +59,7 @@ typedef struct DisasContext {
     DisasContextBase base;
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
+    target_ulong pc_save;
     target_ulong priv_ver;
     RISCVMXL misa_mxl_max;
     RISCVMXL xl;
@@ -225,15 +226,24 @@ static void decode_save_opc(DisasContext *ctx)
 static void gen_pc_plus_diff(TCGv target, DisasContext *ctx,
                               target_ulong dest)
 {
-    if (get_xl(ctx) == MXL_RV32) {
-        dest = (int32_t)dest;
+    assert(ctx->pc_save != -1);
+    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
+        tcg_gen_addi_tl(target, cpu_pc, dest - ctx->pc_save);
+        if (get_xl(ctx) == MXL_RV32) {
+            tcg_gen_ext32s_tl(target, target);
+        }
+    } else {
+        if (get_xl(ctx) == MXL_RV32) {
+            dest = (int32_t)dest;
+        }
+        tcg_gen_movi_tl(target, dest);
     }
-    tcg_gen_movi_tl(target, dest);
 }
 
 static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
 {
     gen_pc_plus_diff(cpu_pc, ctx, dest);
+    ctx->pc_save = dest;
 }
 
 static void generate_exception(DisasContext *ctx, int excp)
@@ -287,8 +297,21 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
       * direct block chain benefits will be small.
       */
     if (translator_use_goto_tb(&ctx->base, dest) && !ctx->itrigger) {
-        tcg_gen_goto_tb(n);
-        gen_set_pc_imm(ctx, dest);
+        /*
+         * For pcrel, the pc must always be up-to-date on entry to
+         * the linked TB, so that it can use simple additions for all
+         * further adjustments.  For !pcrel, the linked TB is compiled
+         * to know its full virtual address, so we can delay the
+         * update to pc to the unlinked path.  A long chain of links
+         * can thus avoid many updates to the PC.
+         */
+        if (tb_cflags(ctx->base.tb) & CF_PCREL) {
+            gen_set_pc_imm(ctx, dest);
+            tcg_gen_goto_tb(n);
+        } else {
+            tcg_gen_goto_tb(n);
+            gen_set_pc_imm(ctx, dest);
+        }
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
         gen_set_pc_imm(ctx, dest);
@@ -543,6 +566,7 @@ static void gen_set_fpr_d(DisasContext *ctx, int reg_num, TCGv_i64 t)
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     target_ulong next_pc;
+    TCGv succ_pc = dest_gpr(ctx, rd);
 
     /* check misaligned: */
     next_pc = ctx->base.pc_next + imm;
@@ -555,8 +579,10 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
         }
     }
 
-    gen_set_gpri(ctx, rd, ctx->pc_succ_insn);
-    gen_goto_tb(ctx, 0, ctx->base.pc_next + imm); /* must use this for safety */
+    gen_pc_plus_diff(succ_pc, ctx, ctx->pc_succ_insn);
+    gen_set_gpr(ctx, rd, succ_pc);
+
+    gen_goto_tb(ctx, 0, next_pc); /* must use this for safety */
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -1150,6 +1176,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     RISCVCPU *cpu = RISCV_CPU(cs);
     uint32_t tb_flags = ctx->base.tb->flags;
 
+    ctx->pc_save = ctx->base.pc_first;
     ctx->pc_succ_insn = ctx->base.pc_first;
     ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
     ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
@@ -1195,8 +1222,13 @@ static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
 static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    target_ulong pc_next = ctx->base.pc_next;
+
+    if (tb_cflags(dcbase->tb) & CF_PCREL) {
+        pc_next &= ~TARGET_PAGE_MASK;
+    }
 
-    tcg_gen_insn_start(ctx->base.pc_next, 0);
+    tcg_gen_insn_start(pc_next, 0);
     ctx->insn_start = tcg_last_op();
 }
 
-- 
2.25.1


