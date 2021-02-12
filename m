Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAamp-0006Oq-C5
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAamk-0006NY-Sy; Fri, 12 Feb 2021 10:55:11 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:35260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAami-0001Bn-H3; Fri, 12 Feb 2021 10:55:10 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07459647|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.707569-0.0142568-0.278174;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHO3nZ_1613145298; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHO3nZ_1613145298)
 by smtp.aliyun-inc.com(10.147.40.44); Fri, 12 Feb 2021 23:54:59 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 25/38] target/riscv: Non-SIMD Q15 saturation ALU Instructions
Date: Fri, 12 Feb 2021 23:02:43 +0800
Message-Id: <20210212150256.885-26-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 15:55:11 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  8 +++
 target/riscv/insn32.decode              |  8 +++
 target/riscv/insn_trans/trans_rvp.c.inc | 12 ++++
 target/riscv/packed_helper.c            | 78 +++++++++++++++++++++++++
 4 files changed, 106 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 3ec4477ce8..fdfd3177db 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1358,3 +1358,11 @@ DEF_HELPER_4(smalxds, i64, env, tl, tl, i64)
 DEF_HELPER_4(smaldrs, i64, env, tl, tl, i64)
 DEF_HELPER_4(smslda, i64, env, tl, tl, i64)
 DEF_HELPER_4(smslxda, i64, env, tl, tl, i64)
+
+DEF_HELPER_3(kaddh, tl, env, tl, tl)
+DEF_HELPER_3(ksubh, tl, env, tl, tl)
+DEF_HELPER_3(khmbb, tl, env, tl, tl)
+DEF_HELPER_3(khmbt, tl, env, tl, tl)
+DEF_HELPER_3(khmtt, tl, env, tl, tl)
+DEF_HELPER_3(ukaddh, tl, env, tl, tl)
+DEF_HELPER_3(uksubh, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 82ee24c563..b31bec9c75 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -828,3 +828,11 @@ smaldrs    1001101  ..... ..... 001 ..... 1111111 @r
 smalxds    1010101  ..... ..... 001 ..... 1111111 @r
 smslda     1010110  ..... ..... 001 ..... 1111111 @r
 smslxda    1011110  ..... ..... 001 ..... 1111111 @r
+
+kaddh      0000010  ..... ..... 001 ..... 1111111 @r
+ksubh      0000011  ..... ..... 001 ..... 1111111 @r
+khmbb      0000110  ..... ..... 001 ..... 1111111 @r
+khmbt      0001110  ..... ..... 001 ..... 1111111 @r
+khmtt      0010110  ..... ..... 001 ..... 1111111 @r
+ukaddh     0001010  ..... ..... 001 ..... 1111111 @r
+uksubh     0001011  ..... ..... 001 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index ddaca3d20b..b4f6b74b70 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -817,3 +817,15 @@ GEN_RVP_R_D64_ACC_OOL(smaldrs);
 GEN_RVP_R_D64_ACC_OOL(smalxds);
 GEN_RVP_R_D64_ACC_OOL(smslda);
 GEN_RVP_R_D64_ACC_OOL(smslxda);
+
+/*
+ *** Non-SIMD Instructions
+ */
+/* Non-SIMD Q15 saturation ALU Instructions */
+GEN_RVP_R_OOL(kaddh);
+GEN_RVP_R_OOL(ksubh);
+GEN_RVP_R_OOL(khmbb);
+GEN_RVP_R_OOL(khmbt);
+GEN_RVP_R_OOL(khmtt);
+GEN_RVP_R_OOL(ukaddh);
+GEN_RVP_R_OOL(uksubh);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 4e4722c20e..68db0b1f61 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -2535,3 +2535,81 @@ static inline void do_smslxda(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR64_ACC(smslxda, 2, 2);
+
+/* Q15 saturation instructions */
+static inline void do_kaddh(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int32_t *a = va, *b = vb;
+
+    *d = sat64(env, (int64_t)a[H4(i)] + b[H4(i)], 15);
+}
+
+RVPR(kaddh, 2, 4);
+
+static inline void do_ksubh(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int32_t *a = va, *b = vb;
+
+    *d = sat64(env, (int64_t)a[H4(i)] - b[H4(i)], 15);
+}
+
+RVPR(ksubh, 2, 4);
+
+static inline void do_khmbb(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int16_t *a = va, *b = vb;
+
+    *d = sat64(env, (int64_t)a[H2(i)] * b[H2(i)] >> 15, 15);
+}
+
+RVPR(khmbb, 4, 2);
+
+static inline void do_khmbt(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int16_t *a = va, *b = vb;
+
+    *d = sat64(env, (int64_t)a[H2(i)] * b[H2(i + 1)] >> 15, 15);
+}
+
+RVPR(khmbt, 4, 2);
+
+static inline void do_khmtt(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int16_t *a = va, *b = vb;
+
+    *d = sat64(env, (int64_t)a[H2(i + 1)] * b[H2(i + 1)] >> 15, 15);
+}
+
+RVPR(khmtt, 4, 2);
+
+static inline void do_ukaddh(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    uint32_t *a = va, *b = vb;
+
+    *d = (int16_t)satu64(env, saddu32(env, 0, a[H4(i)], b[H4(i)]), 16);
+}
+
+RVPR(ukaddh, 2, 4);
+
+static inline void do_uksubh(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    uint32_t *a = va, *b = vb;
+
+    *d = (int16_t)satu64(env, ssubu32(env, 0, a[H4(i)], b[H4(i)]), 16);
+}
+
+RVPR(uksubh, 2, 4);
-- 
2.17.1


