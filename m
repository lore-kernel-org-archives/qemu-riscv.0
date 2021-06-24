Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwNJv-0002u6-4f
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 07:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNJs-0002j1-Im; Thu, 24 Jun 2021 07:14:52 -0400
Received: from out29-100.mail.aliyun.com ([115.124.29.100]:57974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNJq-0006Xp-0j; Thu, 24 Jun 2021 07:14:52 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08847741|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.625056-0.00864608-0.366298;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXKe4Zg_1624533284; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKe4Zg_1624533284)
 by smtp.aliyun-inc.com(10.147.41.187);
 Thu, 24 Jun 2021 19:14:44 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 36/37] target/riscv: RV64 Only 32-bit Packing Instructions
Date: Thu, 24 Jun 2021 18:55:20 +0800
Message-Id: <20210624105521.3964-37-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.29.100; envelope-from=zhiwei_liu@c-sky.com;
 helo=out29-100.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 24 Jun 2021 11:14:53 -0000

Concat two 32-bit elements to form a 64-bit element.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  5 +++
 target/riscv/insn32.decode              |  5 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  6 ++++
 target/riscv/packed_helper.c            | 41 +++++++++++++++++++++++++
 4 files changed, 57 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b998c86abf..bfcf0ff761 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1474,3 +1474,8 @@ DEF_HELPER_3(smdrs32, i64, env, i64, i64)
 DEF_HELPER_3(smxds32, i64, env, i64, i64)
 
 DEF_HELPER_3(sraiw_u, i64, env, i64, i64)
+
+DEF_HELPER_3(pkbb32, i64, env, i64, i64)
+DEF_HELPER_3(pkbt32, i64, env, i64, i64)
+DEF_HELPER_3(pktt32, i64, env, i64, i64)
+DEF_HELPER_3(pktb32, i64, env, i64, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 8e8aca4ea1..65682f70b5 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -1097,3 +1097,8 @@ smdrs32    0110100  ..... ..... 010 ..... 1110111 @r
 smxds32    0111100  ..... ..... 010 ..... 1110111 @r
 
 sraiw_u    0011010  ..... ..... 001 ..... 1110111 @sh5
+
+pkbb32     0000111  ..... ..... 010 ..... 1110111 @r
+pkbt32     0001111  ..... ..... 010 ..... 1110111 @r
+pktt32     0010111  ..... ..... 010 ..... 1110111 @r
+pktb32     0011111  ..... ..... 010 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 68c1ef9f48..7505a0f89b 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1147,3 +1147,9 @@ GEN_RVP64_R_OOL(smxds32);
 
 /* (RV64 Only) Non-SIMD 32-bit Shift Instructions */
 GEN_RVP64_SHIFTI(sraiw_u, gen_helper_sraiw_u);
+
+/* (RV64 Only) 32-bit Packing Instructions */
+GEN_RVP64_R_OOL(pkbb32);
+GEN_RVP64_R_OOL(pkbt32);
+GEN_RVP64_R_OOL(pktt32);
+GEN_RVP64_R_OOL(pktb32);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 42f1d96fa5..3f4bc593f9 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3808,3 +3808,44 @@ static inline void do_sraiw_u(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR64_64_64(sraiw_u, 1, 8);
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
+RVPR64_64_64(pkbb32, 2, 4);
+
+static inline void do_pkbt32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = b[H4(i + 1)];
+    d[H4(i + 1)] = a[H4(i)];
+}
+
+RVPR64_64_64(pkbt32, 2, 4);
+
+static inline void do_pktb32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = b[H4(i)];
+    d[H4(i + 1)] = a[H4(i + 1)];
+}
+
+RVPR64_64_64(pktb32, 2, 4);
+
+static inline void do_pktt32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = b[H4(i + 1)];
+    d[H4(i + 1)] = a[H4(i + 1)];
+}
+
+RVPR64_64_64(pktt32, 2, 4);
-- 
2.17.1


