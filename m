Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKmvS-0008FX-J9
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 15:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKku0-0005Dt-AG; Mon, 30 Aug 2021 13:16:57 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:50226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKktw-0007DY-Iy; Mon, 30 Aug 2021 13:16:56 -0400
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 618A340FA5;
 Mon, 30 Aug 2021 19:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1630343809;
 bh=fh6013XchHh/XAGe+WiQ3pyYOqcYVcSSYktlUcLp/Co=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bVRJSebtvKZ3pDIujoXgxpYgcTOSt1yTW3qcTlRgmI+CUUehz24p3VWIBtOnJagij
 rs6yKRT2lvIqW6u+RlLGNDO7v+rgDr/ZuoyfJAHWfuLfqC+BzUyWlMPDhIZhHdzBvZ
 rvWZrdtRF6BANaPYa5+qSwma9A2UCOn2CWaL3GzzSGUkOvsfKC1G3hhS7tKf8ceoCf
 6DpXkpA4QZM6Lchx4wNDQB2mTe0gyDGvl+zoON47W34RPwPDQpQNG99v6RiF978Wvz
 uWR65/0TlrtGDoDJH1Q/iW5M339+TYE/vAA1nlWJ5rh41XhlVcyizwVBiSNDinQ6Vc
 Gu03u9w0svecw==
Received: from smtps.univ-grenoble-alpes.fr (smtps1.u-ga.fr [152.77.1.30])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id 5C2A280137;
 Mon, 30 Aug 2021 19:16:49 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id F0A15187E13;
 Mon, 30 Aug 2021 19:16:48 +0200 (CEST)
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
Subject: [PATCH 5/8] target/riscv: 128-bit multiply and divide
Date: Mon, 30 Aug 2021 19:16:35 +0200
Message-Id: <20210830171638.126325-5-frederic.petrot@univ-grenoble-alpes.fr>
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
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 30 Aug 2021 15:26:31 -0400
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
X-List-Received-Date: Mon, 30 Aug 2021 17:16:59 -0000

