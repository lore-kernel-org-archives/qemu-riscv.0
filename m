Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAb0T-0001VT-5j
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 11:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAb0R-0001Sa-6V; Fri, 12 Feb 2021 11:09:19 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:49283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAb0N-0007Tt-Bf; Fri, 12 Feb 2021 11:09:18 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436751|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.379647-0.00324761-0.617105;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHSMeC_1613146144; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHSMeC_1613146144)
 by smtp.aliyun-inc.com(10.147.43.230);
 Sat, 13 Feb 2021 00:09:05 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 32/38] target/riscv: RV64 Only SIMD Q15 saturating Multiply
 Instructions
Date: Fri, 12 Feb 2021 23:02:50 +0800
Message-Id: <20210212150256.885-33-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 16:09:19 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  10 ++
 target/riscv/insn32-64.decode           |  10 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  11 ++
 target/riscv/packed_helper.c            | 141 ++++++++++++++++++++++++
 4 files changed, 172 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 384b42ce90..f8521a5388 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1440,4 +1440,14 @@ DEF_HELPER_3(umin32, tl, env, tl, tl)
 DEF_HELPER_3(smax32, tl, env, tl, tl)
 DEF_HELPER_3(umax32, tl, env, tl, tl)
 DEF_HELPER_2(kabs32, tl, env, tl)
+
+DEF_HELPER_3(khmbb16, tl, env, tl, tl)
+DEF_HELPER_3(khmbt16, tl, env, tl, tl)
+DEF_HELPER_3(khmtt16, tl, env, tl, tl)
+DEF_HELPER_3(kdmbb16, tl, env, tl, tl)
+DEF_HELPER_3(kdmbt16, tl, env, tl, tl)
+DEF_HELPER_3(kdmtt16, tl, env, tl, tl)
+DEF_HELPER_4(kdmabb16, tl, env, tl, tl, tl)
+DEF_HELPER_4(kdmabt16, tl, env, tl, tl, tl)
+DEF_HELPER_4(kdmatt16, tl, env, tl, tl, tl)
 #endif
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index a2b8831467..2e1c1817e4 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -135,3 +135,13 @@ umin32     1010000  ..... ..... 010 ..... 1111111 @r
 smax32     1001001  ..... ..... 010 ..... 1111111 @r
 umax32     1010001  ..... ..... 010 ..... 1111111 @r
 kabs32     1010110  10010 ..... 000 ..... 1111111 @r2
+
+khmbb16    1101110  ..... ..... 001 ..... 1111111 @r
+khmbt16    1110110  ..... ..... 001 ..... 1111111 @r
+khmtt16    1111110  ..... ..... 001 ..... 1111111 @r
+kdmbb16    1101101  ..... ..... 001 ..... 1111111 @r
+kdmbt16    1110101  ..... ..... 001 ..... 1111111 @r
+kdmtt16    1111101  ..... ..... 001 ..... 1111111 @r
+kdmabb16   1101100  ..... ..... 001 ..... 1111111 @r
+kdmabt16   1110100  ..... ..... 001 ..... 1111111 @r
+kdmatt16   1111100  ..... ..... 001 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index ce144ee5c0..2b4418abd8 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1179,4 +1179,15 @@ GEN_RVP_R_OOL(umin32);
 GEN_RVP_R_OOL(smax32);
 GEN_RVP_R_OOL(umax32);
 GEN_RVP_R2_OOL(kabs32);
+
+/* (RV64 Only) SIMD Q15 saturating Multiply Instructions */
+GEN_RVP_R_OOL(khmbb16);
+GEN_RVP_R_OOL(khmbt16);
+GEN_RVP_R_OOL(khmtt16);
+GEN_RVP_R_OOL(kdmbb16);
+GEN_RVP_R_OOL(kdmbt16);
+GEN_RVP_R_OOL(kdmtt16);
+GEN_RVP_R_ACC_OOL(kdmabb16);
+GEN_RVP_R_ACC_OOL(kdmabt16);
+GEN_RVP_R_ACC_OOL(kdmatt16);
 #endif
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index c8a92f5b7d..5636848aaf 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3432,4 +3432,145 @@ static inline void do_kabs32(CPURISCVState *env, void *vd, void *va, uint8_t i)
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
+RVPR(khmbb16, 2, 2);
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
+RVPR(khmbt16, 2, 2);
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
+RVPR(khmtt16, 2, 2);
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
+RVPR(kdmbb16, 2, 2);
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
+RVPR(kdmbt16, 2, 2);
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
+RVPR(kdmtt16, 2, 2);
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
+    d[H4(i / 2)] = sadd32(env, 0, c[H4(i)], m0);
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
+    d[H4(i / 2)] = sadd32(env, 0, c[H4(i)], m0);
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
+    *d = sadd32(env, 0, c[H4(i)], m0);
+}
+
+RVPR_ACC(kdmatt16, 2, 2);
+
+
 #endif
-- 
2.17.1


