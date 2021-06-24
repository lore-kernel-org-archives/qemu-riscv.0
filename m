Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwND5-0004LF-Vz
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 07:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwND2-0004Fm-A0; Thu, 24 Jun 2021 07:07:48 -0400
Received: from out28-98.mail.aliyun.com ([115.124.28.98]:58762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNCx-0004Nk-JA; Thu, 24 Jun 2021 07:07:48 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07608557|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.686434-0.0129696-0.300597;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXKIqSD_1624532857; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKIqSD_1624532857) by smtp.aliyun-inc.com(10.147.40.7);
 Thu, 24 Jun 2021 19:07:38 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 22/37] target/riscv: 32-bit Multiply 64-bit Add/Subtract
 Instructions
Date: Thu, 24 Jun 2021 18:55:06 +0800
Message-Id: <20210624105521.3964-23-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.98; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-98.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 24 Jun 2021 11:07:48 -0000

32x32 multiply as an operand for 64-bit add/subtract operation
with saturation or not.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |   9 ++
 target/riscv/insn32.decode              |   9 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  67 ++++++++++
 target/riscv/packed_helper.c            | 155 ++++++++++++++++++++++++
 4 files changed, 240 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 192ef42d2a..c3c086bed0 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1341,3 +1341,12 @@ DEF_HELPER_3(rsub64, i64, env, i64, i64)
 DEF_HELPER_3(ursub64, i64, env, i64, i64)
 DEF_HELPER_3(ksub64, i64, env, i64, i64)
 DEF_HELPER_3(uksub64, i64, env, i64, i64)
