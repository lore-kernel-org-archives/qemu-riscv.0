Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfaAr-0005AM-K2
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 01:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfaAo-0005A1-G1; Fri, 24 Mar 2023 01:41:10 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfaAc-00063R-0T; Fri, 24 Mar 2023 01:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679636458; x=1711172458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dwMqO1qBcYM5rA4LTlvbuUL4cLk+XnXMkin11ayag4w=;
 b=L6V1/QH9NepZHjnWaNfyXmeZy8syl00vO3DQHeUpeTISDn3uftWORFH8
 CQimXukjOuxJojclkG8J6LUDBwv/SldspoUplb5kRWQtENnLaMt2uU9Hd
 RsNGwyiRSKNLNm/efQxG0JVkLSXN0GZRIk/42bryI8aUg294t0eWkcofB
 3l0spmz8y/KTqG9WL8QzRKKBgM9Ih1eEqNM1Tx8Bt4OECoH6/X5NwrfIH
 4vAdqrEfuNEygXlWkJQUd2PaSAdYtz0ZGTy/ByMg3UsekdqRDjZc5PUEj
 B0e2bJDhEfAHvB3H0jmBb9me4kZPJzwD14vrW8R0KK+KPi3LnhuosCxGG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="339730580"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="339730580"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 22:40:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="712954782"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="712954782"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by orsmga008.jf.intel.com with ESMTP; 23 Mar 2023 22:40:11 -0700
From: Fei Wu <fei2.wu@intel.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, liweiwei@iscas.ac.cn
Cc: Fei Wu <fei2.wu@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 2/2] target/riscv: reduce overhead of MSTATUS_SUM change
Date: Fri, 24 Mar 2023 13:41:54 +0800
Message-Id: <20230324054154.414846-3-fei2.wu@intel.com>
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
X-List-Received-Date: Fri, 24 Mar 2023 05:41:10 -0000

Kernel needs to access user mode memory e.g. during syscalls, the window
is usually opened up for a very limited time through MSTATUS.SUM, the
overhead is too much if tlb_flush() gets called for every SUM change.

This patch creates a separate MMU index for S+SUM, so that it's not
necessary to flush tlb anymore when SUM changes. This is similar to how
ARM handles Privileged Access Never (PAN).

Result of 'pipe 10' from unixbench boosts from 223656 to 1705006. Many
other syscalls benefit a lot from this too.

Signed-off-by: Fei Wu <fei2.wu@intel.com>
---
 target/riscv/cpu.h                      |  1 -
 target/riscv/cpu_helper.c               | 17 +++++++++++++++--
 target/riscv/csr.c                      |  3 +--
 target/riscv/insn_trans/trans_rvh.c.inc |  4 ++--
 target/riscv/internals.h                | 14 ++++++++++++++
 target/riscv/op_helper.c                |  5 +++--
 6 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ac3eb9abca..09d3b0a083 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -623,7 +623,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
 #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 4e275b904a..4a6097f133 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "internals.h"
 #include "pmu.h"
 #include "exec/exec-all.h"
 #include "instmap.h"
@@ -36,7 +37,19 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #ifdef CONFIG_USER_ONLY
     return 0;
 #else
-    return env->priv;
+    if (ifetch) {
+        return env->priv;
+    }
+
+    /* All priv -> mmu_idx mapping are here */
+    int mode = env->priv;
+    if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
+        mode = get_field(env->mstatus, MSTATUS_MPP);
+    }
+    if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
+        return MMUIdx_S_SUM;
+    }
+    return mode;
 #endif
 }
 
@@ -598,7 +611,7 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
 
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
 {
-    return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+    return mmu_idx & MMU_HYP_ACCESS_BIT;
 }
 
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d522efc0b6..f74e40e66d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1246,8 +1246,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     RISCVMXL xl = riscv_cpu_mxl(env);
 
     /* flush tlb on mstatus fields that affect VM */
-    if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
-            MSTATUS_MPRV | MSTATUS_SUM)) {
+    if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPV)) {
         tlb_flush(env_cpu(env));
     }
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index 9248b48c36..15842f4282 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -40,7 +40,7 @@ static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp mop)
     if (check_access(ctx)) {
         TCGv dest = dest_gpr(ctx, a->rd);
         TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
-        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        int mem_idx = ctx->mem_idx | MMU_HYP_ACCESS_BIT;
         tcg_gen_qemu_ld_tl(dest, addr, mem_idx, mop);
         gen_set_gpr(ctx, a->rd, dest);
     }
@@ -87,7 +87,7 @@ static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemOp mop)
     if (check_access(ctx)) {
         TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
         TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
-        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        int mem_idx = ctx->mem_idx | MMU_HYP_ACCESS_BIT;
         tcg_gen_qemu_st_tl(data, addr, mem_idx, mop);
     }
     return true;
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 5620fbffb6..b55152a7dc 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -21,6 +21,20 @@
 
 #include "hw/registerfields.h"
 
+/*
+ * The current MMU Modes are:
+ *  - U                 0b000
+ *  - S                 0b001
+ *  - S+SUM             0b010
+ *  - M                 0b011
+ *  - HLV/HLVX/HSV adds 0b100
+ */
+#define MMUIdx_U            0
+#define MMUIdx_S            1
+#define MMUIdx_S_SUM        2
+#define MMUIdx_M            3
+#define MMU_HYP_ACCESS_BIT  (1 << 2)
+
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 84ee018f7d..962a061228 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "internals.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
@@ -428,14 +429,14 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
 
 target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address)
 {
-    int mmu_idx = cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+    int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
 
     return cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
 }
 
 target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address)
 {
-    int mmu_idx = cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+    int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
 
     return cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
 }
-- 
2.25.1


