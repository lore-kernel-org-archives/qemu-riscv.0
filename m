Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUc-0003xW-J0
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:30:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUW-0002wx-B6
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:30:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hGj-0008Uo-SJ
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:37 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41133)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hGj-0008R7-AQ
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:33 -0400
Received: by mail-pg1-x531.google.com with SMTP id k11so1806818pgb.8
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=bQwazI9Z7fys9lAkXJY7oncI4fZd0E5LTNgR4DtjlHQ=;
	b=XOAdQppxxXhjMvdIS4JIigjcaTYFWRbPIUDni7PJoTKEVAOaxgPKh95pvrRFMXF0OQ
	jUbLjC0GfHSXsprPOaCbTQSKLrz2eYrPU9n3emzHHvdw56M9dOjTlEYa2yLh241b+ZV3
	nmHNVMjBE2OcKnEZfybMWIQZLmgj5l01VImpU7T9U6BWu3K1skIs/NnLlACVajKea+ZK
	Ll8dMHkm2HE9iZH722sjGssqsj/m+8VKHeEvgXvex0k5TBTcn04sGodiV1vmjIajpwIt
	chJN3mpGQFql/Ws8oSM1toAYzbuCXxDgglPF/HhKVE3tsKoitBgyh6L+m8dtg10iHu2C
	PthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=bQwazI9Z7fys9lAkXJY7oncI4fZd0E5LTNgR4DtjlHQ=;
	b=ZlBFgDILfPp25/JymuYdao/DSqWeNKPefn+rF6QQVHnuJRgQY9Xgi9M1sfc22SrR2W
	uRwtch3Ox0d6tvONvvg9cAsiUOi+4d0jRDkMf1aoee9UzNoXWvkChpkK3HcO3+d0thDi
	xNGfuNEq0nlUWQTeeoYY5rZ4K89Hq29C6aC9eKB53uoWSe/m3HYeOVWXo9WnhCT6wygh
	VTAqxSBpWJqLBab2wW743n0guHsgf/+XkY1LCqvmfQ4JBH1oyXZRTq0PqQtJDK8EyTaz
	6d44P9m85C28JElniRyZtMU72gMXEqYqC5cQTDfOw1PmZzVdSNwdWlvOldcbzEV8c72m
	9aeQ==
X-Gm-Message-State: APjAAAVWeV8qt0h/x5CKubRid8oCZ4W0/xv+zKp5EQcQI8SWD77kTiro
	IDHGGcityGVohWpyuY8Yvtdgrw==
X-Google-Smtp-Source: APXvYqz95+h6cVKhuyvKFEUzEL2Qab9cBccwRxmOooRo3I2XtoxV5mSW8cNBomkJuNo3ILysJrlaTQ==
X-Received: by 2002:a17:902:a50a:: with SMTP id
	s10mr39048442plq.223.1552396589292; 
	Tue, 12 Mar 2019 06:16:29 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	v5sm14526866pfn.81.2019.03.12.06.16.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:16:28 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:13 -0700
Message-Id: <20190312131526.14710-17-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::531
Subject: [Qemu-riscv] [PULL 16/29] target/riscv: Convert quadrant 0 of RVXC
 insns to decodetree
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
X-List-Received-Date: Tue, 12 Mar 2019 13:30:51 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/Makefile.objs              |  9 ++-
 target/riscv/insn16.decode              | 55 ++++++++++++++++++
 target/riscv/insn_trans/trans_rvc.inc.c | 75 +++++++++++++++++++++++++
 target/riscv/translate.c                | 53 ++++++-----------
 4 files changed, 154 insertions(+), 38 deletions(-)
 create mode 100644 target/riscv/insn16.decode
 create mode 100644 target/riscv/insn_trans/trans_rvc.inc.c

diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
index 05087a91bb85..9c6c1093271e 100644
--- a/target/riscv/Makefile.objs
+++ b/target/riscv/Makefile.objs
@@ -10,4 +10,11 @@ target/riscv/decode_insn32.inc.c: $(decode32-y) $(DECODETREE)
 	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn32 $(decode32-y), \
 	  "GEN", $(TARGET_DIR)$@)
 
