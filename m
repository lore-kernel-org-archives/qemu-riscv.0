Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKmvN-0007w5-4F
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 15:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKkty-0005AJ-Br; Mon, 30 Aug 2021 13:16:54 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:50210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKktt-0007Ci-W9; Mon, 30 Aug 2021 13:16:54 -0400
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 2658040E3B;
 Mon, 30 Aug 2021 19:16:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1630343808;
 bh=kDhwLrSue8ukSsViyzTmdu747QGEZgQwzRdVptwftzM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=4eSUOZTtVmR2NNnCfkZ2slxjOEBJix9IY+guz2gcHhyTWn9PkBiIN+xjD39O8Xzc8
 KmTEQnZhehTi2b3GgFtA8IZzIRqUJy7wxm16Oq8s8Nq+lEmiElgZL3t+kua/YEDz1c
 36maRulzSBOFJRNo6kfg4A5vAl2QYne4PS3CU41/Mlhxcmp8SgLD8vMZCiaieNZBu7
 Uc2WY2zH4QHTBdFBu8kBHLZFh1lGcmBzFF6kKbP7X72W/r14I5o5z00RefVmWFs23B
 eB8S8eg00QXEWeagcrZaVRICBdOdu5STZ6vM9KwjhDCp69vX58H98UU1O/i8ECitau
 kBAIar2FNt7Sw==
Received: from smtps.univ-grenoble-alpes.fr (smtps1.u-ga.fr [152.77.1.30])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id 2134080137;
 Mon, 30 Aug 2021 19:16:48 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id ACC95187E12;
 Mon, 30 Aug 2021 19:16:47 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 4/8] target/riscv: 128-bit arithmetic and logic instructions
Date: Mon, 30 Aug 2021 19:16:34 +0200
Message-Id: <20210830171638.126325-4-frederic.petrot@univ-grenoble-alpes.fr>
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
X-Mailman-Approved-At: Mon, 30 Aug 2021 15:26:27 -0400
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

Adding the support for the 128-bit arithmetic and logic instructions.
Remember that all (i) instructions are now acting on 128-bit registers, that
a few others are added to cope with values that are held on 64 bits within
the 128-bit registers, and that the ones that cope with values on 32-bit
must also be modified for proper sign extension.
Most algorithms taken from Hackers' delight.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/insn32.decode              |  13 +
 target/riscv/insn_trans/trans_rvi.c.inc | 955 +++++++++++++++++++++++-
 target/riscv/translate.c                |  25 +
 3 files changed, 976 insertions(+), 17 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 225669e277..2fe7e1dd36 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -22,6 +22,7 @@
 %rs1       15:5
 %rd        7:5
 %sh5       20:5
+%sh6       20:6
 
 %sh7    20:7
 %csr    20:12
@@ -91,6 +92,9 @@
 # Formats 64:
 @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
 
+# Formats 128:
+@sh6       ...... ...... ..... ... ..... ....... &shift shamt=%sh6 %rs1 %rd
+
 # *** Privileged Instructions ***
 ecall       000000000000     00000 000 00000 1110011
 ebreak      000000000001     00000 000 00000 1110011
@@ -166,6 +170,15 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
 ldu      ............   ..... 111 ..... 0000011 @i
 lq       ............   ..... 010 ..... 0001111 @i
 sq       ............   ..... 100 ..... 0100011 @s
+addid    ............  .....  000 ..... 1011011 @i
+sllid    000000 ......  ..... 001 ..... 1011011 @sh6
+srlid    000000 ......  ..... 101 ..... 1011011 @sh6
+sraid    010000 ......  ..... 101 ..... 1011011 @sh6
+addd     0000000 ..... .....  000 ..... 1111011 @r
+subd     0100000 ..... .....  000 ..... 1111011 @r
+slld     0000000 ..... .....  001 ..... 1111011 @r
+srld     0000000 ..... .....  101 ..... 1111011 @r
+srad     0100000 ..... .....  101 ..... 1111011 @r
 
 # *** RV32M Standard Extension ***
 mul      0000001 .....  ..... 000 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 772330a766..0401ba3d69 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -26,14 +26,20 @@ static bool trans_illegal(DisasContext *ctx, arg_empty *a)
 
 static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
 {
-     REQUIRE_64BIT(ctx);
-     return trans_illegal(ctx, a);
+    REQUIRE_64_OR_128BIT(ctx);
+    return trans_illegal(ctx, a);
 }
 
 static bool trans_lui(DisasContext *ctx, arg_lui *a)
 {
     if (a->rd != 0) {
         tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm);
+#if defined(TARGET_RISCV128)
+        if (is_128bit(ctx)) {
+            tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd],
+                                 cpu_gpr[a->rd]);
+        }
+#endif
     }
     return true;
 }
@@ -41,7 +47,25 @@ static bool trans_lui(DisasContext *ctx, arg_lui *a)
 static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
 {
     if (a->rd != 0) {
+#if defined(TARGET_RISCV128)
+        if (is_128bit(ctx)) {
+            /* TODO : when pc is 128 bits, use all its bits */
+            TCGv pc = tcg_const_tl(ctx->base.pc_next),
+                 imm = tcg_const_tl(a->imm),
+                 immh = tcg_const_tl((a->imm & 0x80000)
+                         ? 0xffffffffffffffff : 0),
+                 cnst_zero = tcg_const_tl(0);
+            tcg_gen_add2_tl(cpu_gpr[a->rd], cpu_gprh[a->rd], pc, cnst_zero,
+                            imm, immh);
+            tcg_temp_free(pc);
+            tcg_temp_free(imm);
+            tcg_temp_free(immh);
+            tcg_temp_free(cnst_zero);
+            return true;
+        }
+#endif
         tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm + ctx->base.pc_next);
+        return true;
     }
     return true;
 }
