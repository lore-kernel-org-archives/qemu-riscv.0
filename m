Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5nQ3-000581-F0
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jan 2022 06:28:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n5nQ0-0004yk-F7; Fri, 07 Jan 2022 06:28:24 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:54266 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n5nPu-0006VG-1h; Fri, 07 Jan 2022 06:28:24 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAB3fS3CI9hh_s5CBQ--.4982S7;
 Fri, 07 Jan 2022 19:28:07 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 5/6] target/riscv: add support for zhinx/zhinxmin
Date: Fri,  7 Jan 2022 19:27:48 +0800
Message-Id: <20220107112749.981-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220107112749.981-1-liweiwei@iscas.ac.cn>
References: <20220107112749.981-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowAB3fS3CI9hh_s5CBQ--.4982S7
X-Coremail-Antispam: 1UD129KBjvAXoWfZw45Xr4rXr4DZFykJF43Jrb_yoW5Aw1kto
 W3urs8CrZ5Gw47Wasxtw4vqrW7Aa4xuw1xJrZ09rWkK3WfGr48tFWYqwn5ZayYgF4Fgry8
 XFsxA3ZxJry7C343n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUOb7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r126s0DM28Irc
 Ia0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l
 84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r
 4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
 WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUF18B
 UUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 07 Jan 2022 11:28:24 -0000

  - update extension check REQUIRE_ZHINX_OR_ZFH and REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN
  - update half float point register read/write
  - disable nanbox_h check

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/fpu_helper.c                 |  89 +++---
 target/riscv/helper.h                     |   2 +-
 target/riscv/insn_trans/trans_rvzfh.c.inc | 332 +++++++++++++++-------
 target/riscv/internals.h                  |  16 +-
 4 files changed, 296 insertions(+), 143 deletions(-)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 63ca703459..5699c9517f 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -89,10 +89,11 @@ void helper_set_rod_rounding_mode(CPURISCVState *env)
 static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
                            uint64_t rs3, int flags)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
-    float16 frs3 = check_nanbox_h(rs3);
-    return nanbox_h(float16_muladd(frs1, frs2, frs3, flags, &env->fp_status));
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
+    float16 frs3 = check_nanbox_h(env, rs3);
+    return nanbox_h(env, float16_muladd(frs1, frs2, frs3, flags,
+                                        &env->fp_status));
 }
 
 static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
@@ -417,146 +418,146 @@ target_ulong helper_fclass_d(uint64_t frs1)
 
 uint64_t helper_fadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
