Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n0bbC-0006pL-Fh
	for mharc-qemu-riscv@gnu.org; Thu, 23 Dec 2021 22:50:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0bb5-0006ln-1Q; Thu, 23 Dec 2021 22:50:23 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:49314 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0bav-0001a7-Qv; Thu, 23 Dec 2021 22:50:20 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACHjwNqQ8VheYHIBA--.4261S7;
 Fri, 24 Dec 2021 11:50:07 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 liweiwei <liweiwei@iscas.ac.cn>
Subject: [PATCH 5/6] target/riscv: add support for zhinx/zhinxmin
Date: Fri, 24 Dec 2021 11:49:14 +0800
Message-Id: <20211224034915.17204-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowACHjwNqQ8VheYHIBA--.4261S7
X-Coremail-Antispam: 1UD129KBjvAXoWfZw45Xr4UZF1ktrW7Cr48WFg_yoW5Wry8Zo
 Wfur45CrZ5Kw13Wasxta1vqrW7Aa4xuw1xXrWv9rWkG3Z3Wr48tFWYqwn5ZayYgFWFgry8
 XFsxA3ZxJry7C343n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYL7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r126s0DM28Irc
 Ia0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l
 84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
 3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20E
 Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZX7UUUUU==
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
X-List-Received-Date: Fri, 24 Dec 2021 03:50:23 -0000

  - update extension check REQUIRE_ZHINX_OR_ZFH and REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN
  - update half float point register read/write
  - disable nanbox_h check

Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/fpu_helper.c                 |  60 ++--
 target/riscv/helper.h                     |   2 +-
 target/riscv/insn_trans/trans_rvzfh.c.inc | 342 +++++++++++++++-------
 target/riscv/internals.h                  |   6 +-
 4 files changed, 279 insertions(+), 131 deletions(-)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 0895fa3c7e..2032800dfe 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -89,9 +89,9 @@ void helper_set_rod_rounding_mode(CPURISCVState *env)
 static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
                            uint64_t rs3, int flags)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
-    float16 frs3 = check_nanbox_h(rs3);
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
+    float16 frs3 = check_nanbox_h(env, rs3);
     return nanbox_h(float16_muladd(frs1, frs2, frs3, flags, &env->fp_status));
 }
 
