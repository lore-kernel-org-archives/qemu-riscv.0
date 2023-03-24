Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfaWq-0007VF-S2
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 02:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfaWp-0007U2-9w; Fri, 24 Mar 2023 02:03:55 -0400
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfaUp-0004tg-IZ; Fri, 24 Mar 2023 02:03:55 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VeWagoq_1679637698; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeWagoq_1679637698) by smtp.aliyun-inc.com;
 Fri, 24 Mar 2023 14:01:39 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 qemu-riscv@nongnu.org, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 3/4] target/riscv: Encode the FS and VS on a normal way for tb
 flags
Date: Fri, 24 Mar 2023 13:59:53 +0800
Message-Id: <20230324055954.908-4-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
References: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.119;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-119.freemail.mail.aliyun.com
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
X-List-Received-Date: Fri, 24 Mar 2023 06:03:55 -0000

Reuse the MSTATUS_FS and MSTATUS_VS for the tb flags positions is not a normal
way.

It will make us change the tb flags layout difficult. And even worse, if we
want to keep tb flags for a same extension togather without a hole.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.h                      | 15 +++++++--------
 target/riscv/cpu_helper.c               | 11 ++++++-----
 target/riscv/insn_trans/trans_rvv.c.inc |  8 ++++----
 target/riscv/translate.c                | 20 ++++++++++----------
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5049e21518..41f7aef666 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -634,18 +634,17 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
 #define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
-#define TB_FLAGS_MSTATUS_FS MSTATUS_FS
-#define TB_FLAGS_MSTATUS_VS MSTATUS_VS
 
 #include "exec/cpu-all.h"
 
 FIELD(TB_FLAGS, MEM_IDX, 0, 3)
-FIELD(TB_FLAGS, LMUL, 3, 3)
-FIELD(TB_FLAGS, SEW, 6, 3)
-/* Skip MSTATUS_VS (0x600) bits */
-FIELD(TB_FLAGS, VL_EQ_VLMAX, 11, 1)
-FIELD(TB_FLAGS, VILL, 12, 1)
-/* Skip MSTATUS_FS (0x6000) bits */
+FIELD(TB_FLAGS, FS, 3, 2)
+/* Vector flags */
+FIELD(TB_FLAGS, VS, 5, 2)
+FIELD(TB_FLAGS, LMUL, 7, 3)
+FIELD(TB_FLAGS, SEW, 10, 3)
+FIELD(TB_FLAGS, VL_EQ_VLMAX, 13, 1)
+FIELD(TB_FLAGS, VILL, 14, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 15, 1)
 FIELD(TB_FLAGS, MSTATUS_HS_FS, 16, 2)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9d50e7bbb6..87c6effcc2 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -79,16 +79,17 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     }
 
 #ifdef CONFIG_USER_ONLY
-    flags |= TB_FLAGS_MSTATUS_FS;
-    flags |= TB_FLAGS_MSTATUS_VS;
+    flags =  FIELD_DP32(flags, TB_FLAGS, FS, EXT_STATUS_DIRTY);
+    flags =  FIELD_DP32(flags, TB_FLAGS, VS, EXT_STATUS_DIRTY);
 #else
     flags |= cpu_mmu_index(env, 0);
     if (riscv_cpu_fp_enabled(env)) {
-        flags |= env->mstatus & MSTATUS_FS;
+        flags =  FIELD_DP32(flags, TB_FLAGS, FS,
+                            get_field(env->mstatus,  MSTATUS_FS));
     }
-
     if (riscv_cpu_vector_enabled(env)) {
-        flags |= env->mstatus & MSTATUS_VS;
+        flags =  FIELD_DP32(flags, TB_FLAGS, VS,
+                            get_field(env->mstatus, MSTATUS_VS));
     }
 
     if (riscv_has_ext(env, RVH)) {
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f2e3d38515..6297c3b50d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -29,12 +29,12 @@ static inline bool is_overlapped(const int8_t astart, int8_t asize,
 
 static bool require_rvv(DisasContext *s)
 {
-    return s->mstatus_vs != 0;
+    return s->mstatus_vs != EXT_STATUS_DISABLED;
 }
 
 static bool require_rvf(DisasContext *s)
 {
-    if (s->mstatus_fs == 0) {
+    if (s->mstatus_fs == EXT_STATUS_DISABLED) {
         return false;
     }
 
@@ -52,7 +52,7 @@ static bool require_rvf(DisasContext *s)
 
 static bool require_scale_rvf(DisasContext *s)
 {
-    if (s->mstatus_fs == 0) {
+    if (s->mstatus_fs == EXT_STATUS_DISABLED) {
         return false;
     }
 
@@ -70,7 +70,7 @@ static bool require_scale_rvf(DisasContext *s)
 
 static bool require_scale_rvfmin(DisasContext *s)
 {
-    if (s->mstatus_fs == 0) {
+    if (s->mstatus_fs == EXT_STATUS_DISABLED) {
         return false;
     }
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 880f6318aa..85ca3ba202 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -611,9 +611,9 @@ static void mark_fs_dirty(DisasContext *ctx)
         return;
     }
 
-    if (ctx->mstatus_fs != MSTATUS_FS) {
+    if (ctx->mstatus_fs != EXT_STATUS_DIRTY) {
         /* Remember the state change for the rest of the TB. */
-        ctx->mstatus_fs = MSTATUS_FS;
+        ctx->mstatus_fs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
@@ -621,9 +621,9 @@ static void mark_fs_dirty(DisasContext *ctx)
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     }
 
-    if (ctx->virt_enabled && ctx->mstatus_hs_fs != MSTATUS_FS) {
+    if (ctx->virt_enabled && ctx->mstatus_hs_fs != EXT_STATUS_DIRTY) {
         /* Remember the stage change for the rest of the TB. */
-        ctx->mstatus_hs_fs = MSTATUS_FS;
+        ctx->mstatus_hs_fs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
@@ -645,9 +645,9 @@ static void mark_vs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
 
-    if (ctx->mstatus_vs != MSTATUS_VS) {
+    if (ctx->mstatus_vs != EXT_STATUS_DIRTY) {
         /* Remember the state change for the rest of the TB.  */
-        ctx->mstatus_vs = MSTATUS_VS;
+        ctx->mstatus_vs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
@@ -655,9 +655,9 @@ static void mark_vs_dirty(DisasContext *ctx)
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     }
 
-    if (ctx->virt_enabled && ctx->mstatus_hs_vs != MSTATUS_VS) {
+    if (ctx->virt_enabled && ctx->mstatus_hs_vs != EXT_STATUS_DIRTY) {
         /* Remember the stage change for the rest of the TB. */
-        ctx->mstatus_hs_vs = MSTATUS_VS;
+        ctx->mstatus_hs_vs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
@@ -1153,8 +1153,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     ctx->pc_succ_insn = ctx->base.pc_first;
     ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
-    ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
-    ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
+    ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
+    ctx->mstatus_vs = FIELD_EX32(tb_flags, TB_FLAGS, VS);
     ctx->priv_ver = env->priv_ver;
     ctx->virt_enabled = FIELD_EX32(tb_flags, TB_FLAGS, VIRT_ENABLED);
     ctx->misa_ext = env->misa_ext;
-- 
2.17.1


