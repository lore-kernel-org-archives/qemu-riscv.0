Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKmvK-0007n8-CE
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 15:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKktw-00058k-Ji; Mon, 30 Aug 2021 13:16:52 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:50080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKkts-0007BN-Hf; Mon, 30 Aug 2021 13:16:52 -0400
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id DA27541900;
 Mon, 30 Aug 2021 19:16:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1630343806;
 bh=Wi1qXrtrB3teyYk9oNUtizMH0jrN5R2R3+CPSM/4Qz0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fcLO/V4NxT2p2W07YKq6Fpr+3tSN3UTwVtP2TgzeevF+MSNML6vV3VbKhuQwVJVK7
 iy+3+7/ZWj5iBkNGnqyXsjGqBycuIwRbkKykh0HIr32QnCAJF06CVSZwy1Ay8aXLVv
 owYVsPoNlY2H61ejNTwGouHipwRykJaUYtlog+QuxoC7K2Y7Tf6DBAmrKEP27Ks6xp
 2kBhezXKQYU+recBUdLk+BFUHqW/SgWqlb05GOL/pbNrNSCmXq5jfoolPGhuie0zLR
 WlBMBL9DMCc5EiahUfZIGQyjbRmAt55rBCC4W2PeEc1pEZavtbq3z/eTBE9EGDlXwW
 bss4PUTcwVAWw==
Received: from smtps.univ-grenoble-alpes.fr (smtps1.u-ga.fr [152.77.1.30])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id D525280137;
 Mon, 30 Aug 2021 19:16:46 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 87F69187E19;
 Mon, 30 Aug 2021 19:16:46 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 3/8] target/riscv: Addition of 128-bit ldu,
 lq and sq instructions
Date: Mon, 30 Aug 2021 19:16:33 +0200
Message-Id: <20210830171638.126325-3-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (110)
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 30 Aug 2021 15:26:24 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Aug 2021 17:16:54 -0000

Addition of the load(s) and store instructions of the 128-bit extension.
These instructions have addresses on 128-bit but explicitly assume that the
upper 64-bit of the address registers is null, and therefore can use the
existing address translation mechanism.
128-bit memory access identification and 64-bit signedness is handled a bit
off-the-record:
MemOp reserves 2 bits for size and a contiguous 3rd bit for the sign, so we
cannot simply take value 4 to indicate a size of 16 bytes.
Additionally, MO_TEQ | MO_SIGN seems to be a sentinel value, leading to a
QEMU assertion violation.
Modifying the existing state in QEMU has a great impact that we are not
capable of fully evaluating, so we choose to pass this information into
another parameter and let memop as it is for now.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 include/tcg/tcg-op.h                    |   1 +
 target/riscv/insn16.decode              |  33 ++++-
 target/riscv/insn32.decode              |   5 +
 target/riscv/insn_trans/trans_rvi.c.inc | 188 +++++++++++++++++++++---
 tcg/tcg-op.c                            |   6 +
 5 files changed, 207 insertions(+), 26 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 2a654f350c..e2560784cb 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -726,6 +726,7 @@ static inline void tcg_gen_neg_i64(TCGv_i64 ret, TCGv_i64 arg)
 
 void tcg_gen_extu_i32_i64(TCGv_i64 ret, TCGv_i32 arg);
 void tcg_gen_ext_i32_i64(TCGv_i64 ret, TCGv_i32 arg);
+void tcg_gen_ext_i64_i128(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg);
 void tcg_gen_concat_i32_i64(TCGv_i64 dest, TCGv_i32 low, TCGv_i32 high);
 void tcg_gen_extrl_i64_i32(TCGv_i32 ret, TCGv_i64 arg);
 void tcg_gen_extrh_i64_i32(TCGv_i32 ret, TCGv_i64 arg);
diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 2e9212663c..165a6ed3bd 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -39,6 +39,11 @@
 %imm_addi16sp  12:s1 3:2 5:1 2:1 6:1 !function=ex_shift_4
 %imm_lui       12:s1 2:5             !function=ex_shift_12
 
