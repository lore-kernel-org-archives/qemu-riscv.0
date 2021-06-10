Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrFfb-0003r3-3z
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 04:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFfU-0003kd-Df; Thu, 10 Jun 2021 04:04:02 -0400
Received: from out28-4.mail.aliyun.com ([115.124.28.4]:39469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFfN-00007N-Tp; Thu, 10 Jun 2021 04:04:00 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436734|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.469349-9.41521e-05-0.530557;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KQMTtgQ_1623312229; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQMTtgQ_1623312229)
 by smtp.aliyun-inc.com(10.147.44.129);
 Thu, 10 Jun 2021 16:03:49 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 09/37] target/riscv: SIMD 16-bit Multiply Instructions
Date: Thu, 10 Jun 2021 15:58:40 +0800
Message-Id: <20210610075908.3305506-10-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.4; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-4.mail.aliyun.com
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
X-List-Received-Date: Thu, 10 Jun 2021 08:04:02 -0000

There are 6 instructions, including 16-bit signed or unsigned multiply,
16-bit signed or unsigned crossed multiply, Q15 signed or signed crossed
saturating multiply.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |   7 ++
 target/riscv/insn32.decode              |   7 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  69 ++++++++++++++++
 target/riscv/packed_helper.c            | 104 ++++++++++++++++++++++++
 4 files changed, 187 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c424e45fe5..d13b84f165 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1218,3 +1218,10 @@ DEF_HELPER_3(scmplt8, tl, env, tl, tl)
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
index fdbf3798c7..cbee995229 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -821,3 +821,10 @@ scmplt8    0000111  ..... ..... 000 ..... 1110111 @r
 scmple8    0001111  ..... ..... 000 ..... 1110111 @r
 ucmplt8    0010111  ..... ..... 000 ..... 1110111 @r
 ucmple8    0011111  ..... ..... 000 ..... 1110111 @r
+
+smul16     1010000  ..... ..... 000 ..... 1110111 @r
+smulx16    1010001  ..... ..... 000 ..... 1110111 @r
+umul16     1011000  ..... ..... 000 ..... 1110111 @r
+umulx16    1011001  ..... ..... 000 ..... 1110111 @r
+khm16      1000011  ..... ..... 000 ..... 1110111 @r
+khmx16     1001011  ..... ..... 000 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index aa432701c8..b93ba63dd8 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -217,3 +217,72 @@ GEN_RVP_R_OOL(scmplt8);
 GEN_RVP_R_OOL(scmple8);
 GEN_RVP_R_OOL(ucmplt8);
 GEN_RVP_R_OOL(ucmple8);
+
+/* SIMD 16-bit Multiply Instructions */
+static void set_pair_regs(DisasContext *ctx, TCGv_i64 dst, int rd)
+{
+    TCGv t1, t2;
+
+    t1 = tcg_temp_new();
+    t2 = tcg_temp_new();
+
+    if (is_32bit(ctx)) {
+        TCGv_i32 lo, hi;
+
+        lo = tcg_temp_new_i32();
+        hi = tcg_temp_new_i32();
+        tcg_gen_extr_i64_i32(lo, hi, dst);
+
+        tcg_gen_ext_i32_tl(t1, lo);
+        tcg_gen_ext_i32_tl(t2, hi);
+
+        gen_set_gpr(rd, t1);
+        gen_set_gpr(rd + 1, t2);
+        tcg_temp_free_i32(lo);
+        tcg_temp_free_i32(hi);
+    } else {
+        tcg_gen_trunc_i64_tl(t1, dst);
+        gen_set_gpr(rd, t1);
+    }
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+}
+
+static inline bool
+r_d64_ool(DisasContext *ctx, arg_r *a,
+          void (* fn)(TCGv_i64, TCGv_ptr, TCGv, TCGv))
+{
+    TCGv t1, t2;
+    TCGv_i64 t3;
+
+    if (!has_ext(ctx, RVP) || !ctx->ext_psfoperand) {
+        return false;
+    }
+
+    t1 = tcg_temp_new();
+    t2 = tcg_temp_new();
+    t3 = tcg_temp_new_i64();
+
+    gen_get_gpr(t1, a->rs1);
+    gen_get_gpr(t2, a->rs2);
+    fn(t3, cpu_env, t1, t2);
+    set_pair_regs(ctx, t3, a->rd);
+
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    tcg_temp_free_i64(t3);
+    return true;
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
2.25.1


