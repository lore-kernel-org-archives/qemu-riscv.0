Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mez6L-0006dJ-0I
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 08:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez6G-0006XJ-Qi; Mon, 25 Oct 2021 08:29:13 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez69-00087I-OV; Mon, 25 Oct 2021 08:29:12 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 2BDC241AD3;
 Mon, 25 Oct 2021 14:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1635164915;
 bh=nkFBR9auNMSKxc3iqVenpM4PKPHQfrjxoH2oE1AFNjc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RkrW87/BFyzjzFRxErZhBVKy+0it7Va5RYKRFlHYUsTycOwMUy+lzSsY4MJtMnpvm
 uyRSKisN2krreaxEFnWLe6++Y7IIXtV9KSbVfkpzviOf39ObN/C5ptcSf70SAgrf0r
 r1IXc2freEPVMJKHXhUEIMg15uZgAU5mdFne7KGRgVxOiUpAynwItNxzaPYQH6RkAg
 42Pc8PyCifte99WCy4IZZzblUAo3P+5KexUiEVJaa06aj4glzHPO7biJh+LFPhMGSp
 ehS9zRVjrN8eJvN0Pp2aIPwm2gxKKCmLJJNnnm1uclA7sKOlhA+M6o7U+jf5Ikca/M
 qFGyQOc5MJn1Q==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 04B0560066;
 Mon, 25 Oct 2021 14:28:35 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id BEA6614005D;
 Mon, 25 Oct 2021 14:28:34 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v4 13/17] target/riscv: support for 128-bit M extension
Date: Mon, 25 Oct 2021 14:28:14 +0200
Message-Id: <20211025122818.168890-14-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Mon, 25 Oct 2021 12:29:15 -0000

Given the complexity of the implementation of these instructions, we call
helpers to produce their behavior. From an implementation standpoint, we
ended up by adding two more tcg globals to return the 128-bit result in a
wrapper that itself is called by gen_arith.
The sub 128-bit insns are now handled through the existing generation
functions.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/cpu.h                      |   3 +
 target/riscv/helper.h                   |   6 +
 target/riscv/insn32.decode              |   7 +
 target/riscv/m128_helper.c              | 109 ++++++++++++++
 target/riscv/insn_trans/trans_rvm.c.inc | 187 ++++++++++++++++++++++--
 target/riscv/meson.build                |   1 +
 6 files changed, 300 insertions(+), 13 deletions(-)
 create mode 100644 target/riscv/m128_helper.c

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6c15dcacfc..923ef01583 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -142,6 +142,9 @@ struct CPURISCVState {
     uint32_t misa_ext;      /* current extensions */
     uint32_t misa_ext_mask; /* max ext for this cpu */
 
+    /* 128-bit helpers upper part return value */
+    target_ulong retxh;
+
     uint32_t features;
 
 #ifdef CONFIG_USER_ONLY
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c7a5376227..957ae8a2a2 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1147,3 +1147,9 @@ DEF_HELPER_6(vcompress_vm_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+/* 128-bit integer multiplication and division */
+DEF_HELPER_5(divu_i128, i64, env, i64, i64, i64, i64)
+DEF_HELPER_5(divs_i128, i64, env, i64, i64, i64, i64)
+DEF_HELPER_5(remu_i128, i64, env, i64, i64, i64, i64)
+DEF_HELPER_5(rems_i128, i64, env, i64, i64, i64, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index afaf243b4e..16d40362e6 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -198,6 +198,13 @@ divuw    0000001 .....  ..... 101 ..... 0111011 @r
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
index 0000000000..bd8a37afe7
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
+uint64_t HELPER(divu_i128)(CPURISCVState *env,
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
+    env->retxh = qh;
+    return ql;
+}
+
+uint64_t HELPER(remu_i128)(CPURISCVState *env,
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
+    env->retxh = rh;
+    return rl;
+}
+
+uint64_t HELPER(divs_i128)(CPURISCVState *env,
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
+    env->retxh = qh;
+    return ql;
+}
+
+uint64_t HELPER(rems_i128)(CPURISCVState *env,
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
+    env->retxh = rh;
+    return rl;
+}
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index efe25dfc11..1a2d6da42f 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -18,11 +18,80 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+static void gen_mulu2_i128(TCGv r2, TCGv r3, TCGv al, TCGv ah, TCGv bl, TCGv bh)
+{
+    TCGv tmpl = tcg_temp_new();
+    TCGv tmph = tcg_temp_new();
+    TCGv r0 = tcg_temp_new();
+    TCGv r1 = tcg_temp_new();
+    TCGv zero = tcg_constant_tl(0);
+
+    tcg_gen_mulu2_tl(r0, r1, al, bl);
+
+    tcg_gen_mulu2_tl(tmpl, tmph, al, bh);
+    tcg_gen_add2_tl(r1, r2, r1, zero, tmpl, tmph);
+    tcg_gen_mulu2_tl(tmpl, tmph, ah, bl);
+    tcg_gen_add2_tl(r1, tmph, r1, r2, tmpl, tmph);
+    /* Overflow detection into r3 */
+    tcg_gen_setcond_tl(TCG_COND_LTU, r3, tmph, r2);
+
+    tcg_gen_mov_tl(r2, tmph);
+
+    tcg_gen_mulu2_tl(tmpl, tmph, ah, bh);
+    tcg_gen_add2_tl(r2, r3, r2, r3, tmpl, tmph);
+
+    tcg_temp_free(tmpl);
+    tcg_temp_free(tmph);
+}
+
+static void gen_mul_i128(TCGv rl, TCGv rh,
+                         TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    TCGv tmpl = tcg_temp_new();
+    TCGv tmph = tcg_temp_new();
+    TCGv tmpx = tcg_temp_new();
+    TCGv zero = tcg_constant_tl(0);
+
+    tcg_gen_mulu2_tl(rl, rh, rs1l, rs2l);
+    tcg_gen_mulu2_tl(tmpl, tmph, rs1l, rs2h);
+    tcg_gen_add2_tl(rh, tmpx, rh, zero, tmpl, tmph);
+    tcg_gen_mulu2_tl(tmpl, tmph, rs1h, rs2l);
+    tcg_gen_add2_tl(rh, tmph, rh, tmpx, tmpl, tmph);
+
+    tcg_temp_free(tmpl);
+    tcg_temp_free(tmph);
+    tcg_temp_free(tmpx);
+}
+
 
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, gen_mul_i128);
+}
+
+static void gen_mulh_i128(TCGv rl, TCGv rh,
+                          TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    TCGv t0l = tcg_temp_new();
+    TCGv t0h = tcg_temp_new();
+    TCGv t1l = tcg_temp_new();
+    TCGv t1h = tcg_temp_new();
+
+    gen_mulu2_i128(rl, rh, rs1l, rs1h, rs2l, rs2h);
+    tcg_gen_sari_tl(t0h, rs1h, 63);
+    tcg_gen_and_tl(t0l, t0h, rs2l);
+    tcg_gen_and_tl(t0h, t0h, rs2h);
+    tcg_gen_sari_tl(t1h, rs2h, 63);
+    tcg_gen_and_tl(t1l, t1h, rs1l);
+    tcg_gen_and_tl(t1h, t1h, rs1h);
+    tcg_gen_sub2_tl(t0l, t0h, rl, rh, t0l, t0h);
+    tcg_gen_sub2_tl(rl, rh, t0l, t0h, t1l, t1h);
+
+    tcg_temp_free(t0l);
+    tcg_temp_free(t0h);
+    tcg_temp_free(t1l);
+    tcg_temp_free(t1h);
 }
 
 static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
@@ -42,7 +111,25 @@ static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w, NULL);
+    return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w,
+                            gen_mulh_i128);
+}
+
+static void gen_mulhsu_i128(TCGv rl, TCGv rh,
+                            TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+
+    TCGv t0l = tcg_temp_new();
+    TCGv t0h = tcg_temp_new();
+
+    gen_mulu2_i128(rl, rh, rs1l, rs1h, rs2l, rs2h);
+    tcg_gen_sari_tl(t0h, rs1h, 63);
+    tcg_gen_and_tl(t0l, t0h, rs2l);
+    tcg_gen_and_tl(t0h, t0h, rs2h);
+    tcg_gen_sub2_tl(rl, rh, rl, rh, t0l, t0h);
+
+    tcg_temp_free(t0l);
+    tcg_temp_free(t0h);
 }
 
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
@@ -76,7 +163,8 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w, NULL);
+    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w,
+                            gen_mulhsu_i128);
 }
 
 static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
