Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB5FCD6E54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 12:53:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSwgT-00056T-GP; Fri, 29 May 2026 08:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>) id 1wSwgR-00052r-HX
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 08:51:27 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>) id 1wSwgP-0006O6-IX
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 08:51:27 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-83945063f70so6695269b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780059084; x=1780663884; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BsNa9aCVyTTB2LpanIeTZACYZwi0hW4ugdss0KkHJ5Y=;
 b=oVraCmandQ2l89EHbnO9v1lcr+GfmGz8dvEFs0J/7MQVMeaMFjPc9mzySXMsfho8wm
 VbziFB6ufXEObU1e0T0H2b9MZxD5IJGyGYbimnwuuenGbTlD1StH29l31d4U87JojqZ1
 jQ46wrOXjqYsTn10rXuX2+VnWfkRaDUNnhJZ0ZitCmXsueR0/j8eq4PmWFJ40BN2uiu8
 kgx898QJd4m28TDuuBK4ejQRml6XThpO+poBkZqU7XW1vHjUp3jW6f1tDc9/mNL6ejWr
 ww5d+2qK4nXJkP0ipof7WCErICGhuQ+LRhZ3zEUDap5Q2mlUfQwas5W3VXX8a9RqSGJx
 Hvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780059084; x=1780663884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BsNa9aCVyTTB2LpanIeTZACYZwi0hW4ugdss0KkHJ5Y=;
 b=iDPR1KHmauardNatuaGETbeuqKwTTIyt22ZQeoKOByLAHtXtXxajtrKEC2MfoxbA4t
 /IEZl7r5OV1GdZJLC4PJJU45MljQoAusPJOY7UdOGhHVA7aKPSbgCmz7OULl2ocGwUjg
 eVHR7vmypWl40/pulKyw4D+ku6rQwudrjznS0rJidJi7cvsimdrkTcjdk6RR86yR9S0K
 9V02sc5eTbpJUoUNC3Tw8ukB+TtM5/HhsZM7PWzoZwJflS0ayy1k+y4JpvgyLUgM8lA9
 mEFaBCcKEHxJnrLD5Bzn3/do+KS+irveDHvkhPtlMD1QQMe8nBJA5T9POsnZerQq9X9Z
 mB7Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9n9aLElX5UIcMvrYmy9E+jrWwA1x3Mylasdw08EsnzJ28/tFjdLahQOjci82IIM8KDSo4fhog+QMJz@nongnu.org
X-Gm-Message-State: AOJu0YzEsvhvSKb8V6dRXWfjrXxLwxOJDfT0p3McVuMAGiJNRdaUIgPm
 nY8HJ/whjUoZpfh9lTC3yW4avFSZyCcArEDknedKs37omhXBPVcbfpuqu75Zww==
X-Gm-Gg: Acq92OFo9V4dREmbF8j2l7zQE3Rm9R+O59eE6w8/eE4QgK3rC51ZAcG8QYM7h5w/J5O
 ZNxAAXXk4puqNoUPq1Atkr0OV6FvBupNYP3Q3fijHKE+3HvLyPpMGdtCO0Z9J6+wYCBZOmTAhkM
 3EdDq62gvRkLW9ZmLGcaLwLjBFcj5KcPebnF/MMfBDtuaacoZmgHfvH3jrDkR/KIZqaAncdJE7U
 xOs4225ON2gTjwbZsnRkCOKnToxLTY4bRr30vQXfV85MQ1vr0VriST6byaX/8a1mc6XKh98aDz+
 V3iH9LzKUu+YvcL+6xrsI4m6BPpwfj+62JshaGfmW7TW6tciu2448/AxxpKZXyd/FGCZonA6aKS
 XcNmMKkCW1tP8N73GF6lr2VUQQkErSgA4CN/xS6L65ISGXXzQ7C6OZasnxfgIq8esTX984JHdkR
 IE0oQpPOYF3T7pTxQULe9HEJBCF8nOXrDgcfXJhxzJtapp/nZS+hhOTFHkVGR+X7koaLdCwrTBV
 0nLe7OP3hJG1WBl0A4=
