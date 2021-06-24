Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwN3j-0002PE-ID
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 06:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN3g-0002KF-PE; Thu, 24 Jun 2021 06:58:08 -0400
Received: from out28-73.mail.aliyun.com ([115.124.28.73]:59939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN3c-0004r5-J4; Thu, 24 Jun 2021 06:58:08 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.190706-0.0151726-0.794122;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXK21f1_1624532279; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXK21f1_1624532279)
 by smtp.aliyun-inc.com(10.147.40.233);
 Thu, 24 Jun 2021 18:57:59 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 03/37] target/riscv: 16-bit Addition & Subtraction
 Instructions
Date: Thu, 24 Jun 2021 18:54:47 +0800
Message-Id: <20210624105521.3964-4-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.73; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-73.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 24 Jun 2021 10:58:10 -0000

Include 5 groups: Wrap-around (dropping overflow), Signed Halving,
Unsigned Halving, Signed Saturation, and Unsigned Saturation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  30 ++
 target/riscv/insn32.decode              |  32 +++
 target/riscv/insn_trans/trans_rvp.c.inc | 117 ++++++++
 target/riscv/meson.build                |   1 +
 target/riscv/packed_helper.c            | 354 ++++++++++++++++++++++++
 target/riscv/translate.c                |   1 +
 6 files changed, 535 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvp.c.inc
 create mode 100644 target/riscv/packed_helper.c

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 415e37bc37..b6a71ade33 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1149,3 +1149,33 @@ DEF_HELPER_6(vcompress_vm_b, void, ptr, ptr, ptr, ptr, env, i32)
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
index f09f8d5faf..57f72fabf6 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -732,3 +732,35 @@ greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
 
 slli_uw    00001. ........... 001 ..... 0011011 @sh
+
+# *** RV32P Extension ***
+add16      0100000  ..... ..... 000 ..... 1110111 @r
+radd16     0000000  ..... ..... 000 ..... 1110111 @r
+uradd16    0010000  ..... ..... 000 ..... 1110111 @r
+kadd16     0001000  ..... ..... 000 ..... 1110111 @r
+ukadd16    0011000  ..... ..... 000 ..... 1110111 @r
+sub16      0100001  ..... ..... 000 ..... 1110111 @r
+rsub16     0000001  ..... ..... 000 ..... 1110111 @r
+ursub16    0010001  ..... ..... 000 ..... 1110111 @r
+ksub16     0001001  ..... ..... 000 ..... 1110111 @r
+uksub16    0011001  ..... ..... 000 ..... 1110111 @r
+cras16     0100010  ..... ..... 000 ..... 1110111 @r
+rcras16    0000010  ..... ..... 000 ..... 1110111 @r
+urcras16   0010010  ..... ..... 000 ..... 1110111 @r
+kcras16    0001010  ..... ..... 000 ..... 1110111 @r
+ukcras16   0011010  ..... ..... 000 ..... 1110111 @r
+crsa16     0100011  ..... ..... 000 ..... 1110111 @r
+rcrsa16    0000011  ..... ..... 000 ..... 1110111 @r
+urcrsa16   0010011  ..... ..... 000 ..... 1110111 @r
+kcrsa16    0001011  ..... ..... 000 ..... 1110111 @r
+ukcrsa16   0011011  ..... ..... 000 ..... 1110111 @r
+stas16     1111010  ..... ..... 010 ..... 1110111 @r
+rstas16    1011010  ..... ..... 010 ..... 1110111 @r
+urstas16   1101010  ..... ..... 010 ..... 1110111 @r
+kstas16    1100010  ..... ..... 010 ..... 1110111 @r
+ukstas16   1110010  ..... ..... 010 ..... 1110111 @r
+stsa16     1111011  ..... ..... 010 ..... 1110111 @r
+rstsa16    1011011  ..... ..... 010 ..... 1110111 @r
+urstsa16   1101011  ..... ..... 010 ..... 1110111 @r
+kstsa16    1100011  ..... ..... 010 ..... 1110111 @r
+ukstsa16   1110011  ..... ..... 010 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
new file mode 100644
index 0000000000..43f395657a
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -0,0 +1,117 @@
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
+ * 2) Otherwise, it can be acclebrated by an vec op.
+ */
+static inline bool
+r_inline(DisasContext *ctx, arg_r *a,
+         void (* vecop)(TCGv, TCGv, TCGv),
+         void (* op)(TCGv, TCGv, TCGv))
+{
+    if (!has_ext(ctx, RVP)) {
+        return false;
+    }
+    if (a->rd && a->rs1 && a->rs2) {
+        vecop(cpu_gpr[a->rd], cpu_gpr[a->rs1], cpu_gpr[a->rs2]);
+    } else {
+        gen_arith(ctx, a, op);
+    }
+    return true;
+}
+
+/* Complete inline implementation */
+#define GEN_RVP_R_INLINE(NAME, VECOP, OP)                \
+static bool trans_##NAME(DisasContext *s, arg_r *a)      \
+{                                                        \
+    return r_inline(s, a, VECOP, OP);                    \
+}
+
+GEN_RVP_R_INLINE(add16, tcg_gen_vec_add16_tl, tcg_gen_add_tl);
+GEN_RVP_R_INLINE(sub16, tcg_gen_vec_sub16_tl, tcg_gen_sub_tl);
+
+/* Out of line helpers for R format packed instructions */
+static inline bool
+r_ool(DisasContext *ctx, arg_r *a, void (* fn)(TCGv, TCGv_ptr, TCGv, TCGv))
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
index d5e0bc93ea..cc169e1b2c 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -17,6 +17,7 @@ riscv_ss.add(files(
   'op_helper.c',
   'vector_helper.c',
   'bitmanip_helper.c',
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
index 0e6ede4d71..51b144e9be 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -908,6 +908,7 @@ static bool gen_unary(DisasContext *ctx, arg_r2 *a,
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
+#include "insn_trans/trans_rvp.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
-- 
2.17.1


