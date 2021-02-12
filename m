Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAaDl-0003Aq-QT
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:19:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaDj-00035j-EK; Fri, 12 Feb 2021 10:18:59 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:34777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaDf-00029N-Bg; Fri, 12 Feb 2021 10:18:59 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436379|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.633645-0.00734053-0.359015;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047188; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYGvwP2_1613143124; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYGvwP2_1613143124)
 by smtp.aliyun-inc.com(10.147.40.26); Fri, 12 Feb 2021 23:18:44 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 07/38] target/riscv: SIMD 8-bit Shift Instructions
Date: Fri, 12 Feb 2021 23:02:25 +0800
Message-Id: <20210212150256.885-8-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 15:18:59 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |   9 +++
 target/riscv/insn32.decode              |  17 ++++
 target/riscv/insn_trans/trans_rvp.c.inc |  16 ++++
 target/riscv/packed_helper.c            | 102 ++++++++++++++++++++++++
 4 files changed, 144 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 20bf400ac2..0ecd4d53f9 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1193,3 +1193,12 @@ DEF_HELPER_3(sll16, tl, env, tl, tl)
 DEF_HELPER_3(ksll16, tl, env, tl, tl)
 DEF_HELPER_3(kslra16, tl, env, tl, tl)
 DEF_HELPER_3(kslra16_u, tl, env, tl, tl)
