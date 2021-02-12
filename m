Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAaI0-0008J7-UN
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaHz-0008IG-3D; Fri, 12 Feb 2021 10:23:23 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:53337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaHb-0003xi-RW; Fri, 12 Feb 2021 10:23:22 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07779463|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.666823-0.0180244-0.315153;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYH6mks_1613143365; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYH6mks_1613143365)
 by smtp.aliyun-inc.com(10.147.44.118);
 Fri, 12 Feb 2021 23:22:46 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 09/38] target/riscv: SIMD 8-bit Compare Instructions
Date: Fri, 12 Feb 2021 23:02:27 +0800
Message-Id: <20210212150256.885-10-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 15:23:23 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  6 ++++
 target/riscv/insn32.decode              |  6 ++++
 target/riscv/insn_trans/trans_rvp.c.inc |  7 ++++
 target/riscv/packed_helper.c            | 46 +++++++++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index f41f9acccc..4d9c36609c 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1208,3 +1208,9 @@ DEF_HELPER_3(scmplt16, tl, env, tl, tl)
 DEF_HELPER_3(scmple16, tl, env, tl, tl)
 DEF_HELPER_3(ucmplt16, tl, env, tl, tl)
 DEF_HELPER_3(ucmple16, tl, env, tl, tl)
+
+DEF_HELPER_3(cmpeq8, tl, env, tl, tl)
+DEF_HELPER_3(scmplt8, tl, env, tl, tl)
+DEF_HELPER_3(scmple8, tl, env, tl, tl)
+DEF_HELPER_3(ucmplt8, tl, env, tl, tl)
+DEF_HELPER_3(ucmple8, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f3cd508396..7519df7e20 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -675,3 +675,9 @@ scmplt16   0000110  ..... ..... 000 ..... 1111111 @r
 scmple16   0001110  ..... ..... 000 ..... 1111111 @r
 ucmplt16   0010110  ..... ..... 000 ..... 1111111 @r
 ucmple16   0011110  ..... ..... 000 ..... 1111111 @r
+
+cmpeq8     0100111  ..... ..... 000 ..... 1111111 @r
+scmplt8    0000111  ..... ..... 000 ..... 1111111 @r
+scmple8    0001111  ..... ..... 000 ..... 1111111 @r
+ucmplt8    0010111  ..... ..... 000 ..... 1111111 @r
+ucmple8    0011111  ..... ..... 000 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 6438dfb776..6eb9e83c6f 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -376,3 +376,10 @@ GEN_RVP_R_OOL(scmplt16);
 GEN_RVP_R_OOL(scmple16);
 GEN_RVP_R_OOL(ucmplt16);
 GEN_RVP_R_OOL(ucmple16);
+
+/* SIMD 8-bit Compare Instructions */
+GEN_RVP_R_OOL(cmpeq8);
+GEN_RVP_R_OOL(scmplt8);
+GEN_RVP_R_OOL(scmple8);
+GEN_RVP_R_OOL(ucmplt8);
+GEN_RVP_R_OOL(ucmple8);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 30b916b5ad..ff86e015e4 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -677,3 +677,49 @@ static inline void do_ucmple16(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(ucmple16, 1, 2);
+
+/* SIMD 8-bit Compare Instructions */
+static inline void do_cmpeq8(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va, *b = vb;
+    d[i] = (a[i] == b[i]) ? 0xff : 0x0;
+}
+
+RVPR(cmpeq8, 1, 1);
+
+static inline void do_scmplt8(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+    d[i] = (a[i] < b[i]) ? 0xff : 0x0;
+}
+
+RVPR(scmplt8, 1, 1);
+
+static inline void do_scmple8(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+    d[i] = (a[i] <= b[i]) ? 0xff : 0x0;
+}
+
+RVPR(scmple8, 1, 1);
+
+static inline void do_ucmplt8(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va, *b = vb;
+    d[i] = (a[i] < b[i]) ? 0xff : 0x0;
+}
+
+RVPR(ucmplt8, 1, 1);
+
+static inline void do_ucmple8(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va, *b = vb;
+    d[i] = (a[i] <= b[i]) ? 0xff : 0x0;
+}
+
+RVPR(ucmple8, 1, 1);
-- 
2.17.1


