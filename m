Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B24C021A5
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 12:39:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiC0J-00049E-NV; Wed, 12 Feb 2025 07:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBze-0003XH-Ab
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 07:37:35 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBzZ-0000SR-VO
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 07:37:29 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38dc6d55ebaso522719f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2025 04:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739363841; x=1739968641; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QFruT4KVXTm4i3uwBDbgytCPbkHFAf9gJzDNsjzYXEo=;
 b=AeHPp/9N40PBWU454nfa7dB8oSqCCtamR7fJC8Pb4iZyb+SqbNpnEAuHaEnKXXh88q
 9wqSUQh8KpbeQojkd4kKqcBeh/61Rvj5o20bGDTqkyyeS1Q12+AIaSxncmLpmWdewb+i
 H94uaLSInUbNK7p7LkhJLuQtXSSjLjOEbCA5lnswwsrZYd+D9tk+6vTcFwNv1Rqi4CWZ
 I0K0DeJbY0QYpwuW7BrGgVmmn2+nQR2OdJUYGgB0fIiXHpbfhOUptjeeE19IVNBi4hdl
 5kgglmWwcqpfweQciGA/V/rwETp1KZ57JwvmVUQqbqH2VhTZVgCwp8eDLWReLM/wP7uV
 wUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739363841; x=1739968641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QFruT4KVXTm4i3uwBDbgytCPbkHFAf9gJzDNsjzYXEo=;
 b=aBHmk4izzoDzfLHBA+mfDDfrR9/yCASAI4IvvHGxlWccqx63ccAMP8hSCFeu3FfuX1
 4J8mFJ1+cY74Jz5TshKOsxWSCN9X0wug3YEVa1TjQLJkvuQMHZiV6FUUCUEhFy2zwruK
 z61hHRiE4WkFn7zV6Iy69de5v8T0RE8MqZguJMzBw01YLWhPhOUwMqJicSCXEi6YyeER
 n/CD0oQu53gqKLHCdaaAYXU6NjcTQAcL7bkKH2vMa6hwPnYlNSly9BrE0JCV7HRU98fV
 /Up065llK3Qpc6+QDXIKP3a11jZVEKkWM3qmtvjzwM+/Li/lehQzXZeC94Ui6hyjUsVW
 JYIA==
X-Gm-Message-State: AOJu0YzuBOwsPxaiuFqWUsTG38QpblPG8F7zzVvEW2voxOilma2jiBAR
 gjFel4z401XbTvjHMRZRi590xxhCI8d7qXBT1N3bY1ImjDDdUOiV+sQg0Z2LKGI=
X-Gm-Gg: ASbGncvGdeETdqOFyxruvQcIfuMrgg7gXUKFEHzJoML8Gz/GWJag+mnzDnN99OeZJdM
 c9atm+uu5529z5WV0Cp6R12GLmWkKpHgDz8glOY6iKAgOsMnNcB/usJNyoEfjttP2vAIuGnsw8g
 pTdFjiuPALOqeCkBWBx4ZUsA8Ko5freB587qT6uamMF1T4uXqAnyZLi4pHnDWBlmH+T/JK7qAqY
 wdlCAPeFNeSQiiVy6OtnqtEHUeVzFlK9FtyPiIQ82wcILBf79TXIszVICSTUsKCD9dm9zyYJNMX
 MFLrSvCswepEQg7BoVw2ZxzbMI/J9vnbutl80PDVu/X1GUXOulTG5Kp1W/MliKi5yA==
X-Google-Smtp-Source: AGHT+IFr9h6aEhs43e6Jw/8ehslSh5fGlSn71cYelbFWG7ElgKmP4Xo295sEAk/WoMwsiSIuExvpCQ==
X-Received: by 2002:a05:6000:178d:b0:38d:ba8e:7327 with SMTP id
 ffacd0b85a97d-38dea1e118dmr2417523f8f.8.1739363841252; 
 Wed, 12 Feb 2025 04:37:21 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc5839877sm15724670f8f.3.2025.02.12.04.37.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 04:37:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 04/10] hw/timer/xilinx_timer: Make device endianness
 configurable
