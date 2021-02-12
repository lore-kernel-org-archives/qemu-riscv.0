Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAb4L-00055Q-Se
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 11:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAb4J-00051S-Hc; Fri, 12 Feb 2021 11:13:19 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:57647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAb4E-0000JO-SH; Fri, 12 Feb 2021 11:13:19 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07954361|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.375017-0.00787785-0.617105;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHSP3M_1613146386; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHSP3M_1613146386)
 by smtp.aliyun-inc.com(10.147.43.230);
 Sat, 13 Feb 2021 00:13:06 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 34/38] target/riscv: RV64 Only 32-bit Multiply & Add
 Instructions
Date: Fri, 12 Feb 2021 23:02:52 +0800
Message-Id: <20210212150256.885-35-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 16:13:19 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  4 ++++
 target/riscv/insn32-64.decode           |  4 ++++
 target/riscv/insn_trans/trans_rvp.c.inc |  5 ++++
 target/riscv/packed_helper.c            | 31 +++++++++++++++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 198b010601..05f7c1d811 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1453,4 +1453,8 @@ DEF_HELPER_4(kdmatt16, tl, env, tl, tl, tl)
 
 DEF_HELPER_3(smbt32, tl, env, tl, tl)
 DEF_HELPER_3(smtt32, tl, env, tl, tl)
+
+DEF_HELPER_4(kmabb32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmabt32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmatt32, tl, env, tl, tl, tl)
 #endif
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 46a4e5d080..c5b07a2667 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -148,3 +148,7 @@ kdmatt16   1111100  ..... ..... 001 ..... 1111111 @r
 
 smbt32     0001100  ..... ..... 010 ..... 1111111 @r
 smtt32     0010100  ..... ..... 010 ..... 1111111 @r
+
+kmabb32    0101101  ..... ..... 010 ..... 1111111 @r
+kmabt32    0110101  ..... ..... 010 ..... 1111111 @r
+kmatt32    0111101  ..... ..... 010 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 33435c3a9e..da6a4ba14a 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1194,4 +1194,9 @@ GEN_RVP_R_ACC_OOL(kdmatt16);
 /* (RV64 Only) 32-bit Multiply Instructions */
 GEN_RVP_R_OOL(smbt32);
 GEN_RVP_R_OOL(smtt32);
+
+/* (RV64 Only) 32-bit Multiply & Add Instructions */
+GEN_RVP_R_ACC_OOL(kmabb32);
+GEN_RVP_R_ACC_OOL(kmabt32);
+GEN_RVP_R_ACC_OOL(kmatt32);
 #endif
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 11b41637a1..99da28a4b3 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3592,4 +3592,35 @@ static inline void do_smtt32(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(smtt32, 1, sizeof(target_ulong));
+
+/* (RV64 Only) 32-bit Multiply & Add Instructions */
+static inline void do_kmabb32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    *d = sadd64(env, 0, (int64_t)a[H4(2 * i)] * b[H4(2 * i)], *c);
+}
+
+RVPR_ACC(kmabb32, 1, sizeof(target_ulong));
+
+static inline void do_kmabt32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    *d = sadd64(env, 0, (int64_t)a[H4(2 * i)] * b[H4(2 * i + 1)], *c);
+}
+
+RVPR_ACC(kmabt32, 1, sizeof(target_ulong));
+
+static inline void do_kmatt32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    *d = sadd64(env, 0, (int64_t)a[H4(2 * i + 1)] * b[H4(2 * i + 1)], *c);
+}
+
+RVPR_ACC(kmatt32, 1, sizeof(target_ulong));
 #endif
-- 
2.17.1