-target/riscv/translate.o: target/riscv/decode_insn32.inc.c
+target/riscv/decode_insn16.inc.c: \
+  $(SRC_PATH)/target/riscv/insn16.decode $(DECODETREE)
+	$(call quiet-command, \
+	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn16 --insnwidth 16 $<, \
+	  "GEN", $(TARGET_DIR)$@)
+
+target/riscv/translate.o: target/riscv/decode_insn32.inc.c \
+	target/riscv/decode_insn16.inc.c
diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
new file mode 100644
index 000000000000..558c0c41f0b5
--- /dev/null
+++ b/target/riscv/insn16.decode
@@ -0,0 +1,55 @@
+#
+# RISC-V translation routines for the RVXI Base Integer Instruction Set.
+#
+# Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
+#                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2 or later, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+# You should have received a copy of the GNU General Public License along with
+# this program.  If not, see <http://www.gnu.org/licenses/>.
+
+# Fields:
+%rd        7:5
+%rs1_3     7:3                !function=ex_rvc_register
+%rs2_3     2:3                !function=ex_rvc_register
+
+# Immediates:
+%nzuimm_ciw    7:4 11:2 5:1 6:1   !function=ex_shift_2
+%uimm_cl_d     5:2 10:3           !function=ex_shift_3
+%uimm_cl_w     5:1 10:3 6:1       !function=ex_shift_2
+
+
+# Argument sets:
+&cl               rs1 rd
+&cl_dw     uimm   rs1 rd
+&ciw       nzuimm     rd
+&cs               rs1 rs2
+&cs_dw     uimm   rs1 rs2
+
+
+# Formats 16:
+@ciw       ...   ........ ... .. &ciw    nzuimm=%nzuimm_ciw           rd=%rs2_3
+@cl_d      ... ... ... .. ... .. &cl_dw  uimm=%uimm_cl_d  rs1=%rs1_3  rd=%rs2_3
+@cl_w      ... ... ... .. ... .. &cl_dw  uimm=%uimm_cl_w  rs1=%rs1_3  rd=%rs2_3
+@cl        ... ... ... .. ... .. &cl                      rs1=%rs1_3  rd=%rs2_3
+@cs        ... ... ... .. ... .. &cs                      rs1=%rs1_3  rs2=%rs2_3
+@cs_d      ... ... ... .. ... .. &cs_dw  uimm=%uimm_cl_d  rs1=%rs1_3  rs2=%rs2_3
+@cs_w      ... ... ... .. ... .. &cs_dw  uimm=%uimm_cl_w  rs1=%rs1_3  rs2=%rs2_3
+
+
+# *** RV64C Standard Extension (Quadrant 0) ***
+c_addi4spn        000    ........ ... 00 @ciw
+c_fld             001  ... ... .. ... 00 @cl_d
+c_lw              010  ... ... .. ... 00 @cl_w
+c_flw_ld          011  --- ... -- ... 00 @cl    #Note: Must parse uimm manually
+c_fsd             101  ... ... .. ... 00 @cs_d
+c_sw              110  ... ... .. ... 00 @cs_w
+c_fsw_sd          111  --- ... -- ... 00 @cs    #Note: Must parse uimm manually
diff --git a/target/riscv/insn_trans/trans_rvc.inc.c b/target/riscv/insn_trans/trans_rvc.inc.c
new file mode 100644
index 000000000000..93ec8aa30b95
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvc.inc.c
@@ -0,0 +1,75 @@
+/*
+ * RISC-V translation routines for the RVC Compressed Instruction Set.
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
+static bool trans_c_addi4spn(DisasContext *ctx, arg_c_addi4spn *a)
+{
+    if (a->nzuimm == 0) {
+        /* Reserved in ISA */
+        return false;
+    }
+    arg_addi arg = { .rd = a->rd, .rs1 = 2, .imm = a->nzuimm };
+    return trans_addi(ctx, &arg);
+}
+
+static bool trans_c_fld(DisasContext *ctx, arg_c_fld *a)
+{
+    arg_fld arg = { .rd = a->rd, .rs1 = a->rs1, .imm = a->uimm };
+    return trans_fld(ctx, &arg);
+}
+
+static bool trans_c_lw(DisasContext *ctx, arg_c_lw *a)
+{
+    arg_lw arg = { .rd = a->rd, .rs1 = a->rs1, .imm = a->uimm };
+    return trans_lw(ctx, &arg);
+}
+
+static bool trans_c_flw_ld(DisasContext *ctx, arg_c_flw_ld *a)
+{
+#ifdef TARGET_RISCV32
+    /* C.FLW ( RV32FC-only ) */
+    return false;
+#else
+    /* C.LD ( RV64C/RV128C-only ) */
+    return false;
+#endif
+}
+
+static bool trans_c_fsd(DisasContext *ctx, arg_c_fsd *a)
+{
+    arg_fsd arg = { .rs1 = a->rs1, .rs2 = a->rs2, .imm = a->uimm };
+    return trans_fsd(ctx, &arg);
+}
+
+static bool trans_c_sw(DisasContext *ctx, arg_c_sw *a)
+{
+    arg_sw arg = { .rs1 = a->rs1, .rs2 = a->rs2, .imm = a->uimm };
+    return trans_sw(ctx, &arg);
+}
+
+static bool trans_c_fsw_sd(DisasContext *ctx, arg_c_fsw_sd *a)
+{
+#ifdef TARGET_RISCV32
+    /* C.FSW ( RV32FC-only ) */
+    return false;
+#else
+    /* C.SD ( RV64C/RV128C-only ) */
+    return false;
+#endif
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 02f64ed8a734..0106fa8d51b3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -803,27 +803,6 @@ static void decode_RV32_64C0(DisasContext *ctx)
     uint8_t rs1s = GET_C_RS1S(ctx->opcode);
 
     switch (funct3) {
-    case 0:
-        /* illegal */
-        if (ctx->opcode == 0) {
-            gen_exception_illegal(ctx);
-        } else {
-            /* C.ADDI4SPN -> addi rd', x2, zimm[9:2]*/
-            gen_arith_imm(ctx, OPC_RISC_ADDI, rd_rs2, 2,
-                          GET_C_ADDI4SPN_IMM(ctx->opcode));
-        }
-        break;
-    case 1:
-        /* C.FLD -> fld rd', offset[7:3](rs1')*/
-        gen_fp_load(ctx, OPC_RISC_FLD, rd_rs2, rs1s,
-                    GET_C_LD_IMM(ctx->opcode));
-        /* C.LQ(RV128) */
-        break;
-    case 2:
-        /* C.LW -> lw rd', offset[6:2](rs1') */
-        gen_load(ctx, OPC_RISC_LW, rd_rs2, rs1s,
-                 GET_C_LW_IMM(ctx->opcode));
-        break;
     case 3:
 #if defined(TARGET_RISCV64)
         /* C.LD(RV64/128) -> ld rd', offset[7:3](rs1')*/
@@ -835,21 +814,6 @@ static void decode_RV32_64C0(DisasContext *ctx)
                     GET_C_LW_IMM(ctx->opcode));
 #endif
         break;
-    case 4:
-        /* reserved */
-        gen_exception_illegal(ctx);
-        break;
-    case 5:
-        /* C.FSD(RV32/64) -> fsd rs2', offset[7:3](rs1') */
-        gen_fp_store(ctx, OPC_RISC_FSD, rs1s, rd_rs2,
-                     GET_C_LD_IMM(ctx->opcode));
-        /* C.SQ (RV128) */
-        break;
-    case 6:
-        /* C.SW -> sw rs2', offset[6:2](rs1')*/
-        gen_store(ctx, OPC_RISC_SW, rs1s, rd_rs2,
-                  GET_C_LW_IMM(ctx->opcode));
-        break;
     case 7:
 #if defined(TARGET_RISCV64)
         /* C.SD (RV64/128) -> sd rs2', offset[7:3](rs1')*/
@@ -1079,6 +1043,8 @@ static void decode_RV32_64C(DisasContext *ctx)
         return imm << amount;                 \
     }
 EX_SH(1)
