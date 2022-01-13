Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7pGu-0003Eq-EW
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 20:51:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n7pGo-00039E-5f; Wed, 12 Jan 2022 20:51:18 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:48594 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n7pGj-0000iU-Qn; Wed, 12 Jan 2022 20:51:17 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowABXXwODhd9hljodBg--.33470S5;
 Thu, 13 Jan 2022 09:51:02 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v4 3/6] target/riscv: add support for zfinx
Date: Thu, 13 Jan 2022 09:49:56 +0800
Message-Id: <20220113014959.21429-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220113014959.21429-1-liweiwei@iscas.ac.cn>
References: <20220113014959.21429-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowABXXwODhd9hljodBg--.33470S5
X-Coremail-Antispam: 1UD129KBjvAXoWftFW5ur4kGw1xur4rZr4fKrg_yoW5ZF4fCo
 Wfuw4DCrZ5Kw17WasxKw48trW7Aa47uw1xJrZY9rZ7K3WxXr48tF45Xws5ZayYqF4Fg3y8
 XFnxA3W3JFy7A343n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUOb7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r1rM28IrcIa0x
 kI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
 jcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJw
 A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWx
 Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
 ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
 67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUojjg
 UUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Jan 2022 01:51:18 -0000

  - update extension check REQUIRE_ZFINX_OR_F
  - update single float point register read/write
  - disable nanbox_s check

Co-authored-by: ardxwe <ardxwe@gmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/fpu_helper.c               |  89 +++----
 target/riscv/helper.h                   |   2 +-
 target/riscv/insn_trans/trans_rvf.c.inc | 314 ++++++++++++++++--------
 target/riscv/internals.h                |  16 +-
 target/riscv/translate.c                |  90 +++++++
 5 files changed, 367 insertions(+), 144 deletions(-)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 4a5982d594..63ca703459 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -98,10 +98,11 @@ static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
 static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
                            uint64_t rs3, int flags)
 {
-    float32 frs1 = check_nanbox_s(rs1);
-    float32 frs2 = check_nanbox_s(rs2);
-    float32 frs3 = check_nanbox_s(rs3);
-    return nanbox_s(float32_muladd(frs1, frs2, frs3, flags, &env->fp_status));
+    float32 frs1 = check_nanbox_s(env, rs1);
+    float32 frs2 = check_nanbox_s(env, rs2);
+    float32 frs3 = check_nanbox_s(env, rs3);
+    return nanbox_s(env, float32_muladd(frs1, frs2, frs3, flags,
+                                        &env->fp_status));
 }
 
 uint64_t helper_fmadd_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
@@ -183,124 +184,124 @@ uint64_t helper_fnmadd_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
 
 uint64_t helper_fadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float32 frs1 = check_nanbox_s(rs1);
