Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED85C001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 02:33:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMJTp-0005JH-JK; Wed, 19 Jul 2023 22:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1qMJTo-0005GX-IA
 for qemu-riscv@nongnu.org; Wed, 19 Jul 2023 22:33:24 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1qMJTm-0002Kx-BG
 for qemu-riscv@nongnu.org; Wed, 19 Jul 2023 22:33:24 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1b89b75dc1cso9909195ad.1
 for <qemu-riscv@nongnu.org>; Wed, 19 Jul 2023 19:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689820401; x=1690425201; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N1mMqEt2lgRiBrJEDelIMgAV8u32Wgy6Sj43mvE2m64=;
 b=MM4RZyyJ3eeAGwYszMKv8l3aIuJqb9tMJrYCdZ+ynGvOW/I6y6dv9HF8sUDEXWC5H0
 r/wzCoj1XssSTs6Ny9aSn+KpbLwxpb4Sm0+CAgBj5PHUDRw+yqUTXeqdizM+tzNWXP7U
 DvQJj0TDLbS901nC9ouBlzIwlTb++ppS61nHccPRUGKog6rYmrqLLaNWJQz7ISLB4NEp
 Fjxo5CLI7he30EQrYM4Zas5b2sbFfa4dSPx6yrIrVTjOMIjjPHnEQrZven9gFtbbdqeG
 W8f7iYK4XRP8J5YCjkE1Nadviq4aDDBGX8/9S1/KxHoHUHdDvPnAeiSkkTyLVVT5ZytY
 Wueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689820401; x=1690425201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N1mMqEt2lgRiBrJEDelIMgAV8u32Wgy6Sj43mvE2m64=;
 b=ew+pq/FTuFtj+ccfeJiqyR7G+4eTzLzFRlHXptCU4cQN2gB627CuOgNUsk5/IIds7H
 pF8f6Ve1XPs+jHSMZkK9+tCFBV2UyFZhfaP9A931glc9vFvbveS4Q8V3fud6WAReAL/o
 NxO7tVO17fAUkRSeodYFnGAN1LwpJH+YyzLlcWCT8rmGyHH5wjss7UtOVS2BQJKQcWyT
 aCuveD5a3tsV79vjXIgl7VOQSLYfHsRMmS4Ze3KbQqp3IFjAorVT4K4VxSkJO5zxaT4q
 hXSAjD9urXK0FtMAcPo6zVEASIr8tfuy6ayCgc+qheZFyBiCAG1r9GrNygBrMU9toqvd
 Py7g==
X-Gm-Message-State: ABy/qLb91oQPKURDYKO+ddU2X02C1gDyAXzvcEIfUkPTwQ/1mBwIlDdi
 RkPdsKkKWI4f0KV7ogF2/TSzXA==
X-Google-Smtp-Source: APBJJlGyp1p4LeE7Pmy1Pg7Z3d7C7X/WyzH2dv60PwB51698+A6JHlfIWWCaQCqfbySqW/h15DOqxQ==
X-Received: by 2002:a17:902:ce87:b0:1b8:417d:d042 with SMTP id
 f7-20020a170902ce8700b001b8417dd042mr5493591plg.20.1689820400992; 
 Wed, 19 Jul 2023 19:33:20 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a1709029a8500b001b9e9f191f2sm4692032plp.15.2023.07.19.19.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 19:33:20 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, linux@rivosinc.com,
 Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: [PATCH 5/5] hw/riscv: virt: support for RISC-V IOMMU platform device.
Date: Wed, 19 Jul 2023 19:32:58 -0700
Message-Id: <4e045d8bd6a211e821b07c6437c9023f183bcacc.1689819032.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689819031.git.tjeznach@rivosinc.com>
References: <cover.1689819031.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=tjeznach@rivosinc.com; helo=mail-pl1-x62e.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Adding virt machine property 'iommu' to enable/disable IOMMU
support, with platform RISC-V IOMMU device implementation.