Date: Wed, 12 Feb 2025 13:36:53 +0100
Message-ID: <20250212123659.52764-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212123659.52764-1-philmd@linaro.org>
References: <20250212123659.52764-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
Set the proper endianness for each machine using the device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_ml605_mmu.c      |  1 +
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
 hw/ppc/virtex_ml507.c                    |  1 +
 hw/riscv/microblaze-v-generic.c          |  2 ++
 hw/timer/xilinx_timer.c                  | 43 +++++++++++++++++-------
 5 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 55398cc67d1..490640e9428 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -127,6 +127,7 @@ petalogix_ml605_init(MachineState *machine)
 
     /* 2 timers at irq 2 @ 100 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
+    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);
     qdev_prop_set_uint32(dev, "one-timer-only", 0);
     qdev_prop_set_uint32(dev, "clock-frequency", 100 * 1000000);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index d419dc49a25..caaea222a8c 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -116,6 +116,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
 
     /* 2 timers at irq 2 @ 62 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
+    qdev_prop_set_enum(dev, "endianness", endianness);
     qdev_prop_set_uint32(dev, "one-timer-only", 0);
     qdev_prop_set_uint32(dev, "clock-frequency", 62 * 1000000);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index df8f9644829..a01354d991d 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -231,6 +231,7 @@ static void virtex_init(MachineState *machine)
 
     /* 2 timers at irq 2 @ 62 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
+    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_BIG);
     qdev_prop_set_uint32(dev, "one-timer-only", 0);
     qdev_prop_set_uint32(dev, "clock-frequency", 62 * 1000000);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/riscv/microblaze-v-generic.c b/hw/riscv/microblaze-v-generic.c
index a21fdfbe6db..3c79f5733b2 100644
--- a/hw/riscv/microblaze-v-generic.c
+++ b/hw/riscv/microblaze-v-generic.c
@@ -104,6 +104,7 @@ static void mb_v_generic_init(MachineState *machine)
 
     /* 2 timers at irq 0 @ 100 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
+    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);
     qdev_prop_set_uint32(dev, "one-timer-only", 0);
     qdev_prop_set_uint32(dev, "clock-frequency", 100000000);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
@@ -112,6 +113,7 @@ static void mb_v_generic_init(MachineState *machine)
 
     /* 2 timers at irq 3 @ 100 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
+    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);
     qdev_prop_set_uint32(dev, "one-timer-only", 0);
     qdev_prop_set_uint32(dev, "clock-frequency", 100000000);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index 6595cf5f517..4620528f985 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -3,6 +3,9 @@
  *
  * Copyright (c) 2009 Edgar E. Iglesias.
  *
+ * DS573: https://docs.amd.com/v/u/en-US/xps_timer
+ * LogiCORE IP XPS Timer/Counter (v1.02a)
+ *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
  * in the Software without restriction, including without limitation the rights
@@ -23,10 +26,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/ptimer.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qom/object.h"
@@ -69,6 +74,7 @@ struct XpsTimerState
 {
     SysBusDevice parent_obj;
 
+    EndianMode model_endianness;
     MemoryRegion mmio;
     qemu_irq irq;
     uint8_t one_timer_only;
@@ -189,18 +195,21 @@ timer_write(void *opaque, hwaddr addr,
     timer_update_irq(t);
 }
 
-static const MemoryRegionOps timer_ops = {
-    .read = timer_read,
-    .write = timer_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .impl = {
-        .min_access_size = 4,
-        .max_access_size = 4,
+static const MemoryRegionOps timer_ops[2] = {
+    [0 ... 1] = {
+        .read = timer_read,
+        .write = timer_write,
+        .impl = {
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
+        .valid = {
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
     },
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4
-    }
+    [0].endianness = DEVICE_LITTLE_ENDIAN,
+    [1].endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void timer_hit(void *opaque)
@@ -220,6 +229,12 @@ static void xilinx_timer_realize(DeviceState *dev, Error **errp)
     XpsTimerState *t = XILINX_TIMER(dev);
     unsigned int i;
 
+    if (t->model_endianness == ENDIAN_MODE_UNSPECIFIED) {
+        error_setg(errp, TYPE_XILINX_TIMER " property 'endianness'"
+                         " must be set to 'big' or 'little'");
+        return;
+    }
+
     /* Init all the ptimers.  */
     t->timers = g_malloc0(sizeof t->timers[0] * num_timers(t));
     for (i = 0; i < num_timers(t); i++) {
@@ -233,8 +248,9 @@ static void xilinx_timer_realize(DeviceState *dev, Error **errp)
         ptimer_transaction_commit(xt->ptimer);
     }
 
-    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t, "xlnx.xps-timer",
-                          R_MAX * 4 * num_timers(t));
+    memory_region_init_io(&t->mmio, OBJECT(t),
+                          &timer_ops[t->model_endianness == ENDIAN_MODE_BIG],
+                          t, "xlnx.xps-timer", R_MAX * 4 * num_timers(t));
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &t->mmio);
 }
 
@@ -247,6 +263,7 @@ static void xilinx_timer_init(Object *obj)
 }
 
 static const Property xilinx_timer_properties[] = {
+    DEFINE_PROP_ENDIAN_NODEFAULT("endianness", XpsTimerState, model_endianness),
     DEFINE_PROP_UINT32("clock-frequency", XpsTimerState, freq_hz, 62 * 1000000),
     DEFINE_PROP_UINT8("one-timer-only", XpsTimerState, one_timer_only, 0),
 };
-- 
2.47.1


