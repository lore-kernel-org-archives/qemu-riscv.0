Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h7IUA-0005Zm-ML
	for mharc-qemu-riscv@gnu.org; Fri, 22 Mar 2019 07:37:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1h7IU6-0005UP-Lw
	for qemu-riscv@nongnu.org; Fri, 22 Mar 2019 07:37:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1h7IG4-0006UN-Su
	for qemu-riscv@nongnu.org; Fri, 22 Mar 2019 07:22:46 -0400
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:50976
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <chouteau@adacore.com>)
	id 1h7IG3-0006Kp-5S; Fri, 22 Mar 2019 07:22:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 1AC8581A10;
	Fri, 22 Mar 2019 12:22:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2kNlBokQOpb; Fri, 22 Mar 2019 12:22:39 +0100 (CET)
Received: from ledoue.clients.t29.sncf.fr (unknown [37.165.26.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id F2FC18137E;
	Fri, 22 Mar 2019 12:22:38 +0100 (CET)
From: Fabien Chouteau <chouteau@adacore.com>
To: 
Cc: Fabien Chouteau <chouteau@adacore.com>, Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org (open list:RISC-V),
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Fri, 22 Mar 2019 12:22:26 +0100
Message-Id: <20190322112226.26890-1-chouteau@adacore.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Subject: [Qemu-riscv] [PATCH] RISC-V: fix single stepping over ret and other
 branching instructions
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
X-List-Received-Date: Fri, 22 Mar 2019 11:37:18 -0000

This patch introduces wrappers around the tcg_gen_exit_tb() and
tcg_gen_lookup_and_goto_ptr() functions that handle single stepping,
i.e. call gen_exception_debug() when single stepping is enabled.

Theses functions are then used instead of the originals, bringing single
stepping handling in places where it was previously ignored such as jalr
and system branch instructions (ecall, mret, sret, etc.).

Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
---
 .../riscv/insn_trans/trans_privileged.inc.c   |  8 +++---
 target/riscv/insn_trans/trans_rvi.inc.c       |  6 ++--
 target/riscv/translate.c                      | 28 +++++++++++++++----
 3 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/target/riscv/insn_trans/trans_privileged.inc.c b/target/riscv/insn_trans/trans_privileged.inc.c
index acb605923e..fe660ab3dd 100644
--- a/target/riscv/insn_trans/trans_privileged.inc.c
+++ b/target/riscv/insn_trans/trans_privileged.inc.c
@@ -22,7 +22,7 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
 {
     /* always generates U-level ECALL, fixed in do_interrupt handler */
     generate_exception(ctx, RISCV_EXCP_U_ECALL);
-    tcg_gen_exit_tb(NULL, 0); /* no chaining */
+    exit_tb(ctx, NULL, 0); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
@@ -30,7 +30,7 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
 static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
 {
     generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
-    tcg_gen_exit_tb(NULL, 0); /* no chaining */
+    exit_tb(ctx, NULL, 0); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
@@ -47,7 +47,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 
     if (has_ext(ctx, RVS)) {
         gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
-        tcg_gen_exit_tb(NULL, 0); /* no chaining */
+        exit_tb(ctx, NULL, 0); /* no chaining */
         ctx->base.is_jmp = DISAS_NORETURN;
     } else {
         return false;
@@ -68,7 +68,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 #ifndef CONFIG_USER_ONLY
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
     gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
-    tcg_gen_exit_tb(NULL, 0); /* no chaining */
+    exit_tb(ctx, NULL, 0); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 #else
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index d420a4d8b2..44ae573768 100644
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
+    exit_tb(ctx, NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
@@ -504,7 +504,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
     gen_io_end(); \
     gen_set_gpr(a->rd, dest); \
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn); \
-    tcg_gen_exit_tb(NULL, 0); \
+    exit_tb(ctx, NULL, 0); \
     ctx->base.is_jmp = DISAS_NORETURN; \
     tcg_temp_free(source1); \
     tcg_temp_free(csr_store); \
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 049fa65c66..c438400b19 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -109,6 +109,26 @@ static void gen_exception_debug(void)
     tcg_temp_free_i32(helper_tmp);
 }
 
+/* Wrapper around tcg_gen_exit_tb that handles single stepping */
+static void exit_tb(DisasContext *ctx, TranslationBlock *tb, unsigned idx)
+{
+    if (ctx->base.singlestep_enabled) {
+        gen_exception_debug();
+    } else {
+        tcg_gen_exit_tb(tb, idx);
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
@@ -138,14 +158,10 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         /* chaining is only allowed when the jump is to the same page */
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_pc, dest);
-        tcg_gen_exit_tb(ctx->base.tb, n);
+        exit_tb(ctx, ctx->base.tb, n);
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


