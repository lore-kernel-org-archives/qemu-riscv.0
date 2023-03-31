Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pi3pw-00066o-R9
	for mharc-qemu-riscv@gnu.org; Thu, 30 Mar 2023 21:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pi3ps-000643-RX; Thu, 30 Mar 2023 21:45:49 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pi3po-0005uZ-By; Thu, 30 Mar 2023 21:45:48 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAAnLFQ9OyZkGtBjDA--.31947S6;
 Fri, 31 Mar 2023 09:45:37 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 4/6] target/riscv: Add support for PC-relative translation
Date: Fri, 31 Mar 2023 09:45:28 +0800
Message-Id: <20230331014530.29805-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230331014530.29805-1-liweiwei@iscas.ac.cn>
References: <20230331014530.29805-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAnLFQ9OyZkGtBjDA--.31947S6
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar47Gw4kCr4fCw18Jw1kXwb_yoWxCFW3pF
 1fCF42vFWDJFWfXayftw4UAF43Wa1Skry8Kw1fGw4kGF4agrWUCF4DKayakFyUZFWrur90
 kFZ8AFy3Zw48WFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4U
 JVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
 0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
 JVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxV
 A2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
 x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
 43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
 WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
 OBTYUUUUU
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
X-List-Received-Date: Fri, 31 Mar 2023 01:45:49 -0000

Add a base save_pc For PC-relative translation(CF_PCREL).
Diable the directly sync pc from tb by riscv_cpu_synchronize_from_tb.
Sync pc before it's used or updated from tb related pc:
   real_pc = (old)env->pc + target_pc(from tb) - ctx->save_pc

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c                      | 29 ++++++++-----
 target/riscv/insn_trans/trans_rvi.c.inc | 19 ++++++++-
 target/riscv/translate.c                | 54 +++++++++++++++++++++----
 3 files changed, 82 insertions(+), 20 deletions(-)

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
index 0b33f125b1..2d8f6c7d12 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -38,7 +38,15 @@ static bool trans_lui(DisasContext *ctx, arg_lui *a)
 
 static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
 {
-    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
+    assert(ctx->pc_save != -1);
+    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
+        TCGv target_pc = dest_gpr(ctx, a->rd);
+        tcg_gen_addi_tl(target_pc, cpu_pc, a->imm + ctx->base.pc_next -
+                                           ctx->pc_save);
+        gen_set_gpr(ctx, a->rd, target_pc);
+    } else {
+        gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
+    }
     return true;
 }
 
@@ -68,7 +76,14 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
         tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
     }
 
-    gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
+    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
+        TCGv succ_pc = dest_gpr(ctx, a->rd);
+        tcg_gen_addi_tl(succ_pc, cpu_pc, ctx->pc_succ_insn - ctx->pc_save);
+        gen_set_gpr(ctx, a->rd, succ_pc);
+    } else {
+        gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
+    }
+
     tcg_gen_mov_tl(cpu_pc, target_pc);
     lookup_and_goto_ptr(ctx);
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7b5223efc2..c291f90012 100644
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
@@ -225,10 +226,20 @@ static void decode_save_opc(DisasContext *ctx)
 static void gen_get_target_pc(TCGv target, DisasContext *ctx,
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
+
+        ctx->pc_save = dest;
+    } else {
+        if (get_xl(ctx) == MXL_RV32) {
+            dest = (int32_t)dest;
+        }
+        tcg_gen_movi_tl(target, dest);
     }
-    tcg_gen_movi_tl(target, dest);
 }
 
 static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
@@ -287,8 +298,21 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
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
@@ -555,8 +579,16 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
         }
     }
 
-    gen_set_gpri(ctx, rd, ctx->pc_succ_insn);
-    gen_goto_tb(ctx, 0, ctx->base.pc_next + imm); /* must use this for safety */
+    assert(ctx->pc_save != -1);
+    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
+        TCGv succ_pc = dest_gpr(ctx, rd);
+        tcg_gen_addi_tl(succ_pc, cpu_pc, ctx->pc_succ_insn - ctx->pc_save);
+        gen_set_gpr(ctx, rd, succ_pc);
+    } else {
+        gen_set_gpri(ctx, rd, ctx->pc_succ_insn);
+    }
+
+    gen_goto_tb(ctx, 0, next_pc); /* must use this for safety */
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -1150,6 +1182,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     RISCVCPU *cpu = RISCV_CPU(cs);
     uint32_t tb_flags = ctx->base.tb->flags;
 
+    ctx->pc_save = ctx->base.pc_first;
     ctx->pc_succ_insn = ctx->base.pc_first;
     ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
     ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
@@ -1195,8 +1228,13 @@ static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
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


