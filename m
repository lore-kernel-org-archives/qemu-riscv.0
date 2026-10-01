Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C13CA5FD2
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 13:53:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCHD9-0001yH-HV; Thu, 01 Oct 2026 09:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xCHD5-0001xR-4o
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 09:52:31 -0400
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xCHD2-0000QB-Nk
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 09:52:30 -0400
Received: by mail-yx2-x0e.google.com with SMTP id
 00721157ae682-8a7411012b1so62461467b3.2
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 06:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1790862747; x=1791467547; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=N5q+7/EliSj/cnR+MIhgZ6Wd7i/mOmENnNlFWuG51oA=;
 b=AOzoodzFPfWlBC1qOXR/x8zYtOmRAPnKBi5JOx3Wfl2vqfnVenJObH7hR5VvHzv58G
 ncqowXOVoo9v3rP+MsRRq0oylPbzFM65x8QbSEt/RXvy2qolgzy8E9+ruQ2bJx4wFdTD
 UiTvcDpiijCbNGsH1ixJ3hCASFudPfaPJ+VSAi05j92zHykbQDu+DjIMov9FgBC/zUJJ
 z8ou5btI2s7537pHxyvJE/a+ax+iknbjHFvOaA+6jXx1vcQZPz6WqhcGq8uO8egCBf+6
 24ovDTLiQv1NfG96LjsjmxAsjIUYXJ9pYyGphQ/2p4I2Byq8Mx81rld94QIs3WHDw9s2
 axnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790862747; x=1791467547;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=N5q+7/EliSj/cnR+MIhgZ6Wd7i/mOmENnNlFWuG51oA=;
 b=1npb6lEqeoIQOplSuzf6evp3fYE4Id6bUTnz6QmLF/dNyd2+R7hcTXPjknbrt5BZLw
 db5OLZcOiOFoZx0MZvKDHOVhnbIaibyfinSFFpziMVEoUeo9ixpx9DXXPSG0+mWTS8Hu
 YrC2gPfqs0g7M9g2xomY8j9zp16Mv5XjkHVY/C4URGIQNw2S3MRyHzByoxYN2FD70fH9
 9NL45w8MFdMqKrh8g3eKs8uh+IB7NIXy0nUc/Xvrqj5sBL3izA2O+e+a8GInA/tCxtMn
 lFK7CtV2R4BO5oh9S0+q11wtIDe3xspkinBtTsfiRbz0Bo3yb8kfXkrt5W+LXLC2wBPi
 FKCA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzBMgVUvjkF5hwrQez4G/VZE+nwYcCIdNygAB7Ix6IjR1gN5Qq/jT5dhT9FtjgY3EONpt1mAK+7iRQv@nongnu.org
X-Gm-Message-State: AFq9FYKwNRE4Xeo8hnyba20IQnC7oTc46d9CSxS01EfUgusJPN6G28yd
 ch1dIGW/DMEL6gIOuqrHFbCvcmMD7Vo32skMGUrgIls3WklKXIj7chcifDNG2MaxkwI=
X-Gm-Gg: AYBFou1QNZUuQkQAon13uCxLjomPH8S/AJhilT4zFWscjB9G0Ryj7G9M/lS5/GtiP7X
 Anb6Jf/tGKk3pwDfsQS9XTHHQJt36ZUE9PjBJcB81usNE4FIqdcnNeaFYQ/b28KPibajAA5SPuK
 Slvwv5GwL2QPfVfhckfAqk4dbMfPwoaNqkbwU8iL5/RO7zSKZ5re19Tzpp6Hjv2zaixhPuS4TQT
 rPcjzzUUdmUv1OFtEszdr1ouXC3612Y/Y8ZYISirb9IpGfA7HgJXsMLFDgsjM8F3nVD+cy/JWpL
 d8y+scfsuwuVAscKVNQLrxw06CmMP7m+naB0Cx8/Tbnt7HiqXJ8tyS0f9S2HkDYYrdeEyPyPOly
 OoBYtYzTzSSVixeYLtVELx50pKNGXL1sXGuvkatgJfhFqjO0LsWGctFmyJT6LRlibAJBHVKI5dO
 mOO4j//fmtEtwxxapEgQxg56d6Hy4BF6ZlPo+GxgZ5MPTL06vqTXuO6aW0OsTN7A/pff77VcFyw
 Dw4b5GaN5cgSXEbr2QOmiAJVbx0B+rnuuFEfg9Ad8KNcuwV
X-Received: by 2002:a05:690e:4141:b0:673:e272:f3f0 with SMTP id
 956f58d0204a3-676832e1a8emr1799618d50.12.1790862747388; 
 Thu, 01 Oct 2026 06:52:27 -0700 (PDT)
