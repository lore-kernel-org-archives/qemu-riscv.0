Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAaJU-0000vx-Us
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaJT-0000uT-T2; Fri, 12 Feb 2021 10:24:55 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:53867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaJR-0004ls-63; Fri, 12 Feb 2021 10:24:55 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436735|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.455593-9.71752e-05-0.54431;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYGrQrZ_1613143486; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYGrQrZ_1613143486)
 by smtp.aliyun-inc.com(10.147.42.22); Fri, 12 Feb 2021 23:24:46 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 10/38] target/riscv: SIMD 16-bit Multiply Instructions
Date: Fri, 12 Feb 2021 23:02:28 +0800
Message-Id: <20210212150256.885-11-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 15:24:56 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |   7 ++
 target/riscv/insn32.decode              |   7 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  53 ++++++++++++
 target/riscv/packed_helper.c            | 104 ++++++++++++++++++++++++
 4 files changed, 171 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 4d9c36609c..bc60712bd9 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1214,3 +1214,10 @@ DEF_HELPER_3(scmplt8, tl, env, tl, tl)
 DEF_HELPER_3(scmple8, tl, env, tl, tl)
 DEF_HELPER_3(ucmplt8, tl, env, tl, tl)
 DEF_HELPER_3(ucmple8, tl, env, tl, tl)
