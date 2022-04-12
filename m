Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ne5zT-0004CK-U6
	for mharc-qemu-riscv@gnu.org; Mon, 11 Apr 2022 22:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ne5zG-00040O-SF
 for qemu-riscv@nongnu.org; Mon, 11 Apr 2022 22:10:35 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ne5zA-0001kd-Na
 for qemu-riscv@nongnu.org; Mon, 11 Apr 2022 22:10:32 -0400
Received: by mail-pl1-x630.google.com with SMTP id t12so3108640pll.7
 for <qemu-riscv@nongnu.org>; Mon, 11 Apr 2022 19:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6QceJ0gDyZIyPlCCYQJIeUO6a/pkN3moLCLzw3kta9s=;
 b=F/JSimiUgIe0aSIhuoUhqodPjPbSQPwT1cgPXMWbhCr/qpOsJGqAK+nl8u1Zhgw1O/
 ozHN7meY4wZ++zyNYm4Ta98jGbntF1l8NnB5Q9BpMT7ddlGYxMftTPExWnXLJhhp7m80
 UG3Qnk7oeBOdE/Pqv1KEHOiXLgI4sf1ITUfn/tdnUiJJ/Rt2L5A1NAYo8TvSRotulucv
 5wtdLkkWnvek6GQk3tah1UlhjA0C7mrjNRr0vn4HwUEAAsHvxVpU/koJtJb7L9adwnwf
 d82M7HzuIsYAWyxiFOMdQETrt7nOJVGGfCXMb0BR4f/ownvWEjsyhcUpQ5AbYg6kGLG2
 gu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6QceJ0gDyZIyPlCCYQJIeUO6a/pkN3moLCLzw3kta9s=;
 b=nWYrHcmvyqiTaOI0QnFFIvptPnQTMOFZ2uQnpaX+jwnRteDHnYnC5ywTmkKsVbvoM0
 lgi8fN+yDqUktmRIDH/NIgZivs1TjRSlVwaGbN3uKVjdUhGKsoPSn8hmpk9fP+9369tm
 5GAlFoYgq99X1F+ZbxpfUMj5q6eFCu1KFtd926sI4MZ7PtJuYdW5W8HXRerp2MhPXkTY
 a1JeBM3QuSMsFi4qdj8TH33zv6w/s1ZKMJWvScVxcIRraMFxDLsGYxz8jei4bGrdY1V+
 wmcjzk2x5YGJRkxN2zhTHlwnVwJ1+iu2Ju5Lb4WCNcgE4lhkhf8gi03b6H4fSzFv7sZx
 Ak9w==
X-Gm-Message-State: AOAM53253SccjbYiywdzTpvXIQcfr2lfq+HwHMU+uPjaZBbKoqkUvqDD
 1r3hUgRXia8NuG6MlvuIjON9mQ==
X-Google-Smtp-Source: ABdhPJwIGHGVE50Dn/eMdHB0fsf6/Pn8Qwexhy4Dr8F9pdch9PCbt3xHh+7iNMwKwoiRJ2fTJQfvAg==
X-Received: by 2002:a17:90a:7147:b0:1bd:24ac:13bd with SMTP id
 g7-20020a17090a714700b001bd24ac13bdmr2412020pjs.70.1649729426928; 
 Mon, 11 Apr 2022 19:10:26 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a056a00158900b004faad3ae570sm37946504pfk.189.2022.04.11.19.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 19:10:26 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
Subject: [RFC 2/3] hw/riscv: virt: Move common functions to a separate helper
 file
Date: Mon, 11 Apr 2022 19:10:08 -0700
Message-Id: <20220412021009.582424-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412021009.582424-1-atishp@rivosinc.com>
References: <20220412021009.582424-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x630.google.com
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

The virt machine has many generic functions that can be used by
other machines. Move these functions to a helper file so that other
machines can use it in the future.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/riscv/machine_helper.c         | 417 ++++++++++++++++++++++++++++++
 hw/riscv/meson.build              |   1 +
 hw/riscv/virt.c                   | 403 +++--------------------------
 include/hw/riscv/machine_helper.h |  87 +++++++
 include/hw/riscv/virt.h           |  13 -
 5 files changed, 541 insertions(+), 380 deletions(-)
 create mode 100644 hw/riscv/machine_helper.c
 create mode 100644 include/hw/riscv/machine_helper.h

