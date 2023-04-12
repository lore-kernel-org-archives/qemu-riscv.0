Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYtP-00056k-CA
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt6-0004k5-5r
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:44 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt1-0002Nc-Dz
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:43 -0400
Received: by mail-wr1-x430.google.com with SMTP id w24so977362wra.10
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299818; x=1683891818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKbGyzdb6cvD2agcBZ2QYZh6VK7dmyekZkQ2foWy+l8=;
 b=ymQZcciH+u37PRMsU3Wcipl5CA7nVULsKwNKHjqCc4JdXQCa5diPsXjgEjpyetRc70
 5Ns6tXzLNv5DTk1Z1q16GeDS52HDPYTexFysvWoQc1UH73As2Qzf+aaNzSftlFoudo5p
 bZNMm8EboEdCQ77qtHH56M9kRexXcdYpLGeUtINOfM0TVgYHvZeqYNQCMoY5G+0fofFj
 UpJz3gw24eXem84/1sEm+ylQcVpgB2yoPM+kaIpIhffRQxtjRMKUBp5rWJQsvQLW3kUN
 gpougmr6s7BI1D+HmcJD/X46wRl9uP0PzLxlS5ncMXFCVIIOH8r8fxqdcOUBVDUClHJl
 qEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299818; x=1683891818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EKbGyzdb6cvD2agcBZ2QYZh6VK7dmyekZkQ2foWy+l8=;
 b=1Q0N0/SlDvN7PdrPoIaVo6cIP+roNzx9dTgM3gHddFeS96bF4qzLxMCtKLmpmMS5zg
 LrYN1XSTeaBbeJQ0uUvVegtRdgwpimUgOcXNJFuQKMylFobVhM0COZ+KFZ1qROKrSS9h
 fAj5QR8Aj/OV+0ZyTWwecfTmEZAjpFkfKcujiZu/z2feXoZbAC+SHdEPtrT2LMNVzzMC
 HjceasHJw3dm/93Lgo1z0JbdOl3s3+OEUhH3ClEsjX/IEdlMw0UzbDhFwjaKGntQmTqG
 lgt724RHZVlXOHQv6UvWca18XMudiXT8vxNSOkaJpVB3Tj8KjH2jVj1h+6pGDe7tfha/
 JFSw==
X-Gm-Message-State: AAQBX9fGJvVWQ2rSyxNDvIsIPfh/pnqf97J/2NLsMo6YRilDXKUU04XS
 uynfDB2hFndHcJvda8VdH7wc/Q==
X-Google-Smtp-Source: AKy350YYXLPPjewZplXjxHT9N87luC6j+bVCv5GIJFPdqpUCtO0MtsxBeio0jnBAaOkcsUNB9dL3Ww==
X-Received: by 2002:adf:ef4d:0:b0:2ef:e73d:605d with SMTP id
 c13-20020adfef4d000000b002efe73d605dmr1629175wrp.30.1681299817778; 
 Wed, 12 Apr 2023 04:43:37 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 03/25] target/riscv: Encode the FS and VS on a normal way
 for tb flags
Date: Wed, 12 Apr 2023 13:43:11 +0200
Message-Id: <20230412114333.118895-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 11:43:47 -0000

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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-4-richard.henderson@linaro.org>
---
 target/riscv/cpu.h                      | 15 ++++++------
 target/riscv/cpu_helper.c               | 11 +++++----
 target/riscv/translate.c                | 32 +++++++++++--------------
 target/riscv/insn_trans/trans_rvf.c.inc |  2 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  8 +++----
 5 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ba11279716..51d39687fe 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -631,18 +631,17 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
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
index 1d90977d46..8412ef26ee 100644
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
+        flags = FIELD_DP32(flags, TB_FLAGS, FS,
+                           get_field(env->mstatus, MSTATUS_FS));
     }
-
     if (riscv_cpu_vector_enabled(env)) {
-        flags |= env->mstatus & MSTATUS_VS;
+        flags = FIELD_DP32(flags, TB_FLAGS, VS,
+                           get_field(env->mstatus, MSTATUS_VS));
     }
 
     if (riscv_has_ext(env, RVH)) {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ebd00529ff..411e771e6f 100644
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
     /*
      * Remember the rounding mode encoded in the previous fp instruction,
@@ -601,8 +601,6 @@ static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
 
 #ifndef CONFIG_USER_ONLY
 /*
- * The states of mstatus_fs are:
- * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
  * We will have already diagnosed disabled state,
  * and need to turn initial/clean into dirty.
  */
@@ -614,9 +612,9 @@ static void mark_fs_dirty(DisasContext *ctx)
         return;
     }
 
-    if (ctx->mstatus_fs != MSTATUS_FS) {
+    if (ctx->mstatus_fs != EXT_STATUS_DIRTY) {
         /* Remember the state change for the rest of the TB. */
-        ctx->mstatus_fs = MSTATUS_FS;
+        ctx->mstatus_fs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
@@ -624,9 +622,9 @@ static void mark_fs_dirty(DisasContext *ctx)
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     }
 
-    if (ctx->virt_enabled && ctx->mstatus_hs_fs != MSTATUS_FS) {
+    if (ctx->virt_enabled && ctx->mstatus_hs_fs != EXT_STATUS_DIRTY) {
         /* Remember the stage change for the rest of the TB. */
-        ctx->mstatus_hs_fs = MSTATUS_FS;
+        ctx->mstatus_hs_fs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
@@ -640,8 +638,6 @@ static inline void mark_fs_dirty(DisasContext *ctx) { }
 
 #ifndef CONFIG_USER_ONLY
 /*
- * The states of mstatus_vs are:
- * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
  * We will have already diagnosed disabled state,
  * and need to turn initial/clean into dirty.
  */
@@ -649,9 +645,9 @@ static void mark_vs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
 
-    if (ctx->mstatus_vs != MSTATUS_VS) {
+    if (ctx->mstatus_vs != EXT_STATUS_DIRTY) {
         /* Remember the state change for the rest of the TB.  */
-        ctx->mstatus_vs = MSTATUS_VS;
+        ctx->mstatus_vs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
@@ -659,9 +655,9 @@ static void mark_vs_dirty(DisasContext *ctx)
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     }
 
-    if (ctx->virt_enabled && ctx->mstatus_hs_vs != MSTATUS_VS) {
+    if (ctx->virt_enabled && ctx->mstatus_hs_vs != EXT_STATUS_DIRTY) {
         /* Remember the stage change for the rest of the TB. */
-        ctx->mstatus_hs_vs = MSTATUS_VS;
+        ctx->mstatus_hs_vs = EXT_STATUS_DIRTY;
 
         tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
@@ -1168,8 +1164,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
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
index 9e9fa2087a..b2de4fcf3f 100644
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
index ca3c4c1a3d..ecbdf1b3d7 100644
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