Adding the support for the 128-bit (m) extension.
Division and remainder are helpers using a simple implementation of Knuth
algorithm D.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/helper.h                   |   8 +
 target/riscv/insn32.decode              |   7 +
 target/riscv/insn_trans/trans_rvm.c.inc | 456 +++++++++++++++++++++++-
 target/riscv/m128_helper.c              | 301 ++++++++++++++++
 target/riscv/meson.build                |   1 +
 5 files changed, 759 insertions(+), 14 deletions(-)
 create mode 100644 target/riscv/m128_helper.c

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 415e37bc37..f3aed608dc 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1149,3 +1149,11 @@ DEF_HELPER_6(vcompress_vm_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+#ifdef TARGET_RISCV128
+/* 128-bit integer multiplication and division */
+DEF_HELPER_6(idivu128, void, env, i64, i64, i64, i64, i64)
+DEF_HELPER_6(idivs128, void, env, i64, i64, i64, i64, i64)
+DEF_HELPER_6(iremu128, void, env, i64, i64, i64, i64, i64)
+DEF_HELPER_6(irems128, void, env, i64, i64, i64, i64, i64)
+#endif
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2fe7e1dd36..9085d15a7a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -197,6 +197,13 @@ divuw    0000001 .....  ..... 101 ..... 0111011 @r
 remw     0000001 .....  ..... 110 ..... 0111011 @r
 remuw    0000001 .....  ..... 111 ..... 0111011 @r
 
+# *** RV128M Standard Extension (in addition to RV64M) ***
+muld     0000001 .....  ..... 000 ..... 1111011 @r
+divd     0000001 .....  ..... 100 ..... 1111011 @r
+divud    0000001 .....  ..... 101 ..... 1111011 @r
+remd     0000001 .....  ..... 110 ..... 1111011 @r
+remud    0000001 .....  ..... 111 ..... 1111011 @r
+
 # *** RV32A Standard Extension ***
 lr_w       00010 . . 00000 ..... 010 ..... 0101111 @atom_ld
 sc_w       00011 . . ..... ..... 010 ..... 0101111 @atom_st
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 10ecc456fc..ed3bf43ea8 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -18,16 +18,157 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#if defined(TARGET_RISCV128)
+static void gen_mulu2_128(TCGv rll, TCGv rlh, TCGv rhl, TCGv rhh,
+                           TCGv al, TCGv ah, TCGv bl, TCGv bh)
+{
+    TCGv tmpl = tcg_temp_new(),
+         tmph = tcg_temp_new(),
+         cnst_zero = tcg_const_tl(0);
+
+    tcg_gen_mulu2_tl(rll, rlh, al, bl);
+
+    tcg_gen_mulu2_tl(tmpl, tmph, al, bh);
+    tcg_gen_add2_tl(rlh, rhl, rlh, cnst_zero, tmpl, tmph);
+    tcg_gen_mulu2_tl(tmpl, tmph, ah, bl);
+    tcg_gen_add2_tl(rlh, tmph, rlh, rhl, tmpl, tmph);
+    /* Overflow detection into rhh */
+    tcg_gen_setcond_tl(TCG_COND_LTU, rhh, tmph, rhl);
+
+    tcg_gen_mov_tl(rhl, tmph);
+
+    tcg_gen_mulu2_tl(tmpl, tmph, ah, bh);
+    tcg_gen_add2_tl(rhl, rhh, rhl, rhh, tmpl, tmph);
+
+    tcg_temp_free(tmpl);
+    tcg_temp_free(tmph);
+    tcg_temp_free(cnst_zero);
+}
+#endif
 
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
     REQUIRE_EXT(ctx, RVM);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        TCGv rs1h = tcg_temp_new(),
+             rs1l = tcg_temp_new(),
+             rs2h = tcg_temp_new(),
+             rs2l = tcg_temp_new(),
+             rll = tcg_temp_new(),
+             rlh = tcg_temp_new(),
+             rhl = tcg_temp_new(),
+             rhh = tcg_temp_new();
+
+        gen_get_gpr(rs1l, a->rs1);
+        gen_get_gprh(rs1h, a->rs1);
+        gen_get_gpr(rs2l, a->rs2);
+        gen_get_gprh(rs2h, a->rs2);
+
+        gen_mulu2_128(rll, rlh, rhl, rhh, rs1l, rs1h, rs2l, rs2h);
+
+        gen_set_gpr(a->rd, rll);
+        gen_set_gprh(a->rd, rlh);
+
+        tcg_temp_free(rs1h);
+        tcg_temp_free(rs1l);
+        tcg_temp_free(rs2l);
+        tcg_temp_free(rs2h);
+        tcg_temp_free(rll);
+        tcg_temp_free(rlh);
+        tcg_temp_free(rhl);
+        tcg_temp_free(rhh);
+
+        return true;
+    }
+#endif
     return gen_arith(ctx, a, &tcg_gen_mul_tl);
 }
 
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        TCGv rs1h = tcg_temp_new(),
+             rs1l = tcg_temp_new(),
+             rs2h = tcg_temp_new(),
+             rs2l = tcg_temp_new(),
+             rll = tcg_temp_new(),
+             rlh = tcg_temp_new(),
+             rhl = tcg_temp_new(),
+             rhh = tcg_temp_new(),
+             rlln = tcg_temp_new(),
+             rlhn = tcg_temp_new(),
+             rhln = tcg_temp_new(),
+             rhhn = tcg_temp_new(),
+             sgnres = tcg_temp_new(),
+             tmp = tcg_temp_new(),
+             cnst_one = tcg_const_tl(1),
+             cnst_zero = tcg_const_tl(0);
+
+        gen_get_gpr(rs1l, a->rs1);
+        gen_get_gprh(rs1h, a->rs1);
+        gen_get_gpr(rs2l, a->rs2);
+        gen_get_gprh(rs2h, a->rs2);
+
+        /* Extract sign of result (=> sgn(a) xor sgn(b)) */
+        tcg_gen_setcondi_tl(TCG_COND_LT, sgnres, rs1h, 0);
+        tcg_gen_setcondi_tl(TCG_COND_LT, tmp, rs2h, 0);
+        tcg_gen_xor_tl(sgnres, sgnres, tmp);
+
+        /* Take absolute value of operands */
+        tcg_gen_sari_tl(rhl, rs1h, 63);
+        tcg_gen_add2_tl(rs1l, rs1h, rs1l, rs1h, rhl, rhl);
+        tcg_gen_xor_tl(rs1l, rs1l, rhl);
+        tcg_gen_xor_tl(rs1h, rs1h, rhl);
+
+        tcg_gen_sari_tl(rhl, rs2h, 63);
+        tcg_gen_add2_tl(rs2l, rs2h, rs2l, rs2h, rhl, rhl);
+        tcg_gen_xor_tl(rs2l, rs2l, rhl);
+        tcg_gen_xor_tl(rs2h, rs2h, rhl);
+
+        /* Unsigned multiplication */
+        gen_mulu2_128(rll, rlh, rhl, rhh, rs1l, rs1h, rs2l, rs2h);
+
+        /* Negation of result (two's complement : ~res + 1) */
+        tcg_gen_not_tl(rlln, rll);
+        tcg_gen_not_tl(rlhn, rlh);
+        tcg_gen_not_tl(rhln, rhl);
+        tcg_gen_not_tl(rhhn, rhh);
+
+        tcg_gen_add2_tl(rlln, tmp, rlln, cnst_zero, cnst_one, cnst_zero);
+        tcg_gen_add2_tl(rlhn, tmp, rlhn, cnst_zero, tmp, cnst_zero);
+        tcg_gen_add2_tl(rhln, tmp, rhln, cnst_zero, tmp, cnst_zero);
+        tcg_gen_add2_tl(rhhn, tmp, rhhn, cnst_zero, tmp, cnst_zero);
+
+        /* Move conditionally result or -result depending on result sign */
+        tcg_gen_movcond_tl(TCG_COND_NE, rhl, sgnres, cnst_zero, rhln, rhl);
+        tcg_gen_movcond_tl(TCG_COND_NE, rhh, sgnres, cnst_zero, rhhn, rhh);
+
+        gen_set_gpr(a->rd, rhl);
+        gen_set_gprh(a->rd, rhh);
+
+        tcg_temp_free(rs1h);
+        tcg_temp_free(rs1l);
+        tcg_temp_free(rs2l);
+        tcg_temp_free(rs2h);
+        tcg_temp_free(rll);
+        tcg_temp_free(rlh);
+        tcg_temp_free(rhl);
+        tcg_temp_free(rhh);
+        tcg_temp_free(rlln);
+        tcg_temp_free(rlhn);
+        tcg_temp_free(rhln);
+        tcg_temp_free(rhhn);
+        tcg_temp_free(sgnres);
+        tcg_temp_free(tmp);
+        tcg_temp_free(cnst_one);
+        tcg_temp_free(cnst_zero);
+
+        return true;
+    }
+#endif
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
     gen_get_gpr(source1, a->rs1);
