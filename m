Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31361C7EE2D
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 07:25:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2Rlr-00068q-SO; Fri, 26 May 2023 03:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q2Rlm-00062q-5D; Fri, 26 May 2023 03:21:53 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q2Rlg-0002Hf-Mi; Fri, 26 May 2023 03:21:49 -0400
Received: from localhost.localdomain (unknown [61.165.37.98])
 by APP-05 (Coremail) with SMTP id zQCowACnrYn3XXBkJSddBQ--.47689S6;
 Fri, 26 May 2023 15:21:30 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 4/7] target/riscv: Change gen_set_pc_imm to gen_update_pc
Date: Fri, 26 May 2023 15:21:21 +0800
Message-Id: <20230526072124.298466-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526072124.298466-1-liweiwei@iscas.ac.cn>
References: <20230526072124.298466-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnrYn3XXBkJSddBQ--.47689S6
X-Coremail-Antispam: 1UD129KBjvJXoW3AFWUZr1UCrW5tF1kZFy7Jrb_yoW7tr4kpr
 4Fkr4xKryrXFyrA3WFqFsrAF13Ja15K3y0kwn2ywn3Ja1av3yrWr4DK3Wa9r1UWF48Zrn0
 kF4qyasxurW0gFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j
 6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
 IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
 xan2IY04v7MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
 JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
 kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
 6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
 IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
 Ja73UjIFyTuYvjfUY3kuDUUUU
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

Reduce reliance on absolute values(by passing pc difference) to
prepare for PC-relative translation.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_privileged.c.inc |  2 +-
 target/riscv/insn_trans/trans_rvi.c.inc        |  6 +++---
 target/riscv/insn_trans/trans_rvv.c.inc        |  4 ++--
 target/riscv/insn_trans/trans_rvzawrs.c.inc    |  2 +-
 target/riscv/insn_trans/trans_xthead.c.inc     |  2 +-
 target/riscv/translate.c                       | 10 +++++-----
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 7c2837194c..3760fb4393 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -112,7 +112,7 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 {
 #ifndef CONFIG_USER_ONLY
     decode_save_opc(ctx);
-    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
+    gen_update_pc(ctx, ctx->cur_insn_len);
     gen_helper_wfi(cpu_env);
     return true;
 #else
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 42c4fc2e52..4de65d126d 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -777,7 +777,7 @@ static bool trans_pause(DisasContext *ctx, arg_pause *a)
      * PAUSE is a no-op in QEMU,
      * end the TB and return to main loop
      */
-    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
+    gen_update_pc(ctx, ctx->cur_insn_len);
     exit_tb(ctx);
     ctx->base.is_jmp = DISAS_NORETURN;
 
@@ -801,7 +801,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
      * FENCE_I is a no-op in QEMU,
      * however we need to end the translation block
      */
-    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
+    gen_update_pc(ctx, ctx->cur_insn_len);
     exit_tb(ctx);
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
@@ -812,7 +812,7 @@ static bool do_csr_post(DisasContext *ctx)
     /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
     decode_save_opc(ctx);
     /* We may have changed important cpu state -- exit to main loop. */
-    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
+    gen_update_pc(ctx, ctx->cur_insn_len);
     exit_tb(ctx);
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6c07eebc52..c2f7527f53 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -169,7 +169,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
     gen_set_gpr(s, rd, dst);
     mark_vs_dirty(s);
 
-    gen_set_pc_imm(s, s->pc_succ_insn);
+    gen_update_pc(s, s->cur_insn_len);
     lookup_and_goto_ptr(s);
     s->base.is_jmp = DISAS_NORETURN;
     return true;
@@ -188,7 +188,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
     gen_set_gpr(s, rd, dst);
     mark_vs_dirty(s);
-    gen_set_pc_imm(s, s->pc_succ_insn);
+    gen_update_pc(s, s->cur_insn_len);
     lookup_and_goto_ptr(s);
     s->base.is_jmp = DISAS_NORETURN;
 
diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/insn_trans/trans_rvzawrs.c.inc
index 8254e7dfe2..32efbff4d5 100644
--- a/target/riscv/insn_trans/trans_rvzawrs.c.inc
+++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
@@ -33,7 +33,7 @@ static bool trans_wrs(DisasContext *ctx)
     /* Clear the load reservation  (if any).  */
     tcg_gen_movi_tl(load_res, -1);
 
-    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
+    gen_update_pc(ctx, ctx->cur_insn_len);
     tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
 
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 3e13b1d74d..da093a4cec 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -999,7 +999,7 @@ static void gen_th_sync_local(DisasContext *ctx)
      * Emulate out-of-order barriers with pipeline flush
      * by exiting the translation block.
      */
-    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
+    gen_update_pc(ctx, ctx->cur_insn_len);
     tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 9716114414..3cff24c51f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -232,14 +232,14 @@ static void gen_pc_plus_diff(TCGv target, DisasContext *ctx,
     tcg_gen_movi_tl(target, dest);
 }
 
-static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
+static void gen_update_pc(DisasContext *ctx, target_long diff)
 {
-    gen_pc_plus_diff(cpu_pc, ctx, dest);
+    gen_pc_plus_diff(cpu_pc, ctx, ctx->base.pc_next + diff);
 }
 
 static void generate_exception(DisasContext *ctx, int excp)
 {
-    gen_set_pc_imm(ctx, ctx->base.pc_next);
+    gen_update_pc(ctx, 0);
     gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
@@ -291,10 +291,10 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_long diff)
       */
     if (translator_use_goto_tb(&ctx->base, dest) && !ctx->itrigger) {
         tcg_gen_goto_tb(n);
-        gen_set_pc_imm(ctx, dest);
+        gen_update_pc(ctx, diff);
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
-        gen_set_pc_imm(ctx, dest);
+        gen_update_pc(ctx, diff);
         lookup_and_goto_ptr(ctx);
     }
 }
-- 
2.25.1


