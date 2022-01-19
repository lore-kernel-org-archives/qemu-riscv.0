Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA3On-0008Hk-OF
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 00:20:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3Oh-0008Fv-Tw; Wed, 19 Jan 2022 00:20:41 -0500
Received: from out28-76.mail.aliyun.com ([115.124.28.76]:58284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3Oe-0001GO-V1; Wed, 19 Jan 2022 00:20:39 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07444876|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0352721-0.00066645-0.964061;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047190; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.MfBu1jh_1642569632; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfBu1jh_1642569632)
 by smtp.aliyun-inc.com(10.147.42.16); Wed, 19 Jan 2022 13:20:33 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, guoren@linux.alibaba.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 04/22] target/riscv: Sign extend pc for different XLEN
Date: Wed, 19 Jan 2022 13:18:06 +0800
Message-Id: <20220119051824.17494-5-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
References: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.76; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-76.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 05:20:44 -0000

When pc is written, it is sign-extended to fill the widest supported XLEN.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../riscv/insn_trans/trans_privileged.c.inc   |  2 +-
 target/riscv/insn_trans/trans_rvi.c.inc       |  5 ++--
 target/riscv/insn_trans/trans_rvv.c.inc       |  4 +--
 target/riscv/translate.c                      | 25 ++++++++++++++++---
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 6077bbbf11..53613682e8 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -102,7 +102,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 {
 #ifndef CONFIG_USER_ONLY
-    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
     gen_helper_wfi(cpu_env);
     return true;
 #else
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index b9ba57f266..04d3ea237f 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -59,6 +59,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     tcg_gen_addi_tl(cpu_pc, get_gpr(ctx, a->rs1, EXT_NONE), a->imm);
     tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
 
+    gen_set_pc(ctx, cpu_pc);
     if (!has_ext(ctx, RVC)) {
         TCGv t0 = tcg_temp_new();
 
@@ -827,7 +828,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
      * FENCE_I is a no-op in QEMU,
      * however we need to end the translation block
      */
-    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
     tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
@@ -836,7 +837,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
 static bool do_csr_post(DisasContext *ctx)
 {
     /* We may have changed important cpu state -- exit to main loop. */
-    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
     tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 7a040b3089..e03959c46f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -194,7 +194,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
     gen_set_gpr(s, rd, dst);
     mark_vs_dirty(s);
 
-    tcg_gen_movi_tl(cpu_pc, s->pc_succ_insn);
+    gen_set_pc_imm(s, s->pc_succ_insn);
     tcg_gen_lookup_and_goto_ptr();
     s->base.is_jmp = DISAS_NORETURN;
 
@@ -219,7 +219,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
     gen_set_gpr(s, rd, dst);
     mark_vs_dirty(s);
-    tcg_gen_movi_tl(cpu_pc, s->pc_succ_insn);
+    gen_set_pc_imm(s, s->pc_succ_insn);
     tcg_gen_lookup_and_goto_ptr();
     s->base.is_jmp = DISAS_NORETURN;
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 30c0e28778..2a88bd99dc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -193,16 +193,33 @@ static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
     tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
 }
 
+static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
+{
+    if (get_xl(ctx) == MXL_RV32) {
+        dest = (int32_t)dest;
+    }
+    tcg_gen_movi_tl(cpu_pc, dest);
+}
+
+static void gen_set_pc(DisasContext *ctx, TCGv dest)
+{
+    if (get_xl(ctx) == MXL_RV32) {
+        tcg_gen_ext32s_tl(cpu_pc, dest);
+    } else {
+        tcg_gen_mov_tl(cpu_pc, dest);
+    }
+}
+
 static void generate_exception(DisasContext *ctx, int excp)
 {
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+    gen_set_pc_imm(ctx, ctx->base.pc_next);
     gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static void generate_exception_mtval(DisasContext *ctx, int excp)
 {
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+    gen_set_pc_imm(ctx, ctx->base.pc_next);
     tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
     gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
     ctx->base.is_jmp = DISAS_NORETURN;
@@ -225,10 +242,10 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
     if (translator_use_goto_tb(&ctx->base, dest)) {
         tcg_gen_goto_tb(n);
-        tcg_gen_movi_tl(cpu_pc, dest);
+        gen_set_pc_imm(ctx, dest);
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
-        tcg_gen_movi_tl(cpu_pc, dest);
+        gen_set_pc_imm(ctx, dest);
         tcg_gen_lookup_and_goto_ptr();
     }
 }
-- 
2.25.1