-    float32 frs2 = check_nanbox_s(rs2);
-    return nanbox_s(float32_add(frs1, frs2, &env->fp_status));
+    float32 frs1 = check_nanbox_s(env, rs1);
+    float32 frs2 = check_nanbox_s(env, rs2);
+    return nanbox_s(env, float32_add(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fsub_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float32 frs1 = check_nanbox_s(rs1);
-    float32 frs2 = check_nanbox_s(rs2);
-    return nanbox_s(float32_sub(frs1, frs2, &env->fp_status));
+    float32 frs1 = check_nanbox_s(env, rs1);
+    float32 frs2 = check_nanbox_s(env, rs2);
+    return nanbox_s(env, float32_sub(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fmul_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float32 frs1 = check_nanbox_s(rs1);
-    float32 frs2 = check_nanbox_s(rs2);
-    return nanbox_s(float32_mul(frs1, frs2, &env->fp_status));
+    float32 frs1 = check_nanbox_s(env, rs1);
+    float32 frs2 = check_nanbox_s(env, rs2);
+    return nanbox_s(env, float32_mul(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fdiv_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float32 frs1 = check_nanbox_s(rs1);
-    float32 frs2 = check_nanbox_s(rs2);
-    return nanbox_s(float32_div(frs1, frs2, &env->fp_status));
+    float32 frs1 = check_nanbox_s(env, rs1);
+    float32 frs2 = check_nanbox_s(env, rs2);
+    return nanbox_s(env, float32_div(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float32 frs1 = check_nanbox_s(rs1);
-    float32 frs2 = check_nanbox_s(rs2);
-    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
+    float32 frs1 = check_nanbox_s(env, rs1);
+    float32 frs2 = check_nanbox_s(env, rs2);
+    return nanbox_s(env, env->priv_ver < PRIV_VERSION_1_11_0 ?
                     float32_minnum(frs1, frs2, &env->fp_status) :
                     float32_minimum_number(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float32 frs1 = check_nanbox_s(rs1);
-    float32 frs2 = check_nanbox_s(rs2);
-    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
+    float32 frs1 = check_nanbox_s(env, rs1);
+    float32 frs2 = check_nanbox_s(env, rs2);
+    return nanbox_s(env, env->priv_ver < PRIV_VERSION_1_11_0 ?
                     float32_maxnum(frs1, frs2, &env->fp_status) :
                     float32_maximum_number(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 = check_nanbox_s(rs1);
-    return nanbox_s(float32_sqrt(frs1, &env->fp_status));
+    float32 frs1 = check_nanbox_s(env, rs1);
+    return nanbox_s(env, float32_sqrt(frs1, &env->fp_status));
 }
 
 target_ulong helper_fle_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float32 frs1 = check_nanbox_s(rs1);
-    float32 frs2 = check_nanbox_s(rs2);
+    float32 frs1 = check_nanbox_s(env, rs1);
+    float32 frs2 = check_nanbox_s(env, rs2);
     return float32_le(frs1, frs2, &env->fp_status);
 }
 
 target_ulong helper_flt_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float32 frs1 = check_nanbox_s(rs1);
-    float32 frs2 = check_nanbox_s(rs2);
+    float32 frs1 = check_nanbox_s(env, rs1);
+    float32 frs2 = check_nanbox_s(env, rs2);
     return float32_lt(frs1, frs2, &env->fp_status);
 }
 
 target_ulong helper_feq_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float32 frs1 = check_nanbox_s(rs1);
-    float32 frs2 = check_nanbox_s(rs2);
+    float32 frs1 = check_nanbox_s(env, rs1);
+    float32 frs2 = check_nanbox_s(env, rs2);
     return float32_eq_quiet(frs1, frs2, &env->fp_status);
 }
 
 target_ulong helper_fcvt_w_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs1 = check_nanbox_s(env, rs1);
     return float32_to_int32(frs1, &env->fp_status);
 }
 
 target_ulong helper_fcvt_wu_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs1 = check_nanbox_s(env, rs1);
     return (int32_t)float32_to_uint32(frs1, &env->fp_status);
 }
 
 target_ulong helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs1 = check_nanbox_s(env, rs1);
     return float32_to_int64(frs1, &env->fp_status);
 }
 
 target_ulong helper_fcvt_lu_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs1 = check_nanbox_s(env, rs1);
     return float32_to_uint64(frs1, &env->fp_status);
 }
 
 uint64_t helper_fcvt_s_w(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_s(int32_to_float32((int32_t)rs1, &env->fp_status));
+    return nanbox_s(env, int32_to_float32((int32_t)rs1, &env->fp_status));
 }
 
 uint64_t helper_fcvt_s_wu(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_s(uint32_to_float32((uint32_t)rs1, &env->fp_status));
+    return nanbox_s(env, uint32_to_float32((uint32_t)rs1, &env->fp_status));
 }
 
 uint64_t helper_fcvt_s_l(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_s(int64_to_float32(rs1, &env->fp_status));
+    return nanbox_s(env, int64_to_float32(rs1, &env->fp_status));
 }
 
 uint64_t helper_fcvt_s_lu(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_s(uint64_to_float32(rs1, &env->fp_status));
+    return nanbox_s(env, uint64_to_float32(rs1, &env->fp_status));
 }
 
-target_ulong helper_fclass_s(uint64_t rs1)
+target_ulong helper_fclass_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs1 = check_nanbox_s(env, rs1);
     return fclass_s(frs1);
 }
 
@@ -340,12 +341,12 @@ uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 
 uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
 {
-    return nanbox_s(float64_to_float32(rs1, &env->fp_status));
+    return nanbox_s(env, float64_to_float32(rs1, &env->fp_status));
 }
 
 uint64_t helper_fcvt_d_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs1 = check_nanbox_s(env, rs1);
     return float32_to_float64(frs1, &env->fp_status);
 }
 
@@ -539,14 +540,14 @@ uint64_t helper_fcvt_h_lu(CPURISCVState *env, target_ulong rs1)
 
 uint64_t helper_fcvt_h_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs1 = check_nanbox_s(env, rs1);
     return nanbox_h(float32_to_float16(frs1, true, &env->fp_status));
 }
 
 uint64_t helper_fcvt_s_h(CPURISCVState *env, uint64_t rs1)
 {
     float16 frs1 = check_nanbox_h(rs1);
-    return nanbox_s(float16_to_float32(frs1, true, &env->fp_status));
+    return nanbox_s(env, float16_to_float32(frs1, true, &env->fp_status));
 }
 
 uint64_t helper_fcvt_h_d(CPURISCVState *env, uint64_t rs1)
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6cf6d6ce98..33f928c76b 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -38,7 +38,7 @@ DEF_HELPER_FLAGS_2(fcvt_s_w, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_s_wu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_s_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_s_lu, TCG_CALL_NO_RWG, i64, env, tl)
-DEF_HELPER_FLAGS_1(fclass_s, TCG_CALL_NO_RWG_SE, tl, i64)
+DEF_HELPER_FLAGS_2(fclass_s, TCG_CALL_NO_RWG_SE, tl, env, i64)
 
 /* Floating Point - Double Precision */
 DEF_HELPER_FLAGS_3(fadd_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index b5459249c4..50c7faf38f 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -20,7 +20,14 @@
 
 #define REQUIRE_FPU do {\
     if (ctx->mstatus_fs == 0) \
-        return false;                       \
+        if (!ctx->ext_zfinx) \
+            return false; \
+} while (0)
+
+#define REQUIRE_ZFINX_OR_F(ctx) do {\
+    if (!ctx->ext_zfinx) { \
+        REQUIRE_EXT(ctx, RVF); \
+    } \
 } while (0)
 
 static bool trans_flw(DisasContext *ctx, arg_flw *a)
