Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ne5zO-00048u-Ku
	for mharc-qemu-riscv@gnu.org; Mon, 11 Apr 2022 22:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ne5zG-00040P-SG
 for qemu-riscv@nongnu.org; Mon, 11 Apr 2022 22:10:35 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ne5zC-0001lL-S8
 for qemu-riscv@nongnu.org; Mon, 11 Apr 2022 22:10:33 -0400
Received: by mail-pl1-x629.google.com with SMTP id s10so7947959plg.9
 for <qemu-riscv@nongnu.org>; Mon, 11 Apr 2022 19:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o+lfvZWaOo+FqeCtXpjS2usnQMn4+JtcYci/oqoDCe8=;
 b=HBOxa00cF45lcCvx3hPSLSo6yLsHPWIfEasTMXlRV74KeXDfOo+JswE7G52FqqtFPI
 PiEQCNTFAuJesdQAcOujwjMvaUrYYEwUbUaMOLtwdI7wzoODTzNmKtbkCDsGclokZhvF
 M3Y6S96Lm4D2pyqUpg4ydnwEOdTmoQ6nW62/wvN3kT7kzQkVMubIYsRF7P5HCA3D1Uo0
 FQe08XQLKDcF88UchFL0uOmP243XwIqHIUPJbEyDF3f/TwVfH1hZycAgZBB4StI2U1+X
 lRyXC2fgDvsBwJsOCQ854Xy/TzHrz57x8UC05ctCEJtH84MQl0Z6TbJyZak1SN6V0J+i
 Gcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o+lfvZWaOo+FqeCtXpjS2usnQMn4+JtcYci/oqoDCe8=;
 b=Io/OGJSYxGjnQD2V3D07b7EMkyIF5dvpW6sJzawSF9TUu4GxD4jUTaQCXtgotO6dDh
 o8qLIyXc1DrCBTbkHLpa8q8rxQRXqGWaw7FsocIRRPdTWhODkunJM5eSPNWt3dEUs7C+
 6F3yJ8/VoxHQaEAEBZgY9YlDwW1QH7tU0FV8UUxVEqwseS5E7uloNFUC3e6pTw1xe/YO
 Is7Svem8+pTdkXMCg33/lNM+fU2Y3dvpFm19n41RaM9wU1W08QKyoLqhz2VuhndsNRqZ
 6FWRdRmzklqf8SCHNn8hOVU6q39QC/M3DYdP2BStfI2Vrn5gWS3bP9IAnhrCPT9YP3Dn
 /CdA==
X-Gm-Message-State: AOAM533B7UG92B52qhEAjAGI1zxAwrYUhv/rRzGUKxUt6h+qQ4IEgx85
 h3uukdggecIXTBRgnF5kCHYLMg==
X-Google-Smtp-Source: ABdhPJyJ4vOYLZMvqRZI8HIJQnYpzBPHghkqfuiTXrDKIh9hBD50t8h++JfgBs1vmY45yCZQ5i4izg==
X-Received: by 2002:a17:90a:dd45:b0:1bc:9466:9b64 with SMTP id
 u5-20020a17090add4500b001bc94669b64mr2348962pjv.23.1649729428289; 
 Mon, 11 Apr 2022 19:10:28 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a056a00158900b004faad3ae570sm37946504pfk.189.2022.04.11.19.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 19:10:27 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
Subject: [RFC 3/3] hw/riscv: Create a new qemu machine for RISC-V
Date: Mon, 11 Apr 2022 19:10:09 -0700
Message-Id: <20220412021009.582424-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412021009.582424-1-atishp@rivosinc.com>
References: <20220412021009.582424-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 12 Apr 2022 02:10:35 -0000

The RISC-V virt machine has been growing with many different commmandline
options. It has its limitations in terms of maximum number of harts that
it can support. The commandline options slowly will become bit difficult
to manage. Moreover, it always depends on the virtio framework and lot
of mmio devices.

The new MSI based interrupt controller (IMSIC) allows us to build a
minimalistic yet extensible machines without any wired interrupts. All
the devices can be behind PCI with MSI/MSI-X are only source of external
interrupts. This approach is highly scalable in terms of number of harts
and also mimics modern day PC/server machines more closely. As every device
must be behind PCI, we won't require a lot of addition to the machine.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 configs/devices/riscv64-softmmu/default.mak |   1 +
 hw/riscv/Kconfig                            |  11 +
 hw/riscv/meson.build                        |   1 +
 hw/riscv/minic.c                            | 438 ++++++++++++++++++++
 include/hw/riscv/minic.h                    |  65 +++
 5 files changed, 516 insertions(+)
 create mode 100644 hw/riscv/minic.c
 create mode 100644 include/hw/riscv/minic.h

