Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAasm-0001bS-Jt
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 11:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAash-0001a9-PE; Fri, 12 Feb 2021 11:01:19 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:47274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAasb-000446-43; Fri, 12 Feb 2021 11:01:19 -0500
X-Alimail-AntiSpam: AC=SUSPECT; BC=0.07436282|-1; BR=01201311R191ec; CH=blue;
 DM=|CONTINUE|false|; DS=SPAM|spam_blackmail|0.810633-0.00817039-0.181197;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047190; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYH76hb_1613145661; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYH76hb_1613145661)
 by smtp.aliyun-inc.com(10.147.44.118);
 Sat, 13 Feb 2021 00:01:01 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 28/38] target/riscv: Non-SIMD Miscellaneous Instructions
Date: Fri, 12 Feb 2021 23:02:46 +0800
Message-Id: <20210212150256.885-29-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 16:01:20 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |   6 +
 target/riscv/insn32.decode              |  16 ++
 target/riscv/insn_trans/trans_rvp.c.inc | 234 ++++++++++++++++++++++++
 target/riscv/packed_helper.c            |  77 ++++++++
 4 files changed, 333 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 93bb26d207..7b3f41866e 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1390,3 +1390,9 @@ DEF_HELPER_3(maxw, tl, env, tl, tl)
 DEF_HELPER_3(minw, tl, env, tl, tl)
 DEF_HELPER_3(mulr64, i64, env, tl, tl)
 DEF_HELPER_3(mulsr64, i64, env, tl, tl)
