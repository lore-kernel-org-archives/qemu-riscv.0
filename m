Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAa9t-00085d-BO
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:15:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAa9r-000821-Os; Fri, 12 Feb 2021 10:14:59 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:43987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAa9l-0000VR-7f; Fri, 12 Feb 2021 10:14:59 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07437604|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.510898-0.0177799-0.471322;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047202; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYH.AxO_1613142882; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYH.AxO_1613142882)
 by smtp.aliyun-inc.com(10.147.41.143);
 Fri, 12 Feb 2021 23:14:42 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 05/38] target/riscv: 8-bit Addition & Subtraction Instruction
Date: Fri, 12 Feb 2021 23:02:23 +0800
Message-Id: <20210212150256.885-6-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 15:15:00 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  9 +++
 target/riscv/insn32.decode              | 11 ++++
 target/riscv/insn_trans/trans_rvp.c.inc | 79 +++++++++++++++++++++++++
 target/riscv/packed_helper.c            | 73 +++++++++++++++++++++++
 4 files changed, 172 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6d622c732a..a69a6b4e84 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1175,3 +1175,12 @@ DEF_HELPER_3(rstsa16, tl, env, tl, tl)
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
index 8815e90476..358dd1fa10 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -624,3 +624,14 @@ rstsa16    1011011  ..... ..... 010 ..... 1111111 @r
 urstsa16   1101011  ..... ..... 010 ..... 1111111 @r
 kstsa16    1100011  ..... ..... 010 ..... 1111111 @r
 ukstsa16   1110011  ..... ..... 010 ..... 1111111 @r
+
+add8       0100100  ..... ..... 000 ..... 1111111 @r
+radd8      0000100  ..... ..... 000 ..... 1111111 @r
+uradd8     0010100  ..... ..... 000 ..... 1111111 @r
+kadd8      0001100  ..... ..... 000 ..... 1111111 @r
+ukadd8     0011100  ..... ..... 000 ..... 1111111 @r
+sub8       0100101  ..... ..... 000 ..... 1111111 @r
+rsub8      0000101  ..... ..... 000 ..... 1111111 @r
+ursub8     0010101  ..... ..... 000 ..... 1111111 @r
+ksub8      0001101  ..... ..... 000 ..... 1111111 @r
+uksub8     0011101  ..... ..... 000 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 0885a4fd45..109f560ec9 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -159,3 +159,82 @@ GEN_RVP_R_OOL(rstsa16);
 GEN_RVP_R_OOL(urstsa16);
 GEN_RVP_R_OOL(kstsa16);
 GEN_RVP_R_OOL(ukstsa16);
+
+/* 8-bit Addition & Subtraction Instructions */
+/*
+ *  Copied from tcg-op-gvec.c.
+ *
+ *  Perform a vector addition using normal addition and a mask.  The mask
+ *  should be the sign bit of each lane.  This 6-operation form is more
+ *  efficient than separate additions when there are 4 or more lanes in
+ *  the 64-bit operation.
+ */
+
+static void gen_simd_add_mask(TCGv d, TCGv a, TCGv b, TCGv m)
+{
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+    TCGv t3 = tcg_temp_new();
+
+    tcg_gen_andc_tl(t1, a, m);
+    tcg_gen_andc_tl(t2, b, m);
+    tcg_gen_xor_tl(t3, a, b);
+    tcg_gen_add_tl(d, t1, t2);
+    tcg_gen_and_tl(t3, t3, m);
+    tcg_gen_xor_tl(d, d, t3);
+
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    tcg_temp_free(t3);
+}
+
+static void tcg_gen_simd_add8(TCGv d, TCGv a, TCGv b)
+{
+    TCGv m = tcg_const_tl((target_ulong)dup_const(MO_8, 0x80));
+    gen_simd_add_mask(d, a, b, m);
+    tcg_temp_free(m);
+}
+
+GEN_RVP_R_INLINE(add8, add, 0, trans_add);
+
+/*
+ *  Copied from tcg-op-gvec.c.
+ *
+ *  Perform a vector subtraction using normal subtraction and a mask.
+ *  Compare gen_addv_mask above.
+ */
+static void gen_simd_sub_mask(TCGv d, TCGv a, TCGv b, TCGv m)
+{
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+    TCGv t3 = tcg_temp_new();
+
+    tcg_gen_or_tl(t1, a, m);
+    tcg_gen_andc_tl(t2, b, m);
+    tcg_gen_eqv_tl(t3, a, b);
+    tcg_gen_sub_tl(d, t1, t2);
+    tcg_gen_and_tl(t3, t3, m);
+    tcg_gen_xor_tl(d, d, t3);
+
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    tcg_temp_free(t3);
+}
+
+static void tcg_gen_simd_sub8(TCGv d, TCGv a, TCGv b)
+{
+    TCGv m = tcg_const_tl((target_ulong)dup_const(MO_8, 0x80));
+    gen_simd_sub_mask(d, a, b, m);
+    tcg_temp_free(m);
+}
+
+GEN_RVP_R_INLINE(sub8, sub, 0, trans_sub);
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
-- 
2.17.1


