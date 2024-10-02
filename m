Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CDDCF3189
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 01:04:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1svnmQ-0006uz-W3; Tue, 01 Oct 2024 21:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1svnmM-0006um-7y
 for qemu-riscv@nongnu.org; Tue, 01 Oct 2024 21:03:46 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1svnmK-0002kY-Ke
 for qemu-riscv@nongnu.org; Tue, 01 Oct 2024 21:03:45 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-20ba9f3824fso13360005ad.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Oct 2024 18:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1727831023; x=1728435823; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ndBHKwItEhsPkfiyUgybvSezK7tLcoBFEu2cfVadMc=;
 b=ov1FNUdouMa/VYh0q6C3RdhG7LZ7Y+cgT2q8VL3yiFQMOCcTVTZgeuIbVzA1YGtU9P
 KxFsloALVJUgbZVazCHRrmGkoo/ZhuOwsprCGm3ur4VWUQi4fVrCJ1XtgDol8gIiY10E
 yLuaKaulEen7Crxy/BYC7JJMTI1zSQudyHGxXwyDrP1jJTSYYrv/OdLwGzV8b6NnXCTk
 OMS5Bn0CR/PuKzDZ+1qumrAB7P9OBlqRL/33BeJxTgrDyUpSPjnfpkCkEZe2vRSehiit
 pK58yWCEn4d1WIU/RBQgiru7owasy055rHIrZ3WavTcRBCzU/lN78OtRLtNHGOgd48L3
 dDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727831023; x=1728435823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ndBHKwItEhsPkfiyUgybvSezK7tLcoBFEu2cfVadMc=;
 b=Ax1KvfiD7Ynk5MJqC/L9bEAMOIftkm0Fs7+XiVyi89HutXljfP+n3l1bR/ioFsWwnv
 B09/pC1iMl0254gX7uF/P5ShGHc15NY1RI5Osu0I7gAWyZdBy1UPRdclwRFER9k3O4fB
 A+p7NQw25HdH21deQN9ePm8IID+urBiynQBhNhYJhaaqDL5lW7e5p7GIsJ1fQ74moOlR
 ygJcnwYMjH3NVGtoV7mDj4BZ1dtZm7NHAKYDFMOqmYYeDD4QmkweO4RNj2mZLcpuK5Pp
 qb4GqDfaVzP/i8mmi/gjARGHaJY86R9EuU2DR6MrxztGbsaorVKYwLhceSslfY3GIgvB
 cbLQ==
X-Gm-Message-State: AOJu0Yz/s7MVXJ6MTxRvd9szvKW8DNnxEKx0FuFQaM99SHLTH8E63v6x
 tbIRFD01PYeTmWxlvpQ5D6H0r+I+YyAK8DEDG6DxbJ8BNjiGwL1L/wCvM1BRciM=
X-Google-Smtp-Source: AGHT+IHRf2KFNvBcvmIMOOJFj7ngfRf3VEMlOyrwxMko+j1LSZCt9pMmChu6z9MtrOeno75qtHyCWw==
X-Received: by 2002:a17:902:d2cf:b0:20b:775f:505c with SMTP id
 d9443c01a7336-20bc5a688abmr18425725ad.52.1727831023350; 
 Tue, 01 Oct 2024 18:03:43 -0700 (PDT)
Received: from grind.. (200-206-229-93.dsl.telesp.net.br. [200.206.229.93])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20b37d63971sm76061295ad.4.2024.10.01.18.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 18:03:43 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 peter.maydell@linaro.org, Tomasz Jeznach <tjeznach@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v8 06/12] hw/riscv/virt.c: support for RISC-V IOMMU PCIDevice
 hotplug
Date: Tue,  1 Oct 2024 22:03:01 -0300
Message-ID: <20241002010314.1928515-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002010314.1928515-1-dbarboza@ventanamicro.com>
References: <20241002010314.1928515-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Generate device tree entry for riscv-iommu PCI device, along with
mapping all PCI device identifiers to the single IOMMU device instance.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index cef41c150a..63d553ac98 100644
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
@@ -1032,6 +1033,30 @@ static void create_fdt_virtio_iommu(RISCVVirtState *s, uint16_t bdf)
                            bdf + 1, iommu_phandle, bdf + 1, 0xffff - bdf);
 }
 
+static void create_fdt_iommu(RISCVVirtState *s, uint16_t bdf)
+{
+    const char comp[] = "riscv,pci-iommu";
+    void *fdt = MACHINE(s)->fdt;
+    uint32_t iommu_phandle;
+    g_autofree char *iommu_node = NULL;
+    g_autofree char *pci_node = NULL;
+
+    pci_node = g_strdup_printf("/soc/pci@%lx",
+                               (long) virt_memmap[VIRT_PCIE_ECAM].base);
+    iommu_node = g_strdup_printf("%s/iommu@%x", pci_node, bdf);
+    iommu_phandle = qemu_fdt_alloc_phandle(fdt);
+    qemu_fdt_add_subnode(fdt, iommu_node);
+
+    qemu_fdt_setprop(fdt, iommu_node, "compatible", comp, sizeof(comp));
+    qemu_fdt_setprop_cell(fdt, iommu_node, "#iommu-cells", 1);
+    qemu_fdt_setprop_cell(fdt, iommu_node, "phandle", iommu_phandle);
+    qemu_fdt_setprop_cells(fdt, iommu_node, "reg",
+                           bdf << 8, 0, 0, 0, 0);
+    qemu_fdt_setprop_cells(fdt, pci_node, "iommu-map",
+                           0, iommu_phandle, 0, bdf,
+                           bdf + 1, iommu_phandle, bdf + 1, 0xffff - bdf);
+}
+
 static void finalize_fdt(RISCVVirtState *s)
 {
     uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
@@ -1738,9 +1763,11 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
 
     if (device_is_dynamic_sysbus(mc, dev) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_RISCV_IOMMU_PCI)) {
         return HOTPLUG_HANDLER(machine);
     }
+
     return NULL;
 }
 
@@ -1761,6 +1788,10 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
     if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         create_fdt_virtio_iommu(s, pci_get_bdf(PCI_DEVICE(dev)));
     }
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_RISCV_IOMMU_PCI)) {
+        create_fdt_iommu(s, pci_get_bdf(PCI_DEVICE(dev)));
+    }
 }
 
 static void virt_machine_class_init(ObjectClass *oc, void *data)
-- 
2.45.2