+# Added for 128 bit support
+%uimm_cl_q    5:2 10:3               !function=ex_shift_3
+%uimm_6bit_lq 2:3 12:1 5:2           !function=ex_shift_3
+%uimm_6bit_sq 7:3 10:3               !function=ex_shift_3
+
 
 # Argument sets imported from insn32.decode:
 &empty                  !extern
@@ -54,16 +59,20 @@
 # Formats 16:
 @cr        ....  ..... .....  .. &r      rs2=%rs2_5       rs1=%rd     %rd
 @ci        ... . ..... .....  .. &i      imm=%imm_ci      rs1=%rd     %rd
+@cl_q      ... . .....  ..... .. &i      imm=%uimm_6bit_lq rs1=2 %rd
 @cl_d      ... ... ... .. ... .. &i      imm=%uimm_cl_d   rs1=%rs1_3  rd=%rs2_3
 @cl_w      ... ... ... .. ... .. &i      imm=%uimm_cl_w   rs1=%rs1_3  rd=%rs2_3
 @cs_2      ... ... ... .. ... .. &r      rs2=%rs2_3       rs1=%rs1_3  rd=%rs1_3
+@cs_q      ... ... ... .. ... .. &s      imm=%uimm_cl_q   rs1=%rs1_3  rs2=%rs2_3
 @cs_d      ... ... ... .. ... .. &s      imm=%uimm_cl_d   rs1=%rs1_3  rs2=%rs2_3
 @cs_w      ... ... ... .. ... .. &s      imm=%uimm_cl_w   rs1=%rs1_3  rs2=%rs2_3
 @cj        ...    ........... .. &j      imm=%imm_cj
 @cb_z      ... ... ... .. ... .. &b      imm=%imm_cb      rs1=%rs1_3  rs2=0
 
+@c_lqsp    ... . .....  ..... .. &i      imm=%uimm_6bit_lq rs1=2 %rd
 @c_ldsp    ... . .....  ..... .. &i      imm=%uimm_6bit_ld rs1=2 %rd
 @c_lwsp    ... . .....  ..... .. &i      imm=%uimm_6bit_lw rs1=2 %rd
+@c_sqsp    ... . .....  ..... .. &s      imm=%uimm_6bit_sq rs1=2 rs2=%rs2_5
 @c_sdsp    ... . .....  ..... .. &s      imm=%uimm_6bit_sd rs1=2 rs2=%rs2_5
 @c_swsp    ... . .....  ..... .. &s      imm=%uimm_6bit_sw rs1=2 rs2=%rs2_5
 @c_li      ... . .....  ..... .. &i      imm=%imm_ci rs1=0 %rd
@@ -87,9 +96,17 @@
   illegal         000  000 000 00 --- 00
   addi            000  ... ... .. ... 00 @c_addi4spn
 }
-fld               001  ... ... .. ... 00 @cl_d
+{
+  fld             001  ... ... .. ... 00 @cl_d
+  # *** RV128C specific Standard Extension (Quadrant 0) ***
+  lq              001  ... ... .. ... 00 @cl_q
+}
 lw                010  ... ... .. ... 00 @cl_w
-fsd               101  ... ... .. ... 00 @cs_d
+{
+  fsd             101  ... ... .. ... 00 @cs_d
+  # *** RV128C specific Standard Extension (Quadrant 0) ***
+  sq              101  ... ... .. ... 00 @cs_q
+}
 sw                110  ... ... .. ... 00 @cs_w
 
 # *** RV32C and RV64C specific Standard Extension (Quadrant 0) ***
@@ -132,7 +149,11 @@ addw              100 1 11 ... 01 ... 01 @cs_2
 
 # *** RV32/64C Standard Extension (Quadrant 2) ***
 slli              000 .  .....  ..... 10 @c_shift2
-fld               001 .  .....  ..... 10 @c_ldsp
+{
+  fld             001 .  .....  ..... 10 @c_ldsp
+  # *** RV128C specific Standard Extension (Quadrant 2) ***
+  lq              001  ... ... .. ... 10 @c_lqsp
+}
 {
   illegal         010 -  00000  ----- 10 # c.lwsp, RES rd=0
   lw              010 .  .....  ..... 10 @c_lwsp
@@ -147,7 +168,11 @@ fld               001 .  .....  ..... 10 @c_ldsp
   jalr            100 1  .....  00000 10 @c_jalr rd=1  # C.JALR
   add             100 1  .....  ..... 10 @cr
 }