@@ -84,6 +108,94 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     return true;
 }
 
+#if defined(TARGET_RISCV128)
+static bool gen_setcond_128(TCGv rl, TCGv rh,
+                            TCGv al, TCGv ah,
+                            TCGv bl, TCGv bh,
+                            TCGCond cond) {
+    tcg_gen_sub2_tl(rl, rh, al, ah, bl, bh);
+    switch (cond) {
+    case TCG_COND_EQ:
+    {
+        TCGv tmp1 = tcg_temp_new(),
+             tmp2 = tcg_temp_new();
+        tcg_gen_setcondi_tl(TCG_COND_EQ, tmp1, rl, 0);
+        tcg_gen_setcondi_tl(TCG_COND_EQ, tmp2, rh, 0);
+        tcg_gen_and_tl(rl, tmp1, tmp2);
+
+        tcg_temp_free(tmp1);
+        tcg_temp_free(tmp2);
+        break;
+    }
+
+    case TCG_COND_NE:
+    {
+        TCGv tmp1 = tcg_temp_new(),
+             tmp2 = tcg_temp_new();
+        tcg_gen_setcondi_tl(TCG_COND_NE, tmp1, rl, 0);
+        tcg_gen_setcondi_tl(TCG_COND_NE, tmp2, rh, 0);
+        tcg_gen_or_tl(rl, tmp1, tmp2);
+        tcg_gen_movi_tl(rh, 0);
+
+        tcg_temp_free(tmp1);
+        tcg_temp_free(tmp2);
+        break;
+    }
+
+    case TCG_COND_LT:
+    {
+        TCGv tmp1 = tcg_temp_new(),
+             tmp2 = tcg_temp_new();
+
+        tcg_gen_xor_tl(tmp1, rh, ah);
+        tcg_gen_xor_tl(tmp2, ah, bh);
+        tcg_gen_and_tl(tmp1, tmp1, tmp2);
+        tcg_gen_xor_tl(tmp1, rh, tmp1);
+        tcg_gen_setcondi_tl(TCG_COND_LT, rl, tmp1, 0); /* Check sign bit */
+
+        tcg_temp_free(tmp1);
+        tcg_temp_free(tmp2);
+        break;
+    }
+
+    case TCG_COND_GE:
+        /* We invert the result of TCG_COND_LT */
+        gen_setcond_128(rl, rh, al, ah, bl, bh, TCG_COND_LT);
+        tcg_gen_setcondi_tl(TCG_COND_EQ, rl, rl, 0);
+        break;
+
+    case TCG_COND_LTU:
+    {
+        TCGv tmp1 = tcg_temp_new(),
+             tmp2 = tcg_temp_new();
+
+        tcg_gen_eqv_tl(tmp1, ah, bh);
+        tcg_gen_and_tl(tmp1, tmp1, rh);
+        tcg_gen_not_tl(tmp2, ah);
+        tcg_gen_and_tl(tmp2, tmp2, bh);
+        tcg_gen_or_tl(tmp1, tmp1, tmp2);
+
+        tcg_gen_setcondi_tl(TCG_COND_LT, rl, tmp1, 0); /* Check sign bit */
+
+        tcg_temp_free(tmp1);
+        tcg_temp_free(tmp2);
+        break;
+    }
+
+    case TCG_COND_GEU:
+        /* We invert the result of TCG_COND_LTU */
+        gen_setcond_128(rl, rh, al, ah, bl, bh, TCG_COND_LTU);
+        tcg_gen_setcondi_tl(TCG_COND_EQ, rl, rl, 0);
+        break;
+
+    default:
+        return false;
+    }
+    tcg_gen_movi_tl(rh, 0);
+    return true;
+}
+#endif
+
 static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 {
     TCGLabel *l = gen_new_label();
@@ -93,7 +205,28 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
     gen_get_gpr(source1, a->rs1);
     gen_get_gpr(source2, a->rs2);
 
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        TCGv source1h, source2h, tmph, tmpl;
+        source1h = tcg_temp_new();
+        source2h = tcg_temp_new();
+        tmph = tcg_temp_new();
+        tmpl = tcg_temp_new();
+        gen_get_gprh(source1h, a->rs1);
+        gen_get_gprh(source2h, a->rs2);
+
+        gen_setcond_128(tmpl, tmph, source1, source1h, source2, source2h, cond);
+        tcg_gen_brcondi_tl(TCG_COND_NE, tmpl, 0, l);
+        tcg_temp_free(source1h);
+        tcg_temp_free(source2h);
+        tcg_temp_free(tmph);
+        tcg_temp_free(tmpl);
+    } else {
+        tcg_gen_brcond_tl(cond, source1, source2, l);
+    }
+#else
     tcg_gen_brcond_tl(cond, source1, source2, l);
+#endif
     gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
     gen_set_label(l); /* branch taken */
 
@@ -166,7 +299,7 @@ static bool gen_load_tl(DisasContext *ctx, arg_lb *a, MemOp memop)
  * Changing MemOp values is too involved given our understanding, we
  * therefore use our own way to deal locally with zero or sign extended
  * 64-bit values, and 128-bit values.
- * Doing this implies adding a preprocessor conditional in all memory access
+ * Doing this implies adding a preprocessor conditional for all memory access
  * functions to avoid penalizing 32 and 64-bit accesses.
  */
 typedef enum XMemOp {
@@ -275,7 +408,7 @@ static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
     return gen_load(ctx, a, MO_TEUL, XMO_NOP);
 }
 
