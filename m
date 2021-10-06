Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEUi-0000Mu-IK
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUX-0000Cc-Vm; Wed, 06 Oct 2021 17:30:22 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:44122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUV-0008Ot-DM; Wed, 06 Oct 2021 17:30:21 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 9FB5441EA5;
 Wed,  6 Oct 2021 23:29:41 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 886D960067;
 Wed,  6 Oct 2021 23:29:41 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 4AE3114005C;
 Wed,  6 Oct 2021 23:29:41 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 21/27] target/riscv: div and rem insns on 128-bit
Date: Wed,  6 Oct 2021 23:28:27 +0200
Message-Id: <20211006212833.108706-22-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Wed, 06 Oct 2021 21:30:22 -0000

Given the complexity of the implementation of these instructions, we call
helpers to produce their behavior. From an implementation standpoint, we
ended up by adding two more tcg globals to return the 128-bit result in a
wrapper that itself is called by gen_arith.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/cpu.h                      |   1 +
 target/riscv/helper.h                   |   6 ++
 target/riscv/m128_helper.c              | 109 ++++++++++++++++++++++++
 target/riscv/translate.c                |   7 +-
 target/riscv/insn_trans/trans_rvm.c.inc |  44 +++++++++-
 target/riscv/meson.build                |   1 +
 6 files changed, 163 insertions(+), 5 deletions(-)
 create mode 100644 target/riscv/m128_helper.c

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1de9a1286b..81cbd77d09 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -121,6 +121,7 @@ FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 struct CPURISCVState {
     target_ulong gpr[32];
     target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
+    target_ulong hlpr[2];  /* scratch registers for 128-bit div/rem helpers */
     uint64_t fpr[32]; /* assume both F and D extensions */
 
     /* vector coprocessor state. */
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 460eee9988..01d885d566 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1149,3 +1149,9 @@ DEF_HELPER_6(vcompress_vm_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+/* 128-bit integer multiplication and division */
+DEF_HELPER_5(divu_i128, void, env, i64, i64, i64, i64)
+DEF_HELPER_5(divs_i128, void, env, i64, i64, i64, i64)
+DEF_HELPER_5(remu_i128, void, env, i64, i64, i64, i64)
+DEF_HELPER_5(rems_i128, void, env, i64, i64, i64, i64)
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
index 195dc3f461..cb697bd0e4 100644
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
@@ -917,6 +917,11 @@ void riscv_translate_init(void)
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
index 9ed9ba0f0f..f46e746bed 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -235,6 +235,15 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
                      gen_mulhu, gen_mulhu, gen_mulhu_i128);
 }
 
+static void gen_div_i128(TCGv rdl, TCGv rdh,
+                         TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    gen_helper_divs_i128(cpu_env, (TCGv_i64)rs1l, (TCGv_i64)rs1h,
+                                  (TCGv_i64)rs2l, (TCGv_i64)rs2h);
+    tcg_gen_mov_tl(rdl, cpu_hlpr[0]);
+    tcg_gen_mov_tl(rdh, cpu_hlpr[1]);
+}
+
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
 {
     TCGv temp1, temp2, zero, one, mone, min;
@@ -272,7 +281,16 @@ static bool trans_div(DisasContext *ctx, arg_div *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_SIGN,
-                     gen_div, gen_div, NULL);
+                     gen_div, gen_div, gen_div_i128);
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
@@ -301,7 +319,16 @@ static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_ZERO,
-                     gen_divu, gen_divu, NULL);
+                     gen_divu, gen_divu, gen_divu_i128);
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
@@ -343,7 +370,16 @@ static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_SIGN,
-                     gen_rem, gen_rem, NULL);
+                     gen_rem, gen_rem, gen_rem_i128);
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
@@ -372,7 +408,7 @@ static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_ZERO,
-                     gen_remu, gen_remu, NULL);
+                     gen_remu, gen_remu, gen_remu_i128);
 }
 
 static void gen_mulw_i128(TCGv rdl, TCGv rdh,
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


