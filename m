Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7C9EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 16:42:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJctU-0004ZI-EJ; Wed, 12 Jul 2023 12:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJctP-0004Ip-8m
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 12:40:44 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJctM-00052W-Pf
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 12:40:42 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1b852785a65so6924695ad.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 09:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689180039; x=1691772039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HCnT2erG14TplFxKPNlJjsum3jqHKotnhwDdjImqCi0=;
 b=JPDcoo62wB3nOg0EBfCAz+85clN+JmEiH50Sq2p6UK1BS92ZVTTZmU0BjO0bp00VSo
 1TmLyYp60HIJ1ouKImn0foywn1VPmXkHTOk3m3T9EQDlr3GB7WtwMUuN/UKWrBsCiBTL
 StZ41wbpmioxffRxyu6aN1ne+RyAW8LFsqoPrj2QaTh/e5tnHLqrkS5w/Kuk594rnceQ
 9F5xC8isT/JFdoP8fdplOFyspT4bmRhRxVdjFe/baHGcUNH/dcRkuiPskMY5HgzD9NT6
 EkhC9J6vm+gnNrbvRt7b3L0RKRXWTlJpvf8JHhUxxidpDJFuV4eSodNwXsBNHyCb2Yr6
 mNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689180039; x=1691772039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HCnT2erG14TplFxKPNlJjsum3jqHKotnhwDdjImqCi0=;
 b=RuRD32pGvKpPlqYNx2VJLwXmakPxczdYWuMFU3p2S+GrgJDSu6lq1KiV8YRV+W0XNM
 wrV9gEojgaPEGh6UtaF0BZfGSVNsMlYjTZXQElkjVD2Zbzz5wXVIOqP9hvFC2p2+0NT0
 uzpKHKAaq2t5FKy5JxG+Mk/NwKbUcd5cQ//tOYFryVTA7f1mcMfkdsu5cNBX3P8+B+5l
 Je7c8z9T0372/ZIMTi9nmAkwB4RMmTLQlwTftuLyrulyVmW3Mi+29YrG0KJmg2DzK2Mu
 2yfR/3xTGdzh5K183iz+q3q7JTfepJCd0QgR6eJju8Ou/QlC0H4y1kJSq1HygY7R36Fy
 rHhg==
X-Gm-Message-State: ABy/qLYV1KHYoGID6jx8kO9s+G5pQI13xm2beijjdHljHWIH3gj+9rP4
 i6u5MWcLCgKm6NBPND/kGMIpzg==
X-Google-Smtp-Source: APBJJlHsUV2lcZ2sJh7K971L8wqznT80vho7nnOH0jxv7Sqjn1/1R2WaUMD0oP36KCwgTEYOT8g8bw==
X-Received: by 2002:a17:903:41c2:b0:1b8:8728:d776 with SMTP id
 u2-20020a17090341c200b001b88728d776mr3654293ple.0.1689180039374; 
 Wed, 12 Jul 2023 09:40:39 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.25])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a1709027d9200b001ac7f583f72sm4172824plm.209.2023.07.12.09.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 09:40:39 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 10/10] hw/riscv/virt-acpi-build.c: Add IO controllers and
 devices
Date: Wed, 12 Jul 2023 22:09:43 +0530
Message-Id: <20230712163943.98994-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712163943.98994-1-sunilvl@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Add basic IO controllers and devices like PCI, VirtIO and UART
in the ACPI namespace.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/Kconfig           |  1 +
 hw/riscv/virt-acpi-build.c | 87 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index b6a5eb4452..a50717be87 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -45,6 +45,7 @@ config RISCV_VIRT
     select FW_CFG_DMA
     select PLATFORM_BUS
     select ACPI
+    select ACPI_PCI
 
 config SHAKTI_C
     bool
diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 25745eee4c..91f06fdc97 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -27,6 +27,7 @@
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/acpi/pci.h"
 #include "hw/acpi/utils.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
