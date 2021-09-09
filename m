Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOQdh-0007Sv-0X
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 16:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdR-0007IL-0m; Thu, 09 Sep 2021 16:27:01 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:36123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdM-0000RO-Pg; Thu, 09 Sep 2021 16:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631219215; x=1662755215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2wIHxr3AOsw6Q56/inoJeyfBYd8jqx35ETea16CXlZU=;
 b=NlqmVNDHAUMAKDRby9TOGy1PBw9wcPLCeWB1RCF+zmuqfHzco3V44ZEw
 lYQT1x5nLYk4MndUi8FfsI04q5EhO99evrLrLwc4mCPeHLGVdIbITLKZk
 8JX6xhZyO8ac6U0X594h8VtN7bq1N+TjtLn0Nlgn+3bbmWstaIU/uFJ+M
 oeCPBA4SvYaRGY2+zgVGZ9qQWxXkc6FwfvruByAPcy5qEFGIdvoTvRLCF
 GMBCPJc8L4fdIvtM759O64B5DdYaRxb+gitRET8nBDdmBATn0lAv1LWp5
 LObwtdKSHIRjKIKGVhP/R62SaLDTDT+eLsoVa6+1dRhyRPLdkFW4Vl3CC w==;
X-IronPort-AV: E=Sophos;i="5.85,281,1624291200"; d="scan'208";a="179620288"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Sep 2021 04:26:51 +0800
IronPort-SDR: u2eWsdwEK0dBnLfXV8mz/mDKRHp+2J1hPadsT5ODjqDERHIzwq+4aot8HEfrfHb4iVbx92qeFN
 ZacSf79RVowox5rziK6PNQXcu+QlFdOskP3RQMdTCyueb+fWWyzo2VkGeBzc4G48Y5pBN9cyPE
 O7UoC3MQsSX+U96dVbUEsP6G+BTOfLXKBRGFbrvKPzwd/Wto7NHivhXoQysKRhLWUnXnbNbLgu
 bRrKu4/A88OFVcXGIMB6pEnA/Tneup2OXUw6Rv9YR2s4MMmeIG+YJhKhIupSy46lAJthtJ0s6B
 AY37L28RXIAi3mkYVuInAhCR
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 13:03:27 -0700
IronPort-SDR: aNBCTYGmCBIOV+h3e74ZYjbuSI7OG3yAZsSa/AKgukczhD1l9sl/Lw/hfDyGzuzLBVF8CdaRGZ
 6Uk2GFFMF+ntBGitXIpOkzQgWmBCEhviXnvInhoBx2Oxg+8jBjIMWan8n2h8h9WLSGM2+5DrG8
 YK5H4ek8YDYMZiI4VQr7rs6jI3AKDzWJWnF77G1i42iAmKzjlUpDqzaOiUl0a3a8ZJHiXeuKCI
 8EXgQO3Ap6ufZYxrk3VC/t8pbBmpnhbot2ce1CGHSPenv31va8QLjjcN9ktM8h4iRivuX3zIF1
 sHg=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Sep 2021 13:26:52 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ RFC v2 8/9] target/riscv: Add few cache related PMU events
Date: Thu,  9 Sep 2021 13:26:38 -0700
Message-Id: <20210909202639.1230170-9-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909202639.1230170-1-atish.patra@wdc.com>
References: <20210909202639.1230170-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=87996f883=atish.patra@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Sep 2021 20:27:01 -0000

Qemu can monitor the following cache related PMU events through
tlb_fill functions.

1. DTLB load/store miss
3. ITLB prefetch miss

Increment the PMU counter in tlb_fill function.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 target/riscv/cpu_helper.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 968cb8046f49..c86250e1aada 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -21,10 +21,13 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "pmu.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
+#include "cpu.h"
+#include "cpu_bits.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -754,6 +757,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 }
 #endif /* !CONFIG_USER_ONLY */
 
+
+static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType access_type)
+{
+    enum riscv_pmu_event_idx pmu_event_type;
+
+    switch (access_type) {
+    case MMU_INST_FETCH:
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS;
+        break;
+    case MMU_DATA_LOAD:
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS;
+        break;
+    case MMU_DATA_STORE:
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS;
+        break;
+    default:
+        return;
+    }
+
+    riscv_pmu_incr_ctr(cpu, pmu_event_type);
+}
+
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr)
@@ -851,6 +876,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.31.1


