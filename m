Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAahD-0002NU-Ai
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAahB-0002JQ-7h; Fri, 12 Feb 2021 10:49:25 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:45938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAagv-0006tj-OT; Fri, 12 Feb 2021 10:49:25 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436347|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.580839-0.0112157-0.407945;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHP8C9_1613144936; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHP8C9_1613144936)
 by smtp.aliyun-inc.com(10.147.40.233);
 Fri, 12 Feb 2021 23:48:56 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 22/38] target/riscv: 64-bit Add/Subtract Instructions
Date: Fri, 12 Feb 2021 23:02:40 +0800
Message-Id: <20210212150256.885-23-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 15:49:25 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  11 ++
 target/riscv/insn32.decode              |  11 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  72 +++++++++++++
 target/riscv/packed_helper.c            | 132 ++++++++++++++++++++++++
 4 files changed, 226 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 0ddd07b305..cce4c8cbcc 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1327,3 +1327,14 @@ DEF_HELPER_4(pbsada, tl, env, tl, tl, tl)
 DEF_HELPER_4(smaqa, tl, env, tl, tl, tl)
 DEF_HELPER_4(umaqa, tl, env, tl, tl, tl)
 DEF_HELPER_4(smaqa_su, tl, env, tl, tl, tl)
+
+DEF_HELPER_3(add64, i64, env, i64, i64)
+DEF_HELPER_3(radd64, i64, env, i64, i64)
+DEF_HELPER_3(uradd64, i64, env, i64, i64)
+DEF_HELPER_3(kadd64, i64, env, i64, i64)
+DEF_HELPER_3(ukadd64, i64, env, i64, i64)
+DEF_HELPER_3(sub64, i64, env, i64, i64)
+DEF_HELPER_3(rsub64, i64, env, i64, i64)
+DEF_HELPER_3(ursub64, i64, env, i64, i64)
+DEF_HELPER_3(ksub64, i64, env, i64, i64)
+DEF_HELPER_3(uksub64, i64, env, i64, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6a50abca21..b52e1c1142 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -797,3 +797,14 @@ pbsada     1111111  ..... ..... 000 ..... 1111111 @r
 smaqa      1100100  ..... ..... 000 ..... 1111111 @r
 umaqa      1100110  ..... ..... 000 ..... 1111111 @r
 smaqa_su   1100101  ..... ..... 000 ..... 1111111 @r
+
+add64      1100000  ..... ..... 001 ..... 1111111 @r
+radd64     1000000  ..... ..... 001 ..... 1111111 @r
+uradd64    1010000  ..... ..... 001 ..... 1111111 @r
+kadd64     1001000  ..... ..... 001 ..... 1111111 @r
+ukadd64    1011000  ..... ..... 001 ..... 1111111 @r
+sub64      1100001  ..... ..... 001 ..... 1111111 @r
+rsub64     1000001  ..... ..... 001 ..... 1111111 @r
+ursub64    1010001  ..... ..... 001 ..... 1111111 @r
+ksub64     1001001  ..... ..... 001 ..... 1111111 @r
+uksub64    1011001  ..... ..... 001 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 0877cd04b4..94e5e09425 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -670,3 +670,75 @@ GEN_RVP_R_ACC_OOL(pbsada);
 GEN_RVP_R_ACC_OOL(smaqa);
 GEN_RVP_R_ACC_OOL(umaqa);
 GEN_RVP_R_ACC_OOL(smaqa_su);
+
+/*
+ *** 64-bit Profile Instructions
+ */
+/* 64-bit Addition & Subtraction Instructions */
+static bool
+r_d64_s64_s64_ool(DisasContext *ctx, arg_r *a,
+                  void (* fn)(TCGv_i64, TCGv_ptr, TCGv_i64, TCGv_i64))
+{
+#ifdef TARGET_RISCV64
+    return r_ool(ctx, a, fn);
+#else
+    TCGv a0, a1, b0, b1, d0, d1;
+    TCGv_i64 src1, src2, dst;
+
+    if (!has_ext(ctx, RVP) || !ctx->ext_p64) {
+        return false;
+    }
+
+    src1 = tcg_temp_new_i64();
+    src2 = tcg_temp_new_i64();
+    dst = tcg_temp_new_i64();
+    a0 = tcg_temp_new_i32();
+    a1 = tcg_temp_new_i32();
+    b0 = tcg_temp_new_i32();
+    b1 = tcg_temp_new_i32();
+
+    gen_get_gpr(a0, a->rs1);
+    gen_get_gpr(a1, a->rs1 + 1);
+    tcg_gen_concat_i32_i64(src1, a0, a1);
+    gen_get_gpr(b0, a->rs2);
+    gen_get_gpr(b1, a->rs2 + 1);
+    tcg_gen_concat_i32_i64(src2, b0, b1);
+
+    fn(dst, cpu_env, src1, src2);
+
+    d0 = tcg_temp_new_i32();
+    d1 = tcg_temp_new_i32();
+    tcg_gen_extrl_i64_i32(d0, dst);
+    tcg_gen_extrh_i64_i32(d1, dst);
+    gen_set_gpr(a->rd, d0);
+    gen_set_gpr(a->rd + 1, d1);
+    tcg_temp_free_i32(d0);
+    tcg_temp_free_i32(d1);
+
+    tcg_temp_free_i64(src1);
+    tcg_temp_free_i64(src2);
+    tcg_temp_free_i64(dst);
+    tcg_temp_free_i32(a0);
+    tcg_temp_free_i32(a1);
+    tcg_temp_free_i32(b0);
+    tcg_temp_free_i32(b1);
+    return true;
+#endif
+}
+
+#define GEN_RVP_R_D64_S64_S64_OOL(NAME)                   \
+static bool trans_##NAME(DisasContext *s, arg_r *a)       \
+{                                                         \
+    return r_d64_s64_s64_ool(s, a, gen_helper_##NAME);    \
+}
+
+GEN_RVP_R_D64_S64_S64_OOL(add64);
+GEN_RVP_R_D64_S64_S64_OOL(radd64);
+GEN_RVP_R_D64_S64_S64_OOL(uradd64);
+GEN_RVP_R_D64_S64_S64_OOL(kadd64);
+GEN_RVP_R_D64_S64_S64_OOL(ukadd64);
+GEN_RVP_R_D64_S64_S64_OOL(sub64);
+GEN_RVP_R_D64_S64_S64_OOL(rsub64);
+GEN_RVP_R_D64_S64_S64_OOL(ursub64);
+GEN_RVP_R_D64_S64_S64_OOL(ksub64);
+GEN_RVP_R_D64_S64_S64_OOL(uksub64);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 02a0f912e9..0629c5178b 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -2097,3 +2097,135 @@ static inline void do_smaqa_su(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR_ACC(smaqa_su, 1, 4);
+
+/*
+ *** 64-bit Profile Instructions
+ */
+/* 64-bit Addition & Subtraction Instructions */
+
+/* Define a common function to loop elements in packed register */
+static inline uint64_t
+rvpr64_64_64(CPURISCVState *env, uint64_t a, uint64_t b,
+             uint8_t step, uint8_t size, PackedFn3i *fn)
+{
+    int i, passes = sizeof(uint64_t) / size;
+    uint64_t result = 0;
+
+    for (i = 0; i < passes; i += step) {
+        fn(env, &result, &a, &b, i);
+    }
+    return result;
+}
+
+#define RVPR64_64_64(NAME, STEP, SIZE)                                    \
+uint64_t HELPER(NAME)(CPURISCVState *env, uint64_t a, uint64_t b)         \
+{                                                                         \
+    return rvpr64_64_64(env, a, b, STEP, SIZE, (PackedFn3i *)do_##NAME);  \
+}
+
+static inline void do_add64(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int64_t *d = vd, *a = va, *b = vb;
+    *d = *a + *b;
+}
+
+RVPR64_64_64(add64, 1, 8);
+
+static inline int64_t hadd64(int64_t a, int64_t b)
+{
+    int64_t res = a + b;
+    int64_t over = (res ^ a) & (res ^ b) & INT64_MIN;
+
+    /* With signed overflow, bit 64 is inverse of bit 63. */
+    return (res >> 1) ^ over;
+}
+
+static inline void do_radd64(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int64_t *d = vd, *a = va, *b = vb;
+    *d = hadd64(*a, *b);
+}
+
+RVPR64_64_64(radd64, 1, 8);
+
+static inline uint64_t haddu64(uint64_t a, uint64_t b)
+{
+    uint64_t res = a + b;
+    bool over = res < a;
+
+    return over ? ((res >> 1) | INT64_MIN) : (res >> 1);
+}
+
+static inline void do_uradd64(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    uint64_t *d = vd, *a = va, *b = vb;
+    *d = haddu64(*a, *b);
+}
+
+RVPR64_64_64(uradd64, 1, 8);
+
+static inline void do_kadd64(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int64_t *d = vd, *a = va, *b = vb;
+    *d = sadd64(env, 0, *a, *b);
+}
+
+RVPR64_64_64(kadd64, 1, 8);
+
+static inline void do_ukadd64(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    uint64_t *d = vd, *a = va, *b = vb;
+    *d = saddu64(env, 0, *a, *b);
+}
+
+RVPR64_64_64(ukadd64, 1, 8);
+
+static inline void do_sub64(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int64_t *d = vd, *a = va, *b = vb;
+    *d = *a - *b;
+}
+
+RVPR64_64_64(sub64, 1, 8);
+
+static inline void do_rsub64(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int64_t *d = vd, *a = va, *b = vb;
+    *d = hsub64(*a, *b);
+}
+
+RVPR64_64_64(rsub64, 1, 8);
+
+static inline void do_ursub64(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    uint64_t *d = vd, *a = va, *b = vb;
+    *d = hsubu64(*a, *b);
+}
+
+RVPR64_64_64(ursub64, 1, 8);
+
+static inline void do_ksub64(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int64_t *d = vd, *a = va, *b = vb;
+    *d = ssub64(env, 0, *a, *b);
+}
+
+RVPR64_64_64(ksub64, 1, 8);
+
+static inline void do_uksub64(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    uint64_t *d = vd, *a = va, *b = vb;
+    *d = ssubu64(env, 0, *a, *b);
+}
+
+RVPR64_64_64(uksub64, 1, 8);
-- 
2.17.1


