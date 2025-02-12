Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FEEC02198
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 11:28:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiArG-00069m-Gy; Wed, 12 Feb 2025 06:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArE-00068q-Ju
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 06:24:44 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArB-0004YP-QD
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 06:24:44 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4394a823036so25671115e9.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2025 03:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739359480; x=1739964280; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qque2XZ1dU81iGdYR24fO3GVnw9hhnz4b3BIk7lxH2E=;
 b=yQ2EoxxRFl1NA60u4SQfy/rFNhk0EmKdr8fU9RceuC6mUBJD5eAKLG2KaIF5RHpotI
 /7NmB9FqIQa2TierTWrp4bJ4giBOz7Y+DZGxYJtZzzSoj/XxezFS1561czHlFKluiqtY
 mBPoEUNfh3I8nPdtKV/nvNXxy+zedYlDfaGsoaJ71ftqHXLA/WcPXlwz+pHNx5Mf7yh2
 w7qj11ES5xex49rUPn85YOaf4G4IqOdJ/DJNIyqiYrVb2ImUPBsxvJm5FLvrnVxExx9V
 9vPq0yEzbJ/bRZwerfNXYSeXpU9ZFgJJ7yg9jCN3wlhi6t5pzkBYBnYPniMRYnCLsbqT
 dmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739359480; x=1739964280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qque2XZ1dU81iGdYR24fO3GVnw9hhnz4b3BIk7lxH2E=;
 b=nu6KnAcOjqvyjAJa5SvcaDgErIJTnQbKKEggb2GP4cSO/XHKENFasj6Vqjv+XSKo9c
 ykxcpAeLigo0aEovOdRHDbPb/avO4QtlfJfVW5XylXXsvm7LT97IsMkt4eiHwfvZ4owA
 80nPwbua0X9azJ0KNz86hEUw8wm/3nfk9N2ageDQ2tcIUXg7ynTEmgYw+IZjkE15pXpD
 TBjqct1EAwK2H4ZibGIAnH3b6wv5XaliVxIi06zQWvEI+Y06izQ2hNyspM1X8BOoIJEq
 36exTqCA8o+mf+a3wvuqv9xmiXPdwmvgwwJQa9egVl0aZQmzhCANESd/jPuOpNryDgv2
 f68A==
X-Gm-Message-State: AOJu0Yyow00S/3PJvUEGosZiWVyytE17JaaZntq+vQHZlRGs/ERY77HK
 k8DveY0d/tmONiJLGOAvaqMhK6v37FvYK6fcSHKtMuPaZJ32Lf+wEVyQO6LvsdA=
X-Gm-Gg: ASbGncsSP94W1KJNJ2jeMiY8RdWVCkIjGCIVDnTd7EjqNQQzcX8NP3XDSMFcKF60QFe
 9DglwIOrCQIHfZQGyvVSyQsLqxKnbpthG3Dl3npxmeTFwHPniOfQzfhnijEsV+h04fMRMS89GIf
 KIHefWK3HBXUug9YeYFpXK4wBpRo5gkqVuLTx3CtTn2otrsHzVkfea6SZy56b3J/qZozFoy0mi+
 rUyNNvO6FrWegafsyDkF8xp350Y4SnXzBgNvNgJwUjVgQS8g6Fb9lDSy3TMFwk8WVjRH9RhYGJB
 UGnFXPOCU8sBatPW1uAxw+T1ymcBqkU0vYWXwyxODldDgEpWLhFg1ixBsRjlMKXC3w==
X-Google-Smtp-Source: AGHT+IFNDzo6COMI9HZI6tOI90FY8EHZldwBzXiKq59lW+yhMmkMCOTE7aGpWlaD48acOBbaTA8qLw==
X-Received: by 2002:a05:600c:3ba8:b0:439:4832:325f with SMTP id
 5b1f17b1804b1-43958160560mr23189195e9.1.1739359479876; 
 Wed, 12 Feb 2025 03:24:39 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd1af07sm17390101f8f.15.2025.02.12.03.24.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:24:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 05/11] hw/char/xilinx_uartlite: Make device endianness
 configurable
