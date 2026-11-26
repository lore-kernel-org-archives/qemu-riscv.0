Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99646606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxKBQNHo
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWV6v-0001TE-V3; Thu, 26 Nov 2026 03:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rao232328@gmail.com>)
 id 1xWV6s-0001RV-WF
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 03:45:44 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rao232328@gmail.com>)
 id 1xWV6g-0003sp-TT
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 03:45:32 -0500
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-cd6acc50b8dso3496444a12.3
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 00:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795682729; x=1796287529; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9lQH7d6IfoAHut44ImHBpijPn2YhFzgqal0VhXq6iRY=;
 b=kxKBQNHokqNPo3ZkR6nOJESmIgQR0Rn2hRF6ygKH/FfmDttdhZjs59tlno+8is6nFv
 qthBcI3L9/UX1KwjtO8GOcpORgp9gsvdF6Zd5zXUXxAt3WKahoQ6I1S590mf29CwAqZn
 S9AWcP8MZHZ9OSCc5zgEWR9wOP+mPGFLhiPrXdmsSqEs9kbkJBOEWoLJ1UoCDiX86gzL
 e8pt+V6fVF6nXdOMrmuWboddmPBECxFTIMqwVy9YSEIjxR+oQqSvuzT10OrQsV6PMNrC
 2bKF1ScFhALYLlZSV1VK81CmhV5EYraBEduI7aZym+rjxbZcJVPnW/MfMZ8PZMJNq5wJ
 aoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795682729; x=1796287529;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9lQH7d6IfoAHut44ImHBpijPn2YhFzgqal0VhXq6iRY=;
 b=ihJ8/+sTfmgkel+B4aJqJxCPQhAqoc4tUXgTKkUklXsVxi+SawXCDSLjGwmHY990vB
 lbKb+z7JG5k5UwYoibzS4NIUKzAJnkAgORarOIH1fUjj3/gAJOo4zqVpdvCViOvkQbHu
 qNR5OUhwQkiLopqhiKT/xSWLNMdGbg7xj/zqhsfHUK2WA7Weodq21GabLW6ltrNPFaR8
 V+kmMKJzDBSWDrZtx98qHJSSQHUHvACcuKLfP0Khrz3ZZJyslbcxxIzVu0IfEVZg0DUS
 sbXfTaqRBh666BA1VK51ikZipIhr1ByfHwOb2tZnnlHi+OVXuNiV2jSq2rQRBE4jBT8p
 vasg==
X-Gm-Message-State: APuU4Z8vYAe8jRFo3C4OR9jdv3nJiio35NQAVs+w/zrmEb5s47b4ASK5
 Z1i+DskM4Cqp3UFxzWvcpkkOQ5k29OOrodTxzBTqZbfrS0zaigEpFtX3
X-Gm-Gg: AZFdTZe5KDnbyPanKj59UXraR9FPjRa3xLQMSFWoGYveX2yL3YNw7f1rK0WzQCMHrsU
 Z93QzBbyVopd8vq8JDRCfQbQq8WTvnDxlL1yNkH2FIy+9tUiCJyJQATs4Z4is9/lf8L43PS/ngu
 K7cjbWcMDUIk05XUL1aJFJszgPKOAuW5rTdCb8wVC7hy6FjLb9lleEQ2Gj7Aq5j1yHLXDjWh8k/
 1RAwo3ck1zxjk3UbMowNGmUQlbFMTjPMJJQTYfSEG52+96OTs4CwgqF5PR7aOt80AdMu8H5lNwh
 yTHpNVIg96FBSY3SbwDgpAe3A84BX1sep6CsyfZywQ+wCvJvz+9h4ZG4A+cFW+Dt/SIRmuaC4UO
 g7EmG4IiTxrJqMxcvdi3dsiFhO88eBFZ4GTkJ3OWH5u6Y6kBiLfA1OlioHYx/6q/y+rw4eQB5sv
 AQdzoGLP4vFrUTlDB8XL+Dt/2Byj/SzGy850+P68QH3DXmP2jsqw+H0x+opeKiWDgJ//5tuS9LI
 U4dPPphlMfhiUY7uvq6ofbBhnOYd5p87bS813PVPGMhITqz1Az4ITVBoa4XfwtHEMEqUG1WLNw6
 ZmVLu7GxSowjBC6Fi6PM+rDzeY+h2PxTm/edFHh0
