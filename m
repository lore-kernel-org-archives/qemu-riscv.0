Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf65O-000374-Kr
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 15:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf65M-00030x-Cc; Mon, 25 Oct 2021 15:56:44 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:65116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf65J-0005UD-DX; Mon, 25 Oct 2021 15:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635191801; x=1666727801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tUQgS5eOlpWjMk3FNRgJfYwMC66YQeueSFikhyLdJeM=;
 b=Wj1A9Azgbw0j95DhUM/+byzJgh3W8qhV2gjiYTg4rHK9LDLumi3osLuE
 r/K8a4o9xYsOdFsciYVEOea6EyDiu8lpYXURkZRpe9Le5eShpcHMQ9Y0m
 mLum6yudNPQ3zjphrvvurYXSPlMUyKhi8Vc6y6rT1rw2D8Z085eYx/c7T
 rjqTLOyUBYxAjnAzji4aq34RWQ8NtUzWiGAH3nnwR+UP/7O0B93Yycv+H
 YnD9ncwaRW2VE7PPVIalLOdvT84bBc1/xwnro82J96bcwgS7baIzujuxZ
 aoUJS7vRUje0YrpS5uffzBb1wGE77nhzyuzUfkAMaOsESNleI1Kd+ojGL g==;
X-IronPort-AV: E=Sophos;i="5.87,181,1631548800"; d="scan'208";a="287683010"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 03:56:25 +0800
IronPort-SDR: mkjvU4Cv3tlVwreuHOcvjT/axTMf/LgLFk4xzZRTbRpckJqb4bnlWtnbN4TRwZq2+aehtvsG3D
 p512UpbFedVXc7rG4YAMf8QBeey112SKPlxwDa6YKVRZavtZqKd8aaAfgSF8OLPJVW7W/pusLx
 Kl9BSGwgbQbretRtbF3GujbEEDv+8T+s/lw9gbIoH7zAroZWGb2sSmjbXywcZUWwk5jNH5ETAi
 OkuDmUjPBmKEz6cQUspG7yY82YqmlupzBAdDoNjbxiEoghq+TTNh8uB5MSMJAz+kzrm9RfXLZy
 Xf+HyUj+wgBDrtsloyo9GNn6
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 12:31:56 -0700
IronPort-SDR: sPDR31JKsX9FYVZ5bif3gGpnoS/j7zrjALD+W1osSA0GkjAu/bXD71DhnMUjlEtmdN+BrkKxJa
 +5kJB6ejoD2fuW/HfX7kH5HnTHCOL1ykIUBH2F3IfacO2B0rdqGw++fDk+hgO9qKxNdskP5vTV
 t400noQAfs+aEWlR3ulfn3y+OVcqKK1qJBRS28+ED+5b0iQ+EEl6RRTl8CFid9QIgPxoURn8sS
 h9+u6m6a++6IOcakgq3jPYKZQmwyAxX6bIl/ijwQyF2B/w9Aj+kIU8kL9BqfCDEFu2SjpdF34t
 zKA=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2021 12:56:27 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ PATCH v3 10/10] hw/riscv: virt: Add PMU DT node to the device tree
Date: Mon, 25 Oct 2021 12:56:01 -0700
Message-Id: <20211025195601.245631-11-atish.patra@wdc.com>
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
X-List-Received-Date: Mon, 25 Oct 2021 19:56:44 -0000

Qemu virt machine can support few cache events and cycle/instret counters.
It also supports counter overflow for these events.

Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
capabilities. There are some dummy nodes added for testing as well.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 hw/riscv/virt.c    | 36 ++++++++++++++++++++++++++
 target/riscv/pmp.c |  1 +
 target/riscv/pmu.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ec0cb69b8c73..b246d2e339eb 100644
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
@@ -406,6 +407,39 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     g_free(plic_cells);
 }
 
