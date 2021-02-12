Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAb6I-0007UC-L4
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 11:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAb6F-0007PM-HK; Fri, 12 Feb 2021 11:15:19 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:50791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAb69-0000rj-Vp; Fri, 12 Feb 2021 11:15:19 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0744656|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.305443-0.00911841-0.685439;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHrKL._1613146506; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHrKL._1613146506)
 by smtp.aliyun-inc.com(10.147.41.231);
 Sat, 13 Feb 2021 00:15:07 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 35/38] target/riscv: RV64 Only 32-bit Parallel Multiply & Add
 Instructions
Date: Fri, 12 Feb 2021 23:02:53 +0800
Message-Id: <20210212150256.885-36-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 16:15:19 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  12 ++
 target/riscv/insn32-64.decode           |  12 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  13 ++
 target/riscv/packed_helper.c            | 182 ++++++++++++++++++++++++
 4 files changed, 219 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 05f7c1d811..85290a2b05 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1457,4 +1457,16 @@ DEF_HELPER_3(smtt32, tl, env, tl, tl)
 DEF_HELPER_4(kmabb32, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmabt32, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmatt32, tl, env, tl, tl, tl)
+
+DEF_HELPER_3(kmda32, tl, env, tl, tl)
+DEF_HELPER_3(kmxda32, tl, env, tl, tl)
+DEF_HELPER_4(kmaxda32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmads32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmadrs32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmaxds32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmsda32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmsxda32, tl, env, tl, tl, tl)
+DEF_HELPER_3(smds32, tl, env, tl, tl)
+DEF_HELPER_3(smdrs32, tl, env, tl, tl)
+DEF_HELPER_3(smxds32, tl, env, tl, tl)
 #endif
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index c5b07a2667..ccdd965963 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -152,3 +152,15 @@ smtt32     0010100  ..... ..... 010 ..... 1111111 @r
 kmabb32    0101101  ..... ..... 010 ..... 1111111 @r
 kmabt32    0110101  ..... ..... 010 ..... 1111111 @r
 kmatt32    0111101  ..... ..... 010 ..... 1111111 @r
+
+kmda32     0011100  ..... ..... 010 ..... 1111111 @r
+kmxda32    0011101  ..... ..... 010 ..... 1111111 @r
+kmaxda32   0100101  ..... ..... 010 ..... 1111111 @r
+kmads32    0101110  ..... ..... 010 ..... 1111111 @r
+kmadrs32   0110110  ..... ..... 010 ..... 1111111 @r
+kmaxds32   0111110  ..... ..... 010 ..... 1111111 @r
+kmsda32    0100110  ..... ..... 010 ..... 1111111 @r
+kmsxda32   0100111  ..... ..... 010 ..... 1111111 @r
+smds32     0101100  ..... ..... 010 ..... 1111111 @r
+smdrs32    0110100  ..... ..... 010 ..... 1111111 @r
+smxds32    0111100  ..... ..... 010 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index da6a4ba14a..d2000bcfb5 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1199,4 +1199,17 @@ GEN_RVP_R_OOL(smtt32);
 GEN_RVP_R_ACC_OOL(kmabb32);
 GEN_RVP_R_ACC_OOL(kmabt32);
 GEN_RVP_R_ACC_OOL(kmatt32);