+
+DEF_HELPER_4(smar64, i64, env, tl, tl, i64)
+DEF_HELPER_4(smsr64, i64, env, tl, tl, i64)
+DEF_HELPER_4(umar64, i64, env, tl, tl, i64)
+DEF_HELPER_4(umsr64, i64, env, tl, tl, i64)
+DEF_HELPER_4(kmar64, i64, env, tl, tl, i64)
+DEF_HELPER_4(kmsr64, i64, env, tl, tl, i64)
+DEF_HELPER_4(ukmar64, i64, env, tl, tl, i64)
+DEF_HELPER_4(ukmsr64, i64, env, tl, tl, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 5156fa060e..5d123bbb97 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -944,3 +944,12 @@ rsub64     1000001  ..... ..... 001 ..... 1110111 @r
 ursub64    1010001  ..... ..... 001 ..... 1110111 @r
 ksub64     1001001  ..... ..... 001 ..... 1110111 @r
 uksub64    1011001  ..... ..... 001 ..... 1110111 @r
+
+smar64     1000010  ..... ..... 001 ..... 1110111 @r
+smsr64     1000011  ..... ..... 001 ..... 1110111 @r
+umar64     1010010  ..... ..... 001 ..... 1110111 @r
+umsr64     1010011  ..... ..... 001 ..... 1110111 @r
+kmar64     1001010  ..... ..... 001 ..... 1110111 @r
+kmsr64     1001011  ..... ..... 001 ..... 1110111 @r
+ukmar64    1011010  ..... ..... 001 ..... 1110111 @r
+ukmsr64    1011011  ..... ..... 001 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index e04c79931d..63b6810227 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -590,3 +590,70 @@ GEN_RVP_R_D64_S64_S64_OOL(rsub64);
 GEN_RVP_R_D64_S64_S64_OOL(ursub64);
 GEN_RVP_R_D64_S64_S64_OOL(ksub64);
 GEN_RVP_R_D64_S64_S64_OOL(uksub64);
+
+/* 32-bit Multiply with 64-bit Add/Subtract Instructions */
+
+/* Function to accumulate 64bit destination register */
+static bool
+r_d64_acc_ool(DisasContext *ctx, arg_r *a,
+              void (* fn)(TCGv_i64, TCGv_ptr, TCGv, TCGv, TCGv_i64))
+{
+    TCGv src1, src2;
+    TCGv_i64 dst, src3;
+
+    if (!has_ext(ctx, RVP) || !ctx->ext_psfoperand) {
+        return false;
+    }
+
+    src1 = tcg_temp_new();
+    src2 = tcg_temp_new();
+    src3 = tcg_temp_new_i64();
+    dst = tcg_temp_new_i64();
+
+    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(src2, a->rs2);
+
+    if (is_32bit(ctx)) {
+        TCGv t0, t1;
+        t0 = tcg_temp_new();
+        t1 = tcg_temp_new();
+
+        gen_get_gpr(t0, a->rd);
+        gen_get_gpr(t1, a->rd + 1);
+        tcg_gen_concat_tl_i64(src3, t0, t1);
+        tcg_temp_free(t0);
+        tcg_temp_free(t1);
+    } else {
+        TCGv t0;
+        t0 = tcg_temp_new();
+
+        gen_get_gpr(t0, a->rd);
+        tcg_gen_ext_tl_i64(src3, t0);
+        tcg_temp_free(t0);
+    }
+
+    fn(dst, cpu_env, src1, src2, src3);
+
+    set_pair_regs(ctx, dst, a->rd);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(src2);
+    tcg_temp_free_i64(src3);
+    tcg_temp_free_i64(dst);
+    return true;
+}
+
+#define GEN_RVP_R_D64_ACC_OOL(NAME)                    \
+static bool trans_##NAME(DisasContext *s, arg_r *a)    \
+{                                                      \
+    return r_d64_acc_ool(s, a, gen_helper_##NAME);     \
+}
+
+GEN_RVP_R_D64_ACC_OOL(smar64);
+GEN_RVP_R_D64_ACC_OOL(smsr64);
+GEN_RVP_R_D64_ACC_OOL(umar64);
+GEN_RVP_R_D64_ACC_OOL(umsr64);
+GEN_RVP_R_D64_ACC_OOL(kmar64);
+GEN_RVP_R_D64_ACC_OOL(kmsr64);
+GEN_RVP_R_D64_ACC_OOL(ukmar64);
+GEN_RVP_R_D64_ACC_OOL(ukmsr64);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index b8be234d97..59a06c604d 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -2220,3 +2220,158 @@ static inline void do_uksub64(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR64_64_64(uksub64, 1, 8);
+
+/* 32-bit Multiply with 64-bit Add/Subtract Instructions */
+static inline uint64_t
+rvpr64_acc(CPURISCVState *env, target_ulong a,
+           target_ulong b, uint64_t c,
+           uint8_t step, uint8_t size, PackedFn4i *fn)
+{
+    int i, passes = sizeof(target_ulong) / size;
+    uint64_t result = 0;
+
+    for (i = 0; i < passes; i += step) {
+        fn(env, &result, &a, &b, &c, i);
+    }
+    return result;
+}
+
+#define RVPR64_ACC(NAME, STEP, SIZE)                                     \
+uint64_t HELPER(NAME)(CPURISCVState *env, target_ulong a,                \
+                      target_ulong b, uint64_t c)                        \
+{                                                                        \
+    return rvpr64_acc(env, a, b, c, STEP, SIZE, (PackedFn4i *)do_##NAME);\
+}
+
+static inline void do_smar64(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int32_t *a = va, *b = vb;
+    int64_t *d = vd, *c = vc;
+    if (i == 0) {
+        *d = *c;
+    }
+    *d += (int64_t)a[H4(i)] * b[H4(i)];
+}
+
+RVPR64_ACC(smar64, 1, 4);
+
+static inline void do_smsr64(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int32_t *a = va, *b = vb;
+    int64_t *d = vd, *c = vc;
+    if (i == 0) {
+        *d = *c;
+    }
+    *d -= (int64_t)a[H4(i)] * b[H4(i)];
+}
+
+RVPR64_ACC(smsr64, 1, 4);
+
+static inline void do_umar64(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    uint32_t *a = va, *b = vb;
+    uint64_t *d = vd, *c = vc;
+    if (i == 0) {
+        *d = *c;
+    }
+    *d += (uint64_t)a[H4(i)] * b[H4(i)];
+}
+
+RVPR64_ACC(umar64, 1, 4);
+
+static inline void do_umsr64(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    uint32_t *a = va, *b = vb;
+    uint64_t *d = vd, *c = vc;
+    if (i == 0) {
+        *d = *c;
+    }
+    *d -= (uint64_t)a[H4(i)] * b[H4(i)];
+}
+
+RVPR64_ACC(umsr64, 1, 4);
+
+static inline void do_kmar64(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int32_t *a = va, *b = vb;
+    int64_t *d = vd, *c = vc;
+    int64_t m0 =  (int64_t)a[H4(i)] * b[H4(i)];
+    if (!riscv_cpu_is_32bit(env)) {
+        int64_t m1 =  (int64_t)a[H4(i + 1)] * b[H4(i + 1)];
+        if (a[H4(i)] == INT32_MIN && b[H4(i)] == INT32_MIN &&
+            a[H4(i + 1)] == INT32_MIN && b[H4(i + 1)] == INT32_MIN) {
+            if (*c >= 0) {
+                *d = INT64_MAX;
+                env->vxsat = 1;
+            } else {
+                *d = sadd64(env, 0, *c + m0, m1);
+            }
+        } else {
+            *d = sadd64(env, 0, *c, m0 + m1);
+        }
+    } else {
+        *d = sadd64(env, 0, *c, m0);
+    }
+}
+
+RVPR64_ACC(kmar64, 1, sizeof(target_ulong));
+
+static inline void do_kmsr64(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int32_t *a = va, *b = vb;
+    int64_t *d = vd, *c = vc;
+
+    int64_t m0 =  (int64_t)a[H4(i)] * b[H4(i)];
+    if (!riscv_cpu_is_32bit(env)) {
+        int64_t m1 =  (int64_t)a[H4(i + 1)] * b[H4(i + 1)];
+        if (a[H4(i)] == INT32_MIN && b[H4(i)] == INT32_MIN &&
+            a[H4(i + 1)] == INT32_MIN && b[H4(i + 1)] == INT32_MIN) {
+            if (*c <= 0) {
+                *d = INT64_MIN;
+                env->vxsat = 1;
+            } else {
+                *d = ssub64(env, 0, *c - m0, m1);
+            }
+        } else {
+            *d = ssub64(env, 0, *c, m0 + m1);
+        }
+    } else {
+        *d = ssub64(env, 0, *c, m0);
+    }
+}
+
+RVPR64_ACC(kmsr64, 1, sizeof(target_ulong));
+
+static inline void do_ukmar64(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    uint32_t *a = va, *b = vb;
+    uint64_t *d = vd, *c = vc;
+
+    if (i == 0) {
+        *d = *c;
+    }
+    *d = saddu64(env, 0, *d, (uint64_t)a[H4(i)] * b[H4(i)]);
+}
+
+RVPR64_ACC(ukmar64, 1, 4);
+
+static inline void do_ukmsr64(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    uint32_t *a = va, *b = vb;
+    uint64_t *d = vd, *c = vc;
+
+    if (i == 0) {
+        *d = *c;
+    }
+    *d = ssubu64(env, 0, *d, (uint64_t)a[i] * b[i]);
+}
+
+RVPR64_ACC(ukmsr64, 1, 4);
-- 
2.17.1


