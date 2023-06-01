Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D073C7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 09:36:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4eiK-0007kH-Cr; Thu, 01 Jun 2023 05:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4eiH-0007iZ-Qk
 for qemu-riscv@nongnu.org; Thu, 01 Jun 2023 05:35:21 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4ei6-0000GA-3n
 for qemu-riscv@nongnu.org; Thu, 01 Jun 2023 05:35:21 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30ad458f085so1532192f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 01 Jun 2023 02:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685612106; x=1688204106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TdXkShqXWPbWzEZ0sD1ST7mNiLXOQxbG4dnB48iOt9Y=;
 b=ofFVUJM8Gprwb2GehV3ZgIqY+5QwlzSMP+jR+PaSFiwTTXTRNoYANiqH6fTKmAe6Cf
 fX6SNBC2ZZa9+T3WQsHCKVQeo6T5cHOWLz3BhSveo/l9k0MFjLpUDaTgt2TbKnbu77lf
 4ORin8Xayfmeedfw70lk8RzKygNd2PPelXK5CQhFp4oPI8HPo4U3K3EilwgTPIC0hWRY
 oxqvb36St8OvE6Jl65vjszOefUnny4kgaDqwZ+Ra0qH2WVrhVQT30YU+JphAIExM6pt1
 JRjpyGnIzjKEj/k6GvPkEcFxfxhoV/eVSStbo2RMng+FJpnT213kx8mUBHJCDLUjrfA6
 /mWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685612106; x=1688204106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TdXkShqXWPbWzEZ0sD1ST7mNiLXOQxbG4dnB48iOt9Y=;
 b=UDwgSjDH0efTI/kW+a/CSNUh+UBfZTbiJLrDeOGoeK+O9oM85gaY0shAyCSTucRDjl
 oTBLzkrRILdpmJklJNSDSitWJZ6r9Wd57cTJwixw1eez7LdkcuN6bIokOjH3TZj/ivQ4
 Ot0HOve4kvTdUh4j/R+chUjP9zNxaa76nKOPZ7Y0BR9x75g592inUmCZes2vkNYgOu56
 WngugcpIkdKl6fQTQk8aSAanTL6hN+5jcgVm5EgGznGg9ld/C/hq+wyAn/ZVhvtOsfKI
 exvONlehD+vxQNJtLfFGS1kuSYHuOKNaMd69UepjrVJfLDgpGEW79h0t98bwEsUBbVPW
 sxrQ==
X-Gm-Message-State: AC+VfDz5OTw2ad1vTEcC/QmuEmUIkW8UfyPhnhjOfeEDbr+YErPlEMhm
 e/dLMw189u13nYpUAoAw8NtNGQ==
X-Google-Smtp-Source: ACHHUZ6M42HLyrhRX5HpyRDaoQwDR/HQc3r7SG7EfImwlEi2CsY2vd1+1IkPiEvgdH987OaoEpDMbw==
X-Received: by 2002:adf:dc91:0:b0:307:7d1a:20fd with SMTP id
 r17-20020adfdc91000000b003077d1a20fdmr1052138wrj.12.1685612105716; 
 Thu, 01 Jun 2023 02:35:05 -0700 (PDT)
Received: from localhost.localdomain ([176.176.141.224])
 by smtp.gmail.com with ESMTPSA id
 o11-20020adfeacb000000b0030ae7bd1737sm9714903wrn.45.2023.06.01.02.35.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 Jun 2023 02:35:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] bulk: Remove pointless QOM casts