-fsd               101   ......  ..... 10 @c_sdsp
+{
+  fsd             101   ......  ..... 10 @c_sdsp
+  # *** RV128C specific Standard Extension (Quadrant 2) ***
+  sq              101  ... ... .. ... 10 @c_sqsp
+}
 sw                110 .  .....  ..... 10 @c_swsp
 
 # *** RV32C and RV64C specific Standard Extension (Quadrant 2) ***
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f09f8d5faf..225669e277 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -162,6 +162,11 @@ sllw     0000000 .....  ..... 001 ..... 0111011 @r
 srlw     0000000 .....  ..... 101 ..... 0111011 @r
 sraw     0100000 .....  ..... 101 ..... 0111011 @r
 
+# *** RV128I Base Instruction Set (in addition to RV64I) ***
+ldu      ............   ..... 111 ..... 0000011 @i
+lq       ............   ..... 010 ..... 0001111 @i
+sq       ............   ..... 100 ..... 0100011 @s
+
 # *** RV32M Standard Extension ***
 mul      0000001 .....  ..... 000 ..... 0110011 @r
 mulh     0000001 .....  ..... 001 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 6e736c9d0d..772330a766 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -141,7 +141,7 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
     return gen_branch(ctx, a, TCG_COND_GEU);
 }
 
-static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
+static bool gen_load_tl(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
@@ -155,32 +155,133 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
     return true;
 }
 
