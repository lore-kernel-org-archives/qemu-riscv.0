Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrKhE-0006Lo-Ot
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 08:58:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrKgn-0005wB-PP; Sun, 28 Nov 2021 08:57:59 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:34524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrKgk-0004fT-Vk; Sun, 28 Nov 2021 08:57:57 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id BF909402A1;
 Sun, 28 Nov 2021 14:57:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1638107868;
 bh=/ZUsmO/2xWHVMHE5utO/iL16zADu6Adac2TCWZTzogk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YbGg3BMycYJRBtmT5biJbmeTaX49lK9+EwlNas4TVWKqQxD9/LfXFy94lhhieWH8Z
 gu8GM797/8TnCbiM7x0DLrm7IPtqGmDJ4pzpu7z3GcZDV6afV0Ck/kl3Qvwx62cEjc
 F/Mue3pc0bAGPEOBs8iTYyPcLT66nRLgHv2yB/Xl6u302SAEKd2jEbyuXFidfumJAY
 34sBIDWO654U4tU/cTymsTl09OYdVhePkHhv4pn2POC/ugkFT7Tjt0md3hIhBrcC/Z
 uP6jKWUf3zWLZPUtiW42g2dVcJfBO1as+XyRoIPWX6Lu8ydUx2CpogwvwEFtmX/3r8
 BenrUKWJOXGog==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id A721960066;
 Sun, 28 Nov 2021 14:57:48 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 745DA4006D;
 Sun, 28 Nov 2021 14:57:48 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v6 09/18] target/riscv: accessors to registers upper part and
 128-bit load/store
Date: Sun, 28 Nov 2021 14:57:10 +0100
Message-Id: <20211128135719.50444-10-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
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
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Nov 2021 13:58:01 -0000

Get function to retrieve the 64 top bits of a register, stored in the gprh
field of the cpu state. Set function that writes the 128-bit value at once.
The access to the gprh field can not be protected at compile time to make
sure it is accessed only in the 128-bit version of the processor because we
have no way to indicate that the misa_mxl_max field is const.

The 128-bit ISA adds ldu, lq and sq. We provide support for these
instructions. Note that (a) we compute only 64-bit addresses to actually
access memory, cowardly utilizing the existing address translation mechanism
of QEMU, and (b) we assume for now little-endian memory accesses.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/insn16.decode              |  27 ++++++-
 target/riscv/insn32.decode              |   5 ++
 target/riscv/translate.c                |  41 ++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc | 100 ++++++++++++++++++++++--
 4 files changed, 163 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 2e9212663c..02c8f61b48 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -25,14 +25,17 @@
 # Immediates:
 %imm_ci        12:s1 2:5
 %nzuimm_ciw    7:4 11:2 5:1 6:1   !function=ex_shift_2
+%uimm_cl_q     10:1 5:2 11:2      !function=ex_shift_4
 %uimm_cl_d     5:2 10:3           !function=ex_shift_3
 %uimm_cl_w     5:1 10:3 6:1       !function=ex_shift_2
 %imm_cb        12:s1 5:2 2:1 10:2 3:2 !function=ex_shift_1
 %imm_cj        12:s1 8:1 9:2 6:1 7:1 2:1 11:1 3:3 !function=ex_shift_1
 
 %shimm_6bit   12:1 2:5               !function=ex_rvc_shifti
+%uimm_6bit_lq 2:4 12:1 6:1           !function=ex_shift_4
 %uimm_6bit_ld 2:3 12:1 5:2           !function=ex_shift_3
 %uimm_6bit_lw 2:2 12:1 4:3           !function=ex_shift_2
+%uimm_6bit_sq 7:4 11:2               !function=ex_shift_4
 %uimm_6bit_sd 7:3 10:3               !function=ex_shift_3
 %uimm_6bit_sw 7:2 9:4                !function=ex_shift_2
 
@@ -54,16 +57,20 @@
 # Formats 16:
 @cr        ....  ..... .....  .. &r      rs2=%rs2_5       rs1=%rd     %rd
 @ci        ... . ..... .....  .. &i      imm=%imm_ci      rs1=%rd     %rd
+@cl_q      ... . .....  ..... .. &i      imm=%uimm_cl_q   rs1=%rs1_3  rd=%rs2_3
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
@@ -87,9 +94,15 @@
   illegal         000  000 000 00 --- 00
   addi            000  ... ... .. ... 00 @c_addi4spn
 }
