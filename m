Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7CDC7EE29
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 16:46:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7Ilo-0006bc-AD; Thu, 08 Jun 2023 12:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q7Ilm-0006aU-Hp
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 12:45:54 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q7Ilk-00052r-AW
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 12:45:54 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1a15ce37b39so722014fac.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 09:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1686242751; x=1688834751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TeoXDRO1znt1A0cV5lQC+UQ9fkpA1X44Z4UfvYwfiBE=;
 b=ROnIvjdXE7+ZrWOGIToTPC1cnPRTDLibcwZH20D7ajD6QNTBDS+nMs5Gy52kwHrGSo
 OSdJclhWOXy7glRwNqzKIbsl15s3i7WyqJBCdYTzU0FB7NxARvElltn8o2slze4b8Xfh
 1HndG3G9PVYf+cMHyAslHsbSBwOmTc4hnLZv9e0zznkf3phGsu1hjQ0UlVvpcvZE+6FW
 x11FhQ963m7B1MEX3gaQcKRdQZw0EqQZdlDgOUBNA44rF96HOZamiypQ4FlOzZ7ByWFG
 Vn8vNK96mjNcrwCjegKKTuWuy09NmpgxwUdupjYvVwbe616aaltL4WvudF7GegXVQtAA
 5WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686242751; x=1688834751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TeoXDRO1znt1A0cV5lQC+UQ9fkpA1X44Z4UfvYwfiBE=;
 b=dU+XOwW1nZuWpyZnuTMCr1uQbLUbewX2yu22S9SY76fQziIrNaoiJF7r+HsyeUJoh1
 6UiHa6l70lTnDtbL/2icxFo/979BnHaKluMhdVXnXpmdmq/s7o+LRUTU11XNCx4xuc5N
 fjjVXP6jA7y+RdTTw5j+RgwefC6p/uIpg1GrRmhsDFeMvZ04xarM7FHzNCvKQTK+Jt3Z
 lnBfkIrugG6QKoi4VWzrRfO88AJGm5dF7LDYNsngmldmcdZyNER7lGo0XTZk+pFapvDR
 q8V8KREweChRhYAevyF7af4iqeUCwwM/nk8cOb5xJY+rGWjlGi7p1U5eCmMGl3lZI3h3
 0FbQ==
X-Gm-Message-State: AC+VfDwFbxRFKAf7wOcdwcJs7LOlgPOLWmo2U69jWcVanS/fgOWgZfp7
 JJvMU9gkbbMCKOaacl+fEGFoSw==
X-Google-Smtp-Source: ACHHUZ6Vkfte1BbVLphHW79LaErGxGTWEZPRax3s0Ptnkxh0UpEMK01RkBULBDzpJ4HQSlGnyHLUOg==
X-Received: by 2002:a05:6870:e353:b0:177:9b62:6b87 with SMTP id
 a19-20020a056870e35300b001779b626b87mr7531286oae.20.1686242750968; 
 Thu, 08 Jun 2023 09:45:50 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a4adb8c000000b0054574f35b8esm9107oou.41.2023.06.08.09.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 09:45:50 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, liweiwei@iscas.ac.cn,
 philmd@linaro.org, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v5 2/3] hw/riscv: sifive_e: Support the watchdog timer of
 HiFive 1 rev b.
Date: Thu,  8 Jun 2023 09:45:41 -0700
Message-Id: <20230608164542.3675619-3-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230608164542.3675619-1-tommy.wu@sifive.com>
References: <20230608164542.3675619-1-tommy.wu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=tommy.wu@sifive.com; helo=mail-oa1-x2e.google.com
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
2.27.0