diff --git a/hw/riscv/machine_helper.c b/hw/riscv/machine_helper.c
new file mode 100644
index 000000000000..d8e6b87f1a48
--- /dev/null
+++ b/hw/riscv/machine_helper.c
@@ -0,0 +1,417 @@
+/*
+ * QEMU machine helper
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
+#include "hw/riscv/virt.h"
+#include "hw/riscv/boot.h"
+#include "hw/riscv/numa.h"
+#include "hw/riscv/machine_helper.h"
+#include "hw/intc/riscv_imsic.h"
+#include "chardev/char.h"
+#include "sysemu/device_tree.h"
+#include "sysemu/sysemu.h"
+#include "hw/pci/pci.h"
+#include "hw/pci-host/gpex.h"
+#include "hw/display/ramfb.h"
+
+static inline DeviceState *__gpex_pcie_common(MemoryRegion *sys_mem,
+                                              PcieInitData *data)
+{
+    DeviceState *dev;
+    MemoryRegion *ecam_alias, *ecam_reg;
+    MemoryRegion *mmio_alias, *high_mmio_alias, *mmio_reg;
+
+    dev = qdev_new(TYPE_GPEX_HOST);
+
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    ecam_alias = g_new0(MemoryRegion, 1);
+    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
+                             ecam_reg, 0, data->pcie_ecam.size);
+    memory_region_add_subregion(get_system_memory(), data->pcie_ecam.base,
+                                ecam_alias);
+
+    mmio_alias = g_new0(MemoryRegion, 1);
+    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
+    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
+                             mmio_reg, data->pcie_mmio.base,
+                             data->pcie_mmio.size);
+    memory_region_add_subregion(get_system_memory(), data->pcie_mmio.base,
+                                mmio_alias);
+
+    /* Map high MMIO space */
+    high_mmio_alias = g_new0(MemoryRegion, 1);
+    memory_region_init_alias(high_mmio_alias, OBJECT(dev), "pcie-mmio-high",
+                             mmio_reg, data->pcie_high_mmio.base,
+                             data->pcie_high_mmio.size);
+    memory_region_add_subregion(get_system_memory(), data->pcie_high_mmio.base,
+                                high_mmio_alias);
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, data->pcie_pio.base);
+
+    return dev;
+}
+
+DeviceState *riscv_gpex_pcie_msi_init(MemoryRegion *sys_mem,
+                                      PcieInitData *data)
+{
+    return __gpex_pcie_common(sys_mem, data);
+}
+
+DeviceState *riscv_gpex_pcie_intx_init(MemoryRegion *sys_mem,
+                                       PcieInitData *data, DeviceState *irqchip)
+{
+    qemu_irq irq;
+    int i;
+    DeviceState *dev;
+
+    dev = __gpex_pcie_common(sys_mem, data);
+    for (i = 0; i < GPEX_NUM_IRQS; i++) {
+        irq = qdev_get_gpio_in(irqchip, PCIE_IRQ + i);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
+        gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
+    }
+
+    return dev;
+}
+
+uint32_t riscv_imsic_num_bits(uint32_t count)
+{
+    uint32_t ret = 0;
+
+    while (BIT(ret) < count) {
+        ret++;
+    }
+
+    return ret;
+}
+
+void riscv_create_fdt_imsic(MachineState *mc, RISCVHartArrayState *soc,
+                            uint32_t *phandle, uint32_t *intc_phandles,
+                            uint32_t *msi_m_phandle, uint32_t *msi_s_phandle,
+                            ImsicInitData *data)
+{
+    int cpu, socket;
+    char *imsic_name;
+    uint32_t imsic_max_hart_per_socket, imsic_guest_bits;
+    uint32_t *imsic_cells, *imsic_regs, imsic_addr, imsic_size;
+
+    *msi_m_phandle = (*phandle)++;
+    *msi_s_phandle = (*phandle)++;
+    imsic_cells = g_new0(uint32_t, mc->smp.cpus * 2);
+    imsic_regs = g_new0(uint32_t, riscv_socket_count(mc) * 4);
+
+    /* M-level IMSIC node */
+    for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
+        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
+    }
+    imsic_max_hart_per_socket = 0;
+    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+        imsic_addr = data->imsic_m.base + socket * data->group_max_size;
+        imsic_size = IMSIC_HART_SIZE(0) * soc[socket].num_harts;
+        imsic_regs[socket * 4 + 0] = 0;
+        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
+        imsic_regs[socket * 4 + 2] = 0;
+        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
+        if (imsic_max_hart_per_socket < soc[socket].num_harts) {
+            imsic_max_hart_per_socket = soc[socket].num_harts;
+        }
+    }
+    imsic_name = g_strdup_printf("/soc/imsics@%lx",
+        (unsigned long)data->imsic_m.base);
+    qemu_fdt_add_subnode(mc->fdt, imsic_name);
+    qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible",
+        "riscv,imsics");
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
+        FDT_IMSIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
+        imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
+        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
+        data->num_msi);
+    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
+        data->ipi_msi);
+    if (riscv_socket_count(mc) > 1) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
+            riscv_imsic_num_bits(imsic_max_hart_per_socket));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
+            riscv_imsic_num_bits(riscv_socket_count(mc)));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-shift",
+            IMSIC_MMIO_GROUP_MIN_SHIFT);
+    }
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle);
+    g_free(imsic_name);
+
+    /* S-level IMSIC node */
+    for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
+        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
+    }
+    imsic_guest_bits = riscv_imsic_num_bits(data->num_guests + 1);
+    imsic_max_hart_per_socket = 0;
+    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+        imsic_addr = data->imsic_s.base + socket * data->group_max_size;
+        imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
+                     soc[socket].num_harts;
+        imsic_regs[socket * 4 + 0] = 0;
+        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
+        imsic_regs[socket * 4 + 2] = 0;
+        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
+        if (imsic_max_hart_per_socket < soc[socket].num_harts) {
+            imsic_max_hart_per_socket = soc[socket].num_harts;
+        }
+    }
+    imsic_name = g_strdup_printf("/soc/imsics@%lx",
+        (unsigned long)data->imsic_s.base);
+    qemu_fdt_add_subnode(mc->fdt, imsic_name);
+    qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible", "riscv,imsics");
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
+                          FDT_IMSIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller", NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
+        imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
+        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids", data->num_msi);
+    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id", data->ipi_msi);
+    if (imsic_guest_bits) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,guest-index-bits",
+            imsic_guest_bits);
+    }
+    if (riscv_socket_count(mc) > 1) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
+            riscv_imsic_num_bits(imsic_max_hart_per_socket));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
+            riscv_imsic_num_bits(riscv_socket_count(mc)));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-shift",
+            IMSIC_MMIO_GROUP_MIN_SHIFT);
+    }
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_s_phandle);
+    g_free(imsic_name);
+
+    g_free(imsic_regs);
+    g_free(imsic_cells);
+}
+
+static void create_pcie_irq_map(void *fdt, char *nodename,
+                                uint32_t irqchip_phandle,
+                                RISCV_IRQ_TYPE irq_type)
+{
+    int pin, dev;
+    uint32_t irq_map_stride = 0;
+    uint32_t full_irq_map[GPEX_NUM_IRQS * GPEX_NUM_IRQS *
+                          FDT_MAX_INT_MAP_WIDTH] = {};
+    uint32_t *irq_map = full_irq_map;
+
+    /* This code creates a standard swizzle of interrupts such that
+     * each device's first interrupt is based on it's PCI_SLOT number.
+     * (See pci_swizzle_map_irq_fn())
+     *
+     * We only need one entry per interrupt in the table (not one per
+     * possible slot) seeing the interrupt-map-mask will allow the table
+     * to wrap to any number of devices.
+     */
+    for (dev = 0; dev < GPEX_NUM_IRQS; dev++) {
+        int devfn = dev * 0x8;
+
+        for (pin = 0; pin < GPEX_NUM_IRQS; pin++) {
+            int irq_nr = PCIE_IRQ + ((pin + PCI_SLOT(devfn)) % GPEX_NUM_IRQS);
+            int i = 0;
+
+            /* Fill PCI address cells */
+            irq_map[i] = cpu_to_be32(devfn << 8);
+            i += FDT_PCI_ADDR_CELLS;
+
+            /* Fill PCI Interrupt cells */
+            irq_map[i] = cpu_to_be32(pin + 1);
+            i += FDT_PCI_INT_CELLS;
+
+            /* Fill interrupt controller phandle and cells */
+            irq_map[i++] = cpu_to_be32(irqchip_phandle);
+            irq_map[i++] = cpu_to_be32(irq_nr);
+            if (irq_type != RISCV_IRQ_WIRED_PLIC) {
+                irq_map[i++] = cpu_to_be32(0x4);
+            }
+
+            if (!irq_map_stride) {
+                irq_map_stride = i;
+            }
+            irq_map += irq_map_stride;
+        }
+    }
+
+    qemu_fdt_setprop(fdt, nodename, "interrupt-map", full_irq_map,
+                     GPEX_NUM_IRQS * GPEX_NUM_IRQS *
+                     irq_map_stride * sizeof(uint32_t));
+
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-map-mask",
+                           0x1800, 0, 0, 0x7);
+}
+
+RISCV_IRQ_TYPE riscv_get_irq_type(RISCVVirtAIAType virt_aia_type)
+{
+    int irq_type = RISCV_IRQ_INVALID;
+
+    switch (virt_aia_type) {
+    case VIRT_AIA_TYPE_NONE:
+        irq_type = RISCV_IRQ_WIRED_PLIC;
+        break;
+    case VIRT_AIA_TYPE_APLIC:
+        irq_type = RISCV_IRQ_WIRED_APLIC;
+        break;
+    case VIRT_AIA_TYPE_APLIC_IMSIC:
+        irq_type = RISCV_IRQ_WIRED_MSI;
+        break;
+    }
+
+    return irq_type;
+}
+
+void riscv_create_fdt_pcie(MachineState *mc, const PcieInitData *data,
+                           uint32_t irq_pcie_phandle, uint32_t msi_pcie_phandle)
+{
+    char *name;
+    RISCV_IRQ_TYPE irq_type = data->irq_type;
+
+    name = g_strdup_printf("/soc/pci@%lx",
+        (long) data->pcie_ecam.base);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#address-cells",
+        FDT_PCI_ADDR_CELLS);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells",
+        FDT_PCI_INT_CELLS);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#size-cells", 0x2);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+        "pci-host-ecam-generic");
+    qemu_fdt_setprop_string(mc->fdt, name, "device_type", "pci");
+    qemu_fdt_setprop_cell(mc->fdt, name, "linux,pci-domain", 0);
+    qemu_fdt_setprop_cells(mc->fdt, name, "bus-range", 0,
+        data->pcie_ecam.size / PCIE_MMCFG_SIZE_MIN - 1);
+    qemu_fdt_setprop(mc->fdt, name, "dma-coherent", NULL, 0);
+    if (irq_type == RISCV_IRQ_MSI_ONLY || irq_type == RISCV_IRQ_WIRED_MSI) {
+        qemu_fdt_setprop_cell(mc->fdt, name, "msi-parent", msi_pcie_phandle);
+    }
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0,
+        data->pcie_ecam.base, 0, data->pcie_ecam.size);
+    qemu_fdt_setprop_sized_cells(mc->fdt, name, "ranges",
+        1, FDT_PCI_RANGE_IOPORT, 2, 0,
+        2, data->pcie_pio.base, 2, data->pcie_pio.size,
+        1, FDT_PCI_RANGE_MMIO,
+        2, data->pcie_mmio.base,
+        2, data->pcie_mmio.base, 2, data->pcie_mmio.size,
+        1, FDT_PCI_RANGE_MMIO_64BIT,
+        2, data->pcie_high_mmio.base,
+        2, data->pcie_high_mmio.base, 2, data->pcie_high_mmio.size);
+
+    if (irq_type != RISCV_IRQ_MSI_ONLY) {
+        create_pcie_irq_map(mc->fdt, name, irq_pcie_phandle, irq_type);
+    }
+    g_free(name);
+}
+
+void riscv_create_fdt_socket_cpus(MachineState *mc, RISCVHartArrayState *soc,
+                                  int socket, char *clust_name,
+                                  uint32_t *phandle, bool is_32_bit,
+                                  uint32_t *intc_phandles)
+{
+    int cpu;
+    uint32_t cpu_phandle;
+    char *name, *cpu_name, *core_name, *intc_name;
+
+    for (cpu = soc[socket].num_harts - 1; cpu >= 0; cpu--) {
+        cpu_phandle = (*phandle)++;
+
+        cpu_name = g_strdup_printf("/cpus/cpu@%d",
+            soc[socket].hartid_base + cpu);
+        qemu_fdt_add_subnode(mc->fdt, cpu_name);
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
+            (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
+        name = riscv_isa_string(&soc[socket].harts[cpu]);
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
+        g_free(name);
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "compatible", "riscv");
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "status", "okay");
+        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "reg",
+            soc[socket].hartid_base + cpu);
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "device_type", "cpu");
+        riscv_socket_fdt_write_id(mc, mc->fdt, cpu_name, socket);
+        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "phandle", cpu_phandle);
+
+        intc_phandles[cpu] = (*phandle)++;
+
+        intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
+        qemu_fdt_add_subnode(mc->fdt, intc_name);
+        qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
+            intc_phandles[cpu]);
+        if (riscv_feature(&soc[socket].harts[cpu].env, RISCV_FEATURE_AIA)) {
+            static const char * const compat[2] = {
+                "riscv,cpu-intc-aia", "riscv,cpu-intc"
+            };
+            qemu_fdt_setprop_string_array(mc->fdt, intc_name, "compatible",
+                                      (char **)&compat, ARRAY_SIZE(compat));
+        } else {
+            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
+                "riscv,cpu-intc");
+        }
+        qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
+        qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
+
+        core_name = g_strdup_printf("%s/core%d", clust_name, cpu);
+        qemu_fdt_add_subnode(mc->fdt, core_name);
+        qemu_fdt_setprop_cell(mc->fdt, core_name, "cpu", cpu_phandle);
+
+        g_free(core_name);
+        g_free(intc_name);
+        g_free(cpu_name);
+    }
+}
+
+void riscv_create_fdt_socket_memory(MachineState *mc, hwaddr dram_base,
+                                    int socket)
+{
+    char *mem_name;
+    uint64_t addr, size;
+
+    addr = dram_base + riscv_socket_mem_offset(mc, socket);
+    size = riscv_socket_mem_size(mc, socket);
+    mem_name = g_strdup_printf("/memory@%lx", (long)addr);
+    qemu_fdt_add_subnode(mc->fdt, mem_name);
+   qemu_fdt_setprop_cells(mc->fdt, mem_name, "reg",
+        addr >> 32, addr, size >> 32, size);
+    qemu_fdt_setprop_string(mc->fdt, mem_name, "device_type", "memory");
+    riscv_socket_fdt_write_id(mc, mc->fdt, mem_name, socket);
+    g_free(mem_name);
+}
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index ab6cae57eae5..b3ae84ac0539 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -2,6 +2,7 @@ riscv_ss = ss.source_set()
 riscv_ss.add(files('boot.c'), fdt)
 riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
 riscv_ss.add(files('riscv_hart.c'))
