Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrFos-0001Z0-WA
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 04:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFor-0001Po-45; Thu, 10 Jun 2021 04:13:41 -0400
Received: from out28-149.mail.aliyun.com ([115.124.28.149]:41929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFom-0005bZ-Rf; Thu, 10 Jun 2021 04:13:40 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436284|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.582977-0.00815396-0.408869;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047188; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KQNP47m_1623312808; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQNP47m_1623312808)
 by smtp.aliyun-inc.com(10.147.40.26); Thu, 10 Jun 2021 16:13:28 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 28/37] target/riscv: RV64 Only SIMD 32-bit Add/Subtract
 Instructions
Date: Thu, 10 Jun 2021 15:58:59 +0800
Message-Id: <20210610075908.3305506-29-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.149; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-149.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 10 Jun 2021 08:13:41 -0000

SIMD 32-bit straight or crossed add/subtract with rounding, havling,
or saturation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 include/tcg/tcg-op-gvec.h               |   4 +
 target/riscv/helper.h                   |  29 +++
 target/riscv/insn32.decode              |  32 +++
 target/riscv/insn_trans/trans_rvp.c.inc |  84 ++++++++
 target/riscv/packed_helper.c            | 276 ++++++++++++++++++++++++
 5 files changed, 425 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index 91531ecb0b..023190e063 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -422,6 +422,8 @@ void tcg_gen_vec_rotl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c);
 #define tcg_gen_vec_shl8i_tl tcg_gen_vec_shl8i_i64
 #define tcg_gen_vec_shr8i_tl tcg_gen_vec_shr8i_i64
 #define tcg_gen_vec_sar8i_tl tcg_gen_vec_sar8i_i64
+#define tcg_gen_vec_add32_tl tcg_gen_vec_add32_i64
+#define tcg_gen_vec_sub32_tl tcg_gen_vec_sub32_i64
 #else
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i32
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i32
@@ -433,6 +435,8 @@ void tcg_gen_vec_rotl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c);
 #define tcg_gen_vec_shl8i_tl tcg_gen_vec_shl8i_i32
 #define tcg_gen_vec_shr8i_tl tcg_gen_vec_shr8i_i32
 #define tcg_gen_vec_sar8i_tl tcg_gen_vec_sar8i_i32
+#define tcg_gen_vec_add32_tl tcg_gen_add_i32
+#define tcg_gen_vec_sub32_tl tcg_gen_sub_i32
 #endif
 
 #endif
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index bdd5ca1251..0f02e140f5 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1399,3 +1399,32 @@ DEF_HELPER_3(sra_u, tl, env, tl, tl)
 DEF_HELPER_3(bitrev, tl, env, tl, tl)
 DEF_HELPER_3(wext, tl, env, i64, tl)
 DEF_HELPER_4(bpick, tl, env, tl, tl, tl)
