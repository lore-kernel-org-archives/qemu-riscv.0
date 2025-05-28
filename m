Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C145C3ABB2
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 May 2025 20:34:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uKNTH-0003AP-5r; Wed, 28 May 2025 16:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKNTE-00039Z-VY
 for qemu-riscv@nongnu.org; Wed, 28 May 2025 16:33:52 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKNT7-000257-3v
 for qemu-riscv@nongnu.org; Wed, 28 May 2025 16:33:52 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e694601f624so161437276.1
 for <qemu-riscv@nongnu.org>; Wed, 28 May 2025 13:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1748464421; x=1749069221; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JsygRdrtTbBM8jIYP/DPWuu/7pCC8KyA9H2ttbJ4sH0=;
 b=mcZpIQXzCkv4w3ft1B31wTRLfBkVytCZD7bS66YV5plM6dIpY+NBUrPbBpTnccCXs8
 9sSUOQkD7wjdkjkC/hdczcw3Z02QeBgwra+8Qy40/dBxFz/6Yl2Q62/zs8hZ+lmMtzJ8
 CwAof5ciyBq2toUyMsWKeu6fySwHaacNmAKs2QtXeYToGNMEuC+XCrOTiutFhZeSnS3y
 hiMhtDOumI00Ff2b+s+2Ev2WNHIH5aHjOoc/ALFBLml5x/Fmy8J0NwSHlphyF6xVcR63
 rIoF9PV3McCVavb4wkd84+n+bBqZQSC5TtFyMTKmUJ1P2F/S9Oj3paNEcwoES7Nato2/
 Wkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748464421; x=1749069221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JsygRdrtTbBM8jIYP/DPWuu/7pCC8KyA9H2ttbJ4sH0=;
 b=ku5iTjoe+eELDa0xYsbWnFoLIsctTo09vBQZ6IKrtXz4/V9PSC1zL5+Nqydzw8hZzw
 z+EqeKlpNn9gmQRBBUwW8ZYCJdxHBOxJrEXPn+P2pjnr1RzRonZas/E3Ki4sKi38WzxK
 ezEE9QHovHxnJu70ocJeDH8hQu+3IAGQOAyEbRwSGzJWuJUI6nJkAwA8Dt2X2KKUeSeM
 96Xqr7Fv+cBN3xe+93pDSFYgW5NXUz+TO+S4kFP6CUiTA7ppbGXCuPWfkdKu+UWzTR45
 4X+GC3azrlRvB4+0tQhwXReBHyZmnYm9rzy1XauhB1FVxogVP/rSpLEIuyrpbyn0G9W9
 RF9A==
X-Gm-Message-State: AOJu0YwB4S7HtQgewY8vOCja9jat6LIUmfIIui16lmr5qTzv7lC/lTgb
 sAwUnG6CQUAitkfw9oEjp01M9yDOClHF8jiFNlmZyK9/xcxoIkTOPHyp0vI5YT9v6zMSlLEf7Y1
 OW+u/
X-Gm-Gg: ASbGnctW1CkOUXaINPZjMQoof0Ohn1pr7zRc8E+F/PvBZiFx/xeW7gC13b7eRnxo7N1
 ZgbJUP4SN0gAquVD0butFq3/u2HRLCyPdWkBstcTlMOdAZPdWTUmFOl5AEbJ/vKihIoKOiSfQX9
 uI6U5Mw4NfUwv5EWLOUU1jokk8UBV7zQvRUkZutuHryvSSKZlZkGbX/05LV/fiTwhA3/CVYyQWm
 P23FuPcd8V6obTurpBfDdTtcw3nUYXSSxamd8CX1HJxqaSkilhCTKCDOOGFIgXvsT2dyY5/sqWf
 rJZDM69MIRybIn+holo3sXynUec/PEK046V2j9YwCQikXwj+L6xc4goR5L+ePxnszPKwu+hSEST
 00bw=
X-Google-Smtp-Source: AGHT+IHIRyA1cQSEBFpu7hRRjd1+FbXK1T3UEU/8uEXSIkwZkHvi9d8+zyl5wDk6hOFGPQnVl5bHYQ==
X-Received: by 2002:a05:6102:c92:b0:4bb:e36f:6a35 with SMTP id
 ada2fe7eead31-4e4240bcc90mr14612847137.14.1748462515541; 
 Wed, 28 May 2025 13:01:55 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.35.190])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4e59fc11a95sm1393736137.3.2025.05.28.13.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 13:01:55 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 4/4] hw/riscv/server_platform_ref.c: add riscv-iommu-sys
