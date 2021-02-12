Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAaue-0003B4-1Q
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 11:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAauc-00039h-Rg; Fri, 12 Feb 2021 11:03:18 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:43436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAauZ-0004zB-Nq; Fri, 12 Feb 2021 11:03:18 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.388114-0.0123163-0.599569;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047190; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYHddMC_1613145781; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYHddMC_1613145781)
 by smtp.aliyun-inc.com(10.147.42.135);
 Sat, 13 Feb 2021 00:03:02 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 29/38] target/riscv: RV64 Only SIMD 32-bit Add/Subtract
 Instructions
Date: Fri, 12 Feb 2021 23:02:47 +0800
Message-Id: <20210212150256.885-30-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 16:03:19 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  30 +++
 target/riscv/insn32-64.decode           |  32 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  67 ++++++
 target/riscv/packed_helper.c            | 278 ++++++++++++++++++++++++
 4 files changed, 407 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 7b3f41866e..0ade207de6 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1396,3 +1396,33 @@ DEF_HELPER_3(sra_u, tl, env, tl, tl)
 DEF_HELPER_3(bitrev, tl, env, tl, tl)
 DEF_HELPER_3(wext, tl, env, i64, tl)
 DEF_HELPER_4(bpick, tl, env, tl, tl, tl)
+#ifdef TARGET_RISCV64
+DEF_HELPER_3(radd32, tl, env, tl, tl)
+DEF_HELPER_3(uradd32, tl, env, tl, tl)
+DEF_HELPER_3(kadd32, tl, env, tl, tl)
+DEF_HELPER_3(ukadd32, tl, env, tl, tl)
+DEF_HELPER_3(rsub32, tl, env, tl, tl)
+DEF_HELPER_3(ursub32, tl, env, tl, tl)
+DEF_HELPER_3(ksub32, tl, env, tl, tl)
+DEF_HELPER_3(uksub32, tl, env, tl, tl)
+DEF_HELPER_3(cras32, tl, env, tl, tl)
+DEF_HELPER_3(rcras32, tl, env, tl, tl)
+DEF_HELPER_3(urcras32, tl, env, tl, tl)
+DEF_HELPER_3(kcras32, tl, env, tl, tl)
+DEF_HELPER_3(ukcras32, tl, env, tl, tl)
+DEF_HELPER_3(crsa32, tl, env, tl, tl)
+DEF_HELPER_3(rcrsa32, tl, env, tl, tl)
+DEF_HELPER_3(urcrsa32, tl, env, tl, tl)
+DEF_HELPER_3(kcrsa32, tl, env, tl, tl)
+DEF_HELPER_3(ukcrsa32, tl, env, tl, tl)
+DEF_HELPER_3(stas32, tl, env, tl, tl)
+DEF_HELPER_3(rstas32, tl, env, tl, tl)
+DEF_HELPER_3(urstas32, tl, env, tl, tl)
+DEF_HELPER_3(kstas32, tl, env, tl, tl)
+DEF_HELPER_3(ukstas32, tl, env, tl, tl)
+DEF_HELPER_3(stsa32, tl, env, tl, tl)
+DEF_HELPER_3(rstsa32, tl, env, tl, tl)
+DEF_HELPER_3(urstsa32, tl, env, tl, tl)
+DEF_HELPER_3(kstsa32, tl, env, tl, tl)
+DEF_HELPER_3(ukstsa32, tl, env, tl, tl)
+#endif
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 1094172210..66eec1a44a 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -82,3 +82,35 @@ fmv_d_x    1111001  00000 ..... 000 ..... 1010011 @r2
 hlv_wu    0110100  00001   ..... 100 ..... 1110011 @r2
 hlv_d     0110110  00000   ..... 100 ..... 1110011 @r2
 hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
