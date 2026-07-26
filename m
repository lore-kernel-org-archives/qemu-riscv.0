Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095CEC531C9
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jul 2026 12:30:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wnxz6-0001Pa-3G; Sun, 26 Jul 2026 08:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wnxyz-0001M8-Vu
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 08:29:32 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wnxyx-0003Ig-Ci
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 08:29:29 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-84e04df8c46so1936753b3a.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Jul 2026 05:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785068966; x=1785673766; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TjDsmoQwXb9x1HeskAUizFx6TpagdSECUOBKC6EHW7o=;
 b=lFfaX00CUk7VeyqgihCu9GVkOClVvBJ3zkvf/umK3Zlk7F99Dqce21/snVlBGuaFDN
 wN085ywYBi35bVR5ESg2rEW9oOWowMRYNOIEewS3kNn1sFsK9YtTsoykR37Qqj+ORF6f
 Sh0FopBWqFX+o3W09jMyTFKDWSaTKgrJpLs9lAS0zTAarzRg1Yrzj8PN3QaFWtRhia2p
 fRDIS2OfEEB+m7NJh3vUN5M0DsE64aI0iM9LOlKI9lUszFr5jbXpo0TXG/l8gDVJ1TLI
 SOyKE2qZtrijNy5+mKRVR863qlqNvgdGSTDk2iUOMp/D14MtYoTNDNtdrQ0k4nge9QM7
 2buQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785068966; x=1785673766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TjDsmoQwXb9x1HeskAUizFx6TpagdSECUOBKC6EHW7o=;
 b=KeVZD4TTWXA7boGOgeXk4alqELS3EzT6e9PCwF0g4BvrtTEbSBubpL30AGJ7ZPnjzw
 cDce4ZtA3gmfW2NiraxWST92I9PFqVX/AOv5OM5ePFVJhKfNBaIif7pyFBbc7kW+xFOU
 TIBwyD0X/pYQvqrlNwb6MsN5hX7P96GZml7t2ECnQbDSMvchFJdKfDzrV8yZrpwvzF1c
 rsChPDtxq/bhIIqyyuYePyh+h4HRxzPvwMmtxxAon55E/x/t8g8gUt46D7r+IHgKLXg1
 AwY9IeAquRnRaBys8o0goTJZnfym4Wd8x3UAfsL8nbLikFX4ZFXM7IhnsOXxBNUWtnym
 H2qA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqUoKbA+Aawt8b75LPj1r1iJ5nUvbLtqUuEfxILQXWRbIHLAzCdzPyyz7o1cw9Rsp0M0tcwtUk43UtO@nongnu.org
X-Gm-Message-State: AOJu0Yz9KCAfuJsXYvpRLU8E+WvI+2hU3WtEgDQZg9RoM5SHa70lyyG9
 JdKkcCY7EZMft/dtdZpDyUQ1WHUF+HtqGSfQlhEpP0Gc5iL9JoAeL/DP
X-Gm-Gg: AR+sD11viGH/0VoDMLjTpFEhAYbsXtjx81jdjp1ff30JdG83+JbuvMQkKk0WeJy4uUb
 WHreT+1LuaIn3l5m16HMbacxsUNtp0NZ8NTN9MfBtZxFvDRqIvFh+AvBdIUb3FdUCQTqh2523uz
 1g1LHivHUrQuG9gzuwMiaW/iPQc6F41o7kHPInSmGcGea4PN7EEURXWsfjGtPbbli/3VCPTj7HF
 YHXm5BAYkJXf35Hi0PsShuPB3wLuMrCqtd1CGoQs3jADm46UVvRT1QhCK/1K1CSO3gjD//4U2mk
 PQNasAhd9PFmuiDTduccn/BpObyVuBXIl2kXjdTgO13oNM4/Csou8CdNPO4+mCBjrq5lsqmivGh
 1yqd5gEYZo1AH8Bm4FS5M5h9U7+jCvbaBDUSzyLeIjg080kBiJmaooP5JLq2xo30xrRf4bq+8dh
 NA2Lg69BulMRobxnKbkUKJ2gxHqm59z50=
X-Received: by 2002:a05:6a00:a21f:b0:845:c5d5:3745 with SMTP id
 d2e1a72fcca58-84e594ad97cmr3979000b3a.34.1785068966000; 
 Sun, 26 Jul 2026 05:29:26 -0700 (PDT)
