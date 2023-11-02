Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124DBC4167B
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 17:05:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyb5n-0002gn-Ph; Thu, 02 Nov 2023 13:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb5l-0002fn-B9
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 13:02:49 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb5j-0003au-Hx
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 13:02:49 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2809b4d648bso1110502a91.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698944566; x=1699549366; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q5TZZ2d8UxCfKxtE4X2DjtVxYb81+jhlOCAfFzhomxo=;
 b=NxbOxVTu4kxTxU39RrmOXOxjDliJtQZ7A6UV6XSsUTZozXo4OlEBa1tf616YYNv+Yc
 r8l25mSNGp88RQNROf0d4vJQU4A0kKzkoHGRIl3hw8rn23dvm2ARH9YXMfkUo8Z8Jp0R
 jcwM5jHcuTqkgJhyLLKxWZEB1vuwCSbsLlQi5FjD8qju2sL2G53D865oW/drsfizT4Fx
 7szRkmBkiYf8G0ds+qYSJrcu//LarWG0CmUOpaasXA4bOjt9QVY8RwYAoD3VWB5qDEnP
 J0GVm/aq93LPfoyFmc3JPfJMN41qrBbOCw8YqIjw64b8UpWldm4JKbOq4vZUCZ0zSk2f
 fEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698944566; x=1699549366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q5TZZ2d8UxCfKxtE4X2DjtVxYb81+jhlOCAfFzhomxo=;
 b=S4x4qnuIH3jH2Lo7RpypBTuSR1I7mTHpBll3VhDfW+Yr2SAwRU45/jADHaFB66qjWf
 V1FCj9sSciqLGLECH2LmTB33guZN8r8Z8aulSmkMlZKxf8EgypikwpwWbq9L4/tFAUDC
 OswiiipNP18QooFZbaa8SOsDWSwTrrpL7N6SLHo6jHub7wBy5wc/8nPgAHae7MgYL2pc
 SDPOxuiBlyFZ5Rp6738XrT/gBtGxozjlkMj/4ifKVoCWn0Zt/p1g4YILuGrgWrV1kXHm
 tyYzdqoTLsF5AzyzVvJSH5jGxbAairFxFO6JABDRrGQDD0jBG5oj/TR16B39PAH2jkgJ
 XC2A==
X-Gm-Message-State: AOJu0Yy7WmATQVP1kwTL9Pa97x5AW7/ZYUVrem3MQxdvf0Ux7CDdzETY
 h099IUa/KAEe5yyy8vHtBF9byQ==
X-Google-Smtp-Source: AGHT+IHESd99YdVGT5XKiQTAW8Qg7p5htCaZPPEnmUENWhL2JAK6a7EyIKpCvS5eBCK8TPVdowv1zw==
X-Received: by 2002:a17:90a:1a17:b0:280:2c55:77c5 with SMTP id
 23-20020a17090a1a1700b002802c5577c5mr12552172pjk.46.1698944566252; 
 Thu, 02 Nov 2023 10:02:46 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 18-20020a17090a031200b0026b70d2a8a2sm25098pje.29.2023.11.02.10.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 10:02:45 -0700 (PDT)
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
 Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 02/13] hw/arm/virt-acpi-build.c: Migrate virtio creation to
 common location
Date: Thu,  2 Nov 2023 22:32:12 +0530
Message-Id: <20231102170223.2619260-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
References: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102d.google.com
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

RISC-V also needs to create the virtio in DSDT in the same way as ARM.
So, instead of duplicating the code, move this function to the device
specific file which is common across architectures.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c        | 32 ++++----------------------------
 hw/virtio/meson.build           |  1 +
 hw/virtio/virtio-acpi.c         | 32 ++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-acpi.h | 16 ++++++++++++++++
 4 files changed, 53 insertions(+), 28 deletions(-)
 create mode 100644 hw/virtio/virtio-acpi.c
 create mode 100644 include/hw/virtio/virtio-acpi.h

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index dd2e95f0ea..b73ddd0c38 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -58,6 +58,7 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
 #include "hw/acpi/viot.h"