+
+# *** RV64P Standard Extension (in addition to RV32P) ***
+add32      0100000  ..... ..... 010 ..... 1111111 @r
+radd32     0000000  ..... ..... 010 ..... 1111111 @r
+uradd32    0010000  ..... ..... 010 ..... 1111111 @r
+kadd32     0001000  ..... ..... 010 ..... 1111111 @r
+ukadd32    0011000  ..... ..... 010 ..... 1111111 @r
+sub32      0100001  ..... ..... 010 ..... 1111111 @r
+rsub32     0000001  ..... ..... 010 ..... 1111111 @r
+ursub32    0010001  ..... ..... 010 ..... 1111111 @r
+ksub32     0001001  ..... ..... 010 ..... 1111111 @r
+uksub32    0011001  ..... ..... 010 ..... 1111111 @r
+cras32     0100010  ..... ..... 010 ..... 1111111 @r
+rcras32    0000010  ..... ..... 010 ..... 1111111 @r
+urcras32   0010010  ..... ..... 010 ..... 1111111 @r
+kcras32    0001010  ..... ..... 010 ..... 1111111 @r
+ukcras32   0011010  ..... ..... 010 ..... 1111111 @r
+crsa32     0100011  ..... ..... 010 ..... 1111111 @r
+rcrsa32    0000011  ..... ..... 010 ..... 1111111 @r
+urcrsa32   0010011  ..... ..... 010 ..... 1111111 @r
+kcrsa32    0001011  ..... ..... 010 ..... 1111111 @r
+ukcrsa32   0011011  ..... ..... 010 ..... 1111111 @r
+stas32     1111000  ..... ..... 010 ..... 1111111 @r
+rstas32    1011000  ..... ..... 010 ..... 1111111 @r
+urstas32   1101000  ..... ..... 010 ..... 1111111 @r
+kstas32    1100000  ..... ..... 010 ..... 1111111 @r
+ukstas32   1110000  ..... ..... 010 ..... 1111111 @r
+stsa32     1111001  ..... ..... 010 ..... 1111111 @r
+rstsa32    1011001  ..... ..... 010 ..... 1111111 @r
+urstsa32   1101001  ..... ..... 010 ..... 1111111 @r
+kstsa32    1100001  ..... ..... 010 ..... 1111111 @r
+ukstsa32   1110001  ..... ..... 010 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 8c47fd562b..ea673b3aca 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1090,3 +1090,70 @@ static bool trans_msubr32(DisasContext *ctx, arg_r *a)
     tcg_temp_free_i32(w3);
     return true;
 }