+
+DEF_HELPER_3(smul16, i64, env, tl, tl)
+DEF_HELPER_3(smulx16, i64, env, tl, tl)
+DEF_HELPER_3(umul16, i64, env, tl, tl)
+DEF_HELPER_3(umulx16, i64, env, tl, tl)
+DEF_HELPER_3(khm16, tl, env, tl, tl)
+DEF_HELPER_3(khmx16, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7519df7e20..38519a477c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -681,3 +681,10 @@ scmplt8    0000111  ..... ..... 000 ..... 1111111 @r
 scmple8    0001111  ..... ..... 000 ..... 1111111 @r
 ucmplt8    0010111  ..... ..... 000 ..... 1111111 @r
 ucmple8    0011111  ..... ..... 000 ..... 1111111 @r
+
+smul16     1010000  ..... ..... 000 ..... 1111111 @r
+smulx16    1010001  ..... ..... 000 ..... 1111111 @r
+umul16     1011000  ..... ..... 000 ..... 1111111 @r
+umulx16    1011001  ..... ..... 000 ..... 1111111 @r
+khm16      1000011  ..... ..... 000 ..... 1111111 @r
+khmx16     1001011  ..... ..... 000 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 6eb9e83c6f..7e5bf9041d 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -383,3 +383,56 @@ GEN_RVP_R_OOL(scmplt8);
 GEN_RVP_R_OOL(scmple8);
 GEN_RVP_R_OOL(ucmplt8);
 GEN_RVP_R_OOL(ucmple8);
+
+/* SIMD 16-bit Multiply Instructions */
+static inline bool
+r_d64_ool(DisasContext *ctx, arg_r *a,
+          void (* fn)(TCGv_i64, TCGv_ptr, TCGv, TCGv))
+{
+#ifdef TARGET_RISCV64
+    return r_ool(ctx, a, fn);
+#else
+    TCGv src1, src2;
+    TCGv_i64 dst;
+    TCGv_i32 low, high;
+
+    if (!has_ext(ctx, RVP) || !ctx->ext_p64) {
+        return false;
+    }
+
+    src1 = tcg_temp_new();
+    src2 = tcg_temp_new();
+    dst = tcg_temp_new_i64();
+
+    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(src2, a->rs2);
+    fn(dst, cpu_env, src1, src2);
+
+    low = tcg_temp_new_i32();
+    high = tcg_temp_new_i32();
+    tcg_gen_extrl_i64_i32(low, dst);
+    tcg_gen_extrh_i64_i32(high, dst);
+    gen_set_gpr(a->rd, low);
+    gen_set_gpr(a->rd + 1, high);
+    tcg_temp_free_i32(low);
+    tcg_temp_free_i32(high);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(src2);
+    tcg_temp_free_i64(dst);
+    return true;
+#endif
+}
+
+#define GEN_RVP_R_D64_OOL(NAME)                        \
+static bool trans_##NAME(DisasContext *s, arg_r *a)    \
+{                                                      \
+    return r_d64_ool(s, a, gen_helper_##NAME);         \
+}
+
+GEN_RVP_R_D64_OOL(smul16);
+GEN_RVP_R_D64_OOL(smulx16);
+GEN_RVP_R_D64_OOL(umul16);
+GEN_RVP_R_D64_OOL(umulx16);
+GEN_RVP_R_OOL(khm16);
+GEN_RVP_R_OOL(khmx16);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index ff86e015e4..13fed2c4d1 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -723,3 +723,107 @@ static inline void do_ucmple8(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(ucmple8, 1, 1);
+
+/* SIMD 16-bit Multiply Instructions */
+typedef void PackedFn3(CPURISCVState *, void *, void *, void *);
+static inline uint64_t rvpr64(CPURISCVState *env, target_ulong a,
+                              target_ulong b, PackedFn3 *fn)
+{
+    uint64_t result;
+
+    fn(env, &result, &a, &b);
+    return result;
+}
+
+#define RVPR64(NAME)                                            \
+uint64_t HELPER(NAME)(CPURISCVState *env, target_ulong a,       \
+                      target_ulong b)                           \
+{                                                               \
+    return rvpr64(env, a, b, (PackedFn3 *)do_##NAME);           \
+}
+
+static inline void do_smul16(CPURISCVState *env, void *vd, void *va, void *vb)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    d[H4(0)] = (int32_t)a[H2(0)] * b[H2(0)];
+    d[H4(1)] = (int32_t)a[H2(1)] * b[H2(1)];
+}
+
+RVPR64(smul16);
+
+static inline void do_smulx16(CPURISCVState *env, void *vd, void *va, void *vb)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    d[H4(0)] = (int32_t)a[H2(0)] * b[H2(1)];
+    d[H4(1)] = (int32_t)a[H2(1)] * b[H2(0)];
+}
+
+RVPR64(smulx16);
+
+static inline void do_umul16(CPURISCVState *env, void *vd, void *va, void *vb,
+                             uint8_t i)
+{
+    uint32_t *d = vd;
+    uint16_t *a = va, *b = vb;
+    d[H4(0)] = (uint32_t)a[H2(0)] * b[H2(0)];
+    d[H4(1)] = (uint32_t)a[H2(1)] * b[H2(1)];
+}
+
+RVPR64(umul16);
+
+static inline void do_umulx16(CPURISCVState *env, void *vd, void *va, void *vb,
+                              uint8_t i)
+{
+    uint32_t *d = vd;
+    uint16_t *a = va, *b = vb;
+    d[H4(0)] = (uint32_t)a[H2(0)] * b[H2(1)];
+    d[H4(1)] = (uint32_t)a[H2(1)] * b[H2(0)];
+}
+
+RVPR64(umulx16);
+
+static inline void do_khm16(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+
+    if (a[i] == INT16_MIN && b[i] == INT16_MIN) {
+        env->vxsat = 1;
+        d[i] = INT16_MAX;
+    } else {
+        d[i] = (int32_t)a[i] * b[i] >> 15;
+    }
+}
+
+RVPR(khm16, 1, 2);
+
+static inline void do_khmx16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+
+    /*
+     * t[x] = ra.H[x] s* rb.H[y];
+     * rt.H[x] = SAT.Q15(t[x] s>> 15);
+     *
+     * (RV32: (x,y)=(1,0),(0,1),
+     *  RV64: (x,y)=(3,2),(2,3),
+     *              (1,0),(0,1)
+     */
+    if (a[H2(i)] == INT16_MIN && b[H2(i + 1)] == INT16_MIN) {
+        env->vxsat = 1;
+        d[H2(i)] = INT16_MAX;
+    } else {
+        d[H2(i)] = (int32_t)a[H2(i)] * b[H2(i + 1)] >> 15;
+    }
+    if (a[H2(i + 1)] == INT16_MIN && b[H2(i)] == INT16_MIN) {
+        env->vxsat = 1;
+        d[H2(i + 1)] = INT16_MAX;
+    } else {
+        d[H2(i + 1)] = (int32_t)a[H2(i + 1)] * b[H2(i)] >> 15;
+    }
+}
+
+RVPR(khmx16, 2, 2);
-- 
2.17.1


