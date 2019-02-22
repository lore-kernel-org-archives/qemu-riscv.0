Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gxBYH-00053s-NO
	for mharc-qemu-riscv@gnu.org; Fri, 22 Feb 2019 09:11:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gxBYC-0004yO-41
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 09:11:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gxBYA-0006aF-6U
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 09:11:39 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:53558)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gxBY9-0006Os-Ne; Fri, 22 Feb 2019 09:11:38 -0500
Received: from wormulon.uni-paderborn.de ([131.234.189.22]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 amazonia)
	id 1gxBY5-00014Z-7U; Fri, 22 Feb 2019 15:11:33 +0100
Received: from mail.uni-paderborn.de by wormulon with queue id 3169554-5;
	Fri, 22 Feb 2019 14:11:31 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: sagark@eecs.berkeley.edu, palmer@sifive.com, kbastian@mail.uni-paderborn.de
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>
Date: Fri, 22 Feb 2019 15:10:05 +0100
Message-Id: <20190222141024.22217-16-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190222141024.22217-1-kbastian@mail.uni-paderborn.de>
References: <20190222141024.22217-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.2.22.140616, AntiVirus-Engine: 5.58.0,
	AntiVirus-Data: 2019.2.19.5580002
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH v8 15/34] target/riscv: Convert RV priv insns
 to decodetree
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
X-List-Received-Date: Fri, 22 Feb 2019 14:11:43 -0000

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
v7 -> v8:
    - riscv_has_ext -> has_ext
    - env->ctx->priv_version -> ctx->priv_version

 target/riscv/insn32.decode                    |  15 +++
 .../riscv/insn_trans/trans_privileged.inc.c   | 110 ++++++++++++++++++
 target/riscv/translate.c                      |  57 +--------
 3 files changed, 126 insertions(+), 56 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_privileged.inc.c

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e64b2b5e34..ecc46a50cc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -57,6 +57,21 @@
 @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
 @r2      .......   ..... ..... ... ..... ....... %rs1 %rd
 
+@sfence_vma ....... ..... .....   ... ..... ....... %rs2 %rs1
+@sfence_vm  ....... ..... .....   ... ..... ....... %rs1
+
+
+# *** Privileged Instructions ***
+ecall      000000000000     00000 000 00000 1110011
+ebreak     000000000001     00000 000 00000 1110011
+uret       0000000    00010 00000 000 00000 1110011
+sret       0001000    00010 00000 000 00000 1110011
+hret       0010000    00010 00000 000 00000 1110011
+mret       0011000    00010 00000 000 00000 1110011
+wfi        0001000    00101 00000 000 00000 1110011
+sfence_vma 0001001    ..... ..... 000 00000 1110011 @sfence_vma
+sfence_vm  0001000    00100 ..... 000 00000 1110011 @sfence_vm
+
 # *** RV32I Base Instruction Set ***
 lui      ....................       ..... 0110111 @u
 auipc    ....................       ..... 0010111 @u
