Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAaZC-0007Tl-Cw
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:41:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaZA-0007RA-4U; Fri, 12 Feb 2021 10:41:08 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:37178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaZ5-0003Hb-MW; Fri, 12 Feb 2021 10:41:07 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07609524|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.547673-7.80372e-05-0.452249;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHCaan_1613144452; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHCaan_1613144452)
 by smtp.aliyun-inc.com(10.147.41.138);
 Fri, 12 Feb 2021 23:40:53 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 18/38] target/riscv: Signed 16-bit Multiply 32-bit
 Add/Subtract Instructions
Date: Fri, 12 Feb 2021 23:02:36 +0800
Message-Id: <20210212150256.885-19-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 15:41:08 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  19 ++
 target/riscv/insn32.decode              |  19 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  20 ++
 target/riscv/packed_helper.c            | 268 ++++++++++++++++++++++++
 4 files changed, 326 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 25aa07a7ff..b1f831bb02 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1294,3 +1294,22 @@ DEF_HELPER_4(kmmawb2, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmmawb2_u, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmmawt2, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmmawt2_u, tl, env, tl, tl, tl)
+
+DEF_HELPER_3(smbb16, tl, env, tl, tl)
+DEF_HELPER_3(smbt16, tl, env, tl, tl)
+DEF_HELPER_3(smtt16, tl, env, tl, tl)
+DEF_HELPER_3(kmda, tl, env, tl, tl)
+DEF_HELPER_3(kmxda, tl, env, tl, tl)
+DEF_HELPER_3(smds, tl, env, tl, tl)
+DEF_HELPER_3(smdrs, tl, env, tl, tl)
+DEF_HELPER_3(smxds, tl, env, tl, tl)
+DEF_HELPER_4(kmabb, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmabt, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmatt, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmada, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmaxda, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmads, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmadrs, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmaxds, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmsda, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmsxda, tl, env, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6e63bab2d9..4e5cdbb928 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -762,3 +762,22 @@ kmmawb2    1100111  ..... ..... 001 ..... 1111111 @r
 kmmawb2_u  1101111  ..... ..... 001 ..... 1111111 @r
 kmmawt2    1110111  ..... ..... 001 ..... 1111111 @r
 kmmawt2_u  1111111  ..... ..... 001 ..... 1111111 @r
+
+smbb16     0000100  ..... ..... 001 ..... 1111111 @r
+smbt16     0001100  ..... ..... 001 ..... 1111111 @r
+smtt16     0010100  ..... ..... 001 ..... 1111111 @r
+kmda       0011100  ..... ..... 001 ..... 1111111 @r
+kmxda      0011101  ..... ..... 001 ..... 1111111 @r
+smds       0101100  ..... ..... 001 ..... 1111111 @r
+smdrs      0110100  ..... ..... 001 ..... 1111111 @r
+smxds      0111100  ..... ..... 001 ..... 1111111 @r
+kmabb      0101101  ..... ..... 001 ..... 1111111 @r
+kmabt      0110101  ..... ..... 001 ..... 1111111 @r
+kmatt      0111101  ..... ..... 001 ..... 1111111 @r
+kmada      0100100  ..... ..... 001 ..... 1111111 @r
+kmaxda     0100101  ..... ..... 001 ..... 1111111 @r
+kmads      0101110  ..... ..... 001 ..... 1111111 @r
+kmadrs     0110110  ..... ..... 001 ..... 1111111 @r
+kmaxds     0111110  ..... ..... 001 ..... 1111111 @r
+kmsda      0100110  ..... ..... 001 ..... 1111111 @r
+kmsxda     0100111  ..... ..... 001 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index e708ae7a6a..261aab402a 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -582,3 +582,23 @@ GEN_RVP_R_ACC_OOL(kmmawb2);
 GEN_RVP_R_ACC_OOL(kmmawb2_u);
 GEN_RVP_R_ACC_OOL(kmmawt2);
 GEN_RVP_R_ACC_OOL(kmmawt2_u);
+
+/* Signed 16-bit Multiply with 32-bit Add/Subtract Instructions */
+GEN_RVP_R_OOL(smbb16);
+GEN_RVP_R_OOL(smbt16);
+GEN_RVP_R_OOL(smtt16);
+GEN_RVP_R_OOL(kmda);
+GEN_RVP_R_OOL(kmxda);
+GEN_RVP_R_OOL(smds);
+GEN_RVP_R_OOL(smdrs);
+GEN_RVP_R_OOL(smxds);
+GEN_RVP_R_ACC_OOL(kmabb);
+GEN_RVP_R_ACC_OOL(kmabt);
+GEN_RVP_R_ACC_OOL(kmatt);
+GEN_RVP_R_ACC_OOL(kmada);
+GEN_RVP_R_ACC_OOL(kmaxda);
+GEN_RVP_R_ACC_OOL(kmads);
+GEN_RVP_R_ACC_OOL(kmadrs);
+GEN_RVP_R_ACC_OOL(kmaxds);
+GEN_RVP_R_ACC_OOL(kmsda);
+GEN_RVP_R_ACC_OOL(kmsxda);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index ea3c9f6dd8..b3673a33ee 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -1685,3 +1685,271 @@ static inline void do_kmmawt2_u(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR_ACC(kmmawt2_u, 1, 4);
+
+/* Signed 16-bit Multiply with 32-bit Add/Subtract Instruction */
+static inline void do_smbb16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = (int32_t)a[H2(2 * i)] * b[H2(2 * i)];
+}
+
+RVPR(smbb16, 1, 4);
+
+static inline void do_smbt16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = (int32_t)a[H2(2 * i)] * b[H2(2 * i + 1)];
+}
+
+RVPR(smbt16, 1, 4);
+
+static inline void do_smtt16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)];
+}
+
+RVPR(smtt16, 1, 4);
+
+static inline void do_kmda(CPURISCVState *env, void *vd, void *va,
+                           void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    if (a[H2(2 * i)] == INT16_MIN && a[H2(2 * i + 1)] == INT16_MIN &&
+        b[H2(2 * i)] == INT16_MIN && a[H2(2 * i + 1)] == INT16_MIN) {
+        d[H4(i)] = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        d[H4(i)] = (int32_t)a[H2(2 * i)] * b[H2(2 * i)] +
+                   (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)];
+    }
+}
+
+RVPR(kmda, 1, 4);
+
+static inline void do_kmxda(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    if (a[H2(2 * i)] == INT16_MIN && a[H2(2 * i + 1)] == INT16_MIN &&
+        b[H2(2 * i)] == INT16_MIN && a[H2(2 * i + 1)] == INT16_MIN) {
+        d[H4(i)] = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        d[H4(i)] = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i)] +
+                   (int32_t)a[H2(2 * i)] * b[H2(2 * i + 1)];
+    }
+}
+
+RVPR(kmxda, 1, 4);
+
+static inline void do_smds(CPURISCVState *env, void *vd, void *va,
+                           void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)] -
+               (int32_t)a[H2(2 * i)] * b[H2(2 * i)];
+}
+
+RVPR(smds, 1, 4);
+
+static inline void do_smdrs(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = (int32_t)a[H2(2 * i)] * b[H2(2 * i)] -
+               (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)];
+}
+
+RVPR(smdrs, 1, 4);
+
+static inline void do_smxds(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i)] -
+               (int32_t)a[H2(2 * i)] * b[H2(2 * i + 1)];
+}
+
+RVPR(smxds, 1, 4);
+
+static inline void do_kmabb(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = sadd32(env, 0, (int32_t)a[H2(2 * i)] * b[H2(2 * i)], c[H4(i)]);
+}
+
+RVPR_ACC(kmabb, 1, 4);
+
+static inline void do_kmabt(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = sadd32(env, 0, (int32_t)a[H2(2 * i)] * b[H2(2 * i + 1)],
+                      c[H4(i)]);
+}
+
+RVPR_ACC(kmabt, 1, 4);
+
+static inline void do_kmatt(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    d[H4(i)] = sadd32(env, 0, (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)],
+                      c[H4(i)]);
+}
+
+RVPR_ACC(kmatt, 1, 4);
+
+static inline void do_kmada(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    int32_t p1, p2;
+    p1 = (int32_t)a[H2(2 * i)] * b[H2(2 * i)];
+    p2 = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)];
+
+    if (a[H2(i)] == INT16_MIN && a[H2(i + 1)] == INT16_MIN &&
+        b[H2(i)] == INT16_MIN && b[H2(i + 1)] == INT16_MIN) {
+        if (c[H4(i)] < 0) {
+            d[H4(i)] = INT32_MAX + c[H4(i)] + 1ll;
+        } else {
+            env->vxsat = 0x1;
+            d[H4(i)] = INT32_MAX;
+        }
+    } else {
+        d[H4(i)] = sadd32(env, 0, p1 + p2, c[H4(i)]);
+    }
+}
+
+RVPR_ACC(kmada, 1, 4);
+
+static inline void do_kmaxda(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    int32_t p1, p2;
+    p1 = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i)];
+    p2 = (int32_t)a[H2(2 * i)] * b[H2(2 * i + 1)];
+
+    if (a[H2(2 * i)] == INT16_MIN && a[H2(2 * i + 1)] == INT16_MIN &&
+        b[H2(2 * i)] == INT16_MIN && b[H2(2 * i + 1)] == INT16_MIN) {
+        if (c[H4(i)] < 0) {
+            d[H4(i)] = INT32_MAX + c[H4(i)] + 1ll;
+        } else {
+            env->vxsat = 0x1;
+            d[H4(i)] = INT32_MAX;
+        }
+    } else {
+        d[H4(i)] = sadd32(env, 0, p1 + p2, c[H4(i)]);
+    }
+}
+
+RVPR_ACC(kmaxda, 1, 4);
+
+static inline void do_kmads(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    int32_t p1, p2;
+    p1 =   (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)];
+    p2 =   (int32_t)a[H2(2 * i)] * b[H2(2 * i)];
+
+    d[H4(i)] = sadd32(env, 0, p1 - p2, c[H4(i)]);
+}
+
+RVPR_ACC(kmads, 1, 4);
+
+static inline void do_kmadrs(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void * vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    int32_t p1, p2;
+    p1 = (int32_t)a[H2(2 * i)] * b[H2(2 * i)];
+    p2 = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)];
+
+    d[H4(i)] = sadd32(env, 0, p1 - p2, c[H4(i)]);
+}
+
+RVPR_ACC(kmadrs, 1, 4);
+
+static inline void do_kmaxds(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    int32_t p1, p2;
+    p1 = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i)];
+    p2 = (int32_t)a[H2(2 * i)] * b[H2(2 * i + 1)];
+
+    d[H4(i)] = sadd32(env, 0, p1 - p2, c[H4(i)]);
+}
+
+RVPR_ACC(kmaxds, 1, 4);
+
+static inline void do_kmsda(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    int32_t p1, p2;
+    p1 = (int32_t)a[H2(2 * i)] * b[H2(2 * i)];
+    p2 = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i + 1)];
+
+    if (a[H2(i)] == INT16_MIN && a[H2(i + 1)] == INT16_MIN &&
+        b[H2(i)] == INT16_MIN && b[H2(i + 1)] == INT16_MIN) {
+        if (c[H4(i)] < 0) {
+            env->vxsat = 0x1;
+            d[H4(i)] = INT32_MIN;
+        } else {
+            d[H4(i)] = c[H4(i)] - 1ll - INT32_MAX;
+        }
+    } else {
+        d[H4(i)] = ssub32(env, 0, c[H4(i)], p1 + p2);
+    }
+}
+
+RVPR_ACC(kmsda, 1, 4);
+
+static inline void do_kmsxda(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void * vc, uint8_t i)
+{
+    int32_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+    int32_t p1, p2;
+    p1 = (int32_t)a[H2(2 * i)] * b[H2(2 * i + 1)];
+    p2 = (int32_t)a[H2(2 * i + 1)] * b[H2(2 * i)];
+
+    if (a[H2(i)] == INT16_MIN && a[H2(i + 1)] == INT16_MIN &&
+        b[H2(i)] == INT16_MIN && b[H2(i + 1)] == INT16_MIN) {
+        if (d[H4(i)] < 0) {
+            env->vxsat = 0x1;
+            d[H4(i)] = INT32_MIN;
+        } else {
+            d[H4(i)] = c[H4(i)] - 1ll - INT32_MAX;
+        }
+    } else {
+        d[H4(i)] = ssub32(env, 0, c[H4(i)], p1 + p2);
+    }
+}
+
+RVPR_ACC(kmsxda, 1, 4);
-- 
2.17.1