+riscv_ss.add(files('machine_helper.c'))
 riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
 riscv_ss.add(when: 'CONFIG_SHAKTI_C', if_true: files('shakti_c.c'))
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index da50cbed43ec..5999395e5bf9 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -30,6 +30,7 @@
 #include "target/riscv/cpu.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/virt.h"
+#include "hw/riscv/machine_helper.h"
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
 #include "hw/intc/riscv_aclint.h"
@@ -161,136 +162,6 @@ static void virt_flash_map(RISCVVirtState *s,
                     sysmem);
 }
 
-static void create_pcie_irq_map(RISCVVirtState *s, void *fdt, char *nodename,
-                                uint32_t irqchip_phandle)
-{
-    int pin, dev;
-    uint32_t irq_map_stride = 0;
-    uint32_t full_irq_map[GPEX_NUM_IRQS * GPEX_NUM_IRQS *
-                          FDT_MAX_INT_MAP_WIDTH] = {};
-    uint32_t *irq_map = full_irq_map;
-
-    /* This code creates a standard swizzle of interrupts such that
-     * each device's first interrupt is based on it's PCI_SLOT number.
-     * (See pci_swizzle_map_irq_fn())
-     *
-     * We only need one entry per interrupt in the table (not one per
-     * possible slot) seeing the interrupt-map-mask will allow the table
-     * to wrap to any number of devices.
-     */
-    for (dev = 0; dev < GPEX_NUM_IRQS; dev++) {
-        int devfn = dev * 0x8;
-
-        for (pin = 0; pin < GPEX_NUM_IRQS; pin++) {
-            int irq_nr = PCIE_IRQ + ((pin + PCI_SLOT(devfn)) % GPEX_NUM_IRQS);
-            int i = 0;
-
-            /* Fill PCI address cells */
-            irq_map[i] = cpu_to_be32(devfn << 8);
-            i += FDT_PCI_ADDR_CELLS;
-
-            /* Fill PCI Interrupt cells */
-            irq_map[i] = cpu_to_be32(pin + 1);
-            i += FDT_PCI_INT_CELLS;
-
-            /* Fill interrupt controller phandle and cells */
-            irq_map[i++] = cpu_to_be32(irqchip_phandle);
-            irq_map[i++] = cpu_to_be32(irq_nr);
-            if (s->aia_type != VIRT_AIA_TYPE_NONE) {
-                irq_map[i++] = cpu_to_be32(0x4);
-            }
-
-            if (!irq_map_stride) {
-                irq_map_stride = i;
-            }
-            irq_map += irq_map_stride;
-        }
-    }
-
-    qemu_fdt_setprop(fdt, nodename, "interrupt-map", full_irq_map,
-                     GPEX_NUM_IRQS * GPEX_NUM_IRQS *
-                     irq_map_stride * sizeof(uint32_t));
-
-    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-map-mask",
-                           0x1800, 0, 0, 0x7);
-}
-
-static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
-                                   char *clust_name, uint32_t *phandle,
-                                   bool is_32_bit, uint32_t *intc_phandles)
-{
-    int cpu;
-    uint32_t cpu_phandle;
-    MachineState *mc = MACHINE(s);
-    char *name, *cpu_name, *core_name, *intc_name;
-
-    for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
-        cpu_phandle = (*phandle)++;
-
-        cpu_name = g_strdup_printf("/cpus/cpu@%d",
-            s->soc[socket].hartid_base + cpu);
-        qemu_fdt_add_subnode(mc->fdt, cpu_name);
-        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
-            (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
-        name = riscv_isa_string(&s->soc[socket].harts[cpu]);
-        qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
-        g_free(name);
-        qemu_fdt_setprop_string(mc->fdt, cpu_name, "compatible", "riscv");
-        qemu_fdt_setprop_string(mc->fdt, cpu_name, "status", "okay");
-        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "reg",
-            s->soc[socket].hartid_base + cpu);
-        qemu_fdt_setprop_string(mc->fdt, cpu_name, "device_type", "cpu");
-        riscv_socket_fdt_write_id(mc, mc->fdt, cpu_name, socket);
-        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "phandle", cpu_phandle);
-
-        intc_phandles[cpu] = (*phandle)++;
-
-        intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
-        qemu_fdt_add_subnode(mc->fdt, intc_name);
-        qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
-            intc_phandles[cpu]);
-        if (riscv_feature(&s->soc[socket].harts[cpu].env,
-                          RISCV_FEATURE_AIA)) {
-            static const char * const compat[2] = {
-                "riscv,cpu-intc-aia", "riscv,cpu-intc"
-            };
-            qemu_fdt_setprop_string_array(mc->fdt, intc_name, "compatible",
-                                      (char **)&compat, ARRAY_SIZE(compat));
-        } else {
-            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
-                "riscv,cpu-intc");
-        }
-        qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
-        qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
-
-        core_name = g_strdup_printf("%s/core%d", clust_name, cpu);
-        qemu_fdt_add_subnode(mc->fdt, core_name);
-        qemu_fdt_setprop_cell(mc->fdt, core_name, "cpu", cpu_phandle);
-
-        g_free(core_name);
-        g_free(intc_name);
-        g_free(cpu_name);
-    }
-}
-
-static void create_fdt_socket_memory(RISCVVirtState *s,
-                                     const MemMapEntry *memmap, int socket)
-{
-    char *mem_name;
-    uint64_t addr, size;
-    MachineState *mc = MACHINE(s);
-
-    addr = memmap[VIRT_DRAM].base + riscv_socket_mem_offset(mc, socket);
-    size = riscv_socket_mem_size(mc, socket);
-    mem_name = g_strdup_printf("/memory@%lx", (long)addr);
-    qemu_fdt_add_subnode(mc->fdt, mem_name);
-    qemu_fdt_setprop_cells(mc->fdt, mem_name, "reg",
-        addr >> 32, addr, size >> 32, size);
-    qemu_fdt_setprop_string(mc->fdt, mem_name, "device_type", "memory");
-    riscv_socket_fdt_write_id(mc, mc->fdt, mem_name, socket);
-    g_free(mem_name);
-}
-
 static void create_fdt_socket_clint(RISCVVirtState *s,
                                     const MemMapEntry *memmap, int socket,
                                     uint32_t *intc_phandles)
