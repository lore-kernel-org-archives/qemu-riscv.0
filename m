Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pecCL-0002PT-GT
	for mharc-qemu-riscv@gnu.org; Tue, 21 Mar 2023 09:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pecCK-0002Om-1e; Tue, 21 Mar 2023 09:38:44 -0400
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pecCH-0008Ct-9n; Tue, 21 Mar 2023 09:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679405921; x=1710941921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q+irz7wqODGcTXhzuVullh2tnka/6YgGaDpRpLHqZ+8=;
 b=OEteEQq+3ak/dgYT/tdRp7ErKg2EbvuapL66sxyhH4U6gsmohwYFlFr6
 cnUFMc4MDlyErkm8w7FJ/iJeEqup1A9keOm53qgtlOHTDLctL5oy1sb6b
 2MXTcQKdIVK/g7RN8XF1yEgN52T+4tE6QgVx5CSSmfh3OLW+rTLC7yQWP
 9XEosUg6+Ll5eI/hceDnHUxi2apwa3HYH7HIKEWoI/QGsZohb0UFVvBsH
 YckxhFM1Y/kcU55WYZUsizWGgOSOWEw7PYdGUxxurBo8G0cYg2WOdXq+l
 cwcbDTuJLlJTTs8VA8BktPr63sHQgOT4nTh1bdoA8cvsTkk7D5Glstd0j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="327317034"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="327317034"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 06:38:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="674839724"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="674839724"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by orsmga007.jf.intel.com with ESMTP; 21 Mar 2023 06:38:35 -0700
From: Fei Wu <fei2.wu@intel.com>
To: 
Cc: Fei Wu <fei2.wu@intel.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v2] target/riscv: reduce overhead of MSTATUS_SUM change
Date: Tue, 21 Mar 2023 21:40:09 +0800
Message-Id: <20230321134009.156071-1-fei2.wu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=fei2.wu@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 21 Mar 2023 13:38:44 -0000

Kernel needs to access user mode memory e.g. during syscalls, the window
is usually opened up for a very limited time through MSTATUS.SUM, the
overhead is too much if tlb_flush() gets called for every SUM change.
This patch saves addresses accessed when SUM=1, and flushs only these
pages when SUM changes to 0. If the buffer is not large enough to save
all the pages during SUM=1, it will fall back to tlb_flush when
necessary.

The buffer size is set to 4 since in this MSTATUS.SUM open-up window,
most of the time kernel accesses 1 or 2 pages, it's very rare to see
more than 4 pages accessed.

It's not necessary to save/restore these new added status, as
tlb_flush() is always called after restore.

Result of 'pipe 10' from unixbench boosts from 223656 to 1327407. Many
other syscalls benefit a lot from this one too.

Signed-off-by: Fei Wu <fei2.wu@intel.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.h        |  4 ++++
 target/riscv/cpu_helper.c |  7 +++++++
 target/riscv/csr.c        | 14 +++++++++++++-
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..926dbce59f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -383,6 +383,10 @@ struct CPUArchState {
     uint64_t kvm_timer_compare;
     uint64_t kvm_timer_state;
     uint64_t kvm_timer_frequency;
+
+#define MAX_CACHED_SUM_U_ADDR_NUM 4
+    uint64_t sum_u_count;
+    uint64_t sum_u_addr[MAX_CACHED_SUM_U_ADDR_NUM];
 };
 
 OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..d701017a60 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1068,6 +1068,13 @@ restart:
                     (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
                 *prot |= PAGE_WRITE;
             }
+            if ((pte & PTE_U) && (mode == PRV_S) &&
+                    get_field(env->mstatus, MSTATUS_SUM)) {
+                if (env->sum_u_count < MAX_CACHED_SUM_U_ADDR_NUM) {
+                    env->sum_u_addr[env->sum_u_count] = addr;
+                }
+                ++env->sum_u_count;
+            }
             return TRANSLATE_SUCCESS;
         }
     }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ab566639e5..e7dfdc6a93 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1246,9 +1246,21 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
     /* flush tlb on mstatus fields that affect VM */
     if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
-            MSTATUS_MPRV | MSTATUS_SUM)) {
+            MSTATUS_MPRV)) {
         tlb_flush(env_cpu(env));
+        env->sum_u_count = 0;
+    } else if ((mstatus & MSTATUS_SUM) && !(val & MSTATUS_SUM)) {
+        if (env->sum_u_count > MAX_CACHED_SUM_U_ADDR_NUM) {
+            tlb_flush_by_mmuidx(env_cpu(env), 1 << PRV_S | 1 << PRV_M);
+        } else {
+            for (int i = 0; i < env->sum_u_count; ++i) {
+                tlb_flush_page_by_mmuidx(env_cpu(env), env->sum_u_addr[i],
+                                         1 << PRV_S | 1 << PRV_M);
+            }
+        }
+        env->sum_u_count = 0;
     }
+
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
         MSTATUS_SPP | MSTATUS_MPRV | MSTATUS_SUM |
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
-- 
2.25.1


