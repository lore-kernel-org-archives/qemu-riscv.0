Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEUX-0000C9-NK
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUD-0008SH-UK; Wed, 06 Oct 2021 17:30:03 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUB-00088a-2S; Wed, 06 Oct 2021 17:30:01 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 5BE4241E7A;
 Wed,  6 Oct 2021 23:29:36 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 4420660067;
 Wed,  6 Oct 2021 23:29:36 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id F223014005C;
 Wed,  6 Oct 2021 23:29:35 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 16/27] target/riscv: support for 128-bit loads and store
Date: Wed,  6 Oct 2021 23:28:22 +0200
Message-Id: <20211006212833.108706-17-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 06 Oct 2021 21:30:07 -0000

The 128-bit ISA adds ldu, lq and sq. We provide here support for these
instructions. Note that although we compute a 128-bit address, we only use
the lower 64-bit to actually address memory, cowardly utilizing the
existing address translation mechanism of QEMU.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/insn16.decode              |  32 +++++-
 target/riscv/insn32.decode              |   4 +
 target/riscv/insn_trans/trans_rvi.c.inc | 132 ++++++++++++++++++++++--
 3 files changed, 157 insertions(+), 11 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 2e9212663c..151fc6e567 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -39,6 +39,10 @@
 %imm_addi16sp  12:s1 3:2 5:1 2:1 6:1 !function=ex_shift_4
 %imm_lui       12:s1 2:5             !function=ex_shift_12
 
+# Added for 128 bit support
+%uimm_cl_q    5:2 10:3               !function=ex_shift_3
+%uimm_6bit_lq 2:3 12:1 5:2           !function=ex_shift_3
+%uimm_6bit_sq 7:3 10:3               !function=ex_shift_3
 
 # Argument sets imported from insn32.decode:
 &empty                  !extern
@@ -54,16 +58,20 @@
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
@@ -87,9 +95,17 @@
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
@@ -132,7 +148,11 @@ addw              100 1 11 ... 01 ... 01 @cs_2
 
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
@@ -147,7 +167,11 @@ fld               001 .  .....  ..... 10 @c_ldsp
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
index 2cd921d51c..79611cb65d 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -163,6 +163,10 @@ sllw     0000000 .....  ..... 001 ..... 0111011 @r
 srlw     0000000 .....  ..... 101 ..... 0111011 @r
 sraw     0100000 .....  ..... 101 ..... 0111011 @r
 
+# *** RV128I Base Instruction Set (in addition to RV64I) ***
+ldu      ............   ..... 111 ..... 0000011 @i
+lq       ............   ..... 010 ..... 0001111 @i
+sq       ............   ..... 100 ..... 0100011 @s
 # *** RV32M Standard Extension ***
 mul      0000001 .....  ..... 000 ..... 0110011 @r
 mulh     0000001 .....  ..... 001 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index eca9a76ad5..1373fe94b9 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -275,9 +275,63 @@ static bool gen_load_tl(DisasContext *ctx, arg_lb *a, MemOp memop)
     return true;
 }
 
+/*
+ * TODO: we should assert that src1h == 0, as we do not change the
+ *       address translation mechanism
+ */
+static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop)
+{
+    TCGv src1l = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src1h = get_gprh(ctx, a->rs1);
+    TCGv destl = dest_gpr(ctx, a->rd);
+    TCGv desth = dest_gprh(ctx, a->rd);
+    TCGv addrl = tcg_temp_new();
+    TCGv addrh = tcg_temp_new();
+    TCGv imml = tcg_temp_new();
+    TCGv immh = tcg_constant_tl(-(a->imm < 0));
+
+    /* Build a 128-bit address */
+    if (a->imm != 0) {
+        tcg_gen_movi_tl(imml, a->imm);
+        tcg_gen_add2_tl(addrl, addrh, src1l, src1h, imml, immh);
+    } else {
+        tcg_gen_mov_tl(addrl, src1l);
+        tcg_gen_mov_tl(addrh, src1h);
+    }
+
+    if (memop != (MemOp)MO_TEO) {
+        tcg_gen_qemu_ld_tl(destl, addrl, ctx->mem_idx, memop);
+        if (memop & MO_SIGN) {
+            tcg_gen_sari_tl(desth, destl, 63);
+        } else {
+            tcg_gen_movi_tl(desth, 0);
+        }
+    } else {
+        tcg_gen_qemu_ld_tl(memop & MO_BSWAP ? desth : destl, addrl,
+                           ctx->mem_idx, MO_TEQ);
+        tcg_gen_movi_tl(imml, 8);
+        tcg_gen_movi_tl(immh, 0);
+        tcg_gen_add2_tl(addrl, addrh, addrl, addrh, imml, immh);
+        tcg_gen_qemu_ld_tl(memop & MO_BSWAP ? destl : desth, addrl,
+                           ctx->mem_idx, MO_TEQ);
+    }
+
+    gen_set_gpr(ctx, a->rd, destl);
+    gen_set_gprh(ctx, a->rd, desth);
+
+    tcg_temp_free(addrl);
+    tcg_temp_free(addrh);
+    tcg_temp_free(imml);
+    return true;
+}
+
 static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
