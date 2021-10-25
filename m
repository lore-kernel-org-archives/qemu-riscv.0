Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mez61-0006Fi-Ce
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 08:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez5r-0005tc-4p; Mon, 25 Oct 2021 08:28:47 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez5m-00083f-5K; Mon, 25 Oct 2021 08:28:46 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id D535A4196E;
 Mon, 25 Oct 2021 14:28:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1635164913;
 bh=t7CZ/ykazyQByTEQK67mp0FWUl11/p/ftC8xmY3hk8I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R00xFpDZ9q90P0Oz/gAsnUyQtXB6nq+8n2FSi5EOgteBp8Lcucs6B8sUTWnv5HqB7
 0j/sXy5QxdT+hPGYfCpKANrGGmZGhdUMED8sZzVDmxZ0Jm8VGiMW2h6QiTVB5C+cGZ
 yo9dVWCVauiHpQIwu6QYbGTGBHvQJ5BVMCqaVIYdGpvpj8w6TnRADiSBayEfFnv7lB
 GuyMd6AIWOXTzivOVXFM/rigkq1XPOefMJyl2Y0N/6VhEWSvbU2qBlD9euSrPyeroK
 qMGhqR533g83blJKluaLY13OiYTE93DXan6FNCeiN2ZdN52VOKDwbqsf8fYQQekOjS
 CYeK4DpaDYdjg==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id B954960066;
 Mon, 25 Oct 2021 14:28:33 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 7931B14005A;
 Mon, 25 Oct 2021 14:28:33 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v4 08/17] target/riscv: accessors to registers upper part and
 128-bit load/store
Date: Mon, 25 Oct 2021 14:28:09 +0200
Message-Id: <20211025122818.168890-9-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
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
X-List-Received-Date: Mon, 25 Oct 2021 12:28:48 -0000

Get function to retrieve the 64 top bits of a register, stored in the gprh
field of the cpu state. Set function that writes the 128-bit value at once.
The access to the gprh field can not be protected at compile time to make
sure it is accessed only in the 128-bit version of the processor because we
have no way to indicate that the misa_mxl_max field is const.

The 128-bit ISA adds ldu, lq and sq. We provide support for these
instructions. Note that we compte only 64-bit addresses to actually access
memory, cowardly utilizing the existing address translation mechanism of
QEMU.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 configs/targets/riscv128-softmmu.mak    |   3 +-
 target/riscv/insn16.decode              |  27 +++++-
 target/riscv/insn32.decode              |   5 ++
 target/riscv/translate.c                |  43 +++++++++
 target/riscv/insn_trans/trans_rvi.c.inc | 112 ++++++++++++++++++++++--
 5 files changed, 178 insertions(+), 12 deletions(-)

diff --git a/configs/targets/riscv128-softmmu.mak b/configs/targets/riscv128-softmmu.mak
index a9343d57d3..41daab1cd3 100644
--- a/configs/targets/riscv128-softmmu.mak
+++ b/configs/targets/riscv128-softmmu.mak
@@ -1,5 +1,6 @@
 TARGET_ARCH=riscv128
 TARGET_BASE_ARCH=riscv
-TARGET_SUPPORTS_MTTCG=y
+# As long as we have no atomic accesses for aligned 128-bit addresses
+TARGET_SUPPORTS_MTTCG=n
 TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-virtual.xml
 TARGET_NEED_FDT=y
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
index 63a52bb707..070db77ca5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -55,6 +55,7 @@ typedef struct DisasContext {
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     target_ulong priv_ver;
+    RISCVMXL misa_mxl_max;
     RISCVMXL xl;
     uint32_t misa_ext;
     uint32_t opcode;
@@ -116,6 +117,13 @@ static inline int get_olen(DisasContext *ctx)
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
@@ -220,6 +228,7 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
         }
         break;
     case MXL_RV64:
+    case MXL_RV128:
         break;
     default:
         g_assert_not_reached();
@@ -227,6 +236,15 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
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
@@ -235,6 +253,14 @@ static TCGv dest_gpr(DisasContext *ctx, int reg_num)
     return cpu_gpr[reg_num];
 }
 
+static TCGv dest_gprh(DisasContext *ctx, int reg_num)
+{
+    if (reg_num == 0 || get_ol(ctx) < MXL_RV128) {
+        return temp_new(ctx);
+    }
+    return cpu_gprh[reg_num];
+}
+
 static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
 {
     if (reg_num != 0) {
@@ -243,11 +269,27 @@ static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
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
+    if (get_ol(ctx) != MXL_RV128) {
+        g_assert_not_reached();
+    }
+    if (reg_num != 0) {
+        tcg_gen_mov_tl(cpu_gpr[reg_num], rl);
+        tcg_gen_mov_tl(cpu_gprh[reg_num], rh);
     }
 }
 
@@ -649,6 +691,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
     ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->misa_mxl_max = env->misa_mxl_max;
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs = cs;
     ctx->ntemp = 0;
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 34164494b9..d17bde6a3a 100644
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
@@ -150,6 +150,50 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
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
+    if (a->imm != 0) {
+        tcg_gen_addi_tl(addrl, src1l, a->imm);
+    } else {
+        tcg_gen_mov_tl(addrl, src1l);
+    }
+
+    if (memop != MO_TEO) {
+        tcg_gen_qemu_ld_tl(destl, addrl, ctx->mem_idx, memop);
+        if (memop & MO_SIGN) {
+            tcg_gen_sari_tl(desth, destl, 63);
+        } else {
+            tcg_gen_movi_tl(desth, 0);
+        }
+    } else {
+        tcg_gen_qemu_ld_tl(memop & MO_BSWAP ? desth : destl, addrl,
+                           ctx->mem_idx, MO_TEQ);
+        tcg_gen_addi_tl(addrl, addrl, 8);
+        tcg_gen_qemu_ld_tl(memop & MO_BSWAP ? destl : desth, addrl,
+                           ctx->mem_idx, MO_TEQ);
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
@@ -165,6 +209,18 @@ static bool trans_lw(DisasContext *ctx, arg_lw *a)
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
@@ -177,17 +233,17 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
 
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
 
-static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
+static bool gen_store_tl(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
     TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
     TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
@@ -202,6 +258,42 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
     return true;
 }
 
+static bool gen_store_i128(DisasContext *ctx, arg_sb *a, MemOp memop)
+{
+    TCGv src1l = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2l = get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv src2h = get_gprh(ctx, a->rs2);
+    TCGv addrl = tcg_temp_new();
+
+    if (a->imm != 0) {
+        tcg_gen_addi_tl(addrl, src1l, a->imm);
+    } else {
+        tcg_gen_mov_tl(addrl, src1l);
+    }
+
+    if (memop != MO_TEO) {
+        tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, memop);
+    } else {
+        tcg_gen_qemu_st_tl(memop & MO_BSWAP ? src2h : src2l, addrl,
+            ctx->mem_idx, MO_TEQ);
+        tcg_gen_addi_tl(addrl, addrl, 8);
+        tcg_gen_qemu_st_tl(memop & MO_BSWAP ? src2l : src2h, addrl,
+            ctx->mem_idx, MO_TEQ);
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
@@ -219,10 +311,16 @@ static bool trans_sw(DisasContext *ctx, arg_sw *a)
 
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
 static bool trans_addi(DisasContext *ctx, arg_addi *a)
 {
     return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
-- 
2.33.0


