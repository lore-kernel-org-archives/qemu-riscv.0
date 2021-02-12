Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAaks-0005Mm-1w
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:53:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAakq-0005MZ-0q; Fri, 12 Feb 2021 10:53:12 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:47198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAakn-0000MQ-71; Fri, 12 Feb 2021 10:53:11 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0748601|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.621911-0.0154592-0.362629;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHXsKS_1613145177; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHXsKS_1613145177)
 by smtp.aliyun-inc.com(10.147.41.178);
 Fri, 12 Feb 2021 23:52:58 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 24/38] target/riscv: Signed 16-bit Multiply with 64-bit
 Add/Subtract Instructions
Date: Fri, 12 Feb 2021 23:02:42 +0800
Message-Id: <20210212150256.885-25-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 15:53:12 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  11 ++
 target/riscv/insn32.decode              |  11 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  12 ++
 target/riscv/packed_helper.c            | 151 ++++++++++++++++++++++++
 4 files changed, 185 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 4d89417287..3ec4477ce8 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1347,3 +1347,14 @@ DEF_HELPER_4(kmar64, i64, env, tl, tl, i64)
 DEF_HELPER_4(kmsr64, i64, env, tl, tl, i64)
 DEF_HELPER_4(ukmar64, i64, env, tl, tl, i64)
 DEF_HELPER_4(ukmsr64, i64, env, tl, tl, i64)
