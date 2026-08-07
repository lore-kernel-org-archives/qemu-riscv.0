Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C87AC5AC82
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 16:42:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsNd7-0001mP-3Z; Fri, 07 Aug 2026 12:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wzy15515798875@gmail.com>)
 id 1wsMVP-0004MH-EY
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 11:29:07 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wzy15515798875@gmail.com>)
 id 1wsMVN-0007Nh-Cg
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 11:29:07 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2cc61541f8cso25062435ad.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786116544; x=1786721344; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I23kL40IdR3TgWRLaRgG60FGmA0UqKqWTKWMYTL83+g=;
 b=GbYwPsPU8Xx041aUaxDBh+FzMGYEVEcePJOjF90Ov1XLNASS5nVPwfJdFFXpc7quKv
 tlnEicXieR14jc0mfoGKHSXy0HCk1veNfv+5sNtqz6Ce2QYB6qzsMJ977aLHRypNA+Sk
 GXTaDyHOBb2t3195U5CKL/cYDJSgO8o/XKnyR/1bHBanEZbN8TeCR24LidTYefAGXTOu
 sivq8iTJc/w4MVB7nQfFpFQ6UI4xGXPeNQZY5LwkLK+iXZooQYSJZu8fi2+Fv9r3sHto
 +C2wmB6lmWwzum+5M1PRxTZa1VaXQVE8En647i3DKCB9uoPuE54A5s/4yV6A1EdMURcn
 eFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786116544; x=1786721344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=I23kL40IdR3TgWRLaRgG60FGmA0UqKqWTKWMYTL83+g=;
 b=YKU5yCfXRbRa1TmOprD6j9UeRvwpysKtSYUtx6b27qEIylsTeLl+iV5uLQRQaQJD3Y
 XsOz7Nq/Xr1IuxNX3fiiChBjURHXyxeJXeI2AKjQLWLV3Pp80/zW53VhUwpbyKNQn7jA
 BMyd1BQeD8U1s18gI1qgnle1feLbTjSNtqB8zfnS3dtAzZsQDxZXLfYZyrIpDwWiCFLk
 tY5idrJle3RfFM6zq3Mr7jwvoIk6x9D0e2bhpL5b3JlZNZgdzmyjsNqhNLW54xnPcG4h
 i9DtH5DBY8bFRWOynFDf7OD8ClnOdR8pNk52h/AZNNsqjp10wvjUp2yt+sn16FKimXj6
 o10Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RqnSUBMYj/6X82AllMwcFsJ1cFQUnb5688crTxCnsEIKtbdllVez3RGeWJtVwz3cUbxsECa0SjKNk7w@nongnu.org
X-Gm-Message-State: AOJu0Yw760bVv9bybWA1Vjnu42Mo3Llzf4gSzYL0n7jeACL2M5Ky/N2i
 B9NHj/Du9/lpXeEgNBVXLMXOpy9JdnwNbEEERWRSL4nkeCcLIPZFu/oo
X-Gm-Gg: AR+sD126vBy9Hns44dplEmkRn/4K0TR/VXle9vkujcxCh1ga8og1dJN0XiRdDSsRerb
 5LhLXD287OoxySpzQSRdBBzn9iN6vSDbM4ssNCDbelGKIIxRr0pnDOiHOrMfxKWTcG8cBIBhQU8
 nRD6TULTQ140OLSFcJkAl/au26QLcJoI2wTJGIGZPOxeZyLHjNnq5WOBLcdmgL2mgrS3M8W+p+2
 syCjRRb4tAa7AcK4fVHB8OZcz1weX9NoCaj2NKsYfR5XF8Rx6YlfjifpCmg0cPizjkDCJPFgkAt
 n3dH881Z9IK9TnCqDmGS4B8S2ZYGaZSFENPP+GORWwHhowWxZ1dBSy9zgj8RJlTyOhMS6J8kvLh
 8lUX/VVI+f30xJjNdiw4FxX5FnZpg1I3mzyvITk3R4CLwVgfDuCGn9Exdu19ZDS9pGqAzcCocy+
 rB+sLMaG7A/lzp8Bj3j72jd5/zZJej+CPKlSxTWVt3Bpq0ZgdlaSHv7w2VIM5OPk8uOUPZv4EGq
 +TVQWS/w28=
X-Received: by 2002:a17:902:f647:b0:2bc:e299:4b3f with SMTP id
 d9443c01a7336-2d2ada14588mr3871805ad.10.1786116543886; 
 Fri, 07 Aug 2026 08:29:03 -0700 (PDT)
