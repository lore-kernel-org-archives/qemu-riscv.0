Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAaPT-0006JW-3d
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:31:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaPN-0006Bz-Q8; Fri, 12 Feb 2021 10:31:01 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:56234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaPI-0007Tc-Vr; Fri, 12 Feb 2021 10:31:01 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07439618|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.391658-0.0135118-0.59483;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYH7c-J_1613143848; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYH7c-J_1613143848)
 by smtp.aliyun-inc.com(10.147.44.145);
 Fri, 12 Feb 2021 23:30:49 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 13/38] target/riscv: SIMD 8-bit Miscellaneous Instructions
Date: Fri, 12 Feb 2021 23:02:31 +0800
Message-Id: <20210212150256.885-14-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 15:31:02 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  12 +++
 target/riscv/insn32.decode              |  12 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  13 +++
 target/riscv/packed_helper.c            | 115 ++++++++++++++++++++++++
 4 files changed, 152 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 866484e37d..83778b532a 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1240,3 +1240,15 @@ DEF_HELPER_2(clrs16, tl, env, tl)
 DEF_HELPER_2(clz16, tl, env, tl)
 DEF_HELPER_2(clo16, tl, env, tl)
 DEF_HELPER_2(swap16, tl, env, tl)
+
+DEF_HELPER_3(smin8, tl, env, tl, tl)
+DEF_HELPER_3(umin8, tl, env, tl, tl)
+DEF_HELPER_3(smax8, tl, env, tl, tl)
+DEF_HELPER_3(umax8, tl, env, tl, tl)
+DEF_HELPER_3(sclip8, tl, env, tl, tl)
+DEF_HELPER_3(uclip8, tl, env, tl, tl)
+DEF_HELPER_2(kabs8, tl, env, tl)
+DEF_HELPER_2(clrs8, tl, env, tl)
+DEF_HELPER_2(clz8, tl, env, tl)
+DEF_HELPER_2(clo8, tl, env, tl)
+DEF_HELPER_2(swap8, tl, env, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index bc9d5fc967..e158066353 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -708,3 +708,15 @@ clrs16     1010111  01000 ..... 000 ..... 1111111 @r2
 clz16      1010111  01001 ..... 000 ..... 1111111 @r2
 clo16      1010111  01011 ..... 000 ..... 1111111 @r2
 swap16     1010110  11001 ..... 000 ..... 1111111 @r2
+
+smin8      1000100  ..... ..... 000 ..... 1111111 @r
+umin8      1001100  ..... ..... 000 ..... 1111111 @r
+smax8      1000101  ..... ..... 000 ..... 1111111 @r
+umax8      1001101  ..... ..... 000 ..... 1111111 @r
+sclip8     1000110  00... ..... 000 ..... 1111111 @sh3
+uclip8     1000110  10... ..... 000 ..... 1111111 @sh3
+kabs8      1010110  10000 ..... 000 ..... 1111111 @r2
+clrs8      1010111  00000 ..... 000 ..... 1111111 @r2
+clz8       1010111  00001 ..... 000 ..... 1111111 @r2
+clo8       1010111  00011 ..... 000 ..... 1111111 @r2
+swap8      1010110  11000 ..... 000 ..... 1111111 @r2
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 56fb8b2523..5ad057d7ac 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -486,3 +486,16 @@ GEN_RVP_R2_OOL(clrs16);
 GEN_RVP_R2_OOL(clz16);
 GEN_RVP_R2_OOL(clo16);
 GEN_RVP_R2_OOL(swap16);
+
+/* SIMD 8-bit Miscellaneous Instructions */
+GEN_RVP_R_OOL(smin8);
+GEN_RVP_R_OOL(umin8);
+GEN_RVP_R_OOL(smax8);
+GEN_RVP_R_OOL(umax8);
+GEN_RVP_SHIFTI(sclip8, sclip8, NULL);
+GEN_RVP_SHIFTI(uclip8, uclip8, NULL);
+GEN_RVP_R2_OOL(kabs8);
+GEN_RVP_R2_OOL(clrs8);
+GEN_RVP_R2_OOL(clz8);
+GEN_RVP_R2_OOL(clo8);
+GEN_RVP_R2_OOL(swap8);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index a6ab011ace..be91d308e5 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -1087,3 +1087,118 @@ static inline void do_swap16(CPURISCVState *env, void *vd, void *va, uint8_t i)
 }
 
 RVPR2(swap16, 2, 2);
+
+/* SIMD 8-bit Miscellaneous Instructions */
+static inline void do_smin8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] < b[i]) ? a[i] : b[i];
+}
+
+RVPR(smin8, 1, 1);
+
+static inline void do_umin8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] < b[i]) ? a[i] : b[i];
+}
+
+RVPR(umin8, 1, 1);
+
+static inline void do_smax8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] > b[i]) ? a[i] : b[i];
+}
+
+RVPR(smax8, 1, 1);
+
+static inline void do_umax8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] > b[i]) ? a[i] : b[i];
+}
+
+RVPR(umax8, 1, 1);
+
+static inline void do_sclip8(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x7;
+
+    d[i] = sat64(env, a[i], shift);
+}
+
+RVPR(sclip8, 1, 1);
+
+static inline void do_uclip8(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x7;
+
+    if (a[i] < 0) {
+        d[i] = 0;
+        env->vxsat = 0x1;
+    } else {
+        d[i] = satu64(env, a[i], shift);
+    }
+}
+
+RVPR(uclip8, 1, 1);
+
+static inline void do_kabs8(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+
+    if (a[i] == INT8_MIN) {
+        d[i] = INT8_MAX;
+        env->vxsat = 0x1;
+    } else {
+        d[i] = abs(a[i]);
+    }
+}
+
+RVPR2(kabs8, 1, 1);
+
+static inline void do_clrs8(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    d[i] = clrsb32(a[i]) - 24;
+}
+
+RVPR2(clrs8, 1, 1);
+
+static inline void do_clz8(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    d[i] = (a[i] < 0) ? 0 : (clz32(a[i]) - 24);
+}
+
+RVPR2(clz8, 1, 1);
+
+static inline void do_clo8(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    d[i] = (a[i] >= 0) ? 0 : (clo32(a[i]) - 24);
+}
+
+RVPR2(clo8, 1, 1);
+
+static inline void do_swap8(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    d[H1(i)] = a[H1(i + 1)];
+    d[H1(i + 1)] = a[H1(i)];
+}
+
+RVPR2(swap8, 2, 1);
-- 
2.17.1


