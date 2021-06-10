Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrFe7-0000q1-E5
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 04:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFdy-0000mp-Ov; Thu, 10 Jun 2021 04:02:28 -0400
Received: from out28-52.mail.aliyun.com ([115.124.28.52]:40709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFdv-0007gu-3c; Thu, 10 Jun 2021 04:02:26 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436283|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.333611-0.000687618-0.665701;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.KQMTs2F_1623312137; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQMTs2F_1623312137)
 by smtp.aliyun-inc.com(10.147.44.129);
 Thu, 10 Jun 2021 16:02:17 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH v2 06/37] target/riscv: SIMD 8-bit Shift Instructions
Date: Thu, 10 Jun 2021 15:58:37 +0800
Message-Id: <20210610075908.3305506-7-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.52; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-52.mail.aliyun.com
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
X-List-Received-Date: Thu, 10 Jun 2021 08:02:32 -0000

Instructions include right arithmetic shift, right logic shift,
and left shift.

The shift can be an immediate or a register scalar. The
right shift has rounding operation. And the left shift
has saturation operation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 include/tcg/tcg-op-gvec.h               |   9 +++
 target/riscv/helper.h                   |   9 +++
 target/riscv/insn32.decode              |  17 ++++
 target/riscv/insn_trans/trans_rvp.c.inc |  16 ++++
 target/riscv/packed_helper.c            | 102 ++++++++++++++++++++++++
 tcg/tcg-op-gvec.c                       |  28 +++++++
 6 files changed, 181 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index 72cf697646..91531ecb0b 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -397,12 +397,15 @@ void tcg_gen_vec_sub16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void tcg_gen_vec_sub32_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
 
 void tcg_gen_vec_shl8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t);
+void tcg_gen_vec_shl8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 void tcg_gen_vec_shl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t);
 void tcg_gen_vec_shl16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 void tcg_gen_vec_shr8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t);
+void tcg_gen_vec_shr8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 void tcg_gen_vec_shr16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t);
 void tcg_gen_vec_shr16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 void tcg_gen_vec_sar8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t);
+void tcg_gen_vec_sar8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 void tcg_gen_vec_sar16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t);
 void tcg_gen_vec_sar16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 void tcg_gen_vec_rotl8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c);
@@ -416,6 +419,9 @@ void tcg_gen_vec_rotl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c);
 #define tcg_gen_vec_shl16i_tl tcg_gen_vec_shl16i_i64
 #define tcg_gen_vec_shr16i_tl tcg_gen_vec_shr16i_i64
 #define tcg_gen_vec_sar16i_tl tcg_gen_vec_sar16i_i64
+#define tcg_gen_vec_shl8i_tl tcg_gen_vec_shl8i_i64
+#define tcg_gen_vec_shr8i_tl tcg_gen_vec_shr8i_i64
+#define tcg_gen_vec_sar8i_tl tcg_gen_vec_sar8i_i64
 #else
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i32
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i32
@@ -424,6 +430,9 @@ void tcg_gen_vec_rotl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c);
 #define tcg_gen_vec_shl16i_tl tcg_gen_vec_shl16i_i32
 #define tcg_gen_vec_shr16i_tl tcg_gen_vec_shr16i_i32
 #define tcg_gen_vec_sar16i_tl tcg_gen_vec_sar16i_i32
+#define tcg_gen_vec_shl8i_tl tcg_gen_vec_shl8i_i32
+#define tcg_gen_vec_shr8i_tl tcg_gen_vec_shr8i_i32
+#define tcg_gen_vec_sar8i_tl tcg_gen_vec_sar8i_i32
 #endif
 
 #endif
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index de7b4fc17d..1b365135ff 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1197,3 +1197,12 @@ DEF_HELPER_3(sll16, tl, env, tl, tl)
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
index 44c497f28a..8b78fb24bc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -25,6 +25,7 @@
 
 %sh7    20:7
 %sh4    20:4
+%sh3    20:3
 %csr    20:12
 %rm     12:3
 %nf     29:3                     !function=ex_plus_1
@@ -63,6 +64,7 @@
 
 @sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh7     %rs1 %rd
 @sh4     ......  ...... .....  ... ..... ....... &shift  shamt=%sh4      %rs1 %rd
+@sh3     ......  ...... .....  ... ..... ....... &shift  shamt=%sh3      %rs1 %rd
 @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
 
 @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
@@ -792,3 +794,18 @@ ksll16     0110010  ..... ..... 000 ..... 1110111 @r
 kslli16    0111010  1.... ..... 000 ..... 1110111 @sh4
 kslra16    0101011  ..... ..... 000 ..... 1110111 @r
 kslra16_u  0110011  ..... ..... 000 ..... 1110111 @r
