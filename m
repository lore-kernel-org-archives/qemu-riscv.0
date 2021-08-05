Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBTdE-0001ne-L7
	for mharc-qemu-riscv@gnu.org; Wed, 04 Aug 2021 23:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTdA-0001ed-Pp; Wed, 04 Aug 2021 23:01:12 -0400
Received: from out28-2.mail.aliyun.com ([115.124.28.2]:50583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTd8-0001nk-K9; Wed, 04 Aug 2021 23:01:12 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0184785-0.00121228-0.980309;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KvYwGgT_1628132465; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KvYwGgT_1628132465)
 by smtp.aliyun-inc.com(10.147.42.241);
 Thu, 05 Aug 2021 11:01:05 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 12/13] target/riscv: Support UXL32 for RVB
Date: Thu,  5 Aug 2021 10:53:11 +0800
Message-Id: <20210805025312.15720-13-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.2; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-2.mail.aliyun.com
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
X-List-Received-Date: Thu, 05 Aug 2021 03:01:13 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 47 +++++++++++++++++++------
 target/riscv/translate.c                |  8 +++++
 2 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 0bae0a2bbf..5de24c3a24 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -20,19 +20,19 @@
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_clz);
+    return gen_unary(ctx, a, ctx->uxl32 ? gen_clzw : gen_clz);
 }
 
 static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_ctz);
+    return gen_unary(ctx, a, ctx->uxl32 ? gen_ctzw : gen_ctz);
 }
 
 static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, tcg_gen_ctpop_tl);
+    return gen_unary(ctx, a, ctx->uxl32 ? gen_cpopw : tcg_gen_ctpop_tl);
 }
 
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
@@ -56,43 +56,43 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
 static bool trans_pack(DisasContext *ctx, arg_pack *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_pack);
+    return gen_arith(ctx, a, ctx->uxl32 ? gen_packw : gen_pack);
 }
 
 static bool trans_packu(DisasContext *ctx, arg_packu *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packu);
+    return gen_arith(ctx, a, ctx->uxl32 ? gen_packuw : gen_packu);
 }
 
 static bool trans_packh(DisasContext *ctx, arg_packh *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packh);
+    return gen_arith(ctx, a, ctx->uxl32 ? gen_packhw : gen_packh);
 }
 
 static bool trans_min(DisasContext *ctx, arg_min *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_smin_tl);
+    return gen_arith_s(ctx, a, tcg_gen_smin_tl);
 }
 
 static bool trans_max(DisasContext *ctx, arg_max *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_smax_tl);
+    return gen_arith_s(ctx, a, tcg_gen_smax_tl);
 }
 
 static bool trans_minu(DisasContext *ctx, arg_minu *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_umin_tl);
+    return gen_arith_u(ctx, a, tcg_gen_umin_tl);
 }
 
 static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_umax_tl);
+    return gen_arith_u(ctx, a, tcg_gen_umax_tl);
 }
 
 static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
@@ -170,36 +170,54 @@ static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
 static bool trans_sro(DisasContext *ctx, arg_sro *a)
 {
     REQUIRE_EXT(ctx, RVB);
+    if (ctx->uxl32) {
+        return trans_srow(ctx, a);
+    }
     return gen_shift(ctx, a, gen_sro);
 }
 
 static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
 {
     REQUIRE_EXT(ctx, RVB);
+    if (ctx->uxl32) {
+        return trans_sroiw(ctx, a);
+    }
     return gen_shifti(ctx, a, gen_sro);
 }
 
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
     REQUIRE_EXT(ctx, RVB);
+    if (ctx->uxl32) {
+        return trans_rorw(ctx, a);
+    }
     return gen_shift(ctx, a, tcg_gen_rotr_tl);
 }
 
 static bool trans_rori(DisasContext *ctx, arg_rori *a)
 {
     REQUIRE_EXT(ctx, RVB);
+    if (ctx->uxl32) {
+        return trans_roriw(ctx, a);
+    }
     return gen_shifti(ctx, a, tcg_gen_rotr_tl);
 }
 
 static bool trans_rol(DisasContext *ctx, arg_rol *a)
 {
     REQUIRE_EXT(ctx, RVB);
+    if (ctx->uxl32) {
+        return trans_rolw(ctx, a);
+    }
     return gen_shift(ctx, a, tcg_gen_rotl_tl);
 }
 
 static bool trans_grev(DisasContext *ctx, arg_grev *a)
 {
     REQUIRE_EXT(ctx, RVB);
+    if (ctx->uxl32) {
+        return trans_grevw(ctx, a);
+    }
     return gen_shift(ctx, a, gen_helper_grev);
 }
 
@@ -207,6 +225,9 @@ static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
 {
     REQUIRE_EXT(ctx, RVB);
 
+    if (ctx->uxl32) {
+        return trans_grevi(ctx, a);
+    }
     if (a->shamt >= TARGET_LONG_BITS) {
         return false;
     }
@@ -217,12 +238,18 @@ static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
 static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
 {
     REQUIRE_EXT(ctx, RVB);
+    if (ctx->uxl32) {
+        return trans_gorcw(ctx, a);
+    }
     return gen_shift(ctx, a, gen_helper_gorc);
 }
 
 static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
 {
     REQUIRE_EXT(ctx, RVB);
+    if (ctx->uxl32) {
+        return trans_gorciw(ctx, a);
+    }
     return gen_shifti(ctx, a, gen_helper_gorc);
 }
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5ee0feac4b..f4b2f75812 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -742,6 +742,14 @@ static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(t);
 }
 
+static void gen_packhw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_ext8u_tl(t, arg2);
+    tcg_gen_deposit_tl(ret, arg1, t, 8, 24);
+    tcg_temp_free(t);
+}
+
 static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
 {
     TCGv_i32 t1 = tcg_temp_new_i32();
-- 
2.17.1