+EX_SH(2)
+EX_SH(3)
 EX_SH(12)
 
 #define REQUIRE_EXT(ctx, ext) do { \
@@ -1087,6 +1053,11 @@ EX_SH(12)
     }                              \
 } while (0)
 
+static int ex_rvc_register(int reg)
+{
+    return 8 + reg;
+}
+
 bool decode_insn32(DisasContext *ctx, uint32_t insn);
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode_insn32.inc.c"
@@ -1098,6 +1069,11 @@ bool decode_insn32(DisasContext *ctx, uint32_t insn);
 #include "insn_trans/trans_rvd.inc.c"
 #include "insn_trans/trans_privileged.inc.c"
 
+bool decode_insn16(DisasContext *ctx, uint16_t insn);
+/* auto-generated decoder*/
+#include "decode_insn16.inc.c"
+#include "insn_trans/trans_rvc.inc.c"
+
 static void decode_RV32_64G(DisasContext *ctx)
 {
     int rs1, rd;
@@ -1131,7 +1107,10 @@ static void decode_opc(DisasContext *ctx)
             gen_exception_illegal(ctx);
         } else {
             ctx->pc_succ_insn = ctx->base.pc_next + 2;
-            decode_RV32_64C(ctx);
+            if (!decode_insn16(ctx, ctx->opcode)) {
+                /* fall back to old decoder */
+                decode_RV32_64C(ctx);
+            }
         }
     } else {
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
-- 
2.19.2


