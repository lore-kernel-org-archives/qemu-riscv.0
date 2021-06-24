Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwN5h-0007ro-AZ
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 07:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN5f-0007mZ-Cd; Thu, 24 Jun 2021 07:00:11 -0400
Received: from out28-145.mail.aliyun.com ([115.124.28.145]:32931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN5c-0006g6-I0; Thu, 24 Jun 2021 07:00:10 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3558505|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.77407-0.00350292-0.222427;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047188; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXK1Ipz_1624532401; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXK1Ipz_1624532401)
 by smtp.aliyun-inc.com(10.147.42.197);
 Thu, 24 Jun 2021 19:00:01 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 07/37] target/riscv: SIMD 16-bit Compare Instructions
Date: Thu, 24 Jun 2021 18:54:51 +0800
Message-Id: <20210624105521.3964-8-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.145; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-145.mail.aliyun.com
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
X-List-Received-Date: Thu, 24 Jun 2021 11:00:12 -0000

There are 5 instructions here, including 16-bit compare
equal, signed less than, signed less than & equal,
unsigned less than, unsigned less than & equal.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com
---
 target/riscv/helper.h                   |  6 ++++
 target/riscv/insn32.decode              |  6 ++++
 target/riscv/insn_trans/trans_rvp.c.inc |  7 ++++
 target/riscv/packed_helper.c            | 46 +++++++++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 1b365135ff..830845761b 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1206,3 +1206,9 @@ DEF_HELPER_3(sll8, tl, env, tl, tl)
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
index 8b78fb24bc..5031cebf1f 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -809,3 +809,9 @@ ksll8      0110110  ..... ..... 000 ..... 1110111 @r
 kslli8     0111110  01... ..... 000 ..... 1110111 @sh3
 kslra8     0101111  ..... ..... 000 ..... 1110111 @r
 kslra8_u   0110111  ..... ..... 000 ..... 1110111 @r
+
+cmpeq16    0100110  ..... ..... 000 ..... 1110111 @r
+scmplt16   0000110  ..... ..... 000 ..... 1110111 @r
+scmple16   0001110  ..... ..... 000 ..... 1110111 @r
+ucmplt16   0010110  ..... ..... 000 ..... 1110111 @r
+ucmple16   0011110  ..... ..... 000 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index e6c5f2ddf5..65199ffb5a 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -203,3 +203,10 @@ GEN_RVP_SHIFTI(slli8, tcg_gen_vec_shl8i_tl, gen_helper_sll8);
 GEN_RVP_SHIFTI(srai8_u, NULL, gen_helper_sra8_u);
 GEN_RVP_SHIFTI(srli8_u, NULL, gen_helper_srl8_u);
 GEN_RVP_SHIFTI(kslli8, NULL, gen_helper_ksll8);
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


