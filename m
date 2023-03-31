Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pi3pv-00065o-35
	for mharc-qemu-riscv@gnu.org; Thu, 30 Mar 2023 21:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pi3ps-000641-J5; Thu, 30 Mar 2023 21:45:49 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pi3po-0005uT-D0; Thu, 30 Mar 2023 21:45:48 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAAnLFQ9OyZkGtBjDA--.31947S5;
 Fri, 31 Mar 2023 09:45:36 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 3/6] target/riscv: Fix target address to update badaddr
Date: Fri, 31 Mar 2023 09:45:27 +0800
Message-Id: <20230331014530.29805-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230331014530.29805-1-liweiwei@iscas.ac.cn>
References: <20230331014530.29805-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAnLFQ9OyZkGtBjDA--.31947S5
X-Coremail-Antispam: 1UD129KBjvJXoWxurykJF4DXw1DtFWfWr18uFg_yoWrAw4rpF
 13Cw17urWDJFZxZayIga1jyF15GF4S9rWjkwsakwn5Ka13trZ8CFnrtFWakFyUuFWrXr1Y
 9FZ0yFyj9w4UXa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWx
 Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
 ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
 67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUojjg
 UUUUU
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

Compute the target address  before storing it into badaddr
when mis-aligned exception is triggered.
Use a target_pc temp to store the target address to avoid
the confusing operation that udpate target address into
cpu_pc before misalign check, then update it into badaddr
and restore cpu_pc to current pc if exception is triggered.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 19 +++++++++++++------
 target/riscv/translate.c                | 21 ++++++++++-----------
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 4ad54e8a49..0b33f125b1 100644
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
 
@@ -171,7 +176,9 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 
     if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
         /* misaligned */
-        gen_exception_inst_addr_mis(ctx);
+        TCGv target_pc = tcg_temp_new();
+        gen_get_target_pc(target_pc, ctx, ctx->base.pc_next + a->imm);
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


