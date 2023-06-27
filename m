Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74DEEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 14:13:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qE9Qv-0007Pv-55; Tue, 27 Jun 2023 10:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1qE9Qs-0007P3-OX
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 10:12:39 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1qE9Qf-0007Qw-6J
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 10:12:28 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1b80b514fb7so12211435ad.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 07:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687875144; x=1690467144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VvYbAC6J9pF0VD1T2uOv/EsfLGica+Emefc47gOAID0=;
 b=ZXPkr4xer0dVbFHqBXWazELZ2nPtJPggfBhr+HiXo4nOhvt07llpT9wwy4NtU0nTby
 bkQqqY5OO74dT3gO0B+EPoJjZjRBJrqGUyaqM5X8Fxw5iCe7eCiKvMb3KLYh3gD9aMYs
 XfEc4frRTSYBW1gLrfXQm5wLd7vUE9ZLPrZagGR/PZdO62NRTMyTHoF6a0neDtcJZ21Y
 CHNQXtBQ5VrIL+zEJS6xmA03Z4WKo0Xd+FNuI7I13WLlnQwU42yGr3U3g7albJzy9qRn
 58CsOQDLstCrbBpGG4eEMYjAj09zJ2jbeDH6+0UmS+VmU7eShE7zWL/by35inLvT+fAB
 X2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687875144; x=1690467144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VvYbAC6J9pF0VD1T2uOv/EsfLGica+Emefc47gOAID0=;
 b=D2mhBOQI7YHPB1IwX4rmWNYVh0uKkJeQHRm9Cd4n33tKo+YzLQ37eqY3Fdf8SqmnnL
 9rgGK68qiyFH5w6uIUmn2KvUo6H3rrVazqQPKHUW/U1cdPrzm48QHWEn4sAsgGV74sZ6
 LjuEsu32WWMBPMLid20r3pZUWihDalWErtzSeT7C841YEhKiIml5Ygp8uDmP6fu1RBtA
 90ipBioa5tkjzde9nqe9SMgC9Rs8CujXDJuIrddaYV9B9PufpNSJ3vw4KDnNbhcQ1PwV
 d+0dlXF/x92xwdCIDtfZbTUqYJZUDkXFHIcNp+4nH711thkifZUi4CDN19xFz28DGHUo
 bmBg==
X-Gm-Message-State: AC+VfDzvaO8rS55Diu9Ia8AXW58Bj+Fzwxq8JgwBOFYFmiWkN2ARy/3O
 c1ludNQFuLFxCUMfbdCsIBo9OA==
X-Google-Smtp-Source: ACHHUZ78hqdVI9tFYYn3m9O49+1rIjV5Y4GFdhPuyFWEwqFlW0lUXyydVJOtOWlr62QcaKV10vj6Rg==
X-Received: by 2002:a17:903:248:b0:1b6:9cb9:bb55 with SMTP id
 j8-20020a170903024800b001b69cb9bb55mr7332265plh.42.1687875143778; 
 Tue, 27 Jun 2023 07:12:23 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a17090301d000b001b69303db65sm6080441plh.26.2023.06.27.07.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 07:12:23 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, liweiwei@iscas.ac.cn,
 philmd@linaro.org, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v6 2/3] hw/riscv: sifive_e: Support the watchdog timer of
 HiFive 1 rev b.
Date: Tue, 27 Jun 2023 07:12:15 -0700
Message-Id: <20230627141216.3962299-3-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230627141216.3962299-1-tommy.wu@sifive.com>
References: <20230627141216.3962299-1-tommy.wu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=tommy.wu@sifive.com; helo=mail-pl1-x635.google.com
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

Create the AON device when we realize the sifive_e machine.
This patch only implemented the functionality of the watchdog timer,
not all the functionality of the AON device.

Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/Kconfig            |  1 +
 hw/riscv/sifive_e.c         | 17 +++++++++++++++--
 include/hw/riscv/sifive_e.h |  9 ++++++---
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 6528ebfa3a..b6a5eb4452 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -60,6 +60,7 @@ config SIFIVE_E
     select SIFIVE_PLIC
     select SIFIVE_UART
     select SIFIVE_E_PRCI
+    select SIFIVE_E_AON
     select UNIMP
 
 config SIFIVE_U
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 04939b60c3..0d37adc542 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -45,6 +45,7 @@
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_e_prci.h"
+#include "hw/misc/sifive_e_aon.h"
 #include "chardev/char.h"
 #include "sysemu/sysemu.h"
 
@@ -185,6 +186,8 @@ static void sifive_e_soc_init(Object *obj)
     object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x1004, &error_abort);
     object_initialize_child(obj, "riscv.sifive.e.gpio0", &s->gpio,
                             TYPE_SIFIVE_GPIO);
+    object_initialize_child(obj, "riscv.sifive.e.aon", &s->aon,
+                            TYPE_SIFIVE_E_AON);
 }
 
 static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
@@ -223,10 +226,17 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
         RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
         RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
         RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
-    create_unimplemented_device("riscv.sifive.e.aon",
-        memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
     sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
 
+    /* AON */
+
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->aon), errp)) {
+        return;
+    }
+
+    /* Map AON registers */
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->aon), 0, memmap[SIFIVE_E_DEV_AON].base);
+
     /* GPIO */
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
@@ -245,6 +255,9 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
                            qdev_get_gpio_in(DEVICE(s->plic),
                                             SIFIVE_E_GPIO0_IRQ0 + i));
     }
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->aon), 0,
+                       qdev_get_gpio_in(DEVICE(s->plic),
+                                        SIFIVE_E_AON_WDT_IRQ));
 
     sifive_uart_create(sys_mem, memmap[SIFIVE_E_DEV_UART0].base,
         serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_E_UART0_IRQ));
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index b824a79e2d..31180a680e 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -22,6 +22,7 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_cpu.h"
 #include "hw/gpio/sifive_gpio.h"
+#include "hw/misc/sifive_e_aon.h"
 #include "hw/boards.h"
 
 #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
@@ -35,6 +36,7 @@ typedef struct SiFiveESoCState {
     /*< public >*/
     RISCVHartArrayState cpus;
     DeviceState *plic;
+    SiFiveEAONState aon;
     SIFIVEGPIOState gpio;
     MemoryRegion xip_mem;
     MemoryRegion mask_rom;
@@ -76,9 +78,10 @@ enum {
 };
 
 enum {
-    SIFIVE_E_UART0_IRQ  = 3,
-    SIFIVE_E_UART1_IRQ  = 4,
-    SIFIVE_E_GPIO0_IRQ0 = 8
+    SIFIVE_E_AON_WDT_IRQ  = 1,
+    SIFIVE_E_UART0_IRQ    = 3,
+    SIFIVE_E_UART1_IRQ    = 4,
+    SIFIVE_E_GPIO0_IRQ0   = 8
 };
 
 #define SIFIVE_E_PLIC_HART_CONFIG "M"
-- 
2.31.1