+#if defined(TARGET_RISCV128)
+/*
+ * Accessing signed 64-bit or 128-bit values should be part of MemOp in
+ * include/exec/memop.h
+ * Unfortunately, this requires to change the defines there, as MO_SIGN is 4,
+ * and values 0 to 3 are usual types sizes.
+ * Note that an assert is triggered when MemOp is MO_SIGN|MO_TEQ, this value
+ * being some kind of sentinel.
+ * Changing MemOp values is too involved given our understanding, we
+ * therefore use our own way to deal locally with zero or sign extended
+ * 64-bit values, and 128-bit values.
+ * Doing this implies adding a preprocessor conditional in all memory access
+ * functions to avoid penalizing 32 and 64-bit accesses.
+ */
+typedef enum XMemOp {
+    XMO_NOP   = 0, /* MemOp rules! */
+    XMO_TEUQ  = 1, /* Zero-extended 64-bit access */
+    XMO_TET   = 2, /* 128-bit (T integer format) access */
+    XMO_SIGN  = 4, /* Sign-extended 64-bit access */
+    XMO_TESQ  = XMO_TEUQ | XMO_SIGN,
+} XMemOp;
+
+static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop, XMemOp xm)
+{
+    if (is_128bit(ctx)) {
+        TCGv rs1l = tcg_temp_new();
+        TCGv rs1h = tcg_temp_new();
+        TCGv rdl = tcg_temp_new();
+        TCGv rdh = tcg_temp_new();
+        TCGv imml = tcg_temp_new();
+        TCGv immh = tcg_const_tl((a->imm & 0b100000000000)
+                                   ? 0xffffffffffffffff : 0);
+
+        gen_get_gpr(rs1l, a->rs1);
+        gen_get_gprh(rs1h, a->rs1);
+
+        /* Build a 128-bit address */
+        tcg_gen_movi_tl(imml, a->imm);
+        tcg_gen_add2_tl(rs1l, rs1h, rs1l, rs1h, imml, immh);
+        /* TODO: should assert that rs1h == 0 for now */
+
+        if (xm != XMO_TET) {
+            tcg_gen_qemu_ld_tl(rdl, rs1l, ctx->mem_idx, memop);
+            if ((memop & MO_SIGN) || (xm & XMO_SIGN)) {
+                tcg_gen_ext_i64_i128(rdl, rdh, rdl);
+            } else {
+                tcg_gen_movi_tl(rdh, 0);
+            }
+        } else {
+            tcg_gen_qemu_ld_tl(memop & MO_BSWAP ? rdh : rdl, rs1l,
+                               ctx->mem_idx, MO_TEQ);
+            tcg_gen_movi_tl(imml, 8);
+            tcg_gen_movi_tl(immh, 0);
+            tcg_gen_add2_tl(rs1l, rs1h, rs1l, rs1h, imml, immh);
+            /* TODO: should assert that rs1h == 0 for now */
+            tcg_gen_qemu_ld_tl(memop & MO_BSWAP ? rdl : rdh, rs1l,
+                               ctx->mem_idx, MO_TEQ);
+        }
+
+        gen_set_gpr(a->rd, rdl);
+        gen_set_gprh(a->rd, rdh);
+
+        tcg_temp_free(rs1l);
+        tcg_temp_free(rs1h);
+        tcg_temp_free(rdl);
+        tcg_temp_free(rdh);
+        tcg_temp_free(imml);
+        tcg_temp_free(immh);
+        return true;
+    }
+    return gen_load_tl(ctx, a, memop);
+}
+#define gen_load(ctx, a, memop, xmemop) gen_load_i128(ctx, a, memop, xmemop)
+#else
+#define gen_load(ctx, a, memop, xmemop) gen_load_tl(ctx, a, memop)
+#endif
+
 static bool trans_lb(DisasContext *ctx, arg_lb *a)
 {
-    return gen_load(ctx, a, MO_SB);
+    return gen_load(ctx, a, MO_SB, XMO_NOP);
 }
 
 static bool trans_lh(DisasContext *ctx, arg_lh *a)
 {
-    return gen_load(ctx, a, MO_TESW);
+    return gen_load(ctx, a, MO_TESW, XMO_NOP);
 }
 
 static bool trans_lw(DisasContext *ctx, arg_lw *a)
 {
-    return gen_load(ctx, a, MO_TESL);
+    return gen_load(ctx, a, MO_TESL, XMO_NOP);
+}
+
+static bool trans_ld(DisasContext *ctx, arg_ld *a)
+{
+    REQUIRE_64_OR_128BIT(ctx);
+    return gen_load(ctx, a, MO_TEQ, XMO_TESQ);
+}
+
+static bool trans_lq(DisasContext *ctx, arg_lq *a)
+{
+    REQUIRE_128BIT(ctx);
+    return gen_load(ctx, a, MO_TEQ, XMO_TET);
 }
 
 static bool trans_lbu(DisasContext *ctx, arg_lbu *a)
 {
-    return gen_load(ctx, a, MO_UB);
+    return gen_load(ctx, a, MO_UB, XMO_NOP);
 }
 
 static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
 {
-    return gen_load(ctx, a, MO_TEUW);
+    return gen_load(ctx, a, MO_TEUW, XMO_NOP);
+}
+
+static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
+{
+    REQUIRE_64_OR_128BIT(ctx);
+    return gen_load(ctx, a, MO_TEUL, XMO_NOP);
 }
 
-static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
+static bool trans_ldu(DisasContext *ctx, arg_ldu* a)
+{
+    REQUIRE_128BIT(ctx);
+    return gen_load(ctx, a, MO_TEQ, XMO_TEUQ);
+}
+
+static bool gen_store_tl(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
     TCGv t0 = tcg_temp_new();
     TCGv dat = tcg_temp_new();
@@ -194,38 +295,81 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
     return true;
 }
 
