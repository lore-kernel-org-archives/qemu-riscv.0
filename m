Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwNIH-0005OF-1G
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 07:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNI9-0005JR-Fv; Thu, 24 Jun 2021 07:13:06 -0400
Received: from mail142-26.mail.alibaba.com ([198.11.142.26]:36107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNI6-00062G-6u; Thu, 24 Jun 2021 07:13:05 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1482758|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.566915-0.00750245-0.425582;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXKmmKo_1624533162; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKmmKo_1624533162)
 by smtp.aliyun-inc.com(10.147.40.233);
 Thu, 24 Jun 2021 19:12:42 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 32/37] target/riscv: RV64 Only 32-bit Multiply Instructions
Date: Thu, 24 Jun 2021 18:55:16 +0800
Message-Id: <20210624105521.3964-33-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=198.11.142.26; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-26.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 24 Jun 2021 11:13:08 -0000

Multiply the straight or crossed 32-bit elements of two registers.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  3 +++
 target/riscv/insn32.decode              |  3 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  4 ++++
 target/riscv/packed_helper.c            | 21 +++++++++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 5edaf389e4..0fa48955d8 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1453,3 +1453,6 @@ DEF_HELPER_3(kdmtt16, i64, env, i64, i64)
 DEF_HELPER_4(kdmabb16, tl, env, tl, tl, tl)
 DEF_HELPER_4(kdmabt16, tl, env, tl, tl, tl)
 DEF_HELPER_4(kdmatt16, tl, env, tl, tl, tl)
+
+DEF_HELPER_3(smbt32, i64, env, i64, i64)
+DEF_HELPER_3(smtt32, i64, env, i64, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a7b5643d5f..d06075c062 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -1076,3 +1076,6 @@ kdmtt16    1111101  ..... ..... 001 ..... 1110111 @r
 kdmabb16   1101100  ..... ..... 001 ..... 1110111 @r
 kdmabt16   1110100  ..... ..... 001 ..... 1110111 @r
 kdmatt16   1111100  ..... ..... 001 ..... 1110111 @r
+
+smbt32     0001100  ..... ..... 010 ..... 1110111 @r
+smtt32     0010100  ..... ..... 010 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index aa97161697..a88ce7a5c4 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1122,3 +1122,7 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)    \
 GEN_RVP64_R_ACC_OOL(kdmabb16);
 GEN_RVP64_R_ACC_OOL(kdmabt16);
 GEN_RVP64_R_ACC_OOL(kdmatt16);
+
+/* (RV64 Only) 32-bit Multiply Instructions */
+GEN_RVP64_R_OOL(smbt32);
+GEN_RVP64_R_OOL(smtt32);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 32e0af2ef6..eb086b775f 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3561,3 +3561,24 @@ static inline void do_kdmatt16(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR_ACC(kdmatt16, 2, 2);
+
+/* (RV64 Only) 32-bit Multiply Instructions */
+static inline void do_smbt32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va, *b = vb;
+    *d = (int64_t)a[H4(2 * i)] * b[H4(2 * i + 1)];
+}
+
+RVPR64_64_64(smbt32, 1, 8);
+
+static inline void do_smtt32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va, *b = vb;
+    *d = (int64_t)a[H4(2 * i + 1)] * b[H4(2 * i + 1)];
+}
+
+RVPR64_64_64(smtt32, 1, 8);
-- 
2.17.1