X-Received: by 2002:a05:6a20:1588:b0:3b3:3852:6663 with SMTP id
 adf61e73a8af0-3b40fcdcdfemr2963580637.24.1780059084030; 
 Fri, 29 May 2026 05:51:24 -0700 (PDT)
Received: from localhost (124.158.97.178.qld.leaptel.network. [124.158.97.178])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85772baab6sm2145420a12.24.2026.05.29.05.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 05:51:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 09/10] hw/riscv/atlantis: Integrate i2c controllers
Date: Fri, 29 May 2026 05:50:34 -0700
Message-ID: <20260529125036.728206-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529125036.728206-1-npiggin@gmail.com>
References: <20260529125036.728206-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Joel Stanley <joel@jms.id.au>

Add DesignWare I2C controllers to the tt-atlantis machine.

Provide a fixed clock in the device tree so that the Linux driver probes
without WARNing.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/riscv/Kconfig               |  1 +
 hw/riscv/tt_atlantis.c         | 53 ++++++++++++++++++++++++++++++++++
 include/hw/riscv/tt_atlantis.h | 14 +++++++++
 3 files changed, 68 insertions(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index aaf029c9ed..38180a903f 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -129,6 +129,7 @@ config TENSTORRENT
     select RISCV_IMSIC
     select SERIAL_MM
     select DEVICE_TREE
+    select DESIGNWARE_I2C
 
 config XIANGSHAN_KUNMINGHU
     bool
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 20db26f982..39979c662b 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -59,6 +59,11 @@ static const MemMapEntry tt_atlantis_memmap[] = {
     [TT_ATL_SIMSIC] =           { 0xa4000000,      0x200000 },
     [TT_ATL_TIMER] =            { 0xa8020000,       0x10000 },
     [TT_ATL_UART0] =            { 0xb0100000,       0x10000 },
+    [TT_ATL_I2C0] =             { 0xb0400000,       0x10000 },
+    [TT_ATL_I2C1] =             { 0xb0500000,       0x10000 },
+    [TT_ATL_I2C2] =             { 0xb0600000,       0x10000 },
+    [TT_ATL_I2C3] =             { 0xb0700000,       0x10000 },
+    [TT_ATL_I2C4] =             { 0xb0800000,       0x10000 },
     [TT_ATL_MAPLIC] =           { 0xcc000000,     0x4000000 },
     [TT_ATL_SAPLIC] =           { 0xe8000000,     0x4000000 },
     [TT_ATL_DDR_HI] =          { 0x100000000,  0x1000000000 },
@@ -329,10 +334,36 @@ static void create_fdt_uart(void *fdt, const MemMapEntry *mem, int irq,
     qemu_fdt_setprop_string(fdt, "/aliases", "serial0", name);
 }
 
+static void create_fdt_clk(void *fdt, const char *name, uint32_t clk_phandle)
+{
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "fixed-clock");
+    qemu_fdt_setprop_cell(fdt, name, "#clock-cells", 0);
+    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 100000000);
+    qemu_fdt_setprop_cell(fdt, name, "phandle", clk_phandle);
+}
+
+static void create_fdt_i2c(void *fdt, const MemMapEntry *mem, uint32_t irq,
+                           uint32_t irqchip_phandle, uint32_t clk_phandle)
+{
+    g_autofree char *name = g_strdup_printf("/soc/i2c@%"HWADDR_PRIX, mem->base);
+
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "snps,designware-i2c");
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg", 2, mem->base, 2, mem->size);
+    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irqchip_phandle);
+    qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x4);
+    qemu_fdt_setprop_cell(fdt, name, "clocks", clk_phandle);
+    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 100000);
+    qemu_fdt_setprop_cell(fdt, name, "#address-cells", 1);
+    qemu_fdt_setprop_cell(fdt, name, "#size-cells", 0);
+}
+
 static void finalize_fdt(TTAtlantisState *s)
 {
     uint32_t aplic_s_phandle = next_phandle();
     uint32_t imsic_s_phandle = next_phandle();
+    uint32_t periph_clk_phandle = next_phandle();
     void *fdt = MACHINE(s)->fdt;
 
     create_fdt_cpu(s, s->memmap, aplic_s_phandle, imsic_s_phandle);
@@ -346,6 +377,15 @@ static void finalize_fdt(TTAtlantisState *s)
 
     create_fdt_uart(fdt, &s->memmap[TT_ATL_UART0], TT_ATL_UART0_IRQ,
                     aplic_s_phandle);
+
+    create_fdt_clk(fdt, "/periph-clk", periph_clk_phandle);
+
+    for (int i = 0; i < TT_ATL_NUM_I2C; i++) {
+        create_fdt_i2c(fdt,
+                       &s->memmap[TT_ATL_I2C0 + i],
+                       TT_ATL_I2C0_IRQ + i,
+                       aplic_s_phandle, periph_clk_phandle);
+    }
 }
 
 static void create_fdt(TTAtlantisState *s)
