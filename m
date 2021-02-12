Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAab4-0002Ls-7K
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAab2-0002GR-1Q; Fri, 12 Feb 2021 10:43:04 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:55773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAab0-0004Bk-2K; Fri, 12 Feb 2021 10:43:03 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07559973|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.765722-0.00647677-0.227801;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYGrbMz_1613144573; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYGrbMz_1613144573)
 by smtp.aliyun-inc.com(10.147.42.22); Fri, 12 Feb 2021 23:42:54 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 19/38] target/riscv: Signed 16-bit Multiply 64-bit
 Add/Subtract Instructions
Date: Fri, 12 Feb 2021 23:02:37 +0800
Message-Id: <20210212150256.885-20-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Fri, 12 Feb 2021 15:43:04 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  2 +
 target/riscv/insn32.decode              |  2 +
 target/riscv/insn_trans/trans_rvp.c.inc | 54 +++++++++++++++++++++++++
 target/riscv/packed_helper.c            | 25 ++++++++++++
 4 files changed, 83 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b1f831bb02..2511134610 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1313,3 +1313,5 @@ DEF_HELPER_4(kmadrs, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmaxds, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmsda, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmsxda, tl, env, tl, tl, tl)
+
+DEF_HELPER_3(smal, i64, env, i64, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4e5cdbb928..a022f660b7 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -781,3 +781,5 @@ kmadrs     0110110  ..... ..... 001 ..... 1111111 @r
 kmaxds     0111110  ..... ..... 001 ..... 1111111 @r
 kmsda      0100110  ..... ..... 001 ..... 1111111 @r
 kmsxda     0100111  ..... ..... 001 ..... 1111111 @r
+
+smal       0101111  ..... ..... 001 ..... 1111111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 261aab402a..73a26bbfbd 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -602,3 +602,57 @@ GEN_RVP_R_ACC_OOL(kmadrs);
 GEN_RVP_R_ACC_OOL(kmaxds);
 GEN_RVP_R_ACC_OOL(kmsda);
 GEN_RVP_R_ACC_OOL(kmsxda);
+
+/* Signed 16-bit Multiply with 64-bit Add/Subtract Instructions */
+static bool
+r_d64_s64_ool(DisasContext *ctx, arg_r *a,
+              void (* fn)(TCGv_i64, TCGv_ptr, TCGv_i64, TCGv))
+{
+#ifdef TARGET_RISCV64
+    return r_ool(ctx, a, fn);
+#else
+    TCGv_i32 src2, a0, a1, d0, d1;
+    TCGv_i64 src1, dst;
+
+    if (!has_ext(ctx, RVP) || !ctx->ext_p64) {
+        return false;
+    }
+
+    src1 = tcg_temp_new_i64();
+    src2 = tcg_temp_new_i32();
+    dst = tcg_temp_new_i64();
+    a0 = tcg_temp_new_i32();
+    a1 = tcg_temp_new_i32();
+
+    gen_get_gpr(a0, a->rs1);
+    gen_get_gpr(a1, a->rs1 + 1);
+    tcg_gen_concat_i32_i64(src1, a0, a1);
+    gen_get_gpr(src2, a->rs2);
+
+    fn(dst, cpu_env, src1, src2);
+
+    d0 = tcg_temp_new_i32();
+    d1 = tcg_temp_new_i32();
+    tcg_gen_extrl_i64_i32(d0, dst);
+    tcg_gen_extrh_i64_i32(d1, dst);
+    gen_set_gpr(a->rd, d0);
+    gen_set_gpr(a->rd + 1, d1);
+    tcg_temp_free_i32(d0);
+    tcg_temp_free_i32(d1);
+
+    tcg_temp_free_i64(src1);
+    tcg_temp_free_i32(src2);
+    tcg_temp_free_i64(dst);
+    tcg_temp_free_i32(a0);
+    tcg_temp_free_i32(a1);
+    return true;
+#endif
+}
+
+#define GEN_RVP_R_D64_S64_OOL(NAME)                    \
+static bool trans_##NAME(DisasContext *s, arg_r *a)    \
+{                                                      \
+    return r_d64_s64_ool(s, a, gen_helper_##NAME);     \
+}
+
+GEN_RVP_R_D64_S64_OOL(smal);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index b3673a33ee..8ad7ea8354 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -1953,3 +1953,28 @@ static inline void do_kmsxda(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR_ACC(kmsxda, 1, 4);
+
+/* Signed 16-bit Multiply with 64-bit Add/Subtract Instructions */
+static inline void do_smal(CPURISCVState *env, void *vd, void *va,
+                           void *vb, uint8_t i)
+{
+    int64_t *d = vd, *a = va;
+    int16_t *b = vb;
+
+    if (i == 0) {
+        *d = *a;
+    }
+
+    *d += b[H2(i)] * b[H2(i + 1)];
+}
+
+uint64_t helper_smal(CPURISCVState *env, uint64_t a, target_ulong b)
+{
+    int i;
+    int64_t result = 0;
+
+    for (i = 0; i < sizeof(target_ulong); i += 2) {
+        do_smal(env, &result, &a, &b, i);
+    }
+    return result;
+}
-- 
2.17.1