@@ -472,138 +343,6 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     g_free(plic_cells);
 }
 
-static uint32_t imsic_num_bits(uint32_t count)
-{
-    uint32_t ret = 0;
-
-    while (BIT(ret) < count) {
-        ret++;
-    }
-
-    return ret;
-}
-
-static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
-                             uint32_t *phandle, uint32_t *intc_phandles,
-                             uint32_t *msi_m_phandle, uint32_t *msi_s_phandle)
-{
-    int cpu, socket;
-    char *imsic_name;
-    MachineState *mc = MACHINE(s);
-    uint32_t imsic_max_hart_per_socket, imsic_guest_bits;
-    uint32_t *imsic_cells, *imsic_regs, imsic_addr, imsic_size;
-
-    *msi_m_phandle = (*phandle)++;
-    *msi_s_phandle = (*phandle)++;
-    imsic_cells = g_new0(uint32_t, mc->smp.cpus * 2);
-    imsic_regs = g_new0(uint32_t, riscv_socket_count(mc) * 4);
-
-    /* M-level IMSIC node */
-    for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
-        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
-    }
-    imsic_max_hart_per_socket = 0;
-    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
-        imsic_addr = memmap[VIRT_IMSIC_M].base +
-                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
-        imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
-        imsic_regs[socket * 4 + 0] = 0;
-        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
-        imsic_regs[socket * 4 + 2] = 0;
-        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
-        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
-            imsic_max_hart_per_socket = s->soc[socket].num_harts;
-        }
-    }
-    imsic_name = g_strdup_printf("/soc/imsics@%lx",
-        (unsigned long)memmap[VIRT_IMSIC_M].base);
-    qemu_fdt_add_subnode(mc->fdt, imsic_name);
-    qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible",
-        "riscv,imsics");
-    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
-        FDT_IMSIC_INT_CELLS);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller",
-        NULL, 0);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller",
-        NULL, 0);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
-        imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
-        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
-    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
-        VIRT_IRQCHIP_NUM_MSIS);
-    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
-        VIRT_IRQCHIP_IPI_MSI);
-    if (riscv_socket_count(mc) > 1) {
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
-            imsic_num_bits(imsic_max_hart_per_socket));
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
-            imsic_num_bits(riscv_socket_count(mc)));
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-shift",
-            IMSIC_MMIO_GROUP_MIN_SHIFT);
-    }
-    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle);
-    g_free(imsic_name);
-
-    /* S-level IMSIC node */
-    for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
-        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
-    }
-    imsic_guest_bits = imsic_num_bits(s->aia_guests + 1);
-    imsic_max_hart_per_socket = 0;
-    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
-        imsic_addr = memmap[VIRT_IMSIC_S].base +
-                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
-        imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
-                     s->soc[socket].num_harts;
-        imsic_regs[socket * 4 + 0] = 0;
-        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
-        imsic_regs[socket * 4 + 2] = 0;
-        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
-        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
-            imsic_max_hart_per_socket = s->soc[socket].num_harts;
-        }
-    }
-    imsic_name = g_strdup_printf("/soc/imsics@%lx",
-        (unsigned long)memmap[VIRT_IMSIC_S].base);
-    qemu_fdt_add_subnode(mc->fdt, imsic_name);
-    qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible",
-        "riscv,imsics");
-    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
-        FDT_IMSIC_INT_CELLS);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller",
-        NULL, 0);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller",
-        NULL, 0);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
-        imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
-        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
-    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
-        VIRT_IRQCHIP_NUM_MSIS);
-    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
-        VIRT_IRQCHIP_IPI_MSI);
-    if (imsic_guest_bits) {
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,guest-index-bits",
-            imsic_guest_bits);
-    }
-    if (riscv_socket_count(mc) > 1) {
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
-            imsic_num_bits(imsic_max_hart_per_socket));
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
-            imsic_num_bits(riscv_socket_count(mc)));
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-shift",
-            IMSIC_MMIO_GROUP_MIN_SHIFT);
-    }
-    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_s_phandle);
-    g_free(imsic_name);
-
-    g_free(imsic_regs);
-    g_free(imsic_cells);
-}
-
 static void create_fdt_socket_aplic(RISCVVirtState *s,
                                     const MemMapEntry *memmap, int socket,
                                     uint32_t msi_m_phandle,
@@ -699,6 +438,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
     MachineState *mc = MACHINE(s);
     uint32_t msi_m_phandle = 0, msi_s_phandle = 0;
     uint32_t *intc_phandles, xplic_phandles[MAX_NODES];
+    ImsicInitData idata;
 
     qemu_fdt_add_subnode(mc->fdt, "/cpus");
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
@@ -716,10 +456,10 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
         clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
         qemu_fdt_add_subnode(mc->fdt, clust_name);
 
-        create_fdt_socket_cpus(s, socket, clust_name, phandle,
+        riscv_create_fdt_socket_cpus(mc, s->soc, socket, clust_name, phandle,
             is_32_bit, &intc_phandles[phandle_pos]);
 
-        create_fdt_socket_memory(s, memmap, socket);
+        riscv_create_fdt_socket_memory(mc, memmap[VIRT_DRAM].base, socket);
 
         g_free(clust_name);
 
@@ -735,8 +475,17 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
     }
 
     if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
-        create_fdt_imsic(s, memmap, phandle, intc_phandles,
-            &msi_m_phandle, &msi_s_phandle);
+        idata.imsic_m.base = memmap[VIRT_IMSIC_M].base;
+        idata.imsic_m.size = memmap[VIRT_IMSIC_M].size;
+        idata.imsic_s.base = memmap[VIRT_IMSIC_S].base;
+        idata.imsic_s.size = memmap[VIRT_IMSIC_S].size;
+        idata.group_max_size = VIRT_IMSIC_GROUP_MAX_SIZE;
+        idata.num_msi = VIRT_IRQCHIP_NUM_MSIS;
+        idata.ipi_msi = VIRT_IRQCHIP_IPI_MSI;
+        idata.num_guests = s->aia_guests;
+
+        riscv_create_fdt_imsic(mc, s->soc, phandle, intc_phandles,
+            &msi_m_phandle, &msi_s_phandle, &idata);
         *msi_pcie_phandle = msi_s_phandle;
     }
 