Generate device tree entry for riscv-iommu device, along with
mapping all PCI device identifiers to the single IOMMU device
instance.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 hw/riscv/Kconfig        |   1 +
 hw/riscv/virt.c         | 100 +++++++++++++++++++++++++++++++++++++++-
 include/hw/riscv/virt.h |   3 ++
 3 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 617a509f1b..b1a3a9994f 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -41,6 +41,7 @@ config RISCV_VIRT
     select SERIAL
     select RISCV_ACLINT
     select RISCV_APLIC
+    select RISCV_IOMMU
     select RISCV_IMSIC
     select SIFIVE_PLIC
     select SIFIVE_TEST
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d90286dc46..49cc7105af 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -32,6 +32,7 @@
 #include "hw/core/sysbus-fdt.h"
 #include "target/riscv/pmu.h"
 #include "hw/riscv/riscv_hart.h"
+#include "hw/riscv/iommu.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
@@ -88,7 +89,8 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_APLIC_M] =      {  0xc000000, APLIC_SIZE(VIRT_CPUS_MAX) },
     [VIRT_APLIC_S] =      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
     [VIRT_UART0] =        { 0x10000000,         0x100 },
-    [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
+    [VIRT_IOMMU] =        { 0x10001000,        0x1000 },
+    [VIRT_VIRTIO] =       { 0x10008000,        0x1000 }, /* VIRTIO_COUNT */
     [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
     [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
     [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
@@ -1019,6 +1021,44 @@ static void create_fdt_fw_cfg(RISCVVirtState *s, const MemMapEntry *memmap)
     g_free(nodename);
 }
 
+static void create_fdt_iommu(RISCVVirtState *s, const MemMapEntry *memmap,
+    uint32_t irq_mmio_phandle)
+{
+    MachineState *ms = MACHINE(s);
+    uint32_t iommu_phandle;
+    const char *irq_names[] = { "cmdq", "fltq", "pm", "priq" };
+    char *iommu_node;
+    char *pci_node;
+
+    pci_node = g_strdup_printf("/soc/pci@%" PRIx64, memmap[VIRT_PCIE_ECAM].base);
+    iommu_node = g_strdup_printf("/soc/iommu@%" PRIx64, memmap[VIRT_IOMMU].base);
+
+    iommu_phandle = qemu_fdt_alloc_phandle(ms->fdt);
+    qemu_fdt_add_subnode(ms->fdt, iommu_node);
+    qemu_fdt_setprop_string(ms->fdt, iommu_node, "compatible", "riscv,iommu");
+    qemu_fdt_setprop_cell(ms->fdt, iommu_node, "#iommu-cells", 1);
+    qemu_fdt_setprop_cell(ms->fdt, iommu_node, "phandle", iommu_phandle);
+    qemu_fdt_setprop_cells(ms->fdt, iommu_node, "reg",
+        0x0, memmap[VIRT_IOMMU].base, 0x0, memmap[VIRT_IOMMU].size);
+    qemu_fdt_setprop_cell(ms->fdt, iommu_node, "interrupt-parent", irq_mmio_phandle);
+    qemu_fdt_setprop_string_array(ms->fdt, iommu_node, "interrupt-names",
+        (char **) &irq_names, ARRAY_SIZE(irq_names));
+    qemu_fdt_setprop_cells(ms->fdt, iommu_node, "interrupts",
+        IOMMU_IRQ + 0, 0x4,
+        IOMMU_IRQ + 1, 0x4,
+        IOMMU_IRQ + 2, 0x4,
+        IOMMU_IRQ + 3, 0x4);
+    qemu_fdt_setprop_cells(ms->fdt, pci_node, "iommu-map",
+        0x0, iommu_phandle, 0x0, 0xffff);
+    g_free(iommu_node);
+    g_free(pci_node);
+}
+
+static bool virt_is_iommu_enabled(RISCVVirtState *s)
+{
+    return s->iommu != ON_OFF_AUTO_OFF;
+}
+
 static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
 {
     MachineState *ms = MACHINE(s);
@@ -1051,6 +1091,10 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
 
     create_fdt_pcie(s, memmap, irq_pcie_phandle, msi_pcie_phandle);
 
+    if (virt_is_iommu_enabled(s)) {
+        create_fdt_iommu(s, memmap, irq_mmio_phandle);
+    }
+
     create_fdt_reset(s, memmap, &phandle);
 
     create_fdt_uart(s, memmap, irq_mmio_phandle);
@@ -1210,6 +1254,31 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
     return aplic_m;
 }
 
+static DeviceState *virt_create_iommu(RISCVVirtState *s, DeviceState *irqchip)
+{
+    DeviceState *iommu;
+    int i;
+
+    iommu = qdev_new(TYPE_RISCV_IOMMU_SYS);
+
+    if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
+        /* Disable MSI_FLAT [22], MSI_MRIF [23] if IMSIC is not enabled. */
+        qdev_prop_set_uint64(iommu, "capabilities", ~(BIT_ULL(22) | BIT_ULL(23)));
+    }
+
+    /* Fixed base register address */
+    qdev_prop_set_uint64(iommu, "addr", virt_memmap[VIRT_IOMMU].base);
+
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(iommu), &error_fatal);
+
+    for (i = 0; i < 4; i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(iommu), i,
+            qdev_get_gpio_in(irqchip, IOMMU_IRQ + i));
+    }
+
+    return iommu;
+}
+
 static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
 {
     DeviceState *dev;
@@ -1506,6 +1575,10 @@ static void virt_machine_init(MachineState *machine)
 
     create_platform_bus(s, mmio_irqchip);
 
+    if (virt_is_iommu_enabled(s)) {
+        virt_create_iommu(s, mmio_irqchip);
+    }
+
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(mmio_irqchip, UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
@@ -1533,6 +1606,7 @@ static void virt_machine_instance_init(Object *obj)
     s->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     s->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     s->acpi = ON_OFF_AUTO_AUTO;
+    s->iommu = ON_OFF_AUTO_AUTO;
 }
 
 static char *virt_get_aia_guests(Object *obj, Error **errp)
@@ -1607,6 +1681,23 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
     s->have_aclint = value;
 }
 
