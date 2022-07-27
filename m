Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGpgi-0003zz-7D
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 18:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oGpgW-0003jH-7d; Wed, 27 Jul 2022 18:39:21 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122]:52728 helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oGpgR-0007ui-Hk; Wed, 27 Jul 2022 18:39:18 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oGpgI-002cR5-0f;
 Wed, 27 Jul 2022 23:39:06 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-arm@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v3 5/5] hw/arm: change to use qemu_fdt_setprop_strings()
Date: Wed, 27 Jul 2022 23:39:05 +0100
Message-Id: <20220727223905.624285-6-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220727223905.624285-1-qemu@ben.fluff.org>
References: <20220727223905.624285-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.15.83.122; envelope-from=ben@luna.fluff.org;
 helo=luna
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, KHOP_HELO_FCRDNS=0.187, PDS_RDNS_DYNAMIC_FP=0.001,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 27 Jul 2022 22:39:23 -0000

Change to using qemu_fdt_setprop_strings() instead of using
\0 separated string arrays.

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
---
 hw/arm/boot.c             |  8 +++---
 hw/arm/virt.c             | 28 +++++++++------------
 hw/arm/xlnx-versal-virt.c | 51 ++++++++++++++++-----------------------
 3 files changed, 37 insertions(+), 50 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..bf29b7ae60 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -490,11 +490,11 @@ static void fdt_add_psci_node(void *fdt)
     qemu_fdt_add_subnode(fdt, "/psci");
     if (armcpu->psci_version >= QEMU_PSCI_VERSION_0_2) {
         if (armcpu->psci_version < QEMU_PSCI_VERSION_1_0) {
-            const char comp[] = "arm,psci-0.2\0arm,psci";
-            qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
+            qemu_fdt_setprop_strings(fdt, "/psci", "compatible",
+                                     "arm,psci-0.2", "arm,psci");     
         } else {
-            const char comp[] = "arm,psci-1.0\0arm,psci-0.2\0arm,psci";
-            qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
+            qemu_fdt_setprop_strings(fdt, "/psci", "compatible",
+                                     "arm,psci-1.0", "arm,psci-0.2", "arm,psci");
         }
 
         cpu_off_fn = QEMU_PSCI_0_2_FN_CPU_OFF;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9633f822f3..2670c13ef1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -343,9 +343,8 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
 
     armcpu = ARM_CPU(qemu_get_cpu(0));
     if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
-        const char compat[] = "arm,armv8-timer\0arm,armv7-timer";
-        qemu_fdt_setprop(ms->fdt, "/timer", "compatible",
-                         compat, sizeof(compat));
+        qemu_fdt_setprop_strings(ms->fdt, "/timer", "compatible",
+                                 "arm,armv8-timer", "arm,armv7-timer");
     } else {
         qemu_fdt_setprop_string(ms->fdt, "/timer", "compatible",
                                 "arm,armv7-timer");
@@ -843,8 +842,6 @@ static void create_uart(const VirtMachineState *vms, int uart,
     hwaddr base = vms->memmap[uart].base;
     hwaddr size = vms->memmap[uart].size;
     int irq = vms->irqmap[uart];
-    const char compat[] = "arm,pl011\0arm,primecell";
-    const char clocknames[] = "uartclk\0apb_pclk";
     DeviceState *dev = qdev_new(TYPE_PL011);
     SysBusDevice *s = SYS_BUS_DEVICE(dev);
     MachineState *ms = MACHINE(vms);
@@ -858,8 +855,8 @@ static void create_uart(const VirtMachineState *vms, int uart,
     nodename = g_strdup_printf("/pl011@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     /* Note that we can't use setprop_string because of the embedded NUL */
-    qemu_fdt_setprop(ms->fdt, nodename, "compatible",
-                         compat, sizeof(compat));
+    qemu_fdt_setprop_strings(ms->fdt, nodename, "compatible",
+                             "arm,pl011", "arm,primecell");
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                      2, base, 2, size);
     qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
@@ -867,8 +864,8 @@ static void create_uart(const VirtMachineState *vms, int uart,
                                GIC_FDT_IRQ_FLAGS_LEVEL_HI);
     qemu_fdt_setprop_cells(ms->fdt, nodename, "clocks",
                                vms->clock_phandle, vms->clock_phandle);
-    qemu_fdt_setprop(ms->fdt, nodename, "clock-names",
-                         clocknames, sizeof(clocknames));
+    qemu_fdt_setprop_strings(ms->fdt, nodename, "clock-names",
+                             "uartclk", "apb_pclk");
 
     if (uart == VIRT_UART) {
         qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", nodename);
@@ -890,14 +887,14 @@ static void create_rtc(const VirtMachineState *vms)
     hwaddr base = vms->memmap[VIRT_RTC].base;
     hwaddr size = vms->memmap[VIRT_RTC].size;
     int irq = vms->irqmap[VIRT_RTC];
-    const char compat[] = "arm,pl031\0arm,primecell";
     MachineState *ms = MACHINE(vms);
 
     sysbus_create_simple("pl031", base, qdev_get_gpio_in(vms->gic, irq));
 
     nodename = g_strdup_printf("/pl031@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
-    qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_strings(ms->fdt, nodename, "compatible",
+                             "arm,pl031", "arm,primecell");
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base, 2, size);
     qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
@@ -983,7 +980,6 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     hwaddr base = vms->memmap[gpio].base;
     hwaddr size = vms->memmap[gpio].size;
     int irq = vms->irqmap[gpio];
-    const char compat[] = "arm,pl061\0arm,primecell";
     SysBusDevice *s;
     MachineState *ms = MACHINE(vms);
 
@@ -1001,7 +997,8 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     qemu_fdt_add_subnode(ms->fdt, nodename);
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base, 2, size);
-    qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_strings(ms->fdt, nodename, "compatible",
+                             "arm,pl061", "arm,primecell");
     qemu_fdt_setprop_cell(ms->fdt, nodename, "#gpio-cells", 2);
     qemu_fdt_setprop(ms->fdt, nodename, "gpio-controller", NULL, 0);
     qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
@@ -1325,7 +1322,6 @@ static void create_smmu(const VirtMachineState *vms,
     int i;
     hwaddr base = vms->memmap[VIRT_SMMU].base;
     hwaddr size = vms->memmap[VIRT_SMMU].size;
-    const char irq_names[] = "eventq\0priq\0cmdq-sync\0gerror";
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
 
@@ -1355,8 +1351,8 @@ static void create_smmu(const VirtMachineState *vms,
             GIC_FDT_IRQ_TYPE_SPI, irq + 2, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
             GIC_FDT_IRQ_TYPE_SPI, irq + 3, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
 
-    qemu_fdt_setprop(ms->fdt, node, "interrupt-names", irq_names,
-                     sizeof(irq_names));
+    qemu_fdt_setprop_strings(ms->fdt, node, "interrupt-names",
+                             "eventq", "priq", "cmdq-sync", "gerror");
 
     qemu_fdt_setprop_cell(ms->fdt, node, "clocks", vms->clock_phandle);
     qemu_fdt_setprop_string(ms->fdt, node, "clock-names", "apb_pclk");
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 37fc9b919c..2cfc11f0b2 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -153,7 +153,6 @@ static void fdt_add_timer_nodes(VersalVirt *s)
 
 static void fdt_add_usb_xhci_nodes(VersalVirt *s)
 {
-    const char clocknames[] = "bus_clk\0ref_clk";
     const char irq_name[] = "dwc_usb3";
     const char compatVersalDWC3[] = "xlnx,versal-dwc3";
     const char compatDWC3[] = "snps,dwc3";
@@ -165,8 +164,8 @@ static void fdt_add_usb_xhci_nodes(VersalVirt *s)
     qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
                                  2, MM_USB2_CTRL_REGS,
                                  2, MM_USB2_CTRL_REGS_SIZE);
-    qemu_fdt_setprop(s->fdt, name, "clock-names",
-                         clocknames, sizeof(clocknames));
+    qemu_fdt_setprop_strings(s->fdt, name, "clock-names",
+                             "bus_clk", "ref_clk");
     qemu_fdt_setprop_cells(s->fdt, name, "clocks",
                                s->phandle.clk_25Mhz, s->phandle.clk_125Mhz);
     qemu_fdt_setprop(s->fdt, name, "ranges", NULL, 0);
@@ -205,8 +204,6 @@ static void fdt_add_uart_nodes(VersalVirt *s)
 {
     uint64_t addrs[] = { MM_UART1, MM_UART0 };
     unsigned int irqs[] = { VERSAL_UART1_IRQ_0, VERSAL_UART0_IRQ_0 };
-    const char compat[] = "arm,pl011\0arm,sbsa-uart";
-    const char clocknames[] = "uartclk\0apb_pclk";
     int i;
 
     for (i = 0; i < ARRAY_SIZE(addrs); i++) {
@@ -215,16 +212,16 @@ static void fdt_add_uart_nodes(VersalVirt *s)
         qemu_fdt_setprop_cell(s->fdt, name, "current-speed", 115200);
         qemu_fdt_setprop_cells(s->fdt, name, "clocks",
                                s->phandle.clk_125Mhz, s->phandle.clk_125Mhz);
-        qemu_fdt_setprop(s->fdt, name, "clock-names",
-                         clocknames, sizeof(clocknames));
+        qemu_fdt_setprop_strings(s->fdt, name, "clock-names",
+                                 "uartclk", "apb_pclk");
 
         qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
                                GIC_FDT_IRQ_TYPE_SPI, irqs[i],
                                GIC_FDT_IRQ_FLAGS_LEVEL_HI);
         qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
                                      2, addrs[i], 2, 0x1000);
-        qemu_fdt_setprop(s->fdt, name, "compatible",
-                         compat, sizeof(compat));
+        qemu_fdt_setprop_strings(s->fdt, name, "compatible",
+                                 "arm,pl011", "arm,sbsa-uart");
         qemu_fdt_setprop(s->fdt, name, "u-boot,dm-pre-reloc", NULL, 0);
 
         if (addrs[i] == MM_UART0) {
@@ -251,8 +248,6 @@ static void fdt_add_gem_nodes(VersalVirt *s)
 {
     uint64_t addrs[] = { MM_GEM1, MM_GEM0 };
     unsigned int irqs[] = { VERSAL_GEM1_IRQ_0, VERSAL_GEM0_IRQ_0 };
-    const char clocknames[] = "pclk\0hclk\0tx_clk\0rx_clk";
-    const char compat_gem[] = "cdns,zynqmp-gem\0cdns,gem";
     int i;
 
     for (i = 0; i < ARRAY_SIZE(addrs); i++) {
@@ -266,8 +261,8 @@ static void fdt_add_gem_nodes(VersalVirt *s)
         qemu_fdt_setprop_cells(s->fdt, name, "clocks",
                                s->phandle.clk_25Mhz, s->phandle.clk_25Mhz,
                                s->phandle.clk_125Mhz, s->phandle.clk_125Mhz);
-        qemu_fdt_setprop(s->fdt, name, "clock-names",
-                         clocknames, sizeof(clocknames));
+        qemu_fdt_setprop_strings(s->fdt, name, "clock-names",
+                                 "pclk", "hclk","tx_clk", "rx_clk");
         qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
                                GIC_FDT_IRQ_TYPE_SPI, irqs[i],
                                GIC_FDT_IRQ_FLAGS_LEVEL_HI,
@@ -275,8 +270,8 @@ static void fdt_add_gem_nodes(VersalVirt *s)
                                GIC_FDT_IRQ_FLAGS_LEVEL_HI);
         qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
                                      2, addrs[i], 2, 0x1000);
-        qemu_fdt_setprop(s->fdt, name, "compatible",
-                         compat_gem, sizeof(compat_gem));
+        qemu_fdt_setprop_strings(s->fdt, name, "compatible",
+                                 "cdns,zynqmp-gem", "cdns,gem");
         qemu_fdt_setprop_cell(s->fdt, name, "#address-cells", 1);
         qemu_fdt_setprop_cell(s->fdt, name, "#size-cells", 0);
         g_free(name);
@@ -285,8 +280,6 @@ static void fdt_add_gem_nodes(VersalVirt *s)
 
 static void fdt_add_zdma_nodes(VersalVirt *s)
 {
-    const char clocknames[] = "clk_main\0clk_apb";
-    const char compat[] = "xlnx,zynqmp-dma-1.0";
     int i;
 
     for (i = XLNX_VERSAL_NR_ADMAS - 1; i >= 0; i--) {
@@ -298,22 +291,21 @@ static void fdt_add_zdma_nodes(VersalVirt *s)
         qemu_fdt_setprop_cell(s->fdt, name, "xlnx,bus-width", 64);
         qemu_fdt_setprop_cells(s->fdt, name, "clocks",
                                s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
-        qemu_fdt_setprop(s->fdt, name, "clock-names",
-                         clocknames, sizeof(clocknames));
+        qemu_fdt_setprop_strings(s->fdt, name, "clock-names",
+                                 "clk_main", "clk_apb");
         qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
                                GIC_FDT_IRQ_TYPE_SPI, VERSAL_ADMA_IRQ_0 + i,
                                GIC_FDT_IRQ_FLAGS_LEVEL_HI);
         qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
                                      2, addr, 2, 0x1000);
-        qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+        qemu_fdt_setprop_string(s->fdt, name, "compatible",
+                                "xlnx,zynqmp-dma-1.0");
         g_free(name);
     }
 }
 
 static void fdt_add_sd_nodes(VersalVirt *s)
 {
-    const char clocknames[] = "clk_xin\0clk_ahb";
-    const char compat[] = "arasan,sdhci-8.9a";
     int i;
 
     for (i = ARRAY_SIZE(s->soc.pmc.iou.sd) - 1; i >= 0; i--) {
@@ -324,22 +316,21 @@ static void fdt_add_sd_nodes(VersalVirt *s)
 
         qemu_fdt_setprop_cells(s->fdt, name, "clocks",
                                s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
-        qemu_fdt_setprop(s->fdt, name, "clock-names",
-                         clocknames, sizeof(clocknames));
+        qemu_fdt_setprop_strings(s->fdt, name, "clock-names",
+                                 "clk_xin", "clk_ahb");
         qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
                                GIC_FDT_IRQ_TYPE_SPI, VERSAL_SD0_IRQ_0 + i * 2,
                                GIC_FDT_IRQ_FLAGS_LEVEL_HI);
         qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
                                      2, addr, 2, MM_PMC_SD0_SIZE);
-        qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+        qemu_fdt_setprop_string(s->fdt, name, "compatible",
+                                "arasan,sdhci-8.9a");
         g_free(name);
     }
 }
 
 static void fdt_add_rtc_node(VersalVirt *s)
 {
-    const char compat[] = "xlnx,zynqmp-rtc";
-    const char interrupt_names[] = "alarm\0sec";
     char *name = g_strdup_printf("/rtc@%x", MM_PMC_RTC);
 
     qemu_fdt_add_subnode(s->fdt, name);
@@ -349,11 +340,11 @@ static void fdt_add_rtc_node(VersalVirt *s)
                            GIC_FDT_IRQ_FLAGS_LEVEL_HI,
                            GIC_FDT_IRQ_TYPE_SPI, VERSAL_RTC_SECONDS_IRQ,
                            GIC_FDT_IRQ_FLAGS_LEVEL_HI);
-    qemu_fdt_setprop(s->fdt, name, "interrupt-names",
-                     interrupt_names, sizeof(interrupt_names));
+    qemu_fdt_setprop_strings(s->fdt, name, "interrupt-names",
+                             "alarm", "sec");
     qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
                                  2, MM_PMC_RTC, 2, MM_PMC_RTC_SIZE);
-    qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_string(s->fdt, name, "compatible", "xlnx,zynqmp-rtc");
     g_free(name);
 }
 
-- 
2.35.1


