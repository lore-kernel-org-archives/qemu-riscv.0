Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3F8C55167
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 13:37:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wpQxP-0006YX-9w; Thu, 30 Jul 2026 09:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rao232328@gmail.com>)
 id 1wpQxD-0006K2-Ui
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2026 09:37:47 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rao232328@gmail.com>)
 id 1wpQxC-0005ya-6d
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2026 09:37:43 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2cc7ef7ec27so27608415ad.1
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2026 06:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785418660; x=1786023460; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hGVPXsOP9uyqFKFA6uavYqfpocB6qSsHNa9L6NkdoEU=;
 b=LTniMEPAs19xuC8J/iq0ErJdby9MIkIGjCgQUacYlXSDWqbaI2wAo+GkaPomtCJ7+L
 4axtSaOzb/RQ7KoWQha3jq/5w9pOz5pKvznyuxyyZEV9SQFWkgfKOl5p9csAOrqs57XI
 tN/WxbNlv1KKr1XXfChLOUxKoZ9KLmj5CgbpMk9PMp1tSeRnrGyEvIb2SSPHJ15PLQri
 uaJArH3S/Le+Ud9eFQRTnHbbhc6kyykomBiGxdZQhEQ+qxhy0KchdoYvnmoJiXQgN29j
 jnDbRS9/d4/H+2nh4SrWQqbFlqMK5IqDgcZig+GQ+XiuEh/OHOUvyJpq7KQsfiNodOb3
 f4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785418660; x=1786023460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hGVPXsOP9uyqFKFA6uavYqfpocB6qSsHNa9L6NkdoEU=;
 b=FNduUEqpTT45ekREFU48Jqs9qyE4HW82pgxeRaYkGJL/4ESUEDheZiGAXytKyWfXkA
 8uudskKss/akPXQR66CYLCYrRUY4uGALf0USygHpysdUnxIooOFY/7ffuc3cvc7L5avy
 Eoy5rAzbQFZ/WYoLqoQeokMCiovK1zMHDX/S/sQ/mYg5Hdtn/ofqqkIH5zNaOR7pgKK4
 8AlAIptEsBC6Gi6IcW97adaVszblYO4/F2quecfkFxQpgANxN9Kn1NTsrpqUjCRXnm8t
 qhOAh4QGYwxs2BBkhDHRzNllV9lt4NYYiWsp4iM1UIWYFJhdde2Ohl3sXcrc4J7tFXx3
 MErA==
X-Gm-Message-State: AOJu0YzSxfizcZy7wAB4Kx8bBD3nX7pjsnTm2VPeD796h2T2aIM97jQ4
 5C/y3KF44AKLwVaQzAtcS64GUEc7OI7aAKI3afjqjDx/QHLbDxbn3rtW
X-Gm-Gg: AR+sD12OWLFAkoV9f6GlQKrqsZgnayfo4g2Ye5fbr9YbwVkJpVhgQOqRauhRtUdEXc2
 HUdIIt5pTBbhxqqPTZxFe2fvANscMnrYlHMQP+B12YaYGUJM3Ipz9LSqPAZycyWI8Kb/9dxaSnE
 P9QAtxirWy4fakUX+Q3zinX8pPrWJazv5ZnpO7jtY8gDKKzL5GFH1/7BnnU/umjEQOTPDP+7VH0
 DNtJ/i/CHqpqBMAZx74bzNcyWZv8B02tYtv0brV4Dpocvs/qvIKd+cQzmgMR1yjYTcfxx7FsSYy
 g/ER3OB9nC3Mdv48lFIjN45t358uu//+rrUFi29TGfNuJqAUCoeEINYUQISJUebX5OmUXecfhDv
 CGAh94TVaAtyFHogyR4R6tV8r0JWtKjRmHzyoWkmIgEncpCflrmyUFQe8zxI7xatQP+apzaiSZZ
 QtjrubSMIEldfw2tOzlT4uHeuQUAKq+COnanhXSNZAjNGAvOcGS8pqY60Xi6o+Hf3tfhruss0=
X-Received: by 2002:a17:903:2444:b0:2cf:82e6:a5 with SMTP id
 d9443c01a7336-2d035bb12e3mr24469355ad.13.1785418659834; 
 Thu, 30 Jul 2026 06:37:39 -0700 (PDT)
Received: from DESKTOP-DFGP8OG.lan ([120.230.138.58])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d022bf845asm26757745ad.60.2026.07.30.06.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 06:37:39 -0700 (PDT)
From: raoyi <rao232328@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, pbonzini@redhat.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, farosas@suse.de, lvivier@redhat.com,
 caojunze424@gmail.com, raoyi <rao232328@gmail.com>
