Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAaFi-0005Lm-Qv
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaFh-0005KT-NO; Fri, 12 Feb 2021 10:21:01 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:59105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaFf-0002xZ-0Q; Fri, 12 Feb 2021 10:21:01 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07474588|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.611419-0.0204294-0.368152;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYGkEtq_1613143244; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYGkEtq_1613143244)
 by smtp.aliyun-inc.com(10.147.41.231);
 Fri, 12 Feb 2021 23:20:45 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 08/38] target/riscv: SIMD 16-bit Compare Instructions
Date: Fri, 12 Feb 2021 23:02:26 +0800
Message-Id: <20210212150256.885-9-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 15:21:02 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  6 ++++
 target/riscv/insn32.decode              |  6 ++++
 target/riscv/insn_trans/trans_rvp.c.inc |  7 ++++
 target/riscv/packed_helper.c            | 46 +++++++++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 0ecd4d53f9..f41f9acccc 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1202,3 +1202,9 @@ DEF_HELPER_3(sll8, tl, env, tl, tl)
 DEF_HELPER_3(ksll8, tl, env, tl, tl)
 DEF_HELPER_3(kslra8, tl, env, tl, tl)
 DEF_HELPER_3(kslra8_u, tl, env, tl, tl)
+
+DEF_HELPER_3(cmpeq16, tl, env, tl, tl)
+DEF_HELPER_3(scmplt16, tl, env, tl, tl)
+DEF_HELPER_3(scmple16, tl, env, tl, tl)
+DEF_HELPER_3(ucmplt16, tl, env, tl, tl)
+DEF_HELPER_3(ucmple16, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index cc782fcde5..f3cd508396 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -669,3 +669,9 @@ ksll8      0110110  ..... ..... 000 ..... 1111111 @r
 kslli8     0111110  01... ..... 000 ..... 1111111 @sh3
 kslra8     0101111  ..... ..... 000 ..... 1111111 @r
 kslra8_u   0110111  ..... ..... 000 ..... 1111111 @r
+
+cmpeq16    0100110  ..... ..... 000 ..... 1111111 @r
+scmplt16   0000110  ..... ..... 000 ..... 1111111 @r
+scmple16   0001110  ..... ..... 000 ..... 1111111 @r
+ucmplt16   0010110  ..... ..... 000 ..... 1111111 @r
+ucmple16   0011110  ..... ..... 000 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 12a64849eb..6438dfb776 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -369,3 +369,10 @@ GEN_RVP_SHIFTI(slli8, sll8, tcg_gen_vec_shl8i_i64);
 GEN_RVP_SHIFTI(srai8_u, sra8_u, NULL);
 GEN_RVP_SHIFTI(srli8_u, srl8_u, NULL);
 GEN_RVP_SHIFTI(kslli8, ksll8, NULL);
+
+/* SIMD 16-bit Compare Instructions */
+GEN_RVP_R_OOL(cmpeq16);
+GEN_RVP_R_OOL(scmplt16);
+GEN_RVP_R_OOL(scmple16);
+GEN_RVP_R_OOL(ucmplt16);
+GEN_RVP_R_OOL(ucmple16);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index ab9ebc472b..30b916b5ad 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -631,3 +631,49 @@ static inline void do_kslra8_u(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(kslra8_u, 1, 1);
+
+/* SIMD 16-bit Compare Instructions */
+static inline void do_cmpeq16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[i] = (a[i] == b[i]) ? 0xffff : 0x0;
+}
+
+RVPR(cmpeq16, 1, 2);
+
+static inline void do_scmplt16(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+    d[i] = (a[i] < b[i]) ? 0xffff : 0x0;
+}
+
+RVPR(scmplt16, 1, 2);
+
+static inline void do_scmple16(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+    d[i] = (a[i] <= b[i]) ? 0xffff : 0x0;
+}
+
+RVPR(scmple16, 1, 2);
+
+static inline void do_ucmplt16(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[i] = (a[i] < b[i]) ? 0xffff : 0x0;
+}
+
+RVPR(ucmplt16, 1, 2);
+
+static inline void do_ucmple16(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+    d[i] = (a[i] <= b[i]) ? 0xffff : 0x0;
+}
+
+RVPR(ucmple16, 1, 2);
-- 
2.17.1