@@ -802,47 +551,6 @@ static void create_fdt_virtio(RISCVVirtState *s, const MemMapEntry *memmap,
     }
 }
 
-static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap,
-                            uint32_t irq_pcie_phandle,
-                            uint32_t msi_pcie_phandle)
-{
-    char *name;
-    MachineState *mc = MACHINE(s);
-
-    name = g_strdup_printf("/soc/pci@%lx",
-        (long) memmap[VIRT_PCIE_ECAM].base);
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_cell(mc->fdt, name, "#address-cells",
-        FDT_PCI_ADDR_CELLS);
-    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells",
-        FDT_PCI_INT_CELLS);
-    qemu_fdt_setprop_cell(mc->fdt, name, "#size-cells", 0x2);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible",
-        "pci-host-ecam-generic");
-    qemu_fdt_setprop_string(mc->fdt, name, "device_type", "pci");
-    qemu_fdt_setprop_cell(mc->fdt, name, "linux,pci-domain", 0);
-    qemu_fdt_setprop_cells(mc->fdt, name, "bus-range", 0,
-        memmap[VIRT_PCIE_ECAM].size / PCIE_MMCFG_SIZE_MIN - 1);
-    qemu_fdt_setprop(mc->fdt, name, "dma-coherent", NULL, 0);
-    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
-        qemu_fdt_setprop_cell(mc->fdt, name, "msi-parent", msi_pcie_phandle);
-    }
-    qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0,
-        memmap[VIRT_PCIE_ECAM].base, 0, memmap[VIRT_PCIE_ECAM].size);
-    qemu_fdt_setprop_sized_cells(mc->fdt, name, "ranges",
-        1, FDT_PCI_RANGE_IOPORT, 2, 0,
-        2, memmap[VIRT_PCIE_PIO].base, 2, memmap[VIRT_PCIE_PIO].size,
-        1, FDT_PCI_RANGE_MMIO,
-        2, memmap[VIRT_PCIE_MMIO].base,
-        2, memmap[VIRT_PCIE_MMIO].base, 2, memmap[VIRT_PCIE_MMIO].size,
-        1, FDT_PCI_RANGE_MMIO_64BIT,
-        2, virt_high_pcie_memmap.base,
-        2, virt_high_pcie_memmap.base, 2, virt_high_pcie_memmap.size);
-
-    create_pcie_irq_map(s, mc->fdt, name, irq_pcie_phandle);
-    g_free(name);
-}
-
 static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
                              uint32_t *phandle)
 {
@@ -948,12 +656,26 @@ static void create_fdt_flash(RISCVVirtState *s, const MemMapEntry *memmap)
     g_free(name);
 }
 
