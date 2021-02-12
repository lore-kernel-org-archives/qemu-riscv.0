Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAaTJ-0001a4-KS
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:35:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaTI-0001Yz-9n; Fri, 12 Feb 2021 10:35:04 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:48853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaTF-0000oe-MQ; Fri, 12 Feb 2021 10:35:04 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07763708|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.491993-0.0148987-0.493109;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYGrWqn_1613144090; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYGrWqn_1613144090)
 by smtp.aliyun-inc.com(10.147.42.22); Fri, 12 Feb 2021 23:34:50 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 15/38] target/riscv: 16-bit Packing Instructions
Date: Fri, 12 Feb 2021 23:02:33 +0800
Message-Id: <20210212150256.885-16-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 15:35:04 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  5 +++
 target/riscv/insn32.decode              |  5 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  9 +++++
 target/riscv/packed_helper.c            | 45 +++++++++++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 585905a689..4dc66cf4cc 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1263,3 +1263,8 @@ DEF_HELPER_2(zunpkd820, tl, env, tl)
 DEF_HELPER_2(zunpkd830, tl, env, tl)
 DEF_HELPER_2(zunpkd831, tl, env, tl)
 DEF_HELPER_2(zunpkd832, tl, env, tl)
+
+DEF_HELPER_3(pkbb16, tl, env, tl, tl)
+DEF_HELPER_3(pkbt16, tl, env, tl, tl)
+DEF_HELPER_3(pktt16, tl, env, tl, tl)
+DEF_HELPER_3(pktb16, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index fa4a02c9db..a4d9ff2282 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -731,3 +731,8 @@ zunpkd820  1010110  01101 ..... 000 ..... 1111111 @r2
 zunpkd830  1010110  01110 ..... 000 ..... 1111111 @r2
 zunpkd831  1010110  01111 ..... 000 ..... 1111111 @r2
 zunpkd832  1010110  10111 ..... 000 ..... 1111111 @r2
+
+pkbb16     0000111  ..... ..... 001 ..... 1111111 @r
+pkbt16     0001111  ..... ..... 001 ..... 1111111 @r
+pktt16     0010111  ..... ..... 001 ..... 1111111 @r
+pktb16     0011111  ..... ..... 001 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index b69e964cb4..99a19019eb 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -511,3 +511,12 @@ GEN_RVP_R2_OOL(zunpkd820);
 GEN_RVP_R2_OOL(zunpkd830);
 GEN_RVP_R2_OOL(zunpkd831);
 GEN_RVP_R2_OOL(zunpkd832);
+
+/*
+ *** Partial-SIMD Data Processing Instruction
+ */
+/* 16-bit Packing Instructions */
+GEN_RVP_R_OOL(pkbb16);
+GEN_RVP_R_OOL(pkbt16);
+GEN_RVP_R_OOL(pktt16);
+GEN_RVP_R_OOL(pktb16);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index d0dcb692f5..fe1b48c86d 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -1323,3 +1323,48 @@ do_zunpkd832(CPURISCVState *env, void *vd, void *va, uint8_t i)
 }
 
 RVPR2(zunpkd832, 4, 1);
+
+/*
+ *** Partial-SIMD Data Processing Instructions
+ */
+
+/* 16-bit Packing Instructions */
+static inline void do_pkbb16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[H2(i + 1)] = a[H2(i)];
+    d[H2(i)] = b[H2(i)];
+}
+
+RVPR(pkbb16, 2, 2);
+
+static inline void do_pkbt16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[H2(i + 1)] = a[H2(i)];
+    d[H2(i)] = b[H2(i + 1)];
+}
+
+RVPR(pkbt16, 2, 2);
+
+static inline void do_pktt16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[H2(i + 1)] = a[H2(i + 1)];
+    d[H2(i)] = b[H2(i + 1)];
+}
+
+RVPR(pktt16, 2, 2);
+
+static inline void do_pktb16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[H2(i + 1)] = a[H2(i + 1)];
+    d[H2(i)] = b[H2(i)];
+}
+
+RVPR(pktb16, 2, 2);
-- 
2.17.1


