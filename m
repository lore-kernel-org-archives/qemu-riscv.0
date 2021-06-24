Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwN7J-00017T-7L
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 07:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN7D-00014M-Cs; Thu, 24 Jun 2021 07:01:48 -0400
Received: from out28-76.mail.aliyun.com ([115.124.28.76]:46183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwN75-0007xJ-Sm; Thu, 24 Jun 2021 07:01:45 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07760406|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.369954-0.000121005-0.629925;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXKLmLc_1624532492; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKLmLc_1624532492)
 by smtp.aliyun-inc.com(10.147.41.199);
 Thu, 24 Jun 2021 19:01:32 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 10/37] target/riscv: SIMD 8-bit Multiply Instructions
Date: Thu, 24 Jun 2021 18:54:54 +0800
Message-Id: <20210624105521.3964-11-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.76; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-76.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 24 Jun 2021 11:01:50 -0000

There are 6 instructions, including 8-bit signed or unsigned multiply,
8-bit signed or unsigned crossed multiply, Q7 signed or signed crossed
saturating multiply.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  7 ++
 target/riscv/insn32.decode              |  7 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  8 +++
 target/riscv/packed_helper.c            | 93 +++++++++++++++++++++++++
 4 files changed, 115 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index d13b84f165..4d0918b9a9 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1225,3 +1225,10 @@ DEF_HELPER_3(umul16, i64, env, tl, tl)
 DEF_HELPER_3(umulx16, i64, env, tl, tl)
 DEF_HELPER_3(khm16, tl, env, tl, tl)
 DEF_HELPER_3(khmx16, tl, env, tl, tl)
+
+DEF_HELPER_3(smul8, i64, env, tl, tl)
+DEF_HELPER_3(smulx8, i64, env, tl, tl)
+DEF_HELPER_3(umul8, i64, env, tl, tl)
+DEF_HELPER_3(umulx8, i64, env, tl, tl)
+DEF_HELPER_3(khm8, tl, env, tl, tl)
+DEF_HELPER_3(khmx8, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index cbee995229..05c3e67477 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -828,3 +828,10 @@ umul16     1011000  ..... ..... 000 ..... 1110111 @r
 umulx16    1011001  ..... ..... 000 ..... 1110111 @r
 khm16      1000011  ..... ..... 000 ..... 1110111 @r
 khmx16     1001011  ..... ..... 000 ..... 1110111 @r
+
+smul8      1010100  ..... ..... 000 ..... 1110111 @r
+smulx8     1010101  ..... ..... 000 ..... 1110111 @r
+umul8      1011100  ..... ..... 000 ..... 1110111 @r
+umulx8     1011101  ..... ..... 000 ..... 1110111 @r
+khm8       1000111  ..... ..... 000 ..... 1110111 @r
+khmx8      1001111  ..... ..... 000 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index b93ba63dd8..2188de8505 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -286,3 +286,11 @@ GEN_RVP_R_D64_OOL(umul16);
 GEN_RVP_R_D64_OOL(umulx16);
 GEN_RVP_R_OOL(khm16);
 GEN_RVP_R_OOL(khmx16);
+
+/* SIMD 8-bit Multiply Instructions */
+GEN_RVP_R_D64_OOL(smul8);
+GEN_RVP_R_D64_OOL(smulx8);
+GEN_RVP_R_D64_OOL(umul8);
+GEN_RVP_R_D64_OOL(umulx8);
+GEN_RVP_R_OOL(khm8);
+GEN_RVP_R_OOL(khmx8);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 13fed2c4d1..56baefeb8e 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -827,3 +827,96 @@ static inline void do_khmx16(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(khmx16, 2, 2);
+
+/* SIMD 8-bit Multiply Instructions */
+static inline void do_smul8(CPURISCVState *env, void *vd, void *va, void *vb)
+{
+    int16_t *d = vd;
+    int8_t *a = va, *b = vb;
+    d[H2(0)] = (int16_t)a[H1(0)] * b[H1(0)];
+    d[H2(1)] = (int16_t)a[H1(1)] * b[H1(1)];
+    d[H2(2)] = (int16_t)a[H1(2)] * b[H1(2)];
+    d[H2(3)] = (int16_t)a[H1(3)] * b[H1(3)];
+}
+
+RVPR64(smul8);
+
+static inline void do_smulx8(CPURISCVState *env, void *vd, void *va, void *vb)
+{
+    int16_t *d = vd;
+    int8_t *a = va, *b = vb;
+    d[H2(0)] = (int16_t)a[H1(0)] * b[H1(1)];
+    d[H2(1)] = (int16_t)a[H1(1)] * b[H1(0)];
+    d[H2(2)] = (int16_t)a[H1(2)] * b[H1(3)];
+    d[H2(3)] = (int16_t)a[H1(3)] * b[H1(2)];
+}
+
+RVPR64(smulx8);
+
+static inline void do_umul8(CPURISCVState *env, void *vd, void *va, void *vb)
+{
+    uint16_t *d = vd;
+    uint8_t *a = va, *b = vb;
+    d[H2(0)] = (uint16_t)a[H1(0)] * b[H1(0)];
+    d[H2(1)] = (uint16_t)a[H1(1)] * b[H1(1)];
+    d[H2(2)] = (uint16_t)a[H1(2)] * b[H1(2)];
+    d[H2(3)] = (uint16_t)a[H1(3)] * b[H1(3)];
+}
+
+RVPR64(umul8);
+
+static inline void do_umulx8(CPURISCVState *env, void *vd, void *va, void *vb)
+{
+    uint16_t *d = vd;
+    uint8_t *a = va, *b = vb;
+    d[H2(0)] = (uint16_t)a[H1(0)] * b[H1(1)];
+    d[H2(1)] = (uint16_t)a[H1(1)] * b[H1(0)];
+    d[H2(2)] = (uint16_t)a[H1(2)] * b[H1(3)];
+    d[H2(3)] = (uint16_t)a[H1(3)] * b[H1(2)];
+}
+
+RVPR64(umulx8);
+
+static inline void do_khm8(CPURISCVState *env, void *vd, void *va,
+                           void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+
+    if (a[i] == INT8_MIN && b[i] == INT8_MIN) {
+        env->vxsat = 1;
+        d[i] = INT8_MAX;
+    } else {
+        d[i] = (int16_t)a[i] * b[i] >> 7;
+    }
+}
+
+RVPR(khm8, 1, 1);
+
+static inline void do_khmx8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+    /*
+     * t[x] = ra.B[x] s* rb.B[y];
+     * rt.B[x] = SAT.Q7(t[x] s>> 7);
+     *
+     * (RV32: (x,y)=(3,2),(2,3),
+     *              (1,0),(0,1),
+     * (RV64: (x,y)=(7,6),(6,7),(5,4),(4,5),
+     *              (3,2),(2,3),(1,0),(0,1))
+     */
+    if (a[H1(i)] == INT8_MIN && b[H1(i + 1)] == INT8_MIN) {
+        env->vxsat = 1;
+        d[H1(i)] = INT8_MAX;
+    } else {
+        d[H1(i)] = (int16_t)a[H1(i)] * b[H1(i + 1)] >> 7;
+    }
+    if (a[H1(i + 1)] == INT8_MIN && b[H1(i)] == INT8_MIN) {
+        env->vxsat = 1;
+        d[H1(i + 1)] = INT8_MAX;
+    } else {
+        d[H1(i + 1)] = (int16_t)a[H1(i + 1)] * b[H1(i)] >> 7;
+    }
+}
+
+RVPR(khmx8, 2, 1);
-- 
2.17.1


