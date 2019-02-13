Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwsh-0001Ik-J2
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:55:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwse-0001GV-84
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwsV-0001dL-19
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:18 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33670)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwsQ-0001Ij-W2
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:12 -0500
Received: by mail-pg1-x536.google.com with SMTP id z11so1325335pgu.0
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=S6n6Vm0W4v/s8eD0A4T8qOhTehth0CA9M8oXube8gFQ=;
	b=Ux8hKv4frg4vMg8feUopEEUZUtRf4BtGDMdkVB74sdmMnGZuuHjwkjcKBGBhz2Le8u
	bMnyJL7PaF4JCdS4MXY2tVY99KQdldc86guMHly34JKH9miDoscPB7W7qMoRq83Zc2ts
	R9lnj47aYH+1lzgC8NDtTgnLlfK6lFHFloWTbaiI8gx0Sm9y0n/xdtzJj3qr9A7jld1X
	FIS7Yc3TPYnOq3e4NdSWLDu93CewrXQdGTC6j7ocb3k1CiHn65MaW+bDvEued3pB4+gF
	4sGHuJ1PGxKYAIv3caFQFyJbr6tk9pnOfbE3DePccCqxi1HxIOStQF4dIwJHEGGH1x2I
	z+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=S6n6Vm0W4v/s8eD0A4T8qOhTehth0CA9M8oXube8gFQ=;
	b=eh89SWwbO/HBDitihMyAbtF07EPYnDdyv2PSPIegTQpHKlNHPPCnXm5KiXFPY/Tbaj
	zMNKAMrfYtDt3TmNhORvMAt4rdx1cHLRiX0jQTdVgNHHgOxHJAlc5l/tzecS+cXajHcH
	ImC2TbkcquymPMBoNdEGcK/FNmwTbxJCtXpj2usC5qp1VzNca3uVdxb+X+CvAILL+Qzm
	5qMsbPdSzAeWoBVsZs86d7JxWBgOpExqgkb2QhvhyfOoxcTgOglTmCi+OBmlw0rG3n78
	yiFko+tfCLFn4NCtAy+s+fY4qB2Fr+dhl9r+tlcVpOivLNO4KrngTjVVCJm9Cf0XEJOP
	mvVg==
X-Gm-Message-State: AHQUAub45XYJRz6IUgRGdgnCv4McReF5/FZX1KK9EyzvQfpsa17vC/Pm
	mXaMc5VObr3LB5wkz1Z0ZyR/RQ==
X-Google-Smtp-Source: AHgI3IZRNVaGiLRxEMCt4lHQBq6iIiR6mBzK5qtDZa0CD2Lkg/DRjDgK8nx4yU+R56gU2lcEZAnh9Q==
X-Received: by 2002:a63:1544:: with SMTP id 4mr1084316pgv.290.1550073304510;
	Wed, 13 Feb 2019 07:55:04 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	a15sm24630552pgd.4.2019.02.13.07.55.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:55:03 -0800 (PST)
Date: Wed, 13 Feb 2019 07:53:56 -0800
Message-Id: <20190213155414.22285-18-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::536
Subject: [Qemu-riscv] [PATCH v7 17/35] target/riscv: Convert quadrant 0 of
 RVXC insns to decodetree
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
X-List-Received-Date: Wed, 13 Feb 2019 15:55:26 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
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
index b72e2810cbef..5010fdc553f2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -804,27 +804,6 @@ static void decode_RV32_64C0(DisasContext *ctx)
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
@@ -836,21 +815,6 @@ static void decode_RV32_64C0(DisasContext *ctx)
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
@@ -1080,8 +1044,15 @@ static void decode_RV32_64C(DisasContext *ctx)
         return imm << amount;                 \
     }
 EX_SH(1)
+EX_SH(2)
+EX_SH(3)
 EX_SH(12)
 
+static int ex_rvc_register(int reg)
+{
+    return 8 + reg;
+}
+
 bool decode_insn32(DisasContext *ctx, uint32_t insn);
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode_insn32.inc.c"
@@ -1093,6 +1064,11 @@ bool decode_insn32(DisasContext *ctx, uint32_t insn);
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
@@ -1126,7 +1102,10 @@ static void decode_opc(DisasContext *ctx)
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
2.18.1


