Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwN9g-0006Sn-F9
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 07:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN9Z-0006Oe-S6; Thu, 24 Jun 2021 07:04:14 -0400
Received: from out28-197.mail.aliyun.com ([115.124.28.197]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN9W-0001Hx-EZ; Thu, 24 Jun 2021 07:04:13 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436314|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.620553-0.00353106-0.375916;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047187; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXKEEjv_1624532644; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKEEjv_1624532644)
 by smtp.aliyun-inc.com(10.147.43.230);
 Thu, 24 Jun 2021 19:04:04 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 15/37] target/riscv: Signed MSW 32x32 Multiply and Add
 Instructions
Date: Thu, 24 Jun 2021 18:54:59 +0800
Message-Id: <20210624105521.3964-16-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.197; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-197.mail.aliyun.com
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
X-List-Received-Date: Thu, 24 Jun 2021 11:04:15 -0000

Always contain a 32x32 multiplification and the most significant
word can be used as the result, or an operand for an add or
subtract operation with rounding or saturation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |   9 ++
 target/riscv/insn32.decode              |   9 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  44 ++++++++++
 target/riscv/packed_helper.c            | 109 ++++++++++++++++++++++++
 4 files changed, 171 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9872f5efbd..600e8dee44 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1271,3 +1271,12 @@ DEF_HELPER_3(pkbb16, tl, env, tl, tl)
 DEF_HELPER_3(pkbt16, tl, env, tl, tl)
 DEF_HELPER_3(pktt16, tl, env, tl, tl)
 DEF_HELPER_3(pktb16, tl, env, tl, tl)
