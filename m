Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0A3C021A8
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 11:29:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiArK-0006BS-4q; Wed, 12 Feb 2025 06:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArJ-0006Aq-DR
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 06:24:49 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArG-0004a2-T1
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 06:24:49 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-439585a067eso7254735e9.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2025 03:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739359485; x=1739964285; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cb6beBAMJuXhOI+0o0YuqXYdtcAOxLgJDcrytdbtXYs=;
 b=TklTZK8vhUmWnLdos3ZkzKC4VO4FAfykxNk3gIxlvplkPLZTn4GyKmwkZ2Ma++/SST
 doBEznRUOF+ENGWWk88Q8uYiEWmaciSFh0x6oHAWaZSymcDiD7tIXR66XP39x00hkafJ
 eu7m01NsE/DrJetwQHIXBO+K31Jbev61hrebt+A/uoANSsfhxGHKUcUcyjjKQMZitjtS
 QoaOuTScfpoIQ+1dJ/yQNpNt18BjwxjwV3ODu1MnDwCS3Cqb9AdRMOz2yOWe13LqW1kp
 o6pFbhkGV4PrjOG9CZtmgQ51cq+QdK0jxoTwkwNoBEfHjg8YD8B8HI7HKtDHHqVIkhvI
 5QRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739359485; x=1739964285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cb6beBAMJuXhOI+0o0YuqXYdtcAOxLgJDcrytdbtXYs=;
 b=tPv30IWOX56KoASJIrmMGnD5O3raM+gkh0P11DgMY+F1EQ8yhNelM3ZZrkatd4a9SX
 gxYflCiJpGQ5sk0xEw8GzCn1XCmD49KLUJ9jLlEIpjumdC6pI3tOqXIE2vdi3sXaQSkZ
 B5M1c8X9xcCQqMzcWu2o+OBC32lXOFsZfaW9bA3S1bK7Few5BONhu7zyZQl5GNtTsehq
 JHZMM9h3BUZ7ejZwlxtStdEa59EWRsrxwfvBeNh/XBOJxvTGnduhFnFvlsVHcpPrK7ia
 dk9leAy62VsuSW/mjydPeHAWVRkljvZnRm8N/MgTgAPKDrOFLaXnLMpwU2Z2kR+QnU6i
 fG8w==
X-Gm-Message-State: AOJu0YzEd6lRspZ4Yy5MQRVEOrwOlWAMuI8nTOYoJ0UJgF/jmtg6VhJT
 GuXBmgUTICbuoWWfgKffylaIvqW94z/G/W1mWs+OcQIkQt6DxIDdpQIHkKO7g6g=
X-Gm-Gg: ASbGnctLbSncHN0D8EzRJZnWKup1hAgymCtMCEtKg2dpYjjb+Qx+6oGWx3y3oskASqZ
 dGzP9IXk4sNwYl1gO1gP0qZ/GuGB4yNqWqo+/6UQU79rCF+rAONao6ajS5tXh+C92TVP3b/RAZI
 N1CdM9V1apchka76GiTM02rCzg+wPRj2n1cHfKJTMJBk8U7yFJT/lBS2PmnCo+CyEld+LbQ/rk6
 tOHoXQ9t1BOksL2lyei/9W5IgMxXhHj2FiM2AUyNw0VkuL5bqZk0hwlUyh+9ACk1vbRwuUxtOrd
 GDVr6bZ0Y2q7WCkVW+586hc7CM7xtzclSFXx+ewutj0FGCQjfQH6EhpmVf3+wrkk/w==
X-Google-Smtp-Source: AGHT+IFdtqJamxBW9GE0klkecF0WN4Hb4n5R/j/4/81+biwDybVeM+GBVNOuJtyhwC3o970z5ase/A==
X-Received: by 2002:a05:600c:3544:b0:439:57bb:2aa with SMTP id
 5b1f17b1804b1-43958166727mr34680465e9.11.1739359484669; 
 Wed, 12 Feb 2025 03:24:44 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38e54f521f3sm1200655f8f.83.2025.02.12.03.24.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:24:44 -0800 (PST)
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
Subject: [PATCH v6 06/11] hw/ssi/xilinx_spi: Make device endianness
 configurable
Date: Wed, 12 Feb 2025 12:24:08 +0100
Message-ID: <20250212112413.37553-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212112413.37553-1-philmd@linaro.org>
References: <20250212112413.37553-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
 hw/microblaze/petalogix_ml605_mmu.c |  1 +
 hw/ssi/xilinx_spi.c                 | 32 +++++++++++++++++++++--------
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 490640e9428..b34edf13796 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -175,6 +175,7 @@ petalogix_ml605_init(MachineState *machine)
         SSIBus *spi;
 
         dev = qdev_new("xlnx.xps-spi");
+        qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);
         qdev_prop_set_uint8(dev, "num-ss-bits", NUM_SPI_FLASHES);
         busdev = SYS_BUS_DEVICE(dev);
         sysbus_realize_and_unref(busdev, &error_fatal);
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index fd1ff12eb1d..0cedfb526a0 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -25,6 +25,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
@@ -32,6 +33,7 @@
 
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
 #include "hw/ssi/ssi.h"
 #include "qom/object.h"
 
@@ -83,6 +85,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XilinxSPI, XILINX_SPI)
 struct XilinxSPI {
     SysBusDevice parent_obj;
 
+    EndianMode model_endianness;
     MemoryRegion mmio;
 
     qemu_irq irq;
@@ -313,14 +316,17 @@ done:
     xlx_spi_update_irq(s);
 }
 
-static const MemoryRegionOps spi_ops = {
-    .read = spi_read,
-    .write = spi_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4
-    }
+static const MemoryRegionOps spi_ops[2] = {
+    [0 ... 1] = {
+        .read = spi_read,
+        .write = spi_write,
+        .valid = {
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
+    },
+    [ENDIAN_MODE_BIG].endianness = DEVICE_BIG_ENDIAN,
+    [ENDIAN_MODE_LITTLE].endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void xilinx_spi_realize(DeviceState *dev, Error **errp)
@@ -329,6 +335,12 @@ static void xilinx_spi_realize(DeviceState *dev, Error **errp)
     XilinxSPI *s = XILINX_SPI(dev);
     int i;
 
+    if (s->model_endianness == ENDIAN_MODE_UNSPECIFIED) {
+        error_setg(errp, TYPE_XILINX_SPI " property 'endianness'"
+                         " must be set to 'big' or 'little'");
+        return;
+    }
+
     DB_PRINT("\n");
 
     s->spi = ssi_create_bus(dev, "spi");
@@ -339,7 +351,8 @@ static void xilinx_spi_realize(DeviceState *dev, Error **errp)
         sysbus_init_irq(sbd, &s->cs_lines[i]);
     }
 
-    memory_region_init_io(&s->mmio, OBJECT(s), &spi_ops, s,
+    memory_region_init_io(&s->mmio, OBJECT(s),
+                          &spi_ops[s->model_endianness], s,
                           "xilinx-spi", R_MAX * 4);
     sysbus_init_mmio(sbd, &s->mmio);
 
@@ -362,6 +375,7 @@ static const VMStateDescription vmstate_xilinx_spi = {
 };
 
 static const Property xilinx_spi_properties[] = {
+    DEFINE_PROP_ENDIAN_NODEFAULT("endianness", XilinxSPI, model_endianness),
     DEFINE_PROP_UINT8("num-ss-bits", XilinxSPI, num_cs, 1),
 };
 
-- 
2.47.1


