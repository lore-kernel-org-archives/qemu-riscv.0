Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CFDC5DF66
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 13:38:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuVcd-0005qL-OY; Thu, 13 Aug 2026 09:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rao232328@gmail.com>)
 id 1wuVcb-0005pW-Va
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 09:37:25 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rao232328@gmail.com>)
 id 1wuVca-0005VO-Ao
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 09:37:25 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2cca0c5799eso25139665ad.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 06:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786628243; x=1787233043; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XxBiNV5RqMjj3YEM9w8aOuB458i6Nb2q9JRYJsSC1Ns=;
 b=YDFcNOtd/zrfmYTm4TP4fGDK7W5MuHPT8CKDPZA7Q4AWjq/1uJVxl5tE3dYiUZu1nq
 RdD2yJSsGBJpwzuALrayIETTALX0jKRjo0YSceQY85wzdarS7jllf9pnoIH7z5jrkLhs
 JLHaC2OT7/bA91huOetAE8GzrMHxbKu/LPQwp0mSfkq/SBs7sVpk1SDHq925HzsDcp1x
 FAEDy1zmuV2U7CKG9/tCb1zim4pUFzNX9TX6C4bwx+GfJ+zPDIV6GkoYsVUs/1xxbNIG
 vaM78MzDs7MCbN2A7Uzb+ZZTkg84P86MJzfliRtCLnKoqbpkd3iSLpLMxHtRnOoX4Zz8
 cKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786628243; x=1787233043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XxBiNV5RqMjj3YEM9w8aOuB458i6Nb2q9JRYJsSC1Ns=;
 b=PCul6NqV1ygHvV58f3+I9ilZMfNBwhAQndofpMaR5HCDjQlUl0wECiSKhPFFT+YWzF
 k0BGC68DZwk7GkJ11y7VKxsK5rWUFCPW/5FPx5JDNiVejo43jP+Lkbnp9yPq+Mv/wi5I
 U9AWNQPPKb8gePGrIYGsziUuODEJG6peQ8D8Wo6IY7abF93bMBDPq12Ui7Lhx1Udxw0a
 eB5slWEXbjviPvoF9C3EX+gIZJqk/knCTLTwxSJkU4ex4UKvqvcOh4w16e9ycg1zxyUb
 YxVbpOEpoKkZhaxniVJfB/aOyJy6bFOL7K50SKRlvnGuZ9k81lKC5/GteqRcN0a9IdtS
 ezPg==
X-Gm-Message-State: AOJu0Yxw0sxp9PSiHk6ZBMfV0BQpZH1wAwQUnOesxQk+Y9mqhksj1lOL
 k6Mlgqbb0JSrT6gkknG8Pfr1D+HpQknthrPWheC17wZaeOQWjhHsxNtf
X-Gm-Gg: AR+sD13JpL5oXNv54lRQXs1UAzNhbWawtdCn/N+5b47w1WKp2jed9rccEaXhzsB3Wzz
 qz+Lr2gTCAQIk/HrAk9iHiRhXMLm8mbAQZCQ9CWqqcxVzVgRBhLO4YdgiLboF3yv9S7oOuShw7z
 v1KpuHr+0f03fr+aZjJrsG73jygifVtxvvaTrbhBvG/D/cENTWzH4Y1/rFj6ykLiL9X4M5jvnJK
 J4qdZiUNfYfckZz4XEUP204nUjKBFdcqRTgwgjkImckRgkCOWKilh7yrtCMvBTTQzy/p+QrSzVg
 9mS1Zt81Om06uZJb7niTC/IvPyYceQT3why/RRI1n348vd+dei6xWWgPldYjr/4Wj52mNUEf5Ln
 8nIuZ7OwgbI4MJUuOFe2DQ4oEOs3fHi47f1XTUmfbxpbklwhPpbzuFMXMsn/uB5gDuwKv0b70Lf
 7/8om/UG/1qAPeGORd6EeTDo/P4IYBPDA3E3g+EFm7cZ3k4gJOlEv6kSPvRFI=
X-Received: by 2002:a05:6a21:151b:b0:3c3:6928:8b25 with SMTP id
 adf61e73a8af0-3cc552dea11mr8156251637.17.1786628242775; 
 Thu, 13 Aug 2026 06:37:22 -0700 (PDT)
Received: from DESKTOP-DFGP8OG ([2409:8a55:ad2:6951::258])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef6849625sm1078901a12.1.2026.08.13.06.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 06:37:22 -0700 (PDT)
From: raoyi <rao232328@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 bmeng.cn@gmail.com, philmd@oss.qualcomm.com, pbonzini@redhat.com,
 lvivier@redhat.com, farosas@suse.de, caojunze424@gmail.com,
 raoyi <rao232328@gmail.com>
