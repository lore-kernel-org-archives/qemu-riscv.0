Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAair-0004BV-Dz
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaip-000491-Jr; Fri, 12 Feb 2021 10:51:07 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:48750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAain-0007o6-FQ; Fri, 12 Feb 2021 10:51:07 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436318|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.686433-0.0129696-0.300597;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHU4.g_1613145056; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHU4.g_1613145056)
 by smtp.aliyun-inc.com(10.147.42.241);
 Fri, 12 Feb 2021 23:50:57 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 23/38] target/riscv: 32-bit Multiply 64-bit Add/Subtract
 Instructions
Date: Fri, 12 Feb 2021 23:02:41 +0800
Message-Id: <20210212150256.885-24-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 15:51:07 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |   9 ++
 target/riscv/insn32.decode              |   9 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  63 ++++++++++
 target/riscv/packed_helper.c            | 155 ++++++++++++++++++++++++
 4 files changed, 236 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index cce4c8cbcc..4d89417287 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1338,3 +1338,12 @@ DEF_HELPER_3(rsub64, i64, env, i64, i64)
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
index b52e1c1142..60b8b3617b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -808,3 +808,12 @@ rsub64     1000001  ..... ..... 001 ..... 1111111 @r
 ursub64    1010001  ..... ..... 001 ..... 1111111 @r
 ksub64     1001001  ..... ..... 001 ..... 1111111 @r
 uksub64    1011001  ..... ..... 001 ..... 1111111 @r
+
+smar64     1000010  ..... ..... 001 ..... 1111111 @r
+smsr64     1000011  ..... ..... 001 ..... 1111111 @r
+umar64     1010010  ..... ..... 001 ..... 1111111 @r
+umsr64     1010011  ..... ..... 001 ..... 1111111 @r
+kmar64     1001010  ..... ..... 001 ..... 1111111 @r
+kmsr64     1001011  ..... ..... 001 ..... 1111111 @r
+ukmar64    1011010  ..... ..... 001 ..... 1111111 @r
+ukmsr64    1011011  ..... ..... 001 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 94e5e09425..3e62024aac 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -742,3 +742,66 @@ GEN_RVP_R_D64_S64_S64_OOL(rsub64);
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
+#ifdef TARGET_RISCV64
+    return r_acc_ool(ctx, a, fn);
+#else
+    TCGv_i32 src1, src2;
+    TCGv_i64 dst, src3;
+    TCGv_i32 d0, d1;
+
+    if (!has_ext(ctx, RVP) || !ctx->ext_p64) {
+        return false;
+    }
+
+    src1 = tcg_temp_new_i32();
+    src2 = tcg_temp_new_i32();
+    src3 = tcg_temp_new_i64();
+    dst = tcg_temp_new_i64();
+    d0 = tcg_temp_new_i32();
+    d1 = tcg_temp_new_i32();
+
+    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(src2, a->rs2);
+    gen_get_gpr(d0, a->rd);
+    gen_get_gpr(d1, a->rd + 1);
+    tcg_gen_concat_i32_i64(src3, d0, d1);
+
+    fn(dst, cpu_env, src1, src2, src3);
+
+    tcg_gen_extrl_i64_i32(d0, dst);
+    tcg_gen_extrh_i64_i32(d1, dst);
+    gen_set_gpr(a->rd, d0);
+    gen_set_gpr(a->rd + 1, d1);
+
+    tcg_temp_free_i32(d0);
+    tcg_temp_free_i32(d1);
+    tcg_temp_free_i32(src1);
+    tcg_temp_free_i32(src2);
+    tcg_temp_free_i64(src3);
+    tcg_temp_free_i64(dst);
+    return true;
+#endif
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
index 0629c5178b..3cbe9e51cc 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -2229,3 +2229,158 @@ static inline void do_uksub64(CPURISCVState *env, void *vd, void *va,
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
+#ifdef TARGET_RISCV64
+    int64_t m1 =  (int64_t)a[H4(i + 1)] * b[H4(i + 1)];
+    if (a[H4(i)] == INT32_MIN && b[H4(i)] == INT32_MIN &&
+        a[H4(i + 1)] == INT32_MIN && b[H4(i + 1)] == INT32_MIN) {
+        if (*c >= 0) {
+            *d = INT64_MAX;
+            env->vxsat = 1;
+        } else {
+            *d = sadd64(env, 0, *c + m0, m1);
+        }
+    } else {
+        *d = sadd64(env, 0, *c, m0 + m1);
+    }
+#else
+    *d = sadd64(env, 0, *c, m0);
+#endif
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
+#ifdef TARGET_RISCV64
+    int64_t m1 =  (int64_t)a[H4(i + 1)] * b[H4(i + 1)];
+    if (a[H4(i)] == INT32_MIN && b[H4(i)] == INT32_MIN &&
+        a[H4(i + 1)] == INT32_MIN && b[H4(i + 1)] == INT32_MIN) {
+        if (*c <= 0) {
+            *d = INT64_MIN;
+            env->vxsat = 1;
+        } else {
+            *d = ssub64(env, 0, *c - m0, m1);
+        }
+    } else {
+        *d = ssub64(env, 0, *c, m0 + m1);
+    }
+#else
+    *d = ssub64(env, 0, *c, m0);
+#endif
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


