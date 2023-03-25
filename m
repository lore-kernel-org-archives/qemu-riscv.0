Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2P8-0002Fq-O2
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 07:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2P7-0002BG-10
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:49:49 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2P5-00075P-3w
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:49:48 -0400
Received: by mail-il1-x12a.google.com with SMTP id h11so2205934ild.11
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 04:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679744975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/qPeG6/AsXGlYUPMDBHBgWFSsT2rwgiR3XynRIKWr6U=;
 b=l5TVoVLoOB9NodNwVV/hOCbGxRIO/1KEcs5UYIZem2tMUIfCAvkDxstvxrJ89sYA/e
 CnsL4Vstx2k7vGrJ/vxZvBkLmbIdSeycJ5221U2iS7sLHmjJssZ/g2NfmU7e102AcOqr
 /hduYWc5tsRfS5qyAUBxM1EmLXJSWBvx8DWg9b5QFa+Py83KPtrGBLKc4gfgLB21C9NV
 qhkbbT4x42iCCRgtCQ4K0BPngqmBY4PgJg20t8Ax3JWAMSD6KsDGdLg1i0wbMnZI0WKz
 jXIu1JHd6ba//RdlrIoF05wULsEr5XLtdB8/+Ejc/we3pc1733C3F1TR91eScoRUasdc
 RzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679744975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/qPeG6/AsXGlYUPMDBHBgWFSsT2rwgiR3XynRIKWr6U=;
 b=Bjsf0o4AkwFNdIfszWHFZVV+csU5le7zYWnwGTxyiEjbmKkxdkqr5PH+HS2mGX6XF4
 I9rDZIiEhG5IhVyMaxzHWEHbVIHkBthNTeTgdsZvPO3liLrF1gnGNP0+HrWbtIEWtX2c
 RVDNthyU+ucDzchnmfjqsximKADk+6o9gkv25T3xUkXWb+t8DPqQo9jnz/DLllRrOPXn
 oy7n0NmT2yQZZt2uy88eT1eqbrVCNNgoUy+66tXlanra594GpTNcwFe6MhMhG1AGA5aM
 JmL6JiTHYoP85w+YMTr825vEiraPk6xyxx8pRwBPR/3QikNXqPiqp6Uzgnh02CcoA/5k
 IxRw==
X-Gm-Message-State: AAQBX9eikrphpNMiviSbGB4faHuo0ovBVQO1UBohlJAEzUDdgVhWVeRb
 LKIDJbY9iX8YLRPcwjJyFeZ2lU/gHpobkQXQT1I=
X-Google-Smtp-Source: AKy350aMnk9ooZs7YTxay99zSH3Jb2ED7Hqro0ZqyORr3f7bBFS2mZ+KVmQEA9lypkoduOXc0SUd0w==
X-Received: by 2002:a17:90b:38d2:b0:234:dc4:2006 with SMTP id
 nn18-20020a17090b38d200b002340dc42006mr6294417pjb.4.1679741673700; 
 Sat, 25 Mar 2023 03:54:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 03/25] target/riscv: Encode the FS and VS on a normal way
 for tb flags
Date: Sat, 25 Mar 2023 03:54:07 -0700
Message-Id: <20230325105429.1142530-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 25 Mar 2023 11:49:49 -0000

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reuse the MSTATUS_FS and MSTATUS_VS for the tb flags positions is not a
normal way.

It will make it hard to change the tb flags layout. And even worse, if we
want to keep tb flags for a same extension togather without a hole.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-Id: <20230324143031.1093-4-zhiwei_liu@linux.alibaba.com>
[rth: Adjust trans_rvf.c.inc as well; use the typedef]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h                      | 15 +++++------
 target/riscv/cpu_helper.c               | 11 ++++----
 target/riscv/translate.c                | 34 ++++++++++++-------------
 target/riscv/insn_trans/trans_rvf.c.inc |  2 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  8 +++---
 5 files changed, 34 insertions(+), 36 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 30d9828d59..f787145a21 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -633,18 +633,17 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
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
index 9d50e7bbb6..1e7ee9aa30 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -79,16 +79,17 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     }
 
 #ifdef CONFIG_USER_ONLY