Subject: [PATCH v2 2/3] hw/riscv: integrate k230 dwapb timer into k230 board
Date: Thu, 30 Jul 2026 21:37:10 +0800
Message-ID: <20260730133713.3253-3-rao232328@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730133713.3253-1-rao232328@gmail.com>
References: <20260730133713.3253-1-rao232328@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=rao232328@gmail.com; helo=mail-pl1-x62f.google.com
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

Wire up the K230 DW APB timer to the K230 SoC,
including PLIC IRQ connections and memory mapping.
Remove the previous unimplemented timer stub.

Signed-off-by: raoyi <rao232328@gmail.com>
---
 hw/riscv/Kconfig        |  1 +
 hw/riscv/k230.c         | 23 ++++++++++++++++++++---
 include/hw/riscv/k230.h |  8 ++++++++
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index de37c08cae..c86968f759 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -162,3 +162,4 @@ config K230
     select SERIAL_MM
     select UNIMP
     select K230_WDT
+    select K230_TIMER
diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
index 656f28190c..214fb3525e 100644
--- a/hw/riscv/k230.c
+++ b/hw/riscv/k230.c
@@ -24,6 +24,8 @@
 #include "target/riscv/cpu.h"
 #include "hw/core/loader.h"
 #include "hw/core/sysbus.h"
+#include "hw/core/clock.h"
+#include "hw/core/qdev-clock.h"
 #include "hw/riscv/k230.h"
 #include "hw/riscv/boot.h"
 #include "hw/riscv/machines-qom.h"
@@ -110,6 +112,12 @@ static void k230_soc_init(Object *obj)
     object_initialize_child(obj, "c908-cpu", cpu0, TYPE_RISCV_HART_ARRAY);
     object_initialize_child(obj, "k230-wdt0", &s->wdt[0], TYPE_K230_WDT);
     object_initialize_child(obj, "k230-wdt1", &s->wdt[1], TYPE_K230_WDT);
+    object_initialize_child(obj, "k230-dwapb-timer", &s->timer,
+                            TYPE_K230_TIMER);
+
+    Clock *timer_clk = clock_new(OBJECT(s), "timer-clk");
+    clock_set_hz(timer_clk, K230_APBTMR_DEFAULT_FREQ);
+    qdev_connect_clock_in(DEVICE(&s->timer), "pclk", timer_clk);
 
     qdev_prop_set_uint32(DEVICE(cpu0), "hartid-base", 0);
     qdev_prop_set_string(DEVICE(cpu0), "cpu-type", TYPE_RISCV_CPU_THEAD_C908);
@@ -191,6 +199,18 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
         k230_create_uart(sys_mem, DEVICE(s->c908_plic), i);
     }
 
+    /* Timer */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timer), 0, memmap[K230_DEV_TIMER].base);
+
+    for (int i = 0; i < K230_APBTMR_NUM_TIMERS; i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer), i,
+                           qdev_get_gpio_in(DEVICE(s->c908_plic),
+                                            K230_TIMER0_IRQ + i));
+    }
+
     /* Watchdog */
     for (int i = 0; i < 2; i++) {
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
@@ -283,9 +303,6 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("iomux", memmap[K230_DEV_IOMUX].base,
                                 memmap[K230_DEV_IOMUX].size);
 
-    create_unimplemented_device("timer", memmap[K230_DEV_TIMER].base,
-                                memmap[K230_DEV_TIMER].size);
-
     create_unimplemented_device("wdt0", memmap[K230_DEV_WDT0].base,
                                 memmap[K230_DEV_WDT0].size);
 
diff --git a/include/hw/riscv/k230.h b/include/hw/riscv/k230.h
index 592e1c26bf..3de3b7e765 100644
--- a/include/hw/riscv/k230.h
+++ b/include/hw/riscv/k230.h
@@ -18,6 +18,7 @@
 #include "hw/core/boards.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/watchdog/k230_wdt.h"
+#include "hw/timer/k230_dwapb_timer.h"
 
 #define C908_CPU_HARTID   (0)
 
@@ -33,6 +34,7 @@ typedef struct K230SoCState {
     RISCVHartArrayState c908_cpu; /* Small core */
 
     K230WdtState wdt[2];
+    K230TimerState timer;
     MemoryRegion sram;
     MemoryRegion bootrom;
 
@@ -127,6 +129,12 @@ enum {
     K230_UART2_IRQ  = 18,
     K230_UART3_IRQ  = 19,
     K230_UART4_IRQ  = 20,
+    K230_TIMER0_IRQ = 101,
+    K230_TIMER1_IRQ = 102,
+    K230_TIMER2_IRQ = 103,
+    K230_TIMER3_IRQ = 104,
+    K230_TIMER4_IRQ = 105,
+    K230_TIMER5_IRQ = 106,
     K230_WDT0_IRQ   = 107,
     K230_WDT1_IRQ   = 108,
 };
-- 
2.53.0