+static void copy_memmap_to_pciedata(const MemMapEntry *memmap,
+                                    PcieInitData *pdata)
+{
+    pdata->pcie_ecam.base =  memmap[VIRT_PCIE_ECAM].base;
+    pdata->pcie_ecam.size =  memmap[VIRT_PCIE_ECAM].size;
+    pdata->pcie_pio.base =  memmap[VIRT_PCIE_PIO].base;
+    pdata->pcie_pio.size =  memmap[VIRT_PCIE_PIO].size;
+    pdata->pcie_mmio.base =  memmap[VIRT_PCIE_MMIO].base;
+    pdata->pcie_mmio.size =  memmap[VIRT_PCIE_MMIO].size;
+    pdata->pcie_high_mmio.base = virt_high_pcie_memmap.base;
+    pdata->pcie_high_mmio.size = virt_high_pcie_memmap.size;
+}
+
 static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     MachineState *mc = MACHINE(s);
     uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
     uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
+    PcieInitData pdata;
 
     if (mc->dtb) {
         mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
@@ -987,7 +709,9 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
 
     create_fdt_virtio(s, memmap, irq_virtio_phandle);
 
-    create_fdt_pcie(s, memmap, irq_pcie_phandle, msi_pcie_phandle);
+    pdata.irq_type = riscv_get_irq_type(s->aia_type);
+    copy_memmap_to_pciedata(memmap, &pdata);
+    riscv_create_fdt_pcie(mc, &pdata, irq_pcie_phandle, msi_pcie_phandle);
 
     create_fdt_reset(s, memmap, &phandle);
 
@@ -1003,55 +727,6 @@ update_bootargs:
     }
 }
 