Received: from [10.200.24.109] ([12.55.13.134])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8acdac9e4d6sm10587707b3.11.2026.10.01.06.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 06:52:26 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 01 Oct 2026 08:52:09 -0500
Subject: [PATCH v4 2/3] hw/riscv/tt-atlantis: Add PRCMs to tt-atlantis
 model
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-atlantis_prcm-v4-2-95d33c470eeb@oss.tenstorrent.com>
References: <20261001-atlantis_prcm-v4-0-95d33c470eeb@oss.tenstorrent.com>
In-Reply-To: <20261001-atlantis_prcm-v4-0-95d33c470eeb@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Michael Ellerman <mpe@kernel.org>, 
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
Received-SPF: pass client-ip=2607:f8b0:4864:41::e;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yx2-x0e.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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

Atlantis has 4 PRCMs that are visible from S mode by the Ascalon Core
(RCPU, HSIO, PCIe and MM). The remaining 2 are only accessed by the
boot cpu which isn't modelled yet.

This commit adds these 4 PRCM blocks to the tt-atlantis model, along
with necessary device tree nodes for them.

Reviewed-by: Chao Liu <chao.liu@processmission.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 docs/system/riscv/tt_atlantis.rst |   1 +
 hw/riscv/tt_atlantis.c            | 104 ++++++++++++++++++++++++++++++++++++++
 include/hw/riscv/tt_atlantis.h    |  22 ++++++++
 3 files changed, 127 insertions(+)

diff --git a/docs/system/riscv/tt_atlantis.rst b/docs/system/riscv/tt_atlantis.rst
index 1f2880d617..539c22354f 100644
--- a/docs/system/riscv/tt_atlantis.rst
+++ b/docs/system/riscv/tt_atlantis.rst
@@ -14,6 +14,7 @@ tt-atlantis QEMU model features
 * 8-core Ascalon-X CPU Cluster
 * RISC-V compliant Advanced Interrupt Architecture
 * 16550A compatible UART
+* 4 PRCMs (Clock and Reset Controllers)
 
 Known limitations
 -----------------
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 8a219afef7..10ae3c2850 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -27,6 +27,7 @@
 #include "hw/char/serial-mm.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/misc/unimp.h"
+#include "hw/misc/tt_atlantis_prcm.h"
 
 #include "system/system.h"
 #include "system/device_tree.h"
@@ -58,12 +59,16 @@ static const MemMapEntry tt_atlantis_memmap[] = {
     [TT_ATL_ACLINT] =           { 0xa2180000,       0x10000 },
     [TT_ATL_SIMSIC] =           { 0xa4000000,      0x200000 },
     [TT_ATL_MAPLIC] =           { 0xcc000000,     0x4000000 },
+    [TT_ATL_PRCM_RCPU] =        { 0xd0000000,       0x10000 },
     [TT_ATL_I2C0] =             { 0xd4040000,       0x10000 },
     [TT_ATL_I2C1] =             { 0xd4050000,       0x10000 },
     [TT_ATL_I2C2] =             { 0xd4060000,       0x10000 },
     [TT_ATL_I2C3] =             { 0xd4070000,       0x10000 },
     [TT_ATL_I2C4] =             { 0xd4080000,       0x10000 },
     [TT_ATL_UART1] =            { 0xd4110000,       0x10000 },
+    [TT_ATL_PRCM_PCIE] =        { 0xd8000000,         0x100 },
+    [TT_ATL_PRCM_MM] =          { 0xdc000000,        0x1000 },
+    [TT_ATL_PRCM_HSIO] =        { 0xe00c0000,         0x510 },
     [TT_ATL_SAPLIC] =           { 0xe8000000,     0x4000000 },
     [TT_ATL_DDR_HI] =          { 0x100000000,  0x1000000000 },
 };
@@ -327,11 +332,34 @@ static void create_fdt_i2c_device(void *fdt, TTAtlantisSoCState *s, int bus,
     qemu_fdt_setprop_cell(fdt, name, "reg", addr);
 }
 