Date: Thu,  1 Jun 2023 11:34:52 +0200
Message-Id: <20230601093452.38972-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230601093452.38972-1-philmd@linaro.org>
References: <20230601093452.38972-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Mechanical change running Coccinelle spatch with content
generated from the qom-cast-macro-clean-cocci-gen.py added
in the previous commit.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 block/nbd.c                 |  4 ++--
 chardev/char-pty.c          |  2 +-
 hw/arm/musicpal.c           |  2 +-
 hw/arm/xlnx-versal.c        |  2 +-
 hw/display/vhost-user-gpu.c |  4 ++--
 hw/intc/loongarch_extioi.c  |  6 +++---
 hw/m68k/q800.c              |  2 +-
 hw/pci-host/bonito.c        |  2 +-
 hw/ppc/pnv_lpc.c            |  2 +-
 hw/ppc/pnv_occ.c            |  2 +-
 hw/ppc/pnv_sbe.c            |  2 +-
 hw/riscv/virt.c             | 10 +++++-----
 hw/rx/rx62n.c               |  2 +-
 hw/scsi/esp-pci.c           | 18 +++++++++---------
 hw/sparc/sun4m.c            |  4 ++--
 hw/virtio/virtio-mem-pci.c  |  6 +++---
 hw/virtio/virtio-pmem-pci.c |  6 +++---
 migration/fd.c              |  4 ++--
 migration/multifd.c         |  2 +-
 migration/yank_functions.c  |  4 ++--
 nbd/client-connection.c     |  2 +-
 nbd/server.c                |  2 +-
 softmmu/qdev-monitor.c      |  2 +-
 ui/vnc-ws.c                 |  6 +++---
 24 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index a3f8f8a9d5..5aef5cb6bd 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -397,7 +397,7 @@ static void coroutine_fn GRAPH_RDLOCK nbd_reconnect_attempt(BDRVNBDState *s)
 
     /* Finalize previous connection if any */
     if (s->ioc) {
-        qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
+        qio_channel_detach_aio_context(s->ioc);
         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
                                  nbd_yank, s->bs);
         object_unref(OBJECT(s->ioc));
@@ -1455,7 +1455,7 @@ static void nbd_yank(void *opaque)
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
     QEMU_LOCK_GUARD(&s->requests_lock);
-    qio_channel_shutdown(QIO_CHANNEL(s->ioc), QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+    qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
     s->state = NBD_CLIENT_QUIT;
 }
 
diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index 92fd33c854..4e5deac18a 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -334,7 +334,7 @@ static void char_pty_open(Chardev *chr,
     s = PTY_CHARDEV(chr);
     s->ioc = QIO_CHANNEL(qio_channel_file_new_fd(master_fd));
     name = g_strdup_printf("chardev-pty-%s", chr->label);
-    qio_channel_set_name(QIO_CHANNEL(s->ioc), name);
+    qio_channel_set_name(s->ioc, name);
     g_free(name);
     s->timer_src = NULL;
     *be_opened = false;
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 58f3d30c9b..dc4e43e0ee 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1250,7 +1250,7 @@ static void musicpal_init(MachineState *machine)
     uart_orgate = DEVICE(object_new(TYPE_OR_IRQ));
     object_property_set_int(OBJECT(uart_orgate), "num-lines", 2, &error_fatal);
     qdev_realize_and_unref(uart_orgate, NULL, &error_fatal);
-    qdev_connect_gpio_out(DEVICE(uart_orgate), 0,
+    qdev_connect_gpio_out(uart_orgate, 0,
                           qdev_get_gpio_in(pic, MP_UART_SHARED_IRQ));
 
     serial_mm_init(address_space_mem, MP_UART1_BASE, 2,
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 69b1b99e93..db1e0dee6e 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -327,7 +327,7 @@ static void versal_create_rtc(Versal *s, qemu_irq *pic)
     object_initialize_child(OBJECT(s), "rtc", &s->pmc.rtc,
                             TYPE_XLNX_ZYNQMP_RTC);
     sbd = SYS_BUS_DEVICE(&s->pmc.rtc);
-    sysbus_realize(SYS_BUS_DEVICE(sbd), &error_fatal);
+    sysbus_realize(sbd, &error_fatal);
 
     mr = sysbus_mmio_get_region(sbd, 0);
     memory_region_add_subregion(&s->mr_ps, MM_PMC_RTC, mr);
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 71dfd956b8..1386e869e5 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -364,11 +364,11 @@ vhost_user_gpu_gl_flushed(VirtIOGPUBase *b)
     VhostUserGPU *g = VHOST_USER_GPU(b);
 
     if (g->backend_blocked) {
-        vhost_user_gpu_unblock(VHOST_USER_GPU(g));
+        vhost_user_gpu_unblock(g);
         g->backend_blocked = false;
     }
 
-    vhost_user_gpu_update_blocked(VHOST_USER_GPU(g), false);
+    vhost_user_gpu_update_blocked(g, false);
 }
 
 static bool
diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
index 0e7a3e32f3..af75460643 100644
--- a/hw/intc/loongarch_extioi.c
+++ b/hw/intc/loongarch_extioi.c
@@ -276,7 +276,7 @@ static void loongarch_extioi_instance_init(Object *obj)
     int i, cpu, pin;
 
     for (i = 0; i < EXTIOI_IRQS; i++) {
-        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[i]);
+        sysbus_init_irq(dev, &s->irq[i]);
     }
 
     qdev_init_gpio_in(DEVICE(obj), extioi_setirq, EXTIOI_IRQS);
@@ -284,14 +284,14 @@ static void loongarch_extioi_instance_init(Object *obj)
     for (cpu = 0; cpu < EXTIOI_CPUS; cpu++) {
         memory_region_init_io(&s->extioi_iocsr_mem[cpu], OBJECT(s), &extioi_ops,
                               s, "extioi_iocsr", 0x900);
-        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->extioi_iocsr_mem[cpu]);
+        sysbus_init_mmio(dev, &s->extioi_iocsr_mem[cpu]);
         for (pin = 0; pin < LS3A_INTC_IP; pin++) {
             qdev_init_gpio_out(DEVICE(obj), &s->parent_irq[cpu][pin], 1);
         }
     }
     memory_region_init_io(&s->extioi_system_mem, OBJECT(s), &extioi_ops,
                           s, "extioi_system_mem", 0x900);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->extioi_system_mem);