-static bool trans_ldu(DisasContext *ctx, arg_ldu* a)
+static bool trans_ldu(DisasContext *ctx, arg_ldu *a)
 {
     REQUIRE_128BIT(ctx);
     return gen_load(ctx, a, MO_TEQ, XMO_TEUQ);
@@ -372,8 +505,98 @@ static bool trans_sq(DisasContext *ctx, arg_sq *a)
     return gen_store(ctx, a, MO_TEQ, XMO_TET);
 }
 
+static bool trans_addd(DisasContext *ctx, arg_addd *a)
+{
+    REQUIRE_128BIT(ctx);
+#if defined(TARGET_RISCV128)
+    TCGv src1 = tcg_temp_new(),
+         src2 = tcg_temp_new();
+
+    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(src2, a->rs2);
+
+    tcg_gen_add_tl(src1, src1, src2);
+    tcg_gen_ext_i64_i128(src1, src2, src1);
+
+    gen_set_gpr(a->rd, src1);
+    gen_set_gprh(a->rd, src2);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(src2);
+#endif
+    return true;
+}
+
+static bool trans_addid(DisasContext *ctx, arg_addid *a)
+{
+    REQUIRE_128BIT(ctx);
+#if defined(TARGET_RISCV128)
+    TCGv src1 = tcg_temp_new(),
+         resh    = tcg_temp_new();
+
+    gen_get_gpr(src1, a->rs1);
+
+    tcg_gen_addi_tl(src1, src1, a->imm);
+    tcg_gen_ext_i64_i128(src1, resh, src1);
+
+    gen_set_gpr(a->rd, src1);
+    gen_set_gprh(a->rd, resh);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(resh);
+#endif
+    return true;
+}
+
+static bool trans_subd(DisasContext *ctx, arg_subd *a)
+{
+    REQUIRE_128BIT(ctx);
+#if defined(TARGET_RISCV128)
+    TCGv src1 = tcg_temp_new(),
+         src2 = tcg_temp_new();
+
+    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(src2, a->rs2);
+
+    tcg_gen_sub_tl(src1, src1, src2);
+    tcg_gen_ext_i64_i128(src1, src2, src1);
+
+    gen_set_gpr(a->rd, src1);
+    gen_set_gprh(a->rd, src2);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(src2);
+#endif
+    return true;
+}
+
 static bool trans_addi(DisasContext *ctx, arg_addi *a)
 {
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        TCGv rs1vl = tcg_temp_new(),
+             rs1vh = tcg_temp_new(),
+             imml  = tcg_const_tl(a->imm),
+             immh  = tcg_const_tl((a->imm & 0b100000000000)
+                                   ? 0xffffffffffffffff
+                                   : 0);
+
+        gen_get_gpr(rs1vl, a->rs1);
+        gen_get_gprh(rs1vh, a->rs1);
+
+        tcg_gen_add2_tl(rs1vl, rs1vh, rs1vl, rs1vh, imml, immh);
+
+        gen_set_gpr(a->rd, rs1vl);
+        gen_set_gprh(a->rd, rs1vh);
+
+        tcg_temp_free(rs1vl);
+        tcg_temp_free(rs1vh);
+        tcg_temp_free(imml);
+        tcg_temp_free(immh);
+
+        return true;
+    }
+#endif
     return gen_arith_imm_fn(ctx, a, &tcg_gen_addi_tl);
 }
 
@@ -390,11 +613,69 @@ static void gen_sltu(TCGv ret, TCGv s1, TCGv s2)
 
 static bool trans_slti(DisasContext *ctx, arg_slti *a)
 {
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        TCGv r1h  = tcg_temp_new(),
+             r1l  = tcg_temp_new(),
+             immh = tcg_const_tl((a->imm & 0b100000000000)
+                                  ? 0xffffffffffffffff
+                                  : 0),
+             imml = tcg_const_tl(a->imm),
+             resh = tcg_temp_new(),
+             resl = tcg_temp_new();
+
+        gen_get_gpr(r1l, a->rs1);
+        gen_get_gprh(r1h, a->rs1);
+
+        gen_setcond_128(resl, resh, r1l, r1h, imml, immh, TCG_COND_LT);
+
+        gen_set_gpr(a->rd, resl);
+        gen_set_gprh(a->rd, resh);
+
+        tcg_temp_free(r1h);
+        tcg_temp_free(r1l);
+        tcg_temp_free(immh);
+        tcg_temp_free(imml);
+        tcg_temp_free(resh);
+        tcg_temp_free(resl);
+
+        return true;
+    }
+#endif
     return gen_arith_imm_tl(ctx, a, &gen_slt);
 }
 
 static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 {
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        TCGv resh = tcg_temp_new(),
+             resl = tcg_temp_new(),
+             r1h = tcg_temp_new(),
+             r1l = tcg_temp_new(),
+             immh = tcg_const_tl((a->imm & 0b100000000000)
+                                  ? 0xffffffffffffffff
+                                  : 0),
+             imml = tcg_const_tl(a->imm);
+
+        gen_get_gprh(r1h, a->rs1);
+        gen_get_gpr(r1l, a->rs1);
+
+        gen_setcond_128(resl, resh, r1l, r1h, imml, immh, TCG_COND_LTU);
+
+        gen_set_gpr(a->rd, resl);
+        gen_set_gprh(a->rd, resh);
+
+        tcg_temp_free(resl);
+        tcg_temp_free(resh);
+        tcg_temp_free(r1h);
+        tcg_temp_free(r1l);
+        tcg_temp_free(immh);
+        tcg_temp_free(imml);
+
+        return true;
+    }
+#endif
     return gen_arith_imm_tl(ctx, a, &gen_sltu);
 }
 
