Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAaev-0000EG-Hg
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaet-0000AT-V2; Fri, 12 Feb 2021 10:47:03 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:54637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaes-00062p-23; Fri, 12 Feb 2021 10:47:03 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1166958|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.533591-0.0146714-0.451738;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHU1d9_1613144815; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHU1d9_1613144815)
 by smtp.aliyun-inc.com(10.147.42.241);
 Fri, 12 Feb 2021 23:46:55 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 21/38] target/riscv: 8-bit Multiply with 32-bit Add
 Instructions
Date: Fri, 12 Feb 2021 23:02:39 +0800
Message-Id: <20210212150256.885-22-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 15:47:04 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  4 +++
 target/riscv/insn32.decode              |  4 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  5 +++
 target/riscv/packed_helper.c            | 44 +++++++++++++++++++++++++
 4 files changed, 57 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 7c3a0654d6..0ddd07b305 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1323,3 +1323,7 @@ DEF_HELPER_2(clz32, tl, env, tl)
 DEF_HELPER_2(clo32, tl, env, tl)
 DEF_HELPER_3(pbsad, tl, env, tl, tl)
 DEF_HELPER_4(pbsada, tl, env, tl, tl, tl)
+
+DEF_HELPER_4(smaqa, tl, env, tl, tl, tl)
+DEF_HELPER_4(umaqa, tl, env, tl, tl, tl)
+DEF_HELPER_4(smaqa_su, tl, env, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 12e95f9c5f..6a50abca21 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -793,3 +793,7 @@ clz32      1010111  11001 ..... 000 ..... 1111111 @r2
 clo32      1010111  11011 ..... 000 ..... 1111111 @r2
 pbsad      1111110  ..... ..... 000 ..... 1111111 @r
 pbsada     1111111  ..... ..... 000 ..... 1111111 @r
+
+smaqa      1100100  ..... ..... 000 ..... 1111111 @r
+umaqa      1100110  ..... ..... 000 ..... 1111111 @r
+smaqa_su   1100101  ..... ..... 000 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 42656682c6..0877cd04b4 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -665,3 +665,8 @@ GEN_RVP_R2_OOL(clz32);
 GEN_RVP_R2_OOL(clo32);
 GEN_RVP_R_OOL(pbsad);
 GEN_RVP_R_ACC_OOL(pbsada);
+
+/* 8-bit Multiply with 32-bit Add Instructions */
+GEN_RVP_R_ACC_OOL(smaqa);
+GEN_RVP_R_ACC_OOL(umaqa);
+GEN_RVP_R_ACC_OOL(smaqa_su);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 96e73c045b..02a0f912e9 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -2053,3 +2053,47 @@ static inline void do_pbsada(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR_ACC(pbsada, 1, 1);
+
+/* 8-bit Multiply with 32-bit Add Instructions */
+static inline void do_smaqa(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    int8_t *a = va, *b = vb;
+    int32_t *d = vd, *c = vc;
+
+    d[H4(i)] = c[H4(i)] + a[H1(i * 4)] * b[H1(i * 4)] +
+               a[H1(i * 4 + 1)] * b[H1(i * 4 + 1)] +
+               a[H1(i * 4 + 2)] * b[H1(i * 4 + 2)] +
+               a[H1(i * 4 + 3)] * b[H1(i * 4 + 3)];
+}
+
+RVPR_ACC(smaqa, 1, 4);
+
+static inline void do_umaqa(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    uint8_t *a = va, *b = vb;
+    uint32_t *d = vd, *c = vc;
+
+    d[H4(i)] = c[H4(i)] + a[H1(i * 4)] * b[H1(i * 4)] +
+               a[H1(i * 4 + 1)] * b[H1(i * 4 + 1)] +
+               a[H1(i * 4 + 2)] * b[H1(i * 4 + 2)] +
+               a[H1(i * 4 + 3)] * b[H1(i * 4 + 3)];
+}
+
+RVPR_ACC(umaqa, 1, 4);
+
+static inline void do_smaqa_su(CPURISCVState *env, void *vd, void *va,
+                               void *vb, void *vc, uint8_t i)
+{
+    int8_t *a = va;
+    uint8_t *b = vb;
+    int32_t *d = vd, *c = vc;
+
+    d[H4(i)] = c[H4(i)] + a[H1(i * 4)] * b[H1(i * 4)] +
+               a[H1(i * 4 + 1)] * b[H1(i * 4 + 1)] +
+               a[H1(i * 4 + 2)] * b[H1(i * 4 + 2)] +
+               a[H1(i * 4 + 3)] * b[H1(i * 4 + 3)];
+}
+
+RVPR_ACC(smaqa_su, 1, 4);
-- 
2.17.1