+
+/* (RV64 Only) 32-bit Parallel Multiply & Add Instructions */
+GEN_RVP_R_OOL(kmda32);
+GEN_RVP_R_OOL(kmxda32);
+GEN_RVP_R_ACC_OOL(kmaxda32);
+GEN_RVP_R_ACC_OOL(kmads32);
+GEN_RVP_R_ACC_OOL(kmadrs32);
+GEN_RVP_R_ACC_OOL(kmaxds32);
+GEN_RVP_R_ACC_OOL(kmsda32);
+GEN_RVP_R_ACC_OOL(kmsxda32);
+GEN_RVP_R_OOL(smds32);
+GEN_RVP_R_OOL(smdrs32);
+GEN_RVP_R_OOL(smxds32);
 #endif
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 99da28a4b3..bd24d5145a 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3623,4 +3623,186 @@ static inline void do_kmatt32(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR_ACC(kmatt32, 1, sizeof(target_ulong));
+
+/* (RV64 Only) 32-bit Parallel Multiply & Add Instructions */
+static inline void do_kmda32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va, *b = vb;
+    if (a[H4(i)] == INT32_MIN && b[H4(i)] == INT32_MIN &&
+        a[H4(i + 1)] == INT32_MIN && b[H4(i + 1)] == INT32_MIN) {
+        *d = INT64_MAX;
+        env->vxsat = 0x1;
+    } else {
+        *d = (int64_t)a[H4(i)] * b[H4(i)] +
+             (int64_t)a[H4(i + 1)] * b[H4(i + 1)];
+    }
+}
+
+RVPR(kmda32, 1, sizeof(target_ulong));
+
+static inline void do_kmxda32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va, *b = vb;
+    if (a[H4(i)] == INT32_MIN && b[H4(i)] == INT32_MIN &&
+        a[H4(i + 1)] == INT32_MIN && b[H4(i + 1)] == INT32_MIN) {
+        *d = INT64_MAX;
+        env->vxsat = 0x1;
+    } else {
+        *d = (int64_t)a[H4(i)] * b[H4(i + 1)] +
+             (int64_t)a[H4(i + 1)] * b[H4(i)];
+    }
+}
+
+RVPR(kmxda32, 1, sizeof(target_ulong));
+
+static inline void do_kmaxda32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    int64_t p1, p2;
+    p1 = (int64_t)a[H4(i)] * b[H4(i + 1)];
+    p2 = (int64_t)a[H4(i + 1)] * b[H4(i)];
+
+    if (a[H4(i)] == INT32_MIN && a[H4(i + 1)] == INT32_MIN &&
+        b[H4(i)] == INT32_MIN && b[H4(i + 1)] == INT32_MIN) {
+        if (*d < 0) {
+            *d = (INT64_MAX + *c) + 1ll;
+        } else {
+            env->vxsat = 0x1;
+            *d = INT64_MAX;
+        }
+    } else {
+        *d = sadd64(env, 0, p1 + p2, *c);
+    }
+}
+
+RVPR_ACC(kmaxda32, 1, sizeof(target_ulong));
+
+static inline void do_kmads32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    int64_t t0, t1;
+    t1 = (int64_t)a[H4(i + 1)] * b[H4(i + 1)];
+    t0 = (int64_t)a[H4(i)] * b[H4(i)];
+
+    *d = sadd64(env, 0, t1 - t0, *c);
+}
+
+RVPR_ACC(kmads32, 1, sizeof(target_ulong));
+
+static inline void do_kmadrs32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    int64_t t0, t1;
+    t1 = (int64_t)a[H4(i + 1)] * b[H4(i + 1)];
+    t0 = (int64_t)a[H4(i)] * b[H4(i)];
+
+    *d = sadd64(env, 0, t0 - t1, *c);
+}
+
+RVPR_ACC(kmadrs32, 1, sizeof(target_ulong));
+
+static inline void do_kmaxds32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    int64_t t01, t10;
+    t01 = (int64_t)a[H4(i)] * b[H4(i + 1)];
+    t10 = (int64_t)a[H4(i + 1)] * b[H4(i)];
+
+    *d = sadd64(env, 0, t10 - t01, *c);
+}
+
+RVPR_ACC(kmaxds32, 1, sizeof(target_ulong));
+
+static inline void do_kmsda32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    int64_t t0, t1;
+    t0 = (int64_t)a[H4(i)] * b[H4(i)];
+    t1 = (int64_t)a[H4(i + 1)] * b[H4(i + 1)];
+
+    if (a[H4(i)] == INT32_MIN && a[H4(i + 1)] == INT32_MIN &&
+        b[H4(i)] == INT32_MIN && b[H4(i + 1)] == INT32_MIN) {
+        if (*d < 0) {
+            env->vxsat = 0x1;
+            *d = INT64_MIN;
+        } else {
+            *d = *c - 1ll - INT64_MAX;
+        }
+    } else {
+        *d = ssub64(env, 0, t0 + t1, *c);
+    }
+}
+
+RVPR_ACC(kmsda32, 1, sizeof(target_ulong));
+
+static inline void do_kmsxda32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    int64_t t01, t10;
+    t10 = (int64_t)a[H4(i + 1)] * b[H4(i)];
+    t01 = (int64_t)a[H4(i)] * b[H4(i + 1)];
+
+    if (a[H4(i)] == INT32_MIN && a[H4(i + 1)] == INT32_MIN &&
+        b[H4(i)] == INT32_MIN && b[H4(i + 1)] == INT32_MIN) {
+        if (*d < 0) {
+            env->vxsat = 0x1;
+            *d = INT64_MIN;
+        } else {
+            *d = *c - 1ll - INT64_MAX;
+        }
+    } else {
+        *d = ssub64(env, 0, t10 + t01, *c);
+    }
+}
+
+RVPR_ACC(kmsxda32, 1, sizeof(target_ulong));
+
+static inline void do_smds32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va, *b = vb;
+    *d = (int64_t)a[H4(i + 1)] * b[H4(i + 1)] -
+         (int64_t)a[H4(i)] * b[H4(i)];
+}
+
+RVPR(smds32, 1, sizeof(target_ulong));
+
+static inline void do_smdrs32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va, *b = vb;
+    *d = (int64_t)a[H4(i)] * b[H4(i)] -
+         (int64_t)a[H4(i + 1)] * b[H4(i + 1)];
+}
+
+RVPR(smdrs32, 1, sizeof(target_ulong));
+
+static inline void do_smxds32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va, *b = vb;
+    *d = (int64_t)a[H4(i + 1)] * b[H4(i)] -
+         (int64_t)a[H4(i)] * b[H4(i + 1)];
+}
+
+RVPR(smxds32, 1, sizeof(target_ulong));
 #endif
-- 
2.17.1


