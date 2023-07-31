Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F92EB64DD
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 01:58:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQIAz-0003o4-HA; Sun, 30 Jul 2023 21:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1qQIAy-0003iF-AA; Sun, 30 Jul 2023 21:58:24 -0400
Received: from [192.55.52.136] (helo=mgamail.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1qQIAv-0007jG-Oz; Sun, 30 Jul 2023 21:58:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690768701; x=1722304701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lBAI0qFx6IhVQYJzBWvvcX3bLtMyXPAiMtqmarShKro=;
 b=aB4WQGMN4xy3Ih1dCFpPiYzCWyTZhYqxyOP24tNWWkJ1O3uGVEYlj+Q3
 C0bCZZk2YQslbmgyefafFjOw7MlipgBbtVnaXXs9a1Gt9Dv2bH2QVWzpo
 6sJKuoqqgzd002cStGpbWtniMyvFP1JQBJUUQQB7lnau+VBISiqBOELt3
 8z536kMEGwoY2uAtsjSZIIu7x9Bdcw1CBs/NGRTjT5uhUaxjFBvJ5dRiv
 0pKqkRVUpcQv0U1g7sGzwfxi5y5ekhtR5lzIh140u+kRdSnHwhP7TN3d2
 vhsOivALv99tY7wOrAndJ+j4eLybW6wBxbLUVZjctyopGiqUDFs8TUuYV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="348500841"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; d="scan'208";a="348500841"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2023 18:51:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="728122173"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; d="scan'208";a="728122173"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by orsmga002.jf.intel.com with ESMTP; 30 Jul 2023 18:50:58 -0700
From: Fei Wu <fei2.wu@intel.com>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Fei Wu <fei2.wu@intel.com>, Andrei Warkentin <andrei.warkentin@intel.com>
Subject: [PATCH] hw/riscv: split RAM into low and high memory
Date: Mon, 31 Jul 2023 09:53:17 +0800
Message-Id: <20230731015317.1026996-1-fei2.wu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 192.55.52.136 (failed)
Received-SPF: pass client-ip=192.55.52.136; envelope-from=fei2.wu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

riscv virt platform's memory started at 0x80000000 and
straddled the 4GiB boundary. Curiously enough, this choice
of a memory layout will prevent from launching a VM with
a bit more than 2000MiB and PCIe pass-thru on an x86 host, due
to identity mapping requirements for the MSI doorbell on x86,
and these (APIC/IOAPIC) live right below 4GiB.

So just split the RAM range into two portions:
- 1 GiB range from 0x80000000 to 0xc0000000.
- The remainder at 0x100000000

...leaving a hole between the ranges.

Signed-off-by: Andrei Warkentin <andrei.warkentin@intel.com>
Signed-off-by: Fei Wu <fei2.wu@intel.com>
---
 hw/riscv/virt.c         | 74 ++++++++++++++++++++++++++++++++++++-----
 include/hw/riscv/virt.h |  1 +
 2 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d90286dc46..8fbdc7220c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -75,7 +75,9 @@
 #error "Can't accomodate all IMSIC groups in address space"
 #endif
 
-static const MemMapEntry virt_memmap[] = {
+#define LOW_MEM (1 * GiB)
+
+static MemMapEntry virt_memmap[] = {
     [VIRT_DEBUG] =        {        0x0,         0x100 },
     [VIRT_MROM] =         {     0x1000,        0xf000 },
     [VIRT_TEST] =         {   0x100000,        0x1000 },
@@ -96,6 +98,7 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_PCIE_ECAM] =    { 0x30000000,    0x10000000 },
     [VIRT_PCIE_MMIO] =    { 0x40000000,    0x40000000 },
     [VIRT_DRAM] =         { 0x80000000,           0x0 },
+    [VIRT_DRAM_HIGH] =    { 0x100000000,          0x0 },
 };
 
 /* PCIe high mmio is fixed for RV32 */
@@ -295,15 +298,12 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     }
 }
 
