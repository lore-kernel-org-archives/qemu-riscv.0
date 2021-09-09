Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOQdl-0007cg-Ot
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 16:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdW-0007NH-Uo; Thu, 09 Sep 2021 16:27:06 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:36123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdR-0000RO-Ok; Thu, 09 Sep 2021 16:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631219220; x=1662755220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Tq2p/Ll2dVmYe8pNo+bw4oH6NsBrSJPfOEeR4S1sJs=;
 b=TrgYaTO8Y8JThBaT5EwUmxAHW0lQUiFLzzdVsxHobxku1+YCjGtYOZSm
 Lxx2lW6n7lo8Y1/Y2Em7Unj2tO0WPHAQlBs4YP8gFYe25vz4H9M6IPK/y
 3fg5A02Y7bRfz1nfAT5SWmQetzcPBZW9q71U46RrCqSFiEdSX7Ri6VE0l
 DpJ7xg7gzECBdXtuKVsi7QhwAkgKrmosvU9sJEegq4XfGGKOf3f4Tzmr8
 u7I9SdavtWPMZwlPk0KNNaEj3MMNMFIE/4FgzuzFNmbxiFh7OcNKRuYrV
 fHtAbJKdjUuSoZZ1dS+jFxxWs95G8Q7eZwLR9kcvTrEcIgArCj0okiIzY A==;
X-IronPort-AV: E=Sophos;i="5.85,281,1624291200"; d="scan'208";a="179620290"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Sep 2021 04:26:52 +0800
IronPort-SDR: 7AC4yI81b0bRIjZcIE7O6VJi4AA9KasVYOf6YPOo0eL5Qx7qosoEmy43nAVZ4nktH/UzbHu7Ui
 WeAxJjhYHy/76DVzIUYfBAPXOSZjRnzklHJVKam7uVGiMzJkjHQE1bqavegnWveDcWnZB90NxN
 3LbBa8207mSbNnJWZ9kc7xiUozEGlbHPgNJkzx0eIOEUSsfQwtWT3XBa/dJxbtXRzTL2GoWirc
 1wCpcJZz2oLRizss/rIuYtcAOgTNzums3/R86BI2ZgYa6aoph/SswJ6zhSnfk7NkUyiPQ2ZK7k
 7Imn4DmBYbHl2pW/PdH/VoPB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 13:03:27 -0700
IronPort-SDR: lULnzqMuyJ5lGFqOliLHQdZHKcUtmuyvuEX02A0hioCRdHbLYfI14oTPRiDtvLXnRjG+lCnSQg
 BopWk4/gkeqsSW7I2ZKszxpQJkUcISFb2MG+vIJlu5SACC/X9amyH/Boxsd78nLMqM62mmjOOZ
 PpmUSnNyRX60BvXjM5sWxk+xxRAfgz3oMR08xhnYS5C/CvJS8DhiGWzdK+X+oq9z0uyemzA/3+
 0QiGuTy+Byw0qs1hh+3RZqht7h2QYMYQDuSrbBzdNVGrbKzHY24bUW7NLqunr5fJINoOuWuFMR
 fJ0=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Sep 2021 13:26:53 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ RFC v2 9/9] hw/riscv: virt: Add PMU DT node to the device tree
Date: Thu,  9 Sep 2021 13:26:39 -0700
Message-Id: <20210909202639.1230170-10-atish.patra@wdc.com>
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
X-List-Received-Date: Thu, 09 Sep 2021 20:27:09 -0000

Qemu virt machine can support few cache events and cycle/instret counters.
It also supports counter overflow for these events.

Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
capabilities.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 hw/riscv/virt.c    | 25 +++++++++++++++++++--
 target/riscv/pmu.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4a3cd2599a5e..197390fe5627 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -28,6 +28,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/char/serial.h"
 #include "target/riscv/cpu.h"
+#include "target/riscv/pmu.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
@@ -42,6 +43,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
+#include <libfdt.h>
 
 static const MemMapEntry virt_memmap[] = {
     [VIRT_DEBUG] =       {        0x0,         0x100 },
@@ -184,14 +186,14 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     int i, cpu, socket;
     MachineState *mc = MACHINE(s);
     uint64_t addr, size;
-    uint32_t *clint_cells, *plic_cells;
+    uint32_t *clint_cells, *plic_cells, *pmu_int_cells;
     unsigned long clint_addr, plic_addr;
     uint32_t plic_phandle[MAX_NODES];
     uint32_t cpu_phandle, intc_phandle, test_phandle;
     uint32_t phandle = 1, plic_mmio_phandle = 1;
     uint32_t plic_pcie_phandle = 1, plic_virtio_phandle = 1;
     char *mem_name, *cpu_name, *core_name, *intc_name;
-    char *name, *clint_name, *plic_name, *clust_name;
+    char *name, *clint_name, *plic_name, *clust_name, *pmu_name;
     hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
     static const char * const clint_compat[2] = {
@@ -240,6 +242,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
 
         plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
         clint_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
+        pmu_int_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
 
         for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
             cpu_phandle = phandle++;
@@ -282,6 +285,9 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
             plic_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
             plic_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_S_EXT);
 
+            pmu_int_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandle);
+            pmu_int_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_PMU_OVF);
+
             core_name = g_strdup_printf("%s/core%d", clust_name, cpu);
             qemu_fdt_add_subnode(fdt, core_name);
             qemu_fdt_setprop_cell(fdt, core_name, "cpu", cpu_phandle);