@@ -416,36 +416,36 @@ target_ulong helper_fclass_d(uint64_t frs1)
 
 uint64_t helper_fadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
     return nanbox_h(float16_add(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fsub_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
     return nanbox_h(float16_sub(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fmul_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
     return nanbox_h(float16_mul(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fdiv_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
     return nanbox_h(float16_div(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fmin_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
     return nanbox_h(env->priv_ver < PRIV_VERSION_1_11_0 ?
                     float16_minnum(frs1, frs2, &env->fp_status) :
                     float16_minimum_number(frs1, frs2, &env->fp_status));
@@ -453,8 +453,8 @@ uint64_t helper_fmin_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 
 uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 = check_nanbox_h(rs1);
-    float16 frs2 = check_nanbox_h(rs2);
+    float16 frs1 = check_nanbox_h(env, rs1);
+    float16 frs2 = check_nanbox_h(env, rs2);
     return nanbox_h(env->priv_ver < PRIV_VERSION_1_11_0 ?
                     float16_maxnum(frs1, frs2, &env->fp_status) :
                     float16_maximum_number(frs1, frs2, &env->fp_status));
@@ -462,58 +462,58 @@ uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 
 uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs1 = check_nanbox_h(env, rs1);
     return nanbox_h(float16_sqrt(frs1, &env->fp_status));
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
 
@@ -545,7 +545,7 @@ uint64_t helper_fcvt_h_s(CPURISCVState *env, uint64_t rs1)
 
 uint64_t helper_fcvt_s_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs1 = check_nanbox_h(env, rs1);
     return nanbox_s(float16_to_float32(frs1, true, &env->fp_status));
 }
 
@@ -556,6 +556,6 @@ uint64_t helper_fcvt_h_d(CPURISCVState *env, uint64_t rs1)
 
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
index 5a7cac8958..5917eb251b 100644
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
@@ -180,23 +233,41 @@ static bool trans_fsqrt_h(DisasContext *ctx, arg_fsqrt_h *a)
 static bool trans_fsgnj_h(DisasContext *ctx, arg_fsgnj_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
 
     if (a->rs1 == a->rs2) { /* FMOV */
-        gen_check_nanbox_h(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
+        TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+        if (ctx->ext_zfinx) {
+            gen_nanbox_h(dest, src1);
+        } else {
+            gen_check_nanbox_h(dest, src1);
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
+        TCGv_i64 rs1, rs2;
+        if (!ctx->ext_zfinx) {
+            TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+            TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+            rs1 = tcg_temp_new_i64();
+            rs2 = tcg_temp_new_i64();
+            gen_check_nanbox_h(rs1, src1);
+            gen_check_nanbox_h(rs2, src2);
+        } else {
+            rs1 = get_fpr_hs(ctx, a->rs1);
+            rs2 = get_fpr_hs(ctx, a->rs2);
+        }
+
+        /* This formulation retains the nanboxing of rs2 in normal 'Zfh'. */
+        tcg_gen_deposit_i64(dest, rs2, rs1, 0, 15);
+        if (!ctx->ext_zfinx) {
+            tcg_temp_free_i64(rs1);
+            tcg_temp_free_i64(rs2);
+        } else {
+            gen_nanbox_h(dest, dest);
+        }
     }
-
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -206,16 +277,27 @@ static bool trans_fsgnjn_h(DisasContext *ctx, arg_fsgnjn_h *a)
     TCGv_i64 rs1, rs2, mask;
 
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
-    rs1 = tcg_temp_new_i64();
-    gen_check_nanbox_h(rs1, cpu_fpr[a->rs1]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    if (!ctx->ext_zfinx) {
+        TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+        rs1 = tcg_temp_new_i64();
+        gen_check_nanbox_h(rs1, src1);
+    } else {
+        rs1 = get_fpr_hs(ctx, a->rs1);
+    }
 
     if (a->rs1 == a->rs2) { /* FNEG */
-        tcg_gen_xori_i64(cpu_fpr[a->rd], rs1, MAKE_64BIT_MASK(15, 1));
+        tcg_gen_xori_i64(dest, rs1, MAKE_64BIT_MASK(15, 1));
     } else {
+        TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
         rs2 = tcg_temp_new_i64();
-        gen_check_nanbox_h(rs2, cpu_fpr[a->rs2]);
+        if (!ctx->ext_zfinx) {
+            gen_check_nanbox_h(rs2, src2);
+        } else {
+            tcg_gen_mov_i64(rs2, src2);
+        }
 
         /*
          * Replace bit 15 in rs1 with inverse in rs2.
@@ -224,12 +306,17 @@ static bool trans_fsgnjn_h(DisasContext *ctx, arg_fsgnjn_h *a)
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
+    if (ctx->ext_zfinx) {
+        gen_nanbox_h(dest, dest);
+    } else {
+        tcg_temp_free_i64(rs1);
+    }
     mark_fs_dirty(ctx);
     return true;
 }
@@ -239,27 +326,44 @@ static bool trans_fsgnjx_h(DisasContext *ctx, arg_fsgnjx_h *a)
     TCGv_i64 rs1, rs2;
 
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
-    rs1 = tcg_temp_new_i64();
-    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    if (!ctx->ext_zfinx) {
+        TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+        rs1 = tcg_temp_new_i64();
+        gen_check_nanbox_h(rs1, src1);
+    } else {
+        rs1 = get_fpr_hs(ctx, a->rs1);
+    }
 
     if (a->rs1 == a->rs2) { /* FABS */
-        tcg_gen_andi_i64(cpu_fpr[a->rd], rs1, ~MAKE_64BIT_MASK(15, 1));
+        tcg_gen_andi_i64(dest, rs1, ~MAKE_64BIT_MASK(15, 1));
     } else {
-        rs2 = tcg_temp_new_i64();
-        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
+        if (!ctx->ext_zfinx) {
+            TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+            rs2 = tcg_temp_new_i64();
+            gen_check_nanbox_h(rs2, src2);
+        } else {
+            rs2 = get_fpr_hs(ctx, a->rs2);
+        }
 
         /*
          * Xor bit 15 in rs1 with that in rs2.
          * This formulation retains the nanboxing of rs1.
          */
-        tcg_gen_andi_i64(rs2, rs2, MAKE_64BIT_MASK(15, 1));
-        tcg_gen_xor_i64(cpu_fpr[a->rd], rs1, rs2);
+        tcg_gen_andi_i64(dest, rs2, MAKE_64BIT_MASK(15, 1));
+        tcg_gen_xor_i64(dest, rs1, dest);
 
-        tcg_temp_free_i64(rs2);
+        if (!ctx->ext_zfinx) {
+            tcg_temp_free_i64(rs2);
+        }
+    }
+    if (ctx->ext_zfinx) {
+        gen_nanbox_h(dest, dest);
+    } else {
+        tcg_temp_free_i64(rs1);
     }
-
     mark_fs_dirty(ctx);
     return true;
 }
@@ -267,10 +371,14 @@ static bool trans_fsgnjx_h(DisasContext *ctx, arg_fsgnjx_h *a)
 static bool trans_fmin_h(DisasContext *ctx, arg_fmin_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
 
-    gen_helper_fmin_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                      cpu_fpr[a->rs2]);
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
+
+    gen_helper_fmin_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -278,10 +386,14 @@ static bool trans_fmin_h(DisasContext *ctx, arg_fmin_h *a)
 static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
 
-    gen_helper_fmax_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                      cpu_fpr[a->rs2]);
+    gen_helper_fmax_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -289,10 +401,14 @@ static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
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
 
@@ -302,26 +418,32 @@ static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
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
@@ -330,12 +452,15 @@ static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
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
@@ -344,11 +469,13 @@ static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
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
@@ -356,11 +483,13 @@ static bool trans_feq_h(DisasContext *ctx, arg_feq_h *a)
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
@@ -369,11 +498,13 @@ static bool trans_flt_h(DisasContext *ctx, arg_flt_h *a)
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
@@ -381,11 +512,12 @@ static bool trans_fle_h(DisasContext *ctx, arg_fle_h *a)
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
@@ -393,12 +525,13 @@ static bool trans_fclass_h(DisasContext *ctx, arg_fclass_h *a)
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
@@ -406,12 +539,13 @@ static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
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
@@ -419,12 +553,14 @@ static bool trans_fcvt_wu_h(DisasContext *ctx, arg_fcvt_wu_h *a)
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
@@ -433,12 +569,14 @@ static bool trans_fcvt_h_w(DisasContext *ctx, arg_fcvt_h_w *a)
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
@@ -482,12 +620,13 @@ static bool trans_fcvt_l_h(DisasContext *ctx, arg_fcvt_l_h *a)
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
@@ -496,12 +635,13 @@ static bool trans_fcvt_lu_h(DisasContext *ctx, arg_fcvt_lu_h *a)
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
@@ -510,12 +650,14 @@ static bool trans_fcvt_h_l(DisasContext *ctx, arg_fcvt_h_l *a)
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
@@ -525,12 +667,14 @@ static bool trans_fcvt_h_lu(DisasContext *ctx, arg_fcvt_h_lu *a)
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
index 9f3f3319f2..9f046e26bb 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -71,8 +71,12 @@ static inline uint64_t nanbox_h(float16 f)
     return f | MAKE_64BIT_MASK(16, 48);
 }
 
-static inline float16 check_nanbox_h(uint64_t f)
+static inline float16 check_nanbox_h(CPURISCVState *env, uint64_t f)
 {
+    /* Disable nanbox check when enable zfinx */
+    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx)
+        return (uint16_t)f;
+
     uint64_t mask = MAKE_64BIT_MASK(16, 48);
 
     if (likely((f & mask) == mask)) {
-- 
2.17.1