Subject: [PATCH v4 2/3] hw/riscv: add DesignWare APB timer to K230 board
Date: Thu, 13 Aug 2026 21:36:42 +0800
Message-ID: <20260813133643.20380-3-rao232328@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813133643.20380-1-rao232328@gmail.com>
References: <20260813133643.20380-1-rao232328@gmail.com>
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

Wire up the DesignWare APB timer to the K230 SoC with
num-timers=6 and a 6.25 MHz clock. Connect timer IRQs
to the PLIC. Remove the previous unimplemented timer stub.

Signed-off-by: raoyi <rao232328@gmail.com>
---
 hw/riscv/Kconfig        |  1 +
 hw/riscv/k230.c         | 33 ++++++++++++++++++++++++++++++---
 include/hw/riscv/k230.h |  8 ++++++++
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index de37c08cae..c2c01af6ee 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -162,3 +162,4 @@ config K230
     select SERIAL_MM
     select UNIMP
     select K230_WDT
+    select DW_APB_TIMER
diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
index 656f28190c..78a05492ad 100644
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
@@ -37,6 +39,9 @@
 #define K230_DIRECT_KERNEL_ADDR  0x8200000
 #define K230_DIRECT_DTB_ADDR     0xa000000
 
+#define K230_TIMER_NUM_CHANNELS 6
+#define K230_TIMER_DEFAULT_FREQ 6250000
+
 static const MemMapEntry memmap[] = {
     [K230_DEV_DDRC] =         { 0x00000000,  0x80000000 },
     [K230_DEV_KPU_L2_CACHE] = { 0x80000000,  0x00200000 },
@@ -110,6 +115,19 @@ static void k230_soc_init(Object *obj)
     object_initialize_child(obj, "c908-cpu", cpu0, TYPE_RISCV_HART_ARRAY);
     object_initialize_child(obj, "k230-wdt0", &s->wdt[0], TYPE_K230_WDT);
     object_initialize_child(obj, "k230-wdt1", &s->wdt[1], TYPE_K230_WDT);
+    object_initialize_child(obj, "dw-apb-timer", &s->timer,
+                            TYPE_DW_APB_TIMER);
+
+    qdev_prop_set_uint32(DEVICE(&s->timer), "num-timers",
+                         K230_TIMER_NUM_CHANNELS);
+
+    Clock *timer_clk = clock_new(OBJECT(s), "timer-clk");
+    clock_set_hz(timer_clk, K230_TIMER_DEFAULT_FREQ);
+    for (int i = 0; i < K230_TIMER_NUM_CHANNELS; i++) {
+        g_autofree char *clock_name = g_strdup_printf("timer[%d]", i);
+
+        qdev_connect_clock_in(DEVICE(&s->timer), clock_name, timer_clk);
+    }
 
     qdev_prop_set_uint32(DEVICE(cpu0), "hartid-base", 0);
     qdev_prop_set_string(DEVICE(cpu0), "cpu-type", TYPE_RISCV_CPU_THEAD_C908);
@@ -191,6 +209,18 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
         k230_create_uart(sys_mem, DEVICE(s->c908_plic), i);
     }
 
+    /* Timer */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timer), 0, memmap[K230_DEV_TIMER].base);
+
+    for (int i = 0; i < K230_TIMER_NUM_CHANNELS; i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer), i,
+                           qdev_get_gpio_in(DEVICE(s->c908_plic),
+                                            K230_TIMER0_IRQ + i));
+    }
+
     /* Watchdog */
     for (int i = 0; i < 2; i++) {
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
@@ -283,9 +313,6 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("iomux", memmap[K230_DEV_IOMUX].base,
                                 memmap[K230_DEV_IOMUX].size);
 
-    create_unimplemented_device("timer", memmap[K230_DEV_TIMER].base,
-                                memmap[K230_DEV_TIMER].size);
-
     create_unimplemented_device("wdt0", memmap[K230_DEV_WDT0].base,
                                 memmap[K230_DEV_WDT0].size);
 
diff --git a/include/hw/riscv/k230.h b/include/hw/riscv/k230.h
index 592e1c26bf..42a36664eb 100644
--- a/include/hw/riscv/k230.h
+++ b/include/hw/riscv/k230.h
@@ -18,6 +18,7 @@
 #include "hw/core/boards.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/watchdog/k230_wdt.h"
+#include "hw/timer/dw-apb-timer.h"
 
 #define C908_CPU_HARTID   (0)
 
@@ -33,6 +34,7 @@ typedef struct K230SoCState {
     RISCVHartArrayState c908_cpu; /* Small core */
 
     K230WdtState wdt[2];
+    DWAPBTimerState timer;
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


