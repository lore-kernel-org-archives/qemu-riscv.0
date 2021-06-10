Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrFey-0002vV-CB
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 04:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFew-0002mb-3j; Thu, 10 Jun 2021 04:03:26 -0400
Received: from out28-1.mail.aliyun.com ([115.124.28.1]:35454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFet-0008Cx-9O; Thu, 10 Jun 2021 04:03:25 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07664509|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.664607-0.0175856-0.317808;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=7; SR=0; TI=SMTPD_---.KQMleyO_1623312198; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQMleyO_1623312198)
 by smtp.aliyun-inc.com(10.147.44.145);
 Thu, 10 Jun 2021 16:03:18 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 08/37] target/riscv: SIMD 8-bit Compare Instructions
Date: Thu, 10 Jun 2021 15:58:39 +0800
Message-Id: <20210610075908.3305506-9-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.1; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-1.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 10 Jun 2021 08:03:26 -0000

There are 5 instructions here, including 8-bit compare
equal, signed less than, signed less than & equal,
unsigned less than, unsigned less than & equal.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  6 ++++
 target/riscv/insn32.decode              |  6 ++++
 target/riscv/insn_trans/trans_rvp.c.inc |  7 ++++
 target/riscv/packed_helper.c            | 46 +++++++++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 830845761b..c424e45fe5 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1212,3 +1212,9 @@ DEF_HELPER_3(scmplt16, tl, env, tl, tl)
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
index 5031cebf1f..fdbf3798c7 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -815,3 +815,9 @@ scmplt16   0000110  ..... ..... 000 ..... 1110111 @r
 scmple16   0001110  ..... ..... 000 ..... 1110111 @r
 ucmplt16   0010110  ..... ..... 000 ..... 1110111 @r
 ucmple16   0011110  ..... ..... 000 ..... 1110111 @r
+
+cmpeq8     0100111  ..... ..... 000 ..... 1110111 @r
+scmplt8    0000111  ..... ..... 000 ..... 1110111 @r
+scmple8    0001111  ..... ..... 000 ..... 1110111 @r
+ucmplt8    0010111  ..... ..... 000 ..... 1110111 @r
+ucmple8    0011111  ..... ..... 000 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 65199ffb5a..aa432701c8 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -210,3 +210,10 @@ GEN_RVP_R_OOL(scmplt16);
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
2.25.1