@@ -91,7 +179,16 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
     /* gen_mulh_w works for either sign as input. */
-    return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w, NULL);
+    return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w,
+                            gen_mulu2_i128);
+}
+
+static void gen_div_i128(TCGv rdl, TCGv rdh,
+                         TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    gen_helper_divs_i128((TCGv_i64)rdl, cpu_env, (TCGv_i64)rs1l, (TCGv_i64)rs1h,
+                                       (TCGv_i64)rs2l, (TCGv_i64)rs2h);
+    tcg_gen_ld_tl(rdh, cpu_env, offsetof(CPURISCVState, retxh));
 }
 
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
@@ -130,7 +227,15 @@ static void gen_div(TCGv ret, TCGv source1, TCGv source2)
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
+    gen_helper_divu_i128((TCGv_i64)rdl, cpu_env, (TCGv_i64)rs1l, (TCGv_i64)rs1h,
+                                       (TCGv_i64)rs2l, (TCGv_i64)rs2h);
+    tcg_gen_ld_tl(rdh, cpu_env, offsetof(CPURISCVState, retxh));
 }
 
 static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
@@ -158,7 +263,15 @@ static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
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
+    gen_helper_rems_i128((TCGv_i64)rdl, cpu_env, (TCGv_i64)rs1l, (TCGv_i64)rs1h,
+                                  (TCGv_i64)rs2l, (TCGv_i64)rs2h);
+    tcg_gen_ld_tl(rdh, cpu_env, offsetof(CPURISCVState, retxh));
 }
 
 static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
@@ -199,7 +312,15 @@ static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
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
+    gen_helper_remu_i128((TCGv_i64)rdl, cpu_env, (TCGv_i64)rs1l, (TCGv_i64)rs1h,
+                                       (TCGv_i64)rs2l, (TCGv_i64)rs2h);
+    tcg_gen_ld_tl(rdh, cpu_env, offsetof(CPURISCVState, retxh));
 }
 
 static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
@@ -227,12 +348,12 @@ static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
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
@@ -240,7 +361,7 @@ static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
     return gen_arith(ctx, a, EXT_SIGN, gen_div, NULL);
@@ -248,7 +369,7 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a)
 
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
     return gen_arith(ctx, a, EXT_ZERO, gen_divu, NULL);
@@ -256,7 +377,7 @@ static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
     return gen_arith(ctx, a, EXT_SIGN, gen_rem, NULL);
@@ -264,8 +385,48 @@ static bool trans_remw(DisasContext *ctx, arg_remw *a)
 
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


