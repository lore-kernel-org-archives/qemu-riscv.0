Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrFlP-0003e4-Pg
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 04:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFlK-0003YW-Pe; Thu, 10 Jun 2021 04:10:02 -0400
Received: from out28-49.mail.aliyun.com ([115.124.28.49]:32989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFlI-0003Lj-3X; Thu, 10 Jun 2021 04:10:02 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436575|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.589756-0.0109956-0.399248;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KQMfKxm_1623312595; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQMfKxm_1623312595)
 by smtp.aliyun-inc.com(10.147.43.230);
 Thu, 10 Jun 2021 16:09:55 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 21/37] target/riscv: 64-bit Add/Subtract Instructions
Date: Thu, 10 Jun 2021 15:58:52 +0800
Message-Id: <20210610075908.3305506-22-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.49; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-49.mail.aliyun.com
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
X-List-Received-Date: Thu, 10 Jun 2021 08:10:04 -0000

64-bit add/subtract with saturation or halving operation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  11 ++
 target/riscv/insn32.decode              |  11 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  74 +++++++++++++
 target/riscv/packed_helper.c            | 132 ++++++++++++++++++++++++
 4 files changed, 228 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a0e3131512..192ef42d2a 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1330,3 +1330,14 @@ DEF_HELPER_4(pbsada, tl, env, tl, tl, tl)
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
index 96288370a6..5156fa060e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -933,3 +933,14 @@ pbsada     1111111  ..... ..... 000 ..... 1110111 @r
 smaqa      1100100  ..... ..... 000 ..... 1110111 @r
 umaqa      1100110  ..... ..... 000 ..... 1110111 @r
 smaqa_su   1100101  ..... ..... 000 ..... 1110111 @r
+
+add64      1100000  ..... ..... 001 ..... 1110111 @r
+radd64     1000000  ..... ..... 001 ..... 1110111 @r
+uradd64    1010000  ..... ..... 001 ..... 1110111 @r
+kadd64     1001000  ..... ..... 001 ..... 1110111 @r
+ukadd64    1011000  ..... ..... 001 ..... 1110111 @r
+sub64      1100001  ..... ..... 001 ..... 1110111 @r
+rsub64     1000001  ..... ..... 001 ..... 1110111 @r
+ursub64    1010001  ..... ..... 001 ..... 1110111 @r
+ksub64     1001001  ..... ..... 001 ..... 1110111 @r
+uksub64    1011001  ..... ..... 001 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 1a10f13318..e04c79931d 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -516,3 +516,77 @@ GEN_RVP_R_ACC_OOL(pbsada);
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
+    TCGv t1, t2;
+    TCGv_i64 src1, src2, dst;
+
+    if (!has_ext(ctx, RVP) || !ctx->ext_psfoperand) {
+        return false;
+    }
+
+    src1 = tcg_temp_new_i64();
+    src2 = tcg_temp_new_i64();
+    dst = tcg_temp_new_i64();
+
+    if (is_32bit(ctx)) {
+        TCGv a0, a1, b0, b1;
+        a0 = tcg_temp_new();
+        a1 = tcg_temp_new();
+        b0 = tcg_temp_new();
+        b1 = tcg_temp_new();
+
+        gen_get_gpr(a0, a->rs1);
+        gen_get_gpr(a1, a->rs1 + 1);
+        tcg_gen_concat_tl_i64(src1, a0, a1);
+        gen_get_gpr(b0, a->rs2);
+        gen_get_gpr(b1, a->rs2 + 1);
+        tcg_gen_concat_tl_i64(src2, b0, b1);
+
+        tcg_temp_free(a0);
+        tcg_temp_free(a1);
+        tcg_temp_free(b0);
+        tcg_temp_free(b1);
+    } else {
+        t1 = tcg_temp_new();
+        t2 = tcg_temp_new();
+        gen_get_gpr(t1, a->rs1);
+        tcg_gen_ext_tl_i64(src1, t1);
+        gen_get_gpr(t2, a->rs2);
+        tcg_gen_ext_tl_i64(src2, t2);
+        tcg_temp_free(t1);
+        tcg_temp_free(t2);
+    }
+
+    fn(dst, cpu_env, src1, src2);
+    set_pair_regs(ctx, dst, a->rd);
+
+    tcg_temp_free_i64(src1);
+    tcg_temp_free_i64(src2);
+    tcg_temp_free_i64(dst);
+    return true;
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
index 02178d6e61..b8be234d97 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -2088,3 +2088,135 @@ static inline void do_smaqa_su(CPURISCVState *env, void *vd, void *va,
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
2.25.1