Received: from localhost.localdomain
 ([2406:da14:1cf8:d800:471c:a879:4603:554f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d14ccae6f8sm10953895ad.1.2026.08.07.08.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 08:29:03 -0700 (PDT)
From: Wang Zhongyu <wzy15515798875@gmail.com>
To: Chao Liu <chao.liu@processmission.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 2/5] hw/riscv: instantiate K230 I2C controllers
Date: Fri,  7 Aug 2026 23:28:27 +0800
Message-ID: <20260807152830.6833-3-wzy15515798875@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807152830.6833-1-wzy15515798875@gmail.com>
References: <20260807152830.6833-1-wzy15515798875@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=wzy15515798875@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, FROM_LOCAL_DIGITS=0.001,
 FROM_LOCAL_HEX=0.006, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 07 Aug 2026 12:41:08 -0400
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

Instantiate the five K230 I2C controllers, map their MMIO regions,
and connect IRQs 21 through 25 to the PLIC.

Select the K230 I2C model in the machine configuration and update
the K230 machine documentation.

Signed-off-by: Wang Zhongyu <wzy15515798875@gmail.com>
---
 docs/system/riscv/k230.rst |  1 +
 hw/riscv/Kconfig           |  1 +
 hw/riscv/k230.c            | 36 +++++++++++++++++++++---------------
 include/hw/riscv/k230.h    |  8 ++++++++
 4 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/docs/system/riscv/k230.rst b/docs/system/riscv/k230.rst
index cea8202e55..7a011903ab 100644
--- a/docs/system/riscv/k230.rst
+++ b/docs/system/riscv/k230.rst
@@ -19,6 +19,7 @@ The ``k230`` machine supports the following devices:
 * Core Local Interruptor (CLINT)
 * Platform-Level Interrupt Controller (PLIC)
 * 2 K230 Watchdog Timer
+* 5 K230 I2C controllers
 * 5 UART
 
 Boot options
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index de37c08cae..d2bd41173d 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -162,3 +162,4 @@ config K230
     select SERIAL_MM
     select UNIMP
     select K230_WDT
+    select K230_I2C
diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
index 656f28190c..a42f896c0a 100644
--- a/hw/riscv/k230.c
+++ b/hw/riscv/k230.c
@@ -110,6 +110,11 @@ static void k230_soc_init(Object *obj)
     object_initialize_child(obj, "c908-cpu", cpu0, TYPE_RISCV_HART_ARRAY);
     object_initialize_child(obj, "k230-wdt0", &s->wdt[0], TYPE_K230_WDT);
     object_initialize_child(obj, "k230-wdt1", &s->wdt[1], TYPE_K230_WDT);
+    object_initialize_child(obj, "k230-i2c0", &s->i2c[0], TYPE_K230_I2C);
+    object_initialize_child(obj, "k230-i2c1", &s->i2c[1], TYPE_K230_I2C);
+    object_initialize_child(obj, "k230-i2c2", &s->i2c[2], TYPE_K230_I2C);
+    object_initialize_child(obj, "k230-i2c3", &s->i2c[3], TYPE_K230_I2C);
+    object_initialize_child(obj, "k230-i2c4", &s->i2c[4], TYPE_K230_I2C);
 
     qdev_prop_set_uint32(DEVICE(cpu0), "hartid-base", 0);
     qdev_prop_set_string(DEVICE(cpu0), "cpu-type", TYPE_RISCV_CPU_THEAD_C908);
@@ -191,6 +196,22 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
         k230_create_uart(sys_mem, DEVICE(s->c908_plic), i);
     }
 
+    /* I2C */
+    for (int i = 0; i < K230_I2C_COUNT; i++) {
+        int i2c_dev = K230_DEV_I2C0 + i;
+
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c[i]), errp)) {
+            return;
+        }
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c[i]), 0,
+                        memmap[i2c_dev].base);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c[i]), 0,
+                        qdev_get_gpio_in(DEVICE(s->c908_plic),
+                                            K230_I2C0_IRQ + i));
+    }
+
     /* Watchdog */
     for (int i = 0; i < 2; i++) {
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
@@ -304,21 +325,6 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("security", memmap[K230_DEV_SECURITY].base,
                                 memmap[K230_DEV_SECURITY].size);
 
-    create_unimplemented_device("i2c0", memmap[K230_DEV_I2C0].base,
-                                memmap[K230_DEV_I2C0].size);
-
-    create_unimplemented_device("i2c1", memmap[K230_DEV_I2C1].base,
-                                memmap[K230_DEV_I2C1].size);
-
-    create_unimplemented_device("i2c2", memmap[K230_DEV_I2C2].base,
-                                memmap[K230_DEV_I2C2].size);
-
-    create_unimplemented_device("i2c3", memmap[K230_DEV_I2C3].base,
-                                memmap[K230_DEV_I2C3].size);
-
-    create_unimplemented_device("i2c4", memmap[K230_DEV_I2C4].base,
-                                memmap[K230_DEV_I2C4].size);
-
     create_unimplemented_device("pwm", memmap[K230_DEV_PWM].base,
                                 memmap[K230_DEV_PWM].size);
 
diff --git a/include/hw/riscv/k230.h b/include/hw/riscv/k230.h
index 592e1c26bf..4ea927a63b 100644
--- a/include/hw/riscv/k230.h
+++ b/include/hw/riscv/k230.h
@@ -18,8 +18,10 @@
 #include "hw/core/boards.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/watchdog/k230_wdt.h"
+#include "hw/i2c/k230_i2c.h"
 
 #define C908_CPU_HARTID   (0)
+#define K230_I2C_COUNT    5
 
 #define TYPE_RISCV_K230_SOC "riscv.k230.soc"
 #define RISCV_K230_SOC(obj) \
@@ -33,6 +35,7 @@ typedef struct K230SoCState {
     RISCVHartArrayState c908_cpu; /* Small core */
 
     K230WdtState wdt[2];
+    K230I2CState i2c[K230_I2C_COUNT];
     MemoryRegion sram;
     MemoryRegion bootrom;
 
@@ -127,6 +130,11 @@ enum {
     K230_UART2_IRQ  = 18,
     K230_UART3_IRQ  = 19,
     K230_UART4_IRQ  = 20,
+    K230_I2C0_IRQ   = 21,
+    K230_I2C1_IRQ   = 22,
+    K230_I2C2_IRQ   = 23,
+    K230_I2C3_IRQ   = 24,
+    K230_I2C4_IRQ   = 25,
     K230_WDT0_IRQ   = 107,
     K230_WDT1_IRQ   = 108,
 };
-- 
2.43.0


