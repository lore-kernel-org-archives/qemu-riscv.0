Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrFnq-0007YP-7r
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 04:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFnp-0007UX-58; Thu, 10 Jun 2021 04:12:37 -0400
Received: from out28-3.mail.aliyun.com ([115.124.28.3]:46747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFnm-0004zS-Qw; Thu, 10 Jun 2021 04:12:36 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07645152|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.47609-0.00722773-0.516682;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KQMlovd_1623312747; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQMlovd_1623312747)
 by smtp.aliyun-inc.com(10.147.44.145);
 Thu, 10 Jun 2021 16:12:27 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 26/37] target/riscv: 32-bit Computation Instructions
Date: Thu, 10 Jun 2021 15:58:57 +0800
Message-Id: <20210610075908.3305506-27-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.3; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-3.mail.aliyun.com
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
X-List-Received-Date: Thu, 10 Jun 2021 08:12:37 -0000

32-bit halving addition or subtraction, maximum, minimum,
or multiply.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  9 +++
 target/riscv/insn32.decode              |  9 +++
 target/riscv/insn_trans/trans_rvp.c.inc | 10 +++
 target/riscv/packed_helper.c            | 92 +++++++++++++++++++++++++
 4 files changed, 120 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b3485f95a2..3063b583f3 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1384,3 +1384,12 @@ DEF_HELPER_4(kdmabb, tl, env, tl, tl, tl)
 DEF_HELPER_4(kdmabt, tl, env, tl, tl, tl)
 DEF_HELPER_4(kdmatt, tl, env, tl, tl, tl)
 DEF_HELPER_2(kabsw, tl, env, tl)
+
+DEF_HELPER_3(raddw, tl, env, tl, tl)
+DEF_HELPER_3(uraddw, tl, env, tl, tl)
+DEF_HELPER_3(rsubw, tl, env, tl, tl)
+DEF_HELPER_3(ursubw, tl, env, tl, tl)
+DEF_HELPER_3(maxw, tl, env, tl, tl)
+DEF_HELPER_3(minw, tl, env, tl, tl)
+DEF_HELPER_3(mulr64, i64, env, tl, tl)
+DEF_HELPER_3(mulsr64, i64, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a25294baab..9cfe5570b0 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -988,3 +988,12 @@ kdmabb     1101001  ..... ..... 001 ..... 1110111 @r
 kdmabt     1110001  ..... ..... 001 ..... 1110111 @r
 kdmatt     1111001  ..... ..... 001 ..... 1110111 @r
 kabsw      1010110  10100 ..... 000 ..... 1110111 @r2
+
+raddw      0010000  ..... ..... 001 ..... 1110111 @r
+uraddw     0011000  ..... ..... 001 ..... 1110111 @r
+rsubw      0010001  ..... ..... 001 ..... 1110111 @r
+ursubw     0011001  ..... ..... 001 ..... 1110111 @r
+maxw       1111001  ..... ..... 000 ..... 1110111 @r
+minw       1111000  ..... ..... 000 ..... 1110111 @r
+mulr64     1111000  ..... ..... 001 ..... 1110111 @r
+mulsr64    1110000  ..... ..... 001 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index d2c7ab1440..b720c6e037 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -698,3 +698,13 @@ GEN_RVP_R_ACC_OOL(kdmabb);
 GEN_RVP_R_ACC_OOL(kdmabt);
 GEN_RVP_R_ACC_OOL(kdmatt);
 GEN_RVP_R2_OOL(kabsw);
+
+/* 32-bit Computation Instructions */
+GEN_RVP_R_OOL(raddw);
+GEN_RVP_R_OOL(uraddw);
+GEN_RVP_R_OOL(rsubw);
+GEN_RVP_R_OOL(ursubw);
+GEN_RVP_R_OOL(minw);
+GEN_RVP_R_OOL(maxw);
+GEN_RVP_R_D64_OOL(mulr64);
+GEN_RVP_R_D64_OOL(mulsr64);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 89d203730d..c0e3b6bbdb 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -2818,3 +2818,95 @@ static inline void do_kabsw(CPURISCVState *env, void *vd, void *va, uint8_t i)
 }
 
 RVPR2(kabsw, 2, 4);
+
+/* 32-bit Computation Instructions */
+static inline void do_raddw(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int32_t *a = va, *b = vb;
+    target_long *d = vd;
+
+    *d = hadd32(a[H4(i)], b[H4(i)]);
+}
+
+RVPR(raddw, 2, 4);
+
+static inline void do_uraddw(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *a = va, *b = vb;
+    target_long *d = vd;
+
+    *d = (int32_t)haddu32(a[H4(i)], b[H4(i)]);
+}
+
+RVPR(uraddw, 2, 4);
+
+static inline void do_rsubw(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int32_t *a = va, *b = vb;
+    target_long *d = vd;
+
+    *d = hsub32(a[H4(i)], b[H4(i)]);
+}
+
+RVPR(rsubw, 2, 4);
+
+static inline void do_ursubw(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *a = va, *b = vb;
+    target_long *d = vd;
+
+    *d = (int32_t)hsubu64(a[H4(i)], b[H4(i)]);
+}
+
+RVPR(ursubw, 2, 4);
+
+static inline void do_maxw(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int32_t *a = va, *b = vb;
+
+    *d = (a[H4(i)] > b[H4(i)]) ? a[H4(i)] : b[H4(i)];
+}
+
+RVPR(maxw, 2, 4);
+
+static inline void do_minw(CPURISCVState *env, void *vd, void *va,
+                           void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int32_t *a = va, *b = vb;
+
+    *d = (a[H4(i)] < b[H4(i)]) ? a[H4(i)] : b[H4(i)];
+}
+
+RVPR(minw, 2, 4);
+
+static inline void do_mulr64(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint64_t *d = vd;
+    uint32_t *a = va, *b = vb;
+
+    *d = (uint64_t)a[H4(0)] * b[H4(0)];
+}
+
+RVPR64(mulr64);
+
+static inline void do_mulsr64(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd;
+    int64_t result;
+    int32_t *a = va, *b = vb;
+
+    result = (int64_t)a[H4(0)] * b[H4(0)];
+    d[H4(1)] = result >> 32;
+    d[H4(0)] = result & UINT32_MAX;
+}
+
+RVPR64(mulsr64);
-- 
2.25.1


