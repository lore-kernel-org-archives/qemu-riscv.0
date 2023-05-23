Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C1CC7EE23
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 14:12:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1SaC-0000Tw-0C; Tue, 23 May 2023 10:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1SZP-0007kA-KO; Tue, 23 May 2023 10:01:04 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1SYi-0004my-GJ; Tue, 23 May 2023 10:00:25 -0400
Received: from localhost.localdomain (unknown [61.165.37.98])
 by APP-05 (Coremail) with SMTP id zQCowACHj4vixmxk5Uy2Aw--.17075S8;
 Tue, 23 May 2023 22:00:06 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 6/7] target/riscv: Enable PC-relative translation
Date: Tue, 23 May 2023 21:59:38 +0800
Message-Id: <20230523135939.299246-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230523135939.299246-1-liweiwei@iscas.ac.cn>
References: <20230523135939.299246-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACHj4vixmxk5Uy2Aw--.17075S8
X-Coremail-Antispam: 1UD129KBjvJXoWxtw4fAFW8Xw43Xw45Ww1UGFg_yoW3Kw48pF
 4FkF42vFZ8JFWfZayfKF4UAF43Xw4SkrW0kwnakw4kGa15XrWUGF4DKa1akFWUZFZ5ur1Y
 kFWDAF1UZw4UXFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCY02Avz4vE14v_Xryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
 Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
 CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0
 I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
 C2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVj
 vjDU0xZFpf9x0JUBbyZUUUUU=
X-Originating-IP: [61.165.37.98]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Add a base pc_save for PC-relative translation(CF_PCREL).
Diable the directly sync pc from tb by riscv_cpu_synchronize_from_tb.
Use gen_pc_plus_diff to get the pc-relative address.
Enable CF_PCREL in System mode.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c                        | 31 ++++++++++-----
 target/riscv/insn_trans/trans_rvi.c.inc   | 12 +++++-
 target/riscv/insn_trans/trans_rvzce.c.inc |  4 +-
 target/riscv/translate.c                  | 47 +++++++++++++++++++----
 4 files changed, 74 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index db0875fb43..e4606c0b2e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -690,16 +690,18 @@ static vaddr riscv_cpu_get_pc(CPUState *cs)
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
 
@@ -725,11 +727,18 @@ static void riscv_restore_state_to_opc(CPUState *cs,
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
@@ -1246,6 +1255,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
 
 #ifndef CONFIG_USER_ONLY
+    cs->tcg_cflags |= CF_PCREL;
+
     if (cpu->cfg.ext_sstc) {
         riscv_timer_init(cpu);
     }
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index d6eef67b45..28fe69c34b 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -38,7 +38,9 @@ static bool trans_lui(DisasContext *ctx, arg_lui *a)
 
 static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
 {
-    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
+    TCGv target_pc = dest_gpr(ctx, a->rd);
+    gen_pc_plus_diff(target_pc, ctx, a->imm);
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
+    gen_pc_plus_diff(succ_pc, ctx, ctx->cur_insn_len);
+    gen_set_gpr(ctx, a->rd, succ_pc);
+
     tcg_gen_mov_tl(cpu_pc, target_pc);
     lookup_and_goto_ptr(ctx);
 
@@ -158,6 +163,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
     TCGLabel *l = gen_new_label();
     TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
     TCGv src2 = get_gpr(ctx, a->rs2, EXT_SIGN);
+    target_ulong orig_pc_save = ctx->pc_save;
 
     if (get_xl(ctx) == MXL_RV128) {
         TCGv src1h = get_gprh(ctx, a->rs1);
@@ -171,6 +177,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
         tcg_gen_brcond_tl(cond, src1, src2, l);
     }
     gen_goto_tb(ctx, 1, ctx->cur_insn_len);
+    ctx->pc_save = orig_pc_save;
 
     gen_set_label(l); /* branch taken */
 
@@ -182,6 +189,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
     } else {
         gen_goto_tb(ctx, 0, a->imm);
     }
+    ctx->pc_save = -1;
     ctx->base.is_jmp = DISAS_NORETURN;
 
     return true;
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
index 450b79dcbc..8d8a64f493 100644
--- a/target/riscv/insn_trans/trans_rvzce.c.inc
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -302,7 +302,9 @@ static bool trans_cm_jalt(DisasContext *ctx, arg_cm_jalt *a)
 
     /* c.jt vs c.jalt depends on the index. */
     if (a->index >= 32) {
-        gen_set_gpri(ctx, xRA, ctx->pc_succ_insn);
+        TCGv succ_pc = dest_gpr(ctx, xRA);
+        gen_pc_plus_diff(succ_pc, ctx, ctx->cur_insn_len);
+        gen_set_gpr(ctx, xRA, succ_pc);
     }
 
     tcg_gen_lookup_and_goto_ptr();
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c6ae489788..538187f93b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -60,6 +60,7 @@ typedef struct DisasContext {
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     target_ulong cur_insn_len;
+    target_ulong pc_save;
     target_ulong priv_ver;
     RISCVMXL misa_mxl_max;
     RISCVMXL xl;
@@ -228,15 +229,24 @@ static void gen_pc_plus_diff(TCGv target, DisasContext *ctx,
 {
     target_ulong dest = ctx->base.pc_next + diff;
 
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
 
 static void gen_update_pc(DisasContext *ctx, target_long diff)
 {
     gen_pc_plus_diff(cpu_pc, ctx, diff);
+    ctx->pc_save = ctx->base.pc_next + diff;
 }
 
 static void generate_exception(DisasContext *ctx, int excp)
@@ -292,8 +302,21 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_long diff)
       * direct block chain benefits will be small.
       */
     if (translator_use_goto_tb(&ctx->base, dest) && !ctx->itrigger) {
-        tcg_gen_goto_tb(n);
-        gen_update_pc(ctx, diff);
+        /*
+         * For pcrel, the pc must always be up-to-date on entry to
+         * the linked TB, so that it can use simple additions for all
+         * further adjustments.  For !pcrel, the linked TB is compiled
+         * to know its full virtual address, so we can delay the
+         * update to pc to the unlinked path.  A long chain of links
+         * can thus avoid many updates to the PC.
+         */
+        if (tb_cflags(ctx->base.tb) & CF_PCREL) {
+            gen_update_pc(ctx, diff);
+            tcg_gen_goto_tb(n);
+        } else {
+            tcg_gen_goto_tb(n);
+            gen_update_pc(ctx, diff);
+        }
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
         gen_update_pc(ctx, diff);
@@ -547,6 +570,8 @@ static void gen_set_fpr_d(DisasContext *ctx, int reg_num, TCGv_i64 t)
 
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
+    TCGv succ_pc = dest_gpr(ctx, rd);
+
     /* check misaligned: */
     if (!ctx->cfg_ptr->ext_zca) {
         if ((imm & 0x3) != 0) {
@@ -557,7 +582,9 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
         }
     }
 
-    gen_set_gpri(ctx, rd, ctx->pc_succ_insn);
+    gen_pc_plus_diff(succ_pc, ctx, ctx->cur_insn_len);
+    gen_set_gpr(ctx, rd, succ_pc);
+
     gen_goto_tb(ctx, 0, imm); /* must use this for safety */
     ctx->base.is_jmp = DISAS_NORETURN;
 }
@@ -1154,6 +1181,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     RISCVCPU *cpu = RISCV_CPU(cs);
     uint32_t tb_flags = ctx->base.tb->flags;
 
+    ctx->pc_save = ctx->base.pc_first;
     ctx->pc_succ_insn = ctx->base.pc_first;
     ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
     ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
@@ -1189,8 +1217,13 @@ static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
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


