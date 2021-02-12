Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAb2K-0003BC-9E
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 11:11:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAb2I-00038u-Ag; Fri, 12 Feb 2021 11:11:14 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:47941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAb2G-00083I-Eu; Fri, 12 Feb 2021 11:11:14 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0927783|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_regular_dialog|0.343025-0.00652002-0.650455;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHY1EE_1613146265; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHY1EE_1613146265)
 by smtp.aliyun-inc.com(10.147.41.178);
 Sat, 13 Feb 2021 00:11:05 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 33/38] target/riscv: RV64 Only 32-bit Multiply Instructions
Date: Fri, 12 Feb 2021 23:02:51 +0800
Message-Id: <20210212150256.885-34-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 16:11:14 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  3 +++
 target/riscv/insn32-64.decode           |  3 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  4 ++++
 target/riscv/packed_helper.c            | 19 +++++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index f8521a5388..198b010601 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1450,4 +1450,7 @@ DEF_HELPER_3(kdmtt16, tl, env, tl, tl)
 DEF_HELPER_4(kdmabb16, tl, env, tl, tl, tl)
 DEF_HELPER_4(kdmabt16, tl, env, tl, tl, tl)
 DEF_HELPER_4(kdmatt16, tl, env, tl, tl, tl)
+
+DEF_HELPER_3(smbt32, tl, env, tl, tl)
+DEF_HELPER_3(smtt32, tl, env, tl, tl)
 #endif
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 2e1c1817e4..46a4e5d080 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -145,3 +145,6 @@ kdmtt16    1111101  ..... ..... 001 ..... 1111111 @r
 kdmabb16   1101100  ..... ..... 001 ..... 1111111 @r
 kdmabt16   1110100  ..... ..... 001 ..... 1111111 @r
 kdmatt16   1111100  ..... ..... 001 ..... 1111111 @r
+
+smbt32     0001100  ..... ..... 010 ..... 1111111 @r
+smtt32     0010100  ..... ..... 010 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 2b4418abd8..33435c3a9e 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1190,4 +1190,8 @@ GEN_RVP_R_OOL(kdmtt16);
 GEN_RVP_R_ACC_OOL(kdmabb16);
 GEN_RVP_R_ACC_OOL(kdmabt16);
 GEN_RVP_R_ACC_OOL(kdmatt16);
+
+/* (RV64 Only) 32-bit Multiply Instructions */
+GEN_RVP_R_OOL(smbt32);
+GEN_RVP_R_OOL(smtt32);
 #endif
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 5636848aaf..11b41637a1 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3572,5 +3572,24 @@ static inline void do_kdmatt16(CPURISCVState *env, void *vd, void *va,
 
 RVPR_ACC(kdmatt16, 2, 2);
 
+/* (RV64 Only) 32-bit Multiply Instructions */
+static inline void do_smbt32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va, *b = vb;
+    *d = (int64_t)a[H4(2 * i)] * b[H4(4 * i + 1)];
+}
+
+RVPR(smbt32, 1, sizeof(target_ulong));
+
+static inline void do_smtt32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va, *b = vb;
+    *d = (int64_t)a[H4(2 * i + 1)] * b[H4(2 * i + 1)];
+}
 
+RVPR(smtt32, 1, sizeof(target_ulong));
 #endif
-- 
2.17.1


