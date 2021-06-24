Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwNB7-0000Tn-6z
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 07:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNB3-0000O3-ED; Thu, 24 Jun 2021 07:05:45 -0400
Received: from out28-218.mail.aliyun.com ([115.124.28.218]:44612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNB0-0002YW-KX; Thu, 24 Jun 2021 07:05:45 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07630034|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.797667-0.00574743-0.196586;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXKLpgj_1624532736; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKLpgj_1624532736)
 by smtp.aliyun-inc.com(10.147.41.199);
 Thu, 24 Jun 2021 19:05:36 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 18/37] target/riscv: Signed 16-bit Multiply 64-bit
 Add/Subtract Instructions
Date: Thu, 24 Jun 2021 18:55:02 +0800
Message-Id: <20210624105521.3964-19-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.218; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-218.mail.aliyun.com
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
X-List-Received-Date: Thu, 24 Jun 2021 11:05:46 -0000

"16x16" with 64-bit Signed Addition(64 = 64 + 16x16).

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  2 +
 target/riscv/insn32.decode              |  2 +
 target/riscv/insn_trans/trans_rvp.c.inc | 51 +++++++++++++++++++++++++
 target/riscv/packed_helper.c            | 25 ++++++++++++
 4 files changed, 80 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 5aac6ba578..a37b023c53 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1316,3 +1316,5 @@ DEF_HELPER_4(kmadrs, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmaxds, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmsda, tl, env, tl, tl, tl)
 DEF_HELPER_4(kmsxda, tl, env, tl, tl, tl)
+
+DEF_HELPER_3(smal, i64, env, i64, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f590880750..233df941b4 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -919,3 +919,5 @@ kmadrs     0110110  ..... ..... 001 ..... 1110111 @r
 kmaxds     0111110  ..... ..... 001 ..... 1110111 @r
 kmsda      0100110  ..... ..... 001 ..... 1110111 @r
 kmsxda     0100111  ..... ..... 001 ..... 1110111 @r
+
+smal       0101111  ..... ..... 001 ..... 1110111 @r
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 308fc223db..8b0728fc5a 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -451,3 +451,54 @@ GEN_RVP_R_ACC_OOL(kmadrs);
 GEN_RVP_R_ACC_OOL(kmaxds);
 GEN_RVP_R_ACC_OOL(kmsda);
 GEN_RVP_R_ACC_OOL(kmsxda);
+
+/* Signed 16-bit Multiply with 64-bit Add/Subtract Instructions */
+static bool
+r_d64_s64_ool(DisasContext *ctx, arg_r *a,
+              void (* fn)(TCGv_i64, TCGv_ptr, TCGv_i64, TCGv))
+{
+    TCGv src2;
+    TCGv_i64 src1, dst;
+
+    if (!has_ext(ctx, RVP) || !ctx->ext_psfoperand) {
+        return false;
+    }
+
+    src1 = tcg_temp_new_i64();
+    src2 = tcg_temp_new();
+    dst = tcg_temp_new_i64();
+
+    if (is_32bit(ctx)) {
+        TCGv t0, t1;
+        t0 = tcg_temp_new();
+        t1 = tcg_temp_new();
+        gen_get_gpr(t0, a->rs1);
+        gen_get_gpr(t1, a->rs1 + 1);
+        tcg_gen_concat_tl_i64(src1, t0, t1);
+        tcg_temp_free(t0);
+        tcg_temp_free(t1);
+    } else {
+        TCGv t0;
+        t0 = tcg_temp_new();
+        gen_get_gpr(t0, a->rs1);
+        tcg_gen_ext_tl_i64(src1, t0);
+        tcg_temp_free(t0);
+    }
+
+    gen_get_gpr(src2, a->rs2);
+    fn(dst, cpu_env, src1, src2);
+    set_pair_regs(ctx, dst, a->rd);
+
+    tcg_temp_free_i64(src1);
+    tcg_temp_free_i64(dst);
+    tcg_temp_free(src2);
+    return true;
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
index 88509fd118..1f9a5d620f 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -1944,3 +1944,28 @@ static inline void do_kmsxda(CPURISCVState *env, void *vd, void *va,
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
+    for (i = 0; i < sizeof(target_ulong) / 2; i += 2) {
+        do_smal(env, &result, &a, &b, i);
+    }
+    return result;
+}
-- 
2.17.1


