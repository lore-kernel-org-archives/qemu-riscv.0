Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mclk3-0001kl-QU
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 05:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljx-0001KU-QD; Tue, 19 Oct 2021 05:49:01 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:54936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljs-0006cw-0B; Tue, 19 Oct 2021 05:49:01 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 61FB041F73;
 Tue, 19 Oct 2021 11:48:34 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 48B2C601D5;
 Tue, 19 Oct 2021 11:48:34 +0200 (CEST)
Received: from palmier.u-ga.fr (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 160D814005A;
 Tue, 19 Oct 2021 11:48:34 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v3 15/21] target/riscv: support for 128-bit M extension
Date: Tue, 19 Oct 2021 11:48:06 +0200
Message-Id: <20211019094812.614056-16-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 09:49:02 -0000

Given the complexity of the implementation of these instructions, we call
helpers to produce their behavior. From an implementation standpoint, we
ended up by adding two more tcg globals to return the 128-bit result in a
wrapper that itself is called by gen_arith.
The sub 128-bit insns are now handled through the existing generation
functions.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/cpu.h                      |   1 +
 target/riscv/helper.h                   |   6 +
 target/riscv/insn32.decode              |   7 +
 target/riscv/m128_helper.c              | 109 ++++++++++
 target/riscv/translate.c                |   7 +-
 target/riscv/insn_trans/trans_rvm.c.inc | 263 ++++++++++++++++++++++--
 target/riscv/meson.build                |   1 +
 7 files changed, 380 insertions(+), 14 deletions(-)
 create mode 100644 target/riscv/m128_helper.c

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5d21128865..8b96ccb37a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -113,6 +113,7 @@ FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 struct CPURISCVState {
     target_ulong gpr[32];
     target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
+    target_ulong hlpr[2];  /* scratch registers for 128-bit div/rem helpers */
     uint64_t fpr[32]; /* assume both F and D extensions */
 
     /* vector coprocessor state. */
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c7a5376227..67f5d23692 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1147,3 +1147,9 @@ DEF_HELPER_6(vcompress_vm_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+/* 128-bit integer multiplication and division */
+DEF_HELPER_5(divu_i128, void, env, i64, i64, i64, i64)
+DEF_HELPER_5(divs_i128, void, env, i64, i64, i64, i64)
+DEF_HELPER_5(remu_i128, void, env, i64, i64, i64, i64)
+DEF_HELPER_5(rems_i128, void, env, i64, i64, i64, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3556bf49cc..876e5f7f5b 100644
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
diff --git a/target/riscv/m128_helper.c b/target/riscv/m128_helper.c
new file mode 100644
index 0000000000..694ca5da9b
--- /dev/null
+++ b/target/riscv/m128_helper.c
@@ -0,0 +1,109 @@
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
+void HELPER(divu_i128)(CPURISCVState *env,
+                       uint64_t ul, uint64_t uh,
+                       uint64_t vl, uint64_t vh)
+{
+    uint64_t ql, qh;
+    Int128 q;
+
+    if (vl == 0 && vh == 0) { /* Handle special behavior on div by zero */
+        ql = ~0x0;
+        qh = ~0x0;
+    } else {
+        q = int128_divu(int128_make128(ul, uh), int128_make128(vl, vh));
+        ql = int128_getlo(q);
+        qh = int128_gethi(q);
+    }
+
+    env->hlpr[0] = ql;
+    env->hlpr[1] = qh;
+}
+
+void HELPER(remu_i128)(CPURISCVState *env,
+                       uint64_t ul, uint64_t uh,
+                       uint64_t vl, uint64_t vh)
+{
+    uint64_t rl, rh;
+    Int128 r;
+
+    if (vl == 0 && vh == 0) {
+        rl = ul;
+        rh = uh;
+    } else {
+        r = int128_remu(int128_make128(ul, uh), int128_make128(vl, vh));
+        rl = int128_getlo(r);
+        rh = int128_gethi(r);
+    }
+
+    env->hlpr[0] = rl;
+    env->hlpr[1] = rh;
+}
+
+void HELPER(divs_i128)(CPURISCVState *env,
+                       uint64_t ul, uint64_t uh,
+                       uint64_t vl, uint64_t vh)
+{
+    uint64_t qh, ql;
+    Int128 q;
+
+    if (vl == 0 && vh == 0) { /* Div by zero check */
+        ql = ~0x0;
+        qh = ~0x0;
+    } else if (uh == 0x8000000000000000 && ul == 0 &&
+               vh == ~0x0 && vl == ~0x0) {
+        /* Signed div overflow check (-2**127 / -1) */
+        ql = ul;
+        qh = uh;
+    } else {
+        q = int128_divs(int128_make128(ul, uh), int128_make128(vl, vh));
+        ql = int128_getlo(q);
+        qh = int128_gethi(q);
+    }
+
+    env->hlpr[0] = ql;
+    env->hlpr[1] = qh;
+}
+
+void HELPER(rems_i128)(CPURISCVState *env,
+                       uint64_t ul, uint64_t uh,
+                       uint64_t vl, uint64_t vh)
+{
+    uint64_t rh, rl;
+    Int128 r;
+
+    if (vl == 0 && vh == 0) {
+        rl = ul;
+        rh = uh;
+    } else {
+        r = int128_rems(int128_make128(ul, uh), int128_make128(vl, vh));
+        rl = int128_getlo(r);
+        rh = int128_gethi(r);
+    }
+
+    env->hlpr[0] = rl;
+    env->hlpr[1] = rh;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 332a5d0384..2d76832d56 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -32,7 +32,7 @@
 #include "instmap.h"
 
 /* global register indices */
-static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_vl;
+static TCGv cpu_gpr[32], cpu_gprh[32], cpu_hlpr[2], cpu_pc, cpu_vl;
 static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
 static TCGv load_res;
 static TCGv load_val;
@@ -953,6 +953,11 @@ void riscv_translate_init(void)
             offsetof(CPURISCVState, gprh[i]), riscv_int_regnames[i]);
     }
 
+    cpu_hlpr[0] = tcg_global_mem_new(cpu_env,
+        offsetof(CPURISCVState, hlpr[0]), "helper_reg0");
+    cpu_hlpr[1] = tcg_global_mem_new(cpu_env,
+        offsetof(CPURISCVState, hlpr[1]), "helper_reg1");
+
     for (i = 0; i < 32; i++) {
         cpu_fpr[i] = tcg_global_mem_new_i64(cpu_env,
             offsetof(CPURISCVState, fpr[i]), riscv_fpr_regnames[i]);
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index efe25dfc11..ea355ce333 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -18,11 +18,106 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+static void gen_mulu2_i128(TCGv rll, TCGv rlh, TCGv rhl, TCGv rhh,
+                           TCGv al, TCGv ah, TCGv bl, TCGv bh)
+{
+    TCGv tmpl = tcg_temp_new(),
+         tmph = tcg_temp_new(),
+         cnst_zero = tcg_constant_tl(0);
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
+}
+
+static void gen_mul_i128(TCGv rll, TCGv rlh,
+                         TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    TCGv rhl = tcg_temp_new(),
+         rhh = tcg_temp_new();
+
+    gen_mulu2_i128(rll, rlh, rhl, rhh, rs1l, rs1h, rs2l, rs2h);
+
+    tcg_temp_free(rhl);
+    tcg_temp_free(rhh);
+}
+
 
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, gen_mul_i128);
+}
+
+static void gen_mulh_i128(TCGv rhl, TCGv rhh,
+                          TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    TCGv rll = tcg_temp_new(),
+         rlh = tcg_temp_new(),
+         rlln = tcg_temp_new(),
+         rlhn = tcg_temp_new(),
+         rhln = tcg_temp_new(),
+         rhhn = tcg_temp_new(),
+         sgnres = tcg_temp_new(),
+         tmp = tcg_temp_new(),
+         cnst_one = tcg_constant_tl(1),
+         cnst_zero = tcg_constant_tl(0);
+
+    /* Extract sign of result (=> sgn(a) xor sgn(b)) */
+    tcg_gen_setcondi_tl(TCG_COND_LT, sgnres, rs1h, 0);
+    tcg_gen_setcondi_tl(TCG_COND_LT, tmp, rs2h, 0);
+    tcg_gen_xor_tl(sgnres, sgnres, tmp);
+
+    /* Take absolute value of operands */
+    tcg_gen_sari_tl(rhl, rs1h, 63);
+    tcg_gen_add2_tl(rlln, rlhn, rs1l, rs1h, rhl, rhl);
+    tcg_gen_xor_tl(rlln, rlln, rhl);
+    tcg_gen_xor_tl(rlhn, rlhn, rhl);
+
+    tcg_gen_sari_tl(rhl, rs2h, 63);
+    tcg_gen_add2_tl(rhln, rhhn, rs2l, rs2h, rhl, rhl);
+    tcg_gen_xor_tl(rhln, rhln, rhl);
+    tcg_gen_xor_tl(rhhn, rhhn, rhl);
+
+    /* Unsigned multiplication */
+    gen_mulu2_i128(rll, rlh, rhl, rhh, rlln, rlhn, rhln, rhhn);
+
+    /* Negation of result (two's complement : ~res + 1) */
+    tcg_gen_not_tl(rlln, rll);
+    tcg_gen_not_tl(rlhn, rlh);
+    tcg_gen_not_tl(rhln, rhl);
+    tcg_gen_not_tl(rhhn, rhh);
+
+    tcg_gen_add2_tl(rlln, tmp, rlln, cnst_zero, cnst_one, cnst_zero);
+    tcg_gen_add2_tl(rlhn, tmp, rlhn, cnst_zero, tmp, cnst_zero);
+    tcg_gen_add2_tl(rhln, tmp, rhln, cnst_zero, tmp, cnst_zero);
+    tcg_gen_add2_tl(rhhn, tmp, rhhn, cnst_zero, tmp, cnst_zero);
+
+    /* Move conditionally result or -result depending on result sign */
+    tcg_gen_movcond_tl(TCG_COND_NE, rhl, sgnres, cnst_zero, rhln, rhl);
+    tcg_gen_movcond_tl(TCG_COND_NE, rhh, sgnres, cnst_zero, rhhn, rhh);
+
+    tcg_temp_free(rll);
+    tcg_temp_free(rlh);
+    tcg_temp_free(rlln);
+    tcg_temp_free(rlhn);
+    tcg_temp_free(rhln);
+    tcg_temp_free(rhhn);
+    tcg_temp_free(sgnres);
+    tcg_temp_free(tmp);
 }
 
 static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
@@ -42,7 +137,59 @@ static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w, NULL);
+    return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w,
+                            gen_mulh_i128);
+}
+
+static void gen_mulhsu_i128(TCGv rhl, TCGv rhh,
+                            TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    TCGv rll = tcg_temp_new(),
+         rlh = tcg_temp_new(),
+         rlln = tcg_temp_new(),
+         rlhn = tcg_temp_new(),
+         rhln = tcg_temp_new(),
+         rhhn = tcg_temp_new(),
+         sgnres = tcg_temp_new(),
+         tmp = tcg_temp_new(),
+         cnst_one = tcg_constant_tl(1),
+         cnst_zero = tcg_constant_tl(0);
+
+    /* Extract sign of result (=> sgn(a)) */
+    tcg_gen_setcondi_tl(TCG_COND_LT, sgnres, rs1h, 0);
+
+    /* Take absolute value of rs1 */
+    tcg_gen_sari_tl(rhl, rs1h, 63);
+    tcg_gen_add2_tl(rlln, rlhn, rs1l, rs1h, rhl, rhl);
+    tcg_gen_xor_tl(rlln, rlln, rhl);
+    tcg_gen_xor_tl(rlhn, rlhn, rhl);
+
+    /* Unsigned multiplication */
+    gen_mulu2_i128(rll, rlh, rhl, rhh, rlln, rlhn, rs2l, rs2h);
+
+    /* Negation of result (two's complement : ~res + 1) */
+    tcg_gen_not_tl(rlln, rll);
+    tcg_gen_not_tl(rlhn, rlh);
+    tcg_gen_not_tl(rhln, rhl);
+    tcg_gen_not_tl(rhhn, rhh);
+
+    tcg_gen_add2_tl(rlln, tmp, rlln, cnst_zero, cnst_one, cnst_zero);
+    tcg_gen_add2_tl(rlhn, tmp, rlhn, cnst_zero, tmp, cnst_zero);
+    tcg_gen_add2_tl(rhln, tmp, rhln, cnst_zero, tmp, cnst_zero);
+    tcg_gen_add2_tl(rhhn, tmp, rhhn, cnst_zero, tmp, cnst_zero);
+
+    /* Move conditionally result or -result depending on result sign */
+    tcg_gen_movcond_tl(TCG_COND_NE, rhl, sgnres, cnst_zero, rhln, rhl);
+    tcg_gen_movcond_tl(TCG_COND_NE, rhh, sgnres, cnst_zero, rhhn, rhh);
+
+    tcg_temp_free(rll);
+    tcg_temp_free(rlh);
+    tcg_temp_free(rlln);
+    tcg_temp_free(rlhn);
+    tcg_temp_free(rhln);
+    tcg_temp_free(rhhn);
+    tcg_temp_free(sgnres);
+    tcg_temp_free(tmp);
 }
 
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
@@ -76,7 +223,20 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w, NULL);
+    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w,
+                            gen_mulhsu_i128);
+}
+
+static void gen_mulhu_i128(TCGv rhl, TCGv rhh,
+                           TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    TCGv rll = tcg_temp_new(),
+         rlh = tcg_temp_new();
+
+    gen_mulu2_i128(rll, rlh, rhl, rhh, rs1l, rs1h, rs2l, rs2h);
+
+    tcg_temp_free(rll);
+    tcg_temp_free(rlh);
 }
 
 static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