Received: from localhost.localdomain ([111.201.4.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e53426628sm1861647b3a.49.2026.07.26.05.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2026 05:29:25 -0700 (PDT)
From: Kangjie Huang <flamboyant.h.01@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kangjie Huang <flamboyant.h.01@gmail.com>, qemu-riscv@nongnu.org,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 05/11] hw/riscv: Route K230 SSI IRQs to the PLIC
Date: Sun, 26 Jul 2026 20:28:23 +0800
Message-ID: <662158aeebfeaaa278fc89554142cb9dd89f02d2.1785064313.git.flamboyant.h.01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785064312.git.flamboyant.h.01@gmail.com>
References: <cover.1785064312.git.flamboyant.h.01@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Connect the nine GPIO outputs from each K230 SSI controller to their PLIC
sources.

Check the TXE PLIC route for all three instances and verify RXU routing
and instance isolation for spi1 in qtest.

Signed-off-by: Kangjie Huang <flamboyant.h.01@gmail.com>
---
 hw/riscv/k230.c                | 36 +++++++++++++++++++++++++
 include/hw/riscv/k230.h        |  3 +++
 tests/qtest/k230-dw-ssi-test.c | 48 ++++++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
index acd5445b31..1863d5ecbb 100644
--- a/hw/riscv/k230.c
+++ b/hw/riscv/k230.c
@@ -102,6 +102,21 @@ static const MemMapEntry memmap[] = {
     [K230_DEV_CLINT] =        { 0xF04000000, 0x00400000 },
 };
 
+typedef struct K230SsiRoute {
+    unsigned int ssi_index;
+    unsigned int irq_base;
+} K230SsiRoute;
+
+/*
+ * SDK numbering follows the address map: spi0 is the SPI-OPI instance,
+ * while spi1 and spi2 are QSPI0 and QSPI1.
+ */
+static const K230SsiRoute k230_ssi_routes[] = {
+    { .ssi_index = 2, .irq_base = K230_SPI0_IRQ_BASE },
+    { .ssi_index = 0, .irq_base = K230_SPI1_IRQ_BASE },
+    { .ssi_index = 1, .irq_base = K230_SPI2_IRQ_BASE },
+};
+
 static void k230_soc_init(Object *obj)
 {
     K230SoCState *s = RISCV_K230_SOC(obj);
@@ -157,6 +172,25 @@ static void k230_create_uart(MemoryRegion *sys_mem, DeviceState *plic,
                    399193, serial_hd(index), DEVICE_LITTLE_ENDIAN);
 }
 
+static void k230_connect_ssi_irqs(K230SoCState *s)
+{
+    for (size_t route_idx = 0;
+         route_idx < ARRAY_SIZE(k230_ssi_routes); route_idx++) {
+        const K230SsiRoute *route = &k230_ssi_routes[route_idx];
+        SysBusDevice *ssi;
+
+        g_assert(route->ssi_index < ARRAY_SIZE(s->dw_ssi));
+        g_assert(route->irq_base + K230_DW_SSI_IRQ_COUNT <=
+                 K230_PLIC_NUM_SOURCES);
+
+        ssi = SYS_BUS_DEVICE(&s->dw_ssi[route->ssi_index]);
+        for (unsigned int i = 0; i < K230_DW_SSI_IRQ_COUNT; i++) {
+            sysbus_connect_irq(ssi, i,
+                qdev_get_gpio_in(DEVICE(s->c908_plic), route->irq_base + i));
+        }
+    }
+}
+
 static void k230_soc_realize(DeviceState *dev, Error **errp)
 {
     K230SoCState *s = RISCV_K230_SOC(dev);
@@ -217,6 +251,8 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    k230_connect_ssi_irqs(s);
+
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[0]), 0, memmap[K230_DEV_WDT0].base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->wdt[0]), 0,
                        qdev_get_gpio_in(DEVICE(s->c908_plic), K230_WDT0_IRQ));
diff --git a/include/hw/riscv/k230.h b/include/hw/riscv/k230.h
index 4a79b7ed45..cfe30590cc 100644
--- a/include/hw/riscv/k230.h
+++ b/include/hw/riscv/k230.h
@@ -131,6 +131,9 @@ enum {
     K230_UART4_IRQ  = 20,
     K230_WDT0_IRQ   = 107,
     K230_WDT1_IRQ   = 108,
+    K230_SPI0_IRQ_BASE = 146,
+    K230_SPI1_IRQ_BASE = 155,
+    K230_SPI2_IRQ_BASE = 164,
 };
 
 #define K230_UART_COUNT 5
