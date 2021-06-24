Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwNEH-0006n6-QP
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 07:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNEF-0006gh-9f; Thu, 24 Jun 2021 07:09:03 -0400
Received: from mail142-28.mail.alibaba.com ([198.11.142.28]:36617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNEA-0004il-FF; Thu, 24 Jun 2021 07:09:03 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.074604|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.70221-0.0139448-0.283845;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXK-m59_1624532918; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXK-m59_1624532918)
 by smtp.aliyun-inc.com(10.147.41.158);
 Thu, 24 Jun 2021 19:08:38 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 24/37] target/riscv: Non-SIMD Q15 saturation ALU
 Instructions
Date: Thu, 24 Jun 2021 18:55:08 +0800
Message-Id: <20210624105521.3964-25-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=198.11.142.28; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-28.mail.alibaba.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
X-List-Received-Date: Thu, 24 Jun 2021 11:09:04 -0000

Q15 saturation is to limit the result to the range
[INT16_MIN, INT16_MAX].

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  8 +++
 target/riscv/insn32.decode              |  8 +++
 target/riscv/insn_trans/trans_rvp.c.inc | 12 ++++
 target/riscv/packed_helper.c            | 78 +++++++++++++++++++++++++
 4 files changed, 106 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 87a0779842..6ce22a186e 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1361,3 +1361,11 @@ DEF_HELPER_4(smalxds, i64, env, tl, tl, i64)
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
index d1668b34cb..f465851f03 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -964,3 +964,11 @@ smaldrs    1001101  ..... ..... 001 ..... 1110111 @r
 smalxds    1010101  ..... ..... 001 ..... 1110111 @r
 smslda     1010110  ..... ..... 001 ..... 1110111 @r
 smslxda    1011110  ..... ..... 001 ..... 1110111 @r
+
+kaddh      0000010  ..... ..... 001 ..... 1110111 @r
+ksubh      0000011  ..... ..... 001 ..... 1110111 @r
+khmbb      0000110  ..... ..... 001 ..... 1110111 @r
+khmbt      0001110  ..... ..... 001 ..... 1110111 @r
+khmtt      0010110  ..... ..... 001 ..... 1110111 @r
+ukaddh     0001010  ..... ..... 001 ..... 1110111 @r
+uksubh     0001011  ..... ..... 001 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 7c91bdc888..48eb190bc6 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -669,3 +669,15 @@ GEN_RVP_R_D64_ACC_OOL(smaldrs);
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
index 3330a2ecec..171f88face 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -2526,3 +2526,81 @@ static inline void do_smslxda(CPURISCVState *env, void *vd, void *va,
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


