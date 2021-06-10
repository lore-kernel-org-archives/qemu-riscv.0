Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrFd4-000773-OG
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 04:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFd1-000742-Vo; Thu, 10 Jun 2021 04:01:28 -0400
Received: from out28-123.mail.aliyun.com ([115.124.28.123]:53006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFcy-0006vH-EA; Thu, 10 Jun 2021 04:01:27 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07443932|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0313833-0.00351235-0.965104;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047202; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.KQMfBQW_1623312076; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQMfBQW_1623312076)
 by smtp.aliyun-inc.com(10.147.43.230);
 Thu, 10 Jun 2021 16:01:16 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH v2 04/37] target/riscv: 8-bit Addition & Subtraction
 Instruction
Date: Thu, 10 Jun 2021 15:58:35 +0800
Message-Id: <20210610075908.3305506-5-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.123; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-123.mail.aliyun.com
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
X-List-Received-Date: Thu, 10 Jun 2021 08:01:29 -0000

Include 5 groups: Wrap-around (dropping overflow), Signed Halving,
Unsigned Halving, Signed Saturation, and Unsigned Saturation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 include/tcg/tcg-op-gvec.h               |  6 ++
 target/riscv/helper.h                   |  9 +++
 target/riscv/insn32.decode              | 11 ++++
 target/riscv/insn_trans/trans_rvp.c.inc | 13 +++++
 target/riscv/packed_helper.c            | 73 +++++++++++++++++++++++++
 tcg/tcg-op-gvec.c                       | 47 ++++++++++++++++
 6 files changed, 159 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index 2dae9e78d0..392c0f95a4 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -385,11 +385,13 @@ void tcg_gen_vec_neg16_i64(TCGv_i64 d, TCGv_i64 a);
 void tcg_gen_vec_neg32_i64(TCGv_i64 d, TCGv_i64 a);
 
 void tcg_gen_vec_add8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
+void tcg_gen_vec_add8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void tcg_gen_vec_add16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
 void tcg_gen_vec_add16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void tcg_gen_vec_add32_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
 
 void tcg_gen_vec_sub8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
+void tcg_gen_vec_sub8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void tcg_gen_vec_sub16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
 void tcg_gen_vec_sub16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void tcg_gen_vec_sub32_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
@@ -406,9 +408,13 @@ void tcg_gen_vec_rotl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c);
 #if TARGET_LONG_BITS == 64
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i64
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i64
+#define tcg_gen_vec_add8_tl  tcg_gen_vec_add8_i64
+#define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i64
 #else
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i32
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i32
+#define tcg_gen_vec_add8_tl  tcg_gen_vec_add8_i32
+#define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i32
 #endif
 
 #endif
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b6a71ade33..629ff13402 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1179,3 +1179,12 @@ DEF_HELPER_3(rstsa16, tl, env, tl, tl)
 DEF_HELPER_3(urstsa16, tl, env, tl, tl)
 DEF_HELPER_3(kstsa16, tl, env, tl, tl)
 DEF_HELPER_3(ukstsa16, tl, env, tl, tl)