diff --git a/configs/devices/riscv64-softmmu/default.mak b/configs/devices/riscv64-softmmu/default.mak
index bc69301fa4a6..1407c4a9fe2f 100644
--- a/configs/devices/riscv64-softmmu/default.mak
+++ b/configs/devices/riscv64-softmmu/default.mak
@@ -14,3 +14,4 @@ CONFIG_SIFIVE_U=y
 CONFIG_RISCV_VIRT=y
 CONFIG_MICROCHIP_PFSOC=y
 CONFIG_SHAKTI_C=y
+CONFIG_MINIC=y
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 91bb9d21c471..9eca1a6efa25 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -83,3 +83,14 @@ config SPIKE
     select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_PLIC
+
+config MINIC
+    bool
+    imply PCI_DEVICES
+    select RISCV_NUMA
+    select MSI_NONBROKEN
+    select PCI
+    select PCI_EXPRESS_GENERIC_BRIDGE
+    select SERIAL
+    select RISCV_ACLINT
+    select RISCV_IMSIC
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index b3ae84ac0539..7b1c49466e62 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -10,5 +10,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
 riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
+riscv_ss.add(when: 'CONFIG_MINIC', if_true: files('minic.c'))
 
 hw_arch += {'riscv': riscv_ss}
diff --git a/hw/riscv/minic.c b/hw/riscv/minic.c
new file mode 100644
index 000000000000..4ca707da1023
--- /dev/null
+++ b/hw/riscv/minic.c
@@ -0,0 +1,438 @@
+/*
+ * QEMU RISC-V Mini Computer
+ *
+ * Based on the minic machine implementation
+ *
+ * Copyright (c) 2022 Rivos, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "hw/boards.h"
+#include "hw/loader.h"
+#include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
+#include "target/riscv/cpu.h"
+#include "hw/riscv/riscv_hart.h"
+#include "hw/riscv/minic.h"
+#include "hw/riscv/machine_helper.h"
+#include "hw/intc/riscv_aclint.h"
+#include "hw/intc/riscv_imsic.h"
+#include "hw/riscv/boot.h"
+#include "hw/riscv/numa.h"
+#include "chardev/char.h"
+#include "sysemu/device_tree.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
+#include "hw/pci/pci.h"
+#include "hw/pci-host/gpex.h"
+#include "hw/display/ramfb.h"
+
+#define MINIC_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
+#if MINIC_IMSIC_GROUP_MAX_SIZE < \
+    IMSIC_GROUP_SIZE(MINIC_CPUS_MAX_BITS, MINIC_IRQCHIP_MAX_GUESTS_BITS)
+#error "Can't accomodate single IMSIC group in address space"
+#endif
+
+#define MINIC_IMSIC_MAX_SIZE            (MINIC_SOCKETS_MAX * \
+                                        MINIC_IMSIC_GROUP_MAX_SIZE)
+#if 0x4000000 < MINIC_IMSIC_MAX_SIZE
+#error "Can't accomodate all IMSIC groups in address space"
+#endif
+
+static const MemMapEntry minic_memmap[] = {
+    [MINIC_MROM] =        {     0x1000,        0xf000 },
+    [MINIC_CLINT] =       {  0x2000000,       0x10000 },
+    [MINIC_PCIE_PIO] =    {  0x3000000,       0x10000 },
+    [MINIC_IMSIC_M] =     { 0x24000000, MINIC_IMSIC_MAX_SIZE },
+    [MINIC_IMSIC_S] =     { 0x28000000, MINIC_IMSIC_MAX_SIZE },
+    [MINIC_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
+    [MINIC_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
+    [MINIC_DRAM] =        { 0x80000000,           0x0 },
+};
+
+static PcieInitData pdata;
+/* PCIe high mmio for RV64, size is fixed but base depends on top of RAM */
+#define MINIC64_HIGH_PCIE_MMIO_SIZE  (16 * GiB)
+
+static void minic_create_fdt_socket_clint(RISCVMinicState *s,
+                                    const MemMapEntry *memmap, int socket,
+                                    uint32_t *intc_phandles)
+{
+    int cpu;
+    char *clint_name;
+    uint32_t *clint_cells;
+    unsigned long clint_addr;
+    MachineState *mc = MACHINE(s);
+    static const char * const clint_compat[2] = {
+        "sifive,clint0", "riscv,clint0"
+    };
+
+    clint_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
+
+    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+        clint_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        clint_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_SOFT);
+        clint_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandles[cpu]);
+        clint_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_M_TIMER);
+    }
+
+    clint_addr = memmap[MINIC_CLINT].base + (memmap[MINIC_CLINT].size * socket);
+    clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
+    qemu_fdt_add_subnode(mc->fdt, clint_name);
+    qemu_fdt_setprop_string_array(mc->fdt, clint_name, "compatible",
+                                  (char **)&clint_compat,
+                                  ARRAY_SIZE(clint_compat));
+    qemu_fdt_setprop_cells(mc->fdt, clint_name, "reg",
+        0x0, clint_addr, 0x0, memmap[MINIC_CLINT].size);
+    qemu_fdt_setprop(mc->fdt, clint_name, "interrupts-extended",
+        clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
+    riscv_socket_fdt_write_id(mc, mc->fdt, clint_name, socket);
+    g_free(clint_name);
+
+    g_free(clint_cells);
+}
+
+static void minic_create_fdt_sockets(RISCVMinicState *s,
+                                     const MemMapEntry *memmap,
+                                     uint32_t *phandle,
+                                     uint32_t *msi_pcie_phandle)
+{
+    char *clust_name;
+    int socket, phandle_pos;
+    MachineState *mc = MACHINE(s);
+    uint32_t msi_m_phandle = 0, msi_s_phandle = 0;
+    uint32_t *intc_phandles;
+    ImsicInitData idata;
+
+    qemu_fdt_add_subnode(mc->fdt, "/cpus");
+    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
+                          RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
+    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#size-cells", 0x0);
+    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#address-cells", 0x1);
+    qemu_fdt_add_subnode(mc->fdt, "/cpus/cpu-map");
+
+    intc_phandles = g_new0(uint32_t, mc->smp.cpus);
+
+    phandle_pos = mc->smp.cpus;
+    for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
+        phandle_pos -= s->soc[socket].num_harts;
+
+        clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
+        qemu_fdt_add_subnode(mc->fdt, clust_name);
+
+        riscv_create_fdt_socket_cpus(mc, s->soc, socket, clust_name, phandle,
+                               false, &intc_phandles[phandle_pos]);
+
+        riscv_create_fdt_socket_memory(mc, memmap[MINIC_DRAM].base, socket);
+        minic_create_fdt_socket_clint(s, memmap, socket,
+                                      &intc_phandles[phandle_pos]);
+        g_free(clust_name);
+
+    }
+
+    idata.imsic_m.base = memmap[MINIC_IMSIC_M].base;
+    idata.imsic_m.size = memmap[MINIC_IMSIC_M].size;
+    idata.imsic_s.base = memmap[MINIC_IMSIC_S].base;
+    idata.imsic_s.size = memmap[MINIC_IMSIC_S].size;
+    idata.group_max_size = MINIC_IMSIC_GROUP_MAX_SIZE;
+    idata.num_msi = MINIC_IRQCHIP_NUM_MSIS;
+    idata.ipi_msi = MINIC_IRQCHIP_IPI_MSI;
+    idata.num_guests = s->aia_guests;
+
+    riscv_create_fdt_imsic(mc, s->soc, phandle, intc_phandles,
+                           &msi_m_phandle, &msi_s_phandle, &idata);
+    *msi_pcie_phandle = msi_s_phandle;
+
+    riscv_socket_fdt_write_distance_matrix(mc, mc->fdt);
+    g_free(intc_phandles);
+}
+
+static void copy_memmap_to_pciedata(const MemMapEntry *memmap,
+                                    PcieInitData *pdata, uint64_t ram_size)
+{
+    pdata->pcie_ecam.base =  memmap[MINIC_PCIE_ECAM].base;
+    pdata->pcie_ecam.size =  memmap[MINIC_PCIE_ECAM].size;
+    pdata->pcie_pio.base =  memmap[MINIC_PCIE_PIO].base;
+    pdata->pcie_pio.size =  memmap[MINIC_PCIE_PIO].size;
+    pdata->pcie_mmio.base =  memmap[MINIC_PCIE_MMIO].base;
+    pdata->pcie_mmio.size =  memmap[MINIC_PCIE_MMIO].size;
+    pdata->pcie_high_mmio.size  = MINIC64_HIGH_PCIE_MMIO_SIZE;
+    pdata->pcie_high_mmio.base = memmap[MINIC_DRAM].base + ram_size;
+    pdata->pcie_high_mmio.base = ROUND_UP(pdata->pcie_high_mmio.base,
+                                          pdata->pcie_high_mmio.size);
+}
+
+static void minic_create_fdt(RISCVMinicState *s, const MemMapEntry *memmap,
+                       uint64_t mem_size, const char *cmdline)
+{
+    MachineState *mc = MACHINE(s);
+    uint32_t phandle = 1, msi_pcie_phandle = 1;
+
+    if (mc->dtb) {
+        mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
+        if (!mc->fdt) {
+            error_report("load_device_tree() failed");
+            exit(1);
+        }
+        goto update_bootargs;
+    } else {
+        mc->fdt = create_device_tree(&s->fdt_size);
+        if (!mc->fdt) {
+            error_report("create_device_tree() failed");
+            exit(1);
+        }
+    }
+
+    qemu_fdt_setprop_string(mc->fdt, "/", "model", "riscv-minic,qemu");
+    qemu_fdt_setprop_string(mc->fdt, "/", "compatible", "riscv-minic");
+    qemu_fdt_setprop_cell(mc->fdt, "/", "#size-cells", 0x2);
+    qemu_fdt_setprop_cell(mc->fdt, "/", "#address-cells", 0x2);
+
+    qemu_fdt_add_subnode(mc->fdt, "/soc");
+    qemu_fdt_setprop(mc->fdt, "/soc", "ranges", NULL, 0);
+    qemu_fdt_setprop_string(mc->fdt, "/soc", "compatible", "simple-bus");
+    qemu_fdt_setprop_cell(mc->fdt, "/soc", "#size-cells", 0x2);
+    qemu_fdt_setprop_cell(mc->fdt, "/soc", "#address-cells", 0x2);
+
+    minic_create_fdt_sockets(s, memmap, &phandle, &msi_pcie_phandle);
+    qemu_fdt_add_subnode(mc->fdt, "/chosen");
+
+    copy_memmap_to_pciedata(memmap, &pdata, mc->ram_size);
+    pdata.irq_type = RISCV_IRQ_MSI_ONLY;
+    riscv_create_fdt_pcie(mc, &pdata, 0, msi_pcie_phandle);
+
+update_bootargs:
+    if (cmdline) {
+        qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline);
+    }
+}
+
+static void minic_create_imsic(int aia_guests,
+                               const MemMapEntry *memmap, int socket,
+                               int base_hartid, int hart_count)
+{
+    int i;
+    hwaddr addr;
+    uint32_t guest_bits;
+
+    /* Per-socket M-level IMSICs */
+    addr = memmap[MINIC_IMSIC_M].base + socket * MINIC_IMSIC_GROUP_MAX_SIZE;
+    for (i = 0; i < hart_count; i++) {
+        riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
+                           base_hartid + i, true, 1,
+                           MINIC_IRQCHIP_NUM_MSIS);
+    }
+
+    /* Per-socket S-level IMSICs */
+    guest_bits = riscv_imsic_num_bits(aia_guests + 1);
+    addr = memmap[MINIC_IMSIC_S].base + socket * MINIC_IMSIC_GROUP_MAX_SIZE;
+    for (i = 0; i < hart_count; i++) {
+        riscv_imsic_create(addr + i * IMSIC_HART_SIZE(guest_bits),
+                           base_hartid + i, false, 1 + aia_guests,
+                           MINIC_IRQCHIP_NUM_MSIS);
+    }
+}
+
+static void minic_machine_init(MachineState *machine)
+{
+    const MemMapEntry *memmap = minic_memmap;
+    RISCVMinicState *s = RISCV_MINIC_MACHINE(machine);
+    MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
+    char *soc_name;
+    target_ulong start_addr = memmap[MINIC_DRAM].base;
+    target_ulong firmware_end_addr, kernel_start_addr;
+    uint32_t fdt_load_addr;
+    uint64_t kernel_entry;
+    int i, base_hartid, hart_count;
+
+    /* Check socket count limit */
+    if (MINIC_SOCKETS_MAX < riscv_socket_count(machine)) {
+        error_report("number of sockets/nodes should be less than %d",
+            MINIC_SOCKETS_MAX);
+        exit(1);
+    }
+
+    /* Initialize sockets */
+    for (i = 0; i < riscv_socket_count(machine); i++) {
+        if (!riscv_socket_check_hartids(machine, i)) {
+            error_report("discontinuous hartids in socket%d", i);
+            exit(1);
+        }
+
+        base_hartid = riscv_socket_first_hartid(machine, i);
+        if (base_hartid < 0) {
+            error_report("can't find hartid base for socket%d", i);
+            exit(1);
+        }
+
+        hart_count = riscv_socket_hart_count(machine, i);
+        if (hart_count < 0) {
+            error_report("can't find hart count for socket%d", i);
+            exit(1);
+        }
+
+        soc_name = g_strdup_printf("soc%d", i);
+        object_initialize_child(OBJECT(machine), soc_name, &s->soc[i],
+                                TYPE_RISCV_HART_ARRAY);
+        g_free(soc_name);
+        object_property_set_str(OBJECT(&s->soc[i]), "cpu-type",
+                                machine->cpu_type, &error_abort);
+        object_property_set_int(OBJECT(&s->soc[i]), "hartid-base",
+                                base_hartid, &error_abort);
+        object_property_set_int(OBJECT(&s->soc[i]), "num-harts",
+                                hart_count, &error_abort);
+        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
+
+        /*
+         * Minic machine doesn't need M-mode software interrupt IPI device
+         * However, clint doesn't provide modularity and the existing software
+         * stack expect this address to be present with clint.
+         */
+        riscv_aclint_swi_create(
+                    memmap[MINIC_CLINT].base + i * memmap[MINIC_CLINT].size,
+                    base_hartid, hart_count, false);
+
+        /* Per-socket ACLINT MTIMER */
+        riscv_aclint_mtimer_create(memmap[MINIC_CLINT].base +
+                        i * memmap[MINIC_CLINT].size + RISCV_ACLINT_SWI_SIZE,
+                    RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
+                    RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+                    RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
+
+        minic_create_imsic(s->aia_guests, memmap, i, base_hartid, hart_count);
+    }
+
+    /* register system main memory (actual RAM) */
+    memory_region_add_subregion(system_memory, memmap[MINIC_DRAM].base,
+        machine->ram);
+
+    /* create device tree */
+    minic_create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
+
+    /* boot rom */
+    memory_region_init_rom(mask_rom, NULL, "riscv_minic_board.mrom",
+                           memmap[MINIC_MROM].size, &error_fatal);
+    memory_region_add_subregion(system_memory, memmap[MINIC_MROM].base,
+                                mask_rom);
+
+    firmware_end_addr = riscv_find_and_load_firmware(machine,
+                                    RISCV64_BIOS_BIN, start_addr, NULL);
+
+    if (machine->kernel_filename) {
+        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
+                                                         firmware_end_addr);
+
+        kernel_entry = riscv_load_kernel(machine->kernel_filename,
+                                         kernel_start_addr, NULL);
+
+        if (machine->initrd_filename) {
+            hwaddr start;
+            hwaddr end = riscv_load_initrd(machine->initrd_filename,
+                                           machine->ram_size, kernel_entry,
+                                           &start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
+                                  "linux,initrd-start", start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
+                                  end);
+        }
+    } else {
+       /*
+        * If dynamic firmware is used, it doesn't know where is the next mode
+        * if kernel argument is not set.
+        */
+        kernel_entry = 0;
+    }
+
+    /* Compute the fdt load address in dram */
+    fdt_load_addr = riscv_load_fdt(memmap[MINIC_DRAM].base,
+                                   machine->ram_size, machine->fdt);
+    /* load the reset vector */
+    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
+                              minic_memmap[MINIC_MROM].base,
+                              minic_memmap[MINIC_MROM].size, kernel_entry,
+                              fdt_load_addr, machine->fdt);
+
+    riscv_gpex_pcie_msi_init(system_memory, &pdata);
+}
+
+static void minic_machine_instance_init(Object *obj)
+{
+}
+
+static char *minic_get_aia_guests(Object *obj, Error **errp)
+{
+    RISCVMinicState *s = RISCV_MINIC_MACHINE(obj);
+    char val[32];
+
+    sprintf(val, "%d", s->aia_guests);
+    return g_strdup(val);
+}
+
+static void minic_set_aia_guests(Object *obj, const char *val, Error **errp)
+{
+    RISCVMinicState *s = RISCV_MINIC_MACHINE(obj);
+
+    s->aia_guests = atoi(val);
+    if (s->aia_guests < 0 || s->aia_guests > MINIC_IRQCHIP_MAX_GUESTS) {
+        error_setg(errp, "Invalid number of AIA IMSIC guests");
+        error_append_hint(errp, "Valid values be between 0 and %d.\n",
+                          MINIC_IRQCHIP_MAX_GUESTS);
+    }
+}
+
+static void minic_machine_class_init(ObjectClass *oc, void *data)
+{
+    char str[128];
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "RISC-V Mini Computer";
+    mc->init = minic_machine_init;
+    mc->max_cpus = MINIC_CPUS_MAX;
+    mc->default_cpu_type = TYPE_RISCV_CPU_BASE64;
+    mc->pci_allow_0_address = true;
+    mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
+    mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
+    mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
+    mc->numa_mem_supported = true;
+    mc->default_ram_id = "riscv_minic.ram";
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+
+    object_class_property_add_str(oc, "aia-guests",
+                                  minic_get_aia_guests,
+                                  minic_set_aia_guests);
+    sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
+                 "should be between 0 and %d.", MINIC_IRQCHIP_MAX_GUESTS);
+    object_class_property_set_description(oc, "aia-guests", str);
+}
+
+static const TypeInfo minic_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("minic"),
+    .parent     = TYPE_MACHINE,
+    .class_init = minic_machine_class_init,
+    .instance_init = minic_machine_instance_init,
+    .instance_size = sizeof(RISCVMinicState),
+};
+
+static void minic_machine_init_register_types(void)
+{
+    type_register_static(&minic_machine_typeinfo);
+}
+
+type_init(minic_machine_init_register_types)
diff --git a/include/hw/riscv/minic.h b/include/hw/riscv/minic.h
new file mode 100644
index 000000000000..950911abc2b9
--- /dev/null
+++ b/include/hw/riscv/minic.h
@@ -0,0 +1,65 @@
+/*
+ * QEMU RISC-V Mini Computer machine interface
+ *
+ * Copyright (c) 2022 Rivos, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_RISCV_MINIC_H
+#define HW_RISCV_MINIC_H
+
+#include "hw/riscv/riscv_hart.h"
+#include "hw/sysbus.h"
+#include "hw/block/flash.h"
+#include "qom/object.h"
+
+#define MINIC_CPUS_MAX_BITS             9
+#define MINIC_CPUS_MAX                  (1 << MINIC_CPUS_MAX_BITS)
+#define MINIC_SOCKETS_MAX_BITS          2
+#define MINIC_SOCKETS_MAX               (1 << MINIC_SOCKETS_MAX_BITS)
+
+#define MINIC_IRQCHIP_IPI_MSI 1
+#define MINIC_IRQCHIP_NUM_MSIS 255
+#define MINIC_IRQCHIP_NUM_PRIO_BITS 3
+#define MINIC_IRQCHIP_MAX_GUESTS_BITS 3
+#define MINIC_IRQCHIP_MAX_GUESTS ((1U << MINIC_IRQCHIP_MAX_GUESTS_BITS) - 1U)
+
+#define TYPE_RISCV_MINIC_MACHINE MACHINE_TYPE_NAME("minic")
+
+typedef struct RISCVMinicState RISCVMinicState;
+DECLARE_INSTANCE_CHECKER(RISCVMinicState, RISCV_MINIC_MACHINE,
+                         TYPE_RISCV_MINIC_MACHINE)
+
+struct RISCVMinicState {
+    /*< private >*/
+    MachineState parent;
+
+    /*< public >*/
+    RISCVHartArrayState soc[MINIC_SOCKETS_MAX];
+    int fdt_size;
+    int aia_guests;
+};
+
+enum {
+    MINIC_MROM = 0,
+    MINIC_CLINT,
+    MINIC_IMSIC_M,
+    MINIC_IMSIC_S,
+    MINIC_DRAM,
+    MINIC_PCIE_MMIO,
+    MINIC_PCIE_PIO,
+    MINIC_PCIE_ECAM
+};
+
+#endif
-- 
2.25.1