+    sysbus_init_mmio(dev, &s->extioi_system_mem);
 }
 
 static void loongarch_extioi_class_init(ObjectClass *klass, void *data)
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index b35ecafbc7..68f0cd8cac 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -525,7 +525,7 @@ static void q800_init(MachineState *machine)
     qdev_realize_and_unref(escc_orgate, NULL, &error_fatal);
     sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(escc_orgate, 0));
     sysbus_connect_irq(sysbus, 1, qdev_get_gpio_in(escc_orgate, 1));
-    qdev_connect_gpio_out(DEVICE(escc_orgate), 0,
+    qdev_connect_gpio_out(escc_orgate, 0,
                           qdev_get_gpio_in(glue, GLUE_IRQ_IN_ESCC));
     sysbus_mmio_map(sysbus, 0, SCC_BASE);
 
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 1cf25bab8d..4701481b9b 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -656,7 +656,7 @@ static void bonito_pci_realize(PCIDevice *dev, Error **errp)
     PCIBonitoState *s = PCI_BONITO(dev);
     SysBusDevice *sysbus = SYS_BUS_DEVICE(s->pcihost);
     PCIHostState *phb = PCI_HOST_BRIDGE(s->pcihost);
-    BonitoState *bs = BONITO_PCI_HOST_BRIDGE(s->pcihost);
+    BonitoState *bs = s->pcihost;
     MemoryRegion *pcimem_alias = g_new(MemoryRegion, 1);
 
     /*
diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
index 605d390861..d692858bee 100644
--- a/hw/ppc/pnv_lpc.c
+++ b/hw/ppc/pnv_lpc.c
@@ -744,7 +744,7 @@ static void pnv_lpc_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&lpc->opb_mr, LPC_HC_REGS_OPB_ADDR,
                                 &lpc->lpc_hc_regs);
 
-    qdev_init_gpio_out(DEVICE(dev), &lpc->psi_irq, 1);
+    qdev_init_gpio_out(dev, &lpc->psi_irq, 1);
 }
 
 static void pnv_lpc_class_init(ObjectClass *klass, void *data)
diff --git a/hw/ppc/pnv_occ.c b/hw/ppc/pnv_occ.c
index 9fa6d91d31..48123ceae1 100644
--- a/hw/ppc/pnv_occ.c
+++ b/hw/ppc/pnv_occ.c
@@ -278,7 +278,7 @@ static void pnv_occ_realize(DeviceState *dev, Error **errp)
                           occ, "occ-common-area",
                           PNV_OCC_SENSOR_DATA_BLOCK_SIZE);
 
-    qdev_init_gpio_out(DEVICE(dev), &occ->psi_irq, 1);
+    qdev_init_gpio_out(dev, &occ->psi_irq, 1);
 }
 
 static void pnv_occ_class_init(ObjectClass *klass, void *data)
diff --git a/hw/ppc/pnv_sbe.c b/hw/ppc/pnv_sbe.c
index 1c7812a135..74cee4eea7 100644
--- a/hw/ppc/pnv_sbe.c
+++ b/hw/ppc/pnv_sbe.c
@@ -381,7 +381,7 @@ static void pnv_sbe_realize(DeviceState *dev, Error **errp)
                           psc->xscom_mbox_ops, sbe, "xscom-sbe-mbox",
                           psc->xscom_mbox_size);
 
-    qdev_init_gpio_out(DEVICE(dev), &sbe->psi_irq, 1);
+    qdev_init_gpio_out(dev, &sbe->psi_irq, 1);
 
     sbe->timer = timer_new_us(QEMU_CLOCK_VIRTUAL, sbe_timer, sbe);
 }
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4e3efbee16..245c7b97b2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1488,7 +1488,7 @@ static void virt_machine_init(MachineState *machine)
     for (i = 0; i < VIRTIO_COUNT; i++) {
         sysbus_create_simple("virtio-mmio",
             memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size,
-            qdev_get_gpio_in(DEVICE(virtio_irqchip), VIRTIO_IRQ + i));
+            qdev_get_gpio_in(virtio_irqchip, VIRTIO_IRQ + i));
     }
 
     gpex_pcie_init(system_memory,
@@ -1499,16 +1499,16 @@ static void virt_machine_init(MachineState *machine)
                    virt_high_pcie_memmap.base,
                    virt_high_pcie_memmap.size,
                    memmap[VIRT_PCIE_PIO].base,
-                   DEVICE(pcie_irqchip));
+                   pcie_irqchip);
 
-    create_platform_bus(s, DEVICE(mmio_irqchip));
+    create_platform_bus(s, mmio_irqchip);
 
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
-        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
+        0, qdev_get_gpio_in(mmio_irqchip, UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
-        qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
+        qdev_get_gpio_in(mmio_irqchip, RTC_IRQ));
 
     virt_flash_create(s);
 
diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index fa5add9f9d..3e887a0fc7 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -154,7 +154,7 @@ static void register_icu(RX62NState *s)
     sysbus_connect_irq(icu, 0, qdev_get_gpio_in(DEVICE(&s->cpu), RX_CPU_IRQ));
     sysbus_connect_irq(icu, 1, qdev_get_gpio_in(DEVICE(&s->cpu), RX_CPU_FIR));
     sysbus_connect_irq(icu, 2, s->irq[SWI]);
-    sysbus_mmio_map(SYS_BUS_DEVICE(icu), 0, RX62N_ICU_BASE);
+    sysbus_mmio_map(icu, 0, RX62N_ICU_BASE);
 }
 
 static void register_tmr(RX62NState *s, int unit)
diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 2f7f11e70b..4e890db0e2 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -79,7 +79,7 @@ struct PCIESPState {
 
 static void esp_pci_handle_idle(PCIESPState *pci, uint32_t val)
 {
-    ESPState *s = ESP(&pci->esp);
+    ESPState *s = &pci->esp;
 
     trace_esp_pci_dma_idle(val);
     esp_dma_enable(s, 0, 0);
@@ -93,7 +93,7 @@ static void esp_pci_handle_blast(PCIESPState *pci, uint32_t val)
 
 static void esp_pci_handle_abort(PCIESPState *pci, uint32_t val)
 {
-    ESPState *s = ESP(&pci->esp);
+    ESPState *s = &pci->esp;
 
     trace_esp_pci_dma_abort(val);
     if (s->current_req) {
@@ -103,7 +103,7 @@ static void esp_pci_handle_abort(PCIESPState *pci, uint32_t val)
 
 static void esp_pci_handle_start(PCIESPState *pci, uint32_t val)
 {
-    ESPState *s = ESP(&pci->esp);
+    ESPState *s = &pci->esp;
 
     trace_esp_pci_dma_start(val);
 
@@ -161,7 +161,7 @@ static void esp_pci_dma_write(PCIESPState *pci, uint32_t saddr, uint32_t val)
 
 static uint32_t esp_pci_dma_read(PCIESPState *pci, uint32_t saddr)
 {
-    ESPState *s = ESP(&pci->esp);
+    ESPState *s = &pci->esp;
     uint32_t val;
 
     val = pci->dma_regs[saddr];
@@ -183,7 +183,7 @@ static void esp_pci_io_write(void *opaque, hwaddr addr,
                              uint64_t val, unsigned int size)
 {
     PCIESPState *pci = opaque;
-    ESPState *s = ESP(&pci->esp);
+    ESPState *s = &pci->esp;
 
     if (size < 4 || addr & 3) {
         /* need to upgrade request: we only support 4-bytes accesses */
@@ -228,7 +228,7 @@ static uint64_t esp_pci_io_read(void *opaque, hwaddr addr,
                                 unsigned int size)
 {
     PCIESPState *pci = opaque;
-    ESPState *s = ESP(&pci->esp);
+    ESPState *s = &pci->esp;
     uint32_t ret;
 
     if (addr < 0x40) {
@@ -315,7 +315,7 @@ static const MemoryRegionOps esp_pci_io_ops = {
 static void esp_pci_hard_reset(DeviceState *dev)
 {
     PCIESPState *pci = PCI_ESP(dev);
-    ESPState *s = ESP(&pci->esp);
+    ESPState *s = &pci->esp;
 
     esp_hard_reset(s);
     pci->dma_regs[DMA_CMD] &= ~(DMA_CMD_DIR | DMA_CMD_INTE_D | DMA_CMD_INTE_P
@@ -366,7 +366,7 @@ static void esp_pci_scsi_realize(PCIDevice *dev, Error **errp)
 {
     PCIESPState *pci = PCI_ESP(dev);
     DeviceState *d = DEVICE(dev);
-    ESPState *s = ESP(&pci->esp);
+    ESPState *s = &pci->esp;
     uint8_t *pci_conf;
 
     if (!qdev_realize(DEVICE(s), NULL, errp)) {
@@ -394,7 +394,7 @@ static void esp_pci_scsi_realize(PCIDevice *dev, Error **errp)
 static void esp_pci_scsi_exit(PCIDevice *d)
 {
     PCIESPState *pci = PCI_ESP(d);
-    ESPState *s = ESP(&pci->esp);
+    ESPState *s = &pci->esp;
 
     qemu_free_irq(s->irq);
 }
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index d9288326d6..17bf5f2879 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -982,7 +982,7 @@ static void sun4m_hw_init(MachineState *machine)
     qdev_realize_and_unref(ms_kb_orgate, NULL, &error_fatal);
     sysbus_connect_irq(s, 0, qdev_get_gpio_in(ms_kb_orgate, 0));
     sysbus_connect_irq(s, 1, qdev_get_gpio_in(ms_kb_orgate, 1));
-    qdev_connect_gpio_out(DEVICE(ms_kb_orgate), 0, slavio_irq[14]);
+    qdev_connect_gpio_out(ms_kb_orgate, 0, slavio_irq[14]);
 
     dev = qdev_new(TYPE_ESCC);
     qdev_prop_set_uint32(dev, "disabled", 0);
@@ -1004,7 +1004,7 @@ static void sun4m_hw_init(MachineState *machine)
     qdev_realize_and_unref(serial_orgate, NULL, &error_fatal);
     sysbus_connect_irq(s, 0, qdev_get_gpio_in(serial_orgate, 0));
     sysbus_connect_irq(s, 1, qdev_get_gpio_in(serial_orgate, 1));
-    qdev_connect_gpio_out(DEVICE(serial_orgate), 0, slavio_irq[15]);
+    qdev_connect_gpio_out(serial_orgate, 0, slavio_irq[15]);
 
     if (hwdef->apc_base) {
         apc_init(hwdef->apc_base, qemu_allocate_irq(cpu_halt_signal, NULL, 0));
diff --git a/hw/virtio/virtio-mem-pci.c b/hw/virtio/virtio-mem-pci.c
index e8c338c5d9..b85c12668d 100644
--- a/hw/virtio/virtio-mem-pci.c
+++ b/hw/virtio/virtio-mem-pci.c
@@ -42,7 +42,7 @@ static MemoryRegion *virtio_mem_pci_get_memory_region(MemoryDeviceState *md,
                                                       Error **errp)
 {
     VirtIOMEMPCI *pci_mem = VIRTIO_MEM_PCI(md);
-    VirtIOMEM *vmem = VIRTIO_MEM(&pci_mem->vdev);
+    VirtIOMEM *vmem = &pci_mem->vdev;
     VirtIOMEMClass *vmc = VIRTIO_MEM_GET_CLASS(vmem);
 
     return vmc->get_memory_region(vmem, errp);
@@ -60,7 +60,7 @@ static void virtio_mem_pci_fill_device_info(const MemoryDeviceState *md,
 {
     VirtioMEMDeviceInfo *vi = g_new0(VirtioMEMDeviceInfo, 1);
     VirtIOMEMPCI *pci_mem = VIRTIO_MEM_PCI(md);
-    VirtIOMEM *vmem = VIRTIO_MEM(&pci_mem->vdev);
+    VirtIOMEM *vmem = &pci_mem->vdev;
     VirtIOMEMClass *vpc = VIRTIO_MEM_GET_CLASS(vmem);
     DeviceState *dev = DEVICE(md);
 
@@ -123,7 +123,7 @@ static void virtio_mem_pci_instance_init(Object *obj)
                                 TYPE_VIRTIO_MEM);
 
     dev->size_change_notifier.notify = virtio_mem_pci_size_change_notify;
-    vmem = VIRTIO_MEM(&dev->vdev);
+    vmem = &dev->vdev;
     vmc = VIRTIO_MEM_GET_CLASS(vmem);
     /*
      * We never remove the notifier again, as we expect both devices to
diff --git a/hw/virtio/virtio-pmem-pci.c b/hw/virtio/virtio-pmem-pci.c
index 1b89ade9d1..197d219204 100644
--- a/hw/virtio/virtio-pmem-pci.c
+++ b/hw/virtio/virtio-pmem-pci.c
@@ -42,7 +42,7 @@ static MemoryRegion *virtio_pmem_pci_get_memory_region(MemoryDeviceState *md,
                                                        Error **errp)
 {
     VirtIOPMEMPCI *pci_pmem = VIRTIO_PMEM_PCI(md);
-    VirtIOPMEM *pmem = VIRTIO_PMEM(&pci_pmem->vdev);
+    VirtIOPMEM *pmem = &pci_pmem->vdev;
     VirtIOPMEMClass *vpc = VIRTIO_PMEM_GET_CLASS(pmem);
 
     return vpc->get_memory_region(pmem, errp);
@@ -52,7 +52,7 @@ static uint64_t virtio_pmem_pci_get_plugged_size(const MemoryDeviceState *md,
                                                  Error **errp)
 {
     VirtIOPMEMPCI *pci_pmem = VIRTIO_PMEM_PCI(md);
-    VirtIOPMEM *pmem = VIRTIO_PMEM(&pci_pmem->vdev);
+    VirtIOPMEM *pmem = &pci_pmem->vdev;
     VirtIOPMEMClass *vpc = VIRTIO_PMEM_GET_CLASS(pmem);
     MemoryRegion *mr = vpc->get_memory_region(pmem, errp);
 
@@ -65,7 +65,7 @@ static void virtio_pmem_pci_fill_device_info(const MemoryDeviceState *md,
 {
     VirtioPMEMDeviceInfo *vi = g_new0(VirtioPMEMDeviceInfo, 1);
     VirtIOPMEMPCI *pci_pmem = VIRTIO_PMEM_PCI(md);
-    VirtIOPMEM *pmem = VIRTIO_PMEM(&pci_pmem->vdev);
+    VirtIOPMEM *pmem = &pci_pmem->vdev;
     VirtIOPMEMClass *vpc = VIRTIO_PMEM_GET_CLASS(pmem);
     DeviceState *dev = DEVICE(md);
 
diff --git a/migration/fd.c b/migration/fd.c
index 6f2f50475f..0eb677dcae 100644
--- a/migration/fd.c
+++ b/migration/fd.c
@@ -38,7 +38,7 @@ void fd_start_outgoing_migration(MigrationState *s, const char *fdname, Error **
         return;
     }
 
-    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-fd-outgoing");
+    qio_channel_set_name(ioc, "migration-fd-outgoing");
     migration_channel_connect(s, ioc, NULL, NULL);
     object_unref(OBJECT(ioc));
 }
@@ -68,7 +68,7 @@ void fd_start_incoming_migration(const char *fdname, Error **errp)
         return;
     }
 
-    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-fd-incoming");
+    qio_channel_set_name(ioc, "migration-fd-incoming");
     qio_channel_add_watch_full(ioc, G_IO_IN,
                                fd_accept_incoming_migration,
                                NULL, NULL,
diff --git a/migration/multifd.c b/migration/multifd.c
index 0bf5958a9c..3387d8277f 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -894,7 +894,7 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
 
     trace_multifd_new_send_channel_async(p->id);
     if (!qio_task_propagate_error(task, &local_err)) {
-        p->c = QIO_CHANNEL(sioc);
+        p->c = sioc;
         qio_channel_set_delay(p->c, false);
         p->running = true;
         if (multifd_channel_connect(p, sioc, local_err)) {
diff --git a/migration/yank_functions.c b/migration/yank_functions.c
index 8c08aef14a..d5a710a3f2 100644
--- a/migration/yank_functions.c
+++ b/migration/yank_functions.c
@@ -35,7 +35,7 @@ void migration_ioc_register_yank(QIOChannel *ioc)
     if (migration_ioc_yank_supported(ioc)) {
         yank_register_function(MIGRATION_YANK_INSTANCE,
                                migration_yank_iochannel,
-                               QIO_CHANNEL(ioc));
+                               ioc);
     }
 }
 
@@ -44,7 +44,7 @@ void migration_ioc_unregister_yank(QIOChannel *ioc)
     if (migration_ioc_yank_supported(ioc)) {
         yank_unregister_function(MIGRATION_YANK_INSTANCE,
                                  migration_yank_iochannel,
-                                 QIO_CHANNEL(ioc));
+                                 ioc);
     }
 }
 
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index e5b1046a1c..3d14296c04 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -156,7 +156,7 @@ static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
          * channel.
          */
         if (outioc && *outioc) {
-            qio_channel_close(QIO_CHANNEL(*outioc), NULL);
+            qio_channel_close(*outioc, NULL);
             object_unref(OBJECT(*outioc));
             *outioc = NULL;
         } else {
diff --git a/nbd/server.c b/nbd/server.c
index 2664d43bff..febe001a39 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1189,7 +1189,7 @@ static int nbd_negotiate_options(NBDClient *client, Error **errp)
                 }
                 ret = 0;
                 object_unref(OBJECT(client->ioc));
-                client->ioc = QIO_CHANNEL(tioc);
+                client->ioc = tioc;
                 break;
 
             case NBD_OPT_EXPORT_NAME:
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index b8d2c4dadd..74f4e41338 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -711,7 +711,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
         goto err_del_dev;
     }
 
-    if (!qdev_realize(DEVICE(dev), bus, errp)) {
+    if (!qdev_realize(dev, bus, errp)) {
         goto err_del_dev;
     }
     return dev;
diff --git a/ui/vnc-ws.c b/ui/vnc-ws.c
index 6d79f3e5a5..9e3503d93d 100644
--- a/ui/vnc-ws.c
+++ b/ui/vnc-ws.c
@@ -40,9 +40,9 @@ static void vncws_tls_handshake_done(QIOTask *task,
         if (vs->ioc_tag) {
             g_source_remove(vs->ioc_tag);
         }
-        vs->ioc_tag = qio_channel_add_watch(
-            QIO_CHANNEL(vs->ioc), G_IO_IN | G_IO_HUP | G_IO_ERR,
-            vncws_handshake_io, vs, NULL);
+        vs->ioc_tag = qio_channel_add_watch(vs->ioc,
+                                            G_IO_IN | G_IO_HUP | G_IO_ERR,
+                                            vncws_handshake_io, vs, NULL);
     }
 }
 
-- 
2.38.1