-    flags |= TB_FLAGS_MSTATUS_FS;
-    flags |= TB_FLAGS_MSTATUS_VS;
+    flags = FIELD_DP32(flags, TB_FLAGS, FS, EXT_STATUS_DIRTY);
+    flags = FIELD_DP32(flags, TB_FLAGS, VS, EXT_STATUS_DIRTY);
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
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 880f6318aa..b897bf6006 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -64,10 +64,10 @@ typedef struct DisasContext {
     RISCVMXL xl;
     uint32_t misa_ext;
     uint32_t opcode;
-    uint32_t mstatus_fs;
-    uint32_t mstatus_vs;
-    uint32_t mstatus_hs_fs;
-    uint32_t mstatus_hs_vs;
+    RISCVExtStatus mstatus_fs;
+    RISCVExtStatus mstatus_vs;
+    RISCVExtStatus mstatus_hs_fs;
+    RISCVExtStatus mstatus_hs_vs;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
@@ -598,8 +598,7 @@ static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
 }
 
 #ifndef CONFIG_USER_ONLY
-/* The states of mstatus_fs are:
- * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
+/*
  * We will have already diagnosed disabled state,
  * and need to turn initial/clean into dirty.
  */
@@ -611,9 +610,9 @@ static void mark_fs_dirty(DisasContext *ctx)
         return;
     }
 
-    if (ctx->mstatus_fs != MSTATUS_FS) {
+    if (ctx->mstatus_fs != EXT_STATUS_DIRTY) {
         /* Remember the state change for the rest of the TB. */
-        ctx->mstatus_fs = MSTATUS_FS;
+        ctx->mstatus_fs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
@@ -621,9 +620,9 @@ static void mark_fs_dirty(DisasContext *ctx)
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     }
 
-    if (ctx->virt_enabled && ctx->mstatus_hs_fs != MSTATUS_FS) {
+    if (ctx->virt_enabled && ctx->mstatus_hs_fs != EXT_STATUS_DIRTY) {
         /* Remember the stage change for the rest of the TB. */
-        ctx->mstatus_hs_fs = MSTATUS_FS;
+        ctx->mstatus_hs_fs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
@@ -636,8 +635,7 @@ static inline void mark_fs_dirty(DisasContext *ctx) { }
 #endif
 
 #ifndef CONFIG_USER_ONLY
-/* The states of mstatus_vs are:
- * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
+/*
  * We will have already diagnosed disabled state,
  * and need to turn initial/clean into dirty.
  */
@@ -645,9 +643,9 @@ static void mark_vs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
 
-    if (ctx->mstatus_vs != MSTATUS_VS) {
+    if (ctx->mstatus_vs != EXT_STATUS_DIRTY) {
         /* Remember the state change for the rest of the TB.  */
-        ctx->mstatus_vs = MSTATUS_VS;
+        ctx->mstatus_vs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
@@ -655,9 +653,9 @@ static void mark_vs_dirty(DisasContext *ctx)
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     }
 
-    if (ctx->virt_enabled && ctx->mstatus_hs_vs != MSTATUS_VS) {
+    if (ctx->virt_enabled && ctx->mstatus_hs_vs != EXT_STATUS_DIRTY) {
         /* Remember the stage change for the rest of the TB. */
-        ctx->mstatus_hs_vs = MSTATUS_VS;
+        ctx->mstatus_hs_vs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
@@ -1153,8 +1151,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     ctx->pc_succ_insn = ctx->base.pc_first;
     ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
-    ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
-    ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
+    ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
+    ctx->mstatus_vs = FIELD_EX32(tb_flags, TB_FLAGS, VS);
     ctx->priv_ver = env->priv_ver;
     ctx->virt_enabled = FIELD_EX32(tb_flags, TB_FLAGS, VIRT_ENABLED);
     ctx->misa_ext = env->misa_ext;
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 052408f45c..31cd3d0e05 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -19,7 +19,7 @@
  */
 
 #define REQUIRE_FPU do {\
-    if (ctx->mstatus_fs == 0) \
+    if (ctx->mstatus_fs == EXT_STATUS_DISABLED) \
         if (!ctx->cfg_ptr->ext_zfinx) \
             return false; \
 } while (0)
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
 
-- 
2.34.1