-fld               001  ... ... .. ... 00 @cl_d
+{
+  lq              001  ... ... .. ... 00 @cl_q
+  fld             001  ... ... .. ... 00 @cl_d
+}
 lw                010  ... ... .. ... 00 @cl_w
-fsd               101  ... ... .. ... 00 @cs_d
+{
+  sq              101  ... ... .. ... 00 @cs_q
+  fsd             101  ... ... .. ... 00 @cs_d
+}
 sw                110  ... ... .. ... 00 @cs_w
 
 # *** RV32C and RV64C specific Standard Extension (Quadrant 0) ***
@@ -132,7 +145,10 @@ addw              100 1 11 ... 01 ... 01 @cs_2
 
 # *** RV32/64C Standard Extension (Quadrant 2) ***
 slli              000 .  .....  ..... 10 @c_shift2
-fld               001 .  .....  ..... 10 @c_ldsp
+{
+  lq              001  ... ... .. ... 10 @c_lqsp
+  fld             001 .  .....  ..... 10 @c_ldsp
+}
 {
   illegal         010 -  00000  ----- 10 # c.lwsp, RES rd=0
   lw              010 .  .....  ..... 10 @c_lwsp
@@ -147,7 +163,10 @@ fld               001 .  .....  ..... 10 @c_ldsp
   jalr            100 1  .....  00000 10 @c_jalr rd=1  # C.JALR
   add             100 1  .....  ..... 10 @cr
 }
-fsd               101   ......  ..... 10 @c_sdsp
+{
+  sq              101  ... ... .. ... 10 @c_sqsp
+  fsd             101   ......  ..... 10 @c_sdsp
+}
 sw                110 .  .....  ..... 10 @c_swsp
 
 # *** RV32C and RV64C specific Standard Extension (Quadrant 2) ***
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2f251dac1b..02889c6082 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -163,6 +163,11 @@ sllw     0000000 .....  ..... 001 ..... 0111011 @r
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
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f969885eed..b6127783b3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -58,6 +58,7 @@ typedef struct DisasContext {
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     target_ulong priv_ver;
+    RISCVMXL misa_mxl_max;
     RISCVMXL xl;
     uint32_t misa_ext;
     uint32_t opcode;
@@ -123,6 +124,13 @@ static inline int get_olen(DisasContext *ctx)
     return 16 << get_ol(ctx);
 }
 
