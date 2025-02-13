Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFDCC021A0
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 12:24:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiYF8-0002Ae-8g; Thu, 13 Feb 2025 07:22:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYF7-0002AO-Hd
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 07:22:57 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYF5-0002ZB-OO
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 07:22:57 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5de38c3d2acso1334924a12.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Feb 2025 04:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739449374; x=1740054174; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q9MrYcI98DZnIhdDN9JLb40jpmFmxWLeEaWhZtHGUKQ=;
 b=TYAyAHp2NEkddWbTvCy1WUFVILw7IC3TiC8Rr6jjlv/6G8bR7YQj/W9jdZ942LXVdF
 SOLRZxjWG8glB/afTOomDAg64svXf/jnWRoGxU2xn220oDqr10FrfSBLQSUn5wxZsejw
 YcKTWJaxzNWZ48kT8wp4NDiPXXqWgXaZV/nod0slOok2WBqZEWn/CHtDWAnLLMSu/Y2p
 Clnn6cfJtAXKJGDbeP2+wZx6je7lUq1PS3zd9kwwEwiYAdHA2RfKieo0f7lVfU/klUb0
 9KMYDJJYYmuKtgm+9lnNWuJFSsBG4ut6Xe8/ISXPUo3PFGdsqcblkT44vZ2YbvpOMTQP
 hilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739449374; x=1740054174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q9MrYcI98DZnIhdDN9JLb40jpmFmxWLeEaWhZtHGUKQ=;
 b=oS1L6m6CuAdNJ0kZm6dis/dRypSIqDgeEm9akTtcSt5BXVYCIGdUSBHi+DfyNV8VSq
 ZuX+0x8UthuYxNQVmniowsnmT57slXwR8OFoMPdo1Cqb0pYaEFZjUFr5NHLf2S4aAclC
 HmGB5IPBrQfM0qkJ9TH9IQHsDeWEIWY5KAxgfi3h/bo5HHC4Jw3NmAfB8ZZvGJfzzeU7
 XFXwp/F8GqNFibRy3DA/7KqwglPZIXuNTPpv8sFthHyP24UuD0mx84g2trlnonctzuOO
 QdfU7VFq/oEHnUgPjme1+f3GOAo2thT5XWcgX5T1rt0LxOfjPmY7AzkluoSq2MdKwwRw
 p3oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3lk7zHtNLlqKxd9ZpwMO5d8knnWoMiwjydG929eUjt5DETIr6AlrQW08R7hstvYPqFk1R3e5qUemp@nongnu.org
X-Gm-Message-State: AOJu0Yzl3WagsiHOPYBczHV6Ks8ar4y42VjwXAIGS2EuzdyKvoFUkGoi
 xpG3IiTFqkMd1V+e4nPqkve08ghJuADF3cdQNmuaJX+s3xFKkraa7ebmxwwVsYE=
X-Gm-Gg: ASbGncucA8Txmi7dPECzMpl+pvgIwjNPS/Ic0Yi9W5Wc5XE21Xi4PjkTzkiQyzP8X77
 BN7cQ8PPX0SlqqExW1UELYk78L3wkBBqeHjAzJP4GgogKK/zzE2ycvqKTUThD1Tbx6HxoEunUdJ
 XbpnjqVtqT7dXjYP6zmyLIa/UjNgilt5FJ44ObNiOnZE5yfe9zALHsY9WSYTn1WuxBzulv4Z0Nh
 DW9rR7OmmVbBcwt0eY4ddLapPu0v8N1FezdiPNUogZks6xMvKupMJGkK31knHSicuEZUZmjiL2k
 KVAid5MhSjSkXkpViyLJJ/nVsS0274BB6A4+WMY7NNhEoJQF1L0CzSGoXc7J
X-Google-Smtp-Source: AGHT+IERhqm009MMzBvCPPJ4nH7SL8Mqb0JAzttcqbC6tt16gdvSwBwGWRZEHYUNMh8J01LFd0/HbQ==
X-Received: by 2002:a05:6402:50cc:b0:5d9:fc81:e197 with SMTP id
 4fb4d7f45d1cf-5deadd8e4a1mr6069944a12.8.1739449374292; 
 Thu, 13 Feb 2025 04:22:54 -0800 (PST)
Received: from localhost.localdomain (6.170.88.92.rev.sfr.net. [92.88.170.6])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1c4646sm1104999a12.27.2025.02.13.04.22.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Feb 2025 04:22:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v8 5/6] hw/char/xilinx_uartlite: Make device endianness
 configurable
Date: Thu, 13 Feb 2025 13:22:16 +0100
Message-ID: <20250213122217.62654-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250213122217.62654-1-philmd@linaro.org>
References: <20250213122217.62654-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair of
DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.

Add the "endianness" property to select the device endianness.
This property is unspecified by default, and machines need to
make it explicit.

Set the proper endianness for each machine using the device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/char/xilinx_uartlite.c                | 34 ++++++++++++++++--------
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
 hw/riscv/microblaze-v-generic.c          |  1 +
 3 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index 56955e0d74a..4037c937eeb 100644
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
+    [0].endianness = DEVICE_LITTLE_ENDIAN,
+    [1].endianness = DEVICE_BIG_ENDIAN,
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
+                          &uart_ops[s->model_endianness == ENDIAN_MODE_BIG],
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


