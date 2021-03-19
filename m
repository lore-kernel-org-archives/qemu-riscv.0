Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNL4I-0006gf-Ex
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 15:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=705762e65=atish.patra@wdc.com>)
 id 1lNL4F-0006fT-Fk; Fri, 19 Mar 2021 15:45:56 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:41236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=705762e65=atish.patra@wdc.com>)
 id 1lNL4C-0004NN-3x; Fri, 19 Mar 2021 15:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616183151; x=1647719151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yVDYblF7JkjU/ShOZHwkj8ZbRh7YmQiElcwCB+c3DBw=;
 b=kcbfF9rLp4ZQBhTtoJskg6qWda/TEiCQe3bbxLlhnpZxhN+EdOuobz2d
 1785H2Iewld5XnVebe349wdpPWr9l1f0l8/zWifJMuwtjnrELPelxXDV9
 K2BcCztMzmBNbVWCgymBLXFA27mykYbtCAh8sWKOyKfuwDpKOHzzw82qL
 UJGTljbb6nCT9Sh4Qv1KJGK3ZAN9ra0bHOZn13t8D0D3pZ20qeOWBHWwd
 JVH7OdhjcCzWanw/flJIFqLHKEeB+V8RKYO/C0WVlL/qd4usI4+GixwAF
 /vx4H5fOj1EWNOKEAv+pXmw2qIOIHRWxp6cwbtz0GM2H1K0RNrJ3wV285 w==;
IronPort-SDR: 1A0CzIQAm8WBYYys21VCLvDEVXkh2YaNXYmjSbQ+LUqplF3eYX1xhi4jEvXTbnf62UR5qG7+jO
 kYyCTG+ljBOJN8txqWjr+OxKlAZHz6Y3TCP7c8cF5jLTakEaww9pNWrD7G0/+kAiPHdOnPxLGO
 iQgGKOVQQPSKtCy213n0GB9ZN1n+w3P8inZ15mSlz8RYy8/bhh1EmtkcEitBFy8bH5ogZ0SP62
 ozWtYVIYHAMOMYc/jVjkaenF9nNqbRHiCdjA8/MiIkTXmCBscX/eT5f59RFwsXctMORPA6v01z
 FnQ=
X-IronPort-AV: E=Sophos;i="5.81,262,1610380800"; d="scan'208";a="273319151"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2021 03:45:43 +0800
IronPort-SDR: 9XKEz6XQhJ3uWmCRFmG8KUS8N5O0+gV/+xAzooSezKBcQ9PfKaN3wrUgewhNWW7awZf6/iBvFt
 Mx2KKek5qgItMfEO+mtHFbWLInEsV+3KL/yMeG4eNqO28bV9//ZTQZCrFi2jL3H42ttwFf6CS0
 ZYy+m4PqolHTtSUQAZ5URAKGIt+BaRglA47tfq0arNvqGD8lua13mxu1DMVnWokb9g0E4tWrZ/
 EsTqYt4kW/XtESftcGYVb8a7c+O6PTm20mEqRSzRFHN0pDJHfRHTMvwf76itjcOwXXX68v0gsv
 n8LjXm4pRq09ObAqtxp+n2Tq
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 12:27:55 -0700
IronPort-SDR: QeEZcpaq/+JHuZTxvGt6Pz6GlqVYMfwDgnFOttte8gCPUKlKkb4N8P1zg/jXgmLfne7KVgM2hA
 uD/nSYsrytngWaOtwt3dDfDTy1TTDdJostyPKJekoIlbT9JIHRi3TJpUZ6YqBdHvcoi3r26ZFg
 je9kmIHyTEUvJiJBTcMODbRGw5Dfp5rpsi0PP1SG58eR5rfHd8k6ScHX4GSA2F/99wDs0G+eSA
 krFqcPl/a8rgsxp/2pDKJaQkjINx20l1ndeVYjkzFSWODDgMQB2iRXop+n3N2d8M1i1dxBhO+C
 xHg=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Mar 2021 12:45:44 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, anup.patel@wdc.com
Subject: [ RFC 5/6] hw/riscv: virt: Add PMU device tree node to support SBI
 PMU extension
Date: Fri, 19 Mar 2021 12:45:33 -0700
Message-Id: <20210319194534.2082397-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319194534.2082397-1-atish.patra@wdc.com>
References: <20210319194534.2082397-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=705762e65=atish.patra@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Fri, 19 Mar 2021 19:45:56 -0000

Qemu can't really support any PMU events other than cycle & instructions
counters. Add a PMU device tree node only for these events based on device
tree bindings defined in OpenSBI

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 hw/riscv/virt.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4f0c2fbca071..84570ad6425b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -42,6 +42,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
+#include <libfdt.h>
 
 static const MemMapEntry virt_memmap[] = {
     [VIRT_DEBUG] =       {        0x0,         0x100 },
@@ -180,7 +181,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     void *fdt;
-    int i, cpu, socket;
+    int i, cpu, socket, rc;
     MachineState *mc = MACHINE(s);
     uint64_t addr, size;
     uint32_t *clint_cells, *plic_cells;
@@ -190,9 +191,10 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     uint32_t phandle = 1, plic_mmio_phandle = 1;
     uint32_t plic_pcie_phandle = 1, plic_virtio_phandle = 1;
     char *mem_name, *cpu_name, *core_name, *intc_name;
-    char *name, *clint_name, *plic_name, *clust_name;
+    char *name, *clint_name, *plic_name, *clust_name, *pmu_name;
     hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
+    uint32_t pmu_event_ctr_map[6] = {};
 
     if (mc->dtb) {
         fdt = s->fdt = load_device_tree(mc->dtb, &s->fdt_size);
@@ -284,6 +286,22 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
             g_free(cpu_name);
         }
 
+        rc = fdt_path_offset(fdt, "/pmu");
+        if (rc == -FDT_ERR_NOTFOUND) {
+                pmu_name = g_strdup_printf("/pmu");
+                qemu_fdt_add_subnode(fdt, pmu_name);
+                qemu_fdt_setprop_string(fdt, pmu_name, "compatible",
+                                        "riscv,pmu");
+                pmu_event_ctr_map[0] = cpu_to_be32(0x00000001);
+                pmu_event_ctr_map[1] = cpu_to_be32(0x00000001);
+                pmu_event_ctr_map[2] = cpu_to_be32(0x00000001);
+                pmu_event_ctr_map[3] = cpu_to_be32(0x00000002);
+                pmu_event_ctr_map[4] = cpu_to_be32(0x00000002);
+                pmu_event_ctr_map[5] = cpu_to_be32(0x00000004);
+                qemu_fdt_setprop(fdt, pmu_name, "opensbi,event-to-counters",
+                                 pmu_event_ctr_map, sizeof(pmu_event_ctr_map));
+                g_free(pmu_name);
+        }
         addr = memmap[VIRT_DRAM].base + riscv_socket_mem_offset(mc, socket);
         size = riscv_socket_mem_size(mc, socket);
         mem_name = g_strdup_printf("/memory@%lx", (long)addr);
-- 
2.25.1