@@ -44,12 +185,119 @@ static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        TCGv rs1h = tcg_temp_new(),
+             rs1l = tcg_temp_new(),
+             rs2h = tcg_temp_new(),
+             rs2l = tcg_temp_new(),
+             rll = tcg_temp_new(),
+             rlh = tcg_temp_new(),
+             rhl = tcg_temp_new(),
+             rhh = tcg_temp_new(),
+             rlln = tcg_temp_new(),
+             rlhn = tcg_temp_new(),
+             rhln = tcg_temp_new(),
+             rhhn = tcg_temp_new(),
+             sgnres = tcg_temp_new(),
+             tmp = tcg_temp_new(),
+             cnst_one = tcg_const_tl(1),
+             cnst_zero = tcg_const_tl(0);
+
+        gen_get_gpr(rs1l, a->rs1);
+        gen_get_gprh(rs1h, a->rs1);
+        gen_get_gpr(rs2l, a->rs2);
+        gen_get_gprh(rs2h, a->rs2);
+
+        /* Extract sign of result (=> sgn(a)) */
+        tcg_gen_setcondi_tl(TCG_COND_LT, sgnres, rs1h, 0);
+
+        /* Take absolute value of rs1 */
+        tcg_gen_sari_tl(rhl, rs1h, 63);
+        tcg_gen_add2_tl(rs1l, rs1h, rs1l, rs1h, rhl, rhl);
+        tcg_gen_xor_tl(rs1l, rs1l, rhl);
+        tcg_gen_xor_tl(rs1h, rs1h, rhl);
+
+        /* Unsigned multiplication */
+        gen_mulu2_128(rll, rlh, rhl, rhh, rs1l, rs1h, rs2l, rs2h);
+
+        /* Negation of result (two's complement : ~res + 1) */
+        tcg_gen_not_tl(rlln, rll);
+        tcg_gen_not_tl(rlhn, rlh);
+        tcg_gen_not_tl(rhln, rhl);
+        tcg_gen_not_tl(rhhn, rhh);
+
+        tcg_gen_add2_tl(rlln, tmp, rlln, cnst_zero, cnst_one, cnst_zero);
+        tcg_gen_add2_tl(rlhn, tmp, rlhn, cnst_zero, tmp, cnst_zero);
+        tcg_gen_add2_tl(rhln, tmp, rhln, cnst_zero, tmp, cnst_zero);
+        tcg_gen_add2_tl(rhhn, tmp, rhhn, cnst_zero, tmp, cnst_zero);
+
+        /* Move conditionally result or -result depending on result sign */
+        tcg_gen_movcond_tl(TCG_COND_NE, rhl, sgnres, cnst_zero, rhln, rhl);
+        tcg_gen_movcond_tl(TCG_COND_NE, rhh, sgnres, cnst_zero, rhhn, rhh);
+
+        gen_set_gpr(a->rd, rhl);
+        gen_set_gprh(a->rd, rhh);
+
+        tcg_temp_free(rs1h);
+        tcg_temp_free(rs1l);
+        tcg_temp_free(rs2l);
+        tcg_temp_free(rs2h);
+        tcg_temp_free(rll);
+        tcg_temp_free(rlh);
+        tcg_temp_free(rhl);
+        tcg_temp_free(rhh);
+        tcg_temp_free(rlln);
+        tcg_temp_free(rlhn);
+        tcg_temp_free(rhln);
+        tcg_temp_free(rhhn);
+        tcg_temp_free(sgnres);
+        tcg_temp_free(tmp);
+        tcg_temp_free(cnst_one);
+        tcg_temp_free(cnst_zero);
+
+        return true;
+    }
+#endif
     return gen_arith(ctx, a, &gen_mulhsu);
 }
 
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx)) {
+        TCGv rs1h = tcg_temp_new(),
+             rs1l = tcg_temp_new(),
+             rs2h = tcg_temp_new(),
+             rs2l = tcg_temp_new(),
+             rll = tcg_temp_new(),
+             rlh = tcg_temp_new(),
+             rhl = tcg_temp_new(),
+             rhh = tcg_temp_new();
+
+        gen_get_gpr(rs1l, a->rs1);
+        gen_get_gprh(rs1h, a->rs1);
+        gen_get_gpr(rs2l, a->rs2);
+        gen_get_gprh(rs2h, a->rs2);
+
+        gen_mulu2_128(rll, rlh, rhl, rhh, rs1l, rs1h, rs2l, rs2h);
+
+        gen_set_gpr(a->rd, rhl);
+        gen_set_gprh(a->rd, rhh);
+
+        tcg_temp_free(rs1h);
+        tcg_temp_free(rs1l);
+        tcg_temp_free(rs2l);
+        tcg_temp_free(rs2h);
+        tcg_temp_free(rll);
+        tcg_temp_free(rlh);
+        tcg_temp_free(rhl);
+        tcg_temp_free(rhh);
+
+        return true;
+    }
+#endif
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
     gen_get_gpr(source1, a->rs1);