+static void virt_get_iommu(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+    OnOffAuto iommu = s->iommu;
+
+    visit_type_OnOffAuto(v, name, &iommu, errp);
+}
+
+static void virt_set_iommu(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &s->iommu, errp);
+}
+
 bool virt_is_acpi_enabled(RISCVVirtState *s)
 {
     return s->acpi != ON_OFF_AUTO_OFF;
@@ -1683,6 +1774,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
 #endif
 
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RISCV_IOMMU_SYS);
+    object_class_property_add(oc, "iommu", "OnOffAuto",
+                              virt_get_iommu, virt_set_iommu,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "iommu",
+        "Set on/off to enable/disable emulating RISC-V IOMMU platform device");
+
     if (tcg_enabled()) {
         object_class_property_add_bool(oc, "aclint", virt_get_aclint,
                                        virt_set_aclint);
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e5c474b26e..47b9a4f103 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -59,6 +59,7 @@ struct RISCVVirtState {
     char *oem_id;
     char *oem_table_id;
     OnOffAuto acpi;
+    OnOffAuto iommu;
     const MemMapEntry *memmap;
 };
 
@@ -73,6 +74,7 @@ enum {
     VIRT_APLIC_M,
     VIRT_APLIC_S,
     VIRT_UART0,
+    VIRT_IOMMU,
     VIRT_VIRTIO,
     VIRT_FW_CFG,
     VIRT_IMSIC_M,
@@ -91,6 +93,7 @@ enum {
     VIRTIO_IRQ = 1, /* 1 to 8 */
     VIRTIO_COUNT = 8,
     PCIE_IRQ = 0x20, /* 32 to 35 */
+    IOMMU_IRQ = 60, /* 60 to 63 */
     VIRT_PLATFORM_BUS_IRQ = 64, /* 64 to 95 */
 };
 
-- 
2.34.1


