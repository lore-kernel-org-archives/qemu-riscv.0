Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DEAC43327
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 02:52:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weOZ5-0004at-HZ; Mon, 29 Jun 2026 22:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1weOZ3-0004a9-B3
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 22:51:09 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1weOZ1-0002l2-Hn
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 22:51:09 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-380544d00b1so142341a91.0
 for <qemu-riscv@nongnu.org>; Mon, 29 Jun 2026 19:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782787866; x=1783392666; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YgLh4IJHtjVfvl3RAAnDUdV/xqs9X9E4b/mYRuZaDCw=;
 b=cAeV7MXvDfD4p9pAr+sqQQ9zMDbLwzWBlrWPt4UIx59KTvV2FzgxscUfPu17WcNwa0
 A9cFOUjwXquZobU9bDpL2WPH2aGbB/kLI8Aqr1InTy3mjH2a/dftkOjBMz+lk6E0rEBf
 kLHKSIiMCzzRCPy4DhcJWbAnguHnaOGwEPFmKQYBe09wY4dKHnruIfWNseYpyHtIp6Lv
 U/RQ/QoUBQiacSj1GlJrxoyhcTK9zd0ybugQvkOWvv3OaQsubyaYPBFmBhevcZ2fUwvP
 Vkx7tblbCLV1RVhcuiAFHWt5YruZ1YyBmmwnv5pjPUhvJpZvA2rSqrOGl/uzz2srq3/U
 fOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782787866; x=1783392666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YgLh4IJHtjVfvl3RAAnDUdV/xqs9X9E4b/mYRuZaDCw=;
 b=ktQRt0YfO2eNlrf0G7pNJFxuGKrQ0k72QlWwbuZlhJCuIsMEdA3jTy/2AhOT+VcffN
 YMGVNYHhTa/BC2aPDxR/wduVbcl8obz55qMxdH4DukPM4/yu3QXwFfDapuakKn4brgIg
 T0OBJC1TkiH0Bm4zmqXq5OpheenRiJYUSdLiaCURD8dCfmmh3eLbWQE4kJorsxjlwi7j
 kuTCV2w1Nv1HiLxFFIueXPC658eBOQgs3uVszNqe04SmdWFMAPCuc8z3hDGrFi21Qvzs
 T24o6nMRr381+ULmLGklaInsj9wdxyEcOAZ5iP7uGbxNW7RbX/pyPjpNZ8MJ8aFawI9O
 gubA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqS4ubr9J3ilu+0d4fge4u8QUaJ8QePGBjfwCr8FNQptGdwdusGQMxrEgCKFqeTZMz/enhZoe8in9rk@nongnu.org
X-Gm-Message-State: AOJu0Yz6O9GGTC1U7LrZbwMHNnQ02JDErZEdA8eql3wCQoSyb5Ucv+6q
 WtzQkWbb8KqaP6zn4fpLQ3/QhIljkdt44VO7Dk3IROamVoZCKV50emRT
X-Gm-Gg: AfdE7ckr8e0Thevlk5eCIgdncPZJIct4SqKdJtK+zr5A+z5CKD6wzeliNlmmDj4MQGA
 OMtTOD/2eOVoOf0wk/O/0hmE+J4lLLPuXNJus4xk/riOjf0tcmNv5w4PUugWz18kTae+FqdENAu
 8UMgauTtWXQZuVJRuRaM/xSe5/6NGN1Em6ynsPT3auydaTB+rPfyYGrFpxSPiimLJdHr6IgxfjN
 MveHiMWqvZMvc6VL5Wx5qsVjT6fYPBkX73obYQUyiLeA6Wj7NuwwciiUQEIOViPaCJOx2wizMhc
 sJ3JA37eUxIVYh5KVi6Q+JpGAMy4rdWNz3ooB+5pbrJ2RfqKI+yanoDH6SzpAKoEDSbu3xhBfus
 tHSYNQBeBmKZ/fPtkLyoIDpf/AQWhZrR5BCjBh0GMEKZABO/rwnJdnSOx5wftsKVqtzHC1URqEk
 hvrctU1FSM9ImMl5L4IWAv2Ob3xDk9SAwGBWWk29NUahQW+SfkTa8u3TxiX4+6z5DvGUWzpWT0K
 tZcvf5Tm3idHX70dc91JYMtHls4TLuctdnAJtP+RtY=
X-Received: by 2002:a17:90b:224f:b0:368:83e6:ca95 with SMTP id
 98e67ed59e1d1-38052388689mr1449580a91.0.1782787866138; 
 Mon, 29 Jun 2026 19:51:06 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38052f32661sm704545a91.9.2026.06.29.19.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 19:51:05 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v10 11/12] hw/riscv/atlantis: Integrate i2c controllers