@@ -35,6 +36,7 @@
 #include "hw/riscv/virt.h"
 #include "hw/riscv/numa.h"
 #include "hw/intc/riscv_aclint.h"
+#include "hw/pci-host/gpex.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 #define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
@@ -138,6 +140,55 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
     }
 }
 
+static void
+acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
+                    uint32_t uart_irq)
+{
+    Aml *dev = aml_device("COM0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0501")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+
+    Aml *crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(uart_memmap->base,
+                                         uart_memmap->size, AML_READ_WRITE));
+    aml_append(crs,
+                aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
+                               AML_EXCLUSIVE, &uart_irq, 1));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+
+    Aml *pkg = aml_package(2);
+    aml_append(pkg, aml_string("clock-frequency"));
+    aml_append(pkg, aml_int(3686400));
+
+    Aml *UUID = aml_touuid("DAFFD814-6EBA-4D8C-8A91-BC9BBF4AA301");
+
+    Aml *pkg1 = aml_package(1);
+    aml_append(pkg1, pkg);
+
+    Aml *package = aml_package(2);
+    aml_append(package, UUID);
+    aml_append(package, pkg1);
+
+    aml_append(dev, aml_name_decl("_DSD", package));
+    aml_append(scope, dev);
+}
+
+static void
+acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
+                   uint32_t irq, RISCVVirtState *s)
+{
+    struct GPEXConfig cfg = {
+        .mmio32 = memmap[VIRT_PCIE_MMIO],
+        .mmio64 = memmap[VIRT_HIGH_PCIE_MMIO],
+        .pio = memmap[VIRT_PCIE_PIO],
+        .ecam = memmap[VIRT_PCIE_ECAM],
+        .irq = irq,
+        .bus = s->bus,
+    };
+
+    acpi_dsdt_add_gpex(scope, &cfg);
+}
+
 /* RHCT Node[N] starts at offset 56 */
 #define RHCT_NODE_ARRAY_OFFSET 56
 
@@ -318,6 +369,8 @@ static void build_dsdt(GArray *table_data,
                        RISCVVirtState *s)
 {
     Aml *scope, *dsdt;
+    MachineState *ms = MACHINE(s);
+    uint8_t socket_count;
     const MemMapEntry *memmap = s->memmap;
     AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = s->oem_id,
                         .oem_table_id = s->oem_table_id };
@@ -337,6 +390,30 @@ static void build_dsdt(GArray *table_data,
 
     acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
 
+    socket_count = riscv_socket_count(ms);
+
+    acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0], UART0_IRQ);
+
+    if (socket_count == 1) {
+        acpi_dsdt_add_virtio(scope, &memmap[VIRT_VIRTIO],
+                             VIRTIO_IRQ, VIRTIO_COUNT);
+        acpi_dsdt_add_pci(scope, memmap, PCIE_IRQ, s);
+    } else if (socket_count == 2) {
+        acpi_dsdt_add_virtio(scope, &memmap[VIRT_VIRTIO],
+                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES,
+                             VIRTIO_COUNT);
+        acpi_dsdt_add_pci(scope, memmap,
+                          PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES,
+                          s);
+    } else {
+        acpi_dsdt_add_virtio(scope, &memmap[VIRT_VIRTIO],
+                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES,
+                             VIRTIO_COUNT);
+        acpi_dsdt_add_pci(scope, memmap,
+                          PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES * 2,
+                          s);
+    }
+
     aml_append(dsdt, scope);
 
     /* copy AML table into ACPI tables blob and patch header there */
@@ -486,6 +563,16 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_rhct(tables_blob, tables->linker, s);
 
+    acpi_add_table(table_offsets, tables_blob);
+    {
+        AcpiMcfgInfo mcfg = {
+           .base = s->memmap[VIRT_PCIE_MMIO].base,
+           .size = s->memmap[VIRT_PCIE_MMIO].size,
+        };
+        build_mcfg(tables_blob, tables->linker, &mcfg, s->oem_id,
+                   s->oem_table_id);
+    }
+
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,
-- 
2.39.2


