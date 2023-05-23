Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F03DC7EE23
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 08:50:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1Nhw-0008FA-Mq; Tue, 23 May 2023 04:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1Nhv-0008El-FD
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 04:49:27 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1Nht-0004HN-Oc
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 04:49:27 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-64d5b4c400fso3063580b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 23 May 2023 01:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1684831764; x=1687423764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tglQvDelsKZG+AiytE2o2CAqS4vMBAFvHT5eH253n4c=;
 b=AZAFVlgO93R829aFX0oCltx5cYueKhNs1A+1FgFkYKXKV8P5IN1t+tKFBczqgmIWRc
 6LGysMjd/WOV5BSNI2ETAvCau2hantVYmZes5p9p4P20A0MGCejSPEyGq0iq5NEPUEas
 Jn3UOTjKULAle6Rr2Wt1wb7wO+3XSOGzU9g0N/rD5MOFWIgVg1HCRlELWQJiTEDK3Mvz
 HYdtYXr37vYq7m6P7J8+ATZhC+spnU6Ddc6yJXTLljxrtdNtra6XdNRxix0nIWq91CUL
 nMXCf96QcghGwtHJ3bXV7WABqGNy7D6i0wHlC7E6uxapuldNcffhHAg/mT3ZOMcgr4OC
 KIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684831764; x=1687423764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tglQvDelsKZG+AiytE2o2CAqS4vMBAFvHT5eH253n4c=;
 b=SEZ3SiKIz0CsXXJOA8q7/HSSxh5vQyqfojlF4XkYTgXeFHu9anthbZzbvpPK+YTBqr
 iXyE1dSF7RnlpaGlo9OQmebBjoUtdCbSo3PdC0GD8GJpG0b5aYIELfyIy02uh8FsPeJQ
 QB3Mf7ieLYvZ6ceqnf5rsPJBypvH+NsAQl/uG5DeBVgzOLLalHkf8Wa/+hZzuoiTFjBs
 JqWzBiwmK4vsmFxFDuybacX7OzaaLp9hED2Mg7ncbPONquECPZL9/r1zosdpjF2WW9/6
 wLYsxSGdxuWgs0qO36MICFmvfUJehZn7YJVgkvMzilObjRVvfTzlAYFstpjYYSpOONWT
 9q4w==
X-Gm-Message-State: AC+VfDwkn8dRa3ki4qQPrU0JkiWUR65l2E79yoaPIsuKCojsSGiAIJk9
 zeBcjTYvYbAG6yJ2BD7Kh9h+Ug==
X-Google-Smtp-Source: ACHHUZ4oJxWTOH/n5LAjj3XrhmVHkR9Cv9P4QwHkwCNKnGTwuI7HBtaK/QCfF6mfzxto+wVbNGSBzw==
X-Received: by 2002:a05:6a00:1949:b0:64c:c5f9:152a with SMTP id
 s9-20020a056a00194900b0064cc5f9152amr16978951pfk.23.1684831763662; 
 Tue, 23 May 2023 01:49:23 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a635118000000b0052858b41008sm5634475pgb.87.2023.05.23.01.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 01:49:23 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, thuth@redhat.com,
 liweiwei@iscas.ac.cn, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v4 2/3] hw/riscv: sifive_e: Support the watchdog timer of
 HiFive 1 rev b.
Date: Tue, 23 May 2023 01:49:09 -0700
Message-Id: <20230523084910.304679-3-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230523084910.304679-1-tommy.wu@sifive.com>
References: <20230523084910.304679-1-tommy.wu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=tommy.wu@sifive.com; helo=mail-pf1-x42f.google.com
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
 hw/riscv/sifive_e.c         | 13 +++++++++++--
 include/hw/riscv/sifive_e.h |  8 +++++---
 3 files changed, 17 insertions(+), 5 deletions(-)

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
index 04939b60c3..731ed0e11d 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -45,6 +45,7 @@
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_e_prci.h"
+#include "hw/misc/sifive_e_aon.h"
 #include "chardev/char.h"
 #include "sysemu/sysemu.h"
 
@@ -223,8 +224,13 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
         RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
         RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
         RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
-    create_unimplemented_device("riscv.sifive.e.aon",
-        memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
+
+    s->aon = qdev_new(TYPE_SIFIVE_E_AON);
+    if (!sysbus_realize(SYS_BUS_DEVICE(s->aon), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(s->aon), 0, memmap[SIFIVE_E_DEV_AON].base);
+
     sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
 
     /* GPIO */
@@ -245,6 +251,9 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
                            qdev_get_gpio_in(DEVICE(s->plic),
                                             SIFIVE_E_GPIO0_IRQ0 + i));
     }
+    sysbus_connect_irq(SYS_BUS_DEVICE(s->aon), 0,
+                       qdev_get_gpio_in(DEVICE(s->plic),
+                                        SIFIVE_E_AON_WDT_IRQ));
 
     sifive_uart_create(sys_mem, memmap[SIFIVE_E_DEV_UART0].base,
         serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_E_UART0_IRQ));
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index b824a79e2d..a094b47e0b 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -35,6 +35,7 @@ typedef struct SiFiveESoCState {
     /*< public >*/
     RISCVHartArrayState cpus;
     DeviceState *plic;
+    DeviceState *aon;
     SIFIVEGPIOState gpio;
     MemoryRegion xip_mem;
     MemoryRegion mask_rom;
@@ -76,9 +77,10 @@ enum {
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