@@ -91,7 +251,17 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
     /* gen_mulh_w works for either sign as input. */
-    return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w, NULL);
+    return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w,
+                            gen_mulhu_i128);
+}
+
+static void gen_div_i128(TCGv rdl, TCGv rdh,
+                         TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    gen_helper_divs_i128(cpu_env, (TCGv_i64)rs1l, (TCGv_i64)rs1h,
+                                  (TCGv_i64)rs2l, (TCGv_i64)rs2h);
+    tcg_gen_mov_tl(rdl, cpu_hlpr[0]);
+    tcg_gen_mov_tl(rdh, cpu_hlpr[1]);
 }
 
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
@@ -130,7 +300,16 @@ static void gen_div(TCGv ret, TCGv source1, TCGv source2)
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_SIGN, gen_div, NULL);
+    return gen_arith(ctx, a, EXT_SIGN, gen_div, gen_div_i128);
+}
+
+static void gen_divu_i128(TCGv rdl, TCGv rdh,
+                          TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    gen_helper_divu_i128(cpu_env, (TCGv_i64)rs1l, (TCGv_i64)rs1h,
+                                  (TCGv_i64)rs2l, (TCGv_i64)rs2h);
+    tcg_gen_mov_tl(rdl, cpu_hlpr[0]);
+    tcg_gen_mov_tl(rdh, cpu_hlpr[1]);
 }
 
 static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
