Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAayU-0007Zv-KW
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 11:07:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAayT-0007YA-GF; Fri, 12 Feb 2021 11:07:17 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:52365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAayQ-00070W-50; Fri, 12 Feb 2021 11:07:17 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07504126|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.330753-0.0022886-0.666959;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047187; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHdfm5_1613146023; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHdfm5_1613146023)
 by smtp.aliyun-inc.com(10.147.42.135);
 Sat, 13 Feb 2021 00:07:04 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 31/38] target/riscv: RV64 Only SIMD 32-bit Miscellaneous
 Instructions
Date: Fri, 12 Feb 2021 23:02:49 +0800
Message-Id: <20210212150256.885-32-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 16:07:17 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  6 +++
 target/riscv/insn32-64.decode           |  6 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  7 ++++
 target/riscv/packed_helper.c            | 55 +++++++++++++++++++++++++
 4 files changed, 74 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 673bc4f628..384b42ce90 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1434,4 +1434,10 @@ DEF_HELPER_3(sll32, tl, env, tl, tl)
 DEF_HELPER_3(ksll32, tl, env, tl, tl)
 DEF_HELPER_3(kslra32, tl, env, tl, tl)
 DEF_HELPER_3(kslra32_u, tl, env, tl, tl)
+
+DEF_HELPER_3(smin32, tl, env, tl, tl)
+DEF_HELPER_3(umin32, tl, env, tl, tl)
+DEF_HELPER_3(smax32, tl, env, tl, tl)
+DEF_HELPER_3(umax32, tl, env, tl, tl)
+DEF_HELPER_2(kabs32, tl, env, tl)
 #endif
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 6f0f2923ca..a2b8831467 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -129,3 +129,9 @@ ksll32     0110010  ..... ..... 010 ..... 1111111 @r
 kslli32    1000010  ..... ..... 010 ..... 1111111 @sh5
 kslra32    0101011  ..... ..... 010 ..... 1111111 @r
 kslra32_u  0110011  ..... ..... 010 ..... 1111111 @r
+
+smin32     1001000  ..... ..... 010 ..... 1111111 @r
+umin32     1010000  ..... ..... 010 ..... 1111111 @r
+smax32     1001001  ..... ..... 010 ..... 1111111 @r
+umax32     1010001  ..... ..... 010 ..... 1111111 @r
+kabs32     1010110  10010 ..... 000 ..... 1111111 @r2
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index e52f268a57..ce144ee5c0 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1172,4 +1172,11 @@ GEN_RVP_R_OOL(ksll32);
 GEN_RVP_SHIFTI(kslli32, ksll32, NULL);
 GEN_RVP_R_OOL(kslra32);
 GEN_RVP_R_OOL(kslra32_u);
+
+/* (RV64 Only) SIMD 32-bit Miscellaneous Instructions */
+GEN_RVP_R_OOL(smin32);
+GEN_RVP_R_OOL(umin32);
+GEN_RVP_R_OOL(smax32);
+GEN_RVP_R_OOL(umax32);
+GEN_RVP_R2_OOL(kabs32);
 #endif
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index c168c51eff..c8a92f5b7d 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3377,4 +3377,59 @@ static inline void do_kslra32_u(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(kslra32_u, 1, 4);
+
+/* (RV64 Only) SIMD 32-bit Miscellaneous Instructions */
+static inline void do_smin32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] < b[i]) ? a[i] : b[i];
+}
+
+RVPR(smin32, 1, 4);
+
+static inline void do_umin32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] < b[i]) ? a[i] : b[i];
+}
+
+RVPR(umin32, 1, 4);
+
+static inline void do_smax32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] > b[i]) ? a[i] : b[i];
+}
+
+RVPR(smax32, 1, 4);
+
+static inline void do_umax32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] > b[i]) ? a[i] : b[i];
+}
+
+RVPR(umax32, 1, 4);
+
+static inline void do_kabs32(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+
+    if (a[i] == INT32_MIN) {
+        d[i] = INT32_MAX;
+        env->vxsat = 0x1;
+    } else {
+        d[i] = abs(a[i]);
+    }
+}
+
+RVPR2(kabs32, 1, 4);
 #endif
-- 
2.17.1