-static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
-                                          hwaddr ecam_base, hwaddr ecam_size,
-                                          hwaddr mmio_base, hwaddr mmio_size,
-                                          hwaddr high_mmio_base,
-                                          hwaddr high_mmio_size,
-                                          hwaddr pio_base,
-                                          DeviceState *irqchip)
-{
-    DeviceState *dev;
-    MemoryRegion *ecam_alias, *ecam_reg;
-    MemoryRegion *mmio_alias, *high_mmio_alias, *mmio_reg;
-    qemu_irq irq;
-    int i;
-
-    dev = qdev_new(TYPE_GPEX_HOST);
-
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
-    ecam_alias = g_new0(MemoryRegion, 1);
-    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
-    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
-                             ecam_reg, 0, ecam_size);
-    memory_region_add_subregion(get_system_memory(), ecam_base, ecam_alias);
-
-    mmio_alias = g_new0(MemoryRegion, 1);
-    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
-    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
-                             mmio_reg, mmio_base, mmio_size);
-    memory_region_add_subregion(get_system_memory(), mmio_base, mmio_alias);
-
-    /* Map high MMIO space */
-    high_mmio_alias = g_new0(MemoryRegion, 1);
-    memory_region_init_alias(high_mmio_alias, OBJECT(dev), "pcie-mmio-high",
-                             mmio_reg, high_mmio_base, high_mmio_size);
-    memory_region_add_subregion(get_system_memory(), high_mmio_base,
-                                high_mmio_alias);
-
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, pio_base);
-
-    for (i = 0; i < GPEX_NUM_IRQS; i++) {
-        irq = qdev_get_gpio_in(irqchip, PCIE_IRQ + i);
-
-        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
-        gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
-    }
-
-    return dev;
-}
-
 static FWCfgState *create_fw_cfg(const MachineState *mc)
 {
     hwaddr base = virt_memmap[VIRT_FW_CFG].base;
@@ -1122,7 +797,7 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
         }
 
         /* Per-socket S-level IMSICs */