diff --git a/target/riscv/insn_trans/trans_privileged.inc.c b/target/riscv/insn_trans/trans_privileged.inc.c
new file mode 100644
index 0000000000..acb605923e
--- /dev/null
+++ b/target/riscv/insn_trans/trans_privileged.inc.c
@@ -0,0 +1,110 @@
+/*
+ * RISC-V translation routines for the RISC-V privileged instructions.
+ *
+ * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
+ * Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
+ *                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
+{
+    /* always generates U-level ECALL, fixed in do_interrupt handler */
+    generate_exception(ctx, RISCV_EXCP_U_ECALL);
+    tcg_gen_exit_tb(NULL, 0); /* no chaining */
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
+
+static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
+{
+    generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
+    tcg_gen_exit_tb(NULL, 0); /* no chaining */
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
+
+static bool trans_uret(DisasContext *ctx, arg_uret *a)
+{
+    return false;
+}
+
+static bool trans_sret(DisasContext *ctx, arg_sret *a)
+{
+#ifndef CONFIG_USER_ONLY
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+
+    if (has_ext(ctx, RVS)) {
+        gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
+        tcg_gen_exit_tb(NULL, 0); /* no chaining */
+        ctx->base.is_jmp = DISAS_NORETURN;
+    } else {
+        return false;
+    }
+    return true;
+#else
+    return false;
+#endif
+}
+
+static bool trans_hret(DisasContext *ctx, arg_hret *a)
+{
+    return false;
+}
+
+static bool trans_mret(DisasContext *ctx, arg_mret *a)
+{
+#ifndef CONFIG_USER_ONLY
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+    gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
+    tcg_gen_exit_tb(NULL, 0); /* no chaining */
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+#else
+    return false;
+#endif
+}
+
+static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
+{
+#ifndef CONFIG_USER_ONLY
+    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+    gen_helper_wfi(cpu_env);
+    return true;
+#else
+    return false;
+#endif
+}
+
+static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
+{
+#ifndef CONFIG_USER_ONLY
+    if (ctx->priv_ver == PRIV_VERSION_1_10_0) {
+        gen_helper_tlb_flush(cpu_env);
+        return true;
+    }
+#endif
+    return false;
+}
+
+static bool trans_sfence_vm(DisasContext *ctx, arg_sfence_vm *a)
+{
+#ifndef CONFIG_USER_ONLY
+    if (ctx->priv_ver <= PRIV_VERSION_1_09_1) {
+        gen_helper_tlb_flush(cpu_env);
+        return true;
+    }
+#endif
+    return false;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 2e36deee82..02f64ed8a7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -772,26 +772,8 @@ static void gen_set_rm(DisasContext *ctx, int rm)
 static void gen_system(DisasContext *ctx, uint32_t opc, int rd, int rs1,
                        int csr)
 {
-    TCGv source1, dest;
-    source1 = tcg_temp_new();
-    dest = tcg_temp_new();
-    gen_get_gpr(source1, rs1);
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
 
-#ifndef CONFIG_USER_ONLY
-    /* Extract funct7 value and check whether it matches SFENCE.VMA */
-    if ((opc == OPC_RISC_ECALL) && ((csr >> 5) == 9)) {
-        if (ctx->priv_ver == PRIV_VERSION_1_10_0) {
-            /* sfence.vma */
-            /* TODO: handle ASID specific fences */
-            gen_helper_tlb_flush(cpu_env);
-            return;
-        } else {
-            gen_exception_illegal(ctx);
-        }
-    }
-#endif
-
     switch (opc) {
     case OPC_RISC_ECALL:
         switch (csr) {
@@ -806,50 +788,12 @@ static void gen_system(DisasContext *ctx, uint32_t opc, int rd, int rs1,
             tcg_gen_exit_tb(NULL, 0); /* no chaining */
             ctx->base.is_jmp = DISAS_NORETURN;
             break;
-#ifndef CONFIG_USER_ONLY
-        case 0x002: /* URET */
-            gen_exception_illegal(ctx);
-            break;
-        case 0x102: /* SRET */
-            if (has_ext(ctx, RVS)) {
-                gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
-                tcg_gen_exit_tb(NULL, 0); /* no chaining */
-                ctx->base.is_jmp = DISAS_NORETURN;
-            } else {
-                gen_exception_illegal(ctx);
-            }
-            break;
-        case 0x202: /* HRET */
-            gen_exception_illegal(ctx);
-            break;
-        case 0x302: /* MRET */
-            gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
-            tcg_gen_exit_tb(NULL, 0); /* no chaining */
-            ctx->base.is_jmp = DISAS_NORETURN;
-            break;
-        case 0x7b2: /* DRET */
-            gen_exception_illegal(ctx);
-            break;
-        case 0x105: /* WFI */
-            tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
-            gen_helper_wfi(cpu_env);
-            break;
-        case 0x104: /* SFENCE.VM */
-            if (ctx->priv_ver <= PRIV_VERSION_1_09_1) {
-                gen_helper_tlb_flush(cpu_env);
-            } else {
-                gen_exception_illegal(ctx);
-            }
-            break;
-#endif
         default:
             gen_exception_illegal(ctx);
             break;
         }
         break;
     }
-    tcg_temp_free(source1);
-    tcg_temp_free(dest);
 }
 
 static void decode_RV32_64C0(DisasContext *ctx)
@@ -1152,6 +1096,7 @@ bool decode_insn32(DisasContext *ctx, uint32_t insn);
 #include "insn_trans/trans_rva.inc.c"
 #include "insn_trans/trans_rvf.inc.c"
 #include "insn_trans/trans_rvd.inc.c"
+#include "insn_trans/trans_privileged.inc.c"
 
 static void decode_RV32_64G(DisasContext *ctx)
 {
-- 
2.20.1