-    return nanbox_h(float16_add(frs1, frs2, &env->fp_status));
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
+    return nanbox_h(env, float16_add(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fsub_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
-    return nanbox_h(float16_sub(frs1, frs2, &env->fp_status));
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
+    return nanbox_h(env, float16_sub(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fmul_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
-    return nanbox_h(float16_mul(frs1, frs2, &env->fp_status));
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
+    return nanbox_h(env, float16_mul(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fdiv_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
-    return nanbox_h(float16_div(frs1, frs2, &env->fp_status));
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
+    return nanbox_h(env, float16_div(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fmin_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
-    return nanbox_h(env->priv_ver < PRIV_VERSION_1_11_0 ?
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
+    return nanbox_h(env, env->priv_ver < PRIV_VERSION_1_11_0 ?
                     float16_minnum(frs1, frs2, &env->fp_status) :
                     float16_minimum_number(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
-    return nanbox_h(env->priv_ver < PRIV_VERSION_1_11_0 ?
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
+    return nanbox_h(env, env->priv_ver < PRIV_VERSION_1_11_0 ?
                     float16_maxnum(frs1, frs2, &env->fp_status) :
                     float16_maximum_number(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    return nanbox_h(float16_sqrt(frs1, &env->fp_status));
+    float16 frs1 = check_nanbox_h(env, rs1);
+    return nanbox_h(env, float16_sqrt(frs1, &env->fp_status));
 }
 
 target_ulong helper_fle_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
     return float16_le(frs1, frs2, &env->fp_status);
 }
 
 target_ulong helper_flt_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
     return float16_lt(frs1, frs2, &env->fp_status);
 }
 
 target_ulong helper_feq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
     return float16_eq_quiet(frs1, frs2, &env->fp_status);
 }
 
-target_ulong helper_fclass_h(uint64_t rs1)
+target_ulong helper_fclass_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs1 = check_nanbox_h(env, rs1);
     return fclass_h(frs1);
 }
 
 target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs1 = check_nanbox_h(env, rs1);
     return float16_to_int32(frs1, &env->fp_status);
 }
 
 target_ulong helper_fcvt_wu_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs1 = check_nanbox_h(env, rs1);
     return (int32_t)float16_to_uint32(frs1, &env->fp_status);
 }
 
 target_ulong helper_fcvt_l_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs1 = check_nanbox_h(env, rs1);
     return float16_to_int64(frs1, &env->fp_status);
 }
 
 target_ulong helper_fcvt_lu_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs1 = check_nanbox_h(env, rs1);
     return float16_to_uint64(frs1, &env->fp_status);
 }
 
 uint64_t helper_fcvt_h_w(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_h(int32_to_float16((int32_t)rs1, &env->fp_status));
+    return nanbox_h(env, int32_to_float16((int32_t)rs1, &env->fp_status));
 }
 
 uint64_t helper_fcvt_h_wu(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_h(uint32_to_float16((uint32_t)rs1, &env->fp_status));
+    return nanbox_h(env, uint32_to_float16((uint32_t)rs1, &env->fp_status));
 }
 
 uint64_t helper_fcvt_h_l(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_h(int64_to_float16(rs1, &env->fp_status));
+    return nanbox_h(env, int64_to_float16(rs1, &env->fp_status));
 }
 
 uint64_t helper_fcvt_h_lu(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_h(uint64_to_float16(rs1, &env->fp_status));
+    return nanbox_h(env, uint64_to_float16(rs1, &env->fp_status));
 }
 
 uint64_t helper_fcvt_h_s(CPURISCVState *env, uint64_t rs1)
 {
     float32 frs1 = check_nanbox_s(env, rs1);
-    return nanbox_h(float32_to_float16(frs1, true, &env->fp_status));
+    return nanbox_h(env, float32_to_float16(frs1, true, &env->fp_status));
 }
 
 uint64_t helper_fcvt_s_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs1 = check_nanbox_h(env, rs1);
     return nanbox_s(env, float16_to_float32(frs1, true, &env->fp_status));
 }
 
 uint64_t helper_fcvt_h_d(CPURISCVState *env, uint64_t rs1)
 {
-    return nanbox_h(float64_to_float16(rs1, true, &env->fp_status));
+    return nanbox_h(env, float64_to_float16(rs1, true, &env->fp_status));
 }
 
 uint64_t helper_fcvt_d_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs1 = check_nanbox_h(env, rs1);
     return float16_to_float64(frs1, true, &env->fp_status);
 }
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 816acca993..9765238ab9 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -90,7 +90,7 @@ DEF_HELPER_FLAGS_2(fcvt_h_w, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_wu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
-DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
+DEF_HELPER_FLAGS_2(fclass_h, TCG_CALL_NO_RWG_SE, tl, env, i64)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 5a7cac8958..dd7484bc90 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -22,12 +22,25 @@
     }                         \
 } while (0)
 
+#define REQUIRE_ZHINX_OR_ZFH(ctx) do {      \
+    if (!ctx->ext_zhinx && !ctx->ext_zfh) { \
+        return false;                       \
+    }                                       \
+} while (0)
+
 #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
     if (!(ctx->ext_zfh || ctx->ext_zfhmin)) { \
         return false;                         \
     }                                         \
 } while (0)
 
