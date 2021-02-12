Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAbAG-000338-NF
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 11:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAbAE-0002wz-Ga; Fri, 12 Feb 2021 11:19:26 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:44117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAbAA-0001zE-Cl; Fri, 12 Feb 2021 11:19:26 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07716797|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.317209-0.00875136-0.67404;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHUiP2_1613146748; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHUiP2_1613146748)
 by smtp.aliyun-inc.com(10.147.40.26); Sat, 13 Feb 2021 00:19:08 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 37/38] target/riscv: RV64 Only 32-bit Packing Instructions
Date: Fri, 12 Feb 2021 23:02:55 +0800
Message-Id: <20210212150256.885-38-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 16:19:27 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  5 +++
 target/riscv/insn32-64.decode           |  5 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  6 ++++
 target/riscv/packed_helper.c            | 41 +++++++++++++++++++++++++
 4 files changed, 57 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index d3dd1fb248..6e9c205481 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1471,4 +1471,9 @@ DEF_HELPER_3(smdrs32, tl, env, tl, tl)
 DEF_HELPER_3(smxds32, tl, env, tl, tl)
 
 DEF_HELPER_3(sraiw_u, tl, env, tl, tl)
+
+DEF_HELPER_3(pkbb32, tl, env, tl, tl)
+DEF_HELPER_3(pkbt32, tl, env, tl, tl)
+DEF_HELPER_3(pktt32, tl, env, tl, tl)
+DEF_HELPER_3(pktb32, tl, env, tl, tl)
 #endif
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 32066d3ac2..62cfd74830 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -166,3 +166,8 @@ smdrs32    0110100  ..... ..... 010 ..... 1111111 @r
 smxds32    0111100  ..... ..... 010 ..... 1111111 @r
 
 sraiw_u    0011010  ..... ..... 001 ..... 1111111 @sh5
+
+pkbb32     0000111  ..... ..... 010 ..... 1111111 @r
+pkbt32     0001111  ..... ..... 010 ..... 1111111 @r
+pktt32     0010111  ..... ..... 010 ..... 1111111 @r
+pktb32     0011111  ..... ..... 010 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 57827d2e15..868b308ed6 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1215,4 +1215,10 @@ GEN_RVP_R_OOL(smxds32);
 
 /* (RV64 Only) Non-SIMD 32-bit Shift Instructions */
 GEN_RVP_SHIFTI(sraiw_u, sraiw_u, NULL);
+
+/* (RV64 Only) 32-bit Packing Instructions */
+GEN_RVP_R_OOL(pkbb32);
+GEN_RVP_R_OOL(pkbt32);
+GEN_RVP_R_OOL(pktt32);
+GEN_RVP_R_OOL(pktb32);
 #endif
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 69a7788e99..e9add8fe5b 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3818,4 +3818,45 @@ static inline void do_sraiw_u(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(sraiw_u, 1, sizeof(target_ulong));
+
+/* (RV64 Only)  32-bit packing instructions here */
+static inline void do_pkbb32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = b[H4(i)];
+    d[H4(i + 1)] = a[H4(i)];
+}
+
+RVPR(pkbb32, 2, 4);
+
+static inline void do_pkbt32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = b[H4(i + 1)];
+    d[H4(i + 1)] = a[H4(i)];
+}
+
+RVPR(pkbt32, 2, 4);
+
+static inline void do_pktb32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = b[H4(i)];
+    d[H4(i + 1)] = a[H4(i + 1)];
+}
+
+RVPR(pktb32, 2, 4);
+
+static inline void do_pktt32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = b[H4(i + 1)];
+    d[H4(i + 1)] = a[H4(i + 1)];
+}
+
+RVPR(pktt32, 2, 4);
 #endif
-- 
2.17.1