+
+#ifdef TARGET_RISCV64
+/*
+ *** RV64 Only Instructions
+ */
+/* RV64 Only) SIMD 32-bit Add/Subtract Instructions */
+static void tcg_gen_simd_add32(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+
+    tcg_gen_andi_i64(t1, a, ~0xffffffff);
+    tcg_gen_add_i64(t2, a, b);
+    tcg_gen_add_i64(t1, t1, b);
+    tcg_gen_deposit_i64(d, t1, t2, 0, 32);
+
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+}
+
+GEN_RVP_R_INLINE(add32, add, 2, trans_add);
+
+static void tcg_gen_simd_sub32(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+
+    tcg_gen_andi_i64(t1, b, ~0xffffffff);
+    tcg_gen_sub_i64(t2, a, b);
+    tcg_gen_sub_i64(t1, a, t1);
+    tcg_gen_deposit_i64(d, t1, t2, 0, 32);
+
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+}
+
+GEN_RVP_R_INLINE(sub32, sub, 2, trans_sub);
+
+GEN_RVP_R_OOL(radd32);
+GEN_RVP_R_OOL(uradd32);
+GEN_RVP_R_OOL(kadd32);
+GEN_RVP_R_OOL(ukadd32);
+GEN_RVP_R_OOL(rsub32);
+GEN_RVP_R_OOL(ursub32);
+GEN_RVP_R_OOL(ksub32);
+GEN_RVP_R_OOL(uksub32);
+GEN_RVP_R_OOL(cras32);
+GEN_RVP_R_OOL(rcras32);
+GEN_RVP_R_OOL(urcras32);
+GEN_RVP_R_OOL(kcras32);
+GEN_RVP_R_OOL(ukcras32);
+GEN_RVP_R_OOL(crsa32);
+GEN_RVP_R_OOL(rcrsa32);
+GEN_RVP_R_OOL(urcrsa32);
+GEN_RVP_R_OOL(kcrsa32);
+GEN_RVP_R_OOL(ukcrsa32);
+GEN_RVP_R_OOL(stas32);
+GEN_RVP_R_OOL(rstas32);
+GEN_RVP_R_OOL(urstas32);
+GEN_RVP_R_OOL(kstas32);
+GEN_RVP_R_OOL(ukstas32);
+GEN_RVP_R_OOL(stsa32);
+GEN_RVP_R_OOL(rstsa32);
+GEN_RVP_R_OOL(urstsa32);
+GEN_RVP_R_OOL(kstsa32);
+GEN_RVP_R_OOL(ukstsa32);
+#endif
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 95e60da70b..bb56933c39 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -2996,3 +2996,281 @@ static inline void do_bpick(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR_ACC(bpick, 1, sizeof(target_ulong));
+
+/*
+ *** RV64 Only Instructions
+ */
+/* (RV64 Only) SIMD 32-bit Add/Subtract Instructions */
+#ifdef TARGET_RISCV64
+static inline void do_radd32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint16_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[i] = hadd32(a[i], b[i]);
+}
+
+RVPR(radd32, 1, 4);
+
+static inline void do_uradd32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint16_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[i] = haddu32(a[i], b[i]);
+}
+
+RVPR(uradd32, 1, 4);
+
+static inline void do_kadd32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint16_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[i] = sadd32(env, 0, a[i], b[i]);
+}
+
+RVPR(kadd32, 1, 4);
+
+static inline void do_ukadd32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint16_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[i] = saddu32(env, 0, a[i], b[i]);
+}
+
+RVPR(ukadd32, 1, 4);
+
+static inline void do_rsub32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint16_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[i] = hsub32(a[i], b[i]);
+}
+
+RVPR(rsub32, 1, 4);
+
+static inline void do_ursub32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint16_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[i] = hsubu64(a[i], b[i]);
+}
+
+RVPR(ursub32, 1, 4);
+
+static inline void do_ksub32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint16_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[i] = ssub32(env, 0, a[i], b[i]);
+}
+
+RVPR(ksub32, 1, 4);
+
+static inline void do_uksub32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint16_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[i] = ssubu32(env, 0, a[i], b[i]);
+}
+
+RVPR(uksub32, 1, 4);
+
+static inline void do_cras32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = a[H4(i)] - b[H4(i + 1)];
+    d[H4(i + 1)] = a[H4(i + 1)] + b[H4(i)];
+}
+
+RVPR(cras32, 2, 4);
+
+static inline void do_rcras32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = hsub32(a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = hadd32(a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR(rcras32, 2, 4);
+
+static inline void do_urcras32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = hsubu64(a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = haddu32(a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR(urcras32, 2, 4);
+
+static inline void do_kcras32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = ssub32(env, 0, a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = sadd32(env, 0, a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR(kcras32, 2, 4);
+
+static inline void do_ukcras32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = ssubu32(env, 0, a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = saddu32(env, 0, a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR(ukcras32, 2, 4);
+
+static inline void do_crsa32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = a[H4(i)] + b[H4(i + 1)];
+    d[H4(i + 1)] = a[H4(i + 1)] - b[H4(i)];
+}
+
+RVPR(crsa32, 2, 4);
+
+static inline void do_rcrsa32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = hadd32(a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = hsub32(a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR(rcrsa32, 2, 4);
+
+static inline void do_urcrsa32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = haddu32(a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = hsubu64(a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR(urcrsa32, 2, 4);
+
+static inline void do_kcrsa32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = sadd32(env, 0, a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = ssub32(env, 0, a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR(kcrsa32, 2, 4);
+
+static inline void do_ukcrsa32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = saddu32(env, 0, a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = ssubu32(env, 0, a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR(ukcrsa32, 2, 4);
+
+static inline void do_stas32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = a[H4(i)] - b[H4(i)];
+    d[H4(i + 1)] = a[H4(i + 1)] + b[H4(i + 1)];
+}
+
+RVPR(stas32, 2, 4);
+
+static inline void do_rstas32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = hsub32(a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = hadd32(a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR(rstas32, 2, 4);
+
+static inline void do_urstas32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = hsubu64(a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = haddu32(a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR(urstas32, 2, 4);
+
+static inline void do_kstas32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = ssub32(env, 0, a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = sadd32(env, 0, a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR(kstas32, 2, 4);
+
+static inline void do_ukstas32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = ssubu32(env, 0, a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = saddu32(env, 0, a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR(ukstas32, 2, 4);
+
+static inline void do_stsa32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = a[H4(i)] + b[H4(i)];
+    d[H4(i + 1)] = a[H4(i + 1)] - b[H4(i + 1)];
+}
+
+RVPR(stsa32, 2, 4);
+
+static inline void do_rstsa32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = hadd32(a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = hsub32(a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR(rstsa32, 2, 4);
+
+static inline void do_urstsa32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = haddu32(a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = hsubu64(a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR(urstsa32, 2, 4);
+
+static inline void do_kstsa32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = sadd32(env, 0, a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = ssub32(env, 0, a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR(kstsa32, 2, 4);
+
+static inline void do_ukstsa32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = saddu32(env, 0, a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = ssubu32(env, 0, a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR(ukstsa32, 2, 4);
+#endif
-- 
2.17.1