+#define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
+    if (!(ctx->ext_zfh || ctx->ext_zfhmin ||                \
+          ctx->ext_zhinx || ctx->ext_zhinxmin)) {            \
+        return false;                                        \
+    }                                                        \
+} while (0)
+
 static bool trans_flh(DisasContext *ctx, arg_flh *a)
 {
     TCGv_i64 dest;
@@ -73,11 +86,16 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
 static bool trans_fmadd_h(DisasContext *ctx, arg_fmadd_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 = get_fpr_hs(ctx, a->rs3);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmadd_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fmadd_h(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -85,11 +103,16 @@ static bool trans_fmadd_h(DisasContext *ctx, arg_fmadd_h *a)
 static bool trans_fmsub_h(DisasContext *ctx, arg_fmsub_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 = get_fpr_hs(ctx, a->rs3);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmsub_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fmsub_h(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -97,11 +120,16 @@ static bool trans_fmsub_h(DisasContext *ctx, arg_fmsub_h *a)
 static bool trans_fnmsub_h(DisasContext *ctx, arg_fnmsub_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 = get_fpr_hs(ctx, a->rs3);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fnmsub_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fnmsub_h(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -109,11 +137,16 @@ static bool trans_fnmsub_h(DisasContext *ctx, arg_fnmsub_h *a)
 static bool trans_fnmadd_h(DisasContext *ctx, arg_fnmadd_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 = get_fpr_hs(ctx, a->rs3);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fnmadd_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fnmadd_h(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -121,11 +154,15 @@ static bool trans_fnmadd_h(DisasContext *ctx, arg_fnmadd_h *a)
 static bool trans_fadd_h(DisasContext *ctx, arg_fadd_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fadd_h(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fadd_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -133,11 +170,15 @@ static bool trans_fadd_h(DisasContext *ctx, arg_fadd_h *a)
 static bool trans_fsub_h(DisasContext *ctx, arg_fsub_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fsub_h(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fsub_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -145,11 +186,15 @@ static bool trans_fsub_h(DisasContext *ctx, arg_fsub_h *a)
 static bool trans_fmul_h(DisasContext *ctx, arg_fmul_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmul_h(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fmul_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -157,11 +202,15 @@ static bool trans_fmul_h(DisasContext *ctx, arg_fmul_h *a)
 static bool trans_fdiv_h(DisasContext *ctx, arg_fdiv_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fdiv_h(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fdiv_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -169,10 +218,14 @@ static bool trans_fdiv_h(DisasContext *ctx, arg_fdiv_h *a)
 static bool trans_fsqrt_h(DisasContext *ctx, arg_fsqrt_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fsqrt_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fsqrt_h(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -180,23 +233,37 @@ static bool trans_fsqrt_h(DisasContext *ctx, arg_fsqrt_h *a)
 static bool trans_fsgnj_h(DisasContext *ctx, arg_fsgnj_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     if (a->rs1 == a->rs2) { /* FMOV */
-        gen_check_nanbox_h(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
+        if (!ctx->ext_zfinx) {
+            gen_check_nanbox_h(dest, src1);
+        } else {
+            tcg_gen_ext16s_i64(dest, src1);
+        }
     } else {
-        TCGv_i64 rs1 = tcg_temp_new_i64();
-        TCGv_i64 rs2 = tcg_temp_new_i64();
-
-        gen_check_nanbox_h(rs1, cpu_fpr[a->rs1]);
-        gen_check_nanbox_h(rs2, cpu_fpr[a->rs2]);
-
-        /* This formulation retains the nanboxing of rs2. */
-        tcg_gen_deposit_i64(cpu_fpr[a->rd], rs2, rs1, 0, 15);
-        tcg_temp_free_i64(rs1);
-        tcg_temp_free_i64(rs2);
+        TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+
+        if (!ctx->ext_zfinx) {
+            TCGv_i64 rs1 = tcg_temp_new_i64();
+            TCGv_i64 rs2 = tcg_temp_new_i64();
+            gen_check_nanbox_h(rs1, src1);
+            gen_check_nanbox_h(rs2, src2);
+
+            /* This formulation retains the nanboxing of rs2 in normal 'Zfh'. */
+            tcg_gen_deposit_i64(dest, rs2, rs1, 0, 15);
+
+            tcg_temp_free_i64(rs1);
+            tcg_temp_free_i64(rs2);
+        } else {
+            tcg_gen_deposit_i64(dest, src2, src1, 0, 15);
+            tcg_gen_ext16s_i64(dest, dest);
+        }
     }
-
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -206,16 +273,29 @@ static bool trans_fsgnjn_h(DisasContext *ctx, arg_fsgnjn_h *a)
     TCGv_i64 rs1, rs2, mask;
 
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     rs1 = tcg_temp_new_i64();
-    gen_check_nanbox_h(rs1, cpu_fpr[a->rs1]);
+    if (!ctx->ext_zfinx) {
+        gen_check_nanbox_h(rs1, src1);
+    } else {
+        tcg_gen_mov_i64(rs1, src1);
+    }
 
     if (a->rs1 == a->rs2) { /* FNEG */
-        tcg_gen_xori_i64(cpu_fpr[a->rd], rs1, MAKE_64BIT_MASK(15, 1));
+        tcg_gen_xori_i64(dest, rs1, MAKE_64BIT_MASK(15, 1));
     } else {
+        TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
         rs2 = tcg_temp_new_i64();
-        gen_check_nanbox_h(rs2, cpu_fpr[a->rs2]);
+
+        if (!ctx->ext_zfinx) {
+            gen_check_nanbox_h(rs2, src2);
+        } else {
+            tcg_gen_mov_i64(rs2, src2);
+        }
 
         /*
          * Replace bit 15 in rs1 with inverse in rs2.
@@ -224,12 +304,17 @@ static bool trans_fsgnjn_h(DisasContext *ctx, arg_fsgnjn_h *a)
         mask = tcg_const_i64(~MAKE_64BIT_MASK(15, 1));
         tcg_gen_not_i64(rs2, rs2);
         tcg_gen_andc_i64(rs2, rs2, mask);
-        tcg_gen_and_i64(rs1, mask, rs1);
-        tcg_gen_or_i64(cpu_fpr[a->rd], rs1, rs2);
+        tcg_gen_and_i64(dest, mask, rs1);
+        tcg_gen_or_i64(dest, dest, rs2);
 
         tcg_temp_free_i64(mask);
         tcg_temp_free_i64(rs2);
     }
+    /* signed-extended intead of nanboxing for result if enable zfinx */
+    if (ctx->ext_zfinx) {
+        tcg_gen_ext16s_i64(dest, dest);
+    }
+    tcg_temp_free_i64(rs1);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -239,27 +324,44 @@ static bool trans_fsgnjx_h(DisasContext *ctx, arg_fsgnjx_h *a)
     TCGv_i64 rs1, rs2;
 
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     rs1 = tcg_temp_new_i64();
-    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
+    if (!ctx->ext_zfinx) {
+        gen_check_nanbox_h(rs1, src1);
+    } else {
+        tcg_gen_mov_i64(rs1, src1);
+    }
 
     if (a->rs1 == a->rs2) { /* FABS */
-        tcg_gen_andi_i64(cpu_fpr[a->rd], rs1, ~MAKE_64BIT_MASK(15, 1));
+        tcg_gen_andi_i64(dest, rs1, ~MAKE_64BIT_MASK(15, 1));
     } else {
+        TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
         rs2 = tcg_temp_new_i64();
-        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
+
+        if (!ctx->ext_zfinx) {
+            gen_check_nanbox_h(rs2, src2);
+        } else {
+            tcg_gen_mov_i64(rs2, src2);
+        }
 
         /*
          * Xor bit 15 in rs1 with that in rs2.
          * This formulation retains the nanboxing of rs1.
          */
-        tcg_gen_andi_i64(rs2, rs2, MAKE_64BIT_MASK(15, 1));
-        tcg_gen_xor_i64(cpu_fpr[a->rd], rs1, rs2);
+        tcg_gen_andi_i64(dest, rs2, MAKE_64BIT_MASK(15, 1));
+        tcg_gen_xor_i64(dest, rs1, dest);
 
         tcg_temp_free_i64(rs2);
     }
-
+    /* signed-extended intead of nanboxing for result if enable zfinx */
+    if (ctx->ext_zfinx) {
+        tcg_gen_ext16s_i64(dest, dest);
+    }
+    tcg_temp_free_i64(rs1);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -267,10 +369,14 @@ static bool trans_fsgnjx_h(DisasContext *ctx, arg_fsgnjx_h *a)
 static bool trans_fmin_h(DisasContext *ctx, arg_fmin_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
-    gen_helper_fmin_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                      cpu_fpr[a->rs2]);
+    gen_helper_fmin_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -278,10 +384,14 @@ static bool trans_fmin_h(DisasContext *ctx, arg_fmin_h *a)
 static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
-    gen_helper_fmax_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                      cpu_fpr[a->rs2]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+
+    gen_helper_fmax_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -289,10 +399,14 @@ static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
 static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_s_h(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
 
     mark_fs_dirty(ctx);
 
@@ -302,26 +416,32 @@ static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
 static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN(ctx);
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
+    REQUIRE_ZDINX_OR_D(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_d_h(dest, cpu_env, src1);
+    gen_set_fpr_d(ctx, a->rd, dest);
 
     mark_fs_dirty(ctx);
 
-
     return true;
 }
 
 static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
 
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_h_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_s(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
 
     return true;
@@ -330,12 +450,15 @@ static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
 static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN(ctx);
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
+    REQUIRE_ZDINX_OR_D(ctx);
 
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_h_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_d(ctx, a->rs1);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_d(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
 
     return true;
@@ -344,11 +467,13 @@ static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
 static bool trans_feq_h(DisasContext *ctx, arg_feq_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
-    gen_helper_feq_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_feq_h(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -356,11 +481,13 @@ static bool trans_feq_h(DisasContext *ctx, arg_feq_h *a)
 static bool trans_flt_h(DisasContext *ctx, arg_flt_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
-    gen_helper_flt_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_flt_h(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
 
     return true;
@@ -369,11 +496,13 @@ static bool trans_flt_h(DisasContext *ctx, arg_flt_h *a)
 static bool trans_fle_h(DisasContext *ctx, arg_fle_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
-    gen_helper_fle_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fle_h(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -381,11 +510,12 @@ static bool trans_fle_h(DisasContext *ctx, arg_fle_h *a)
 static bool trans_fclass_h(DisasContext *ctx, arg_fclass_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
-    gen_helper_fclass_h(dest, cpu_fpr[a->rs1]);
+    gen_helper_fclass_h(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -393,12 +523,13 @@ static bool trans_fclass_h(DisasContext *ctx, arg_fclass_h *a)
 static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_w_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_w_h(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -406,12 +537,13 @@ static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
 static bool trans_fcvt_wu_h(DisasContext *ctx, arg_fcvt_wu_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_wu_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_wu_h(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -419,12 +551,14 @@ static bool trans_fcvt_wu_h(DisasContext *ctx, arg_fcvt_wu_h *a)
 static bool trans_fcvt_h_w(DisasContext *ctx, arg_fcvt_h_w *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv t0 = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_h_w(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_h_w(dest, cpu_env, t0);
+    gen_set_fpr_hs(ctx, a->rd, dest);
 
     mark_fs_dirty(ctx);
     return true;
@@ -433,12 +567,14 @@ static bool trans_fcvt_h_w(DisasContext *ctx, arg_fcvt_h_w *a)
 static bool trans_fcvt_h_wu(DisasContext *ctx, arg_fcvt_h_wu *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv t0 = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_h_wu(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_h_wu(dest, cpu_env, t0);
+    gen_set_fpr_hs(ctx, a->rd, dest);
 
     mark_fs_dirty(ctx);
     return true;
@@ -482,12 +618,13 @@ static bool trans_fcvt_l_h(DisasContext *ctx, arg_fcvt_l_h *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_l_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_l_h(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -496,12 +633,13 @@ static bool trans_fcvt_lu_h(DisasContext *ctx, arg_fcvt_lu_h *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_lu_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_lu_h(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -510,12 +648,14 @@ static bool trans_fcvt_h_l(DisasContext *ctx, arg_fcvt_h_l *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv t0 = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_h_l(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_h_l(dest, cpu_env, t0);
+    gen_set_fpr_hs(ctx, a->rd, dest);
 
     mark_fs_dirty(ctx);
     return true;
@@ -525,12 +665,14 @@ static bool trans_fcvt_h_lu(DisasContext *ctx, arg_fcvt_h_lu *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv t0 = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_h_lu(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_h_lu(dest, cpu_env, t0);
+    gen_set_fpr_hs(ctx, a->rd, dest);
 
     mark_fs_dirty(ctx);
     return true;
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 6237bb3115..dbb322bfa7 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -72,13 +72,23 @@ static inline float32 check_nanbox_s(CPURISCVState *env, uint64_t f)
     }
 }
 
-static inline uint64_t nanbox_h(float16 f)
+static inline uint64_t nanbox_h(CPURISCVState *env, float16 f)
 {
-    return f | MAKE_64BIT_MASK(16, 48);
+    /* the value is sign-extended instead of NaN-boxing for zfinx */
+    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+        return (int16_t)f;
+    } else {
+        return f | MAKE_64BIT_MASK(16, 48);
+    }
 }
 
-static inline float16 check_nanbox_h(uint64_t f)
+static inline float16 check_nanbox_h(CPURISCVState *env, uint64_t f)
 {
+    /* Disable nanbox check when enable zfinx */
+    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+        return (uint16_t)f;
+    }
+
     uint64_t mask = MAKE_64BIT_MASK(16, 48);
 
     if (likely((f & mask) == mask)) {
-- 
2.17.1