+
+sra8       0101100  ..... ..... 000 ..... 1110111 @r
+sra8_u     0110100  ..... ..... 000 ..... 1110111 @r
+srai8      0111100  00... ..... 000 ..... 1110111 @sh3
+srai8_u    0111100  01... ..... 000 ..... 1110111 @sh3
+srl8       0101101  ..... ..... 000 ..... 1110111 @r
+srl8_u     0110101  ..... ..... 000 ..... 1110111 @r
+srli8      0111101  00... ..... 000 ..... 1110111 @sh3
+srli8_u    0111101  01... ..... 000 ..... 1110111 @sh3
+sll8       0101110  ..... ..... 000 ..... 1110111 @r
+slli8      0111110  00... ..... 000 ..... 1110111 @sh3
+ksll8      0110110  ..... ..... 000 ..... 1110111 @r
+kslli8     0111110  01... ..... 000 ..... 1110111 @sh3
+kslra8     0101111  ..... ..... 000 ..... 1110111 @r
+kslra8_u   0110111  ..... ..... 000 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index afafa49824..e6c5f2ddf5 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -187,3 +187,19 @@ GEN_RVP_SHIFTI(slli16, tcg_gen_vec_shl16i_tl, gen_helper_sll16);
 GEN_RVP_SHIFTI(srai16_u, NULL, gen_helper_sra16_u);
 GEN_RVP_SHIFTI(srli16_u, NULL, gen_helper_srl16_u);
 GEN_RVP_SHIFTI(kslli16, NULL, gen_helper_ksll16);
+
+/* SIMD 8-bit Shift Instructions */
+GEN_RVP_R_OOL(sra8);
+GEN_RVP_R_OOL(srl8);
+GEN_RVP_R_OOL(sll8);
+GEN_RVP_R_OOL(sra8_u);
+GEN_RVP_R_OOL(srl8_u);
+GEN_RVP_R_OOL(ksll8);
+GEN_RVP_R_OOL(kslra8);
+GEN_RVP_R_OOL(kslra8_u);
+GEN_RVP_SHIFTI(srai8, tcg_gen_vec_sar8i_tl, gen_helper_sra8);
+GEN_RVP_SHIFTI(srli8, tcg_gen_vec_shr8i_tl, gen_helper_srl8);
+GEN_RVP_SHIFTI(slli8, tcg_gen_vec_shl8i_tl, gen_helper_sll8);
+GEN_RVP_SHIFTI(srai8_u, NULL, gen_helper_sra8_u);
+GEN_RVP_SHIFTI(srli8_u, NULL, gen_helper_srl8_u);
+GEN_RVP_SHIFTI(kslli8, NULL, gen_helper_ksll8);
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
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index cf1357cee1..f8d00a7ffa 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -2680,6 +2680,13 @@ void tcg_gen_vec_shl8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
     tcg_gen_andi_i64(d, d, mask);
 }
 
+void tcg_gen_vec_shl8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
+{
+    uint32_t mask = dup_const(MO_8, 0xff << c);
+    tcg_gen_shli_i32(d, a, c);
+    tcg_gen_andi_i32(d, d, mask);
+}
+
 void tcg_gen_vec_shl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
 {
     uint64_t mask = dup_const(MO_16, 0xffff << c);
@@ -2738,6 +2745,13 @@ void tcg_gen_vec_shr8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
     tcg_gen_andi_i64(d, d, mask);
 }
 
+void tcg_gen_vec_shr8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
+{
+    uint32_t mask = dup_const(MO_8, 0xff >> c);
+    tcg_gen_shri_i32(d, a, c);
+    tcg_gen_andi_i32(d, d, mask);
+}
+
 void tcg_gen_vec_shr16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
 {
     uint64_t mask = dup_const(MO_16, 0xffff >> c);
@@ -2803,6 +2817,20 @@ void tcg_gen_vec_sar8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
     tcg_temp_free_i64(s);
 }
 
+void tcg_gen_vec_sar8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
+{
+    uint32_t s_mask = dup_const(MO_8, 0x80 >> c);
+    uint32_t c_mask = dup_const(MO_8, 0xff >> c);
+    TCGv_i32 s = tcg_temp_new_i32();
+
+    tcg_gen_shri_i32(d, a, c);
+    tcg_gen_andi_i32(s, d, s_mask);  /* isolate (shifted) sign bit */
+    tcg_gen_muli_i32(s, s, (2 << c) - 2); /* replicate isolated signs */
+    tcg_gen_andi_i32(d, d, c_mask);  /* clear out bits above sign  */
+    tcg_gen_or_i32(d, d, s);         /* include sign extension */
+    tcg_temp_free_i32(s);
+}
+
 void tcg_gen_vec_sar16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
 {
     uint64_t s_mask = dup_const(MO_16, 0x8000 >> c);
-- 
2.25.1