+
+DEF_HELPER_3(radd32, i64, env, i64, i64)
+DEF_HELPER_3(uradd32, i64, env, i64, i64)
+DEF_HELPER_3(kadd32, i64, env, i64, i64)
+DEF_HELPER_3(ukadd32, i64, env, i64, i64)
+DEF_HELPER_3(rsub32, i64, env, i64, i64)
+DEF_HELPER_3(ursub32, i64, env, i64, i64)
+DEF_HELPER_3(ksub32, i64, env, i64, i64)
+DEF_HELPER_3(uksub32, i64, env, i64, i64)
+DEF_HELPER_3(cras32, i64, env, i64, i64)
+DEF_HELPER_3(rcras32, i64, env, i64, i64)
+DEF_HELPER_3(urcras32, i64, env, i64, i64)
+DEF_HELPER_3(kcras32, i64, env, i64, i64)
+DEF_HELPER_3(ukcras32, i64, env, i64, i64)
+DEF_HELPER_3(crsa32, i64, env, i64, i64)
+DEF_HELPER_3(rcrsa32, i64, env, i64, i64)
+DEF_HELPER_3(urcrsa32, i64, env, i64, i64)
+DEF_HELPER_3(kcrsa32, i64, env, i64, i64)
+DEF_HELPER_3(ukcrsa32, i64, env, i64, i64)
+DEF_HELPER_3(stas32, i64, env, i64, i64)
+DEF_HELPER_3(rstas32, i64, env, i64, i64)
+DEF_HELPER_3(urstas32, i64, env, i64, i64)
+DEF_HELPER_3(kstas32, i64, env, i64, i64)
+DEF_HELPER_3(ukstas32, i64, env, i64, i64)
+DEF_HELPER_3(stsa32, i64, env, i64, i64)
+DEF_HELPER_3(rstsa32, i64, env, i64, i64)
+DEF_HELPER_3(urstsa32, i64, env, i64, i64)
+DEF_HELPER_3(kstsa32, i64, env, i64, i64)
+DEF_HELPER_3(ukstsa32, i64, env, i64, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b70f6f0dc2..05151c6c51 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -1013,3 +1013,35 @@ bpick      .....00  ..... ..... 011 ..... 1110111 @r4
 insb       1010110  00 ... ..... 000 ..... 1110111 @sh3
 maddr32    1100010  ..... ..... 001 ..... 1110111 @r
 msubr32    1100011  ..... ..... 001 ..... 1110111 @r
+
+# *** RV64P Standard Extension (in addition to RV32P) ***
+add32      0100000  ..... ..... 010 ..... 1110111 @r
+radd32     0000000  ..... ..... 010 ..... 1110111 @r
+uradd32    0010000  ..... ..... 010 ..... 1110111 @r
+kadd32     0001000  ..... ..... 010 ..... 1110111 @r
+ukadd32    0011000  ..... ..... 010 ..... 1110111 @r
+sub32      0100001  ..... ..... 010 ..... 1110111 @r
+rsub32     0000001  ..... ..... 010 ..... 1110111 @r
+ursub32    0010001  ..... ..... 010 ..... 1110111 @r
+ksub32     0001001  ..... ..... 010 ..... 1110111 @r
+uksub32    0011001  ..... ..... 010 ..... 1110111 @r
+cras32     0100010  ..... ..... 010 ..... 1110111 @r
+rcras32    0000010  ..... ..... 010 ..... 1110111 @r
+urcras32   0010010  ..... ..... 010 ..... 1110111 @r
+kcras32    0001010  ..... ..... 010 ..... 1110111 @r
+ukcras32   0011010  ..... ..... 010 ..... 1110111 @r
+crsa32     0100011  ..... ..... 010 ..... 1110111 @r
+rcrsa32    0000011  ..... ..... 010 ..... 1110111 @r
+urcrsa32   0010011  ..... ..... 010 ..... 1110111 @r
+kcrsa32    0001011  ..... ..... 010 ..... 1110111 @r
+ukcrsa32   0011011  ..... ..... 010 ..... 1110111 @r
+stas32     1111000  ..... ..... 010 ..... 1110111 @r
+rstas32    1011000  ..... ..... 010 ..... 1110111 @r
+urstas32   1101000  ..... ..... 010 ..... 1110111 @r
+kstas32    1100000  ..... ..... 010 ..... 1110111 @r
+ukstas32   1110000  ..... ..... 010 ..... 1110111 @r
+stsa32     1111001  ..... ..... 010 ..... 1110111 @r
+rstsa32    1011001  ..... ..... 010 ..... 1110111 @r
+urstsa32   1101001  ..... ..... 010 ..... 1110111 @r
+kstsa32    1100001  ..... ..... 010 ..... 1110111 @r
+ukstsa32   1110001  ..... ..... 010 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 51e140d157..293c2c4597 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -949,3 +949,87 @@ static bool trans_msubr32(DisasContext *ctx, arg_r *a)
     tcg_temp_free_i32(w3);
     return true;
 }
