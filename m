Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfaW0-0007Hi-9w
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 02:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfaVy-0007HH-CY; Fri, 24 Mar 2023 02:03:02 -0400
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfaVh-00052e-Fk; Fri, 24 Mar 2023 02:03:02 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R911e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VeWah0U_1679637730; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeWah0U_1679637730) by smtp.aliyun-inc.com;
 Fri, 24 Mar 2023 14:02:11 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 qemu-riscv@nongnu.org, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 4/4] target/riscv: Add a tb flags field for vstart
Date: Fri, 24 Mar 2023 13:59:54 +0800
Message-Id: <20230324055954.908-5-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
References: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 24 Mar 2023 06:03:02 -0000

Once we mistook the vstart directly from the env->vstart. As env->vstart is not
a constant, we should record it in the tb flags if we want to use
it in translation.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.h                      | 21 +++++++++++----------
 target/riscv/cpu_helper.c               |  1 +
 target/riscv/insn_trans/trans_rvv.c.inc | 14 +++++++-------
 target/riscv/translate.c                |  4 ++--
 4 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 41f7aef666..623288e6f9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -645,21 +645,22 @@ FIELD(TB_FLAGS, LMUL, 7, 3)
 FIELD(TB_FLAGS, SEW, 10, 3)
 FIELD(TB_FLAGS, VL_EQ_VLMAX, 13, 1)
 FIELD(TB_FLAGS, VILL, 14, 1)
+FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)
 /* Is a Hypervisor instruction load/store allowed? */
-FIELD(TB_FLAGS, HLSX, 15, 1)
-FIELD(TB_FLAGS, MSTATUS_HS_FS, 16, 2)
-FIELD(TB_FLAGS, MSTATUS_HS_VS, 18, 2)
+FIELD(TB_FLAGS, HLSX, 16, 1)
+FIELD(TB_FLAGS, MSTATUS_HS_FS, 17, 2)
+FIELD(TB_FLAGS, MSTATUS_HS_VS, 19, 2)
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
-FIELD(TB_FLAGS, XL, 20, 2)
+FIELD(TB_FLAGS, XL, 21, 2)
 /* If PointerMasking should be applied */
-FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
-FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
-FIELD(TB_FLAGS, VTA, 24, 1)
-FIELD(TB_FLAGS, VMA, 25, 1)
+FIELD(TB_FLAGS, PM_MASK_ENABLED, 23, 1)
+FIELD(TB_FLAGS, PM_BASE_ENABLED, 24, 1)
+FIELD(TB_FLAGS, VTA, 25, 1)
+FIELD(TB_FLAGS, VMA, 26, 1)
 /* Native debug itrigger */
-FIELD(TB_FLAGS, ITRIGGER, 26, 1)
+FIELD(TB_FLAGS, ITRIGGER, 27, 1)
 /* Virtual mode enabled */
-FIELD(TB_FLAGS, VIRT_ENABLED, 27, 1)
+FIELD(TB_FLAGS, VIRT_ENABLED, 28, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 87c6effcc2..f80d069884 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -74,6 +74,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                     FIELD_EX64(env->vtype, VTYPE, VTA));
         flags = FIELD_DP32(flags, TB_FLAGS, VMA,
                     FIELD_EX64(env->vtype, VTYPE, VMA));
+        flags = FIELD_DP32(flags, TB_FLAGS, VSTART_EQ_ZERO, env->vstart == 0);
     } else {
         flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
     }
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6297c3b50d..32b3b9a8e5 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -547,7 +547,7 @@ static bool vext_check_sds(DisasContext *s, int vd, int vs1, int vs2, int vm)
  */
 static bool vext_check_reduction(DisasContext *s, int vs2)
 {
-    return require_align(vs2, s->lmul) && (s->vstart == 0);
+    return require_align(vs2, s->lmul) && s->vstart_eq_zero;
 }
 
 /*
@@ -3083,7 +3083,7 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s) &&
-        s->vstart == 0) {
+        s->vstart_eq_zero) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -3112,7 +3112,7 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s) &&
-        s->vstart == 0) {
+        s->vstart_eq_zero) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -3146,7 +3146,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         vext_check_isa_ill(s) &&                                   \
         require_vm(a->vm, a->rd) &&                                \
         (a->rd != a->rs2) &&                                       \
-        (s->vstart == 0)) {                                        \
+        s->vstart_eq_zero) {                                       \
         uint32_t data = 0;                                         \
         gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
@@ -3187,7 +3187,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
         !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
         require_vm(a->vm, a->rd) &&
         require_align(a->rd, s->lmul) &&
-        (s->vstart == 0)) {
+        s->vstart_eq_zero) {
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -3636,7 +3636,7 @@ static bool vcompress_vm_check(DisasContext *s, arg_r *a)
            require_align(a->rs2, s->lmul) &&
            (a->rd != a->rs2) &&
            !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1) &&
-           (s->vstart == 0);
+           s->vstart_eq_zero;
 }
 
 static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
@@ -3675,7 +3675,7 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
         QEMU_IS_ALIGNED(a->rd, LEN) &&                                  \
         QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 \
         uint32_t maxsz = (s->cfg_ptr->vlen >> 3) * LEN;                 \
-        if (s->vstart == 0) {                                           \
+        if (s->vstart_eq_zero) {                                        \
             /* EEW = 8 */                                               \
             tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),                  \
                              vreg_ofs(s, a->rs2), maxsz, maxsz);        \
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 85ca3ba202..e8bac1b470 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -99,7 +99,7 @@ typedef struct DisasContext {
     uint8_t vta;
     uint8_t vma;
     bool cfg_vta_all_1s;
-    target_ulong vstart;
+    bool vstart_eq_zero;
     bool vl_eq_vlmax;
     CPUState *cs;
     TCGv zero;
@@ -1169,7 +1169,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
     ctx->vma = FIELD_EX32(tb_flags, TB_FLAGS, VMA) && cpu->cfg.rvv_ma_all_1s;
     ctx->cfg_vta_all_1s = cpu->cfg.rvv_ta_all_1s;
-    ctx->vstart = env->vstart;
+    ctx->vstart_eq_zero = FIELD_EX32(tb_flags, TB_FLAGS, VSTART_EQ_ZERO);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->misa_mxl_max = env->misa_mxl_max;
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
-- 
2.17.1


