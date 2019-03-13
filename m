Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4563-0000fI-Su
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4561-0000SU-HU
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4519-0004Wy-0X
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:04 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36696)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h4518-0004WJ-PA
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:02 -0400
Received: by mail-pg1-x534.google.com with SMTP id r124so1682687pgr.3
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=t5eqBgPYKjtVi+X6QifvI/zae5PWOu+bBOmu25pHORg=;
	b=KWUfwbs0wtT9drIWw4ud6Z/FzQgP4CTuPDKypGiAcCg1M4LuQ4BBuJfNJoFkhT9S36
	hT3lZY5k/bniuiwPrIALqFjXLQxbvfu7Yy8X8eH1nbJ2vdIS/UosRCiuhfZ4jNYZmUYI
	3XAO4AY9zqiPifMRJTsN5be6gk0S7GzAj+yx+iEmzeHaeneTdo9+PS9hMZQnTodubP5d
	jWWbCSNsfj+PxSSk8BS8/CJJ7CP9Fytjo6Wqxwgv40czSmmd6sNouQ8/sDIIAzqvoDcN
	KaxG8f0UJgWjgHddiIIHhPMePTw+qEpkXrwyqnBmb5hLEk+/KV3YgK4oKVZe2Lcgt6tw
	w/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=t5eqBgPYKjtVi+X6QifvI/zae5PWOu+bBOmu25pHORg=;
	b=rL7yBJp9LmqNvvKN46ZlHWDTIQ3gNDQDnx37sPhl0QSMsvth5MI5xERtDw8U+z0+gf
	+YWHvBybrI087x+HBw19VHRGoXPli2kDDdQXmJHy3HMUDyVGRV6hbaeHnjFuIGVIm2XM
	85eSmLgGUpmBpO+PJNRDBeN7z8jpHDRtr7ywyp8pl2Ze5p94jfPk43bnUF01ZKO6KDGq
	X5/DlQaNh9x0xiz2nfhlPc00Y6WRKmpwxHRwUOIfalj8FCPfgxtcNTVFqU/TyPpb+9BU
	LQFhLIC1kCwooo5SUd+KwNciKhjBMz/PT1m/3cJ17GqIiO2KCemBFkIXUQLsbYuiZh2r
	/Gag==
X-Gm-Message-State: APjAAAUyQniIhJZaa1oQdakRmBPfGAb6q1+w/TgnkyG0IvL0mmjwrPin
	VA330cLY0n3y6VLysUyttYcZ+368FKbeVmfo
X-Google-Smtp-Source: APXvYqypDIXTA9lK02pnMdN4/AmCYYa28G45reAFJ7E6X7KBKxYkyc8sUIaBr8Nvzj/PL0s4Zxkedw==
X-Received: by 2002:a17:902:b404:: with SMTP id
	x4mr46373302plr.232.1552487881470; 
	Wed, 13 Mar 2019 07:38:01 -0700 (PDT)
Received: from localhost (60-250-203-158.HINET-IP.hinet.net. [60.250.203.158])
	by smtp.gmail.com with ESMTPSA id
	k125sm41868023pgc.51.2019.03.13.07.38.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:38:00 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:52 -0700
Message-Id: <20190313143705.29129-17-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190313143705.29129-1-palmer@sifive.com>
References: <20190313143705.29129-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::534
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
X-List-Received-Date: Wed, 13 Mar 2019 14:43:07 -0000

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


