Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrFj2-0000Kc-8W
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 04:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFix-0000Ed-A0; Thu, 10 Jun 2021 04:07:37 -0400
Received: from out28-124.mail.aliyun.com ([115.124.28.124]:52926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFir-0001zl-Ag; Thu, 10 Jun 2021 04:07:34 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436302|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.552192-0.00466643-0.443141;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=7; SR=0; TI=SMTPD_---.KQMljOg_1623312442; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQMljOg_1623312442)
 by smtp.aliyun-inc.com(10.147.44.145);
 Thu, 10 Jun 2021 16:07:23 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 16/37] target/riscv: Signed MSW 32x16 Multiply and Add
 Instructions
Date: Thu, 10 Jun 2021 15:58:47 +0800
Message-Id: <20210610075908.3305506-17-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.124; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-124.mail.aliyun.com
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
X-List-Received-Date: Thu, 10 Jun 2021 08:07:37 -0000

Always contain a 32x16 multiplification and the most significant
word can be used as the result, or an operand for an add or
subtract operation with rounding or saturation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  17 ++
 target/riscv/insn32.decode              |  17 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  18 ++
 target/riscv/packed_helper.c            | 208 ++++++++++++++++++++++++
 4 files changed, 260 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 600e8dee44..854f48d385 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1280,3 +1280,20 @@ DEF_HELPER_4(kmmsb, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmmsb_u, tl, env, tl, tl, tl)
 DEF_HELPER_3(kwmmul, tl, env, tl, tl)
 DEF_HELPER_3(kwmmul_u, tl, env, tl, tl)
