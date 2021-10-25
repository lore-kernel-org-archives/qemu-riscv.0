Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf65N-00031g-4F
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 15:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf65K-0002yV-R7; Mon, 25 Oct 2021 15:56:42 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:65114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf65H-0005S8-SF; Mon, 25 Oct 2021 15:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635191799; x=1666727799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oypbxqPhlCjkj55+sKrOJmltVeV0dXhqurM0wWY7fZw=;
 b=EW+bK0oeSm+gZjuos8eKw+MxN/swiDgLjEUwS7ojHIfYcJDe8q//6gAd
 DhbTGs7ZsPb9TCQDkZtNhIY6e2sFHAdg8Mz1o7hnGPA51x5Q1FtOAdm1I
 jIu/0TZFxyHJObCDSpdAYUcZNxIeMICHAzUtr3zKZITDBAkuGqWXQ3oKF
 d/AxqBBAq0kyOn3lEtgU5lp9GutyrguLOyMYNi+1Xdpem74D5FYmzFBs5
 iXBo/2IqvL0Xqce5l+DqfFJAs+z6qYC7I0QxUoL4maDW+0JqIdI9zEJFJ
 sLQZVw0GEPh0TrIGmLJx97/WjaBByhWZqRb4PaiG70cga2Iqdl7XSIKpn g==;
X-IronPort-AV: E=Sophos;i="5.87,181,1631548800"; d="scan'208";a="287683009"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 03:56:25 +0800
IronPort-SDR: zSVk34v1wb7mU/SBSeqJdfRJJMsDWq3mxpJdHcYmJjUNEGqsq90Ly943wIOHx8F1Myzp8JDLzO
 FJTOyjMFptSqkpujuvcGVR89NWaA/hB854PvmffbhuLF8WCVeX7gHJB6etnGKOOA3eDIIsHqCW
 U59KLS8qiujxqt4Qe61fuXilwFfQIUX+swcknoJrnTtie6WPN5hHu1ibyLaODSz389yFrL1H2y
 cWLZlPRX+GwY8ebgN53KjI8fI+W9LEoj8cnsj0eOB5vF6LwbmSyKdHGWUiU0l2MlDx3LHWpbz5
 knzEple61EP+8dfHdBMyWUto
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 12:31:56 -0700
IronPort-SDR: r2CuZERobu9nstL2wjKnrO1xpish0LMW/ZYHHPQH3NMUpbyz9eH2iVHnwa8SoMEpD+0+q7qCdW
 X4LOYQqjoQ82Hhb7THolDjxWtL2fg4XVLcqV1yG5p6rL3sTROp4yTRWL8wajL/ev3WeSzb1S0d
 5xm8XwgoRPlbxfMP62OHrSJjrjRtesNMFtTRP3eYq3FbfP4WTZx9bcunQZRe1wZVu7SSzme6RS
 DWc03whozWv7u2xm4B/uP55Dd7UeGMTFwVh9UTmTozOx+1pwP/5P2VLVOzP/viykvLTXx3QrKS
 lL0=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2021 12:56:26 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ PATCH v3 09/10] target/riscv: Add few cache related PMU events
Date: Mon, 25 Oct 2021 12:56:00 -0700
Message-Id: <20211025195601.245631-10-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025195601.245631-1-atish.patra@wdc.com>
References: <20211025195601.245631-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=925953cd0=atish.patra@wdc.com; helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Mon, 25 Oct 2021 19:56:43 -0000

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
index d41d5cd27c14..66cdfca547cc 100644
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
@@ -750,6 +753,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
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
@@ -847,6 +872,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.31.1


