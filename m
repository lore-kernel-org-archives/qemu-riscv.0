Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAaNR-0004Em-Qe
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaNN-0004CT-7v; Fri, 12 Feb 2021 10:28:57 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:43422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaNK-0006Xo-D4; Fri, 12 Feb 2021 10:28:56 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.412053-0.0126374-0.57531;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047202; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYGrTFL_1613143727; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYGrTFL_1613143727)
 by smtp.aliyun-inc.com(10.147.42.22); Fri, 12 Feb 2021 23:28:48 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 12/38] target/riscv: SIMD 16-bit Miscellaneous Instructions
Date: Fri, 12 Feb 2021 23:02:30 +0800
Message-Id: <20210212150256.885-13-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 15:28:58 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  12 ++
 target/riscv/insn32.decode              |  13 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  42 ++++++
 target/riscv/packed_helper.c            | 167 ++++++++++++++++++++++++
 4 files changed, 234 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6bb601b436..866484e37d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1228,3 +1228,15 @@ DEF_HELPER_3(umul8, i64, env, tl, tl)
 DEF_HELPER_3(umulx8, i64, env, tl, tl)
 DEF_HELPER_3(khm8, tl, env, tl, tl)
 DEF_HELPER_3(khmx8, tl, env, tl, tl)
+
+DEF_HELPER_3(smin16, tl, env, tl, tl)
+DEF_HELPER_3(umin16, tl, env, tl, tl)
+DEF_HELPER_3(smax16, tl, env, tl, tl)
+DEF_HELPER_3(umax16, tl, env, tl, tl)
+DEF_HELPER_3(sclip16, tl, env, tl, tl)
+DEF_HELPER_3(uclip16, tl, env, tl, tl)
+DEF_HELPER_2(kabs16, tl, env, tl)
+DEF_HELPER_2(clrs16, tl, env, tl)
+DEF_HELPER_2(clz16, tl, env, tl)
+DEF_HELPER_2(clo16, tl, env, tl)
+DEF_HELPER_2(swap16, tl, env, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 9d165efba9..bc9d5fc967 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -42,6 +42,7 @@
 &i    imm rs1 rd
 &j    imm rd
 &r    rd rs1 rs2
+&r2   rd rs1
 &s    imm rs1 rs2
 &u    imm rd
 &shift     shamt rs1 rd
@@ -695,3 +696,15 @@ umul8      1011100  ..... ..... 000 ..... 1111111 @r
 umulx8     1011101  ..... ..... 000 ..... 1111111 @r
 khm8       1000111  ..... ..... 000 ..... 1111111 @r
 khmx8      1001111  ..... ..... 000 ..... 1111111 @r
+
+smin16     1000000  ..... ..... 000 ..... 1111111 @r
+umin16     1001000  ..... ..... 000 ..... 1111111 @r
+smax16     1000001  ..... ..... 000 ..... 1111111 @r
+umax16     1001001  ..... ..... 000 ..... 1111111 @r
+sclip16    1000010  0.... ..... 000 ..... 1111111 @sh4
+uclip16    1000010  1.... ..... 000 ..... 1111111 @sh4
+kabs16     1010110  10001 ..... 000 ..... 1111111 @r2
+clrs16     1010111  01000 ..... 000 ..... 1111111 @r2
+clz16      1010111  01001 ..... 000 ..... 1111111 @r2
+clo16      1010111  01011 ..... 000 ..... 1111111 @r2
+swap16     1010110  11001 ..... 000 ..... 1111111 @r2
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 336f3418b1..56fb8b2523 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -444,3 +444,45 @@ GEN_RVP_R_D64_OOL(umul8);
 GEN_RVP_R_D64_OOL(umulx8);
 GEN_RVP_R_OOL(khm8);
 GEN_RVP_R_OOL(khmx8);
+
+/* SIMD 16-bit Miscellaneous Instructions */
+GEN_RVP_R_OOL(smin16);
+GEN_RVP_R_OOL(umin16);
+GEN_RVP_R_OOL(smax16);
+GEN_RVP_R_OOL(umax16);
+GEN_RVP_SHIFTI(sclip16, sclip16, NULL);
+GEN_RVP_SHIFTI(uclip16, uclip16, NULL);
+
+/* Out of line helpers for R2 format */
+static bool
+r2_ool(DisasContext *ctx, arg_r2 *a,
+       void (* fn)(TCGv, TCGv_ptr, TCGv))
+{
+    TCGv src1, dst;
+    if (!has_ext(ctx, RVP)) {
+        return false;
+    }
+
+    src1 = tcg_temp_new();
+    dst = tcg_temp_new();
+
+    gen_get_gpr(src1, a->rs1);
+    fn(dst, cpu_env, src1);
+    gen_set_gpr(a->rd, dst);
+
+    tcg_temp_free(src1);
+    tcg_temp_free(dst);
+    return true;
+}
+
+#define GEN_RVP_R2_OOL(NAME)                           \
+static bool trans_##NAME(DisasContext *s, arg_r2 *a)   \
+{                                                      \
+    return r2_ool(s, a, gen_helper_##NAME);            \
+}
+
+GEN_RVP_R2_OOL(kabs16);
+GEN_RVP_R2_OOL(clrs16);
+GEN_RVP_R2_OOL(clz16);
+GEN_RVP_R2_OOL(clo16);
+GEN_RVP_R2_OOL(swap16);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 56baefeb8e..a6ab011ace 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -920,3 +920,170 @@ static inline void do_khmx8(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR(khmx8, 2, 1);
+
+/* SIMD 16-bit Miscellaneous Instructions */
+static inline void do_smin16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] < b[i]) ? a[i] : b[i];
+}
+
+RVPR(smin16, 1, 2);
+
+static inline void do_umin16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] < b[i]) ? a[i] : b[i];
+}
+
+RVPR(umin16, 1, 2);
+
+static inline void do_smax16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] > b[i]) ? a[i] : b[i];
+}
+
+RVPR(smax16, 1, 2);
+
+static inline void do_umax16(CPURISCVState *env, void *vd, void *va,
+                             void *vb, uint8_t i)
+{
+    uint16_t *d = vd, *a = va, *b = vb;
+
+    d[i] = (a[i] > b[i]) ? a[i] : b[i];
+}
+
+RVPR(umax16, 1, 2);
+
+static int64_t sat64(CPURISCVState *env, int64_t a, uint8_t shift)
+{
+    int64_t max = shift >= 64 ? INT64_MAX : (1ull << shift) - 1;
+    int64_t min = shift >= 64 ? INT64_MIN : -(1ull << shift);
+    int64_t result;
+
+    if (a > max) {
+        result = max;
+        env->vxsat = 0x1;
+    } else if (a < min) {
+        result = min;
+        env->vxsat = 0x1;
+    } else {
+        result = a;
+    }
+    return result;
+}
+
+static inline void do_sclip16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0xf;
+
+    d[i] = sat64(env, a[i], shift);
+}
+
+RVPR(sclip16, 1, 2);
+
+static uint64_t satu64(CPURISCVState *env, uint64_t a, uint8_t shift)
+{
+    uint64_t max = shift >= 64 ? UINT64_MAX : (1ull << shift) - 1;
+    uint64_t result;
+
+    if (a > max) {
+        result = max;
+        env->vxsat = 0x1;
+    } else {
+        result = a;
+    }
+    return result;
+}
+
+static inline void do_uclip16(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int16_t *d = vd, *a = va;
+    uint8_t shift = *(uint8_t *)vb & 0xf;
+
+    if (a[i] < 0) {
+        d[i] = 0;
+        env->vxsat = 0x1;
+    } else {
+        d[i] = satu64(env, a[i], shift);
+    }
+}
+
+RVPR(uclip16, 1, 2);
+
+typedef void PackedFn2i(CPURISCVState *, void *, void *, uint8_t);
+
+static inline target_ulong rvpr2(CPURISCVState *env, target_ulong a,
+                                 uint8_t step, uint8_t size, PackedFn2i *fn)
+{
+    int i, passes = sizeof(target_ulong) / size;
+    target_ulong result;
+
+    for (i = 0; i < passes; i += step) {
+        fn(env, &result, &a, i);
+    }
+    return result;
+}
+
+#define RVPR2(NAME, STEP, SIZE)                                  \
+target_ulong HELPER(NAME)(CPURISCVState *env, target_ulong a)    \
+{                                                                \
+    return rvpr2(env, a, STEP, SIZE, (PackedFn2i *)do_##NAME);   \
+}
+
+static inline void do_kabs16(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int16_t *d = vd, *a = va;
+
+    if (a[i] == INT16_MIN) {
+        d[i] = INT16_MAX;
+        env->vxsat = 0x1;
+    } else {
+        d[i] = abs(a[i]);
+    }
+}
+
+RVPR2(kabs16, 1, 2);
+
+static inline void do_clrs16(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int16_t *d = vd, *a = va;
+    d[i] = clrsb32(a[i]) - 16;
+}
+
+RVPR2(clrs16, 1, 2);
+
+static inline void do_clz16(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int16_t *d = vd, *a = va;
+    d[i] = (a[i] < 0) ? 0 : (clz32(a[i]) - 16);
+}
+
+RVPR2(clz16, 1, 2);
+
+static inline void do_clo16(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int16_t *d = vd, *a = va;
+    d[i] = (a[i] >= 0) ? 0 : (clo32(a[i]) - 16);
+}
+
+RVPR2(clo16, 1, 2);
+
+static inline void do_swap16(CPURISCVState *env, void *vd, void *va, uint8_t i)
+{
+    int16_t *d = vd, *a = va;
+    d[H2(i)] = a[H2(i + 1)];
+    d[H2(i + 1)] = a[H2(i)];
+}
+
+RVPR2(swap16, 2, 2);
-- 
2.17.1


