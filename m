Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7487EB64DA
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 13:55:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLl9j-0005Zb-HZ; Tue, 18 Jul 2023 09:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1qLfa4-0006te-F8; Tue, 18 Jul 2023 03:57:12 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1qLfa1-0003tD-Oj; Tue, 18 Jul 2023 03:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689667029; x=1721203029;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fuVikuyFfzCnsckFD1CKC9effXoHqWwq5hNoHr/oHg8=;
 b=IZNQVQ/nnbbNUCxSNlfitC8q3F+cgb1Gzk5H8Hc4mjKfqXYLGcvDMRk8
 vz5589rlbr3rbpIyOuKCEqleSeRmGcjT7DkO7WtQKCQ8Xo1eYgr9O4Xzo
 GcpK40HEhk0rgNNRzlOB+pgYE3SPDl5Cqc5kvXnKExL3V/mO6sOHRI7RZ
 uD+M4KBvB+cWn3IfpEf7D6Uxl6y2+TyA7EcSpU8HTpD7DWC38TUkEcUAz
 yHq3L5LdNOlZb8bbD5ytAKi8wPqXpOJ2K8Z7jvd3R6Hp3u6q4tgZ4IJOs
 Dmge8pXDdsMJNPM6yHXBGSoK9wdU35jYJjhkvkhvKvHXNrq0OgaeeRpY/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="366181561"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="366181561"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 00:57:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="813653664"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="813653664"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.28])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Jul 2023 00:56:59 -0700
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH] hw/riscv: Fix topo field in error_report
Date: Tue, 18 Jul 2023 16:07:12 +0800
Message-Id: <20230718080712.503333-1-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 Jul 2023 09:54:22 -0400
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

From: Zhao Liu <zhao1.liu@intel.com>

"smp.cpus" means the number of online CPUs and "smp.max_cpus" means the
total number of CPUs.

riscv_numa_get_default_cpu_node_id() checks "smp.cpus" and the
"available CPUs" description in the next error message also indicates
online CPUs.

So report "smp.cpus" in error_report() instand of "smp.max_cpus".

Since "smp.cpus" is "unsigned int", use "%u".

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/riscv/numa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
index e0414d5b1b73..d319aefb4511 100644
--- a/hw/riscv/numa.c
+++ b/hw/riscv/numa.c
@@ -209,8 +209,8 @@ int64_t riscv_numa_get_default_cpu_node_id(const MachineState *ms, int idx)
 
     if (ms->numa_state->num_nodes > ms->smp.cpus) {
         error_report("Number of NUMA nodes (%d)"
-                     " cannot exceed the number of available CPUs (%d).",
-                     ms->numa_state->num_nodes, ms->smp.max_cpus);
+                     " cannot exceed the number of available CPUs (%u).",
+                     ms->numa_state->num_nodes, ms->smp.cpus);
         exit(EXIT_FAILURE);
     }
     if (ms->numa_state->num_nodes) {
-- 
2.34.1


