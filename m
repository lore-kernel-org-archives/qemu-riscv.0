Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrFha-0006ty-Lj
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 04:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFhQ-0006qB-Pi; Thu, 10 Jun 2021 04:06:01 -0400
Received: from out28-4.mail.aliyun.com ([115.124.28.4]:39988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFhL-0001Fx-Ua; Thu, 10 Jun 2021 04:06:00 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07460574|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.76618-0.00882805-0.224992;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=7; SR=0; TI=SMTPD_---.KQMXJMA_1623312350; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQMXJMA_1623312350)
 by smtp.aliyun-inc.com(10.147.42.198);
 Thu, 10 Jun 2021 16:05:51 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 13/37] target/riscv: 8-bit Unpacking Instructions
Date: Thu, 10 Jun 2021 15:58:44 +0800
Message-Id: <20210610075908.3305506-14-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.4; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-4.mail.aliyun.com
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
X-List-Received-Date: Thu, 10 Jun 2021 08:06:03 -0000

Sign-extend or zero-extend selected 8-bit elements to
16-bit elements.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  11 +++
 target/riscv/insn32.decode              |  11 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  12 +++
 target/riscv/packed_helper.c            | 121 ++++++++++++++++++++++++
 4 files changed, 155 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 240df8b766..9fd2a70f7d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1255,3 +1255,14 @@ DEF_HELPER_2(clrs8, tl, env, tl)
 DEF_HELPER_2(clz8, tl, env, tl)
 DEF_HELPER_2(clo8, tl, env, tl)
 DEF_HELPER_2(swap8, tl, env, tl)
+
+DEF_HELPER_2(sunpkd810, tl, env, tl)
+DEF_HELPER_2(sunpkd820, tl, env, tl)
+DEF_HELPER_2(sunpkd830, tl, env, tl)
+DEF_HELPER_2(sunpkd831, tl, env, tl)
+DEF_HELPER_2(sunpkd832, tl, env, tl)
+DEF_HELPER_2(zunpkd810, tl, env, tl)
+DEF_HELPER_2(zunpkd820, tl, env, tl)
+DEF_HELPER_2(zunpkd830, tl, env, tl)
+DEF_HELPER_2(zunpkd831, tl, env, tl)
+DEF_HELPER_2(zunpkd832, tl, env, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4c34f0f4f4..9b8ea0f9ab 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -858,3 +858,14 @@ clrs8      1010111  00000 ..... 000 ..... 1110111 @r2
 clz8       1010111  00001 ..... 000 ..... 1110111 @r2
 clo8       1010111  00011 ..... 000 ..... 1110111 @r2
 swap8      1010110  11000 ..... 000 ..... 1110111 @r2
+
+sunpkd810  1010110  01000 ..... 000 ..... 1110111 @r2
+sunpkd820  1010110  01001 ..... 000 ..... 1110111 @r2
+sunpkd830  1010110  01010 ..... 000 ..... 1110111 @r2
+sunpkd831  1010110  01011 ..... 000 ..... 1110111 @r2
+sunpkd832  1010110  10011 ..... 000 ..... 1110111 @r2
+zunpkd810  1010110  01100 ..... 000 ..... 1110111 @r2
+zunpkd820  1010110  01101 ..... 000 ..... 1110111 @r2
+zunpkd830  1010110  01110 ..... 000 ..... 1110111 @r2
+zunpkd831  1010110  01111 ..... 000 ..... 1110111 @r2
+zunpkd832  1010110  10111 ..... 000 ..... 1110111 @r2
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index c5ec530fd7..5af2c7c2cc 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -348,3 +348,15 @@ GEN_RVP_R2_OOL(clrs8);
 GEN_RVP_R2_OOL(clz8);
 GEN_RVP_R2_OOL(clo8);
 GEN_RVP_R2_OOL(swap8);
+
+/* 8-bit Unpacking Instructions */
+GEN_RVP_R2_OOL(sunpkd810);
+GEN_RVP_R2_OOL(sunpkd820);
+GEN_RVP_R2_OOL(sunpkd830);
+GEN_RVP_R2_OOL(sunpkd831);
+GEN_RVP_R2_OOL(sunpkd832);
+GEN_RVP_R2_OOL(zunpkd810);
+GEN_RVP_R2_OOL(zunpkd820);
+GEN_RVP_R2_OOL(zunpkd830);
+GEN_RVP_R2_OOL(zunpkd831);
+GEN_RVP_R2_OOL(zunpkd832);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 3d3d2bf3e4..8226dbd079 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -1193,3 +1193,124 @@ static inline void do_swap8(CPURISCVState *env, void *vd, void *va, uint8_t i)
 }
 
 RVPR2(swap8, 2, 1);