diff --git a/tests/qtest/k230-dw-ssi-test.c b/tests/qtest/k230-dw-ssi-test.c
index 0a3d03d6f3..e6c0e2ee8c 100644
--- a/tests/qtest/k230-dw-ssi-test.c
+++ b/tests/qtest/k230-dw-ssi-test.c
@@ -13,6 +13,8 @@
 #define K230_SPI0_BASE          0x91584000ULL
 #define K230_SPI1_BASE          0x91582000ULL
 #define K230_SPI2_BASE          0x91583000ULL
+#define K230_PLIC_BASE          0xf00000000ULL
+#define K230_PLIC_PENDING_BASE  0x1000
 #define K230_SSI_CTRLR0          0x000
 #define K230_SSI_CTRLR1          0x004
 #define K230_SSI_SSIENR          0x008
@@ -69,12 +71,18 @@
 #define K230_SSI_INT_AXIE               BIT(8)
 #define K230_SSI_INT_DONE               BIT(11)
 
+#define K230_SSI_IRQ_TXE                0
+#define K230_SSI_IRQ_RXU                5
+#define K230_SSI_IRQ_DONE               7
+#define K230_SSI_IRQ_AXIE               8
+
 #define K230_SSI_FIFO_DEPTH             256
 
 typedef struct K230SsiInstance {
     uint64_t base;
     uint32_t num_cs;
     uint32_t spi_ctrlr0_reset;
+    uint32_t first_irq;
 } K230SsiInstance;
 
 static const K230SsiInstance k230_ssi_instances[3] = {
@@ -82,14 +90,17 @@ static const K230SsiInstance k230_ssi_instances[3] = {
         .base = K230_SPI0_BASE,
         .num_cs = 1,
         .spi_ctrlr0_reset = K230_SSI_SPI_CTRLR0_FMC_RESET,
+        .first_irq = 146,
     }, {
         .base = K230_SPI1_BASE,
         .num_cs = 5,
         .spi_ctrlr0_reset = K230_SSI_SPI_CTRLR0_SPI_RESET,
+        .first_irq = 155,
     }, {
         .base = K230_SPI2_BASE,
         .num_cs = 5,
         .spi_ctrlr0_reset = K230_SSI_SPI_CTRLR0_SPI_RESET,
+        .first_irq = 164,
     },
 };
 
@@ -178,6 +189,14 @@ static void configure_loopback(QTestState *qts, uint32_t tmod,
                     ctrlr0 | K230_SSI_CTRLR0_SRL);
 }
 
+static bool k230_ssi_plic_pending(QTestState *qts, uint32_t irq)
+{
+    uint64_t addr = K230_PLIC_BASE + K230_PLIC_PENDING_BASE +
+                    (irq / 32) * sizeof(uint32_t);
+
+    return qtest_readl(qts, addr) & BIT(irq % 32);
+}
+
 static void test_register_contract(void)
 {
     QTestState *qts = k230_ssi_start();
@@ -279,6 +298,34 @@ static void test_interrupt_controller(void)
     qtest_quit(qts);
 }
 
+static void test_plic_routing(void)
+{
+    QTestState *qts = k230_ssi_start();
+    const K230SsiInstance *target = &k230_ssi_instances[1];
+
+    for (int i = 0; i < ARRAY_SIZE(k230_ssi_instances); i++) {
+        const K230SsiInstance *inst = &k230_ssi_instances[i];
+
+        g_assert_true(k230_ssi_plic_pending(qts,
+                                           inst->first_irq +
+                                           K230_SSI_IRQ_TXE));
+        k230_ssi_writel(qts, inst->base, K230_SSI_IMR, 0);
+    }
+
+    k230_ssi_writel(qts, target->base, K230_SSI_IMR, K230_SSI_INT_RXU);
+    (void)k230_ssi_read_frame(qts, target->base);
+    g_assert_true(k230_ssi_plic_pending(qts,
+                                       target->first_irq +
+                                       K230_SSI_IRQ_RXU));
+    for (int i = 0; i < ARRAY_SIZE(k230_ssi_instances); i++) {
+        if (&k230_ssi_instances[i] != target) {
+            g_assert_false(k230_ssi_plic_pending(
+                qts, k230_ssi_instances[i].first_irq + K230_SSI_IRQ_RXU));
+        }
+    }
+    qtest_quit(qts);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -287,5 +334,6 @@ int main(int argc, char **argv)
     qtest_add_func("/k230-dw-ssi/pio-data-path", test_pio_data_path);
     qtest_add_func("/k230-dw-ssi/interrupt-controller",
                    test_interrupt_controller);
+    qtest_add_func("/k230-dw-ssi/plic-routing", test_plic_routing);
     return g_test_run();
 }
-- 
2.43.0