-static void create_fdt_socket_memory(RISCVVirtState *s,
-                                     const MemMapEntry *memmap, int socket)
+static void create_fdt_socket_mem_range(RISCVVirtState *s, uint64_t addr,
+                                        uint64_t size, int socket)
 {
     char *mem_name;
-    uint64_t addr, size;
     MachineState *ms = MACHINE(s);
 
-    addr = memmap[VIRT_DRAM].base + riscv_socket_mem_offset(ms, socket);
-    size = riscv_socket_mem_size(ms, socket);
     mem_name = g_strdup_printf("/memory@%lx", (long)addr);
     qemu_fdt_add_subnode(ms->fdt, mem_name);
     qemu_fdt_setprop_cells(ms->fdt, mem_name, "reg",
@@ -313,6 +313,34 @@ static void create_fdt_socket_memory(RISCVVirtState *s,
     g_free(mem_name);
 }
 
+static void create_fdt_socket_memory(RISCVVirtState *s,
+                                     const MemMapEntry *memmap, int socket)
+{
+    uint64_t addr, size;
+    MachineState *mc = MACHINE(s);
+    uint64_t sock_offset = riscv_socket_mem_offset(mc, socket);
+    uint64_t sock_size = riscv_socket_mem_size(mc, socket);
+
+    if (sock_offset < memmap[VIRT_DRAM].size) {
+        uint64_t low_mem_end = memmap[VIRT_DRAM].base + memmap[VIRT_DRAM].size;
+
+        addr = memmap[VIRT_DRAM].base + sock_offset;
+        size = MIN(low_mem_end - addr, sock_size);
+        create_fdt_socket_mem_range(s, addr, size, socket);
+
+        size = sock_size - size;
+        if (size > 0) {
+            create_fdt_socket_mem_range(s, memmap[VIRT_DRAM_HIGH].base,
+                                        size, socket);
+        }
+    } else {
+        addr = memmap[VIRT_DRAM_HIGH].base +
+               sock_offset - memmap[VIRT_DRAM].size;
+
+        create_fdt_socket_mem_range(s, addr, sock_size, socket);
+    }
+}
+
 static void create_fdt_socket_clint(RISCVVirtState *s,
                                     const MemMapEntry *memmap, int socket,
                                     uint32_t *intc_phandles)
@@ -1334,10 +1362,12 @@ static void virt_machine_done(Notifier *notifier, void *data)
 
 static void virt_machine_init(MachineState *machine)
 {
-    const MemMapEntry *memmap = virt_memmap;
+    MemMapEntry *memmap = virt_memmap;
     RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
+    MemoryRegion *ram_below_4g, *ram_above_4g;
+    uint64_t ram_size_low, ram_size_high;
     char *soc_name;
     DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
     int i, base_hartid, hart_count;
@@ -1448,6 +1478,17 @@ static void virt_machine_init(MachineState *machine)
         }
     }
 
+    if (machine->ram_size > LOW_MEM) {
+        ram_size_high = machine->ram_size - LOW_MEM;
+        ram_size_low = LOW_MEM;
+    } else {
+        ram_size_high = 0;
+        ram_size_low = machine->ram_size;
+    }
+
+    memmap[VIRT_DRAM].size = ram_size_low;
+    memmap[VIRT_DRAM_HIGH].size = ram_size_high;
+
     if (riscv_is_32bit(&s->soc[0])) {
 #if HOST_LONG_BITS == 64
         /* limit RAM size in a 32-bit system */
@@ -1460,7 +1501,8 @@ static void virt_machine_init(MachineState *machine)
         virt_high_pcie_memmap.size = VIRT32_HIGH_PCIE_MMIO_SIZE;
     } else {
         virt_high_pcie_memmap.size = VIRT64_HIGH_PCIE_MMIO_SIZE;
-        virt_high_pcie_memmap.base = memmap[VIRT_DRAM].base + machine->ram_size;
+        virt_high_pcie_memmap.base = memmap[VIRT_DRAM_HIGH].base +
+                                     memmap[VIRT_DRAM_HIGH].size;
         virt_high_pcie_memmap.base =
             ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
     }
@@ -1468,8 +1510,22 @@ static void virt_machine_init(MachineState *machine)
     s->memmap = virt_memmap;
 
     /* register system main memory (actual RAM) */
+    ram_below_4g = g_malloc(sizeof(*ram_below_4g));
+    memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", machine->ram,
+                             0, memmap[VIRT_DRAM].size);
     memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
-        machine->ram);
+                                ram_below_4g);
+
+    if (memmap[VIRT_DRAM_HIGH].size) {
+        ram_above_4g = g_malloc(sizeof(*ram_above_4g));
+        memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
+                                 machine->ram,
+                                 memmap[VIRT_DRAM].size,
+                                 memmap[VIRT_DRAM_HIGH].size);
+        memory_region_add_subregion(system_memory,
+                                    memmap[VIRT_DRAM_HIGH].base,
+                                    ram_above_4g);
+    }
 
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e5c474b26e..36004eb6ef 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -79,6 +79,7 @@ enum {
     VIRT_IMSIC_S,
     VIRT_FLASH,
     VIRT_DRAM,
+    VIRT_DRAM_HIGH,
     VIRT_PCIE_MMIO,
     VIRT_PCIE_PIO,
     VIRT_PLATFORM_BUS,
-- 
2.34.1


