Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwNHj-0004QE-Qg
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 07:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNHd-0004ME-Oo; Thu, 24 Jun 2021 07:12:37 -0400
Received: from mail142-27.mail.alibaba.com ([198.11.142.27]:49341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNHb-0005n9-K5; Thu, 24 Jun 2021 07:12:33 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07437834|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.537522-0.00564209-0.456836;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXKIVos_1624533132; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKIVos_1624533132)
 by smtp.aliyun-inc.com(10.147.42.198);
 Thu, 24 Jun 2021 19:12:12 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 31/37] target/riscv: RV64 Only SIMD Q15 saturating Multiply
 Instructions
Date: Thu, 24 Jun 2021 18:55:15 +0800
Message-Id: <20210624105521.3964-32-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=198.11.142.27; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-27.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 24 Jun 2021 11:12:38 -0000

Q15 saturation limits the result to the range [INT16_MIN, INT16_MAX].

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  10 ++
 target/riscv/insn32.decode              |  10 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  19 ++++
 target/riscv/packed_helper.c            | 139 ++++++++++++++++++++++++
 4 files changed, 178 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index d992859747..5edaf389e4 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1443,3 +1443,13 @@ DEF_HELPER_3(umin32, i64, env, i64, i64)
 DEF_HELPER_3(smax32, i64, env, i64, i64)
 DEF_HELPER_3(umax32, i64, env, i64, i64)
 DEF_HELPER_2(kabs32, tl, env, tl)
+
+DEF_HELPER_3(khmbb16, i64, env, i64, i64)
+DEF_HELPER_3(khmbt16, i64, env, i64, i64)
+DEF_HELPER_3(khmtt16, i64, env, i64, i64)
+DEF_HELPER_3(kdmbb16, i64, env, i64, i64)
+DEF_HELPER_3(kdmbt16, i64, env, i64, i64)
+DEF_HELPER_3(kdmtt16, i64, env, i64, i64)
+DEF_HELPER_4(kdmabb16, tl, env, tl, tl, tl)
+DEF_HELPER_4(kdmabt16, tl, env, tl, tl, tl)
+DEF_HELPER_4(kdmatt16, tl, env, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ee5f855f28..a7b5643d5f 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -1066,3 +1066,13 @@ umin32     1010000  ..... ..... 010 ..... 1110111 @r
 smax32     1001001  ..... ..... 010 ..... 1110111 @r
 umax32     1010001  ..... ..... 010 ..... 1110111 @r
 kabs32     1010110  10010 ..... 000 ..... 1110111 @r2
+
+khmbb16    1101110  ..... ..... 001 ..... 1110111 @r
+khmbt16    1110110  ..... ..... 001 ..... 1110111 @r
+khmtt16    1111110  ..... ..... 001 ..... 1110111 @r
+kdmbb16    1101101  ..... ..... 001 ..... 1110111 @r
+kdmbt16    1110101  ..... ..... 001 ..... 1110111 @r
+kdmtt16    1111101  ..... ..... 001 ..... 1110111 @r
+kdmabb16   1101100  ..... ..... 001 ..... 1110111 @r
+kdmabt16   1110100  ..... ..... 001 ..... 1110111 @r
+kdmatt16   1111100  ..... ..... 001 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 77586e07e4..aa97161697 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1103,3 +1103,22 @@ static bool trans_##NAME(DisasContext *s, arg_r2 *a)   \
 }
 
 GEN_RVP64_R2_OOL(kabs32);
+
+/* (RV64 Only) SIMD Q15 saturating Multiply Instructions */
+GEN_RVP64_R_OOL(khmbb16);
+GEN_RVP64_R_OOL(khmbt16);
+GEN_RVP64_R_OOL(khmtt16);
+GEN_RVP64_R_OOL(kdmbb16);
+GEN_RVP64_R_OOL(kdmbt16);
+GEN_RVP64_R_OOL(kdmtt16);
+
+#define GEN_RVP64_R_ACC_OOL(NAME)                      \
+static bool trans_##NAME(DisasContext *s, arg_r *a)    \
+{                                                      \
+    REQUIRE_64BIT(s);                                  \
+    return r_acc_ool(s, a, gen_helper_##NAME);         \
+}
+
+GEN_RVP64_R_ACC_OOL(kdmabb16);
+GEN_RVP64_R_ACC_OOL(kdmabt16);
+GEN_RVP64_R_ACC_OOL(kdmatt16);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index a808dae9d8..32e0af2ef6 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3422,3 +3422,142 @@ static inline void do_kabs32(CPURISCVState *env, void *vd, void *va, uint8_t i)
 }
 
 RVPR2(kabs32, 1, 4);
