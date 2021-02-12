Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAa7p-0005nT-RK
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAa7o-0005l6-92; Fri, 12 Feb 2021 10:12:52 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:59249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAa7k-00086W-D1; Fri, 12 Feb 2021 10:12:52 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.105982-0.0159943-0.878024;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047190; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYGqBIn_1613142761; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYGqBIn_1613142761)
 by smtp.aliyun-inc.com(10.147.40.233);
 Fri, 12 Feb 2021 23:12:42 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 04/38] target/riscv: 16-bit Addition & Subtraction Instructions
Date: Fri, 12 Feb 2021 23:02:22 +0800
Message-Id: <20210212150256.885-5-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210212150256.885-1-zhiwei_liu@c-sky.com>
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 12 Feb 2021 15:12:52 -0000

Include 5 groups: Wrap-around (dropping overflow), Signed Halving,
Unsigned Halving, Signed Saturation, and Unsigned Saturation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  30 ++
 target/riscv/insn32.decode              |  32 +++
 target/riscv/insn_trans/trans_rvp.c.inc | 161 +++++++++++
 target/riscv/meson.build                |   1 +
 target/riscv/packed_helper.c            | 354 ++++++++++++++++++++++++
 target/riscv/translate.c                |   1 +
 6 files changed, 579 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvp.c.inc
 create mode 100644 target/riscv/packed_helper.c

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index e3f3f41e89..6d622c732a 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1145,3 +1145,33 @@ DEF_HELPER_6(vcompress_vm_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+/* P extension function */
+DEF_HELPER_3(radd16, tl, env, tl, tl)
+DEF_HELPER_3(uradd16, tl, env, tl, tl)
+DEF_HELPER_3(kadd16, tl, env, tl, tl)
+DEF_HELPER_3(ukadd16, tl, env, tl, tl)
+DEF_HELPER_3(rsub16, tl, env, tl, tl)
+DEF_HELPER_3(ursub16, tl, env, tl, tl)
+DEF_HELPER_3(ksub16, tl, env, tl, tl)
+DEF_HELPER_3(uksub16, tl, env, tl, tl)
+DEF_HELPER_3(cras16, tl, env, tl, tl)
+DEF_HELPER_3(rcras16, tl, env, tl, tl)
+DEF_HELPER_3(urcras16, tl, env, tl, tl)
+DEF_HELPER_3(kcras16, tl, env, tl, tl)
+DEF_HELPER_3(ukcras16, tl, env, tl, tl)
+DEF_HELPER_3(crsa16, tl, env, tl, tl)
+DEF_HELPER_3(rcrsa16, tl, env, tl, tl)
+DEF_HELPER_3(urcrsa16, tl, env, tl, tl)
+DEF_HELPER_3(kcrsa16, tl, env, tl, tl)
+DEF_HELPER_3(ukcrsa16, tl, env, tl, tl)
+DEF_HELPER_3(stas16, tl, env, tl, tl)
+DEF_HELPER_3(rstas16, tl, env, tl, tl)
+DEF_HELPER_3(urstas16, tl, env, tl, tl)
+DEF_HELPER_3(kstas16, tl, env, tl, tl)
+DEF_HELPER_3(ukstas16, tl, env, tl, tl)
+DEF_HELPER_3(stsa16, tl, env, tl, tl)
+DEF_HELPER_3(rstsa16, tl, env, tl, tl)
+DEF_HELPER_3(urstsa16, tl, env, tl, tl)
+DEF_HELPER_3(kstsa16, tl, env, tl, tl)
+DEF_HELPER_3(ukstsa16, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 84080dd18c..8815e90476 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -592,3 +592,35 @@ vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
+
+# *** RV32P Extension ***
+add16      0100000  ..... ..... 000 ..... 1111111 @r
+radd16     0000000  ..... ..... 000 ..... 1111111 @r
+uradd16    0010000  ..... ..... 000 ..... 1111111 @r
+kadd16     0001000  ..... ..... 000 ..... 1111111 @r
+ukadd16    0011000  ..... ..... 000 ..... 1111111 @r
+sub16      0100001  ..... ..... 000 ..... 1111111 @r
+rsub16     0000001  ..... ..... 000 ..... 1111111 @r
+ursub16    0010001  ..... ..... 000 ..... 1111111 @r
+ksub16     0001001  ..... ..... 000 ..... 1111111 @r
+uksub16    0011001  ..... ..... 000 ..... 1111111 @r
+cras16     0100010  ..... ..... 000 ..... 1111111 @r
+rcras16    0000010  ..... ..... 000 ..... 1111111 @r
+urcras16   0010010  ..... ..... 000 ..... 1111111 @r
+kcras16    0001010  ..... ..... 000 ..... 1111111 @r
+ukcras16   0011010  ..... ..... 000 ..... 1111111 @r
+crsa16     0100011  ..... ..... 000 ..... 1111111 @r
+rcrsa16    0000011  ..... ..... 000 ..... 1111111 @r
+urcrsa16   0010011  ..... ..... 000 ..... 1111111 @r
+kcrsa16    0001011  ..... ..... 000 ..... 1111111 @r
+ukcrsa16   0011011  ..... ..... 000 ..... 1111111 @r
+stas16     1111010  ..... ..... 010 ..... 1111111 @r
+rstas16    1011010  ..... ..... 010 ..... 1111111 @r
+urstas16   1101010  ..... ..... 010 ..... 1111111 @r
+kstas16    1100010  ..... ..... 010 ..... 1111111 @r
+ukstas16   1110010  ..... ..... 010 ..... 1111111 @r
+stsa16     1111011  ..... ..... 010 ..... 1111111 @r
+rstsa16    1011011  ..... ..... 010 ..... 1111111 @r
+urstsa16   1101011  ..... ..... 010 ..... 1111111 @r
+kstsa16    1100011  ..... ..... 010 ..... 1111111 @r
+ukstsa16   1110011  ..... ..... 010 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
new file mode 100644
index 0000000000..0885a4fd45
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -0,0 +1,161 @@
+/*
+ * RISC-V translation routines for the RVP Standard Extension.
+ *
+ * Copyright (c) 2021 T-Head Semiconductor Co., Ltd. All rights reserved.
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
+#include "tcg/tcg-op-gvec.h"
+#include "tcg/tcg-gvec-desc.h"
+#include "tcg/tcg.h"
+
+/*
+ *** SIMD Data Processing Instructions
+ */
+
+/* 16-bit Addition & Subtraction Instructions */
+
+/*
+ * For some instructions, such as add16, an oberservation can be utilized:
+ * 1) If any reg is zero, it can be reduced to an inline op on the whole reg.
+ * 2) Otherwise, it can be acclebrated by an gvec op or an inline op.
+ */
+
+typedef void GenZeroFn(DisasContext *, arg_r *);
+typedef void GenNoZero32Fn(TCGv, TCGv, TCGv);
+typedef void GenNoZero64Fn(unsigned, uint32_t, uint32_t,
+                           uint32_t, uint32_t, uint32_t);
+
+static inline bool
+r_inline(DisasContext *ctx, arg_r *a, uint8_t vece,
+         GenNoZero64Fn *f64, GenNoZero32Fn *f32,
+         GenZeroFn *fn)
+{
+    if (!has_ext(ctx, RVP)) {
+        return false;
+    }
+    if (a->rd && a->rs1 && a->rs2) {
+#ifdef TARGET_RISCV64
+        f64(vece, offsetof(CPURISCVState, gpr[a->rd]),
+            offsetof(CPURISCVState, gpr[a->rs1]),
+            offsetof(CPURISCVState, gpr[a->rs2]),
+            8, 8);
+#else
+        f32(cpu_gpr[a->rd], cpu_gpr[a->rs1], cpu_gpr[a->rs2]);
+#endif
+    } else {
+        fn(ctx, a);
+    }
+    return true;
+}
+
+/* Complete inline implementation */
+#define GEN_RVP_R_INLINE(NAME, GSUF, VECE, FN)                     \
+static bool trans_##NAME(DisasContext *s, arg_r *a)                \
+{                                                                  \
+    return r_inline(s, a, VECE, tcg_gen_gvec_##GSUF,               \
+                    tcg_gen_simd_##NAME, (GenZeroFn *)FN);         \
+}                                                                  \
+
+static void tcg_gen_simd_add16(TCGv d, TCGv a, TCGv b)
+{
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+
+    tcg_gen_andi_tl(t1, a, ~0xffff);
+    tcg_gen_add_tl(t2, a, b);
+    tcg_gen_add_tl(t1, t1, b);
+    tcg_gen_deposit_tl(d, t1, t2, 0, 16);
+
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+}
+
+GEN_RVP_R_INLINE(add16, add, 1, trans_add);
+
+static void tcg_gen_simd_sub16(TCGv d, TCGv a, TCGv b)
+{
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+
+    tcg_gen_andi_tl(t1, b, ~0xffff);
+    tcg_gen_sub_tl(t2, a, b);
+    tcg_gen_sub_tl(t1, a, t1);
+    tcg_gen_deposit_tl(d, t1, t2, 0, 16);
+
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+}
+
+GEN_RVP_R_INLINE(sub16, sub, 1, trans_sub);
+
+/* Out of line helpers for R format packed instructions */
+typedef void gen_helper_rvp_r(TCGv, TCGv_ptr, TCGv, TCGv);
+
+static inline bool r_ool(DisasContext *ctx, arg_r *a, gen_helper_rvp_r *fn)
+{
+    TCGv src1, src2, dst;
+    if (!has_ext(ctx, RVP)) {
+        return false;
+    }
+
+    src1 = tcg_temp_new();
+    src2 = tcg_temp_new();
+    dst = tcg_temp_new();
+
+    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(src2, a->rs2);
+    fn(dst, cpu_env, src1, src2);
+    gen_set_gpr(a->rd, dst);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(src2);
+    tcg_temp_free(dst);
+    return true;
+}
+
+#define GEN_RVP_R_OOL(NAME)                            \
+static bool trans_##NAME(DisasContext *s, arg_r *a)    \
+{                                                      \
+    return r_ool(s, a, gen_helper_##NAME);             \
+}
+
+GEN_RVP_R_OOL(radd16);
+GEN_RVP_R_OOL(uradd16);
+GEN_RVP_R_OOL(kadd16);
+GEN_RVP_R_OOL(ukadd16);
+GEN_RVP_R_OOL(rsub16);
+GEN_RVP_R_OOL(ursub16);
+GEN_RVP_R_OOL(ksub16);
+GEN_RVP_R_OOL(uksub16);
+GEN_RVP_R_OOL(cras16);
+GEN_RVP_R_OOL(rcras16);
+GEN_RVP_R_OOL(urcras16);
+GEN_RVP_R_OOL(kcras16);
+GEN_RVP_R_OOL(ukcras16);
+GEN_RVP_R_OOL(crsa16);
+GEN_RVP_R_OOL(rcrsa16);
+GEN_RVP_R_OOL(urcrsa16);
+GEN_RVP_R_OOL(kcrsa16);
+GEN_RVP_R_OOL(ukcrsa16);
+GEN_RVP_R_OOL(stas16);
+GEN_RVP_R_OOL(rstas16);
+GEN_RVP_R_OOL(urstas16);
+GEN_RVP_R_OOL(kstas16);
+GEN_RVP_R_OOL(ukstas16);
+GEN_RVP_R_OOL(stsa16);
+GEN_RVP_R_OOL(rstsa16);
+GEN_RVP_R_OOL(urstsa16);
+GEN_RVP_R_OOL(kstsa16);
+GEN_RVP_R_OOL(ukstsa16);
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 14a5c62dac..d26a437ee8 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -21,6 +21,7 @@ riscv_ss.add(files(
   'gdbstub.c',
   'op_helper.c',
   'vector_helper.c',
+  'packed_helper.c',
   'translate.c',
 ))
 
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
new file mode 100644
index 0000000000..b84abaaf25
--- /dev/null
+++ b/target/riscv/packed_helper.c
@@ -0,0 +1,354 @@
+/*
+ * RISC-V P Extension Helpers for QEMU.
+ *
+ * Copyright (c) 2021 T-Head Semiconductor Co., Ltd. All rights reserved.
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
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "exec/cpu_ldst.h"
+#include "fpu/softfloat.h"
+#include <math.h>
+#include "internals.h"
+
+/*
+ *** SIMD Data Processing Instructions
+ */
+
+/* 16-bit Addition & Subtraction Instructions */
+typedef void PackedFn3i(CPURISCVState *, void *, void *, void *, uint8_t);
+
+/* Define a common function to loop elements in packed register */
+static inline target_ulong
+rvpr(CPURISCVState *env, target_ulong a, target_ulong b,
+     uint8_t step, uint8_t size, PackedFn3i *fn)
+{
+    int i, passes = sizeof(target_ulong) / size;
+    target_ulong result = 0;
+
+    for (i = 0; i < passes; i += step) {
+        fn(env, &result, &a, &b, i);
+    }
+    return result;
+}
+
+#define RVPR(NAME, STEP, SIZE)                                  \
+target_ulong HELPER(NAME)(CPURISCVState *env, target_ulong a,   \
+                          target_ulong b)                       \
+{                                                               \
+    return rvpr(env, a, b, STEP, SIZE, (PackedFn3i *)do_##NAME);\
+}
+
+static inline int32_t hadd32(int32_t a, int32_t b)
+{
+    return ((int64_t)a + b) >> 1;
+}
+
+static inline void do_radd16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+    d[i] = hadd32(a[i], b[i]);
+}
+
+RVPR(radd16, 1, 2);
+
+static inline uint32_t haddu32(uint32_t a, uint32_t b)
+{
+    return ((uint64_t)a + b) >> 1;
+}
+
+static inline void do_uradd16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[i] = haddu32(a[i], b[i]);
+}
+
+RVPR(uradd16, 1, 2);
+
+static inline void do_kadd16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+    d[i] = sadd16(env, 0, a[i], b[i]);
+}
+
+RVPR(kadd16, 1, 2);
+
+static inline void do_ukadd16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[i] = saddu16(env, 0, a[i], b[i]);
+}
+
+RVPR(ukadd16, 1, 2);
+
+static inline int32_t hsub32(int32_t a, int32_t b)
+{
+    return ((int64_t)a - b) >> 1;
+}
+
+static inline int64_t hsub64(int64_t a, int64_t b)
+{
+    int64_t res = a - b;
+    int64_t over = (res ^ a) & (a ^ b) & INT64_MIN;
+
+    /* With signed overflow, bit 64 is inverse of bit 63. */
+    return (res >> 1) ^ over;
+}
+
+static inline void do_rsub16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+    d[i] = hsub32(a[i], b[i]);
+}
+
+RVPR(rsub16, 1, 2);
+
+static inline uint64_t hsubu64(uint64_t a, uint64_t b)
+{
+    return (a - b) >> 1;
+}
+
+static inline void do_ursub16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[i] = hsubu64(a[i], b[i]);
+}
+
+RVPR(ursub16, 1, 2);
+
+static inline void do_ksub16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+    d[i] = ssub16(env, 0, a[i], b[i]);
+}
+
+RVPR(ksub16, 1, 2);
+
+static inline void do_uksub16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[i] = ssubu16(env, 0, a[i], b[i]);
+}
+
+RVPR(uksub16, 1, 2);
+
+static inline void do_cras16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = a[H2(i)] - b[H2(i + 1)];
+    d[H2(i + 1)] = a[H2(i + 1)] + b[H2(i)];
+}
+
+RVPR(cras16, 2, 2);
+
+static inline void do_rcras16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = hsub32(a[H2(i)], b[H2(i + 1)]);
+    d[H2(i + 1)] = hadd32(a[H2(i + 1)], b[H2(i)]);
+}
+
+RVPR(rcras16, 2, 2);
+
+static inline void do_urcras16(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = hsubu64(a[H2(i)], b[H2(i + 1)]);
+    d[H2(i + 1)] = haddu32(a[H2(i + 1)], b[H2(i)]);
+}
+
+RVPR(urcras16, 2, 2);
+
+static inline void do_kcras16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = ssub16(env, 0, a[H2(i)], b[H2(i + 1)]);
+    d[H2(i + 1)] = sadd16(env, 0, a[H2(i + 1)], b[H2(i)]);
+}
+
+RVPR(kcras16, 2, 2);
+
+static inline void do_ukcras16(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = ssubu16(env, 0, a[H2(i)], b[H2(i + 1)]);
+    d[H2(i + 1)] = saddu16(env, 0, a[H2(i + 1)], b[H2(i)]);
+}
+
+RVPR(ukcras16, 2, 2);
+
+static inline void do_crsa16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = a[H2(i)] + b[H2(i + 1)];
+    d[H2(i + 1)] = a[H2(i + 1)] - b[H2(i)];
+}
+
+RVPR(crsa16, 2, 2);
+
+static inline void do_rcrsa16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = hadd32(a[H2(i)], b[H2(i + 1)]);
+    d[H2(i + 1)] = hsub32(a[H2(i + 1)], b[H2(i)]);
+}
+
+RVPR(rcrsa16, 2, 2);
+
+static inline void do_urcrsa16(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = haddu32(a[H2(i)], b[H2(i + 1)]);
+    d[H2(i + 1)] = hsubu64(a[H2(i + 1)], b[H2(i)]);
+}
+
+RVPR(urcrsa16, 2, 2);
+
+static inline void do_kcrsa16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = sadd16(env, 0, a[H2(i)], b[H2(i + 1)]);
+    d[H2(i + 1)] = ssub16(env, 0, a[H2(i + 1)], b[H2(i)]);
+}
+
+RVPR(kcrsa16, 2, 2);
+
+static inline void do_ukcrsa16(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = saddu16(env, 0, a[H2(i)], b[H2(i + 1)]);
+    d[H2(i + 1)] = ssubu16(env, 0, a[H2(i + 1)], b[H2(i)]);
+}
+
+RVPR(ukcrsa16, 2, 2);
+
+static inline void do_stas16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = a[H2(i)] - b[H2(i)];
+    d[H2(i + 1)] = a[H2(i + 1)] + b[H2(i + 1)];
+}
+
+RVPR(stas16, 2, 2);
+
+static inline void do_rstas16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = hsub32(a[H2(i)], b[H2(i)]);
+    d[H2(i + 1)] = hadd32(a[H2(i + 1)], b[H2(i + 1)]);
+}
+
+RVPR(rstas16, 2, 2);
+
+static inline void do_urstas16(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = hsubu64(a[H2(i)], b[H2(i)]);
+    d[H2(i + 1)] = haddu32(a[H2(i + 1)], b[H2(i + 1)]);
+}
+
+RVPR(urstas16, 2, 2);
+
+static inline void do_kstas16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = ssub16(env, 0, a[H2(i)], b[H2(i)]);
+    d[H2(i + 1)] = sadd16(env, 0, a[H2(i + 1)], b[H2(i + 1)]);
+}
+
+RVPR(kstas16, 2, 2);
+
+static inline void do_ukstas16(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = ssubu16(env, 0, a[H2(i)], b[H2(i)]);
+    d[H2(i + 1)] = saddu16(env, 0, a[H2(i + 1)], b[H2(i + 1)]);
+}
+
+RVPR(ukstas16, 2, 2);
+
+static inline void do_stsa16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = a[H2(i)] + b[H2(i)];
+    d[H2(i + 1)] = a[H2(i + 1)] - b[H2(i + 1)];
+}
+
+RVPR(stsa16, 2, 2);
+
+static inline void do_rstsa16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = hadd32(a[H2(i)], b[H2(i)]);
+    d[H2(i + 1)] = hsub32(a[H2(i + 1)], b[H2(i + 1)]);
+}
+
+RVPR(rstsa16, 2, 2);
+
+static inline void do_urstsa16(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = haddu32(a[H2(i)], b[H2(i)]);
+    d[H2(i + 1)] = hsubu64(a[H2(i + 1)], b[H2(i + 1)]);
+}
+
+RVPR(urstsa16, 2, 2);
+
+static inline void do_kstsa16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = sadd16(env, 0, a[H2(i)], b[H2(i)]);
+    d[H2(i + 1)] = ssub16(env, 0, a[H2(i + 1)], b[H2(i + 1)]);
+}
+
+RVPR(kstsa16, 2, 2);
+
+static inline void do_ukstsa16(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[H2(i)] = saddu16(env, 0, a[H2(i)], b[H2(i)]);
+    d[H2(i + 1)] = ssubu16(env, 0, a[H2(i + 1)], b[H2(i + 1)]);
+}
+
+RVPR(ukstsa16, 2, 2);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index eb810efec6..f0a753f9c7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -766,6 +766,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvd.c.inc"
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
+#include "insn_trans/trans_rvp.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
-- 
2.17.1