@@ -412,41 +693,406 @@ static bool trans_andi(DisasContext *ctx, arg_andi *a)
 }
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        if (a->shamt >= 128) {
+            return false;
+        }
+
+        if (a->rd != 0 && a->shamt != 0) {
+            TCGv rs = tcg_temp_new(),
+                 rsh = tcg_temp_new();
+            TCGv res = tcg_temp_new(),
+                 resh = tcg_temp_new(),
+                 tmp = tcg_temp_new();
+            gen_get_gpr(rs, a->rs1);
+            gen_get_gprh(rsh, a->rs1);
+
+            /*
+             * Computation of double-length left shift,
+             * adapted for immediates from section 2.17 of Hacker's Delight
+             */
+            if (a->shamt >= 64) {
+                tcg_gen_movi_tl(resh, 0);
+            } else {
+                tcg_gen_shli_tl(resh, rsh, a->shamt);
+            }
+
+            if (64 - a->shamt < 0) {
+                tcg_gen_movi_tl(tmp, 0);
+            } else {
+                tcg_gen_shri_tl(tmp, rs, 64 - a->shamt);
+            }
+            tcg_gen_or_tl(resh, resh, tmp);
+            if (a->shamt - 64 < 0) {
+                tcg_gen_movi_tl(tmp, 0);
+            } else {
+                tcg_gen_shli_tl(tmp, rs, a->shamt - 64);
+            }
+            tcg_gen_or_tl(resh, resh, tmp);
+
+            if (a->shamt >= 64) {
+                tcg_gen_movi_tl(res, 0);
+            } else {
+                tcg_gen_shli_tl(res, rs, a->shamt);
+            }
+
+            gen_set_gpr(a->rd, res);
+            gen_set_gprh(a->rd, resh);
+
+            tcg_temp_free(rs);
+            tcg_temp_free(rsh);
+            tcg_temp_free(res);
+            tcg_temp_free(resh);
+            tcg_temp_free(tmp);
+        } /* NOP otherwise */
+        return true;
+    }
+#endif
     return gen_shifti(ctx, a, tcg_gen_shl_tl);
 }
 
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        if (a->shamt >= 128) {
+            return false;
+        }
+
+        if (a->rd != 0 && a->shamt != 0) {
+            TCGv rs = tcg_temp_new(),
+                 rsh = tcg_temp_new(),
+                 res = tcg_temp_new(),
+                 resh = tcg_temp_new(),
+                 tmp = tcg_temp_new();
+            gen_get_gpr(rs, a->rs1);
+            gen_get_gprh(rsh, a->rs1);
+
+            /*
+             * Computation of double-length right logical shift,
+             * adapted for immediates from section 2.17 of Hacker's Delight
+             */
+            if (a->shamt >= 64) {
+                tcg_gen_movi_tl(res, 0);
+            } else {
+                tcg_gen_shri_tl(res, rs, a->shamt);
+            }
+            if (64 - a->shamt < 0) {
+                tcg_gen_movi_tl(tmp, 0);
+            } else {
+                tcg_gen_shli_tl(tmp, rsh, 64 - a->shamt);
+            }
+            tcg_gen_or_tl(res, res, tmp);
+            if (a->shamt - 64 < 0) {
+                tcg_gen_movi_tl(tmp, 0);
+            } else {
+                tcg_gen_shri_tl(tmp, rsh, a->shamt - 64);
+            }
+            tcg_gen_or_tl(res, res, tmp);
+
+            if (a->shamt >= 64) {
+                tcg_gen_movi_tl(resh, 0);
+            } else {
+                tcg_gen_shri_tl(resh, rsh, a->shamt);
+            }
+
+            gen_set_gpr(a->rd, res);
+            gen_set_gprh(a->rd, resh);
+
+            tcg_temp_free(rs);
+            tcg_temp_free(rsh);
+            tcg_temp_free(res);
+            tcg_temp_free(resh);
+            tcg_temp_free(tmp);
+        } /* NOP otherwise */
+        return true;
+    }
+#endif
     return gen_shifti(ctx, a, tcg_gen_shr_tl);
 }
 
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        if (a->shamt >= 128) {
+            return false;
+        }
+
+        if (a->rd != 0 && a->shamt != 0) {
+            TCGv rs = tcg_temp_new(),
+                 rsh = tcg_temp_new(),
+                 res = tcg_temp_new(),
+                 resh = tcg_temp_new(),
+                 tmp = tcg_temp_new();
+            gen_get_gpr(rs, a->rs1);
+            gen_get_gprh(rsh, a->rs1);
+
+            /*
+             * Computation of double-length right arith shift,
+             * adapted for immediates from section 2.17 of Hacker's Delight
+             */
+            if (a->shamt < 64) {
+                tcg_gen_shri_tl(res, rs, a->shamt);
+                tcg_gen_shli_tl(tmp, rsh, 64 - a->shamt);
+                tcg_gen_or_tl(res, res, tmp);
+            } else {
+                tcg_gen_sari_tl(res, rsh, a->shamt - 64);
+            }
+
+            /* Arithmetic shift of upper bits by shamt */
+            if (a->shamt == 127) {
+                tcg_gen_sari_tl(resh, rsh, 63);
+                tcg_gen_sari_tl(resh, resh, 63);
+                tcg_gen_sari_tl(resh, resh, 1);
+            } else if (a->shamt >= 64) {
+                tcg_gen_sari_tl(resh, rsh, 63);
+                tcg_gen_sari_tl(resh, resh, a->shamt - 63);
+            } else {
+                tcg_gen_sari_tl(resh, rsh, a->shamt);
+            }
+
+            gen_set_gpr(a->rd, res);
+            gen_set_gprh(a->rd, resh);
+
+            tcg_temp_free(rs);
+            tcg_temp_free(rsh);
+            tcg_temp_free(res);
+            tcg_temp_free(resh);
+            tcg_temp_free(tmp);
+        } /* NOP otherwise */
+        return true;
+    }
+#endif
     return gen_shifti(ctx, a, tcg_gen_sar_tl);
 }
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
 {
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        TCGv rs1vl = tcg_temp_new(),
+             rs1vh = tcg_temp_new(),
+             rs2vl = tcg_temp_new(),
+             rs2vh = tcg_temp_new(),
+             resl  = tcg_temp_new(),
+             resh  = tcg_temp_new();
+
+        gen_get_gpr(rs1vl, a->rs1);
+        gen_get_gprh(rs1vh, a->rs1);
+        gen_get_gpr(rs2vl, a->rs2);
+        gen_get_gprh(rs2vh, a->rs2);
+
+        tcg_gen_add2_tl(resl, resh, rs1vl, rs1vh, rs2vl, rs2vh);
+
+        gen_set_gpr(a->rd, resl);
+        gen_set_gprh(a->rd, resh);
+
+        tcg_temp_free(rs1vl);
+        tcg_temp_free(rs1vh);
+        tcg_temp_free(rs2vl);
+        tcg_temp_free(rs2vh);
+        tcg_temp_free(resl);
+        tcg_temp_free(resh);
+
+        return true;
+    }
+#endif
     return gen_arith(ctx, a, &tcg_gen_add_tl);
 }
 
 static bool trans_sub(DisasContext *ctx, arg_sub *a)
 {
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        TCGv rs1vl = tcg_temp_new(),
+             rs1vh = tcg_temp_new(),
+             rs2vl = tcg_temp_new(),
+             rs2vh = tcg_temp_new(),
+             resl  = tcg_temp_new(),
+             resh  = tcg_temp_new();
+
+        gen_get_gpr(rs1vl, a->rs1);
+        gen_get_gprh(rs1vh, a->rs1);
+        gen_get_gpr(rs2vl, a->rs2);
+        gen_get_gprh(rs2vh, a->rs2);
+
+        tcg_gen_sub2_tl(resl, resh, rs1vl, rs1vh, rs2vl, rs2vh);
+
+        gen_set_gpr(a->rd, resl);
+        gen_set_gprh(a->rd, resh);
+
+        tcg_temp_free(rs1vl);
+        tcg_temp_free(rs1vh);
+        tcg_temp_free(rs2vl);
+        tcg_temp_free(rs2vh);
+        tcg_temp_free(resl);
+        tcg_temp_free(resh);
+
+        return true;
+    }
+#endif
     return gen_arith(ctx, a, &tcg_gen_sub_tl);
 }
 
