Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EDAC25B6B
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:09:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvkB8-000855-Pk; Wed, 25 Oct 2023 16:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkB7-00081Z-KX
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 16:08:33 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkB5-0003av-S9
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 16:08:33 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6bb4abb8100so117379b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 13:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698264510; x=1698869310; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/X10QRATvrV6x66WN26VsMnlc76CHbjtlSmjbg9RSA=;
 b=NXj/67KC6CSw/AamTn3PYnEXRZDoPctMFxJ52uJ3Wm/mXX39TvAtogCWyjgLI14tKW
 ajS+Cm7+Bj+SGEV6XacbXiI7Fr5dm47uS8i7Rh/QUPAJMAs660uMZ4tNjXK/y41rgHi5
 i8L5OEQnwiCWUSLZcz0/x18XicdGFaxfl8/aTeWrJRaOxWVDJ/yg5iYfO1DkI5+QzsHI
 eLVJaEKLhwIezvQJpTBg4DwZAWCfyVkTOsCj716rLRsN5he2bd6Lc4QYvasfFQCfxbwH
 m/PLafbrv7j2/k67Iw2dQnVIJ24bqXcSMhf8p8HTc4Uy7EAJtoymyUzDHvoKwfzpgMmM
 B6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698264510; x=1698869310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S/X10QRATvrV6x66WN26VsMnlc76CHbjtlSmjbg9RSA=;
 b=lDVUSjtJqZPs9M+nW9TsIcMgGci9t4k+duYepAphi335V3YfKHOCKoRWyMcMbDMtNY
 ELib9fWooJeX/wVhmyGU4Kw16AnD51NLfy5ERAoGx83Q1KVEInB3VFEZy0Gy4S7cLj/W
 42DqDMeLOyWu9siyfXgGnhvToO2aWZgQMSnaNhefKpIXmnkxTtJrwlGpWNWjdL2Dcq4B
 Ly8RJFG9WEndfiYUAOeTCLVSiVgN1FAOzDfS6rWiUxn6Z7dt08oF+LH1UznkQot0gRaK
 +nArzJYM/hDhWEEs/+NtAaOzfeh0o4rW9M8rQ4No+CJGtsBE+jOAuemXJ3F73hwVGl9/
 IdJw==
X-Gm-Message-State: AOJu0YzA0y2h4sVysToxURU5J9O4zchfcUYrxV0836B6PAXf/qYxCbmI
 WvVwk8WMRFsWQDdNmKm2hZzp4g==
X-Google-Smtp-Source: AGHT+IEHHYWrHPFTBxLkRJeJ8/L9S9HCRyLDa7b7BQkHkZPtGG2tClhrJaCXfH84Mrp0Jo8Z3NAnGw==
X-Received: by 2002:a05:6a21:1a3:b0:17b:129b:1815 with SMTP id
 le35-20020a056a2101a300b0017b129b1815mr7751733pzb.33.1698264510334; 
 Wed, 25 Oct 2023 13:08:30 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0068fe7c4148fsm9696768pfk.57.2023.10.25.13.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 13:08:29 -0700 (PDT)
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
Subject: [PATCH v4 11/13] hw/riscv/virt: Update GPEX MMIO related properties
Date: Thu, 26 Oct 2023 01:37:11 +0530
Message-Id: <20231025200713.580814-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025200713.580814-1-sunilvl@ventanamicro.com>
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Update the GPEX host bridge properties related to MMIO ranges with
values set for the virt machine.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt.c         | 47 ++++++++++++++++++++++++++++-------------
 include/hw/riscv/virt.h |  1 +
 2 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 085654ab2f..e64886a4d8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1049,21 +1049,45 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
 }
 
 static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
-                                          hwaddr ecam_base, hwaddr ecam_size,
-                                          hwaddr mmio_base, hwaddr mmio_size,
-                                          hwaddr high_mmio_base,
-                                          hwaddr high_mmio_size,
-                                          hwaddr pio_base,
-                                          DeviceState *irqchip)
+                                          DeviceState *irqchip,
+                                          RISCVVirtState *s)
 {
     DeviceState *dev;
     MemoryRegion *ecam_alias, *ecam_reg;
     MemoryRegion *mmio_alias, *high_mmio_alias, *mmio_reg;
+    hwaddr ecam_base = s->memmap[VIRT_PCIE_ECAM].base;
+    hwaddr ecam_size = s->memmap[VIRT_PCIE_ECAM].size;
+    hwaddr mmio_base = s->memmap[VIRT_PCIE_MMIO].base;
+    hwaddr mmio_size = s->memmap[VIRT_PCIE_MMIO].size;
+    hwaddr high_mmio_base = virt_high_pcie_memmap.base;
+    hwaddr high_mmio_size = virt_high_pcie_memmap.size;
+    hwaddr pio_base = s->memmap[VIRT_PCIE_PIO].base;
+    hwaddr pio_size = s->memmap[VIRT_PCIE_PIO].size;
     qemu_irq irq;
     int i;
 
     dev = qdev_new(TYPE_GPEX_HOST);
 
+    /* Set GPEX object properties for the virt machine */
+    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_BASE,
+                            ecam_base, NULL);
+    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_SIZE,
+                            ecam_size, NULL);
+    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
+                             PCI_HOST_BELOW_4G_MMIO_BASE,
+                             mmio_base, NULL);
+    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_BELOW_4G_MMIO_SIZE,
+                            mmio_size, NULL);
+    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
+                             PCI_HOST_ABOVE_4G_MMIO_BASE,
+                             high_mmio_base, NULL);
+    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ABOVE_4G_MMIO_SIZE,
+                            high_mmio_size, NULL);
+    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_BASE,
+                            pio_base, NULL);
+    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_SIZE,
+                            pio_size, NULL);
+
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     ecam_alias = g_new0(MemoryRegion, 1);
@@ -1094,6 +1118,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
         gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
     }
 
+    GPEX_HOST(dev)->gpex_cfg.bus = PCI_HOST_BRIDGE(GPEX_HOST(dev))->bus;
     return dev;
 }
 
@@ -1492,15 +1517,7 @@ static void virt_machine_init(MachineState *machine)
             qdev_get_gpio_in(virtio_irqchip, VIRTIO_IRQ + i));
     }
 
-    gpex_pcie_init(system_memory,
-                   memmap[VIRT_PCIE_ECAM].base,
-                   memmap[VIRT_PCIE_ECAM].size,
-                   memmap[VIRT_PCIE_MMIO].base,
-                   memmap[VIRT_PCIE_MMIO].size,
-                   virt_high_pcie_memmap.base,
-                   virt_high_pcie_memmap.size,
-                   memmap[VIRT_PCIE_PIO].base,
-                   pcie_irqchip);
+    gpex_pcie_init(system_memory, pcie_irqchip, s);
 
     create_platform_bus(s, mmio_irqchip);
 
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 5b03575ed3..f89790fd58 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -61,6 +61,7 @@ struct RISCVVirtState {
     char *oem_table_id;
     OnOffAuto acpi;
     const MemMapEntry *memmap;
+    struct GPEXHost *gpex_host;
 };
 
 enum {
-- 
2.39.2


