Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB99C43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 12:29:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfGXE-0001nq-2z; Thu, 02 Jul 2026 08:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yfliu2008@qq.com>) id 1wfGXB-0001nH-7l
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 08:28:50 -0400
Received: from out203-205-221-239.mail.qq.com ([203.205.221.239])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yfliu2008@qq.com>) id 1wfGX8-0002xW-8q
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 08:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1782995317; bh=RiFgciQA3M+IJVq0hkzAXpzV8ZJ++rWFjIm3UOgjLFM=;
 h=From:To:Cc:Subject:Date;
 b=ZWQ47d6bxJZHKXRKnnA11Ad4Znv9tpBvcDomowGbzmRIFDcmiR2QcqhVo2ocTKXbA
 q1s8ixXY3wklNQFEWUXEDlzjuBRXHNaVaDlbSpC1JH+ZVMO4eo/wqNebWjUKPLAwfn
 CdfSrHs8QJYLVtCMu43NLxoib+zcnaiAnlQ0jgqI=
Received: from qq.com ([118.116.35.199])
 by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
 id 54E28C1E; Thu, 02 Jul 2026 20:21:14 +0800
X-QQ-mid: xmsmtpt1782994874tr10ehu1p
Message-ID: <tencent_2BD6F6903EE729FD5CC8E4DDDB1EE4A59809@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5ZxK60Du8R7Z5g6Qm3TAIcTJoxX9YBy+WMxesLQwDQDseippyjt
 mV8IFTn0t5o1wbzRC/2tTBLRbszLRHFbel+EXzvKyJAWxTxtNawqGoexKTTcXHqeJ5LkG5vdBSoo
 NtzLJwg9XEUznDpaQGLZCj1PX8ahCpv4e5I/KcvJ3WzLDoq5nYXaxCahcFlSZHu71DYg6xUVX1iC
 XBzvEKqKNAmoUjZ2cZ3oTK5m8b/ZYwKWjiP1q8FA8Pmu7eTuyFqNCMgAen3lFhs2JzinNaq3F1b1
 Z23qbm6V4rFxR00LubnLUTe5wfn+GMCeC1TsofUJXibfRQQwXGC7v0N1t52lh2bc/fBulT93a29M
 HUYbnoqpX4PB7U7HoywsOiSrafTysSHMf0ObbfPMm6lpb8L1ct2QCxBj/DBPH0YVNaYPC2CikZx7
 BvF4/xmgIAWzlEc0PVqkeo54zLeqF7ylioE16bNdbSEErMT8dhxCMMUkY2GE+YfmY+/fgOSxDXPK
 DWeWr6dFszOOFvLpZ5jw0dMQEziDwucDB3up2n4FbDILGVxljxc1oQoO3AxJaH143KYbK8evhfM+
 PrSm01SSLfw1AbX3WKxX75JSbjKgIRNO5KABbReXoBVqw5humUuiPrcJeMwrFAGYebLeZCaG0ztN
 pu+PCn9Ii7fKOB0+dOqB+PqJIcaCTazbPE5lOD4hQUsYCtNfHjK1Rkjwovd3crLGmd494b/GUiyo
 kzD2Z0hXMFuZ2YIEiu4rViJ0O3K0e63SzbmmQZyprBoof5gq46KZAg7Z0XQIOnzpWlEVSt142G6R
 E4d3TMjHay+bRMsPXihSqc6sziv+Mso6WJEMHUvu5PjVjK/0tqJkOU/Ic1FGp3wgHr/znx906m52
 10KUgnRVEgwCYZ0UJnwFDaWT6Ur6k2WloiztrpBJ47UPUVy8i8iqz6mbrtUjC00bxbBjvRT5NQWp
 NkMPnmPp5Ep6H/hVUR5HExU8KPUpIK3F2+Rha0qaW8pYcQLrlSImqADW4MFXl4qnEUk1fEjGsvTk
 Pl0cnVrkOHmNmzX8H8iwxKoyjAN/a2j3491uIgujSy6Xadc0+f
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Yanfeng Liu <yfliu2008@qq.com>
To: qemu-riscv@nongnu.org,
	peter.maydell@linaro.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 Yanfeng Liu <yfliu2008@qq.com>