+#if defined(TARGET_RISCV128)
+enum M128_DIR { M128_LEFT, M128_RIGHT, M128_RIGHT_ARITH };
+static void gen_shift_mod128(TCGv ret, TCGv arg1, TCGv arg2, enum M128_DIR dir)
+{
+    TCGv tmp1 = tcg_temp_new(),
+         tmp2 = tcg_temp_new(),
+         cnst_zero = tcg_const_tl(0),
+         sgn = tcg_temp_new();
+
+    tcg_gen_setcondi_tl(TCG_COND_GE, tmp1, arg2, 64);
+    tcg_gen_setcondi_tl(TCG_COND_LT, tmp2, arg2, 0);
+    tcg_gen_or_tl(tmp1, tmp1, tmp2);
+
+    tcg_gen_andi_tl(tmp2, arg2, 0x3f);
+    switch (dir) {
+    case M128_LEFT:
+        tcg_gen_shl_tl(tmp2, arg1, tmp2);
+        break;
+    case M128_RIGHT:
+        tcg_gen_shr_tl(tmp2, arg1, tmp2);
+        break;
+    case M128_RIGHT_ARITH:
+        tcg_gen_sar_tl(tmp2, arg1, tmp2);
+        break;
+    }
+
+    if (dir == M128_RIGHT_ARITH) {
+        tcg_gen_sari_tl(sgn, arg1, 63);
+        tcg_gen_movcond_tl(TCG_COND_NE, ret, tmp1, cnst_zero, sgn, tmp2);
+    } else {
+        tcg_gen_movcond_tl(TCG_COND_NE, ret, tmp1, cnst_zero, cnst_zero, tmp2);
+    }
+
+    tcg_temp_free(tmp1);
+    tcg_temp_free(tmp2);
+    tcg_temp_free(cnst_zero);
+    tcg_temp_free(sgn);
+    return;
+}
+#endif
+
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
 {
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        TCGv src1l = tcg_temp_new(),
+             src1h = tcg_temp_new(),
+             src2l = tcg_temp_new(),
+             tmp   = tcg_temp_new(),
+             resl  = tcg_temp_new(),
+             resh  = tcg_temp_new();
+
+        gen_get_gpr(src1l, a->rs1);
+        gen_get_gprh(src1h, a->rs1);
+        gen_get_gpr(src2l, a->rs2);
+
+        tcg_gen_andi_tl(src2l, src2l, 0x7f); /* Use 7 lower bits for shift */
+
+        /*
+         * From Hacker's Delight 2.17:
+         *  y1 = x1 << n | x0 u>> (64 - n) | x0 << (n - 64)
+         */
+        gen_shift_mod128(resh, src1h, src2l, M128_LEFT);
+
+        tcg_gen_movi_tl(tmp, 64);
+        tcg_gen_sub_tl(tmp, tmp, src2l);
+        gen_shift_mod128(tmp, src1l, tmp, M128_RIGHT);
+        tcg_gen_or_tl(resh, resh, tmp);
+
+        tcg_gen_subi_tl(tmp, src2l, 64);
+        gen_shift_mod128(tmp, src1l, tmp, M128_LEFT);
+        tcg_gen_or_tl(resh, resh, tmp);
+
+        /* From Hacker's Delight 2.17: y0 = x0 << n */
+        gen_shift_mod128(resl, src1l, src2l, M128_LEFT);
+
+        gen_set_gpr(a->rd, resl);
+        gen_set_gprh(a->rd, resh);
+
+        tcg_temp_free(src1l);
+        tcg_temp_free(src1h);
+        tcg_temp_free(src2l);
+        tcg_temp_free(tmp);
+        tcg_temp_free(resl);
+        tcg_temp_free(resh);
+
+        return true;
+    }
+#endif
     return gen_shift(ctx, a, &tcg_gen_shl_tl);
 }
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
 {
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        TCGv r1h  = tcg_temp_new(),
+             r1l  = tcg_temp_new(),
+             r2h  = tcg_temp_new(),
+             r2l  = tcg_temp_new(),
+             tmph = tcg_temp_new(),
+             tmpl = tcg_temp_new();
+
+        gen_get_gprh(r1h, a->rs1);
+        gen_get_gpr(r1l, a->rs1);
+        gen_get_gprh(r2h, a->rs2);
+        gen_get_gpr(r2l, a->rs2);
+
+        gen_setcond_128(tmpl, tmph, r1l, r1h, r2l, r2h, TCG_COND_LT);
+
+        gen_set_gpr(a->rd, tmpl);
+        gen_set_gprh(a->rd, tmph);
+
+        tcg_temp_free(r1h);
+        tcg_temp_free(r1l);
+        tcg_temp_free(r2h);
+        tcg_temp_free(r2l);
+        tcg_temp_free(tmph);
+        tcg_temp_free(tmpl);
+
+        return true;
+    }
+#endif
     return gen_arith(ctx, a, &gen_slt);
 }
 
 static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 {
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        TCGv resh = tcg_temp_new(),
+             resl = tcg_temp_new(),
+             r1h = tcg_temp_new(),
+             r1l = tcg_temp_new(),
+             r2h = tcg_temp_new(),
+             r2l = tcg_temp_new();
+
+        gen_get_gprh(r1h, a->rs1);
+        gen_get_gpr(r1l, a->rs1);
+        gen_get_gprh(r2h, a->rs2);
+        gen_get_gpr(r2l, a->rs2);
+
+        gen_setcond_128(resl, resh, r1l, r1h, r2l, r2h, TCG_COND_LTU);
+
+        gen_set_gpr(a->rd, resl);
+        gen_set_gprh(a->rd, resh);
+
+        tcg_temp_free(resl);
+        tcg_temp_free(resh);
+        tcg_temp_free(r1h);
+        tcg_temp_free(r1l);
+        tcg_temp_free(r2h);
+        tcg_temp_free(r2l);
+
+        return true;
+    }
+#endif
     return gen_arith(ctx, a, &gen_sltu);
 }
 