Date: Wed, 12 Feb 2025 12:24:07 +0100
Message-ID: <20250212112413.37553-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212112413.37553-1-philmd@linaro.org>
References: <20250212112413.37553-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
Add the "little-endian" property to select the device
endianness, defaulting to little endian.
Set the proper endianness on the single machine using the
device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/xilinx_uartlite.c                | 34 ++++++++++++++++--------
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
 hw/riscv/microblaze-v-generic.c          |  1 +
 3 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index 56955e0d74a..907fb33c6c0 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
 #include "hw/char/xilinx_uartlite.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
@@ -57,6 +58,7 @@
 struct XilinxUARTLite {
     SysBusDevice parent_obj;
 
+    EndianMode model_endianness;
     MemoryRegion mmio;
     CharBackend chr;
     qemu_irq irq;
@@ -166,17 +168,21 @@ uart_write(void *opaque, hwaddr addr,
     uart_update_irq(s);
 }
 
-static const MemoryRegionOps uart_ops = {
-    .read = uart_read,
-    .write = uart_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
-        .min_access_size = 1,
-        .max_access_size = 4
-    }
+static const MemoryRegionOps uart_ops[2] = {
+    [0 ... 1] = {
+        .read = uart_read,
+        .write = uart_write,
+        .valid = {
+            .min_access_size = 1,
+            .max_access_size = 4,
+        },
+    },
+    [ENDIAN_MODE_BIG].endianness = DEVICE_BIG_ENDIAN,
+    [ENDIAN_MODE_LITTLE].endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const Property xilinx_uartlite_properties[] = {
+    DEFINE_PROP_ENDIAN_NODEFAULT("endianness", XilinxUARTLite, model_endianness),
     DEFINE_PROP_CHR("chardev", XilinxUARTLite, chr),
 };
 
@@ -214,6 +220,15 @@ static void xilinx_uartlite_realize(DeviceState *dev, Error **errp)
 {
     XilinxUARTLite *s = XILINX_UARTLITE(dev);
 
+    if (s->model_endianness == ENDIAN_MODE_UNSPECIFIED) {
+        error_setg(errp, TYPE_XILINX_UARTLITE " property 'endianness'"
+                         " must be set to 'big' or 'little'");
+        return;
+    }
+
+    memory_region_init_io(&s->mmio, OBJECT(dev),
+                          &uart_ops[s->model_endianness],
+                          s, "xlnx.xps-uartlite", R_MAX * 4);
     qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx,
                              uart_event, NULL, s, NULL, true);
 }
@@ -223,9 +238,6 @@ static void xilinx_uartlite_init(Object *obj)
     XilinxUARTLite *s = XILINX_UARTLITE(obj);
 
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
-
-    memory_region_init_io(&s->mmio, obj, &uart_ops, s,
-                          "xlnx.xps-uartlite", R_MAX * 4);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 }
 
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index caaea222a8c..bdba2006b72 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -109,6 +109,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
     }
 
     dev = qdev_new(TYPE_XILINX_UARTLITE);
+    qdev_prop_set_enum(dev, "endianness", endianness);
     qdev_prop_set_chr(dev, "chardev", serial_hd(0));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, UARTLITE_BASEADDR);
diff --git a/hw/riscv/microblaze-v-generic.c b/hw/riscv/microblaze-v-generic.c
index 3c79f5733b2..d8e67906d26 100644
--- a/hw/riscv/microblaze-v-generic.c
+++ b/hw/riscv/microblaze-v-generic.c
@@ -92,6 +92,7 @@ static void mb_v_generic_init(MachineState *machine)
 
     /* Uartlite */
     dev = qdev_new(TYPE_XILINX_UARTLITE);
+    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);
     qdev_prop_set_chr(dev, "chardev", serial_hd(0));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, UARTLITE_BASEADDR);
-- 
2.47.1