@@ -66,63 +314,243 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_div);
+    if (!is_128bit(ctx)) {
+        return gen_arith(ctx, a, &gen_div);
+    }
+
+#ifdef TARGET_RISCV128
+    TCGv ul = tcg_temp_new(),
+         uh = tcg_temp_new(),
+         vl = tcg_temp_new(),
+         vh = tcg_temp_new(),
+         rd = tcg_temp_new();
+
+    tcg_gen_movi_i64(rd, a->rd);
+
+    gen_get_gpr(ul, a->rs1);
+    gen_get_gprh(uh, a->rs1);
+    gen_get_gpr(vl, a->rs2);
+    gen_get_gprh(vh, a->rs2);
+
+    gen_helper_idivs128(cpu_env, rd, ul, uh, vl, vh);
+#endif
+    return true;
 }
 
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_divu);
+    if (!is_128bit(ctx)) {
+        return gen_arith(ctx, a, &gen_divu);
+    }
+
+#ifdef TARGET_RISCV128
+    TCGv ul = tcg_temp_new(),
+         uh = tcg_temp_new(),
+         vl = tcg_temp_new(),
+         vh = tcg_temp_new(),
+         rd = tcg_temp_new();
+
+    tcg_gen_movi_i64(rd, a->rd);
+
+    gen_get_gpr(ul, a->rs1);
+    gen_get_gprh(uh, a->rs1);
+    gen_get_gpr(vl, a->rs2);
+    gen_get_gprh(vh, a->rs2);
+
+    gen_helper_idivu128(cpu_env, rd, ul, uh, vl, vh);
+#endif
+    return true;
 }
 
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_rem);
+    if (!is_128bit(ctx)) {
+        return gen_arith(ctx, a, &gen_rem);
+    }
+
+#ifdef TARGET_RISCV128
+    TCGv ul = tcg_temp_new(),
+            uh = tcg_temp_new(),
+            vl = tcg_temp_new(),
+            vh = tcg_temp_new(),
+            rd = tcg_temp_new();
+
+    tcg_gen_movi_i64(rd, a->rd);
+
+    gen_get_gpr(ul, a->rs1);
+    gen_get_gprh(uh, a->rs1);
+    gen_get_gpr(vl, a->rs2);
+    gen_get_gprh(vh, a->rs2);
+
+    gen_helper_irems128(cpu_env, rd, ul, uh, vl, vh);
+#endif
+    return true;
 }
 
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_remu);
+    if (!is_128bit(ctx)) {
+        return gen_arith(ctx, a, &gen_remu);
+    }
+
+#ifdef TARGET_RISCV128
+    TCGv ul = tcg_temp_new(),
+         uh = tcg_temp_new(),
+         vl = tcg_temp_new(),
+         vh = tcg_temp_new(),
+         rd = tcg_temp_new();
+
+    tcg_gen_movi_tl(rd, a->rd);
+
+    gen_get_gpr(ul, a->rs1);
+    gen_get_gprh(uh, a->rs1);
+    gen_get_gpr(vl, a->rs2);
+    gen_get_gprh(vh, a->rs2);
+
+    gen_helper_iremu128(cpu_env, rd, ul, uh, vl, vh);
+#endif
+    return true;
 }
 
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
 
