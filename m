Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwN96-0005Ay-Qn
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 07:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN94-000541-GL; Thu, 24 Jun 2021 07:03:42 -0400
Received: from out28-75.mail.aliyun.com ([115.124.28.75]:36960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN91-0000qW-Qw; Thu, 24 Jun 2021 07:03:42 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07677392|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.471962-0.0122629-0.515775;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXKPB4b_1624532614; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKPB4b_1624532614)
 by smtp.aliyun-inc.com(10.147.42.241);
 Thu, 24 Jun 2021 19:03:34 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 14/37] target/riscv: 16-bit Packing Instructions
Date: Thu, 24 Jun 2021 18:54:58 +0800
Message-Id: <20210624105521.3964-15-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.75; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-75.mail.aliyun.com
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
X-List-Received-Date: Thu, 24 Jun 2021 11:03:43 -0000

Concat 16-bit elements from source register to 32-bit element
in destination register.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  5 +++
 target/riscv/insn32.decode              |  5 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  9 +++++
 target/riscv/packed_helper.c            | 45 +++++++++++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9fd2a70f7d..9872f5efbd 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1266,3 +1266,8 @@ DEF_HELPER_2(zunpkd820, tl, env, tl)
 DEF_HELPER_2(zunpkd830, tl, env, tl)
 DEF_HELPER_2(zunpkd831, tl, env, tl)
 DEF_HELPER_2(zunpkd832, tl, env, tl)
+
+DEF_HELPER_3(pkbb16, tl, env, tl, tl)
+DEF_HELPER_3(pkbt16, tl, env, tl, tl)
+DEF_HELPER_3(pktt16, tl, env, tl, tl)
+DEF_HELPER_3(pktb16, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 9b8ea0f9ab..0b6830c76e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -869,3 +869,8 @@ zunpkd820  1010110  01101 ..... 000 ..... 1110111 @r2
 zunpkd830  1010110  01110 ..... 000 ..... 1110111 @r2
 zunpkd831  1010110  01111 ..... 000 ..... 1110111 @r2
 zunpkd832  1010110  10111 ..... 000 ..... 1110111 @r2
+
+pkbb16     0000111  ..... ..... 001 ..... 1110111 @r
+pkbt16     0001111  ..... ..... 001 ..... 1110111 @r
+pktt16     0010111  ..... ..... 001 ..... 1110111 @r
+pktb16     0011111  ..... ..... 001 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 5af2c7c2cc..b5bd8b1406 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -360,3 +360,12 @@ GEN_RVP_R2_OOL(zunpkd820);
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
index 8226dbd079..f6cea654b2 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -1314,3 +1314,48 @@ do_zunpkd832(CPURISCVState *env, void *vd, void *va, uint8_t i)
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