@@ -158,7 +337,16 @@ static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_ZERO, gen_divu, NULL);
+    return gen_arith(ctx, a, EXT_ZERO, gen_divu, gen_divu_i128);
+}
+
+static void gen_rem_i128(TCGv rdl, TCGv rdh,
+                         TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    gen_helper_rems_i128(cpu_env, (TCGv_i64)rs1l, (TCGv_i64)rs1h,
+                                  (TCGv_i64)rs2l, (TCGv_i64)rs2h);
+    tcg_gen_mov_tl(rdl, cpu_hlpr[0]);
+    tcg_gen_mov_tl(rdh, cpu_hlpr[1]);
 }
 
 static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
@@ -199,7 +387,16 @@ static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_SIGN, gen_rem, NULL);
+    return gen_arith(ctx, a, EXT_SIGN, gen_rem, gen_rem_i128);
+}
+
+static void gen_remu_i128(TCGv rdl, TCGv rdh,
+                          TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    gen_helper_remu_i128(cpu_env, (TCGv_i64)rs1l, (TCGv_i64)rs1h,
+                                  (TCGv_i64)rs2l, (TCGv_i64)rs2h);
+    tcg_gen_mov_tl(rdl, cpu_hlpr[0]);
+    tcg_gen_mov_tl(rdh, cpu_hlpr[1]);
 }
 
 static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