-    return gen_arith(ctx, a, &gen_mulw);
+    bool rv = gen_arith(ctx, a, &gen_mulw);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx) && a->rd != 0) {
+        tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd], cpu_gpr[a->rd]);
+    }
+#endif
+    return rv;
 }
 
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
 
-    return gen_arith_div_w(ctx, a, &gen_div);
+    bool rv = gen_arith_div_w(ctx, a, &gen_div);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx) && a->rd != 0) {
+        tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd], cpu_gpr[a->rd]);
+    }
+#endif
+    return rv;
 }
 
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
 
-    return gen_arith_div_uw(ctx, a, &gen_divu);
+    bool rv = gen_arith_div_uw(ctx, a, &gen_divu);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx) && a->rd != 0) {
+        tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd], cpu_gpr[a->rd]);
+    }
+#endif
+    return rv;
 }
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
 
-    return gen_arith_div_w(ctx, a, &gen_rem);
+    bool rv = gen_arith_div_w(ctx, a, &gen_rem);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx) && a->rd != 0) {
+        tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd], cpu_gpr[a->rd]);
+    }
+#endif
+    return rv;
 }
 
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
+    REQUIRE_EXT(ctx, RVM);
+
+    bool rv = gen_arith_div_uw(ctx, a, &gen_remu);
+#if defined(TARGET_RISCV128)
+    if (is_128bit(ctx) && a->rd != 0) {
+        tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd], cpu_gpr[a->rd]);
+    }
+#endif
+    return rv;
+}
+
+static bool trans_muld(DisasContext *ctx, arg_muld *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_128BIT(ctx);
+
+    bool rv = gen_arith(ctx, a, &tcg_gen_mul_tl);
+#if defined(TARGET_RISCV128)
+    if (a->rd != 0) {
+        tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd], cpu_gpr[a->rd]);
+    }
+#endif
+    return rv;
+}
+
+static bool trans_divd(DisasContext *ctx, arg_divd *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_128BIT(ctx);
+
+    bool rv = gen_arith(ctx, a, &gen_div);
+#if defined(TARGET_RISCV128)
+    if (a->rd != 0) {
+        tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd], cpu_gpr[a->rd]);
+    }
+#endif
+    return rv;
+}
+
+static bool trans_divud(DisasContext *ctx, arg_divud *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_128BIT(ctx);
+
+    bool rv = gen_arith(ctx, a, &gen_divu);
+#if defined(TARGET_RISCV128)
+    if (a->rd != 0) {
+        tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd], cpu_gpr[a->rd]);
+    }
+#endif
+    return rv;
+}
+
+static bool trans_remd(DisasContext *ctx, arg_remd *a)
+{
+    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_128BIT(ctx);
+
+    bool rv = gen_arith(ctx, a, &gen_rem);
+#if defined(TARGET_RISCV128)
+    if (a->rd != 0) {
+        tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd], cpu_gpr[a->rd]);
+    }
+#endif
+    return rv;
+}
+
+static bool trans_remud(DisasContext *ctx, arg_remud *a)
+{
     REQUIRE_EXT(ctx, RVM);
+    REQUIRE_128BIT(ctx);
 
-    return gen_arith_div_uw(ctx, a, &gen_remu);
+    bool rv = gen_arith(ctx, a, &gen_remu);
+#if defined(TARGET_RISCV128)
+    if (a->rd != 0) {
+        tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd], cpu_gpr[a->rd]);
+    }
+#endif
+    return rv;
 }
