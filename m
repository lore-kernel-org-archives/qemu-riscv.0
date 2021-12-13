Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mwoMH-0003ZL-Og
	for mharc-qemu-riscv@gnu.org; Mon, 13 Dec 2021 11:39:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoM7-0003Ez-K3; Mon, 13 Dec 2021 11:39:15 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:46718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoM3-0003b9-0e; Mon, 13 Dec 2021 11:39:15 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 9366C40370;
 Mon, 13 Dec 2021 17:38:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1639413522;
 bh=Z5xIBNHIQVLPJr1T7tcAH3hm4l4n9rQzMx5oOu8G3RM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ocGIUHihUflNw9tr4ZpM5Fh4o98U599Hf5/LcJnXvnzRyVlHPq8l21zuxFNmFHIE3
 ZersBM383IHmzUXdJap/YX1R/fN5qzNNJ9G2cqKTThLXqVo/BQ6v0JbeVQyA1T9H+V
 QCqUKG5TwQaipnwauy9uabTEP51LxwtYRYzIoL6+pDnwA6fMmAqLGk8sFYmr9AdQHh
 VcAXSTxIe85BJY8+yMEMIp8wRV3+tEFcYIrHd4eMIXSX9SsQD34jq+XhsQX57Z7qDe
 zRVrt45nCvM4pag7ZjtIxXJFMakTEyPtW3U4RsquFVX/vG1XG4MYR5Mcom+txsqUW+
 aP6xRLOY7h6sg==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 7D3B360067;
 Mon, 13 Dec 2021 17:38:42 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 48F4314005C;
 Mon, 13 Dec 2021 17:38:42 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v7 14/18] target/riscv: support for 128-bit M extension
Date: Mon, 13 Dec 2021 17:38:30 +0100
Message-Id: <20211213163834.170504-15-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
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
X-List-Received-Date: Mon, 13 Dec 2021 16:39:18 -0000

Mult are generated inline (using a cool trick pointed out by Richard), but
for div and rem, given the complexity of the implementation of these
instructions, we call helpers to produce their behavior. From an
implementation standpoint, the helpers return the low part of the results,
while the high part is temporarily stored in a dedicated field of cpu_env
that is used to update the architectural register in the generation wrapper.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h                      |   3 +
 target/riscv/helper.h                   |   6 +
 target/riscv/insn32.decode              |   7 +
 target/riscv/m128_helper.c              | 109 ++++++++++++++
 target/riscv/insn_trans/trans_rvm.c.inc | 182 ++++++++++++++++++++++--
 target/riscv/meson.build                |   1 +
 6 files changed, 295 insertions(+), 13 deletions(-)
 create mode 100644 target/riscv/m128_helper.c

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index cbd4daa6d9..603ae04837 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -141,6 +141,9 @@ struct CPURISCVState {
     uint32_t misa_ext;      /* current extensions */
     uint32_t misa_ext_mask; /* max ext for this cpu */
 
+    /* 128-bit helpers upper part return value */
+    target_ulong retxh;
+
     uint32_t features;
 
 #ifdef CONFIG_USER_ONLY
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c7a5376227..c036825723 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1147,3 +1147,9 @@ DEF_HELPER_6(vcompress_vm_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+/* 128-bit integer multiplication and division */
+DEF_HELPER_5(divu_i128, tl, env, tl, tl, tl, tl)
+DEF_HELPER_5(divs_i128, tl, env, tl, tl, tl, tl)
+DEF_HELPER_5(remu_i128, tl, env, tl, tl, tl, tl)
+DEF_HELPER_5(rems_i128, tl, env, tl, tl, tl, tl)
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
index 0000000000..7bf115b85e
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
+target_ulong HELPER(divu_i128)(CPURISCVState *env,
+                       target_ulong ul, target_ulong uh,
+                       target_ulong vl, target_ulong vh)
+{
+    target_ulong ql, qh;
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
+target_ulong HELPER(remu_i128)(CPURISCVState *env,
+                       target_ulong ul, target_ulong uh,
+                       target_ulong vl, target_ulong vh)
+{
+    target_ulong rl, rh;
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
+target_ulong HELPER(divs_i128)(CPURISCVState *env,
+                       target_ulong ul, target_ulong uh,
+                       target_ulong vl, target_ulong vh)
+{
+    target_ulong qh, ql;
+    Int128 q;
+
+    if (vl == 0 && vh == 0) { /* Div by zero check */
+        ql = ~0x0;
+        qh = ~0x0;
+    } else if (uh == (1ULL << (TARGET_LONG_BITS - 1)) && ul == 0 &&
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
+target_ulong HELPER(rems_i128)(CPURISCVState *env,
+                       target_ulong ul, target_ulong uh,
+                       target_ulong vl, target_ulong vh)
+{
+    target_ulong rh, rl;
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
index efe25dfc11..16b029edf0 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -18,11 +18,79 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+static void gen_mulhu_i128(TCGv r2, TCGv r3, TCGv al, TCGv ah, TCGv bl, TCGv bh)
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
+    gen_mulhu_i128(rl, rh, rs1l, rs1h, rs2l, rs2h);
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
@@ -42,7 +110,25 @@ static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
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
+    gen_mulhu_i128(rl, rh, rs1l, rs1h, rs2l, rs2h);
+    tcg_gen_sari_tl(t0h, rs1h, 63);
+    tcg_gen_and_tl(t0l, t0h, rs2l);
+    tcg_gen_and_tl(t0h, t0h, rs2h);
+    tcg_gen_sub2_tl(rl, rh, rl, rh, t0l, t0h);
+
+    tcg_temp_free(t0l);
+    tcg_temp_free(t0h);
 }
 
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
@@ -76,7 +162,8 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w, NULL);
+    return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w,
+                            gen_mulhsu_i128);
 }
 
 static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
@@ -91,7 +178,15 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
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
+    gen_helper_divs_i128(rdl, cpu_env, rs1l, rs1h, rs2l, rs2h);
+    tcg_gen_ld_tl(rdh, cpu_env, offsetof(CPURISCVState, retxh));
 }
 
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
@@ -130,7 +225,14 @@ static void gen_div(TCGv ret, TCGv source1, TCGv source2)
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
+    gen_helper_divu_i128(rdl, cpu_env, rs1l, rs1h, rs2l, rs2h);
+    tcg_gen_ld_tl(rdh, cpu_env, offsetof(CPURISCVState, retxh));
 }
 
 static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
@@ -158,7 +260,14 @@ static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
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
+    gen_helper_rems_i128(rdl, cpu_env, rs1l, rs1h, rs2l, rs2h);
+    tcg_gen_ld_tl(rdh, cpu_env, offsetof(CPURISCVState, retxh));
 }
 
 static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
@@ -199,7 +308,14 @@ static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
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
+    gen_helper_remu_i128(rdl, cpu_env, rs1l, rs1h, rs2l, rs2h);
+    tcg_gen_ld_tl(rdh, cpu_env, offsetof(CPURISCVState, retxh));
 }
 
 static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
@@ -227,12 +343,12 @@ static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
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
@@ -240,7 +356,7 @@ static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
     return gen_arith(ctx, a, EXT_SIGN, gen_div, NULL);
@@ -248,7 +364,7 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a)
 
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
     return gen_arith(ctx, a, EXT_ZERO, gen_divu, NULL);
@@ -256,7 +372,7 @@ static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->ol = MXL_RV32;
     return gen_arith(ctx, a, EXT_SIGN, gen_rem, NULL);
@@ -264,8 +380,48 @@ static bool trans_remw(DisasContext *ctx, arg_remw *a)
 
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
2.34.1