@@ -227,12 +424,12 @@ static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_ZERO, gen_remu, NULL);
+    return gen_arith(ctx, a, EXT_ZERO, gen_remu, gen_remu_i128);
 }
 
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
@@ -240,7 +437,7 @@ static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
     return gen_arith(ctx, a, EXT_SIGN, gen_div, NULL);
@@ -248,7 +445,7 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a)
 
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
     return gen_arith(ctx, a, EXT_ZERO, gen_divu, NULL);
@@ -256,7 +453,7 @@ static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
     return gen_arith(ctx, a, EXT_SIGN, gen_rem, NULL);
@@ -264,8 +461,48 @@ static bool trans_remw(DisasContext *ctx, arg_remw *a)
 
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
     return gen_arith(ctx, a, EXT_ZERO, gen_remu, NULL);
 }
+
+static bool trans_muld(DisasContext *ctx, arg_muld *a)
+{
+    REQUIRE_128BIT(ctx);
+    REQUIRE_EXT(ctx, RVM);
+    ctx->ol = MXL_RV64;
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_mul_tl, NULL);
+}
+
+static bool trans_divd(DisasContext *ctx, arg_divd *a)
+{
+    REQUIRE_128BIT(ctx);
+    REQUIRE_EXT(ctx, RVM);
+    ctx->ol = MXL_RV64;
+    return gen_arith(ctx, a, EXT_SIGN, gen_div, NULL);
+}
+
+static bool trans_divud(DisasContext *ctx, arg_divud *a)
+{
+    REQUIRE_128BIT(ctx);
+    REQUIRE_EXT(ctx, RVM);
+    ctx->ol = MXL_RV64;
+    return gen_arith(ctx, a, EXT_ZERO, gen_divu, NULL);
+}
+
+static bool trans_remd(DisasContext *ctx, arg_remd *a)
+{
+    REQUIRE_128BIT(ctx);
+    REQUIRE_EXT(ctx, RVM);
+    ctx->ol = MXL_RV64;
+    return gen_arith(ctx, a, EXT_SIGN, gen_rem, NULL);
+}
+
+static bool trans_remud(DisasContext *ctx, arg_remud *a)
+{
+    REQUIRE_128BIT(ctx);
+    REQUIRE_EXT(ctx, RVM);
+    ctx->ol = MXL_RV64;
+    return gen_arith(ctx, a, EXT_ZERO, gen_remu, NULL);
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index d5e0bc93ea..a32158da93 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -18,6 +18,7 @@ riscv_ss.add(files(
   'vector_helper.c',
   'bitmanip_helper.c',
   'translate.c',
+  'm128_helper.c'
 ))
 
 riscv_softmmu_ss = ss.source_set()
-- 
2.33.0


