Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAaRU-0007oM-BB
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaRS-0007m7-O2; Fri, 12 Feb 2021 10:33:10 -0500
Received: from mail142-31.mail.alibaba.com ([198.11.142.31]:4332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaRQ-0008Sx-6C; Fri, 12 Feb 2021 10:33:10 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07459754|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.715133-0.0100687-0.274798;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047205; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHEPRw_1613143969; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHEPRw_1613143969)
 by smtp.aliyun-inc.com(10.147.41.137);
 Fri, 12 Feb 2021 23:32:50 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 14/38] target/riscv: 8-bit Unpacking Instructions
Date: Fri, 12 Feb 2021 23:02:32 +0800
Message-Id: <20210212150256.885-15-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210212150256.885-1-zhiwei_liu@c-sky.com>
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=198.11.142.31; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-31.mail.alibaba.com
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
X-List-Received-Date: Fri, 12 Feb 2021 15:33:11 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  11 +++
 target/riscv/insn32.decode              |  11 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  12 +++
 target/riscv/packed_helper.c            | 121 ++++++++++++++++++++++++
 4 files changed, 155 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 83778b532a..585905a689 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1252,3 +1252,14 @@ DEF_HELPER_2(clrs8, tl, env, tl)
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
index e158066353..fa4a02c9db 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -720,3 +720,14 @@ clrs8      1010111  00000 ..... 000 ..... 1111111 @r2
 clz8       1010111  00001 ..... 000 ..... 1111111 @r2
 clo8       1010111  00011 ..... 000 ..... 1111111 @r2
 swap8      1010110  11000 ..... 000 ..... 1111111 @r2
+
+sunpkd810  1010110  01000 ..... 000 ..... 1111111 @r2
+sunpkd820  1010110  01001 ..... 000 ..... 1111111 @r2
+sunpkd830  1010110  01010 ..... 000 ..... 1111111 @r2
+sunpkd831  1010110  01011 ..... 000 ..... 1111111 @r2
+sunpkd832  1010110  10011 ..... 000 ..... 1111111 @r2
+zunpkd810  1010110  01100 ..... 000 ..... 1111111 @r2
+zunpkd820  1010110  01101 ..... 000 ..... 1111111 @r2
+zunpkd830  1010110  01110 ..... 000 ..... 1111111 @r2
+zunpkd831  1010110  01111 ..... 000 ..... 1111111 @r2
+zunpkd832  1010110  10111 ..... 000 ..... 1111111 @r2
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 5ad057d7ac..b69e964cb4 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -499,3 +499,15 @@ GEN_RVP_R2_OOL(clrs8);
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
index be91d308e5..d0dcb692f5 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -1202,3 +1202,124 @@ static inline void do_swap8(CPURISCVState *env, void *vd, void *va, uint8_t i)
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
2.17.1