-    return gen_load_tl(ctx, a, memop);
+    if (is_128bit(ctx)) {
+        return gen_load_i128(ctx, a, memop);
+    } else {
+        return gen_load_tl(ctx, a, memop);
+    }
 }
 
 static bool trans_lb(DisasContext *ctx, arg_lb *a)
@@ -295,6 +349,18 @@ static bool trans_lw(DisasContext *ctx, arg_lw *a)
     return gen_load(ctx, a, MO_TESL);
 }
 
+static bool trans_ld(DisasContext *ctx, arg_ld *a)
+{
+    REQUIRE_64_OR_128BIT(ctx);
+    return gen_load(ctx, a, MO_TESQ);
+}
+
+static bool trans_lq(DisasContext *ctx, arg_lq *a)
+{
+    REQUIRE_128BIT(ctx);
+    return gen_load(ctx, a, MO_TEO);
+}
+
 static bool trans_lbu(DisasContext *ctx, arg_lbu *a)
 {
     return gen_load(ctx, a, MO_UB);
@@ -307,14 +373,14 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
 
 static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     return gen_load(ctx, a, MO_TEUL);
 }
 
-static bool trans_ld(DisasContext *ctx, arg_ld *a)
+static bool trans_ldu(DisasContext *ctx, arg_ldu *a)
 {
-    REQUIRE_64BIT(ctx);
-    return gen_load(ctx, a, MO_TEQ);
+    REQUIRE_128BIT(ctx);
+    return gen_load(ctx, a, MO_TEUQ);
 }
 
 static bool gen_store_tl(DisasContext *ctx, arg_sb *a, MemOp memop)
@@ -332,9 +398,55 @@ static bool gen_store_tl(DisasContext *ctx, arg_sb *a, MemOp memop)
     return true;
 }
 
+/*
+ * TODO: we should assert that src1h == 0, as we do not change the
+ *       address translation mechanism
+ */
+static bool gen_store_i128(DisasContext *ctx, arg_sb *a, MemOp memop)
+{
+    TCGv src1l = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src1h = get_gprh(ctx, a->rs1);
+    TCGv src2l = get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv src2h = get_gprh(ctx, a->rs2);
+    TCGv addrl = tcg_temp_new();
+    TCGv addrh = tcg_temp_new();
+    TCGv imml = tcg_temp_new();
+    TCGv immh = tcg_constant_tl(-(a->imm < 0));
+
+    /* Build a 128-bit address */
+    if (a->imm != 0) {
+        tcg_gen_movi_tl(imml, a->imm);
+        tcg_gen_add2_tl(addrl, addrh, src1l, src1h, imml, immh);
+    } else {
+        tcg_gen_mov_tl(addrl, src1l);
+        tcg_gen_mov_tl(addrh, src1h);
+    }
+
+    if (memop != (MemOp)MO_TEO) {
+        tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, memop);
+    } else {
+        tcg_gen_qemu_st_tl(memop & MO_BSWAP ? src2h : src2l, addrl,
+            ctx->mem_idx, MO_TEQ);
+        tcg_gen_movi_tl(imml, 8);
+        tcg_gen_movi_tl(immh, 0);
+        tcg_gen_add2_tl(addrl, addrh, addrl, addrh, imml, immh);
+        tcg_gen_qemu_st_tl(memop & MO_BSWAP ? src2l : src2h, addrl,
+            ctx->mem_idx, MO_TEQ);
+    }
+
+    tcg_temp_free(addrl);
+    tcg_temp_free(addrh);
+    tcg_temp_free(imml);
+    return true;
+}
+
 static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
-    return gen_store_tl(ctx, a, memop);
+    if (is_128bit(ctx)) {
+        return gen_store_i128(ctx, a, memop);
+    } else {
+        return gen_store_tl(ctx, a, memop);
+    }
 }
 
 static bool trans_sb(DisasContext *ctx, arg_sb *a)
@@ -354,10 +466,16 @@ static bool trans_sw(DisasContext *ctx, arg_sw *a)
 
 static bool trans_sd(DisasContext *ctx, arg_sd *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     return gen_store(ctx, a, MO_TEQ);
 }
 
+static bool trans_sq(DisasContext *ctx, arg_sq *a)
+{
+    REQUIRE_128BIT(ctx);
+    return gen_store(ctx, a, MO_TEO);
+}
+
 static void gen_addi2_i128(TCGv retl, TCGv reth,
                            TCGv srcl, TCGv srch, target_long imm)
 {
-- 
2.33.0


