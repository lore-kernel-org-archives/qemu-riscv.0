Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrFq0-0003p6-Go
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 04:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFpu-0003ix-3v; Thu, 10 Jun 2021 04:14:47 -0400
Received: from mail142-36.mail.alibaba.com ([198.11.142.36]:5533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFpq-0006EK-Mn; Thu, 10 Jun 2021 04:14:45 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07854751|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.600505-0.00222066-0.397274;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KQMqNB5_1623312869; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQMqNB5_1623312869)
 by smtp.aliyun-inc.com(10.147.41.137);
 Thu, 10 Jun 2021 16:14:29 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 30/37] target/riscv: RV64 Only SIMD 32-bit Miscellaneous
 Instructions
Date: Thu, 10 Jun 2021 15:59:01 +0800
Message-Id: <20210610075908.3305506-31-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.36; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-36.mail.alibaba.com
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
X-List-Received-Date: Thu, 10 Jun 2021 08:14:49 -0000

SIMD 32-bit absolute value, signed or unsigned maximum, minimum.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  6 +++
 target/riscv/insn32.decode              |  6 +++
 target/riscv/insn_trans/trans_rvp.c.inc | 15 +++++++
 target/riscv/packed_helper.c            | 55 +++++++++++++++++++++++++
 4 files changed, 82 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 3b2a73db9a..d992859747 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1437,3 +1437,9 @@ DEF_HELPER_3(sll32, i64, env, i64, i64)
 DEF_HELPER_3(ksll32, i64, env, i64, i64)
 DEF_HELPER_3(kslra32, i64, env, i64, i64)
 DEF_HELPER_3(kslra32_u, i64, env, i64, i64)
+
+DEF_HELPER_3(smin32, i64, env, i64, i64)
+DEF_HELPER_3(umin32, i64, env, i64, i64)
+DEF_HELPER_3(smax32, i64, env, i64, i64)
+DEF_HELPER_3(umax32, i64, env, i64, i64)
+DEF_HELPER_2(kabs32, tl, env, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 80150c693a..ee5f855f28 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -1060,3 +1060,9 @@ ksll32     0110010  ..... ..... 010 ..... 1110111 @r
 kslli32    1000010  ..... ..... 010 ..... 1110111 @sh5
 kslra32    0101011  ..... ..... 010 ..... 1110111 @r
 kslra32_u  0110011  ..... ..... 010 ..... 1110111 @r
+
+smin32     1001000  ..... ..... 010 ..... 1110111 @r
+umin32     1010000  ..... ..... 010 ..... 1110111 @r
+smax32     1001001  ..... ..... 010 ..... 1110111 @r
+umax32     1010001  ..... ..... 010 ..... 1110111 @r
+kabs32     1010110  10010 ..... 000 ..... 1110111 @r2
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 6cba14be84..77586e07e4 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1088,3 +1088,18 @@ GEN_RVP64_R_OOL(kslra32);
 GEN_RVP64_R_OOL(sra32_u);
 GEN_RVP64_R_OOL(srl32_u);
 GEN_RVP64_R_OOL(kslra32_u);
+
+/* (RV64 Only) SIMD 32-bit Miscellaneous Instructions */
+GEN_RVP64_R_OOL(smin32);
+GEN_RVP64_R_OOL(umin32);
+GEN_RVP64_R_OOL(smax32);
+GEN_RVP64_R_OOL(umax32);
+
+#define GEN_RVP64_R2_OOL(NAME)                         \
+static bool trans_##NAME(DisasContext *s, arg_r2 *a)   \
+{                                                      \
+    REQUIRE_64BIT(s);                                  \
+    return r2_ool(s, a, gen_helper_##NAME);            \
+}
+
+GEN_RVP64_R2_OOL(kabs32);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 74d42e4c33..a808dae9d8 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3367,3 +3367,58 @@ static inline void do_kslra32_u(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR64_64_64(kslra32_u, 1, 4);
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
+RVPR64_64_64(smin32, 1, 4);
+
+static inline void do_umin32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] < b[i]) ? a[i] : b[i];
+}
+
+RVPR64_64_64(umin32, 1, 4);
+
+static inline void do_smax32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] > b[i]) ? a[i] : b[i];
+}
+
+RVPR64_64_64(smax32, 1, 4);
+
+static inline void do_umax32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] > b[i]) ? a[i] : b[i];
+}
+
+RVPR64_64_64(umax32, 1, 4);
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
-- 
2.25.1