@@ -291,6 +297,21 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
             g_free(cpu_name);
         }
 
+        pmu_name = g_strdup_printf("/soc/pmu");
+        qemu_fdt_add_subnode(fdt, pmu_name);
+        qemu_fdt_setprop_string(fdt, pmu_name, "compatible", "riscv,pmu");
+        RISCVCPU cpu = s->soc[0].harts[0];
+        if (cpu.cfg.ext_sscof) {
+            qemu_fdt_setprop_cell(fdt, pmu_name, "#interrupt-cells", 1);
+        qemu_fdt_setprop(fdt, pmu_name, "interrupts-extended",
+                         pmu_int_cells,
+                             s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+        }
+
+        riscv_pmu_generate_fdt_node(fdt, pmu_name);
+        g_free(pmu_int_cells);
+        g_free(pmu_name);
+
         addr = memmap[VIRT_DRAM].base + riscv_socket_mem_offset(mc, socket);
         size = riscv_socket_mem_size(mc, socket);
         mem_name = g_strdup_printf("/memory@%lx", (long)addr);
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index a4c0044ff822..a93b61daf00a 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -19,9 +19,64 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "pmu.h"
+#include "sysemu/device_tree.h"
 
 #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
 
+/**
+ * To keep it simple, any event can be mapped to any programmable counters in
+ * QEMU. The generic cycle & instruction count events can also be monitored
+ * using programmable counters. In that case, mcycle & minstret must continue
+ * to provide the correct value as well.
+ */
+void riscv_pmu_generate_fdt_node(void *fdt, char *pmu_name)
+{
+    uint32_t fdt_event_map[6] = {};
+    uint32_t fdt_event_ctr_map[20] = {};
+    uint32_t fdt_raw_event_ctr_map[6] = {};
+
+    fdt_event_map[0] = cpu_to_be32(0x00000009);
+    fdt_event_map[1] = cpu_to_be32(0x00000000);
+    fdt_event_map[2] = cpu_to_be32(0x00000200);
+    fdt_event_map[3] = cpu_to_be32(0x00010000);
+    fdt_event_map[4] = cpu_to_be32(0x00000100);
+    fdt_event_map[5] = cpu_to_be32(0x00000002);
+    qemu_fdt_setprop(fdt, pmu_name, "pmu,event-to-mhpmevent",
+                     fdt_event_map, sizeof(fdt_event_map));
+
+   fdt_event_ctr_map[0] = cpu_to_be32(0x00000001);
+   fdt_event_ctr_map[1] = cpu_to_be32(0x00000001);
+   fdt_event_ctr_map[2] = cpu_to_be32(0x00000FF9);
+   fdt_event_ctr_map[3] = cpu_to_be32(0x00000002);
+   fdt_event_ctr_map[4] = cpu_to_be32(0x00000002);
+   fdt_event_ctr_map[5] = cpu_to_be32(0x00000FFC);
+
+   fdt_event_ctr_map[6] = cpu_to_be32(0x00010019);
+   fdt_event_ctr_map[7] = cpu_to_be32(0x00010019);
+   fdt_event_ctr_map[8] = cpu_to_be32(0x00001F0);
+
+   fdt_event_ctr_map[9] = cpu_to_be32(0x0001001B);
+   fdt_event_ctr_map[10] = cpu_to_be32(0x0001001B);
+   fdt_event_ctr_map[11] = cpu_to_be32(0x00001F0);
+
+   fdt_event_ctr_map[12] = cpu_to_be32(0x00010021);
+   fdt_event_ctr_map[13] = cpu_to_be32(0x00010021);
+   fdt_event_ctr_map[14] = cpu_to_be32(0x00001F0);
+
+   qemu_fdt_setprop(fdt, pmu_name, "pmu,event-to-mhpmcounters",
+                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
+
+   fdt_raw_event_ctr_map[0] = cpu_to_be32(0x00000000);
+   fdt_raw_event_ctr_map[1] = cpu_to_be32(0x00020002);
+   fdt_raw_event_ctr_map[2] = cpu_to_be32(0x00000F00);
+   fdt_raw_event_ctr_map[3] = cpu_to_be32(0x00000000);
+   fdt_raw_event_ctr_map[4] = cpu_to_be32(0x00020003);
+   fdt_raw_event_ctr_map[5] = cpu_to_be32(0x000000F0);
+   qemu_fdt_setprop(fdt, pmu_name, "pmu,raw-event-to-mhpmcounters",
+                    fdt_raw_event_ctr_map,
+                    sizeof(fdt_raw_event_ctr_map));
+}
+
 static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
 {
     if (ctr_idx < 3 || ctr_idx >= RV_MAX_MHPMCOUNTERS ||
-- 
2.31.1


