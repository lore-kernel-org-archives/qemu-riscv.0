Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAawn-0005gK-Ac
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 11:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAawl-0005cy-5E; Fri, 12 Feb 2021 11:05:32 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:52204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAawU-0005pE-NQ; Fri, 12 Feb 2021 11:05:30 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436298|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.4585-0.00418602-0.537314;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHlayi_1613145902; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHlayi_1613145902)
 by smtp.aliyun-inc.com(10.147.44.118);
 Sat, 13 Feb 2021 00:05:03 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 30/38] target/riscv: RV64 Only SIMD 32-bit Shift Instructions
Date: Fri, 12 Feb 2021 23:02:48 +0800
Message-Id: <20210212150256.885-31-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210212150256.885-1-zhiwei_liu@c-sky.com>
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01,
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
X-List-Received-Date: Fri, 12 Feb 2021 16:05:32 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |   9 ++
 target/riscv/insn32-64.decode           |  15 ++++
 target/riscv/insn_trans/trans_rvp.c.inc |  16 ++++
 target/riscv/packed_helper.c            | 104 ++++++++++++++++++++++++
 4 files changed, 144 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 0ade207de6..673bc4f628 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1425,4 +1425,13 @@ DEF_HELPER_3(rstsa32, tl, env, tl, tl)
 DEF_HELPER_3(urstsa32, tl, env, tl, tl)
 DEF_HELPER_3(kstsa32, tl, env, tl, tl)
 DEF_HELPER_3(ukstsa32, tl, env, tl, tl)
+
+DEF_HELPER_3(sra32, tl, env, tl, tl)
+DEF_HELPER_3(sra32_u, tl, env, tl, tl)
+DEF_HELPER_3(srl32, tl, env, tl, tl)
+DEF_HELPER_3(srl32_u, tl, env, tl, tl)
+DEF_HELPER_3(sll32, tl, env, tl, tl)
+DEF_HELPER_3(ksll32, tl, env, tl, tl)
+DEF_HELPER_3(kslra32, tl, env, tl, tl)
+DEF_HELPER_3(kslra32_u, tl, env, tl, tl)
 #endif
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 66eec1a44a..6f0f2923ca 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -114,3 +114,18 @@ rstsa32    1011001  ..... ..... 010 ..... 1111111 @r
 urstsa32   1101001  ..... ..... 010 ..... 1111111 @r
 kstsa32    1100001  ..... ..... 010 ..... 1111111 @r
 ukstsa32   1110001  ..... ..... 010 ..... 1111111 @r
+
+sra32      0101000  ..... ..... 010 ..... 1111111 @r
+sra32_u    0110000  ..... ..... 010 ..... 1111111 @r
+srai32     0111000  ..... ..... 010 ..... 1111111 @sh5
+srai32_u   1000000  ..... ..... 010 ..... 1111111 @sh5
+srl32      0101001  ..... ..... 010 ..... 1111111 @r
+srl32_u    0110001  ..... ..... 010 ..... 1111111 @r
+srli32     0111001  ..... ..... 010 ..... 1111111 @sh5
+srli32_u   1000001  ..... ..... 010 ..... 1111111 @sh5
+sll32      0101010  ..... ..... 010 ..... 1111111 @r
+slli32     0111010  ..... ..... 010 ..... 1111111 @sh5
+ksll32     0110010  ..... ..... 010 ..... 1111111 @r
+kslli32    1000010  ..... ..... 010 ..... 1111111 @sh5
+kslra32    0101011  ..... ..... 010 ..... 1111111 @r
+kslra32_u  0110011  ..... ..... 010 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index ea673b3aca..e52f268a57 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1156,4 +1156,20 @@ GEN_RVP_R_OOL(rstsa32);
 GEN_RVP_R_OOL(urstsa32);
 GEN_RVP_R_OOL(kstsa32);
 GEN_RVP_R_OOL(ukstsa32);
+
+/* (RV64 Only) SIMD 32-bit Shift Instructions */
+GEN_RVP_SHIFT(sra32, tcg_gen_gvec_sars, 2);
+GEN_RVP_SHIFTI(srai32, sra32, NULL);
+GEN_RVP_R_OOL(sra32_u);
+GEN_RVP_SHIFTI(srai32_u, sra32_u, NULL);
+GEN_RVP_SHIFT(srl32, tcg_gen_gvec_shrs, 2);
+GEN_RVP_SHIFTI(srli32, srl32, NULL);
+GEN_RVP_R_OOL(srl32_u);
+GEN_RVP_SHIFTI(srli32_u, srl32_u, NULL);
+GEN_RVP_SHIFT(sll32, tcg_gen_gvec_shls, 2);
+GEN_RVP_SHIFTI(slli32, sll32, NULL);
+GEN_RVP_R_OOL(ksll32);
+GEN_RVP_SHIFTI(kslli32, ksll32, NULL);
+GEN_RVP_R_OOL(kslra32);
+GEN_RVP_R_OOL(kslra32_u);
 #endif
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index bb56933c39..c168c51eff 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3273,4 +3273,108 @@ static inline void do_ukstsa32(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(ukstsa32, 2, 4);
+
+/* (RV64 Only) SIMD 32-bit Shift Instructions */
+static inline void do_sra32(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x1f;
+    d[i] = a[i] >> shift;
+}
+
+RVPR(sra32, 1, 4);
+
+static inline void do_srl32(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x1f;
+    d[i] = a[i] >> shift;
+}
+
+RVPR(srl32, 1, 4);
+
+static inline void do_sll32(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x1f;
+    d[i] = a[i] << shift;
+}
+
+RVPR(sll32, 1, 4);
+
+static inline void do_sra32_u(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x1f;
+
+    d[i] = vssra32(env, 0, a[i], shift);
+}
+
+RVPR(sra32_u, 1, 4);
+
+static inline void do_srl32_u(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x1f;
+
+    d[i] = vssrl32(env, 0, a[i], shift);
+}
+
+RVPR(srl32_u, 1, 4);
+
+static inline void do_ksll32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, result;
+    uint8_t shift = *(uint8_t *)vb & 0x1f;
+
+    result = a[i] << shift;
+    if (shift > clrsb32(a[i])) {
+        env->vxsat = 0x1;
+        d[i] = (a[i] & INT32_MIN) ? INT32_MIN : INT32_MAX;
+    } else {
+        d[i] = result;
+    }
+}
+
+RVPR(ksll32, 1, 4);
+
+static inline void do_kslra32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va;
+    int32_t shift = sextract32((*(uint32_t *)vb), 0, 6);
+
+    if (shift >= 0) {
+        do_ksll32(env, vd, va, vb, i);
+    } else {
+        shift = -shift;
+        shift = (shift == 32) ? 31 : shift;
+        d[i] = a[i] >> shift;
+    }
+}
+
+RVPR(kslra32, 1, 4);
+
+static inline void do_kslra32_u(CPURISCVState *env, void *vd, void *va,
+                                void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va;
+    int32_t shift = sextract32((*(uint32_t *)vb), 0, 6);
+
+    if (shift >= 0) {
+        do_ksll32(env, vd, va, vb, i);
+    } else {
+        shift = -shift;
+        shift = (shift == 32) ? 31 : shift;
+        d[i] = vssra32(env, 0, a[i], shift);
+    }
+}
+
+RVPR(kslra32_u, 1, 4);
 #endif
-- 
2.17.1