@@ -457,11 +1103,106 @@ static bool trans_xor(DisasContext *ctx, arg_xor *a)
 
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
 {
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        TCGv src1l = tcg_temp_new(),
+             src1h = tcg_temp_new(),
+             src2l = tcg_temp_new(),
+             tmp   = tcg_temp_new(),
+             resl  = tcg_temp_new(),
+             resh  = tcg_temp_new();
+
+        gen_get_gpr(src1l, a->rs1);
+        gen_get_gprh(src1h, a->rs1);
+        gen_get_gpr(src2l, a->rs2);
+
+        tcg_gen_andi_tl(src2l, src2l, 0x7f); /* Use 7 lower bits for shift */
+
+        /*
+         * From Hacker's Delight 2.17:
+         * y0 = x0 u>> n | x1 << (64 - n) | x1 u>> (n - 64)
+         */
+        gen_shift_mod128(resl, src1l, src2l, M128_RIGHT);
+
+        tcg_gen_movi_tl(tmp, 64);
+        tcg_gen_sub_tl(tmp, tmp, src2l);
+        gen_shift_mod128(tmp, src1h, tmp, M128_LEFT);
+        tcg_gen_or_tl(resl, resl, tmp);
+
+        tcg_gen_subi_tl(tmp, src2l, 64);
+        gen_shift_mod128(tmp, src1h, tmp, M128_RIGHT);
+        tcg_gen_or_tl(resl, resl, tmp);
+
+        /* From Hacker's Delight 2.17 : y1 = x1 u>> n */
+        gen_shift_mod128(resh, src1h, src2l, M128_RIGHT);
+
+        gen_set_gpr(a->rd, resl);
+        gen_set_gprh(a->rd, resh);
+
+        tcg_temp_free(src1l);
+        tcg_temp_free(src1h);
+        tcg_temp_free(src2l);
+        tcg_temp_free(tmp);
+        tcg_temp_free(resl);
+        tcg_temp_free(resh);
+
+        return true;
+    }
+#endif
     return gen_shift(ctx, a, &tcg_gen_shr_tl);
 }
 
 static bool trans_sra(DisasContext *ctx, arg_sra *a)
 {
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        TCGv src1l   = tcg_temp_new(),
+             src1h   = tcg_temp_new(),
+             src2l   = tcg_temp_new(),
+             tmp1    = tcg_temp_new(),
+             tmp2    = tcg_temp_new(),
+             const64 = tcg_const_tl(64),
+             resl    = tcg_temp_new(),
+             resh    = tcg_temp_new();
+
+        gen_get_gpr(src1l, a->rs1);
+        gen_get_gprh(src1h, a->rs1);
+        gen_get_gpr(src2l, a->rs2);
+
+        tcg_gen_andi_tl(src2l, src2l, 0x7f); /* Use 7 lower bits for shift */
+
+        /* Compute y0 value if n < 64: x0 u>> n | x1 << (64 - n) */
+        gen_shift_mod128(tmp1, src1l, src2l, M128_RIGHT);
+        tcg_gen_movi_tl(tmp2, 64);
+        tcg_gen_sub_tl(tmp2, tmp2, src2l);
+        gen_shift_mod128(tmp2, src1h, tmp2, M128_LEFT);
+        tcg_gen_or_tl(tmp1, tmp1, tmp2);
+
+        /* Compute y0 value if n >= 64: x1 s>> (n - 64) */
+        tcg_gen_subi_tl(tmp2, src2l, 64);
+        gen_shift_mod128(tmp2, src1h, tmp2, M128_RIGHT_ARITH);
+
+        /* Conditionally move one value or the other */
+        tcg_gen_movcond_tl(TCG_COND_LT, resl, src2l, const64, tmp1, tmp2);
+
+        /* y1 = x1 s>> n */
+        gen_shift_mod128(resh, src1h, src2l, M128_RIGHT_ARITH);
+
+        gen_set_gpr(a->rd, resl);
+        gen_set_gprh(a->rd, resh);
+
+        tcg_temp_free(src1l);
+        tcg_temp_free(src1h);
+        tcg_temp_free(src2l);
+        tcg_temp_free(tmp1);
+        tcg_temp_free(tmp2);
+        tcg_temp_free(const64);
+        tcg_temp_free(resl);
+        tcg_temp_free(resh);
+
+        return true;
+    }
+#endif
     return gen_shift(ctx, a, &tcg_gen_sar_tl);
 }
 
