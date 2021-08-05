Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBTak-0003KA-7X
	for mharc-qemu-riscv@gnu.org; Wed, 04 Aug 2021 22:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTai-0003Et-M1; Wed, 04 Aug 2021 22:58:40 -0400
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:51061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTaf-000876-Hu; Wed, 04 Aug 2021 22:58:40 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0848442-0.00200604-0.91315;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047188; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KvYGVtQ_1628132313; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KvYGVtQ_1628132313)
 by smtp.aliyun-inc.com(10.147.42.135);
 Thu, 05 Aug 2021 10:58:33 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 07/13] target/riscv: Support UXL32 for RVM
Date: Thu,  5 Aug 2021 10:53:06 +0800
Message-Id: <20210805025312.15720-8-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.221; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-221.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 05 Aug 2021 02:58:41 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rvm.c.inc | 24 ++++++++---
 target/riscv/translate.c                | 56 +++++++++++++++++++------
 2 files changed, 62 insertions(+), 18 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 34220b824d..121d592351 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -28,43 +28,55 @@ static bool trans_mul(DisasContext *ctx, arg_mul *a)
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, gen_mulh);
+    return gen_arith_s(ctx, a, gen_mulh);
 }
 
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_mulhsu);
+    return gen_arith_su(ctx, a, &gen_mulhsu);
 }
 
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, gen_mulhu);
+    return gen_arith_u(ctx, a, gen_mulhu);
 }
 
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_div);
+    if (ctx->uxl32) {
+        return trans_divw(ctx, a);
+    }
+    return gen_arith_div(ctx, a, &gen_div);
 }
 
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
     REQUIRE_EXT(ctx, RVM);
+    if (ctx->uxl32) {
+        return trans_divuw(ctx, a);
+    }
     return gen_arith(ctx, a, &gen_divu);
 }
 
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_rem);
+    if (ctx->uxl32) {
+        return trans_remw(ctx, a);
+    }
+    return gen_arith_div(ctx, a, &gen_rem);
 }
 
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_remu);
+    if (ctx->uxl32) {
+        return trans_remuw(ctx, a);
+    }
+    return gen_arith_u(ctx, a, &gen_remu);
 }
 
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 2892eaa9a7..160a2df629 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -254,16 +254,14 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
     TCGv rh = tcg_temp_new();
 
     tcg_gen_mulu2_tl(rl, rh, arg1, arg2);
-    /* fix up for one negative */
-    tcg_gen_sari_tl(rl, arg1, TARGET_LONG_BITS - 1);
-    tcg_gen_and_tl(rl, rl, arg2);
-    tcg_gen_sub_tl(ret, rh, rl);
+    tcg_gen_sub_tl(rl, rh, arg2);
+    tcg_gen_movcond_tl(TCG_COND_LT, ret, arg1, tcg_constant_tl(0), rl, rh);
 
     tcg_temp_free(rl);
     tcg_temp_free(rh);
 }
 
-static void gen_div(TCGv ret, TCGv source1, TCGv source2)
+static void gen_div(DisasContext *ctx, TCGv ret, TCGv source1, TCGv source2)
 {
     TCGv cond1, cond2, zeroreg, resultopt1, t1, t2;
     /*
@@ -280,8 +278,14 @@ static void gen_div(TCGv ret, TCGv source1, TCGv source2)
 
     tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
     tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)(~0L));
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
-                        ((target_ulong)1) << (TARGET_LONG_BITS - 1));
+
+    if (ctx->uxl32) {
+        tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1, INT32_MIN);
+    } else {
+        tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
+                            ((target_ulong)1) << (TARGET_LONG_BITS - 1));
+    }
+
     tcg_gen_and_tl(cond1, cond1, cond2); /* cond1 = overflow */
     tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, 0); /* cond2 = div 0 */
     /* if div by zero, set source1 to -1, otherwise don't change */
@@ -322,7 +326,7 @@ static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
     tcg_temp_free(t2);
 }
 
-static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
+static void gen_rem(DisasContext *ctx, TCGv ret, TCGv source1, TCGv source2)
 {
     TCGv cond1, cond2, zeroreg, resultopt1, t2;
 
@@ -334,8 +338,14 @@ static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
 
     tcg_gen_movi_tl(resultopt1, 1L);
     tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)-1);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
-                        (target_ulong)1 << (TARGET_LONG_BITS - 1));
+
+    if (ctx->uxl32) {
+        tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1, INT32_MIN);
+    } else {
+        tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
+                            ((target_long)1) << (TARGET_LONG_BITS - 1));
+    }
+
     tcg_gen_and_tl(cond2, cond1, cond2); /* cond1 = overflow */
     tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0); /* cond2 = div 0 */
     /* if overflow or div by zero, set source2 to 1, else don't change */
@@ -541,7 +551,7 @@ static void gen_mulw(TCGv ret, TCGv arg1, TCGv arg2)
 }
 
 static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
-                            void(*func)(TCGv, TCGv, TCGv))
+                            void(*func)(DisasContext *, TCGv, TCGv, TCGv))
 {
     TCGv dest = gpr_dst(ctx, a->rd);
     TCGv src1 = gpr_src(ctx, a->rs1);
@@ -552,7 +562,7 @@ static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
     tcg_gen_ext32s_tl(ext1, src1);
     tcg_gen_ext32s_tl(ext2, src2);
 
-    (*func)(dest, ext1, ext2);
+    (*func)(ctx, dest, ext1, ext2);
     tcg_temp_free(ext1);
     tcg_temp_free(ext2);
 
@@ -829,6 +839,28 @@ static bool gen_arith_s(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static bool gen_arith_su(DisasContext *ctx, arg_r *a,
+                         void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src_u(ctx, a->rs1);
+    TCGv src2 = gpr_src_u(ctx, a->rs2);
+
+    (*func)(dest, src1, src2);
+    return true;
+}
+
+static bool gen_arith_div(DisasContext *ctx, arg_r *a,
+                          void(*func)(DisasContext *, TCGv, TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src_s(ctx, a->rs1);
+    TCGv src2 = gpr_src_s(ctx, a->rs2);
+
+    (*func)(ctx, dest, src1, src2);
+    return true;
+}
+
 static bool gen_shift(DisasContext *ctx, arg_r *a,
                         void(*func)(TCGv, TCGv, TCGv))
 {
-- 
2.17.1


