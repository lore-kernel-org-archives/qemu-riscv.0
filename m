Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1piag5-0003Au-KV
	for mharc-qemu-riscv@gnu.org; Sat, 01 Apr 2023 08:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1piag2-00037J-Gr; Sat, 01 Apr 2023 08:49:50 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1piafy-0002Jb-3u; Sat, 01 Apr 2023 08:49:50 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAD390NhKChk_03CGQ--.58572S5;
 Sat, 01 Apr 2023 20:49:39 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RESEND PATCH v5 3/6] target/riscv: Fix target address to update
 badaddr
Date: Sat,  1 Apr 2023 20:49:32 +0800
Message-Id: <20230401124935.20997-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230401124935.20997-1-liweiwei@iscas.ac.cn>
References: <20230401124935.20997-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD390NhKChk_03CGQ--.58572S5
X-Coremail-Antispam: 1UD129KBjvJXoWxurykJF4kGrWxJw15Kr1rJFb_yoWrKr1UpF
 13Cw17WrWDJFZxZay0ga1jyF15Gr4SgrWjkw4Skw1kKa13trW5CF1DKFWakFyUuFZ5Xr4Y
 9FZ0yF1jvw4jqa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWx
 Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
 ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
 z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
 AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1l
 IxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
 1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIY
 CTnIWIevJa73UjIFyTuYvjfUF3kuDUUUU
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Sat, 01 Apr 2023 12:49:50 -0000

Compute the target address  before storing it into badaddr
when mis-aligned exception is triggered.
Use a target_pc temp to store the target address to avoid
the confusing operation that udpate target address into
cpu_pc before misalign check, then update it into badaddr
and restore cpu_pc to current pc if exception is triggered.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 23 ++++++++++++++++-------
 target/riscv/translate.c                | 21 ++++++++++-----------
 2 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 4ad54e8a49..48c73cfcfe 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -51,25 +51,30 @@ static bool trans_jal(DisasContext *ctx, arg_jal *a)
 static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
 {
     TCGLabel *misaligned = NULL;
+    TCGv target_pc = tcg_temp_new();
 
-    tcg_gen_addi_tl(cpu_pc, get_gpr(ctx, a->rs1, EXT_NONE), a->imm);
-    tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
+    tcg_gen_addi_tl(target_pc, get_gpr(ctx, a->rs1, EXT_NONE), a->imm);
+    tcg_gen_andi_tl(target_pc, target_pc, (target_ulong)-2);
+
+    if (get_xl(ctx) == MXL_RV32) {
+        tcg_gen_ext32s_tl(target_pc, target_pc);
+    }
 
-    gen_set_pc(ctx, cpu_pc);
     if (!has_ext(ctx, RVC)) {
         TCGv t0 = tcg_temp_new();
 
         misaligned = gen_new_label();
-        tcg_gen_andi_tl(t0, cpu_pc, 0x2);
+        tcg_gen_andi_tl(t0, target_pc, 0x2);
         tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
     }
 
     gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
+    tcg_gen_mov_tl(cpu_pc, target_pc);
     lookup_and_goto_ptr(ctx);
 
     if (misaligned) {
         gen_set_label(misaligned);
-        gen_exception_inst_addr_mis(ctx);
+        gen_exception_inst_addr_mis(ctx, target_pc);
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 
@@ -153,6 +158,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
     TCGLabel *l = gen_new_label();
     TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
     TCGv src2 = get_gpr(ctx, a->rs2, EXT_SIGN);
+    target_ulong next_pc;
 
     if (get_xl(ctx) == MXL_RV128) {
         TCGv src1h = get_gprh(ctx, a->rs1);
@@ -169,9 +175,12 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 
     gen_set_label(l); /* branch taken */
 
-    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
+    next_pc = ctx->base.pc_next + a->imm;
+    if (!has_ext(ctx, RVC) && (next_pc & 0x3)) {
         /* misaligned */
-        gen_exception_inst_addr_mis(ctx);
+        TCGv target_pc = tcg_temp_new();
+        gen_get_target_pc(target_pc, ctx, next_pc);
+        gen_exception_inst_addr_mis(ctx, target_pc);
     } else {
         gen_goto_tb(ctx, 0, ctx->base.pc_next + a->imm);
     }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0ee8ee147d..7b5223efc2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -222,21 +222,18 @@ static void decode_save_opc(DisasContext *ctx)
     ctx->insn_start = NULL;
 }
 
-static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
+static void gen_get_target_pc(TCGv target, DisasContext *ctx,
+                              target_ulong dest)
 {
     if (get_xl(ctx) == MXL_RV32) {
         dest = (int32_t)dest;
     }
-    tcg_gen_movi_tl(cpu_pc, dest);
+    tcg_gen_movi_tl(target, dest);
 }
 
-static void gen_set_pc(DisasContext *ctx, TCGv dest)
+static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
 {
-    if (get_xl(ctx) == MXL_RV32) {
-        tcg_gen_ext32s_tl(cpu_pc, dest);
-    } else {
-        tcg_gen_mov_tl(cpu_pc, dest);
-    }
+    gen_get_target_pc(cpu_pc, ctx, dest);
 }
 
 static void generate_exception(DisasContext *ctx, int excp)
@@ -257,9 +254,9 @@ static void gen_exception_illegal(DisasContext *ctx)
     }
 }
 
-static void gen_exception_inst_addr_mis(DisasContext *ctx)
+static void gen_exception_inst_addr_mis(DisasContext *ctx, TCGv target)
 {
-    tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
+    tcg_gen_st_tl(target, cpu_env, offsetof(CPURISCVState, badaddr));
     generate_exception(ctx, RISCV_EXCP_INST_ADDR_MIS);
 }
 
@@ -551,7 +548,9 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
     next_pc = ctx->base.pc_next + imm;
     if (!has_ext(ctx, RVC)) {
         if ((next_pc & 0x3) != 0) {
-            gen_exception_inst_addr_mis(ctx);
+            TCGv target_pc = tcg_temp_new();
+            gen_get_target_pc(target_pc, ctx, next_pc);
+            gen_exception_inst_addr_mis(ctx, target_pc);
             return;
         }
     }
-- 
2.25.1