+
+DEF_HELPER_4(smalbb, i64, env, tl, tl, i64)
+DEF_HELPER_4(smalbt, i64, env, tl, tl, i64)
+DEF_HELPER_4(smaltt, i64, env, tl, tl, i64)
+DEF_HELPER_4(smalda, i64, env, tl, tl, i64)
+DEF_HELPER_4(smalxda, i64, env, tl, tl, i64)
+DEF_HELPER_4(smalds, i64, env, tl, tl, i64)
+DEF_HELPER_4(smalxds, i64, env, tl, tl, i64)
+DEF_HELPER_4(smaldrs, i64, env, tl, tl, i64)
+DEF_HELPER_4(smslda, i64, env, tl, tl, i64)
+DEF_HELPER_4(smslxda, i64, env, tl, tl, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 60b8b3617b..82ee24c563 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -817,3 +817,14 @@ kmar64     1001010  ..... ..... 001 ..... 1111111 @r
 kmsr64     1001011  ..... ..... 001 ..... 1111111 @r
 ukmar64    1011010  ..... ..... 001 ..... 1111111 @r
 ukmsr64    1011011  ..... ..... 001 ..... 1111111 @r
+
+smalbb     1000100  ..... ..... 001 ..... 1111111 @r
+smalbt     1001100  ..... ..... 001 ..... 1111111 @r
+smaltt     1010100  ..... ..... 001 ..... 1111111 @r
+smalda     1000110  ..... ..... 001 ..... 1111111 @r
+smalxda    1001110  ..... ..... 001 ..... 1111111 @r
+smalds     1000101  ..... ..... 001 ..... 1111111 @r
+smaldrs    1001101  ..... ..... 001 ..... 1111111 @r
+smalxds    1010101  ..... ..... 001 ..... 1111111 @r
+smslda     1010110  ..... ..... 001 ..... 1111111 @r
+smslxda    1011110  ..... ..... 001 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 3e62024aac..ddaca3d20b 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -805,3 +805,15 @@ GEN_RVP_R_D64_ACC_OOL(kmar64);
 GEN_RVP_R_D64_ACC_OOL(kmsr64);
 GEN_RVP_R_D64_ACC_OOL(ukmar64);
 GEN_RVP_R_D64_ACC_OOL(ukmsr64);
+
+/* Signed 16-bit Multiply with 64-bit Add/Subtract Instructions */
+GEN_RVP_R_D64_ACC_OOL(smalbb);
+GEN_RVP_R_D64_ACC_OOL(smalbt);
+GEN_RVP_R_D64_ACC_OOL(smaltt);
+GEN_RVP_R_D64_ACC_OOL(smalda);
+GEN_RVP_R_D64_ACC_OOL(smalxda);
+GEN_RVP_R_D64_ACC_OOL(smalds);
+GEN_RVP_R_D64_ACC_OOL(smaldrs);
+GEN_RVP_R_D64_ACC_OOL(smalxds);
+GEN_RVP_R_D64_ACC_OOL(smslda);
+GEN_RVP_R_D64_ACC_OOL(smslxda);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 3cbe9e51cc..4e4722c20e 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -2384,3 +2384,154 @@ static inline void do_ukmsr64(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR64_ACC(ukmsr64, 1, 4);
+
+/* Signed 16-bit Multiply with 64-bit Add/Subtract Instructions */
+static inline void do_smalbb(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+
+    if (i == 0) {
+        *d = *c;
+    }
+
+    *d += (int64_t)a[H2(i)] * b[H2(i)];
+}
+
+RVPR64_ACC(smalbb, 2, 2);
+
+static inline void do_smalbt(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+
+    if (i == 0) {
+        *d = *c;
+    }
+
+    *d += (int64_t)a[H2(i)] * b[H2(i + 1)];
+}
+
+RVPR64_ACC(smalbt, 2, 2);
+
+static inline void do_smaltt(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+
+    if (i == 0) {
+        *d = *c;
+    }
+
+    *d += (int64_t)a[H2(i + 1)] * b[H2(i + 1)];
+}
+
+RVPR64_ACC(smaltt, 2, 2);
+
+static inline void do_smalda(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+
+    if (i == 0) {
+        *d = *c;
+    }
+
+    *d += (int64_t)a[H2(i)] * b[H2(i)] + (int64_t)a[H2(i + 1)] * b[H2(i + 1)];
+}
+
+RVPR64_ACC(smalda, 2, 2);
+
+static inline void do_smalxda(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+
+    if (i == 0) {
+        *d = *c;
+    }
+
+    *d += (int64_t)a[H2(i)] * b[H2(i + 1)] + (int64_t)a[H2(i + 1)] * b[H2(i)];
+}
+
+RVPR64_ACC(smalxda, 2, 2);
+
+static inline void do_smalds(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+
+    if (i == 0) {
+        *d = *c;
+    }
+
+    *d += (int64_t)a[H2(i + 1)] * b[H2(i + 1)] - (int64_t)a[H2(i)] * b[H2(i)];
+}
+
+RVPR64_ACC(smalds, 2, 2);
+
+static inline void do_smaldrs(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+
+    if (i == 0) {
+        *d = *c;
+    }
+
+    *d += (int64_t)a[H2(i)] * b[H2(i)] - (int64_t)a[H2(i + 1)] * b[H2(i + 1)];
+}
+
+RVPR64_ACC(smaldrs, 2, 2);
+
+static inline void do_smalxds(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+
+    if (i == 0) {
+        *d = *c;
+    }
+
+    *d += (int64_t)a[H2(i + 1)] * b[H2(i)] - (int64_t)a[H2(i)] * b[H2(i + 1)];
+}
+
+RVPR64_ACC(smalxds, 2, 2);
+
+static inline void do_smslda(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+
+    if (i == 0) {
+        *d = *c;
+    }
+
+    *d -= (int64_t)a[H2(i)] * b[H2(i)] + (int64_t)a[H2(i + 1)] * b[H2(i + 1)];
+}
+
+RVPR64_ACC(smslda, 2, 2);
+
+static inline void do_smslxda(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int16_t *a = va, *b = vb;
+
+    if (i == 0) {
+        *d = *c;
+    }
+
+    *d -= (int64_t)a[H2(i + 1)] * b[H2(i)] + (int64_t)a[H2(i)] * b[H2(i + 1)];
+}
+
+RVPR64_ACC(smslxda, 2, 2);
-- 
2.17.1