+
+DEF_HELPER_3(sra8, tl, env, tl, tl)
+DEF_HELPER_3(sra8_u, tl, env, tl, tl)
+DEF_HELPER_3(srl8, tl, env, tl, tl)
+DEF_HELPER_3(srl8_u, tl, env, tl, tl)
+DEF_HELPER_3(sll8, tl, env, tl, tl)
+DEF_HELPER_3(ksll8, tl, env, tl, tl)
+DEF_HELPER_3(kslra8, tl, env, tl, tl)
+DEF_HELPER_3(kslra8_u, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6f053bfeb7..cc782fcde5 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -24,6 +24,7 @@
 
 %sh10    20:10
 %sh4    20:4
+%sh3    20:3
 %csr    20:12
 %rm     12:3
 %nf     29:3                     !function=ex_plus_1
@@ -61,6 +62,7 @@
 
 @sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
 @sh4     ......  ...... .....  ... ..... ....... &shift  shamt=%sh4      %rs1 %rd
+@sh3     ......  ...... .....  ... ..... ....... &shift  shamt=%sh3      %rs1 %rd
 @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
 
 @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
@@ -652,3 +654,18 @@ ksll16     0110010  ..... ..... 000 ..... 1111111 @r
 kslli16    0111010  1.... ..... 000 ..... 1111111 @sh4
 kslra16    0101011  ..... ..... 000 ..... 1111111 @r
 kslra16_u  0110011  ..... ..... 000 ..... 1111111 @r
+
+sra8       0101100  ..... ..... 000 ..... 1111111 @r
+sra8_u     0110100  ..... ..... 000 ..... 1111111 @r
+srai8      0111100  00... ..... 000 ..... 1111111 @sh3
+srai8_u    0111100  01... ..... 000 ..... 1111111 @sh3
+srl8       0101101  ..... ..... 000 ..... 1111111 @r
+srl8_u     0110101  ..... ..... 000 ..... 1111111 @r
+srli8      0111101  00... ..... 000 ..... 1111111 @sh3
+srli8_u    0111101  01... ..... 000 ..... 1111111 @sh3
+sll8       0101110  ..... ..... 000 ..... 1111111 @r
+slli8      0111110  00... ..... 000 ..... 1111111 @sh3
+ksll8      0110110  ..... ..... 000 ..... 1111111 @r
+kslli8     0111110  01... ..... 000 ..... 1111111 @sh3
+kslra8     0101111  ..... ..... 000 ..... 1111111 @r
+kslra8_u   0110111  ..... ..... 000 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 848edab7e5..12a64849eb 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -353,3 +353,19 @@ GEN_RVP_SHIFTI(slli16, sll16, tcg_gen_vec_shl16i_i64);
 GEN_RVP_SHIFTI(srai16_u, sra16_u, NULL);
 GEN_RVP_SHIFTI(srli16_u, srl16_u, NULL);
 GEN_RVP_SHIFTI(kslli16, ksll16, NULL);
+
+/* SIMD 8-bit Shift Instructions */
+GEN_RVP_SHIFT(sra8, tcg_gen_gvec_sars, 0);
+GEN_RVP_SHIFT(srl8, tcg_gen_gvec_shrs, 0);
+GEN_RVP_SHIFT(sll8, tcg_gen_gvec_shls, 0);
+GEN_RVP_R_OOL(sra8_u);
+GEN_RVP_R_OOL(srl8_u);
+GEN_RVP_R_OOL(ksll8);
+GEN_RVP_R_OOL(kslra8);
+GEN_RVP_R_OOL(kslra8_u);
+GEN_RVP_SHIFTI(srai8, sra8, tcg_gen_vec_sar8i_i64);
+GEN_RVP_SHIFTI(srli8, srl8, tcg_gen_vec_shr8i_i64);
+GEN_RVP_SHIFTI(slli8, sll8, tcg_gen_vec_shl8i_i64);
+GEN_RVP_SHIFTI(srai8_u, sra8_u, NULL);
+GEN_RVP_SHIFTI(srli8_u, srl8_u, NULL);
+GEN_RVP_SHIFTI(kslli8, ksll8, NULL);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 7e31c2fe46..ab9ebc472b 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -529,3 +529,105 @@ static inline void do_kslra16_u(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(kslra16_u, 1, 2);
+
+/* SIMD 8-bit Shift Instructions */
+static inline void do_sra8(CPURISCVState *env, void *vd, void *va,
+                           void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x7;
+    d[i] = a[i] >> shift;
+}
+
+RVPR(sra8, 1, 1);
+
+static inline void do_srl8(CPURISCVState *env, void *vd, void *va,
+                           void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x7;
+    d[i] = a[i] >> shift;
+}
+
+RVPR(srl8, 1, 1);
+
+static inline void do_sll8(CPURISCVState *env, void *vd, void *va,
+                           void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x7;
+    d[i] = a[i] << shift;
+}
+
+RVPR(sll8, 1, 1);
+
+static inline void do_sra8_u(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x7;
+    d[i] =  vssra8(env, 0, a[i], shift);
+}
+
+RVPR(sra8_u, 1, 1);
+
+static inline void do_srl8_u(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0x7;
+    d[i] =  vssrl8(env, 0, a[i], shift);
+}
+
+RVPR(srl8_u, 1, 1);
+
+static inline void do_ksll8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, result;
+    uint8_t shift = *(uint8_t *)vb & 0x7;
+
+    result = a[i] << shift;
+    if (shift > (clrsb32(a[i]) - 24)) {
+        env->vxsat = 0x1;
+        d[i] = (a[i] & INT8_MIN) ? INT8_MIN : INT8_MAX;
+    } else {
+        d[i] = result;
+    }
+}
+
+RVPR(ksll8, 1, 1);
+
+static inline void do_kslra8(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    int32_t shift = sextract32((*(uint32_t *)vb), 0, 4);
+
+    if (shift >= 0) {
+        do_ksll8(env, vd, va, vb, i);
+    } else {
+        shift = -shift;
+        shift = (shift == 8) ? 7 : shift;
+        d[i] = a[i] >> shift;
+    }
+}
+
+RVPR(kslra8, 1, 1);
+
+static inline void do_kslra8_u(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va;
+    int32_t shift = sextract32((*(uint32_t *)vb), 0, 4);
+
+    if (shift >= 0) {
+        do_ksll8(env, vd, va, vb, i);
+    } else {
+        shift = -shift;
+        shift = (shift == 8) ? 7 : shift;
+        d[i] =  vssra8(env, 0, a[i], shift);
+    }
+}
+
+RVPR(kslra8_u, 1, 1);
-- 
2.17.1