Date: Wed, 28 May 2025 17:01:29 -0300
Message-ID: <20250528200129.1548259-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528200129.1548259-1-dbarboza@ventanamicro.com>
References: <20250528200129.1548259-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add an always present IOMMU platform device for the rvsp-ref board.

The IRQs being used are similar to what the 'virt' board is using: IRQs
36 to 39, one IRQ for queue.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/Kconfig               |  1 +
 hw/riscv/server_platform_ref.c | 78 ++++++++++++++++++++++++++++++++--
 2 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index f626774c52..cd70095687 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -82,6 +82,7 @@ config SERVER_PLATFORM_REF
     select RISCV_ACLINT
     select RISCV_APLIC
     select RISCV_IMSIC
+    select RISCV_IOMMU
 
 config SHAKTI_C
     bool
diff --git a/hw/riscv/server_platform_ref.c b/hw/riscv/server_platform_ref.c
index 5102286103..9740b395f6 100644
--- a/hw/riscv/server_platform_ref.c
+++ b/hw/riscv/server_platform_ref.c
@@ -31,6 +31,8 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
+#include "hw/riscv/iommu.h"
+#include "hw/riscv/riscv-iommu-bits.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_aplic.h"
 #include "hw/intc/riscv_imsic.h"
@@ -94,6 +96,7 @@ enum {
     RVSP_MROM,
     RVSP_RESET_SYSCON,
     RVSP_RTC,
+    RVSP_IOMMU_SYS,
     RVSP_ACLINT,
     RVSP_APLIC_M,
     RVSP_APLIC_S,
@@ -112,6 +115,7 @@ enum {
     RVSP_UART0_IRQ = 10,
     RVSP_RTC_IRQ = 11,
     RVSP_PCIE_IRQ = 0x20, /* 32 to 35 */
+    IOMMU_SYS_IRQ = 0x24 /* 36 to 39 */
 };
 
 /*
@@ -141,6 +145,7 @@ static const MemMapEntry rvsp_ref_memmap[] = {
     [RVSP_MROM] =           {     0x1000,        0xf000 },
     [RVSP_RESET_SYSCON] =   {   0x100000,        0x1000 },
     [RVSP_RTC] =            {   0x101000,        0x1000 },
+    [RVSP_IOMMU_SYS] =      {    0102000,        0x1000 },
     [RVSP_ACLINT] =         {  0x2000000,       0x10000 },
     [RVSP_PCIE_PIO] =       {  0x3000000,       0x10000 },
     [RVSP_APLIC_M] =        {  0xc000000, APLIC_SIZE(RVSP_CPUS_MAX) },
@@ -638,9 +643,51 @@ static void create_fdt_sockets(RVSPMachineState *s, const MemMapEntry *memmap,
     riscv_socket_fdt_write_distance_matrix(ms);
 }
 
+static void create_fdt_iommu_sys(RVSPMachineState *s, uint32_t irq_chip,
+                                 uint32_t msi_phandle,
+                                 uint32_t *iommu_sys_phandle)
+{
+    const char comp[] = "riscv,iommu";
+    void *fdt = MACHINE(s)->fdt;
+    uint32_t iommu_phandle;
+    g_autofree char *iommu_node = NULL;
+    hwaddr addr = s->memmap[RVSP_IOMMU_SYS].base;
+    hwaddr size = s->memmap[RVSP_IOMMU_SYS].size;
+    uint32_t iommu_irq_map[RISCV_IOMMU_INTR_COUNT] = {
+        IOMMU_SYS_IRQ + RISCV_IOMMU_INTR_CQ,
+        IOMMU_SYS_IRQ + RISCV_IOMMU_INTR_FQ,
+        IOMMU_SYS_IRQ + RISCV_IOMMU_INTR_PM,
+        IOMMU_SYS_IRQ + RISCV_IOMMU_INTR_PQ,
+    };
+
+    iommu_node = g_strdup_printf("/soc/iommu@%"HWADDR_PRIx,
+                                 s->memmap[RVSP_IOMMU_SYS].base);
+    iommu_phandle = qemu_fdt_alloc_phandle(fdt);
+    qemu_fdt_add_subnode(fdt, iommu_node);
+
+    qemu_fdt_setprop(fdt, iommu_node, "compatible", comp, sizeof(comp));
+    qemu_fdt_setprop_cell(fdt, iommu_node, "#iommu-cells", 1);
+    qemu_fdt_setprop_cell(fdt, iommu_node, "phandle", iommu_phandle);
+
+    qemu_fdt_setprop_cells(fdt, iommu_node, "reg",
+                           addr >> 32, addr, size >> 32, size);
+    qemu_fdt_setprop_cell(fdt, iommu_node, "interrupt-parent", irq_chip);
+
+    qemu_fdt_setprop_cells(fdt, iommu_node, "interrupts",
+        iommu_irq_map[0], FDT_IRQ_TYPE_EDGE_LOW,
+        iommu_irq_map[1], FDT_IRQ_TYPE_EDGE_LOW,
+        iommu_irq_map[2], FDT_IRQ_TYPE_EDGE_LOW,
+        iommu_irq_map[3], FDT_IRQ_TYPE_EDGE_LOW);
+
+    qemu_fdt_setprop_cell(fdt, iommu_node, "msi-parent", msi_phandle);
+
+    *iommu_sys_phandle = iommu_phandle;
+}
+
 static void create_fdt_pcie(RVSPMachineState *s, const MemMapEntry *memmap,
                             uint32_t irq_pcie_phandle,
-                            uint32_t msi_pcie_phandle)
+                            uint32_t msi_pcie_phandle,
+                            uint32_t iommu_sys_phandle)
 {
     g_autofree char *name = NULL;
     MachineState *ms = MACHINE(s);
@@ -675,6 +722,10 @@ static void create_fdt_pcie(RVSPMachineState *s, const MemMapEntry *memmap,
            memmap[RVSP_PCIE_MMIO_HIGH].size);
 
     create_pcie_irq_map(s, ms->fdt, name, irq_pcie_phandle);
+
+    qemu_fdt_setprop_cells(ms->fdt, name, "iommu-map",
+                           0, iommu_sys_phandle, 0, 0, 0,
+                           iommu_sys_phandle, 0, 0xffff);
 }
 
 static void create_fdt_reset(RVSPMachineState *s, const MemMapEntry *memmap,
@@ -768,12 +819,16 @@ static void create_fdt_flash(RVSPMachineState *s, const MemMapEntry *memmap)
 static void finalize_fdt(RVSPMachineState *s)
 {
     uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
-    uint32_t irq_pcie_phandle = 1;
+    uint32_t irq_pcie_phandle = 1, iommu_sys_phandle;
 
     create_fdt_sockets(s, rvsp_ref_memmap, &phandle, &irq_mmio_phandle,
                        &irq_pcie_phandle, &msi_pcie_phandle);
 
-    create_fdt_pcie(s, rvsp_ref_memmap, irq_pcie_phandle, msi_pcie_phandle);
+    create_fdt_iommu_sys(s, irq_mmio_phandle, msi_pcie_phandle,
+                         &iommu_sys_phandle);
+
+    create_fdt_pcie(s, rvsp_ref_memmap, irq_pcie_phandle,
+                    msi_pcie_phandle, iommu_sys_phandle);
 
     create_fdt_reset(s, rvsp_ref_memmap, &phandle);
 
@@ -1078,7 +1133,7 @@ static void rvsp_ref_machine_init(MachineState *machine)
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     MemoryRegion *reset_syscon_io = g_new(MemoryRegion, 1);
-    DeviceState *mmio_irqchip, *pcie_irqchip;
+    DeviceState *mmio_irqchip, *pcie_irqchip, *iommu_sys;
     int i, base_hartid, hart_count;
     int socket_count = riscv_socket_count(machine);
 
@@ -1196,6 +1251,21 @@ static void rvsp_ref_machine_init(MachineState *machine)
         create_fdt(s, memmap);
     }
 
+    iommu_sys = qdev_new(TYPE_RISCV_IOMMU_SYS);
+    object_property_set_uint(OBJECT(iommu_sys), "addr",
+                             s->memmap[RVSP_IOMMU_SYS].base,
+                             &error_fatal);
+
+    object_property_set_uint(OBJECT(iommu_sys), "base-irq",
+                             IOMMU_SYS_IRQ,
+                             &error_fatal);
+
+    object_property_set_link(OBJECT(iommu_sys), "irqchip",
+                             OBJECT(mmio_irqchip),
+                             &error_fatal);
+
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(iommu_sys), &error_fatal);
+
     s->machine_done.notify = rvsp_ref_machine_done;
     qemu_add_machine_init_done_notifier(&s->machine_done);
 }
-- 
2.49.0