Subject: [PATCH v2] riscv/virt: Add optional UART1
Date: Thu,  2 Jul 2026 20:21:05 +0800
X-OQ-MSGID: <20260702122105.2529-1-yfliu2008@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.205.221.239; envelope-from=yfliu2008@qq.com;
 helo=out203-205-221-239.mail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HELO_STATIC_HOST=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This adds optional UART1 to RiscV virt board if required at
runtime to simplify multicore development.

Note that UART0 remains default serial_hd(0) and it is:

- the lowest address UART
- first serial in DTB
- behind /aliases/serial0 in DTB
- the /chosen/stdout-path in DTB

Signed-off-by: Yanfeng Liu <yfliu2008@qq.com>
---
 docs/system/riscv/virt.rst |  5 ++++-
 hw/riscv/virt-acpi-build.c | 12 ++++++++----
 hw/riscv/virt.c            | 39 ++++++++++++++++++++++++++++----------
 include/hw/riscv/virt.h    |  3 +++
 4 files changed, 44 insertions(+), 15 deletions(-)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index 60850970ce..45ac63ac77 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -16,7 +16,7 @@ The ``virt`` machine supports the following devices:
 * Core Local Interruptor (CLINT)
 * Platform-Level Interrupt Controller (PLIC)
 * CFI parallel NOR flash memory
-* 1 NS16550 compatible UART
+* Either 1 or 2 NS16550 compatible UARTs
 * 1 Google Goldfish RTC
 * 1 SiFive Test device
 * 8 virtio-mmio transport devices
@@ -27,6 +27,9 @@ The hypervisor extension has been enabled for the default CPU, so virtual
 machines with hypervisor extension can simply be used without explicitly
 declaring.
 
+The second UART only exists if a backend is configured explicitly (e.g.
+with a second `-serial` command line option).
+
 Hardware configuration information
 ----------------------------------
 
diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 413d47d70e..597751c84a 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -169,11 +169,11 @@ static void acpi_dsdt_add_plic_aplic(Aml *scope, uint8_t socket_count,
 
 static void
 acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
-                    uint32_t uart_irq)
+                    uint32_t uart_irq, int uartidx)
 {
-    Aml *dev = aml_device("COM0");
+    Aml *dev = aml_device("COM%d", uartidx);
     aml_append(dev, aml_name_decl("_HID", aml_string("RSCV0003")));
-    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+    aml_append(dev, aml_name_decl("_UID", aml_int(uartidx)));
 
     Aml *crs = aml_resource_template();
     aml_append(crs, aml_memory32_fixed(uart_memmap->base,
@@ -479,7 +479,11 @@ static void build_dsdt(GArray *table_data,
                                  memmap[VIRT_APLIC_S].size, "RSCV0002");
     }
 
-    acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0], UART0_IRQ);
+    acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0], UART0_IRQ, 0);
+    if (s->uart1_present) {
+        acpi_dsdt_add_uart(scope, &memmap[VIRT_UART1], UART1_IRQ, 1);
+    }
+
     if (virt_is_iommu_sys_enabled(s)) {
         acpi_dsdt_add_iommu_sys(scope, &memmap[VIRT_IOMMU_SYS], IOMMU_SYS_IRQ);
     }
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 33775a61fd..9a112ccdef 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -96,6 +96,7 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_APLIC_S] =      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
     [VIRT_UART0] =        { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
+    [VIRT_UART1] =        { 0x1000a000,         0x100 },
     [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
     [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
     [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
@@ -186,7 +187,8 @@ static void create_pcie_irq_map(RISCVVirtState *s, void *fdt, char *nodename,
                           FDT_MAX_INT_MAP_WIDTH] = {};
     uint32_t *irq_map = full_irq_map;
 
-    /* This code creates a standard swizzle of interrupts such that
+    /*
+     * This code creates a standard swizzle of interrupts such that
      * each device's first interrupt is based on it's PCI_SLOT number.
      * (See pci_swizzle_map_irq_fn())
      *
@@ -832,28 +834,38 @@ static void create_fdt_reset(RISCVVirtState *s, uint32_t *phandle)
 }
 
 static void create_fdt_uart(RISCVVirtState *s,
-                            uint32_t irq_mmio_phandle)
+                            uint32_t irq_mmio_phandle, int memId, int irqNo)
 {
     g_autofree char *name = NULL;
     MachineState *ms = MACHINE(s);
 
     name = g_strdup_printf("/soc/serial@%"HWADDR_PRIx,
-                           s->memmap[VIRT_UART0].base);
+                           s->memmap[memId].base);
     qemu_fdt_add_subnode(ms->fdt, name);
     qemu_fdt_setprop_string(ms->fdt, name, "compatible", "ns16550a");
     qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg",
-                                 2, s->memmap[VIRT_UART0].base,
-                                 2, s->memmap[VIRT_UART0].size);
+                                 2, s->memmap[memId].base,
+                                 2, s->memmap[memId].size);
     qemu_fdt_setprop_cell(ms->fdt, name, "clock-frequency", 3686400);
     qemu_fdt_setprop_cell(ms->fdt, name, "interrupt-parent", irq_mmio_phandle);
     if (s->aia_type == VIRT_AIA_TYPE_NONE) {
-        qemu_fdt_setprop_cell(ms->fdt, name, "interrupts", UART0_IRQ);
+        qemu_fdt_setprop_cell(ms->fdt, name, "interrupts", irqNo);
     } else {
-        qemu_fdt_setprop_cells(ms->fdt, name, "interrupts", UART0_IRQ, 0x4);
+        qemu_fdt_setprop_cells(ms->fdt, name, "interrupts", irqNo, 0x4);
+    }
+
+    if (VIRT_UART0 == memId) {
+        qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", name);
+        qemu_fdt_setprop_string(ms->fdt, "/aliases", "serial0", name);
     }
+}
 
-    qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", name);
-    qemu_fdt_setprop_string(ms->fdt, "/aliases", "serial0", name);
+static void create_fdt_uarts(RISCVVirtState *s, uint32_t irq_mmio_phandle)
+{
+    if (s->uart1_present) {
+        create_fdt_uart(s, irq_mmio_phandle, VIRT_UART1, UART1_IRQ);
+    }
+    create_fdt_uart(s, irq_mmio_phandle, VIRT_UART0, UART0_IRQ);
 }
 
 static void create_fdt_rtc(RISCVVirtState *s,
@@ -1023,7 +1035,7 @@ static void finalize_fdt(RISCVVirtState *s)
 
     create_fdt_reset(s, &phandle);
 
-    create_fdt_uart(s, irq_mmio_phandle);
+    create_fdt_uarts(s, irq_mmio_phandle);
 
     create_fdt_rtc(s, irq_mmio_phandle);
 }
@@ -1567,6 +1579,13 @@ static void virt_machine_init(MachineState *machine)
         0, qdev_get_gpio_in(mmio_irqchip, UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
+    if (serial_hd(1)) {
+        serial_mm_init(system_memory, s->memmap[VIRT_UART1].base,
+            0, qdev_get_gpio_in(mmio_irqchip, UART1_IRQ), 399193,
+            serial_hd(1), DEVICE_LITTLE_ENDIAN);
+        s->uart1_present = true;
+    }
+
     sysbus_create_simple("goldfish_rtc", s->memmap[VIRT_RTC].base,
         qdev_get_gpio_in(mmio_irqchip, RTC_IRQ));
 
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 18a2a323a3..7d57c8292e 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -59,6 +59,7 @@ struct RISCVVirtState {
     int aia_guests;
     char *oem_id;
     char *oem_table_id;
+    bool uart1_present;
     OnOffAuto acpi;
     const MemMapEntry *memmap;
     struct GPEXHost *gpex_host;
@@ -78,6 +79,7 @@ enum {
     VIRT_APLIC_S,
     VIRT_UART0,
     VIRT_VIRTIO,
+    VIRT_UART1,
     VIRT_FW_CFG,
     VIRT_IMSIC_M,
     VIRT_IMSIC_S,
@@ -93,6 +95,7 @@ enum {
 enum {
     UART0_IRQ = 10,
     RTC_IRQ = 11,
+    UART1_IRQ = 12,
     VIRTIO_IRQ = 1, /* 1 to 8 */
     VIRTIO_COUNT = 8,
     PCIE_IRQ = 0x20, /* 32 to 35 */
-- 
2.34.1


