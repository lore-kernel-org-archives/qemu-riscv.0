Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8O3Z-0004g7-LB
	for mharc-qemu-riscv@gnu.org; Mon, 25 Mar 2019 07:46:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1h8O3X-0004em-H3
	for qemu-riscv@nongnu.org; Mon, 25 Mar 2019 07:46:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1h8O3V-0000za-AD
	for qemu-riscv@nongnu.org; Mon, 25 Mar 2019 07:46:18 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:34760
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <chouteau@adacore.com>)
	id 1h8O3P-0000v1-FO; Mon, 25 Mar 2019 07:46:11 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 5A6668139F;
	Mon, 25 Mar 2019 12:46:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MHBhkJQn5Xgb; Mon, 25 Mar 2019 12:46:09 +0100 (CET)
Received: from ledoue.clients.t29.sncf.fr (unknown [37.168.121.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 354F881399;
	Mon, 25 Mar 2019 12:46:08 +0100 (CET)
From: Fabien Chouteau <chouteau@adacore.com>
To: 
Cc: richard.henderson@linaro.org, Fabien Chouteau <chouteau@adacore.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org (open list:RISC-V),
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Mon, 25 Mar 2019 12:45:54 +0100
Message-Id: <20190325114554.7388-1-chouteau@adacore.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Subject: [Qemu-riscv] [PATCH V2] RISC-V: fix single stepping over ret and
 other branching instructions
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
X-List-Received-Date: Mon, 25 Mar 2019 11:46:20 -0000

This patch introduces wrappers around the tcg_gen_exit_tb() and
tcg_gen_lookup_and_goto_ptr() functions that handle single stepping,
i.e. call gen_exception_debug() when single stepping is enabled.

Theses functions are then used instead of the originals, bringing single
stepping handling in places where it was previously ignored such as jalr
and system branch instructions (ecall, mret, sret, etc.).

Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
---
 .../riscv/insn_trans/trans_privileged.inc.c   |  8 ++---
 target/riscv/insn_trans/trans_rvi.inc.c       |  6 ++--
 target/riscv/translate.c                      | 30 +++++++++++++++----
 3 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/target/riscv/insn_trans/trans_privileged.inc.c b/target/riscv/insn_trans/trans_privileged.inc.c
index acb605923e..664d6ba3f2 100644
--- a/target/riscv/insn_trans/trans_privileged.inc.c
+++ b/target/riscv/insn_trans/trans_privileged.inc.c
@@ -22,7 +22,7 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
 {
     /* always generates U-level ECALL, fixed in do_interrupt handler */
     generate_exception(ctx, RISCV_EXCP_U_ECALL);
-    tcg_gen_exit_tb(NULL, 0); /* no chaining */
+    exit_tb(ctx); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
@@ -30,7 +30,7 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
 static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
 {
     generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
-    tcg_gen_exit_tb(NULL, 0); /* no chaining */
+    exit_tb(ctx); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
@@ -47,7 +47,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 
     if (has_ext(ctx, RVS)) {
         gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
-        tcg_gen_exit_tb(NULL, 0); /* no chaining */
+        exit_tb(ctx); /* no chaining */
         ctx->base.is_jmp = DISAS_NORETURN;
     } else {
         return false;
@@ -68,7 +68,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 #ifndef CONFIG_USER_ONLY
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
     gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
-    tcg_gen_exit_tb(NULL, 0); /* no chaining */
+    exit_tb(ctx); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 #else
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index d420a4d8b2..37b0b9dd19 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -60,7 +60,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     if (a->rd != 0) {
         tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
     }
-    tcg_gen_lookup_and_goto_ptr();
+    lookup_and_goto_ptr(ctx);
 
     if (misaligned) {
         gen_set_label(misaligned);
@@ -483,7 +483,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
      * however we need to end the translation block
      */
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
-    tcg_gen_exit_tb(NULL, 0);
+    exit_tb(ctx);
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
@@ -504,7 +504,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
     gen_io_end(); \
     gen_set_gpr(a->rd, dest); \
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn); \
-    tcg_gen_exit_tb(NULL, 0); \
+    exit_tb(ctx); \
     ctx->base.is_jmp = DISAS_NORETURN; \
     tcg_temp_free(source1); \
     tcg_temp_free(csr_store); \
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 049fa65c66..7417c532f2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -109,6 +109,26 @@ static void gen_exception_debug(void)
     tcg_temp_free_i32(helper_tmp);
 }
 
+/* Wrapper around tcg_gen_exit_tb that handles single stepping */
+static void exit_tb(DisasContext *ctx)
+{
+    if (ctx->base.singlestep_enabled) {
+        gen_exception_debug();
+    } else {
+        tcg_gen_exit_tb(NULL, 0);
+    }
+}
+
+/* Wrapper around tcg_gen_lookup_and_goto_ptr that handles single stepping */
+static void lookup_and_goto_ptr(DisasContext *ctx)
+{
+    if (ctx->base.singlestep_enabled) {
+        gen_exception_debug();
+    } else {
+        tcg_gen_lookup_and_goto_ptr();
+    }
+}
+
 static void gen_exception_illegal(DisasContext *ctx)
 {
     generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
@@ -138,14 +158,14 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         /* chaining is only allowed when the jump is to the same page */
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_pc, dest);
+
+        /* No need to check for single stepping here as use_goto_tb() will
+         * return false in case of single stepping.
+         */
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
-        if (ctx->base.singlestep_enabled) {
-            gen_exception_debug();
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        lookup_and_goto_ptr(ctx);
     }
 }
 
-- 
2.17.1