@@ -542,6 +582,19 @@ static void tt_atlantis_machine_init(MachineState *machine)
                    qdev_get_gpio_in(s->irqchip, TT_ATL_UART0_IRQ),
                    115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
+    /* I2C */
+    for (int i = 0; i < TT_ATL_NUM_I2C; i++) {
+        object_initialize_child(OBJECT(s), "i2c[*]", &s->i2c[i],
+                                TYPE_DESIGNWARE_I2C);
+        sysbus_realize(SYS_BUS_DEVICE(&s->i2c[i]), &error_fatal);
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->i2c[i]);
+        memory_region_add_subregion(system_memory,
+                                    s->memmap[TT_ATL_I2C0 + i].base,
+                                    sysbus_mmio_get_region(sbd, 0));
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c[i]), 0,
+                           qdev_get_gpio_in(s->irqchip, TT_ATL_I2C0_IRQ + i));
+    }
+
     /* Load or create device tree */
     if (machine->dtb) {
         machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index 960dc07841..ddea317409 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -11,12 +11,15 @@
 
 #include "hw/core/boards.h"
 #include "hw/core/sysbus.h"
+#include "hw/i2c/designware_i2c.h"
 #include "hw/intc/riscv_imsic.h"
 #include "hw/riscv/riscv_hart.h"
 
 #define TYPE_TT_ATLANTIS_MACHINE MACHINE_TYPE_NAME("tt-atlantis")
 OBJECT_DECLARE_SIMPLE_TYPE(TTAtlantisState, TT_ATLANTIS_MACHINE)
 
+#define TT_ATL_NUM_I2C 5
+
 struct TTAtlantisState {
     /*< private >*/
     MachineState parent;
@@ -27,11 +30,17 @@ struct TTAtlantisState {
 
     RISCVHartArrayState soc;
     DeviceState *irqchip;
+    DesignWareI2CState i2c[TT_ATL_NUM_I2C];
 
     int fdt_size;
 };
 
 enum {
+    TT_ATL_I2C0_IRQ = 33,
+    TT_ATL_I2C1_IRQ = 34,
+    TT_ATL_I2C2_IRQ = 35,
+    TT_ATL_I2C3_IRQ = 36,
+    TT_ATL_I2C4_IRQ = 37,
     TT_ATL_UART0_IRQ = 38,
 };
 
@@ -40,6 +49,11 @@ enum {
     TT_ATL_BOOTROM,
     TT_ATL_DDR_LO,
     TT_ATL_DDR_HI,
+    TT_ATL_I2C0,
+    TT_ATL_I2C1,
+    TT_ATL_I2C2,
+    TT_ATL_I2C3,
+    TT_ATL_I2C4,
     TT_ATL_MAPLIC,
     TT_ATL_MIMSIC,
     TT_ATL_SAPLIC,
-- 
2.53.0