+
+DEF_HELPER_3(smmwb, tl, env, tl, tl)
+DEF_HELPER_3(smmwb_u, tl, env, tl, tl)
+DEF_HELPER_3(smmwt, tl, env, tl, tl)
+DEF_HELPER_3(smmwt_u, tl, env, tl, tl)
+DEF_HELPER_4(kmmawb, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmmawb_u, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmmawt, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmmawt_u, tl, env, tl, tl, tl)
+DEF_HELPER_3(kmmwb2, tl, env, tl, tl)
+DEF_HELPER_3(kmmwb2_u, tl, env, tl, tl)
+DEF_HELPER_3(kmmwt2, tl, env, tl, tl)
+DEF_HELPER_3(kmmwt2_u, tl, env, tl, tl)
+DEF_HELPER_4(kmmawb2, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmmawb2_u, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmmawt2, tl, env, tl, tl, tl)
+DEF_HELPER_4(kmmawt2_u, tl, env, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0484de140b..e5a8f663dc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -883,3 +883,20 @@ kmmsb      0100001  ..... ..... 001 ..... 1110111 @r
 kmmsb_u    0101001  ..... ..... 001 ..... 1110111 @r
 kwmmul     0110001  ..... ..... 001 ..... 1110111 @r
 kwmmul_u   0111001  ..... ..... 001 ..... 1110111 @r
+
+smmwb      0100010  ..... ..... 001 ..... 1110111 @r
+smmwb_u    0101010  ..... ..... 001 ..... 1110111 @r
+smmwt      0110010  ..... ..... 001 ..... 1110111 @r
+smmwt_u    0111010  ..... ..... 001 ..... 1110111 @r
+kmmawb     0100011  ..... ..... 001 ..... 1110111 @r
+kmmawb_u   0101011  ..... ..... 001 ..... 1110111 @r
+kmmawt     0110011  ..... ..... 001 ..... 1110111 @r
+kmmawt_u   0111011  ..... ..... 001 ..... 1110111 @r
+kmmwb2     1000111  ..... ..... 001 ..... 1110111 @r
+kmmwb2_u   1001111  ..... ..... 001 ..... 1110111 @r
+kmmwt2     1010111  ..... ..... 001 ..... 1110111 @r
+kmmwt2_u   1011111  ..... ..... 001 ..... 1110111 @r
+kmmawb2    1100111  ..... ..... 001 ..... 1110111 @r
+kmmawb2_u  1101111  ..... ..... 001 ..... 1110111 @r
+kmmawt2    1110111  ..... ..... 001 ..... 1110111 @r
+kmmawt2_u  1111111  ..... ..... 001 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 073558b950..af490a5ef0 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -413,3 +413,21 @@ GEN_RVP_R_ACC_OOL(kmmsb);
 GEN_RVP_R_ACC_OOL(kmmsb_u);
 GEN_RVP_R_OOL(kwmmul);
 GEN_RVP_R_OOL(kwmmul_u);
+
+/* Most Significant Word “32x16” Multiply & Add Instructions */
+GEN_RVP_R_OOL(smmwb);
+GEN_RVP_R_OOL(smmwb_u);
+GEN_RVP_R_OOL(smmwt);
+GEN_RVP_R_OOL(smmwt_u);
+GEN_RVP_R_ACC_OOL(kmmawb);
+GEN_RVP_R_ACC_OOL(kmmawb_u);
+GEN_RVP_R_ACC_OOL(kmmawt);
+GEN_RVP_R_ACC_OOL(kmmawt_u);
+GEN_RVP_R_OOL(kmmwb2);
+GEN_RVP_R_OOL(kmmwb2_u);
+GEN_RVP_R_OOL(kmmwt2);
+GEN_RVP_R_OOL(kmmwt2_u);
+GEN_RVP_R_ACC_OOL(kmmawb2);
+GEN_RVP_R_ACC_OOL(kmmawb2_u);
+GEN_RVP_R_ACC_OOL(kmmawt2);
+GEN_RVP_R_ACC_OOL(kmmawt2_u);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 465cb5a3b3..868a1a71ba 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -1468,3 +1468,211 @@ static inline void do_kwmmul_u(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(kwmmul_u, 1, 4);
+
+/* Most Significant Word “32x16” Multiply & Add Instructions */
+static inline void do_smmwb(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    int16_t *b = vb;
+    d[H4(i)] = (int64_t)a[H4(i)] * b[H2(2 * i)] >> 16;
+}
+
+RVPR(smmwb, 1, 4);
+
+static inline void do_smmwb_u(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    int16_t *b = vb;
+    d[H4(i)] = ((int64_t)a[H4(i)] * b[H2(2 * i)] + (1ull << 15)) >> 16;
+}
+
+RVPR(smmwb_u, 1, 4);
+
+static inline void do_smmwt(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    int16_t *b = vb;
+    d[H4(i)] = (int64_t)a[H4(i)] * b[H2(2 * i + 1)] >> 16;
+}
+
+RVPR(smmwt, 1, 4);
+
+static inline void do_smmwt_u(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    int16_t *b = vb;
+    d[H4(i)] = ((int64_t)a[H4(i)] * b[H2(2 * i + 1)] + (1ull << 15)) >> 16;
+}
+
+RVPR(smmwt_u, 1, 4);
+
+static inline void do_kmmawb(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *c = vc;
+    int16_t *b = vb;
+    d[H4(i)] = sadd32(env, 0, (int64_t)a[H4(i)] * b[H2(2 * i)] >> 16, c[H4(i)]);
+}
+
+RVPR_ACC(kmmawb, 1, 4);
+
+static inline void do_kmmawb_u(CPURISCVState *env, void *vd, void *va,
+                               void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *c = vc;
+    int16_t *b = vb;
+    d[H4(i)] = sadd32(env, 0, ((int64_t)a[H4(i)] * b[H2(2 * i)] +
+                               (1ull << 15)) >> 16, c[H4(i)]);
+}
+
+RVPR_ACC(kmmawb_u, 1, 4);
+
+static inline void do_kmmawt(CPURISCVState *env, void *vd, void *va,
+                             void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *c = vc;
+    int16_t *b = vb;
+    d[H4(i)] = sadd32(env, 0, (int64_t)a[H4(i)] * b[H2(2 * i + 1)] >> 16,
+                      c[H4(i)]);
+}
+
+RVPR_ACC(kmmawt, 1, 4);
+
+static inline void do_kmmawt_u(CPURISCVState *env, void *vd, void *va,
+                               void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *c = vc;
+    int16_t *b = vb;
+    d[H4(i)] = sadd32(env, 0, ((int64_t)a[H4(i)] * b[H2(2 * i + 1)] +
+                               (1ull << 15)) >> 16, c[H4(i)]);
+}
+
+RVPR_ACC(kmmawt_u, 1, 4);
+
+static inline void do_kmmwb2(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    int16_t *b = vb;
+    if (a[H4(i)] == INT32_MIN && b[H2(2 * i)] == INT16_MIN) {
+        env->vxsat = 0x1;
+        d[H4(i)] = INT32_MAX;
+    } else {
+        d[H4(i)] = (int64_t)a[H4(i)] * b[H2(2 * i)] >> 15;
+    }
+}
+
+RVPR(kmmwb2, 1, 4);
+
+static inline void do_kmmwb2_u(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    int16_t *b = vb;
+    if (a[H4(i)] == INT32_MIN && b[H2(2 * i)] == INT16_MIN) {
+        env->vxsat = 0x1;
+        d[H4(i)] = INT32_MAX;
+    } else {
+        d[H4(i)] = ((int64_t)a[H4(i)] * b[H2(2 * i)] + (1ull << 14)) >> 15;
+    }
+}
+
+RVPR(kmmwb2_u, 1, 4);
+
+static inline void do_kmmwt2(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    int16_t *b = vb;
+    if (a[H4(i)] == INT32_MIN && b[H2(2 * i + 1)] == INT16_MIN) {
+        env->vxsat = 0x1;
+        d[H4(i)] = INT32_MAX;
+    } else {
+        d[H4(i)] = (int64_t)a[H4(i)] * b[H2(2 * i + 1)] >> 15;
+    }
+}
+
+RVPR(kmmwt2, 1, 4);
+
+static inline void do_kmmwt2_u(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    int16_t *b = vb;
+    if (a[H4(i)] == INT32_MIN && b[H2(2 * i + 1)] == INT16_MIN) {
+        env->vxsat = 0x1;
+        d[H4(i)] = INT32_MAX;
+    } else {
+        d[H4(i)] = ((int64_t)a[H4(i)] * b[H2(2 * i + 1)] + (1ull << 14)) >> 15;
+    }
+}
+
+RVPR(kmmwt2_u, 1, 4);
+
+static inline void do_kmmawb2(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *c = vc, result;
+    int16_t *b = vb;
+    if (a[H4(i)] == INT32_MIN && b[H2(2 * i)] == INT16_MIN) {
+        env->vxsat = 0x1;
+        result = INT32_MAX;
+    } else {
+        result = (int64_t)a[H4(i)] * b[H2(2 * i)] >> 15;
+    }
+    d[H4(i)] = sadd32(env, 0, result, c[H4(i)]);
+}
+
+RVPR_ACC(kmmawb2, 1, 4);
+
+static inline void do_kmmawb2_u(CPURISCVState *env, void *vd, void *va,
+                                void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *c = vc, result;
+    int16_t *b = vb;
+    if (a[H4(i)] == INT32_MIN && b[H2(2 * i)] == INT16_MIN) {
+        env->vxsat = 0x1;
+        result = INT32_MAX;
+    } else {
+        result = ((int64_t)a[H4(i)] * b[H2(2 * i)] + (1ull << 14)) >> 15;
+    }
+    d[H4(i)] = sadd32(env, 0, result, c[H4(i)]);
+}
+
+RVPR_ACC(kmmawb2_u, 1, 4);
+
+static inline void do_kmmawt2(CPURISCVState *env, void *vd, void *va,
+                              void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *c = vc, result;
+    int16_t *b = vb;
+    if (a[H4(i)] == INT32_MIN && b[H2(2 * i + 1)] == INT16_MIN) {
+        env->vxsat = 0x1;
+        result = INT32_MAX;
+    } else {
+        result = (int64_t)a[H4(i)] * b[H2(2 * i + 1)] >> 15;
+    }
+    d[H4(i)] = sadd32(env, 0, result, c[H4(i)]);
+}
+
+RVPR_ACC(kmmawt2, 1, 4);
+
+static inline void do_kmmawt2_u(CPURISCVState *env, void *vd, void *va,
+                                void *vb, void *vc, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *c = vc, result;
+    int16_t *b = vb;
+    if (a[H4(i)] == INT32_MIN && b[H2(2 * i + 1)] == INT16_MIN) {
+        env->vxsat = 0x1;
+        result = INT32_MAX;
+    } else {
+        result = ((int64_t)a[H4(i)] * b[H2(2 * i + 1)] + (1ull << 14)) >> 15;
+    }
+    d[H4(i)] = sadd32(env, 0, result, c[H4(i)]);
+}
+
+RVPR_ACC(kmmawt2_u, 1, 4);
-- 
2.25.1


