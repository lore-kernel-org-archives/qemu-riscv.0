Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYte-0005s6-Cm
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt8-0004kp-A1
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:47 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt4-0002ON-1A
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:44 -0400
Received: by mail-wr1-x432.google.com with SMTP id j1so14578136wrb.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299820; x=1683891820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AmmNXj22HP7KMuzDURhipUP2NYBo1bwlMxGUrM5ujg4=;
 b=JYxktg14OyscHvAJSlWTTTMGJoWJab/Pv42K4KJzZYMTdfQHZkBqhiam+/nHG9/1Kb
 zqQmsGBvCIDo26AQY/2H7ehJIC286cEdZEzxp6ULD5UQsAwBMN5DcU7hICY0BTs4F7vX
 4HRgFBAVE5/RMEeb9fr5S7Sk969lHxW/zoJHhO5FujSBBSq9XpZzwHz/zK/iDZAaV42p
 EGkVpJEyjHxKLarB7wVe94Ys6/l8zO4E5tQCfMgR7pqmRXSdsdwpBaEYOG6OTbIG+ru2
 aWDHROFHbbv7cah2aXMDF8qcW1JJNb+YFyZGrUR055NUxnih7sygK7e4qdis75wDFlHg
 kNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299820; x=1683891820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AmmNXj22HP7KMuzDURhipUP2NYBo1bwlMxGUrM5ujg4=;
 b=pz4LhShKM4yAHOIj9SRHG4Urc4eo8o9CjDe2zqaWjhkb9mSnSMxIwMki9E3bqng/SE
 c0g/QlZXadQgxioKun0F9iKP8LpT+HR0/PkZsEyangfGOhGPxzjZPbd5IYqS93hOLUx1
 WFZ5CAmSC8imr7FItZSzFc0eqc283xe1Yof/E5XDgr/6ccOu8ScOXp1g140iTI6haD7C
 6WEIrvasApNp7bl81bUlR8wJW5R/2v3CpgV9rfdr+ZpmuR1M/slYpy+UeN454T8Or8cb
 EwEbBEA/oIwlPhCuZcPGBCPZC9b1uSnADDel8Zn0n3JT9KQyQsSZxzlhP+JvqNLz3jN0
 gkow==
X-Gm-Message-State: AAQBX9eFKAjqAUoQPmu3LaQrgXnD/X43EbJbLtLcmCXltldfi0pJmnl8
 c2qtDfa3kEcKs0Qv7uVZLLRatQ==
X-Google-Smtp-Source: AKy350bS17pNkKhRKU9MhNTKrRPWregoNroRduIxpAB8VWimeMKiS5hGyoyCKfKBv16Sq6DfMx5oUg==
X-Received: by 2002:adf:db47:0:b0:2f2:4db4:1f5b with SMTP id
 f7-20020adfdb47000000b002f24db41f5bmr4751710wrj.29.1681299820519; 
 Wed, 12 Apr 2023 04:43:40 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org, Fei Wu <fei2.wu@intel.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 06/25] target/riscv: Separate priv from mmu_idx
Date: Wed, 12 Apr 2023 13:43:14 +0200
Message-Id: <20230412114333.118895-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 11:43:48 -0000

From: Fei Wu <fei2.wu@intel.com>

Currently it's assumed the 2 low bits of mmu_idx map to privilege mode,
this assumption won't last as we are about to add more mmu_idx. Here an
individual priv field is added into TB_FLAGS.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fei Wu <fei2.wu@intel.com>
Message-Id: <20230324054154.414846-2-fei2.wu@intel.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-7-richard.henderson@linaro.org>
---
 target/riscv/cpu.h                             |  2 +-
 target/riscv/cpu_helper.c                      |  4 +++-
 target/riscv/translate.c                       |  2 ++
 target/riscv/insn_trans/trans_privileged.c.inc |  2 +-
 target/riscv/insn_trans/trans_xthead.c.inc     | 14 +-------------
 5 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 786ad047ee..9b971ee1b0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -629,7 +629,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 
 #include "exec/cpu-all.h"
@@ -656,6 +655,7 @@ FIELD(TB_FLAGS, ITRIGGER, 22, 1)
 /* Virtual mode enabled */
 FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
 FIELD(TB_FLAGS, VSTART_EQ_ZERO, 24, 1)
+FIELD(TB_FLAGS, PRIV, 25, 2)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7579e83c3d..36d6e422d7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -83,6 +83,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     fs = EXT_STATUS_DIRTY;
     vs = EXT_STATUS_DIRTY;
 #else
+    flags = FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
+
     flags |= cpu_mmu_index(env, 0);
     fs = get_field(env->mstatus, MSTATUS_FS);
     vs = get_field(env->mstatus, MSTATUS_VS);
@@ -751,7 +753,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      */
     MemTxResult res;
     MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
+    int mode = env->priv;
     bool use_background = false;
     hwaddr ppn;
     int napot_bits = 0;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3ab8a9999e..6d59348f0c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -67,6 +67,7 @@ typedef struct DisasContext {
     RISCVExtStatus mstatus_fs;
     RISCVExtStatus mstatus_vs;
     uint32_t mem_idx;
+    uint32_t priv;
     /*
      * Remember the rounding mode encoded in the previous fp instruction,
      * which we have already installed into env->fp_status.  Or -1 for
@@ -1153,6 +1154,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     uint32_t tb_flags = ctx->base.tb->flags;
 
     ctx->pc_succ_insn = ctx->base.pc_first;
+    ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
     ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
     ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
     ctx->mstatus_vs = FIELD_EX32(tb_flags, TB_FLAGS, VS);
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index e3bee971c6..7c2837194c 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -52,7 +52,7 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
      * that no exception will be raised when fetching them.
      */
 
-    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&
+    if (semihosting_enabled(ctx->priv == PRV_U) &&
         (pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
         pre    = opcode_at(&ctx->base, pre_addr);
         ebreak = opcode_at(&ctx->base, ebreak_addr);
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index df504c3f2c..3e13b1d74d 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -263,25 +263,13 @@ static bool trans_th_tst(DisasContext *ctx, arg_th_tst *a)
 
 /* XTheadCmo */
 
-static inline int priv_level(DisasContext *ctx)
-{
-#ifdef CONFIG_USER_ONLY
-    return PRV_U;
-#else
-     /* Priv level is part of mem_idx. */
-    return ctx->mem_idx & TB_FLAGS_PRIV_MMU_MASK;
-#endif
-}
-
 /* Test if priv level is M, S, or U (cannot fail). */
 #define REQUIRE_PRIV_MSU(ctx)
 
 /* Test if priv level is M or S. */
 #define REQUIRE_PRIV_MS(ctx)                                    \
 do {                                                            \
-    int priv = priv_level(ctx);                                 \
-    if (!(priv == PRV_M ||                                      \
-          priv == PRV_S)) {                                     \
+    if (ctx->priv == PRV_U) {                                   \
         return false;                                           \
     }                                                           \
 } while (0)
-- 
2.34.1


