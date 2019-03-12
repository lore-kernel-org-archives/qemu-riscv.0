Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUb-0003wL-Sc
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:30:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUW-00031K-KI
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:30:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hGj-0008U3-Ik
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:35 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:43660)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hGj-0008P2-85
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:33 -0400
Received: by mail-pf1-x429.google.com with SMTP id q17so1803058pfh.10
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=fSXXGB/sSUHe5IqiwY4Hqowkw4uoz9NgVg/BOxgdMjk=;
	b=X0TSCgiiKbckh/98Pk2Q+XdwHXMGwkQEgQSEX0nvN+rL+8rBJTdnTGJKzU1g9OZ419
	LppD4ZcJtbzTSBVNSuCR2N33n21xGJc+U3ed9DQGmRc5+UIUwuJWccw+iMAf6McfOW4B
	PpMagBn3fquErJF2EiX01xd4OAEGy6T59CCtFOuh1ubCM6YqFb8DHMgRqwYGTPedOlPA
	BOi3a/sRXSufS/h65GHlJxrQQ3hSg6RF1BSHARE6nA09KGlZR1a43Yuho1bATQRxuACf
	D7hdlQPjvKYqaVew4bHAxWteqAWhGFeqg7b7fG4u1QZf0iJKKR4/hAFqU8edeYR674IA
	7b4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=fSXXGB/sSUHe5IqiwY4Hqowkw4uoz9NgVg/BOxgdMjk=;
	b=cV2w5nAbu33T0iXxGzhzt1T1lE+3PHdU0ty5dFC8bo+gP9beZhPGDxPr/9KfIJAi/x
	CQe4rlaCHpCGfOsHd8tsXeusnsuRXNSw2L86m8iih7J9+qbh6FBZQsWI4o5l9Ye/EDXt
	jgCrtZxDpp9hARqNtdkcgpYA105gKQiFlJtFM5P6jtLNlzca0SlF15h7Gp8S7YrVdEWV
	8cwNdc9wTeNZWq2Pt87i3K4d0TVcddO92RtWUI/LtiAbsGOcMj4raY2P1nCqb6ekERrF
	4C2EYFMSifswSUXSUDbZhAXXy/xiM1q2zd1M8hgDTLTPPMgdCSGTEg5yEE0q1o6a8+EI
	yhkw==
X-Gm-Message-State: APjAAAWH2xWbG2VQuPweA+QH+cO8XLu1s0jFg5HFiyHJeiSosmUG9K1C
	Ipz3NmICJ8i3LDuuzlLas04jeg==
X-Google-Smtp-Source: APXvYqydOKmiHQ+fd/QEl9vQDLJ02dqVXXTxLn6uSgv2Lkc3N/twljhvkXikr6xxGueBUhELu7rM1A==
X-Received: by 2002:a17:902:8f8a:: with SMTP id
	z10mr40247523plo.23.1552396586313; 
	Tue, 12 Mar 2019 06:16:26 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	c10sm11475143pfo.19.2019.03.12.06.16.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:16:25 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:12 -0700
Message-Id: <20190312131526.14710-16-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190312131526.14710-1-palmer@sifive.com>
References: <20190312131526.14710-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::429
Subject: [Qemu-riscv] [PULL 15/29] target/riscv: Convert RV priv insns to
 decodetree
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
X-List-Received-Date: Tue, 12 Mar 2019 13:30:50 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
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
index 000000000000..acb605923e68
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
index 2e36deee82f4..02f64ed8a734 100644
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
2.19.2


