Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfAum-0000BF-W2
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 22:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfAuh-0000AY-Sl; Wed, 22 Mar 2023 22:42:52 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfAuf-0007HI-IL; Wed, 22 Mar 2023 22:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679539369; x=1711075369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wjbdz9KMPk3EI9Qj+YWK1eMmDUSCxsKJPQabPzpiZVo=;
 b=CoL8NA/vmHcWCkmkFbctJr2AxLimYuCsXYcU+sDV9u1aboYVtPlTBfi0
 Sd5KpV4bGBTSrmNPd3hjyNtb5X2RVSqlgX0S5a58MW5Ub7N2ghDv01HUX
 +4/z4UPnx5iqZH72saxS97wLWQvm3LKU8bnZzmK0YKFHmL2bHN45BHxK9
 GUTR8IOzfFnrDCxk1L85lS5hHNCucpv1NScDWeyr1CWDnHLS5NFUXgvu0
 qn6TAF166XzQ0dvhPV4JwUZVSt4wpMgVaNWFYcVSzeDClgW/fZ2TvWE6F
 Ybq0J3/p7epyP0bqpJgsZzbERsyBr3bNIOYA3g9h9K1N484Mp6ctWW34G A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="338100252"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="338100252"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 19:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="712491370"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="712491370"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by orsmga008.jf.intel.com with ESMTP; 22 Mar 2023 19:42:45 -0700
From: Fei Wu <fei2.wu@intel.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fei Wu <fei2.wu@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
Subject: [PATCH v4 1/2] target/riscv: separate priv from mmu_idx
Date: Thu, 23 Mar 2023 10:44:11 +0800
Message-Id: <20230323024412.324085-2-fei2.wu@intel.com>
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
X-List-Received-Date: Thu, 23 Mar 2023 02:42:52 -0000

Currently it's assumed the 2 low bits of mmu_idx map to privilege mode,
this assumption won't last as we are about to add more mmu_idx.

Signed-off-by: Fei Wu <fei2.wu@intel.com>
---
 target/riscv/cpu.h                             | 1 -
 target/riscv/cpu_helper.c                      | 2 +-
 target/riscv/insn_trans/trans_privileged.c.inc | 2 +-
 target/riscv/insn_trans/trans_xthead.c.inc     | 7 +------
 target/riscv/translate.c                       | 3 +++
 5 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..66f7e3d1ba 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -623,7 +623,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
 #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..76e1b0100e 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -762,7 +762,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
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
index 0ee8ee147d..e8880f9423 100644
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
+    ctx->priv = env->priv;
 #else
     ctx->virt_enabled = false;
+    ctx->priv = PRV_U;
 #endif
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
-- 
2.25.1


