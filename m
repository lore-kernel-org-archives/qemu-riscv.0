Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtv-0002XB-G9
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtl-0002NU-JD
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtN-00030B-8O
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:25 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:34748)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtM-0001Gn-Ol
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:09 -0500
Received: by mail-pf1-x431.google.com with SMTP id j18so1337003pfe.1
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=R8R/oNtxgClI0Y8jMVLF0vXg+fQJrSSE2ZCiQFiu24U=;
	b=DpzaTY4jZpKI/bU7MM9Cc4wLgdQpJOGpfeuMWO1AK+Bz+/nDTssnJyOjMb2tALCLdj
	FCeOg2X/BiJRFHeVcrv1EBY2UspZf0izQnXGrDXyHJazAejWB28zHjgUplsHviJmfbXm
	uW6xj96sDu/H9Y5UCaHV6w5XFKJMNuX/3G2ClKJ518AEjpC4UwO9f66KbY+TmxaVqzam
	wsliI3iSS8BWbFkjsCYWzSN1senKiWnQ/3iOlAt7ZrBxfxGl4M5kac2bgrfDCT1iUa2/
	H+y+AjgsaOzC5PwX3omTCOnnyec0gYvC1U2Brgvzo5jW3dv1GSn5D7AfJD6rwpQB6d0/
	SRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=R8R/oNtxgClI0Y8jMVLF0vXg+fQJrSSE2ZCiQFiu24U=;
	b=P8YBypDlmlem3iiWl/Fznn0ZL34HHZV3vG0pK9rK2NA33jGT1KqNEeS3+5MEMyPzR+
	CtpA1kTmoNGF1uSupw6dw1yYIxQcBbrRTmSdC/SCJdwIYW1OuXUHfA6ZPRr+T4Q5kKuZ
	GhfrHx1+o8axyqsUozHtpDfkZTVG16TuOH9TYbVRxfj+y/Lm0iWDYFd63/PD3sq5yxSA
	OnUaEw4vuGRG/cO8NfBG4qAP/5U4UgWINXSpFzTNvLV/Gp/Y99wMchjCs0aDTWzPT2mr
	QMYbsBNQ9E3ZWkmb6rPbMvlSMbW1Dxdk2vWXLzO2dQWyF7E79cYi7IHsNJfHkl2ukZiX
	W38A==
X-Gm-Message-State: AHQUAuaLHkZOyyWegxmi+EsZJVRB9cahSomTbik+HbLGrWjQSBxegKOB
	Izq0CB63Nmtgc4UO68t99BedQ12rSiA=
X-Google-Smtp-Source: AHgI3IazXpSAh3tIEXzB1u6PVPyWkdKdfNSy04TNAc6QlFnnRv3h0+lrguiJ9fuGX6oZeiAVgFPu5w==
X-Received: by 2002:a63:d413:: with SMTP id a19mr1029200pgh.199.1550073302797; 
	Wed, 13 Feb 2019 07:55:02 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	j197sm30442176pgc.76.2019.02.13.07.55.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:55:02 -0800 (PST)
Date: Wed, 13 Feb 2019 07:53:55 -0800
Message-Id: <20190213155414.22285-17-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::431
Subject: [Qemu-riscv] [PATCH v7 16/35] target/riscv: Convert RV priv insns
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
X-List-Received-Date: Wed, 13 Feb 2019 15:56:36 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn32.decode                    |  15 +++
 .../riscv/insn_trans/trans_privileged.inc.c   | 110 ++++++++++++++++++
 target/riscv/translate.c                      |  57 +--------
 3 files changed, 126 insertions(+), 56 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_privileged.inc.c

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e64b2b5e3458..ecc46a50cc27 100644
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
index 000000000000..fb2da8f5f010
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
+    if (riscv_has_ext(ctx->env, RVS)) {
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
+    if (ctx->env->priv_ver == PRIV_VERSION_1_10_0) {
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
+    if (ctx->env->priv_ver <= PRIV_VERSION_1_09_1) {
+        gen_helper_tlb_flush(cpu_env);
+        return true;
+    }
+#endif
+    return false;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8a21dce16b87..b72e2810cbef 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -773,26 +773,8 @@ static void gen_set_rm(DisasContext *ctx, int rm)
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
@@ -807,50 +789,12 @@ static void gen_system(DisasContext *ctx, uint32_t opc, int rd, int rs1,
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
@@ -1147,6 +1091,7 @@ bool decode_insn32(DisasContext *ctx, uint32_t insn);
 #include "insn_trans/trans_rva.inc.c"
 #include "insn_trans/trans_rvf.inc.c"
 #include "insn_trans/trans_rvd.inc.c"
+#include "insn_trans/trans_privileged.inc.c"
 
 static void decode_RV32_64G(DisasContext *ctx)
 {
-- 
2.18.1