X-Received: by 2002:a17:90b:17cd:b0:3b3:ab8c:c7e5 with SMTP id
 98e67ed59e1d1-3b41c95f65fmr19092139a91.56.1795682729324; 
 Thu, 26 Nov 2026 00:45:29 -0800 (PST)
Received: from DESKTOP-DFGP8OG.lan ([120.230.138.47])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b405d63728sm36939464a91.8.2026.11.26.00.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 00:45:28 -0800 (PST)
From: raoyi <rao232328@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 bmeng.cn@gmail.com, philmd@oss.qualcomm.com, pbonzini@redhat.com,
 lvivier@redhat.com, farosas@suse.de, caojunze424@gmail.com,
 raoyi <rao232328@gmail.com>
Subject: [PATCH v7 2/3] hw/riscv: add DesignWare APB timer to K230 board
Date: Thu, 26 Nov 2026 16:44:52 +0800
Message-ID: <20261126084453.23021-3-rao232328@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126084453.23021-1-rao232328@gmail.com>
References: <20261126084453.23021-1-rao232328@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=rao232328@gmail.com; helo=mail-pg1-x52b.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

K230 integrates a Synopsys DesignWare APB timer with six channels,
located at 0x91105800 (TRM section 2.6). The timer block is clocked
at 50 MHz and the six channel interrupts are wired to PLIC IRQs
101-106.

Model the block with these parameters so that a Linux guest using
the upstream dw_apb_timer driver gets a working clockevent and
clocksource. Remove the previous unimplemented device stub since
the real model now handles this MMIO range.

Signed-off-by: raoyi <rao232328@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/Kconfig        |  1 +
 hw/riscv/k230.c         | 33 ++++++++++++++++++++++++++++++---
 include/hw/riscv/k230.h |  8 ++++++++
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 807fcaaf28..da2ae6ed1d 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -187,6 +187,7 @@ config K230
     select K230_WDT
     select K230_GSDMA
     select K230_DECOMP_GZIP
+    select DW_APB_TIMER
 
 config SOPHGO_CV1800B
     bool
diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
index 1e4ca38579..a5d789c070 100644
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
 #include "hw/intc/riscv_aclint.h"
@@ -36,6 +38,9 @@
 #define K230_DIRECT_KERNEL_ADDR  0x8200000
 #define K230_DIRECT_DTB_ADDR     0xa000000
 
+#define K230_TIMER_NUM_CHANNELS 6
+#define K230_TIMER_DEFAULT_FREQ 50000000
+
 static const MemMapEntry memmap[] = {
     [K230_DEV_DDRC] =         { 0x00000000,  0x80000000 },
     [K230_DEV_KPU_L2_CACHE] = { 0x80000000,  0x00200000 },
@@ -118,6 +123,19 @@ static void k230_soc_init(Object *obj)
     object_initialize_child(obj, "k230-gsdma", &s->gsdma, TYPE_K230_GSDMA);
     object_initialize_child(obj, "k230-decomp-gzip", &s->decomp_gzip,
                             TYPE_K230_DECOMP_GZIP);
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
@@ -212,6 +230,18 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
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
@@ -325,9 +355,6 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("iomux", memmap[K230_DEV_IOMUX].base,
                                 memmap[K230_DEV_IOMUX].size);
 
-    create_unimplemented_device("timer", memmap[K230_DEV_TIMER].base,
-                                memmap[K230_DEV_TIMER].size);
-
     create_unimplemented_device("wdt0", memmap[K230_DEV_WDT0].base,
                                 memmap[K230_DEV_WDT0].size);
 
diff --git a/include/hw/riscv/k230.h b/include/hw/riscv/k230.h
index 8679d09891..4c416573eb 100644
--- a/include/hw/riscv/k230.h
+++ b/include/hw/riscv/k230.h
@@ -21,6 +21,7 @@
 #include "hw/watchdog/k230_wdt.h"
 #include "hw/dma/k230_gsdma.h"
 #include "hw/misc/k230_decomp_gzip.h"
+#include "hw/timer/dw-apb-timer.h"
 
 #define C908_CPU_HARTID   (0)
 
@@ -40,6 +41,7 @@ typedef struct K230SoCState {
     K230WdtState wdt[2];
     K230GSDMAState gsdma;
     K230DecompGzipState decomp_gzip;
+    DWAPBTimerState timer;
     MemoryRegion sram;
     MemoryRegion bootrom;
 
@@ -135,6 +137,12 @@ enum {
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
     K230_GSDMA_IRQ  = 140,
-- 
2.53.0


