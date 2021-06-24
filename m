Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwNIS-0005wT-2J
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 07:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNIO-0005qP-Vk; Thu, 24 Jun 2021 07:13:21 -0400
Received: from out29-196.mail.aliyun.com ([115.124.29.196]:56705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNIM-00069j-10; Thu, 24 Jun 2021 07:13:20 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1012007|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.55777-0.0156208-0.426609;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXKnvFF_1624533192; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKnvFF_1624533192)
 by smtp.aliyun-inc.com(10.147.44.118);
 Thu, 24 Jun 2021 19:13:13 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 33/37] target/riscv: RV64 Only 32-bit Multiply & Add
 Instructions
Date: Thu, 24 Jun 2021 18:55:17 +0800
Message-Id: <20210624105521.3964-34-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.29.196; envelope-from=zhiwei_liu@c-sky.com;
 helo=out29-196.mail.aliyun.com
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
X-List-Received-Date: Thu, 24 Jun 2021 11:13:21 -0000

32x32 multiplication result is added to a third register with Q63 saturation

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  4 ++++
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvp.c.inc |  5 ++++
 target/riscv/packed_helper.c            | 31 +++++++++++++++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 0fa48955d8..05f8f31367 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1456,3 +1456,7 @@ DEF_HELPER_4(kdmatt16, tl, env, tl, tl, tl)
 
 DEF_HELPER_3(smbt32, i64, env, i64, i64)
 DEF_HELPER_3(smtt32, i64, env, i64, i64)
+
+DEF_HELPER_4(kmabb32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmabt32, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmatt32, tl, env, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d06075c062..dec714a064 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -1079,3 +1079,7 @@ kdmatt16   1111100  ..... ..... 001 ..... 1110111 @r
 
 smbt32     0001100  ..... ..... 010 ..... 1110111 @r
 smtt32     0010100  ..... ..... 010 ..... 1110111 @r
+
+kmabb32    0101101  ..... ..... 010 ..... 1110111 @r
+kmabt32    0110101  ..... ..... 010 ..... 1110111 @r
+kmatt32    0111101  ..... ..... 010 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index a88ce7a5c4..2de81abbb8 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1126,3 +1126,8 @@ GEN_RVP64_R_ACC_OOL(kdmatt16);
 /* (RV64 Only) 32-bit Multiply Instructions */
 GEN_RVP64_R_OOL(smbt32);
 GEN_RVP64_R_OOL(smtt32);
+
+/* (RV64 Only) 32-bit Multiply & Add Instructions */
+GEN_RVP64_R_ACC_OOL(kmabb32);
+GEN_RVP64_R_ACC_OOL(kmabt32);
+GEN_RVP64_R_ACC_OOL(kmatt32);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index eb086b775f..3c05c748c4 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3582,3 +3582,34 @@ static inline void do_smtt32(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR64_64_64(smtt32, 1, 8);
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
+RVPR_ACC(kmabb32, 1, 8);
+
+static inline void do_kmabt32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    *d = sadd64(env, 0, (int64_t)a[H4(2 * i)] * b[H4(2 * i + 1)], *c);
+}
+
+RVPR_ACC(kmabt32, 1, 8);
+
+static inline void do_kmatt32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int64_t *d = vd, *c = vc;
+    int32_t *a = va, *b = vb;
+    *d = sadd64(env, 0, (int64_t)a[H4(2 * i + 1)] * b[H4(2 * i + 1)], *c);
+}
+
+RVPR_ACC(kmatt32, 1, 8);
-- 
2.17.1


