Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE4CC7EE23
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 14:14:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1SaJ-0000te-Ir; Tue, 23 May 2023 10:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1SZR-0007ki-PN; Tue, 23 May 2023 10:01:09 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1SYi-0004mu-CG; Tue, 23 May 2023 10:00:35 -0400
Received: from localhost.localdomain (unknown [61.165.37.98])
 by APP-05 (Coremail) with SMTP id zQCowACHj4vixmxk5Uy2Aw--.17075S7;
 Tue, 23 May 2023 22:00:05 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 5/7] target/riscv: Use true diff for gen_pc_plus_diff
Date: Tue, 23 May 2023 21:59:37 +0800
Message-Id: <20230523135939.299246-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230523135939.299246-1-liweiwei@iscas.ac.cn>
References: <20230523135939.299246-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACHj4vixmxk5Uy2Aw--.17075S7
X-Coremail-Antispam: 1UD129KBjvJXoWxurWrCr1kCw43Kr4xXF4ruFg_yoW5Krykpr
 WFkwsrGrW5JFWFvayfKF4UAF15Jr4Ygw4Ikwnaywn3ta13JrW3ur4Dt3y3KF4UXFn5XryY
 9FWqya4Yvw48XFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reduce reliance on absolute values by using true pc difference for
gen_pc_plus_diff() to prepare for PC-relative translation.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvi.c.inc   |  6 ++----
 target/riscv/insn_trans/trans_rvzce.c.inc |  2 +-
 target/riscv/translate.c                  | 13 ++++++-------
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index f9f4d25cda..d6eef67b45 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -158,7 +158,6 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
     TCGLabel *l = gen_new_label();
     TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
     TCGv src2 = get_gpr(ctx, a->rs2, EXT_SIGN);
-    target_ulong next_pc;
 
     if (get_xl(ctx) == MXL_RV128) {
         TCGv src1h = get_gprh(ctx, a->rs1);
@@ -175,11 +174,10 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 
     gen_set_label(l); /* branch taken */
 
-    next_pc = ctx->base.pc_next + a->imm;
-    if (!ctx->cfg_ptr->ext_zca && (next_pc & 0x3)) {
+    if (!ctx->cfg_ptr->ext_zca && (a->imm & 0x3)) {
         /* misaligned */
         TCGv target_pc = tcg_temp_new();
-        gen_pc_plus_diff(target_pc, ctx, next_pc);
+        gen_pc_plus_diff(target_pc, ctx, a->imm);
         gen_exception_inst_addr_mis(ctx, target_pc);
     } else {
         gen_goto_tb(ctx, 0, a->imm);
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
index 5732d782f7..450b79dcbc 100644
--- a/target/riscv/insn_trans/trans_rvzce.c.inc
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -297,7 +297,7 @@ static bool trans_cm_jalt(DisasContext *ctx, arg_cm_jalt *a)
      * Update pc to current for the non-unwinding exception
      * that might come from cpu_ld*_code() in the helper.
      */
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+    gen_update_pc(ctx, 0);
     gen_helper_cm_jalt(cpu_pc, cpu_env, tcg_constant_i32(a->index));
 
     /* c.jt vs c.jalt depends on the index. */
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b01aa48f04..c6ae489788 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -224,8 +224,10 @@ static void decode_save_opc(DisasContext *ctx)
 }
 
 static void gen_pc_plus_diff(TCGv target, DisasContext *ctx,
-                             target_ulong dest)
+                             target_long diff)
 {
+    target_ulong dest = ctx->base.pc_next + diff;
+
     if (get_xl(ctx) == MXL_RV32) {
         dest = (int32_t)dest;
     }
@@ -234,7 +236,7 @@ static void gen_pc_plus_diff(TCGv target, DisasContext *ctx,
 
 static void gen_update_pc(DisasContext *ctx, target_long diff)
 {
-    gen_pc_plus_diff(cpu_pc, ctx, ctx->base.pc_next + diff);
+    gen_pc_plus_diff(cpu_pc, ctx, diff);
 }
 
 static void generate_exception(DisasContext *ctx, int excp)
@@ -545,14 +547,11 @@ static void gen_set_fpr_d(DisasContext *ctx, int reg_num, TCGv_i64 t)
 
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
-    target_ulong next_pc;
-
     /* check misaligned: */
-    next_pc = ctx->base.pc_next + imm;
     if (!ctx->cfg_ptr->ext_zca) {
-        if ((next_pc & 0x3) != 0) {
+        if ((imm & 0x3) != 0) {
             TCGv target_pc = tcg_temp_new();
-            gen_pc_plus_diff(target_pc, ctx, next_pc);
+            gen_pc_plus_diff(target_pc, ctx, imm);
             gen_exception_inst_addr_mis(ctx, target_pc);
             return;
         }
-- 
2.25.1