+/* The maximum register length */
+#ifdef TARGET_RISCV32
+#define get_xl_max(ctx)    MXL_RV32
+#else
+#define get_xl_max(ctx)    ((ctx)->misa_mxl_max)
+#endif
+
 /*
  * RISC-V requires NaN-boxing of narrower width floating point values.
  * This applies when a 32-bit value is assigned to a 64-bit FP register.
@@ -227,6 +235,7 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
         }
         break;
     case MXL_RV64:
+    case MXL_RV128:
         break;
     default:
         g_assert_not_reached();
@@ -234,6 +243,15 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
     return cpu_gpr[reg_num];
 }
 
+static TCGv get_gprh(DisasContext *ctx, int reg_num)
+{
+    assert(get_xl(ctx) == MXL_RV128);
+    if (reg_num == 0) {
+        return ctx->zero;
+    }
+    return cpu_gprh[reg_num];
+}
+
 static TCGv dest_gpr(DisasContext *ctx, int reg_num)
 {
     if (reg_num == 0 || get_olen(ctx) < TARGET_LONG_BITS) {
@@ -242,6 +260,14 @@ static TCGv dest_gpr(DisasContext *ctx, int reg_num)
     return cpu_gpr[reg_num];
 }
 
+static TCGv dest_gprh(DisasContext *ctx, int reg_num)
+{
+    if (reg_num == 0) {
+        return temp_new(ctx);
+    }
+    return cpu_gprh[reg_num];
+}
+
 static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
 {
     if (reg_num != 0) {
@@ -250,11 +276,25 @@ static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
             tcg_gen_ext32s_tl(cpu_gpr[reg_num], t);
             break;
         case MXL_RV64:
+        case MXL_RV128:
             tcg_gen_mov_tl(cpu_gpr[reg_num], t);
             break;
         default:
             g_assert_not_reached();
         }
+
+        if (get_xl_max(ctx) == MXL_RV128) {
+            tcg_gen_sari_tl(cpu_gprh[reg_num], cpu_gpr[reg_num], 63);
+        }
+    }
+}
+
+static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv rh)
+{
+    assert(get_ol(ctx) == MXL_RV128);
+    if (reg_num != 0) {
+        tcg_gen_mov_tl(cpu_gpr[reg_num], rl);
+        tcg_gen_mov_tl(cpu_gprh[reg_num], rh);
     }
 }
 
@@ -673,6 +713,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
     ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->misa_mxl_max = env->misa_mxl_max;
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs = cs;
     ctx->ntemp = 0;
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 710f5e6a85..e572976e88 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -134,7 +134,7 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
     return gen_branch(ctx, a, TCG_COND_GEU);
 }
 
-static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
+static bool gen_load_tl(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
     TCGv dest = dest_gpr(ctx, a->rd);
     TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
@@ -151,6 +151,45 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
     return true;
 }
 
+/* Compute only 64-bit addresses to use the address translation mechanism */
+static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop)
+{
+    TCGv src1l = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv destl = dest_gpr(ctx, a->rd);
+    TCGv desth = dest_gprh(ctx, a->rd);
+    TCGv addrl = tcg_temp_new();
+
+    tcg_gen_addi_tl(addrl, src1l, a->imm);
+
+    if ((memop & MO_SIZE) <= MO_64) {
+        tcg_gen_qemu_ld_tl(destl, addrl, ctx->mem_idx, memop);
+        if (memop & MO_SIGN) {
+            tcg_gen_sari_tl(desth, destl, 63);
+        } else {
+            tcg_gen_movi_tl(desth, 0);
+        }
+    } else {
+        /* assume little-endian memory access for now */
+        tcg_gen_qemu_ld_tl(destl, addrl, ctx->mem_idx, MO_TEUQ);
+        tcg_gen_addi_tl(addrl, addrl, 8);
+        tcg_gen_qemu_ld_tl(desth, addrl, ctx->mem_idx, MO_TEUQ);
+    }
+
+    gen_set_gpr128(ctx, a->rd, destl, desth);
+
+    tcg_temp_free(addrl);
+    return true;
+}
+
+static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
+{
+    if (get_xl(ctx) == MXL_RV128) {
+        return gen_load_i128(ctx, a, memop);
+    } else {
+        return gen_load_tl(ctx, a, memop);
+    }
+}
+
 static bool trans_lb(DisasContext *ctx, arg_lb *a)
 {
     return gen_load(ctx, a, MO_SB);
@@ -166,6 +205,18 @@ static bool trans_lw(DisasContext *ctx, arg_lw *a)
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
+    return gen_load(ctx, a, MO_TEUO);
+}
+
 static bool trans_lbu(DisasContext *ctx, arg_lbu *a)
 {
     return gen_load(ctx, a, MO_UB);
@@ -178,17 +229,17 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
 
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
+    REQUIRE_128BIT(ctx);
     return gen_load(ctx, a, MO_TEUQ);
 }
 
-static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
+static bool gen_store_tl(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
     TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
     TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
@@ -204,6 +255,37 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
     return true;
 }
 
+static bool gen_store_i128(DisasContext *ctx, arg_sb *a, MemOp memop)
+{
+    TCGv src1l = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2l = get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv src2h = get_gprh(ctx, a->rs2);
+    TCGv addrl = tcg_temp_new();
+
+    tcg_gen_addi_tl(addrl, src1l, a->imm);
+
+    if ((memop & MO_SIZE) <= MO_64) {
+        tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, memop);
+    } else {
+        /* little-endian memory access assumed for now */
+        tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, MO_TEUQ);
+        tcg_gen_addi_tl(addrl, addrl, 8);
+        tcg_gen_qemu_st_tl(src2h, addrl, ctx->mem_idx, MO_TEUQ);
+    }
+
+    tcg_temp_free(addrl);
+    return true;
+}
+
+static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
+{
+    if (get_xl(ctx) == MXL_RV128) {
+        return gen_store_i128(ctx, a, memop);
+    } else {
+        return gen_store_tl(ctx, a, memop);
+    }
+}
+
 static bool trans_sb(DisasContext *ctx, arg_sb *a)
 {
     return gen_store(ctx, a, MO_SB);
@@ -221,10 +303,16 @@ static bool trans_sw(DisasContext *ctx, arg_sw *a)
 
 static bool trans_sd(DisasContext *ctx, arg_sd *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     return gen_store(ctx, a, MO_TEUQ);
 }
 
+static bool trans_sq(DisasContext *ctx, arg_sq *a)
+{
+    REQUIRE_128BIT(ctx);
+    return gen_store(ctx, a, MO_TEUO);
+}
+
 static bool trans_addi(DisasContext *ctx, arg_addi *a)
 {
     return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
-- 
2.34.0