Date: Tue, 30 Jun 2026 12:19:49 +0930
Message-ID: <20260630024952.1520546-12-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630024952.1520546-1-joel@jms.id.au>
References: <20260630024952.1520546-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Add DesignWare I2C controllers to the tt-atlantis machine.

Provide a fixed clock in the device tree so that the Linux driver probes
without WARNing.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/riscv/tt_atlantis.h | 14 ++++++++
 hw/riscv/tt_atlantis.c         | 59 ++++++++++++++++++++++++++++++++++
 hw/riscv/Kconfig               |  1 +
 3 files changed, 74 insertions(+)

diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index a17732ce8114..7f7d4a5a5905 100644
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
     TT_ATL_UART1_IRQ = 39,
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
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index d4fa9c251d3b..5ce150fff7e9 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -54,6 +54,11 @@ static const MemMapEntry tt_atlantis_memmap[] = {
     [TT_ATL_ACLINT] =           { 0xa2180000,       0x10000 },
     [TT_ATL_SIMSIC] =           { 0xa4000000,      0x200000 },
     [TT_ATL_MAPLIC] =           { 0xcc000000,     0x4000000 },
+    [TT_ATL_I2C0] =             { 0xd4040000,       0x10000 },
+    [TT_ATL_I2C1] =             { 0xd4050000,       0x10000 },
+    [TT_ATL_I2C2] =             { 0xd4060000,       0x10000 },
+    [TT_ATL_I2C3] =             { 0xd4070000,       0x10000 },
+    [TT_ATL_I2C4] =             { 0xd4080000,       0x10000 },
     [TT_ATL_UART1] =            { 0xd4110000,       0x10000 },
     [TT_ATL_SAPLIC] =           { 0xe8000000,     0x4000000 },
     [TT_ATL_DDR_HI] =          { 0x100000000,  0x1000000000 },
@@ -275,10 +280,40 @@ static void create_fdt_rng(void *fdt)
     qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
 }
 
+static void create_fdt_clk(void *fdt, const char *clock_name,
+                           uint32_t freq, uint32_t phandle)
+{
+    g_autofree char *name = g_strdup_printf("/clocks/%s", clock_name);
+
+    qemu_fdt_add_path(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "fixed-clock");
+    qemu_fdt_setprop_string(fdt, name, "clock-output-names", clock_name);
+    qemu_fdt_setprop_cell(fdt, name, "#clock-cells", 0);
+    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", freq);
+    qemu_fdt_setprop_cell(fdt, name, "phandle", phandle);
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
@@ -292,6 +327,15 @@ static void finalize_fdt(TTAtlantisState *s)
 
     create_fdt_uart(fdt, &s->memmap[TT_ATL_UART1], TT_ATL_UART1_IRQ,
                     aplic_s_phandle);
+
+    create_fdt_clk(fdt, "periph-clk", 100000000, periph_clk_phandle);
+
+    for (int i = 0; i < TT_ATL_NUM_I2C; i++) {
+        create_fdt_i2c(fdt,
+                       &s->memmap[TT_ATL_I2C0 + i],
+                       TT_ATL_I2C0_IRQ + i,
+                       aplic_s_phandle, periph_clk_phandle);
+    }
 }
 
 static void create_fdt(TTAtlantisState *s)
@@ -492,6 +536,21 @@ static void tt_atlantis_machine_init(MachineState *machine)
                                 s->memmap[TT_ATL_UART1].base,
                                 s->memmap[TT_ATL_UART1].size);
 
+    /* I2C */
+    for (int i = 0; i < TT_ATL_NUM_I2C; i++) {
+        SysBusDevice *sbd;
+
+        object_initialize_child(OBJECT(s), "i2c[*]", &s->i2c[i],
+                                TYPE_DESIGNWARE_I2C);
+        sbd = SYS_BUS_DEVICE(&s->i2c[i]);
+        sysbus_realize(sbd, &error_fatal);
+        memory_region_add_subregion(system_memory,
+                                    s->memmap[TT_ATL_I2C0 + i].base,
+                                    sysbus_mmio_get_region(sbd, 0));
+        sysbus_connect_irq(sbd, 0,
+                           qdev_get_gpio_in(s->irqchip, TT_ATL_I2C0_IRQ + i));
+    }
+
     /* Load or create device tree */
     if (machine->dtb) {
         load_fdt(s);
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 5033415440d4..dcce819bf6e9 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -129,6 +129,7 @@ config TENSTORRENT
     select RISCV_IMSIC
     select SERIAL_MM
     select DEVICE_TREE
+    select DESIGNWARE_I2C
 
 config XIANGSHAN_KUNMINGHU
     bool
-- 
2.47.3


