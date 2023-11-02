Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CC1C4167D
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 17:05:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyb6m-0003pI-6v; Thu, 02 Nov 2023 13:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb6l-0003mf-9g
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 13:03:51 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb6i-0004Lw-RR
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 13:03:51 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5b9a456798eso812763a12.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 10:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698944627; x=1699549427; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZmwHBAqlWDpR0Ly31GEGuNJ8i9iUz/JPoUFQ5VSjzk=;
 b=LA4VA10MLegbgApRlQGRpjnGduYaBz+1cAddPTEPGR6YSz8cSw2tyjan/NG2nwU86m
 DraIidxKb0un8miU5QkML+MN5uq0drQShjhBAkwwmWuw1cY90oK9hneRIzER9avcbYHe
 Ot4KnYv0HxggvaH3gQZ2SuXvDp4/IaPTUf+FzwCcJeXJBRYDNzHN8jYEgEyK8nLwUzCO
 j9bfH6X6qUCzQGL9fGR1fDdME/B5SyupaB3ky4lmgfHC+jkag0G5lXfheSqZsieZZvIg
 MvFQD676mhWQTp+QWVepJYlvbQvyXylRWhYXuTetwfu5atC1MDJDbSrVqdCFUD1RkIRj
 s35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698944627; x=1699549427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZmwHBAqlWDpR0Ly31GEGuNJ8i9iUz/JPoUFQ5VSjzk=;
 b=F7kyirPb5Hx1qh5FTIxrCq+s1JRJs3vBTnIKiGpZcs/E7HFcv3LhR4z1HmW9JyGT+O
 MhVUcq0LrK4Z5tRKJi/YZWBof9xBNTHtxgajelYmyevgAxOd2e6M1GI4BF9wRvy8VGs1
 xrXqRLECrf76fwU/3jy0AjgwEIADz3RP8kBfdyj72cJj/YbIx3O8QuCLz4av1nxO+N0s
 83YO5qQ8FdE8hM9S1AfZaqAm5GO2pqb9RTjt9aH/vXKR7D0F90PTkb+w0aLFxjsRQZwF
 kTsQH5FogDC6COOIDfmZcQXoCLvkdrkQyzPubQoWopqH/+2Ic/P3OyX3Q18gXtyWZXPI
 sWcw==
X-Gm-Message-State: AOJu0YxYqS1Ccuczkk7POoGHLJ50fscdBkj8NGsDyC09jW1dd6OMpCJr
 Cj9bi5/m6erYw8VZFWUvuIOb6w==
X-Google-Smtp-Source: AGHT+IG/sXSk0dIyCDC1pPF+c69Yg9bHneKvAyK8eyvG5jvD7Wz1EGFYWBJm82uuqv4UXeU69pkc4g==
X-Received: by 2002:a17:90a:f198:b0:27d:60b1:4f2c with SMTP id
 bv24-20020a17090af19800b0027d60b14f2cmr15768431pjb.4.1698944627183; 
 Thu, 02 Nov 2023 10:03:47 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 18-20020a17090a031200b0026b70d2a8a2sm25098pje.29.2023.11.02.10.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 10:03:46 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v6 12/13] hw/riscv/virt-acpi-build.c: Add IO controllers and
 devices
Date: Thu,  2 Nov 2023 22:32:22 +0530
Message-Id: <20231102170223.2619260-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
References: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Add basic IO controllers and devices like PCI, VirtIO and UART in the
ACPI namespace.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/riscv/Kconfig           |  1 +
 hw/riscv/virt-acpi-build.c | 79 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 76 insertions(+), 4 deletions(-)

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
index 86c38f7c2b..4d03a27efd 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -27,15 +27,18 @@
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/acpi/pci.h"
 #include "hw/acpi/utils.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/nvram/fw_cfg_acpi.h"
+#include "hw/pci-host/gpex.h"
+#include "hw/riscv/virt.h"
+#include "hw/riscv/numa.h"
+#include "hw/virtio/virtio-acpi.h"
+#include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/reset.h"
-#include "migration/vmstate.h"
-#include "hw/riscv/virt.h"
-#include "hw/riscv/numa.h"
-#include "hw/intc/riscv_aclint.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 #define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
@@ -132,6 +135,39 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
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
 /* RHCT Node[N] starts at offset 56 */
 #define RHCT_NODE_ARRAY_OFFSET 56
 
@@ -310,6 +346,8 @@ static void build_dsdt(GArray *table_data,
                        RISCVVirtState *s)
 {
     Aml *scope, *dsdt;
+    MachineState *ms = MACHINE(s);
+    uint8_t socket_count;
     const MemMapEntry *memmap = s->memmap;
     AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = s->oem_id,
                         .oem_table_id = s->oem_table_id };
@@ -329,6 +367,29 @@ static void build_dsdt(GArray *table_data,
 
     fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
 
+    socket_count = riscv_socket_count(ms);
+
+    acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0], UART0_IRQ);
+
+    if (socket_count == 1) {
+        virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
+                             memmap[VIRT_VIRTIO].size,
+                             VIRTIO_IRQ, 0, VIRTIO_COUNT);
+        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ);
+    } else if (socket_count == 2) {
+        virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
+                             memmap[VIRT_VIRTIO].size,
+                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES, 0,
+                             VIRTIO_COUNT);
+        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES);
+    } else {
+        virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
+                             memmap[VIRT_VIRTIO].size,
+                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES, 0,
+                             VIRTIO_COUNT);
+        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES * 2);
+    }
+
     aml_append(dsdt, scope);
 
     /* copy AML table into ACPI tables blob and patch header there */
@@ -465,6 +526,16 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
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