+
+/* 8-bit Unpacking Instructions */
+static inline void
+do_sunpkd810(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int8_t *a = va;
+    int16_t *d = vd;
+
+    d[H2(i / 2)] = a[H1(i)];
+    d[H2(i / 2 + 1)] = a[H1(i + 1)];
+}
+
+RVPR2(sunpkd810, 4, 1);
+
+static inline void
+do_sunpkd820(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int8_t *a = va;
+    int16_t *d = vd;
+
+    d[H2(i / 2)] = a[H1(i)];
+    d[H2(i / 2 + 1)] = a[H1(i + 2)];
+}
+
+RVPR2(sunpkd820, 4, 1);
+
+static inline void
+do_sunpkd830(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int8_t *a = va;
+    int16_t *d = vd;
+
+    d[H2(i / 2)] = a[H1(i)];
+    d[H2(i / 2 + 1)] = a[H1(i + 3)];
+}
+
+RVPR2(sunpkd830, 4, 1);
+
+static inline void
+do_sunpkd831(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int8_t *a = va;
+    int16_t *d = vd;
+
+    d[H2(i / 2)] = a[H1(i) + 1];
+    d[H2(i / 2 + 1)] = a[H1(i + 3)];
+}
+
+RVPR2(sunpkd831, 4, 1);
+
+static inline void
+do_sunpkd832(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int8_t *a = va;
+    int16_t *d = vd;
+
+    d[H2(i / 2)] = a[H1(i) + 2];
+    d[H2(i / 2 + 1)] = a[H1(i + 3)];
+}
+
+RVPR2(sunpkd832, 4, 1);
+
+static inline void
+do_zunpkd810(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    uint8_t *a = va;
+    uint16_t *d = vd;
+
+    d[H2(i / 2)] = a[H1(i)];
+    d[H2(i / 2 + 1)] = a[H1(i + 1)];
+}
+
+RVPR2(zunpkd810, 4, 1);
+
+static inline void
+do_zunpkd820(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    uint8_t *a = va;
+    uint16_t *d = vd;
+
+    d[H2(i / 2)] = a[H1(i)];
+    d[H2(i / 2 + 1)] = a[H1(i + 2)];
+}
+
+RVPR2(zunpkd820, 4, 1);
+
+static inline void
+do_zunpkd830(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    uint8_t *a = va;
+    uint16_t *d = vd;
+
+    d[H2(i / 2)] = a[H1(i)];
+    d[H2(i / 2 + 1)] = a[H1(i + 3)];
+}
+
+RVPR2(zunpkd830, 4, 1);
+
+static inline void
+do_zunpkd831(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    uint8_t *a = va;
+    uint16_t *d = vd;
+
+    d[H2(i / 2)] = a[H1(i) + 1];
+    d[H2(i / 2 + 1)] = a[H1(i + 3)];
+}
+
+RVPR2(zunpkd831, 4, 1);
+
+static inline void
+do_zunpkd832(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    uint8_t *a = va;
+    uint16_t *d = vd;
+
+    d[H2(i / 2)] = a[H1(i) + 2];
+    d[H2(i / 2 + 1)] = a[H1(i + 3)];
+}
+
+RVPR2(zunpkd832, 4, 1);
-- 
2.25.1