+static char *create_fdt_prcm(void *fdt, const MemMapEntry *mem,
+                             const char *prcm_name)
+{
+    hwaddr base = mem->base;
+    hwaddr size = mem->size;
+    char *name = g_strdup_printf("/soc/clock-controller@%" PRIx64,
+                                 base);
+    g_autofree char *compatible =
+        g_strdup_printf("tenstorrent,atlantis-prcm-%s", prcm_name);
+
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", compatible);
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg", 2, base, 2, size);
+    qemu_fdt_setprop_cell(fdt, name, "#clock-cells", 1);
+    qemu_fdt_setprop_cell(fdt, name, "#reset-cells", 1);
+    qemu_fdt_setprop_cell(fdt, name, "phandle", next_phandle());
+
+    return name;
+}
+
 static void finalize_fdt(void *fdt, TTAtlantisSoCState *s)
 {
     uint32_t aplic_s_phandle = next_phandle();
     uint32_t imsic_s_phandle = next_phandle();
     uint32_t periph_clk_phandle = next_phandle();
+    uint32_t osc_24m_phandle = next_phandle();
+    uint32_t prcm_rcpu_phandle;
+    g_autofree char *rcpu_name, *hsio_name, *pcie_name, *mm_name;
 
     create_fdt_cpu(fdt, s, aplic_s_phandle, imsic_s_phandle);
 
@@ -348,6 +376,30 @@ static void finalize_fdt(void *fdt, TTAtlantisSoCState *s)
                     aplic_s_phandle);
 
     create_fdt_clk(fdt, "periph-clk", 100000000, periph_clk_phandle);
+    create_fdt_clk(fdt, "osc-24m", 24000000, osc_24m_phandle);
+
+    rcpu_name = create_fdt_prcm(fdt, &s->memmap[TT_ATL_PRCM_RCPU], "rcpu");
+    prcm_rcpu_phandle = qemu_fdt_get_phandle(fdt, rcpu_name);
+    qemu_fdt_setprop_cells(fdt, rcpu_name, "clocks", osc_24m_phandle);
+    qemu_fdt_setprop_cells(fdt, rcpu_name, "assigned-clocks",
+                           prcm_rcpu_phandle, TT_ATL_CLK_RCPU_ROOT,
+                           prcm_rcpu_phandle, TT_ATL_CLK_NOCC_CLK);
+    qemu_fdt_setprop_cells(fdt, rcpu_name, "assigned-clock-parents",
+                           prcm_rcpu_phandle, TT_ATL_CLK_RCPU_PLL,
+                           prcm_rcpu_phandle, TT_ATL_CLK_NOC_PLL);
+
+    hsio_name = create_fdt_prcm(fdt, &s->memmap[TT_ATL_PRCM_HSIO], "hsio");
+    qemu_fdt_setprop_cells(fdt, hsio_name, "clocks", osc_24m_phandle,
+                           prcm_rcpu_phandle, TT_ATL_CLK_HSIO_PLL);
+
+    pcie_name = create_fdt_prcm(fdt, &s->memmap[TT_ATL_PRCM_PCIE], "pcie");
+    qemu_fdt_setprop_cells(fdt, pcie_name, "clocks", osc_24m_phandle,
+                           prcm_rcpu_phandle, TT_ATL_CLK_PCIE_PLL);
+
+    mm_name = create_fdt_prcm(fdt, &s->memmap[TT_ATL_PRCM_MM], "mm");
+    qemu_fdt_setprop_cells(fdt, mm_name, "clocks", osc_24m_phandle,
+                           prcm_rcpu_phandle, TT_ATL_CLK_MM_PLL0,
+                           prcm_rcpu_phandle, TT_ATL_CLK_MM_PLL1);
 
     for (int i = 0; i < TT_ATL_NUM_I2C; i++) {
         create_fdt_i2c(fdt,
@@ -491,6 +543,19 @@ static void tt_atlantis_soc_init(Object *obj)
     object_initialize_child(obj, "uart1", &s->uart1,
                             TYPE_UNIMPLEMENTED_DEVICE);
 
+    object_initialize_child(obj, "prcm-rcpu",
+                            &s->prcm[TT_ATLANTIS_PRCM_DOMAIN_RCPU],
+                            TYPE_TT_ATLANTIS_PRCM_RCPU);
+    object_initialize_child(obj, "prcm-hsio",
+                            &s->prcm[TT_ATLANTIS_PRCM_DOMAIN_HSIO],
+                            TYPE_TT_ATLANTIS_PRCM_HSIO);
+    object_initialize_child(obj, "prcm-pcie",
+                            &s->prcm[TT_ATLANTIS_PRCM_DOMAIN_PCIE],
+                            TYPE_TT_ATLANTIS_PRCM_PCIE);
+    object_initialize_child(obj, "prcm-mm",
+                            &s->prcm[TT_ATLANTIS_PRCM_DOMAIN_MM],
+                            TYPE_TT_ATLANTIS_PRCM_MM);
+
     for (int i = 0; i < TT_ATL_NUM_I2C; i++) {
         object_initialize_child(obj, "i2c[*]", &s->i2c[i],
                                 TYPE_DESIGNWARE_I2C);
@@ -587,6 +652,44 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
     serial_mm_init(s->memory, s->memmap[TT_ATL_UART1].base, 2,
                    qdev_get_gpio_in(s->irqchip, TT_ATL_UART1_IRQ),
                    115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+
+    /* 4 PRCM blocks */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->prcm[TT_ATLANTIS_PRCM_DOMAIN_RCPU]),
+                        errp)) {
+        return;
+    }
+    memory_region_add_subregion(
+        s->memory, s->memmap[TT_ATL_PRCM_RCPU].base,
+        sysbus_mmio_get_region(
+            SYS_BUS_DEVICE(&s->prcm[TT_ATLANTIS_PRCM_DOMAIN_RCPU]), 0));
+
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->prcm[TT_ATLANTIS_PRCM_DOMAIN_HSIO]),
+                        errp)) {
+        return;
+    }
+    memory_region_add_subregion(
+        s->memory, s->memmap[TT_ATL_PRCM_HSIO].base,
+        sysbus_mmio_get_region(
+            SYS_BUS_DEVICE(&s->prcm[TT_ATLANTIS_PRCM_DOMAIN_HSIO]), 0));
+
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->prcm[TT_ATLANTIS_PRCM_DOMAIN_PCIE]),
+                        errp)) {
+        return;
+    }
+    memory_region_add_subregion(
+        s->memory, s->memmap[TT_ATL_PRCM_PCIE].base,
+        sysbus_mmio_get_region(
+            SYS_BUS_DEVICE(&s->prcm[TT_ATLANTIS_PRCM_DOMAIN_PCIE]), 0));
+
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->prcm[TT_ATLANTIS_PRCM_DOMAIN_MM]),
+                        errp)) {
+        return;
+    }
+    memory_region_add_subregion(
+        s->memory, s->memmap[TT_ATL_PRCM_MM].base,
+        sysbus_mmio_get_region(
+            SYS_BUS_DEVICE(&s->prcm[TT_ATLANTIS_PRCM_DOMAIN_MM]), 0));
+
     /*
      * Atlantis contains a DesignWare uart while the QEMU machine
      * uses the serial_mm model with the base ns16550 register set.
@@ -654,6 +757,7 @@ static void tt_atlantis_machine_init(MachineState *machine)
                              OBJECT(&ams->soc_memory), &error_abort);
     object_property_set_link(OBJECT(&ams->soc), "dram", OBJECT(machine->ram),
                              &error_abort);
+
     qdev_realize(DEVICE(&ams->soc), NULL, &error_fatal);
 
     /* I2C peripherals: qemu specific */
diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index 3923308b7c..db1dfed157 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -14,6 +14,7 @@
 #include "hw/i2c/designware_i2c.h"
 #include "hw/intc/riscv_imsic.h"
 #include "hw/misc/unimp.h"
+#include "hw/misc/tt_atlantis_prcm.h"
 #include "hw/riscv/riscv_hart.h"
 
 #define TYPE_TT_ATLANTIS_MACHINE MACHINE_TYPE_NAME("tt-atlantis")
@@ -23,6 +24,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(TTAtlantisState, TT_ATLANTIS_MACHINE)
 OBJECT_DECLARE_SIMPLE_TYPE(TTAtlantisSoCState, TT_ATLANTIS_SOC)
 
 #define TT_ATL_NUM_I2C 5
+#define TT_ATL_NUM_PRCM 4
 
 struct TTAtlantisSoCState {
     /*< private >*/
@@ -41,6 +43,7 @@ struct TTAtlantisSoCState {
     DesignWareI2CState i2c[TT_ATL_NUM_I2C];
     UnimplementedDeviceState uart1;
     MemoryRegion bootrom;
+    TTAtlantisPRCMState prcm[TT_ATL_NUM_PRCM];
 
     uint32_t num_harts;
     char *cpu_type;
@@ -81,6 +84,25 @@ enum {
     TT_ATL_SAPLIC,
     TT_ATL_SIMSIC,
     TT_ATL_UART1,
+    TT_ATL_PRCM_RCPU,
+    TT_ATL_PRCM_HSIO,
+    TT_ATL_PRCM_PCIE,
+    TT_ATL_PRCM_MM,
+};
+
+/*
+ * RCPU PRCM Clock IDs, sourced from linux dt-bindings
+ * include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h
+ */
+enum {
+    TT_ATL_CLK_RCPU_PLL = 0,
+    TT_ATL_CLK_RCPU_ROOT = 1,
+    TT_ATL_CLK_NOC_PLL = 25,
+    TT_ATL_CLK_NOCC_CLK = 26,
+    TT_ATL_CLK_HSIO_PLL = 54,
+    TT_ATL_CLK_PCIE_PLL = 55,
+    TT_ATL_CLK_MM_PLL0 = 56,
+    TT_ATL_CLK_MM_PLL1 = 57,
 };
 
 #endif

-- 
2.43.0