diff --git a/target/riscv/m128_helper.c b/target/riscv/m128_helper.c
new file mode 100644
index 0000000000..973632b005
--- /dev/null
+++ b/target/riscv/m128_helper.c
@@ -0,0 +1,301 @@
+/*
+ * RISC-V Emulation Helpers for QEMU.
+ *
+ * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
+ * Copyright (c) 2017-2018 SiFive, Inc.
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
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "qemu/main-loop.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+
+#ifdef TARGET_RISCV128
+/* TODO : This can be optimized by a lot */
+static void divmod128(uint64_t ul, uint64_t uh,
+            uint64_t vl, uint64_t vh,
+            uint64_t *ql, uint64_t *qh,
+            uint64_t *rl, uint64_t *rh)
+{
+    const uint64_t b = ((uint64_t) 1) << 32;
+    const int m = 4;
+    uint64_t qhat, rhat, p;
+    int n, s, i;
+    int64_t j, t, k;
+
+    /* Build arrays of 32-bit words for u and v */
+    uint32_t *u = alloca(4 * sizeof(uint32_t));
+    u[0] = ul & 0xffffffff;
+    u[1] = (ul >> 32) & 0xffffffff;
+    u[2] = uh & 0xffffffff;
+    u[3] = (uh >> 32) & 0xffffffff;
+
+    uint32_t *v = alloca(4 * sizeof(uint32_t));
+    v[0] = vl & 0xffffffff;
+    v[1] = (vl >> 32) & 0xffffffff;
+    v[2] = vh & 0xffffffff;
+    v[3] = (vh >> 32) & 0xffffffff;
+
+    uint32_t *q = alloca(4 * sizeof(uint32_t));
+    uint32_t *r = alloca(4 * sizeof(uint32_t));
+    uint32_t *un = alloca(5 * sizeof(uint32_t));
+    uint32_t *vn = alloca(4 * sizeof(uint32_t));
+
+    memset(q, 0, 4 * sizeof(uint32_t));
+    memset(r, 0, 4 * sizeof(uint32_t));
+    memset(un, 0, 5 * sizeof(uint32_t));
+    memset(vn, 0, 4 * sizeof(uint32_t));
+
+    if (v[3] != 0) {
+        n = 4;
+    } else if (v[2]) {
+        n = 3;
+    } else if (v[1]) {
+        n = 2;
+    } else if (v[0]) {
+        n = 1;
+    } else {
+        /* never happens, but makes gcc shy */
+        return;
+    }
+
+    if (n == 1) {
+        /* Take care of the case of a single-digit divisor here */
+        k = 0;
+        for (j = m - 1; j >= 0; j--) {
+            q[j] = (k * b + u[j]) / v[0];
+            k = (k * b + u[j]) - q[j] * v[0];
+        }
+        if (r != NULL) {
+            r[0] = k;
+        }
+    } else {
+        s = clz32(v[n - 1]); /* 0 <= s <= 32 */
+        if (s != 0) {
+            for (i = n - 1; i > 0; i--) {
+                vn[i] = ((v[i] << s) | (v[i - 1] >> (32 - s)));
+            }
+            vn[0] = v[0] << s;
+
+            un[m] = u[m - 1] >> (32 - s);
+            for (i = m - 1; i > 0; i--) {
+                un[i] = (u[i] << s) | (u[i - 1] >> (32 - s));
+            }
+            un[0] = u[0] << s;
+        } else {
+            for (i = 0; i < n; i++) {
+                vn[i] = v[i];
+            }
+
+            for (i = 0; i < m; i++) {
+                un[i] = u[i];
+            }
+            un[m] = 0;
+        }
+
+        /* Step D2 : loop on j */
+        for (j = m - n; j >= 0; j--) { /* Main loop */
+            /* Step D3 : Compute estimate qhat of q[j] */
+            qhat = (un[j + n] * b + un[j + n - 1]) / vn[n - 1];
+            /* Optimized mod vn[n -1 ] */
+            rhat = (un[j + n] * b + un[j + n - 1]) - qhat * vn[n - 1];
+
+            while (true) {
+                if (qhat == b
+                    || qhat * vn[n - 2] > b * rhat + un[j + n - 2]) {
+                    qhat = qhat - 1;
+                    rhat = rhat + vn[n - 1];
+                    if (rhat < b) {
+                        continue;
+                    }
+                }
+                break;
+            }
+
+            /* Step D4 : Multiply and subtract */
+            k = 0;
+            for (i = 0; i < n; i++) {
+                p = qhat * vn[i];
+                t = un[i + j] - k - (p & 0xffffffff);
+                un[i + j] = t;
+                k = (p >> 32) - (t >> 32);
+            }
+            t = un[j + n] - k;
+            un[j + n] = t;
+
+            /* Step D5 */
+            q[j] = qhat;         /* Store quotient digit */
+            /* Step D6 */
+            if (t < 0) {         /* If we subtracted too much, add back */
+                q[j] = q[j] - 1;
+                k = 0;
+                for (i = 0; i < n; i++) {
+                    t = un[i + j] + vn[i] + k;
+                    un[i + j] = t;
+                    k = t >> 32;
+                }
+                un[j + n] = un[j + n] + k;
+            }
+        } /* D7 Loop */
+
+        /* Step D8 : Unnormalize */
+        if (rl && rh) {
+            if (s != 0) {
+                for (i = 0; i < n; i++) {
+                    r[i] = (un[i] >> s) | (un[i + 1] << (32 - s));
+                }
+            } else {
+                for (i = 0; i < n; i++) {
+                    r[i] = un[i];
+                }
+            }
+        }
+    }
+
+    if (ql && qh) {
+        *ql = q[0] | ((uint64_t)q[1] << 32);
+        *qh = q[2] | ((uint64_t)q[3] << 32);
+    }
+
+    if (rl && rh) {
+        *rl = r[0] | ((uint64_t)r[1] << 32);
+        *rh = r[2] | ((uint64_t)r[3] << 32);
+    }
+}
+
+void HELPER(idivu128)(CPURISCVState *env, uint64_t rd,
+                        uint64_t ul, uint64_t uh,
+                        uint64_t vl, uint64_t vh)
+{
+    uint64_t ql, qh;
+    if (vl == 0 && vh == 0) { /* Handle special behavior on div by zero */
+        ql = 0xffffffffffffffff;
+        qh = ql;
+    } else {
+        /* Soft quad division */
+        divmod128(ul, uh, vl, vh, &ql, &qh, NULL, NULL);
+    }
+
+    if (rd != 0) {
+        env->gpr[rd] = ql;
+        env->gprh[rd] = qh;
+    }
+    return;
+}
+
+void HELPER(iremu128)(CPURISCVState *env, uint64_t rd,
+                      uint64_t ul, uint64_t uh,
+                      uint64_t vl, uint64_t vh)
+{
+    uint64_t rl, rh;
+    if (vl == 0 && vh == 0) {
+        rl = ul;
+        rh = uh;
+    } else {
+        /* Soft quad division */
+        divmod128(ul, uh, vl, vh, NULL, NULL, &rl, &rh);
+    }
+
+    if (rd != 0) {
+        env->gpr[rd] = rl;
+        env->gprh[rd] = rh;
+    }
+    return;
+}
+
+static void neg128(uint64_t *valh, uint64_t *vall)
+{
+    uint64_t oneh = ~(*valh), onel = ~(*vall);
+    *vall = onel + 1;
+    /* Carry into upper 64 bits */
+    *valh = (*vall < onel) ? oneh + 1 : oneh;
+}
+
+void HELPER(idivs128)(CPURISCVState *env, uint64_t rd,
+                      uint64_t ul, uint64_t uh,
+                      uint64_t vl, uint64_t vh)
+{
+    uint64_t qh, ql;
+    if (vl == 0 && vh == 0) { /* Div by zero check */
+        ql = 0xffffffffffffffff;
+        qh = 0xffffffffffffffff;
+    } else if (uh == 0x8000000000000000 && ul == 0 &&
+               vh == 0xffffffffffffffff && vl == 0xffffffffffffffff) {
+        /* Signed div overflow check (-2**127 / -1) */
+        ql = ul;
+        qh = uh;
+    } else {
+        /* User unsigned divmod to build signed quotient */
+        bool sgnu = (uh & 0x8000000000000000),
+             sgnv = (vh & 0x8000000000000000);
+
+        if (sgnu) {
+            neg128(&uh, &ul);
+        }
+
+        if (sgnv) {
+            neg128(&vh, &vl);
+        }
+
+        divmod128(ul, uh, vl, vh, &ql, &qh, NULL, NULL);
+
+        if (sgnu != sgnv) {
+            neg128(&qh, &ql);
+        }
+    }
+
+    if (rd != 0) {
+        env->gpr[rd] = ql;
+        env->gprh[rd] = qh;
+    }
+    return;
+}
+
+void HELPER(irems128)(CPURISCVState *env, uint64_t rd,
+                      uint64_t ul, uint64_t uh,
+                      uint64_t vl, uint64_t vh)
+{
+    uint64_t rh, rl;
+    if (vl == 0 && vh == 0) {
+        rl = ul;
+        rh = uh;
+    } else {
+        /* User unsigned divmod to build signed remainder */
+        bool sgnu = (uh & 0x8000000000000000),
+             sgnv = (vh & 0x8000000000000000);
+
+        if (sgnu) {
+            neg128(&uh, &ul);
+        }
+
+        if (sgnv) {
+            neg128(&vh, &vl);
+        }
+
+        divmod128(ul, uh, vl, vh, NULL, NULL, &rl, &rh);
+
+        if (sgnu) {
+            neg128(&rh, &rl);
+        }
+    }
+
+    if (rd != 0) {
+        env->gpr[rd] = rl;
+        env->gprh[rd] = rh;
+    }
+    return;
+}
+#endif
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index d5e0bc93ea..3a25dd723b 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -16,6 +16,7 @@ riscv_ss.add(files(
   'gdbstub.c',
   'op_helper.c',
   'vector_helper.c',
+  'm128_helper.c',
   'bitmanip_helper.c',
   'translate.c',
 ))
-- 
2.33.0