+
+DEF_HELPER_3(radd8, tl, env, tl, tl)
+DEF_HELPER_3(uradd8, tl, env, tl, tl)
+DEF_HELPER_3(kadd8, tl, env, tl, tl)
+DEF_HELPER_3(ukadd8, tl, env, tl, tl)
+DEF_HELPER_3(rsub8, tl, env, tl, tl)
+DEF_HELPER_3(ursub8, tl, env, tl, tl)
+DEF_HELPER_3(ksub8, tl, env, tl, tl)
+DEF_HELPER_3(uksub8, tl, env, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 57f72fabf6..13e1222296 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -764,3 +764,14 @@ rstsa16    1011011  ..... ..... 010 ..... 1110111 @r
 urstsa16   1101011  ..... ..... 010 ..... 1110111 @r
 kstsa16    1100011  ..... ..... 010 ..... 1110111 @r
 ukstsa16   1110011  ..... ..... 010 ..... 1110111 @r
+
+add8       0100100  ..... ..... 000 ..... 1110111 @r
+radd8      0000100  ..... ..... 000 ..... 1110111 @r
+uradd8     0010100  ..... ..... 000 ..... 1110111 @r
+kadd8      0001100  ..... ..... 000 ..... 1110111 @r
+ukadd8     0011100  ..... ..... 000 ..... 1110111 @r
+sub8       0100101  ..... ..... 000 ..... 1110111 @r
+rsub8      0000101  ..... ..... 000 ..... 1110111 @r
+ursub8     0010101  ..... ..... 000 ..... 1110111 @r
+ksub8      0001101  ..... ..... 000 ..... 1110111 @r
+uksub8     0011101  ..... ..... 000 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 43f395657a..80bec35ac9 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -115,3 +115,16 @@ GEN_RVP_R_OOL(rstsa16);
 GEN_RVP_R_OOL(urstsa16);
 GEN_RVP_R_OOL(kstsa16);
 GEN_RVP_R_OOL(ukstsa16);
+
+/* 8-bit Addition & Subtraction Instructions */
+GEN_RVP_R_INLINE(add8, tcg_gen_vec_add8_tl, tcg_gen_add_tl);
+GEN_RVP_R_INLINE(sub8, tcg_gen_vec_sub8_tl, tcg_gen_sub_tl);
+
+GEN_RVP_R_OOL(radd8);
+GEN_RVP_R_OOL(uradd8);
+GEN_RVP_R_OOL(kadd8);
+GEN_RVP_R_OOL(ukadd8);
+GEN_RVP_R_OOL(rsub8);
+GEN_RVP_R_OOL(ursub8);
+GEN_RVP_R_OOL(ksub8);
+GEN_RVP_R_OOL(uksub8);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index b84abaaf25..62db072204 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -352,3 +352,76 @@ static inline void do_ukstsa16(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(ukstsa16, 2, 2);
+
+/* 8-bit Addition & Subtraction Instructions */
+static inline void do_radd8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+    d[i] = hadd32(a[i], b[i]);
+}
+
+RVPR(radd8, 1, 1);
+
+static inline void do_uradd8(CPURISCVState *env, void *vd, void *va,
+                                  void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va, *b = vb;
+    d[i] = haddu32(a[i], b[i]);
+}
+
+RVPR(uradd8, 1, 1);
+
+static inline void do_kadd8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+    d[i] = sadd8(env, 0, a[i], b[i]);
+}
+
+RVPR(kadd8, 1, 1);
+
+static inline void do_ukadd8(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va, *b = vb;
+    d[i] = saddu8(env, 0, a[i], b[i]);
+}
+
+RVPR(ukadd8, 1, 1);
+
+static inline void do_rsub8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+    d[i] = hsub32(a[i], b[i]);
+}
+
+RVPR(rsub8, 1, 1);
+
+static inline void do_ursub8(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va, *b = vb;
+    d[i] = hsubu64(a[i], b[i]);
+}
+
+RVPR(ursub8, 1, 1);
+
+static inline void do_ksub8(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    int8_t *d = vd, *a = va, *b = vb;
+    d[i] = ssub8(env, 0, a[i], b[i]);
+}
+
+RVPR(ksub8, 1, 1);
+
+static inline void do_uksub8(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint8_t *d = vd, *a = va, *b = vb;
+    d[i] = ssubu8(env, 0, a[i], b[i]);
+}
+
+RVPR(uksub8, 1, 1);
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index a8898ba7bf..484ced3054 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -1736,6 +1736,30 @@ void tcg_gen_vec_add8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
     gen_addv_mask(d, a, b, m);
 }
 
+static void gen_addv_mask_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b, TCGv_i32 m)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+    TCGv_i32 t3 = tcg_temp_new_i32();
+
+    tcg_gen_andc_i32(t1, a, m);
+    tcg_gen_andc_i32(t2, b, m);
+    tcg_gen_xor_i32(t3, a, b);
+    tcg_gen_add_i32(d, t1, t2);
+    tcg_gen_and_i32(t3, t3, m);
+    tcg_gen_xor_i32(d, d, t3);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+}
+
+void tcg_gen_vec_add8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 m = tcg_constant_i32((int32_t)dup_const(MO_8, 0x80));
+    gen_addv_mask_i32(d, a, b, m);
+}
+
 void tcg_gen_vec_add16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
     TCGv_i64 m = tcg_constant_i64(dup_const(MO_16, 0x8000));
@@ -1900,6 +1924,29 @@ void tcg_gen_vec_sub8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
     gen_subv_mask(d, a, b, m);
 }
 
+static void gen_subv_mask_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b, TCGv_i32 m)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+    TCGv_i32 t3 = tcg_temp_new_i32();
+
+    tcg_gen_or_i32(t1, a, m);
+    tcg_gen_andc_i32(t2, b, m);
+    tcg_gen_eqv_i32(t3, a, b);
+    tcg_gen_sub_i32(d, t1, t2);
+    tcg_gen_and_i32(t3, t3, m);
+    tcg_gen_xor_i32(d, d, t3);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+}
+
+void tcg_gen_vec_sub8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 m = tcg_constant_i32((int32_t)dup_const(MO_8, 0x80));
+    gen_subv_mask_i32(d, a, b, m);
+}
 void tcg_gen_vec_sub16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
     TCGv_i64 m = tcg_constant_i64(dup_const(MO_16, 0x8000));
-- 
2.25.1