+
+DEF_HELPER_3(ave, tl, env, tl, tl)
+DEF_HELPER_3(sra_u, tl, env, tl, tl)
+DEF_HELPER_3(bitrev, tl, env, tl, tl)
+DEF_HELPER_3(wext, tl, env, i64, tl)
+DEF_HELPER_4(bpick, tl, env, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 342b6d64c3..16bf3c945b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -26,6 +26,7 @@
 %sh4    20:4
 %sh3    20:3
 %sh5    20:5
+%sh6    20:6
 %csr    20:12
 %rm     12:3
 %nf     29:3                     !function=ex_plus_1
@@ -44,6 +45,7 @@
 &j    imm rd
 &r    rd rs1 rs2
 &r2   rd rs1
+&r4   rd rs1 rs2 rs3
 &s    imm rs1 rs2
 &u    imm rd
 &shift     shamt rs1 rd
@@ -66,6 +68,7 @@
 @sh4     ......  ...... .....  ... ..... ....... &shift  shamt=%sh4      %rs1 %rd
 @sh3     ......  ...... .....  ... ..... ....... &shift  shamt=%sh3      %rs1 %rd
 @sh5     ......  ...... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
+@sh6     ......  ...... .....  ... ..... ....... &shift  shamt=%sh6      %rs1 %rd
 @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
 
 @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
@@ -75,6 +78,7 @@
 @r_rm    .......   ..... ..... ... ..... ....... %rs2 %rs1 %rm %rd
 @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
 @r2      .......   ..... ..... ... ..... ....... %rs1 %rd
+@r4      ..... ..  ..... ..... ... ..... ....... %rs3 %rs2 %rs1 %rd
 @r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &r2nfvm %nf %rs1 %rd
 @r2_vm   ...... vm:1 ..... ..... ... ..... ....... &rmr %rs2 %rd
 @r1_vm   ...... vm:1 ..... ..... ... ..... ....... %rd
@@ -861,3 +865,15 @@ maxw       1111001  ..... ..... 000 ..... 1111111 @r
 minw       1111000  ..... ..... 000 ..... 1111111 @r
 mulr64     1111000  ..... ..... 001 ..... 1111111 @r
 mulsr64    1110000  ..... ..... 001 ..... 1111111 @r
+
+ave        1110000  ..... ..... 000 ..... 1111111 @r
+sra_u      0010010  ..... ..... 001 ..... 1111111 @r
+srai_u     110101  ...... ..... 001 ..... 1111111 @sh6
+bitrev     1110011  ..... ..... 000 ..... 1111111 @r
+bitrevi    111010  ...... ..... 000 ..... 1111111 @sh6
+wext       1100111  ..... ..... 000 ..... 1111111 @r
+wexti      1101111  ..... ..... 000 ..... 1111111 @sh5
+bpick      .....00  ..... ..... 011 ..... 1111111 @r4
+insb       1010110  00 ... ..... 000 ..... 1111111 @sh3
+maddr32    1100010  ..... ..... 001 ..... 1111111 @r
+msubr32    1100011  ..... ..... 001 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 676c193f07..8c47fd562b 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -856,3 +856,237 @@ GEN_RVP_R_OOL(minw);
 GEN_RVP_R_OOL(maxw);
 GEN_RVP_R_D64_OOL(mulr64);
 GEN_RVP_R_D64_OOL(mulsr64);
+
+/* Non-SIMD Miscellaneous Instructions */
+GEN_RVP_R_OOL(ave);
+GEN_RVP_R_OOL(sra_u);
+GEN_RVP_SHIFTI(srai_u, sra_u, NULL);
+GEN_RVP_R_OOL(bitrev);
+GEN_RVP_SHIFTI(bitrevi, bitrev, NULL);
+
+static bool
+r_s64_ool(DisasContext *ctx, arg_r *a,
+          void (* fn)(TCGv, TCGv_ptr, TCGv_i64, TCGv))
+{
+#ifdef TARGET_RISCV64
+    return r_ool(ctx, a, fn);
+#else
+    TCGv_i64 src1;
+    TCGv_i32 src2, dst;
+    TCGv_i32 a0, a1;
+
+    if (!has_ext(ctx, RVP) || !ctx->ext_p64) {
+        return false;
+    }
+
+    src1 = tcg_temp_new_i64();
+    src2 = tcg_temp_new_i32();
+    a0 = tcg_temp_new_i32();
+    a1 = tcg_temp_new_i32();
+    dst = tcg_temp_new_i32();
+
+    gen_get_gpr(a0, a->rs1);
+    gen_get_gpr(a1, a->rs1 + 1);
+    tcg_gen_concat_i32_i64(src1, a0, a1);
+    gen_get_gpr(src2, a->rs2);
+    fn(dst, cpu_env, src1, src2);
+
+    gen_set_gpr(a->rd, dst);
+
+    tcg_temp_free_i64(src1);
+    tcg_temp_free_i32(a0);
+    tcg_temp_free_i32(a1);
+    tcg_temp_free_i32(src2);
+    tcg_temp_free_i32(dst);
+    return true;
+#endif
+}
+
+#define GEN_RVP_R_S64_OOL(NAME)                        \
+static bool trans_##NAME(DisasContext *s, arg_r *a)    \
+{                                                      \
+    return r_s64_ool(s, a, gen_helper_##NAME);         \
+}
+
+GEN_RVP_R_S64_OOL(wext);
+
+static bool rvp_shifti_s64_ool(DisasContext *ctx, arg_shift *a,
+                               void (* fn)(TCGv, TCGv_ptr, TCGv_i64, TCGv))
+{
+#ifdef TARGET_RISCV64
+    return rvp_shifti_ool(ctx, a, fn);
+#else
+    TCGv_i64 src1;
+    TCGv_i32 shift, dst;
+    TCGv_i32 a0, a1;
+
+    if (!has_ext(ctx, RVP) || !ctx->ext_p64) {
+        return false;
+    }
+
+    src1 = tcg_temp_new_i64();
+    a0 = tcg_temp_new_i32();
+    a1 = tcg_temp_new_i32();
+    dst = tcg_temp_new_i32();
+
+    gen_get_gpr(a0, a->rs1);
+    gen_get_gpr(a1, a->rs1 + 1);
+    tcg_gen_concat_i32_i64(src1, a0, a1);
+    shift = tcg_const_tl(a->shamt);
+    fn(dst, cpu_env, src1, shift);
+    gen_set_gpr(a->rd, dst);
+
+    tcg_temp_free_i64(src1);
+    tcg_temp_free_i32(a0);
+    tcg_temp_free_i32(a1);
+    tcg_temp_free_i32(shift);
+    tcg_temp_free_i32(dst);
+    return true;
+#endif
+}
+
+#define GEN_RVP_SHIFTI_S64_OOL(NAME, OP)                    \
+static bool trans_##NAME(DisasContext *s, arg_shift *a)     \
+{                                                           \
+    return rvp_shifti_s64_ool(s, a, gen_helper_##OP);       \
+}
+
+GEN_RVP_SHIFTI_S64_OOL(wexti, wext);
+
+typedef void gen_helper_rvp_r4(TCGv, TCGv_ptr, TCGv, TCGv, TCGv);
+
+static bool r4_ool(DisasContext *ctx, arg_r4 *a, gen_helper_rvp_r4 *fn)
+{
+    TCGv src1, src2, src3, dst;
+    if (!has_ext(ctx, RVP)) {
+        return false;
+    }
+
+    src1 = tcg_temp_new();
+    src2 = tcg_temp_new();
+    src3 = tcg_temp_new();
+    dst = tcg_temp_new();
+
+    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(src2, a->rs2);
+    gen_get_gpr(src3, a->rs3);
+    fn(dst, cpu_env, src1, src2, src3);
+    gen_set_gpr(a->rd, dst);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(src2);
+    tcg_temp_free(src3);
+    tcg_temp_free(dst);
+    return true;
+}
+
+#define GEN_RVP_R4_OOL(NAME)                           \
+static bool trans_##NAME(DisasContext *s, arg_r4 *a)   \
+{                                                      \
+    return r4_ool(s, a, gen_helper_##NAME);            \
+}
+
+GEN_RVP_R4_OOL(bpick);
+
+static bool trans_insb(DisasContext *ctx, arg_shift *a)
+{
+    TCGv src1, dst, b0;
+    uint8_t shift;
+    if (!has_ext(ctx, RVP)) {
+        return false;
+    }
+#ifdef TARGET_RISCV32
+    shift = a->shamt & 0x3;
+#else
+    shift = a->shamt;
+#endif
+    src1 = tcg_temp_new();
+    dst = tcg_temp_new();
+    b0 = tcg_temp_new();
+
+    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(dst, a->rd);
+
+    tcg_gen_andi_tl(b0, src1, 0xff);
+    tcg_gen_deposit_tl(dst, dst, b0, shift * 8, 8);
+    gen_set_gpr(a->rd, dst);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(dst);
+    tcg_temp_free(b0);
+    return true;
+}
+
+static bool trans_maddr32(DisasContext *ctx, arg_r *a)
+{
+    TCGv src1, src2, dst;
+    TCGv_i32 w1, w2, w3;
+    if (!has_ext(ctx, RVP)) {
+        return false;
+    }
+
+    src1 = tcg_temp_new();
+    src2 = tcg_temp_new();
+    dst = tcg_temp_new();
+    w1 = tcg_temp_new_i32();
+    w2 = tcg_temp_new_i32();
+    w3 = tcg_temp_new_i32();
+
+    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(src2, a->rs2);
+    gen_get_gpr(dst, a->rd);
+
+    tcg_gen_trunc_tl_i32(w1, src1);
+    tcg_gen_trunc_tl_i32(w2, src2);
+    tcg_gen_trunc_tl_i32(w3, dst);
+
+    tcg_gen_mul_i32(w1, w1, w2);
+    tcg_gen_add_i32(w3, w3, w1);
+    tcg_gen_ext_i32_tl(dst, w3);
+    gen_set_gpr(a->rd, dst);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(src2);
+    tcg_temp_free(dst);
+    tcg_temp_free_i32(w1);
+    tcg_temp_free_i32(w2);
+    tcg_temp_free_i32(w3);
+    return true;
+}
+
+static bool trans_msubr32(DisasContext *ctx, arg_r *a)
+{
+    TCGv src1, src2, dst;
+    TCGv_i32 w1, w2, w3;
+    if (!has_ext(ctx, RVP)) {
+        return false;
+    }
+
+    src1 = tcg_temp_new();
+    src2 = tcg_temp_new();
+    dst = tcg_temp_new();
+    w1 = tcg_temp_new_i32();
+    w2 = tcg_temp_new_i32();
+    w3 = tcg_temp_new_i32();
+
+    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(src2, a->rs2);
+    gen_get_gpr(dst, a->rd);
+
+    tcg_gen_trunc_tl_i32(w1, src1);
+    tcg_gen_trunc_tl_i32(w2, src2);
+    tcg_gen_trunc_tl_i32(w3, dst);
+
+    tcg_gen_mul_i32(w1, w1, w2);
+    tcg_gen_sub_i32(w3, w3, w1);
+    tcg_gen_ext_i32_tl(dst, w3);
+    gen_set_gpr(a->rd, dst);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(src2);
+    tcg_temp_free(dst);
+    tcg_temp_free_i32(w1);
+    tcg_temp_free_i32(w2);
+    tcg_temp_free_i32(w3);
+    return true;
+}
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 34af713020..95e60da70b 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -2919,3 +2919,80 @@ static inline void do_mulsr64(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR64(mulsr64);
+
+/* Miscellaneous Instructions */
+static inline void do_ave(CPURISCVState *env, void *vd, void *va,
+                          void *vb, uint8_t i)
+{
+    target_long *d = vd, *a = va, *b = vb, half;
+
+    half = hadd64(*a, *b);
+    if ((*a ^ *b) & 0x1) {
+        half++;
+    }
+    *d = half;
+}
+
+RVPR(ave, 1, sizeof(target_ulong));
+
+static inline void do_sra_u(CPURISCVState *env, void *vd, void *va,
+                            void *vb, uint8_t i)
+{
+    target_long *d = vd, *a = va;
+    uint8_t *b = vb;
+    uint8_t shift = riscv_has_ext(env, RV32) ? (*b & 0x1f) : (*b & 0x3f);
+
+    *d = vssra64(env, 0, *a, shift);
+}
+
+RVPR(sra_u, 1, sizeof(target_ulong));
+
+static inline void do_bitrev(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    target_ulong *d = vd, *a = va;
+    uint8_t *b = vb;
+    uint8_t shift = riscv_has_ext(env, RV32) ? (*b & 0x1f) : (*b & 0x3f);
+
+    *d = revbit64(*a) >> (64 - shift - 1);
+}
+
+RVPR(bitrev, 1, sizeof(target_ulong));
+
+static inline target_ulong
+rvpr_64(CPURISCVState *env, uint64_t a, target_ulong b, PackedFn3 *fn)
+{
+    target_ulong result = 0;
+
+    fn(env, &result, &a, &b);
+    return result;
+}
+
+#define RVPR_64(NAME)                                       \
+target_ulong HELPER(NAME)(CPURISCVState *env, uint64_t a,   \
+                          target_ulong b)                   \
+{                                                           \
+    return rvpr_64(env, a, b, (PackedFn3 *)do_##NAME);      \
+}
+
+static inline void do_wext(CPURISCVState *env, void *vd, void *va,
+                           void *vb, uint8_t i)
+{
+    target_long *d = vd;
+    int64_t *a = va;
+    uint8_t b = *(uint8_t *)vb & 0x1f;
+
+    *d = sextract64(*a, b, 32);
+}
+
+RVPR_64(wext);
+
+static inline void do_bpick(CPURISCVState *env, void *vd, void *va,
+                            void *vb, void *vc, uint8_t i)
+{
+    target_long *d = vd, *a = va, *b = vb, *c = vc;
+
+    *d = (*c & *a) | (~*c & *b);
+}
+
+RVPR_ACC(bpick, 1, sizeof(target_ulong));
-- 
2.17.1