@@ -477,24 +1218,95 @@ static bool trans_and(DisasContext *ctx, arg_and *a)
 
 static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 {
-    REQUIRE_64BIT(ctx);
-    return gen_arith_imm_tl(ctx, a, &gen_addw);
+    REQUIRE_64_OR_128BIT(ctx);
+    const bool rv = gen_arith_imm_tl(ctx, a, &gen_addw);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx) && a->rd != 0) {
+        tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd], cpu_gpr[a->rd]);
+    }
+#endif
+    return rv;
 }
 
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
-    REQUIRE_64BIT(ctx);
-    return gen_shiftiw(ctx, a, tcg_gen_shl_tl);
+    REQUIRE_64_OR_128BIT(ctx);
+    const bool rv = gen_shiftiw(ctx, a, tcg_gen_shl_tl);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx) && a->rd != 0) {
+        tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd], cpu_gpr[a->rd]);
+    }
+#endif
+    return rv;
+}
+
+static bool trans_sllid(DisasContext *ctx, arg_slliw *a)
+{
+    REQUIRE_128BIT(ctx);
+#if defined(TARGET_RISCV128)
+    TCGv source1 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+
+    tcg_gen_shli_tl(source1, source1, a->shamt);
+    if (a->rd != 0) {
+        tcg_gen_ext_i64_i128(source1, cpu_gprh[a->rd], source1);
+    }
+    gen_set_gpr(a->rd, source1);
+
+    tcg_temp_free(source1);
+#endif
+    return true;
+}
+
+static bool trans_srlid(DisasContext *ctx, arg_srlid *a)
+{
+    REQUIRE_128BIT(ctx);
+#if defined(TARGET_RISCV128)
+    TCGv source1 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+
+    tcg_gen_shri_tl(source1, source1, a->shamt);
+    if (a->rd != 0) {
+        tcg_gen_ext_i64_i128(source1, cpu_gprh[a->rd], source1);
+    }
+    gen_set_gpr(a->rd, source1);
+
+    tcg_temp_free(source1);
+#endif
+    return true;
+}
+
+static bool trans_sraid(DisasContext *ctx, arg_sraid *a)
+{
+    REQUIRE_128BIT(ctx);
+#if defined(TARGET_RISCV128)
+    TCGv source1 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+
+    tcg_gen_sari_tl(source1, source1, a->shamt);
+    if (a->rd != 0) {
+        tcg_gen_ext_i64_i128(source1, cpu_gprh[a->rd], source1);
+    }
+    gen_set_gpr(a->rd, source1);
+
+    tcg_temp_free(source1);
+#endif
+    return true;
 }
 
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     TCGv t = tcg_temp_new();
     gen_get_gpr(t, a->rs1);
     tcg_gen_extract_tl(t, t, a->shamt, 32 - a->shamt);
     /* sign-extend for W instructions */
     tcg_gen_ext32s_tl(t, t);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx) && a->rd != 0) {
+        tcg_gen_ext_i64_i128(t, cpu_gprh[a->rd], t);
+    }
+#endif
     gen_set_gpr(a->rd, t);
     tcg_temp_free(t);
     return true;
@@ -502,10 +1314,15 @@ static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     TCGv t = tcg_temp_new();
     gen_get_gpr(t, a->rs1);
     tcg_gen_sextract_tl(t, t, a->shamt, 32 - a->shamt);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx) && a->rd != 0) {
+        tcg_gen_ext_i64_i128(t, cpu_gprh[a->rd], t);
+    }
+#endif
     gen_set_gpr(a->rd, t);
     tcg_temp_free(t);
     return true;