+
+DEF_HELPER_3(smmul, tl, env, tl, tl)
+DEF_HELPER_3(smmul_u, tl, env, tl, tl)
+DEF_HELPER_4(kmmac, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmmac_u, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmmsb, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmmsb_u, tl, env, tl, tl, tl)
+DEF_HELPER_3(kwmmul, tl, env, tl, tl)
+DEF_HELPER_3(kwmmul_u, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0b6830c76e..0484de140b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -874,3 +874,12 @@ pkbb16     0000111  ..... ..... 001 ..... 1110111 @r
 pkbt16     0001111  ..... ..... 001 ..... 1110111 @r
 pktt16     0010111  ..... ..... 001 ..... 1110111 @r
 pktb16     0011111  ..... ..... 001 ..... 1110111 @r
+
+smmul      0100000  ..... ..... 001 ..... 1110111 @r
+smmul_u    0101000  ..... ..... 001 ..... 1110111 @r
+kmmac      0110000  ..... ..... 001 ..... 1110111 @r
+kmmac_u    0111000  ..... ..... 001 ..... 1110111 @r
+kmmsb      0100001  ..... ..... 001 ..... 1110111 @r
+kmmsb_u    0101001  ..... ..... 001 ..... 1110111 @r
+kwmmul     0110001  ..... ..... 001 ..... 1110111 @r
+kwmmul_u   0111001  ..... ..... 001 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index b5bd8b1406..073558b950 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -369,3 +369,47 @@ GEN_RVP_R_OOL(pkbb16);
 GEN_RVP_R_OOL(pkbt16);
 GEN_RVP_R_OOL(pktt16);
 GEN_RVP_R_OOL(pktb16);
+
+/* Most Significant Word “32x32” Multiply & Add Instructions */
+GEN_RVP_R_OOL(smmul);
+GEN_RVP_R_OOL(smmul_u);
+
+/* Function to accumulate destination register */
+static inline bool r_acc_ool(DisasContext *ctx, arg_r *a,
+                             void (* fn)(TCGv, TCGv_ptr, TCGv, TCGv, TCGv))
+{
+    TCGv src1, src2, src3, dst;
+    if (!has_ext(ctx, RVP)) {
+        return false;
+    }
+
+    src1 = tcg_temp_new();
+    src2 = tcg_temp_new();
+    src3 = tcg_temp_new();
+    dst = tcg_temp_new();
+
+    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(src2, a->rs2);
+    gen_get_gpr(src3, a->rd);
+    fn(dst, cpu_env, src1, src2, src3);
+    gen_set_gpr(a->rd, dst);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(src2);
+    tcg_temp_free(src3);
+    tcg_temp_free(dst);
+    return true;
+}
+
+#define GEN_RVP_R_ACC_OOL(NAME)                        \
+static bool trans_##NAME(DisasContext *s, arg_r *a)    \
+{                                                      \
+    return r_acc_ool(s, a, gen_helper_##NAME);         \
+}
+
+GEN_RVP_R_ACC_OOL(kmmac);
+GEN_RVP_R_ACC_OOL(kmmac_u);
+GEN_RVP_R_ACC_OOL(kmmsb);
+GEN_RVP_R_ACC_OOL(kmmsb_u);
+GEN_RVP_R_OOL(kwmmul);
+GEN_RVP_R_OOL(kwmmul_u);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index f6cea654b2..465cb5a3b3 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -1359,3 +1359,112 @@ static inline void do_pktb16(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(pktb16, 2, 2);
+
+/* Most Significant Word “32x32” Multiply & Add Instructions */
+static inline void do_smmul(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[i] = (int64_t)a[i] * b[i] >> 32;
+}
+
+RVPR(smmul, 1, 4);
+
+static inline void do_smmul_u(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[i] = ((int64_t)a[i] * b[i] + (uint32_t)INT32_MIN) >> 32;
+}
+
+RVPR(smmul_u, 1, 4);
+
+typedef void PackedFn4i(CPURISCVState *, void *, void *,
+                        void *, void *, uint8_t);
+
+static inline target_ulong
+rvpr_acc(CPURISCVState *env, target_ulong a,
+         target_ulong b, target_ulong c,
+         uint8_t step, uint8_t size, PackedFn4i *fn)
+{
+    int i, passes = sizeof(target_ulong) / size;
+    target_ulong result = 0;
+
+    for (i = 0; i < passes; i += step) {
+        fn(env, &result, &a, &b, &c, i);
+    }
+    return result;
+}
+
+#define RVPR_ACC(NAME, STEP, SIZE)                                     \
+target_ulong HELPER(NAME)(CPURISCVState *env, target_ulong a,          \
+                          target_ulong b, target_ulong c)              \
+{                                                                      \
+    return rvpr_acc(env, a, b, c, STEP, SIZE, (PackedFn4i *)do_##NAME);\
+}
+
+static inline void do_kmmac(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb, *c = vc;
+    d[i] = sadd32(env, 0, ((int64_t)a[i] * b[i]) >> 32, c[i]);
+}
+
+RVPR_ACC(kmmac, 1, 4);
+
+static inline void do_kmmac_u(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb, *c = vc;
+    d[i] = sadd32(env, 0, ((int64_t)a[i] * b[i] +
+                           (uint32_t)INT32_MIN) >> 32, c[i]);
+}
+
+RVPR_ACC(kmmac_u, 1, 4);
+
+static inline void do_kmmsb(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb, *c = vc;
+    d[i] = ssub32(env, 0, c[i], (int64_t)a[i] * b[i] >> 32);
+}
+
+RVPR_ACC(kmmsb, 1, 4);
+
+static inline void do_kmmsb_u(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb, *c = vc;
+    d[i] = ssub32(env, 0, c[i], ((int64_t)a[i] * b[i] +
+                                 (uint32_t)INT32_MIN) >> 32);
+}
+
+RVPR_ACC(kmmsb_u, 1, 4);
+
+static inline void do_kwmmul(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    if (a[i] == INT32_MIN && b[i] == INT32_MIN) {
+        env->vxsat = 0x1;
+        d[i] = INT32_MAX;
+    } else {
+        d[i] = (int64_t)a[i] * b[i] >> 31;
+    }
+}
+
+RVPR(kwmmul, 1, 4);
+
+static inline void do_kwmmul_u(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    if (a[i] == INT32_MIN && b[i] == INT32_MIN) {
+        env->vxsat = 0x1;
+        d[i] = INT32_MAX;
+    } else {
+        d[i] = ((int64_t)a[i] * b[i] + (1ull << 30)) >> 31;
+    }
+}
+
+RVPR(kwmmul_u, 1, 4);
-- 
2.17.1