+
+/* (RV64 Only) SIMD Q15 saturating Multiply Instructions */
+static inline void do_khmbb16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+
+    d[H4(i / 2)] = sat64(env, (int64_t)a[H2(i)] * b[H2(i)] >> 15, 15);
+}
+
+RVPR64_64_64(khmbb16, 2, 2);
+
+static inline void do_khmbt16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+
+    d[H4(i / 2)] = sat64(env, (int64_t)a[H2(i)] * b[H2(i + 1)] >> 15, 15);
+}
+
+RVPR64_64_64(khmbt16, 2, 2);
+
+static inline void do_khmtt16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+
+    d[H4(i / 2)] = sat64(env, (int64_t)a[H2(i + 1)] * b[H2(i + 1)] >> 15, 15);
+}
+
+RVPR64_64_64(khmtt16, 2, 2);
+
+static inline void do_kdmbb16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+
+    if (a[H2(i)] == INT16_MIN && b[H2(i)] == INT16_MIN) {
+        d[H4(i / 2)] = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        d[H4(i / 2)] = (int64_t)a[H2(i)] * b[H2(i)] << 1;
+    }
+}
+
+RVPR64_64_64(kdmbb16, 2, 2);
+
+static inline void do_kdmbt16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+
+    if (a[H2(i)] == INT16_MIN && b[H2(i + 1)] == INT16_MIN) {
+        d[H4(i / 2)] = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        d[H4(i / 2)] = (int64_t)a[H2(i)] * b[H2(i + 1)] << 1;
+    }
+}
+
+RVPR64_64_64(kdmbt16, 2, 2);
+
+static inline void do_kdmtt16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+
+    if (a[H2(i + 1)] == INT16_MIN && b[H2(i + 1)] == INT16_MIN) {
+        d[H4(i / 2)] = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        d[H4(i / 2)] = (int64_t)a[H2(i + 1)] * b[H2(i + 1)] << 1;
+    }
+}
+
+RVPR64_64_64(kdmtt16, 2, 2);
+
+static inline void do_kdmabb16(CPURISCVState *env, void *vd, void *va,
+                               void *vb, void *vc, uint8_t i)
+
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    int32_t *c = vc, m0;
+
+    if (a[H2(i)] == INT16_MIN && b[H2(i)] == INT16_MIN) {
+        m0 = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        m0 = (int32_t)a[H2(i)] * b[H2(i)] << 1;
+    }
+    d[H4(i / 2)] = sadd32(env, 0, c[H4(i / 2)], m0);
+}
+
+RVPR_ACC(kdmabb16, 2, 2);
+
+static inline void do_kdmabt16(CPURISCVState *env, void *vd, void *va,
+                               void *vb, void *vc, uint8_t i)
+
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    int32_t *c = vc, m0;
+
+    if (a[H2(i)] == INT16_MIN && b[H2(i + 1)] == INT16_MIN) {
+        m0 = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        m0 = (int32_t)a[H2(i)] * b[H2(i + 1)] << 1;
+    }
+    d[H4(i / 2)] = sadd32(env, 0, c[H4(i / 2)], m0);
+}
+
+RVPR_ACC(kdmabt16, 2, 2);
+
+static inline void do_kdmatt16(CPURISCVState *env, void *vd, void *va,
+                               void *vb, void *vc, uint8_t i)
+
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    int32_t *c = vc, m0;
+
+    if (a[H2(i + 1)] == INT16_MIN && b[H2(i + 1)] == INT16_MIN) {
+        m0 = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        m0 = (int32_t)a[H2(i + 1)] * b[H2(i + 1)] << 1;
+    }
+    d[H4(i / 2)] = sadd32(env, 0, c[H4(i / 2)], m0);
+}
+
+RVPR_ACC(kdmatt16, 2, 2);
-- 
2.17.1


