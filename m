Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfaB3-0005BM-8g
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 01:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfaB0-0005B4-So; Fri, 24 Mar 2023 01:41:23 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfaAb-0005er-Qe; Fri, 24 Mar 2023 01:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679636457; x=1711172457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hUIKA3sHW4VU/Syi6ah4tlI9gmNWNrb9HNCEk85zO2w=;
 b=NQrS/6N0YnFocKZhF+iHF8HLsgYII7+4lNn9UEsxEhMoiArnSyf+pIUu
 3jmBlzmHkij5He23iEJUiWEckJHA9xTnR4NCtQii+YYb2b4p6caWR6vT7
 YHRh0DBo4ZvyC/BzwmAm0vekkRZnMraz+SuPWFsBdNvLcbStmHHzIjIVY
 UeH43jeY6ppAOq6GYSFqh6Np71KVjwjZi3W4ooR9HSEiFayW+PNWwhtpq
 fJtpM3/ZbtoT/EgtUFl/qoiu9zZUjpO+5H8WnFQCHZ1oGTvQCBXUbG+V2
 dZbBUf5ioP5p903ZYoC2KFVxAOVGj1JUuSHGKIgchNeLngmwPxOu3D9ky g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="339730558"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="339730558"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 22:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="712954758"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="712954758"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by orsmga008.jf.intel.com with ESMTP; 23 Mar 2023 22:40:06 -0700
From: Fei Wu <fei2.wu@intel.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, liweiwei@iscas.ac.cn
Cc: Fei Wu <fei2.wu@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
Subject: [PATCH v5 1/2] target/riscv: separate priv from mmu_idx
Date: Fri, 24 Mar 2023 13:41:53 +0800
Message-Id: <20230324054154.414846-2-fei2.wu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230324054154.414846-1-fei2.wu@intel.com>
References: <20230324054154.414846-1-fei2.wu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=fei2.wu@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 24 Mar 2023 05:41:23 -0000

Currently it's assumed the 2 low bits of mmu_idx map to privilege mode,
this assumption won't last as we are about to add more mmu_idx. Here an
individual priv field is added into TB_FLAGS.

Signed-off-by: Fei Wu <fei2.wu@intel.com>
---
 target/riscv/cpu.h                             | 2 +-
 target/riscv/cpu_helper.c                      | 4 +++-
 target/riscv/insn_trans/trans_privileged.c.inc | 2 +-
 target/riscv/insn_trans/trans_xthead.c.inc     | 7 +------
 target/riscv/translate.c                       | 3 +++
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..ac3eb9abca 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -623,7 +623,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
 #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
@@ -650,6 +649,7 @@ FIELD(TB_FLAGS, VTA, 24, 1)
 FIELD(TB_FLAGS, VMA, 25, 1)
 /* Native debug itrigger */
 FIELD(TB_FLAGS, ITRIGGER, 26, 1)
+FIELD(TB_FLAGS, PRIV, 27, 2)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..4e275b904a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -82,6 +82,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     flags |= TB_FLAGS_MSTATUS_FS;
     flags |= TB_FLAGS_MSTATUS_VS;
 #else
+    flags = FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
+
     flags |= cpu_mmu_index(env, 0);
     if (riscv_cpu_fp_enabled(env)) {
         flags |= env->mstatus & MSTATUS_FS;
@@ -762,7 +764,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      * (riscv_cpu_do_interrupt) is correct */
     MemTxResult res;
     MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
+    int mode = env->priv;
     bool use_background = false;
     hwaddr ppn;
     RISCVCPU *cpu = env_archcpu(env);
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 59501b2780..9305b18299 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -52,7 +52,7 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
      * that no exception will be raised when fetching them.
      */
 
-    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&
+    if (semihosting_enabled(ctx->priv < PRV_S) &&
         (pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
         pre    = opcode_at(&ctx->base, pre_addr);
         ebreak = opcode_at(&ctx->base, ebreak_addr);
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index df504c3f2c..adfb53cb4c 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -265,12 +265,7 @@ static bool trans_th_tst(DisasContext *ctx, arg_th_tst *a)
 
 static inline int priv_level(DisasContext *ctx)
 {
-#ifdef CONFIG_USER_ONLY
-    return PRV_U;
-#else
-     /* Priv level is part of mem_idx. */
-    return ctx->mem_idx & TB_FLAGS_PRIV_MMU_MASK;
-#endif
+    return ctx->priv;
 }
 
 /* Test if priv level is M, S, or U (cannot fail). */
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0ee8ee147d..b215d18250 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -69,6 +69,7 @@ typedef struct DisasContext {
     uint32_t mstatus_hs_fs;
     uint32_t mstatus_hs_vs;
     uint32_t mem_idx;
+    uint32_t priv;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
        no previous fp instruction.  Note that we exit the TB when writing
@@ -1162,8 +1163,10 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     } else {
         ctx->virt_enabled = false;
     }
+    ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
 #else
     ctx->virt_enabled = false;
+    ctx->priv = PRV_U;
 #endif
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
-- 
2.25.1