+static void create_fdt_socket_pmu(RISCVVirtState *s,
+                                  int socket, uint32_t *phandle,
+                                  uint32_t *intc_phandles)
+{
+    int cpu;
+    char *pmu_name;
+    RISCVCPU hart;
+    uint32_t *pmu_cells;
+    MachineState *mc = MACHINE(s);
+
+    pmu_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
+
+    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+        pmu_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        pmu_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_PMU_OVF);
+    }
+
+    pmu_name = g_strdup_printf("/soc/pmu");
+    qemu_fdt_add_subnode(mc->fdt, pmu_name);
+    qemu_fdt_setprop_string(mc->fdt, pmu_name, "compatible", "riscv,pmu");
+    hart = s->soc[0].harts[0];
+    if (hart.cfg.ext_sscof) {
+        qemu_fdt_setprop_cell(mc->fdt, pmu_name, "#interrupt-cells", 1);
+        qemu_fdt_setprop(mc->fdt, pmu_name, "interrupts-extended", pmu_cells,
+                         s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    }
+    riscv_pmu_generate_fdt_node(mc->fdt, pmu_name);
+
+    g_free(pmu_name);
+    g_free(pmu_cells);
+}
+
+
 static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
                                bool is_32_bit, uint32_t *phandle,
                                uint32_t *irq_mmio_phandle,
@@ -445,6 +479,8 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
         create_fdt_socket_plic(s, memmap, socket, phandle,
             intc_phandles, xplic_phandles);
 
+        create_fdt_socket_pmu(s, socket, phandle, intc_phandles);
+
         g_free(intc_phandles);
         g_free(clust_name);
     }
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 54abf425835c..2e2145e51903 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -25,6 +25,7 @@
 #include "cpu.h"
 #include "trace.h"
 #include "exec/exec-all.h"
+#include "sysemu/device_tree.h"
 
 static void pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
     uint8_t val);
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 25bdbdf48ff7..9e11af85576d 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -19,9 +19,72 @@
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
+    /* Dummy event and mhpmevent values */
+    fdt_event_map[0] = cpu_to_be32(0x00000009);
+    fdt_event_map[1] = cpu_to_be32(0x00000000);
+    fdt_event_map[2] = cpu_to_be32(0x00000200);
+    fdt_event_map[3] = cpu_to_be32(0x00010000);
+    fdt_event_map[4] = cpu_to_be32(0x00000100);
+    fdt_event_map[5] = cpu_to_be32(0x00000002);
+    qemu_fdt_setprop(fdt, pmu_name, "pmu,event-to-mhpmevent",
+                     fdt_event_map, sizeof(fdt_event_map));
+
+   /* SBI_PMU_HW_CPU_CYCLES */
+   fdt_event_ctr_map[0] = cpu_to_be32(0x00000001);
+   fdt_event_ctr_map[1] = cpu_to_be32(0x00000001);
+   fdt_event_ctr_map[2] = cpu_to_be32(0x00000FF9);
+
+   /* SBI_PMU_HW_INSTRUCTIONS */
+   fdt_event_ctr_map[3] = cpu_to_be32(0x00000002);
+   fdt_event_ctr_map[4] = cpu_to_be32(0x00000002);
+   fdt_event_ctr_map[5] = cpu_to_be32(0x00000FFC);
+
+   /* SBI_PMU_HW_CACHE_DTLB : READ : MISS */
+   fdt_event_ctr_map[6] = cpu_to_be32(0x00010019);
+   fdt_event_ctr_map[7] = cpu_to_be32(0x00010019);
+   fdt_event_ctr_map[8] = cpu_to_be32(0x00001F0);
+
+   /* SBI_PMU_HW_CACHE_DTLB : WRITE : MISS */
+   fdt_event_ctr_map[9] = cpu_to_be32(0x0001001B);
+   fdt_event_ctr_map[10] = cpu_to_be32(0x0001001B);
+   fdt_event_ctr_map[11] = cpu_to_be32(0x00001F0);
+
+   /* SBI_PMU_HW_CACHE_ITLB : READ : MISS */
+   fdt_event_ctr_map[12] = cpu_to_be32(0x00010021);
+   fdt_event_ctr_map[13] = cpu_to_be32(0x00010021);
+   fdt_event_ctr_map[14] = cpu_to_be32(0x00001F0);
+
+   qemu_fdt_setprop(fdt, pmu_name, "pmu,event-to-mhpmcounters",
+                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
+
+   /* Dummy raw events */
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