+
+/*
+ *** RV64 Only Instructions
+ */
+/* RV64 Only) SIMD 32-bit Add/Subtract Instructions */
+#define GEN_RVP64_R_INLINE(NAME, VECOP, OP)              \
+static bool trans_##NAME(DisasContext *s, arg_r *a)      \
+{                                                        \
+    REQUIRE_64BIT(s);                                    \
+    return r_inline(s, a, VECOP, OP);                    \
+}
+
+GEN_RVP64_R_INLINE(add32, tcg_gen_vec_add32_tl, tcg_gen_add_tl);
+GEN_RVP64_R_INLINE(sub32, tcg_gen_vec_sub32_tl, tcg_gen_sub_tl);
+
+static bool
+r_64_ool(DisasContext *ctx, arg_r *a,
+         void (* fn)(TCGv_i64, TCGv_ptr, TCGv_i64, TCGv_i64))
+{
+    TCGv t1, t2;
+    TCGv_i64 src1, src2, dst;
+
+    if (!has_ext(ctx, RVP)) {
+        return false;
+    }
+
+    src1 = tcg_temp_new_i64();
+    src2 = tcg_temp_new_i64();
+    dst = tcg_temp_new_i64();
+
+    t1 = tcg_temp_new();
+    t2 = tcg_temp_new();
+    gen_get_gpr(t1, a->rs1);
+    tcg_gen_ext_tl_i64(src1, t1);
+    gen_get_gpr(t2, a->rs2);
+    tcg_gen_ext_tl_i64(src2, t2);
+
+    fn(dst, cpu_env, src1, src2);
+    tcg_gen_trunc_i64_tl(t1, dst);
+    gen_set_gpr(a->rd, t1);
+
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    tcg_temp_free_i64(src1);
+    tcg_temp_free_i64(src2);
+    tcg_temp_free_i64(dst);
+    return true;
+}
+
+#define GEN_RVP64_R_OOL(NAME)                          \
+static bool trans_##NAME(DisasContext *s, arg_r *a)    \
+{                                                      \
+    REQUIRE_64BIT(s);                                  \
+    return r_64_ool(s, a, gen_helper_##NAME);          \
+}
+
+GEN_RVP64_R_OOL(radd32);
+GEN_RVP64_R_OOL(uradd32);
+GEN_RVP64_R_OOL(kadd32);
+GEN_RVP64_R_OOL(ukadd32);
+GEN_RVP64_R_OOL(rsub32);
+GEN_RVP64_R_OOL(ursub32);
+GEN_RVP64_R_OOL(ksub32);
+GEN_RVP64_R_OOL(uksub32);
+GEN_RVP64_R_OOL(cras32);
+GEN_RVP64_R_OOL(rcras32);
+GEN_RVP64_R_OOL(urcras32);
+GEN_RVP64_R_OOL(kcras32);
+GEN_RVP64_R_OOL(ukcras32);
+GEN_RVP64_R_OOL(crsa32);
+GEN_RVP64_R_OOL(rcrsa32);
+GEN_RVP64_R_OOL(urcrsa32);
+GEN_RVP64_R_OOL(kcrsa32);
+GEN_RVP64_R_OOL(ukcrsa32);
+GEN_RVP64_R_OOL(stas32);
+GEN_RVP64_R_OOL(rstas32);
+GEN_RVP64_R_OOL(urstas32);
+GEN_RVP64_R_OOL(kstas32);
+GEN_RVP64_R_OOL(ukstas32);
+GEN_RVP64_R_OOL(stsa32);
+GEN_RVP64_R_OOL(rstsa32);
+GEN_RVP64_R_OOL(urstsa32);
+GEN_RVP64_R_OOL(kstsa32);
+GEN_RVP64_R_OOL(ukstsa32);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 4e0c7a92eb..305c515132 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -2987,3 +2987,279 @@ static inline void do_bpick(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR_ACC(bpick, 1, sizeof(target_ulong));
+
+/*
+ *** RV64 Only Instructions
+ */
+/* (RV64 Only) SIMD 32-bit Add/Subtract Instructions */
+static inline void do_radd32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint16_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[i] = hadd32(a[i], b[i]);
+}
+
+RVPR64_64_64(radd32, 1, 4);
+
+static inline void do_uradd32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint16_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[i] = haddu32(a[i], b[i]);
+}
+
+RVPR64_64_64(uradd32, 1, 4);
+
+static inline void do_kadd32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint16_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[i] = sadd32(env, 0, a[i], b[i]);
+}
+
+RVPR64_64_64(kadd32, 1, 4);
+
+static inline void do_ukadd32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint16_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[i] = saddu32(env, 0, a[i], b[i]);
+}
+
+RVPR64_64_64(ukadd32, 1, 4);
+
+static inline void do_rsub32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint16_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[i] = hsub32(a[i], b[i]);
+}
+
+RVPR64_64_64(rsub32, 1, 4);
+
+static inline void do_ursub32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint16_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[i] = hsubu64(a[i], b[i]);
+}
+
+RVPR64_64_64(ursub32, 1, 4);
+
+static inline void do_ksub32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint16_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[i] = ssub32(env, 0, a[i], b[i]);
+}
+
+RVPR64_64_64(ksub32, 1, 4);
+
+static inline void do_uksub32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint16_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[i] = ssubu32(env, 0, a[i], b[i]);
+}
+
+RVPR64_64_64(uksub32, 1, 4);
+
+static inline void do_cras32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = a[H4(i)] - b[H4(i + 1)];
+    d[H4(i + 1)] = a[H4(i + 1)] + b[H4(i)];
+}
+
+RVPR64_64_64(cras32, 2, 4);
+
+static inline void do_rcras32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = hsub32(a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = hadd32(a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR64_64_64(rcras32, 2, 4);
+
+static inline void do_urcras32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = hsubu64(a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = haddu32(a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR64_64_64(urcras32, 2, 4);
+
+static inline void do_kcras32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = ssub32(env, 0, a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = sadd32(env, 0, a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR64_64_64(kcras32, 2, 4);
+
+static inline void do_ukcras32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = ssubu32(env, 0, a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = saddu32(env, 0, a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR64_64_64(ukcras32, 2, 4);
+
+static inline void do_crsa32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = a[H4(i)] + b[H4(i + 1)];
+    d[H4(i + 1)] = a[H4(i + 1)] - b[H4(i)];
+}
+
+RVPR64_64_64(crsa32, 2, 4);
+
+static inline void do_rcrsa32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = hadd32(a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = hsub32(a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR64_64_64(rcrsa32, 2, 4);
+
+static inline void do_urcrsa32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = haddu32(a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = hsubu64(a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR64_64_64(urcrsa32, 2, 4);
+
+static inline void do_kcrsa32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = sadd32(env, 0, a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = ssub32(env, 0, a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR64_64_64(kcrsa32, 2, 4);
+
+static inline void do_ukcrsa32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = saddu32(env, 0, a[H4(i)], b[H4(i + 1)]);
+    d[H4(i + 1)] = ssubu32(env, 0, a[H4(i + 1)], b[H4(i)]);
+}
+
+RVPR64_64_64(ukcrsa32, 2, 4);
+
+static inline void do_stas32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = a[H4(i)] - b[H4(i)];
+    d[H4(i + 1)] = a[H4(i + 1)] + b[H4(i + 1)];
+}
+
+RVPR64_64_64(stas32, 2, 4);
+
+static inline void do_rstas32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = hsub32(a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = hadd32(a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR64_64_64(rstas32, 2, 4);
+
+static inline void do_urstas32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = hsubu64(a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = haddu32(a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR64_64_64(urstas32, 2, 4);
+
+static inline void do_kstas32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = ssub32(env, 0, a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = sadd32(env, 0, a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR64_64_64(kstas32, 2, 4);
+
+static inline void do_ukstas32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = ssubu32(env, 0, a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = saddu32(env, 0, a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR64_64_64(ukstas32, 2, 4);
+
+static inline void do_stsa32(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = a[H4(i)] + b[H4(i)];
+    d[H4(i + 1)] = a[H4(i + 1)] - b[H4(i + 1)];
+}
+
+RVPR64_64_64(stsa32, 2, 4);
+
+static inline void do_rstsa32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = hadd32(a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = hsub32(a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR64_64_64(rstsa32, 2, 4);
+
+static inline void do_urstsa32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = haddu32(a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = hsubu64(a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR64_64_64(urstsa32, 2, 4);
+
+static inline void do_kstsa32(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = sadd32(env, 0, a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = ssub32(env, 0, a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR64_64_64(kstsa32, 2, 4);
+
+static inline void do_ukstsa32(CPURISCVState *env, void *vd, void *va,
+                               void *vb, uint8_t i)
+{
+    uint32_t *d = vd, *a = va, *b = vb;
+    d[H4(i)] = saddu32(env, 0, a[H4(i)], b[H4(i)]);
+    d[H4(i + 1)] = ssubu32(env, 0, a[H4(i + 1)], b[H4(i + 1)]);
+}
+
+RVPR64_64_64(ukstsa32, 2, 4);
-- 
2.25.1