@@ -513,19 +1330,31 @@ static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
 {
-    REQUIRE_64BIT(ctx);
-    return gen_arith(ctx, a, &gen_addw);
+    REQUIRE_64_OR_128BIT(ctx);
+    const bool ok = gen_arith(ctx, a, &gen_addw);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx) && a->rd != 0) {
+        tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd], cpu_gpr[a->rd]);
+    }
+#endif
+    return ok;
 }
 
 static bool trans_subw(DisasContext *ctx, arg_subw *a)
 {
-    REQUIRE_64BIT(ctx);
-    return gen_arith(ctx, a, &gen_subw);
+    REQUIRE_64_OR_128BIT(ctx);
+    const bool rv = gen_arith(ctx, a, &gen_subw);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx) && a->rd != 0) {
+        tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd], cpu_gpr[a->rd]);
+    }
+#endif
+    return rv;
 }
 
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
 
@@ -536,6 +1365,14 @@ static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
     tcg_gen_shl_tl(source1, source1, source2);
 
     tcg_gen_ext32s_tl(source1, source1);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx) && a->rd != 0) {
+        TCGv resh = tcg_temp_new();
+        tcg_gen_ext_i64_i128(source1, resh, source1);
+        gen_set_gprh(a->rd, resh);
+        tcg_temp_free(resh);
+    }
+#endif
     gen_set_gpr(a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
@@ -544,7 +1381,7 @@ static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
 
 static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
 
@@ -557,6 +1394,14 @@ static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
     tcg_gen_shr_tl(source1, source1, source2);
 
     tcg_gen_ext32s_tl(source1, source1);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx) && a->rd != 0) {
+        TCGv resh = tcg_temp_new();
+        tcg_gen_ext_i64_i128(source1, resh, source1);
+        gen_set_gprh(a->rd, resh);
+        tcg_temp_free(resh);
+    }
+#endif
     gen_set_gpr(a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
@@ -565,7 +1410,7 @@ static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
 
 static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
 
@@ -580,6 +1425,15 @@ static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
     tcg_gen_andi_tl(source2, source2, 0x1F);
     tcg_gen_sar_tl(source1, source1, source2);
 
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx) && a->rd != 0) {
+        TCGv resh = tcg_temp_new();
+        tcg_gen_ext_i64_i128(source1, resh, source1);
+        gen_set_gprh(a->rd, resh);
+        tcg_temp_free(resh);
+    }
+#endif
+
     gen_set_gpr(a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
@@ -587,6 +1441,73 @@ static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
     return true;
 }
 
+/* Translation functions for 64-bit operations specific to RV128 */
+static bool trans_slld(DisasContext *ctx, arg_slld *a)
+{
+    REQUIRE_128BIT(ctx);
+#if defined(TARGET_RISCV128)
+    TCGv src1 = tcg_temp_new(),
+         src2 = tcg_temp_new();
+
+    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(src2, a->rs2);
+
+    tcg_gen_shl_tl(src1, src1, src2);
+    tcg_gen_ext_i64_i128(src1, src2, src1);
+
+    gen_set_gpr(a->rd, src1);
+    gen_set_gprh(a->rd, src2);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(src2);
+#endif
+    return true;
+}
+
+static bool trans_srld(DisasContext *ctx, arg_srld *a)
+{
+    REQUIRE_128BIT(ctx);
+#if defined(TARGET_RISCV128)
+    TCGv src1 = tcg_temp_new(),
+         src2 = tcg_temp_new();
+
+    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(src2, a->rs2);
+
+    tcg_gen_shr_tl(src1, src1, src2);
+    tcg_gen_ext_i64_i128(src1, src2, src1);
+
+    gen_set_gpr(a->rd, src1);
+    gen_set_gprh(a->rd, src2);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(src2);
+    return true;
+#endif
+}
+
+static bool trans_srad(DisasContext *ctx, arg_srad *a)
+{
+    REQUIRE_128BIT(ctx);
+#if defined(TARGET_RISCV128)
+    TCGv src1 = tcg_temp_new(),
+         src2 = tcg_temp_new();
+
+    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(src2, a->rs2);
+
+    tcg_gen_sar_tl(src1, src1, src2);
+    tcg_gen_ext_i64_i128(src1, src2, src1);
+
+    gen_set_gpr(a->rd, src1);
+    gen_set_gprh(a->rd, src2);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(src2);
+#endif
+    return true;
+}
+
 static bool trans_fence(DisasContext *ctx, arg_fence *a)
 {
     /* FENCE is a full memory barrier. */
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index be9c64f3e4..7d447bd225 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -509,6 +509,19 @@ static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a,
     (*func)(source1, source1, a->imm);
 
     gen_set_gpr(a->rd, source1);
+
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        uint64_t immh = (a->imm & 0b100000000000) ? 0xffffffffffffffff : 0;
+
+        gen_get_gprh(source1, a->rs1);
+
+        (*func)(source1, source1, immh);
+
+        gen_set_gprh(a->rd, source1);
+    }
+#endif
+
     tcg_temp_free(source1);
     return true;
 }
@@ -827,6 +840,18 @@ static bool gen_arith(DisasContext *ctx, arg_r *a,
     (*func)(source1, source1, source2);
 
     gen_set_gpr(a->rd, source1);
+
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        gen_get_gprh(source1, a->rs1);
+        gen_get_gprh(source2, a->rs2);
+
+        (*func)(source1, source1, source2);
+
+        gen_set_gprh(a->rd, source1);
+    }
+#endif
+
     tcg_temp_free(source1);
     tcg_temp_free(source2);
     return true;
-- 
2.33.0


