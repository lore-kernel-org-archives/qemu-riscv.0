Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfAuu-0000CP-Ke
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 22:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfAut-0000CD-A7; Wed, 22 Mar 2023 22:43:03 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfAur-0008AK-BP; Wed, 22 Mar 2023 22:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679539381; x=1711075381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/e2hTgvgE56RF8xHEHgLsmX3SDCopYIVKBjVvtTY43I=;
 b=aeHuyR1dr+/xRwkdp1GN5MWm9m8Dm3HzD0S7UAWvQ77OXfr/cEzx0bnQ
 mUEqSpCGRP+D+H5QqylhP1L/2jJqlRl5DhoXJGl3b2qpqecCX3wJK/Wnh
 vX1FsUlb1jCfB9WIlMpFSJfo4saRKSW65KrZAU8WKMJxt+DfHhtrh+73J
 f8m3oQ4ojnLBBKx2T/HCd9YwEwDWlRG7XAjkvDRVJnvfdZKWYKRTO5h8/
 mhGFeDFaB7gy5ybc9fd+kZDdC/BxOp3zGbH9CsLyb//r0yIe/OTDNWO5I
 pPY/n2bhH0dTqm5SWpN0X7+FrOFzhS5FPacu3+JGiGmxfFMxkEXrgq+7g g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="338100287"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="338100287"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 19:42:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="712491432"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="712491432"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by orsmga008.jf.intel.com with ESMTP; 22 Mar 2023 19:42:54 -0700
From: Fei Wu <fei2.wu@intel.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fei Wu <fei2.wu@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v4 2/2] target/riscv: reduce overhead of MSTATUS_SUM change
Date: Thu, 23 Mar 2023 10:44:12 +0800
Message-Id: <20230323024412.324085-3-fei2.wu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323024412.324085-1-fei2.wu@intel.com>
References: <20230323024412.324085-1-fei2.wu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=fei2.wu@intel.com;
 helo=mga04.intel.com
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
X-List-Received-Date: Thu, 23 Mar 2023 02:43:03 -0000

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
index 66f7e3d1ba..d65eeb3c85 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -623,7 +623,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
 #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 76e1b0100e..bbc612badf 100644
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
 
@@ -596,7 +609,7 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
 
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