-        guest_bits = imsic_num_bits(aia_guests + 1);
+        guest_bits = riscv_imsic_num_bits(aia_guests + 1);
         addr = memmap[VIRT_IMSIC_S].base + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
         for (i = 0; i < hart_count; i++) {
             riscv_imsic_create(addr + i * IMSIC_HART_SIZE(guest_bits),
@@ -1169,6 +844,7 @@ static void virt_machine_init(MachineState *machine)
     uint64_t kernel_entry;
     DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
     int i, base_hartid, hart_count;
+    PcieInitData pdata;
 
     /* Check socket count limit */
     if (VIRT_SOCKETS_MAX < riscv_socket_count(machine)) {
@@ -1392,15 +1068,8 @@ static void virt_machine_init(MachineState *machine)
             qdev_get_gpio_in(DEVICE(virtio_irqchip), VIRTIO_IRQ + i));
     }
 
-    gpex_pcie_init(system_memory,
-                   memmap[VIRT_PCIE_ECAM].base,
-                   memmap[VIRT_PCIE_ECAM].size,
-                   memmap[VIRT_PCIE_MMIO].base,
-                   memmap[VIRT_PCIE_MMIO].size,
-                   virt_high_pcie_memmap.base,
-                   virt_high_pcie_memmap.size,
-                   memmap[VIRT_PCIE_PIO].base,
-                   DEVICE(pcie_irqchip));
+    copy_memmap_to_pciedata(memmap, &pdata);
+    riscv_gpex_pcie_intx_init(system_memory, &pdata, DEVICE(pcie_irqchip));
 
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
diff --git a/include/hw/riscv/machine_helper.h b/include/hw/riscv/machine_helper.h
new file mode 100644
index 000000000000..9029adec941b
--- /dev/null
+++ b/include/hw/riscv/machine_helper.h
@@ -0,0 +1,87 @@
+/*
+ * QEMU RISC-V Machine common helper functions
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
+#ifndef HW_RISCV_MACHINE_HELPER_H
+#define HW_RISCV_MACHINE_HELPER_H
+
+#include "hw/riscv/riscv_hart.h"
+#include "hw/riscv/virt.h"
+#include "hw/sysbus.h"
+#include "qom/object.h"
+#include "exec/memory.h"
+
+#define FDT_PCI_ADDR_CELLS    3
+#define FDT_PCI_INT_CELLS     1
+#define FDT_PLIC_INT_CELLS    1
+#define FDT_APLIC_INT_CELLS   2
+#define FDT_IMSIC_INT_CELLS   0
+#define FDT_MAX_INT_CELLS     2
+#define FDT_MAX_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
+                                 1 + FDT_MAX_INT_CELLS)
+#define FDT_PLIC_INT_MAP_WIDTH  (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
+                                 1 + FDT_PLIC_INT_CELLS)
+#define FDT_APLIC_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
+                                 1 + FDT_APLIC_INT_CELLS)
+
+typedef enum RISCV_IRQ_TYPE {
+    RISCV_IRQ_WIRED_PLIC = 0,
+    RISCV_IRQ_WIRED_APLIC,
+    RISCV_IRQ_WIRED_MSI,
+    RISCV_IRQ_MSI_ONLY,
+    RISCV_IRQ_INVALID
+} RISCV_IRQ_TYPE;
+
+typedef struct ImsicInitData {
+    MemMapEntry imsic_m;
+    MemMapEntry imsic_s;
+    uint32_t group_max_size;
+    uint32_t num_msi;
+    uint32_t ipi_msi;
+    uint32_t num_guests;
+} ImsicInitData;
+
+typedef struct PcieInitData {
+    MemMapEntry pcie_ecam;
+    MemMapEntry pcie_pio;
+    MemMapEntry pcie_mmio;
+    MemMapEntry pcie_high_mmio;
+    RISCV_IRQ_TYPE irq_type;
+} PcieInitData;
+
+uint32_t riscv_imsic_num_bits(uint32_t count);
+void riscv_create_fdt_imsic(MachineState *mc, RISCVHartArrayState *soc,
+                            uint32_t *phandle, uint32_t *intc_phandles,
+                            uint32_t *msi_m_phandle, uint32_t *msi_s_phandle,
+                            ImsicInitData *data);
+void riscv_create_fdt_pcie(MachineState *mc, const PcieInitData *data,
+                           uint32_t irq_pcie_phandle,
+                           uint32_t msi_pcie_phandle);
+DeviceState *riscv_gpex_pcie_intx_init(MemoryRegion *sys_mem,
+                                       PcieInitData *data,
+                                       DeviceState *irqchip);
+DeviceState *riscv_gpex_pcie_msi_init(MemoryRegion *sys_mem,
+                                      PcieInitData *data);
+void riscv_create_fdt_socket_cpus(MachineState *mc, RISCVHartArrayState *soc,
+                                  int socket, char *clust_name,
+                                  uint32_t *phandle, bool is_32_bit,
+                                  uint32_t *intc_phandles);
+void riscv_create_fdt_socket_memory(MachineState *mc, hwaddr dram_base,
+                                    int socket);
+RISCV_IRQ_TYPE riscv_get_irq_type(RISCVVirtAIAType virt_aia_type);
+
+#endif
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 78b058ec8683..2f62e2475653 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -103,17 +103,4 @@ enum {
 #define VIRT_PLIC_SIZE(__num_context) \
     (VIRT_PLIC_CONTEXT_BASE + (__num_context) * VIRT_PLIC_CONTEXT_STRIDE)
 
-#define FDT_PCI_ADDR_CELLS    3
-#define FDT_PCI_INT_CELLS     1
-#define FDT_PLIC_INT_CELLS    1
-#define FDT_APLIC_INT_CELLS   2
-#define FDT_IMSIC_INT_CELLS   0
-#define FDT_MAX_INT_CELLS     2
-#define FDT_MAX_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
-                                 1 + FDT_MAX_INT_CELLS)
-#define FDT_PLIC_INT_MAP_WIDTH  (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
-                                 1 + FDT_PLIC_INT_CELLS)
-#define FDT_APLIC_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
-                                 1 + FDT_APLIC_INT_CELLS)
-
 #endif
-- 
2.25.1