@@ -70,10 +77,16 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
 static bool trans_fmadd_s(DisasContext *ctx, arg_fmadd_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 = get_fpr_hs(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmadd_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fmadd_s(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -81,10 +94,16 @@ static bool trans_fmadd_s(DisasContext *ctx, arg_fmadd_s *a)
 static bool trans_fmsub_s(DisasContext *ctx, arg_fmsub_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 = get_fpr_hs(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmsub_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fmsub_s(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -92,10 +111,16 @@ static bool trans_fmsub_s(DisasContext *ctx, arg_fmsub_s *a)
 static bool trans_fnmsub_s(DisasContext *ctx, arg_fnmsub_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 = get_fpr_hs(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fnmsub_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fnmsub_s(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -103,10 +128,16 @@ static bool trans_fnmsub_s(DisasContext *ctx, arg_fnmsub_s *a)
 static bool trans_fnmadd_s(DisasContext *ctx, arg_fnmadd_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 = get_fpr_hs(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fnmadd_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fnmadd_s(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -114,11 +145,15 @@ static bool trans_fnmadd_s(DisasContext *ctx, arg_fnmadd_s *a)
 static bool trans_fadd_s(DisasContext *ctx, arg_fadd_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fadd_s(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fadd_s(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -126,11 +161,15 @@ static bool trans_fadd_s(DisasContext *ctx, arg_fadd_s *a)
 static bool trans_fsub_s(DisasContext *ctx, arg_fsub_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fsub_s(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fsub_s(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -138,11 +177,15 @@ static bool trans_fsub_s(DisasContext *ctx, arg_fsub_s *a)
 static bool trans_fmul_s(DisasContext *ctx, arg_fmul_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmul_s(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fmul_s(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -150,11 +193,15 @@ static bool trans_fmul_s(DisasContext *ctx, arg_fmul_s *a)
 static bool trans_fdiv_s(DisasContext *ctx, arg_fdiv_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fdiv_s(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fdiv_s(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -162,10 +209,14 @@ static bool trans_fdiv_s(DisasContext *ctx, arg_fdiv_s *a)
 static bool trans_fsqrt_s(DisasContext *ctx, arg_fsqrt_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fsqrt_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fsqrt_s(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -173,22 +224,37 @@ static bool trans_fsqrt_s(DisasContext *ctx, arg_fsqrt_s *a)
 static bool trans_fsgnj_s(DisasContext *ctx, arg_fsgnj_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     if (a->rs1 == a->rs2) { /* FMOV */
-        gen_check_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
+        if (!ctx->ext_zfinx) {
+            gen_check_nanbox_s(dest, src1);
+        } else {
+            tcg_gen_ext32s_i64(dest, src1);
+        }
     } else { /* FSGNJ */
-        TCGv_i64 rs1 = tcg_temp_new_i64();
-        TCGv_i64 rs2 = tcg_temp_new_i64();
-
-        gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
-        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
-
-        /* This formulation retains the nanboxing of rs2. */
-        tcg_gen_deposit_i64(cpu_fpr[a->rd], rs2, rs1, 0, 31);
-        tcg_temp_free_i64(rs1);
-        tcg_temp_free_i64(rs2);
+        TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+
+        if (!ctx->ext_zfinx) {
+            TCGv_i64 rs1 = tcg_temp_new_i64();
+            TCGv_i64 rs2 = tcg_temp_new_i64();
+            gen_check_nanbox_s(rs1, src1);
+            gen_check_nanbox_s(rs2, src2);
+
+            /* This formulation retains the nanboxing of rs2 in normal 'F'. */
+            tcg_gen_deposit_i64(dest, rs2, rs1, 0, 31);
+
+            tcg_temp_free_i64(rs1);
+            tcg_temp_free_i64(rs2);
+        } else {
+            tcg_gen_deposit_i64(dest, src2, src1, 0, 31);
+            tcg_gen_ext32s_i64(dest, dest);
+        }
     }
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -198,16 +264,27 @@ static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnjn_s *a)
     TCGv_i64 rs1, rs2, mask;
 
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
-    rs1 = tcg_temp_new_i64();
-    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
+    rs1 = tcg_temp_new_i64();
+    if (!ctx->ext_zfinx) {
+        gen_check_nanbox_s(rs1, src1);
+    } else {
+        tcg_gen_mov_i64(rs1, src1);
+    }
     if (a->rs1 == a->rs2) { /* FNEG */
-        tcg_gen_xori_i64(cpu_fpr[a->rd], rs1, MAKE_64BIT_MASK(31, 1));
+        tcg_gen_xori_i64(dest, rs1, MAKE_64BIT_MASK(31, 1));
     } else {
+        TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
         rs2 = tcg_temp_new_i64();
-        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
+        if (!ctx->ext_zfinx) {
+            gen_check_nanbox_s(rs2, src2);
+        } else {
+            tcg_gen_mov_i64(rs2, src2);
+        }
 
         /*
          * Replace bit 31 in rs1 with inverse in rs2.
@@ -215,13 +292,17 @@ static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnjn_s *a)
          */
         mask = tcg_constant_i64(~MAKE_64BIT_MASK(31, 1));
         tcg_gen_nor_i64(rs2, rs2, mask);
-        tcg_gen_and_i64(rs1, mask, rs1);
-        tcg_gen_or_i64(cpu_fpr[a->rd], rs1, rs2);
+        tcg_gen_and_i64(dest, mask, rs1);
+        tcg_gen_or_i64(dest, dest, rs2);
 
         tcg_temp_free_i64(rs2);
     }
+    /* signed-extended intead of nanboxing for result if enable zfinx */
+    if (ctx->ext_zfinx) {
+        tcg_gen_ext32s_i64(dest, dest);
+    }
+    gen_set_fpr_hs(ctx, a->rd, dest);
     tcg_temp_free_i64(rs1);
-
     mark_fs_dirty(ctx);
     return true;
 }
@@ -231,28 +312,45 @@ static bool trans_fsgnjx_s(DisasContext *ctx, arg_fsgnjx_s *a)
     TCGv_i64 rs1, rs2;
 
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
     rs1 = tcg_temp_new_i64();
-    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
+
+    if (!ctx->ext_zfinx) {
+        gen_check_nanbox_s(rs1, src1);
+    } else {
+        tcg_gen_mov_i64(rs1, src1);
+    }
 
     if (a->rs1 == a->rs2) { /* FABS */
-        tcg_gen_andi_i64(cpu_fpr[a->rd], rs1, ~MAKE_64BIT_MASK(31, 1));
+        tcg_gen_andi_i64(dest, rs1, ~MAKE_64BIT_MASK(31, 1));
     } else {
+        TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
         rs2 = tcg_temp_new_i64();
-        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
+
+        if (!ctx->ext_zfinx) {
+            gen_check_nanbox_s(rs2, src2);
+        } else {
+            tcg_gen_mov_i64(rs2, src2);
+        }
 
         /*
          * Xor bit 31 in rs1 with that in rs2.
          * This formulation retains the nanboxing of rs1.
          */
-        tcg_gen_andi_i64(rs2, rs2, MAKE_64BIT_MASK(31, 1));
-        tcg_gen_xor_i64(cpu_fpr[a->rd], rs1, rs2);
+        tcg_gen_andi_i64(dest, rs2, MAKE_64BIT_MASK(31, 1));
+        tcg_gen_xor_i64(dest, rs1, dest);
 
         tcg_temp_free_i64(rs2);
     }
+    /* signed-extended intead of nanboxing for result if enable zfinx */
+    if (ctx->ext_zfinx) {
+        tcg_gen_ext32s_i64(dest, dest);
+    }
     tcg_temp_free_i64(rs1);
-
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -260,10 +358,14 @@ static bool trans_fsgnjx_s(DisasContext *ctx, arg_fsgnjx_s *a)
 static bool trans_fmin_s(DisasContext *ctx, arg_fmin_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
-    gen_helper_fmin_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                      cpu_fpr[a->rs2]);
+    gen_helper_fmin_s(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -271,10 +373,14 @@ static bool trans_fmin_s(DisasContext *ctx, arg_fmin_s *a)
 static bool trans_fmax_s(DisasContext *ctx, arg_fmax_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
-    gen_helper_fmax_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                      cpu_fpr[a->rs2]);
+    gen_helper_fmax_s(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -282,12 +388,13 @@ static bool trans_fmax_s(DisasContext *ctx, arg_fmax_s *a)
 static bool trans_fcvt_w_s(DisasContext *ctx, arg_fcvt_w_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_w_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_w_s(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -295,12 +402,13 @@ static bool trans_fcvt_w_s(DisasContext *ctx, arg_fcvt_w_s *a)
 static bool trans_fcvt_wu_s(DisasContext *ctx, arg_fcvt_wu_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_wu_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_wu_s(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -309,14 +417,14 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
 {
     /* NOTE: This was FMV.X.S in an earlier version of the ISA spec! */
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
-
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 #if defined(TARGET_RISCV64)
-    tcg_gen_ext32s_tl(dest, cpu_fpr[a->rs1]);
+    tcg_gen_ext32s_tl(dest, src1);
 #else
-    tcg_gen_extrl_i64_i32(dest, cpu_fpr[a->rs1]);
+    tcg_gen_extrl_i64_i32(dest, src1);
 #endif
 
     gen_set_gpr(ctx, a->rd, dest);
@@ -326,11 +434,13 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
 static bool trans_feq_s(DisasContext *ctx, arg_feq_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
-    gen_helper_feq_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_feq_s(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -338,11 +448,13 @@ static bool trans_feq_s(DisasContext *ctx, arg_feq_s *a)
 static bool trans_flt_s(DisasContext *ctx, arg_flt_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
-    gen_helper_flt_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_flt_s(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -350,11 +462,13 @@ static bool trans_flt_s(DisasContext *ctx, arg_flt_s *a)
 static bool trans_fle_s(DisasContext *ctx, arg_fle_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
-    gen_helper_fle_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fle_s(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -362,11 +476,12 @@ static bool trans_fle_s(DisasContext *ctx, arg_fle_s *a)
 static bool trans_fclass_s(DisasContext *ctx, arg_fclass_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
-    gen_helper_fclass_s(dest, cpu_fpr[a->rs1]);
+    gen_helper_fclass_s(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -374,13 +489,14 @@ static bool trans_fclass_s(DisasContext *ctx, arg_fclass_s *a)
 static bool trans_fcvt_s_w(DisasContext *ctx, arg_fcvt_s_w *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_w(cpu_fpr[a->rd], cpu_env, src);
-
+    gen_helper_fcvt_s_w(dest, cpu_env, src);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -388,13 +504,14 @@ static bool trans_fcvt_s_w(DisasContext *ctx, arg_fcvt_s_w *a)
 static bool trans_fcvt_s_wu(DisasContext *ctx, arg_fcvt_s_wu *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_wu(cpu_fpr[a->rd], cpu_env, src);
-
+    gen_helper_fcvt_s_wu(dest, cpu_env, src);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -403,13 +520,14 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
 {
     /* NOTE: This was FMV.S.X in an earlier version of the ISA spec! */
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
-    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], src);
-    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
-
+    tcg_gen_extu_tl_i64(dest, src);
+    gen_nanbox_s(dest, dest);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -418,12 +536,13 @@ static bool trans_fcvt_l_s(DisasContext *ctx, arg_fcvt_l_s *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_l_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_l_s(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -432,12 +551,13 @@ static bool trans_fcvt_lu_s(DisasContext *ctx, arg_fcvt_lu_s *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_lu_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_lu_s(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -446,13 +566,14 @@ static bool trans_fcvt_s_l(DisasContext *ctx, arg_fcvt_s_l *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, src);
-
+    gen_helper_fcvt_s_l(dest, cpu_env, src);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -461,13 +582,14 @@ static bool trans_fcvt_s_lu(DisasContext *ctx, arg_fcvt_s_lu *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, src);
-
+    gen_helper_fcvt_s_lu(dest, cpu_env, src);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 065e8162a2..6237bb3115 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -46,13 +46,23 @@ enum {
     RISCV_FRM_ROD = 8,  /* Round to Odd */
 };
 
-static inline uint64_t nanbox_s(float32 f)
+static inline uint64_t nanbox_s(CPURISCVState *env, float32 f)
 {
-    return f | MAKE_64BIT_MASK(32, 32);
+    /* the value is sign-extended instead of NaN-boxing for zfinx */
+    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+        return (int32_t)f;
+    } else {
+        return f | MAKE_64BIT_MASK(32, 32);
+    }
 }
 
-static inline float32 check_nanbox_s(uint64_t f)
+static inline float32 check_nanbox_s(CPURISCVState *env, uint64_t f)
 {
+    /* Disable NaN-boxing check when enable zfinx */
+    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+        return (uint32_t)f;
+    }
+
     uint64_t mask = MAKE_64BIT_MASK(32, 32);
 
     if (likely((f & mask) == mask)) {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8f01063618..e3a30c4748 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -105,10 +105,13 @@ typedef struct DisasContext {
     target_ulong vstart;
     bool vl_eq_vlmax;
     uint8_t ntemp;
+    uint8_t nftemp;
     CPUState *cs;
     TCGv zero;
     /* Space for 3 operands plus 1 extra for address computation. */
     TCGv temp[4];
+    /* Space for 4 float point operands */
+    TCGv_i64 ftemp[4];
     /* PointerMasking extension */
     bool pm_enabled;
     TCGv pm_mask;
@@ -359,6 +362,86 @@ static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv rh)
     }
 }
 
+static TCGv_i64 ftemp_new(DisasContext *ctx)
+{
+    assert(ctx->nftemp < ARRAY_SIZE(ctx->ftemp));
+    return ctx->ftemp[ctx->nftemp++] = tcg_temp_new_i64();
+}
+
+static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
+{
+    if (!ctx->ext_zfinx) {
+        return cpu_fpr[reg_num];
+    }
+
+    if (reg_num == 0) {
+        return tcg_constant_i64(0);
+    }
+    switch (get_xl(ctx)) {
+    case MXL_RV32:
+#ifdef TARGET_RISCV32
+    {
+        TCGv_i64 t = ftemp_new(ctx);
+        tcg_gen_ext_i32_i64(t, cpu_gpr[reg_num]);
+        return t;
+    }
+#else
+    /* fall through */
+    case MXL_RV64:
+        return cpu_gpr[reg_num];
+#endif
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static TCGv_i64 dest_fpr(DisasContext *ctx, int reg_num)
+{
+    if (!ctx->ext_zfinx) {
+        return cpu_fpr[reg_num];
+    }
+
+    switch (get_xl(ctx)) {
+    case MXL_RV32:
+        return ftemp_new(ctx);
+#ifdef TARGET_RISCV64
+    case MXL_RV64:
+        if (reg_num == 0) {
+            return ftemp_new(ctx);
+        } else {
+            return cpu_gpr[reg_num];
+        }
+#endif
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/* assume t is nanboxing (for normal) or sign-extended (for zfinx) */
+static void gen_set_fpr_hs(DisasContext *ctx, int reg_num, TCGv_i64 t)
+{
+    if (!ctx->ext_zfinx) {
+        tcg_gen_mov_i64(cpu_fpr[reg_num], t);
+        return;
+    }
+    if (reg_num != 0) {
+        switch (get_xl(ctx)) {
+        case MXL_RV32:
+#ifdef TARGET_RISCV32
+            tcg_gen_extrl_i64_i32(cpu_gpr[reg_num], t);
+            break;
+#else
+        /* fall through */
+        case MXL_RV64:
+            tcg_gen_mov_i64(cpu_gpr[reg_num], t);
+            break;
+#endif
+        default:
+            g_assert_not_reached();
+        }
+    }
+}
+
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     target_ulong next_pc;
@@ -921,6 +1004,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->cs = cs;
     ctx->ntemp = 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
+    ctx->nftemp = 0;
+    memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
     ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
     int priv = tb_flags & TB_FLAGS_PRIV_MMU_MASK;
     ctx->pm_mask = pm_mask[priv];
@@ -955,6 +1040,11 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         ctx->temp[i] = NULL;
     }
     ctx->ntemp = 0;
+    for (int i = ctx->nftemp - 1; i >= 0; --i) {
+        tcg_temp_free_i64(ctx->ftemp[i]);
+        ctx->ftemp[i] = NULL;
+    }
+    ctx->nftemp = 0;
 
     if (ctx->base.is_jmp == DISAS_NEXT) {
         target_ulong page_start;
-- 
2.17.1


