Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87E2C77B7C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 May 2023 07:57:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pxNeO-0002cz-S8; Fri, 12 May 2023 03:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin.wang@intel.com>)
 id 1pxNeI-0002cI-Mj; Fri, 12 May 2023 03:57:11 -0400
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin.wang@intel.com>)
 id 1pxNeG-0001zd-UL; Fri, 12 May 2023 03:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683878228; x=1715414228;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uRsSJI2zm5ppc5we4av0Xe8rsN+R6PxE+CsnT3nT4hM=;
 b=WghbRY6ayWJydFnclkDRmWL2H/K7d1J5bUOJBL3IsHHTPENTFHeUeQal
 6vbwqzHuyZ4ynmQvtnAP9KMG6X+lscVouONsahV5tSNxdTb89ug3ORGJX
 oL/9eg41O1e8fsMgx97gYFI4azSIvvui9KV5lkIzjLl6BMmV6az0yI3cw
 MwS9JIDT/8JmVQ5USrqgU2UCggjqlFm8jFzC2mFsvCn5Eeu+gF3IrbfBr
 qOML1FP8T3Ye5p32O/th2BwArFHkZ501yBccmGqylBhWSVWv8D/zm18Rb
 SiMkmPcI4n92mqj+ZokuVvwRGM7F3wIDcbsagETnYm9HE1y7QBuDp3Ium g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="353862605"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="353862605"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 00:56:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="703097825"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="703097825"
Received: from yin-optiplex-7090.sh.intel.com ([10.239.160.32])
 by fmsmga007.fm.intel.com with ESMTP; 12 May 2023 00:56:54 -0700
From: Yin Wang <yin.wang@intel.com>
To: qemu-devel@nongnu.org
Cc: Yin Wang <yin.wang@intel.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v3] hw/riscv: qemu crash when NUMA nodes exceed available CPUs
Date: Fri, 12 May 2023 15:56:51 +0800
Message-Id: <20230512075652.1270585-1-yin.wang@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65; envelope-from=yin.wang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Command "qemu-system-riscv64 -machine virt
-m 2G -smp 1 -numa node,mem=1G -numa node,mem=1G"
would trigger this problem.Backtrace with:
 #0  0x0000555555b5b1a4 in riscv_numa_get_default_cpu_node_id  at ../hw/riscv/numa.c:211
 #1  0x00005555558ce510 in machine_numa_finish_cpu_init  at ../hw/core/machine.c:1230
 #2  0x00005555558ce9d3 in machine_run_board_init  at ../hw/core/machine.c:1346
 #3  0x0000555555aaedc3 in qemu_init_board  at ../softmmu/vl.c:2513
 #4  0x0000555555aaf064 in qmp_x_exit_preconfig  at ../softmmu/vl.c:2609
 #5  0x0000555555ab1916 in qemu_init  at ../softmmu/vl.c:3617
 #6  0x000055555585463b in main  at ../softmmu/main.c:47
This commit fixes the issue by adding parameter checks.

Signed-off-by: Yin Wang <yin.wang@intel.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 hw/riscv/numa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
index 4720102561..a1bb312cd0 100644
--- a/hw/riscv/numa.c
+++ b/hw/riscv/numa.c
@@ -207,6 +207,12 @@ int64_t riscv_numa_get_default_cpu_node_id(const MachineState *ms, int idx)
 {
     int64_t nidx = 0;
 
+    if (ms->numa_state->num_nodes > ms->smp.cpus) {
+        error_report("Number of CPUs used by NUMA nodes (%d)"
+                     " cannot exceed the number of available CPUs (%d).",
+                     ms->numa_state->num_nodes, ms->smp.max_cpus);
+        exit(EXIT_FAILURE);
+    }
     if (ms->numa_state->num_nodes) {
         nidx = idx / (ms->smp.cpus / ms->numa_state->num_nodes);
         if (ms->numa_state->num_nodes <= nidx) {
-- 
2.34.1