+#include "hw/virtio/virtio-acpi.h"
 
 #define ARM_SPI_BASE 32
 
@@ -118,32 +119,6 @@ static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
     aml_append(scope, dev);
 }
 
-static void acpi_dsdt_add_virtio(Aml *scope,
-                                 const MemMapEntry *virtio_mmio_memmap,
-                                 uint32_t mmio_irq, int num)
-{
-    hwaddr base = virtio_mmio_memmap->base;
-    hwaddr size = virtio_mmio_memmap->size;
-    int i;
-
-    for (i = 0; i < num; i++) {
-        uint32_t irq = mmio_irq + i;
-        Aml *dev = aml_device("VR%02u", i);
-        aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
-        aml_append(dev, aml_name_decl("_UID", aml_int(i)));
-        aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
-
-        Aml *crs = aml_resource_template();
-        aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
-        aml_append(crs,
-                   aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
-                                 AML_EXCLUSIVE, &irq, 1));
-        aml_append(dev, aml_name_decl("_CRS", crs));
-        aml_append(scope, dev);
-        base += size;
-    }
-}
-
 static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
                               uint32_t irq, VirtMachineState *vms)
 {
@@ -850,8 +825,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
     }
     fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
-    acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
-                    (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
+    virtio_acpi_dsdt_add(scope, memmap[VIRT_MMIO].base, memmap[VIRT_MMIO].size,
+                         (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
+                         0, NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, vms);
     if (vms->acpi_dev) {
         build_ged_aml(scope, "\\_SB."GED_DEVICE,
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index c0055a7832..9d62097a21 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -79,3 +79,4 @@ system_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
 system_ss.add(files('virtio-hmp-cmds.c'))
 
 specific_ss.add_all(when: 'CONFIG_VIRTIO', if_true: specific_virtio_ss)
+system_ss.add(when: 'CONFIG_ACPI', if_true: files('virtio-acpi.c'))
diff --git a/hw/virtio/virtio-acpi.c b/hw/virtio/virtio-acpi.c
new file mode 100644
index 0000000000..b55905dbc6
--- /dev/null
+++ b/hw/virtio/virtio-acpi.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * virtio ACPI Support
+ *
+ */
+
+#include "hw/virtio/virtio-acpi.h"
+#include "hw/acpi/aml-build.h"
+
+void virtio_acpi_dsdt_add(Aml *scope, const hwaddr base, const hwaddr size,
+                          uint32_t mmio_irq, long int start_index, int num)
+{
+    long int i;
+    hwaddr virtio_base = base;
+
+    for (i = start_index; i < start_index + num; i++) {
+        uint32_t irq = mmio_irq + i;
+        Aml *dev = aml_device("VR%02u", (unsigned)i);
+        aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
+        aml_append(dev, aml_name_decl("_UID", aml_int(i)));
+        aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+
+        Aml *crs = aml_resource_template();
+        aml_append(crs, aml_memory32_fixed(virtio_base, size, AML_READ_WRITE));
+        aml_append(crs,
+                   aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
+                                 AML_EXCLUSIVE, &irq, 1));
+        aml_append(dev, aml_name_decl("_CRS", crs));
+        aml_append(scope, dev);
+        virtio_base += size;
+    }
+}
diff --git a/include/hw/virtio/virtio-acpi.h b/include/hw/virtio/virtio-acpi.h
new file mode 100644
index 0000000000..844e102569
--- /dev/null
+++ b/include/hw/virtio/virtio-acpi.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * ACPI support for virtio
+ */
+
+#ifndef VIRTIO_ACPI_H
+#define VIRTIO_ACPI_H
+
+#include "qemu/osdep.h"
+#include "exec/hwaddr.h"
+
+void virtio_acpi_dsdt_add(Aml *scope, const hwaddr virtio_mmio_base,
+                          const hwaddr virtio_mmio_size, uint32_t mmio_irq,
+                          long int start_index, int num);
+
+#endif
-- 
2.39.2