+#if defined(TARGET_RISCV128)
+static bool gen_store_i128(DisasContext *ctx, arg_sb *a, MemOp memop, XMemOp xm)
+{
+    if (is_128bit(ctx)) {
+        TCGv rs1l = tcg_temp_new();
+        TCGv rs1h = tcg_temp_new();
+        TCGv rs2l = tcg_temp_new();
+        TCGv rs2h = tcg_temp_new();
+        TCGv imml = tcg_temp_new();
+        TCGv immh = tcg_const_tl((a->imm & 0b100000000000)
+                                  ? 0xffffffffffffffff
+                                  : 0);
+
+        gen_get_gpr(rs1l, a->rs1);
+        gen_get_gprh(rs1h, a->rs1);
+        gen_get_gpr(rs2l, a->rs2);
+        gen_get_gprh(rs2h, a->rs2);
+        /* Build a 128-bit address */
+        tcg_gen_movi_tl(imml, a->imm);
+        tcg_gen_add2_tl(rs1l, rs1h, rs1l, rs1h, imml, immh);
+        /* TODO: should assert that rs1h == 0 for now */
+
+        if (xm != XMO_TET) {
+            tcg_gen_qemu_st_tl(rs2l, rs1l, ctx->mem_idx, memop);
+        } else {
+            tcg_gen_qemu_st_tl(memop & MO_BSWAP ? rs2h : rs2l, rs1l,
+                               ctx->mem_idx, MO_TEQ);
+            tcg_gen_movi_tl(imml, 8);
+            tcg_gen_movi_tl(immh, 0);
+            tcg_gen_add2_tl(rs1l, rs1h, rs1l, rs1h, imml, immh);
+            /* TODO: should assert that rs1h == 0 for now */
+            tcg_gen_qemu_st_tl(memop & MO_BSWAP ? rs2l : rs2h, rs1l,
+                               ctx->mem_idx, MO_TEQ);
+        }
+
+        tcg_temp_free(rs1l);
+        tcg_temp_free(rs1h);
+        tcg_temp_free(rs2l);
+        tcg_temp_free(rs2h);
+        tcg_temp_free(imml);
+        tcg_temp_free(immh);
+        return true;
+    }
+    return gen_store_tl(ctx, a, memop);
+}
+#define gen_store(ctx, a, memop, xmemop) gen_store_i128(ctx, a, memop, xmemop)
+#else
+#define gen_store(ctx, a, memop, xmemop) gen_store_tl(ctx, a, memop)
+#endif
 
 static bool trans_sb(DisasContext *ctx, arg_sb *a)
 {
-    return gen_store(ctx, a, MO_SB);
+    return gen_store(ctx, a, MO_SB, XMO_NOP);
 }
 
 static bool trans_sh(DisasContext *ctx, arg_sh *a)
 {
-    return gen_store(ctx, a, MO_TESW);
+    return gen_store(ctx, a, MO_TESW, XMO_NOP);
 }
 
 static bool trans_sw(DisasContext *ctx, arg_sw *a)
 {
-    return gen_store(ctx, a, MO_TESL);
+    return gen_store(ctx, a, MO_TESL, XMO_NOP);
 }
 
-static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
-{
-    REQUIRE_64BIT(ctx);
-    return gen_load(ctx, a, MO_TEUL);
-}
-
-static bool trans_ld(DisasContext *ctx, arg_ld *a)
+static bool trans_sd(DisasContext *ctx, arg_sd *a)
 {
-    REQUIRE_64BIT(ctx);
-    return gen_load(ctx, a, MO_TEQ);
+    REQUIRE_64_OR_128BIT(ctx);
+    return gen_store(ctx, a, MO_TEQ, XMO_NOP);
 }
 
-static bool trans_sd(DisasContext *ctx, arg_sd *a)
+static bool trans_sq(DisasContext *ctx, arg_sq *a)
 {
-    REQUIRE_64BIT(ctx);
-    return gen_store(ctx, a, MO_TEQ);
+    REQUIRE_128BIT(ctx);
+    return gen_store(ctx, a, MO_TEQ, XMO_TET);
 }
 
 static bool trans_addi(DisasContext *ctx, arg_addi *a)
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index c754396575..c1e9ba8309 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2655,6 +2655,12 @@ void tcg_gen_ext_i32_i64(TCGv_i64 ret, TCGv_i32 arg)
     }
 }
 
+void tcg_gen_ext_i64_i128(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg)
+{
+    tcg_gen_mov_i64(lo, arg);
+    tcg_gen_sari_i64(hi, arg, 63);
+}
+
 void tcg_gen_concat_i32_i64(TCGv_i64 dest, TCGv_i32 low, TCGv_i32 high)
 {
     TCGv_i64 tmp;
-- 
2.33.0


