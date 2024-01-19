Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2279FC47DB7
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:42:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQn9a-0001NJ-FW; Fri, 19 Jan 2024 06:35:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9Z-0001MY-59
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:35:17 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9X-0007QW-1T
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:35:16 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e880121efso6970315e9.3
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664113; x=1706268913; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0OM46pXL9nPMgsbRdva1NHrfhMdj+GFjvayF2pJiPE=;
 b=YUeCbigqUdzKZto7onfovqzSLSTvYz9uIlTIuruzRZdSr+/STPbOcK54FjSCkDJBMa
 4CercISKYID1MGpBLDaU92VSI6vOhD2oojCrh00q8ThBx6bsEW4434X1j6q8R4byaRtW
 3F6axbiVyXJsYpJhiruthqaXrsjd2BhwAnJZuHRhRvOgDtCVPjpxn3MSRLO2IUC18mkI
 GzGijM0QWo9vw1AtnH4miA3T8XKaqgVtS0lMC/8umKXdhtOXqHk3bPU9fbtBDADsgd6J
 U7TebedMkWcj2wFxp4kPISKI9vw8hHp3ADn2iP3/yHkbSHdFqbKTvYsrMVxhkzRBeRLs
 74wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664113; x=1706268913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q0OM46pXL9nPMgsbRdva1NHrfhMdj+GFjvayF2pJiPE=;
 b=AJhv0LlSSV5rB1TbhAs1iI6r23vN7qnlCziB74XVO4SCC623dPcT9Lp4xQGn/JKivY
 HnXIpfVL17W8hqtwcbWicWqIpwDzpBAoDOoMAi0xPqgZYwHK63u64YHFBktIiCtC0UU6
 b19PQJKj6/bjGM5Ui61UGHdt2mWHe19nVvVx+yYIStAepoo7f3xBI3IotMtZ0FZ4w41X
 nf+9hrpigqGgpu88Zi0toZit+PLord/2T3iSbxAEBIa0fcAnr+rkB676nXfHuqbHTvQH
 cOjDcVQJgENokLZiugDp6COeuSNKZpah/2Hq1KLfAhASalymaqGLecNyUu9kuAyuYayO
 ofTw==
X-Gm-Message-State: AOJu0Yw4HWYmVOiWJOkCt0trFMNTMn5A79Jk0QzjoxdvRB2UtaUhvy2X
 KtZQ9xVhn7EJTil4M7kyHzjXjRcdJgrCDiEnoSkTC0rEJzxFSz7Rt9tHUv0nTPg=
X-Google-Smtp-Source: AGHT+IHcp9HBLDTn6h3fPsq2H9ERjVHhKnanwC40cLXPtK2H4kuPyHzfMc25JUb5AKyPtgVlVQJ2UA==
X-Received: by 2002:a05:600c:3110:b0:40e:5cf9:d5cf with SMTP id
 g16-20020a05600c311000b0040e5cf9d5cfmr1352683wmo.124.1705664113537; 
 Fri, 19 Jan 2024 03:35:13 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 q8-20020a7bce88000000b0040c11fbe581sm28301424wmj.27.2024.01.19.03.35.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:35:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Daniel Hoffman <dhoff749@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 01/36] hw/timer/hpet: Convert DPRINTF to trace events
Date: Fri, 19 Jan 2024 12:34:30 +0100
Message-ID: <20240119113507.31951-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

From: Daniel Hoffman <dhoff749@gmail.com>

This conversion is pretty straight-forward. Standardized some formatting
so the +0 and +4 offset cases can recycle the same message.

Signed-off-by: Daniel Hoffman <dhoff749@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231118231129.2840388-1-dhoff749@gmail.com>
[PMD: Fixed few string formats]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/hpet.c       | 55 +++++++++++++++++--------------------------
 hw/timer/trace-events | 15 ++++++++++++
 2 files changed, 37 insertions(+), 33 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index f2f1580f81..1672faa4f2 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -39,13 +39,7 @@
 #include "hw/timer/i8254.h"
 #include "exec/address-spaces.h"
 #include "qom/object.h"
-
-//#define HPET_DEBUG
-#ifdef HPET_DEBUG
-#define DPRINTF printf
-#else
-#define DPRINTF(...)
-#endif
+#include "trace.h"
 
 #define HPET_MSI_SUPPORT        0
 
@@ -431,7 +425,7 @@ static uint64_t hpet_ram_read(void *opaque, hwaddr addr,
     HPETState *s = opaque;
     uint64_t cur_tick, index;
 
-    DPRINTF("qemu: Enter hpet_ram_readl at %" PRIx64 "\n", addr);
+    trace_hpet_ram_read(addr);
     index = addr;
     /*address range of all TN regs*/
     if (index >= 0x100 && index <= 0x3ff) {
@@ -439,7 +433,7 @@ static uint64_t hpet_ram_read(void *opaque, hwaddr addr,
         HPETTimer *timer = &s->timer[timer_id];
 
         if (timer_id > s->num_timers) {
-            DPRINTF("qemu: timer id out of range\n");
+            trace_hpet_timer_id_out_of_range(timer_id);
             return 0;
         }
 
@@ -457,7 +451,7 @@ static uint64_t hpet_ram_read(void *opaque, hwaddr addr,
         case HPET_TN_ROUTE + 4:
             return timer->fsb >> 32;
         default:
-            DPRINTF("qemu: invalid hpet_ram_readl\n");
+            trace_hpet_ram_read_invalid();
             break;
         }
     } else {
@@ -469,7 +463,7 @@ static uint64_t hpet_ram_read(void *opaque, hwaddr addr,
         case HPET_CFG:
             return s->config;
         case HPET_CFG + 4:
-            DPRINTF("qemu: invalid HPET_CFG + 4 hpet_ram_readl\n");
+            trace_hpet_invalid_hpet_cfg(4);
             return 0;
         case HPET_COUNTER:
             if (hpet_enabled(s)) {
@@ -477,7 +471,7 @@ static uint64_t hpet_ram_read(void *opaque, hwaddr addr,
             } else {
                 cur_tick = s->hpet_counter;
             }
-            DPRINTF("qemu: reading counter  = %" PRIx64 "\n", cur_tick);
+            trace_hpet_ram_read_reading_counter(0, cur_tick);
             return cur_tick;
         case HPET_COUNTER + 4:
             if (hpet_enabled(s)) {
@@ -485,12 +479,12 @@ static uint64_t hpet_ram_read(void *opaque, hwaddr addr,
             } else {
                 cur_tick = s->hpet_counter;
             }
-            DPRINTF("qemu: reading counter + 4  = %" PRIx64 "\n", cur_tick);
+            trace_hpet_ram_read_reading_counter(4, cur_tick);
             return cur_tick >> 32;
         case HPET_STATUS:
             return s->isr;
         default:
-            DPRINTF("qemu: invalid hpet_ram_readl\n");
+            trace_hpet_ram_read_invalid();
             break;
         }
     }
@@ -504,8 +498,7 @@ static void hpet_ram_write(void *opaque, hwaddr addr,
     HPETState *s = opaque;
     uint64_t old_val, new_val, val, index;
 
-    DPRINTF("qemu: Enter hpet_ram_writel at %" PRIx64 " = 0x%" PRIx64 "\n",
-            addr, value);
+    trace_hpet_ram_write(addr, value);
     index = addr;
     old_val = hpet_ram_read(opaque, addr, 4);
     new_val = value;
@@ -515,14 +508,14 @@ static void hpet_ram_write(void *opaque, hwaddr addr,
         uint8_t timer_id = (addr - 0x100) / 0x20;
         HPETTimer *timer = &s->timer[timer_id];
 
-        DPRINTF("qemu: hpet_ram_writel timer_id = 0x%x\n", timer_id);
+        trace_hpet_ram_write_timer_id(timer_id);
         if (timer_id > s->num_timers) {
-            DPRINTF("qemu: timer id out of range\n");
+            trace_hpet_timer_id_out_of_range(timer_id);
             return;
         }
         switch ((addr - 0x100) % 0x20) {
         case HPET_TN_CFG:
-            DPRINTF("qemu: hpet_ram_writel HPET_TN_CFG\n");
+            trace_hpet_ram_write_tn_cfg();
             if (activating_bit(old_val, new_val, HPET_TN_FSB_ENABLE)) {
                 update_irq(timer, 0);
             }
@@ -540,10 +533,10 @@ static void hpet_ram_write(void *opaque, hwaddr addr,
             }
             break;
         case HPET_TN_CFG + 4: // Interrupt capabilities
-            DPRINTF("qemu: invalid HPET_TN_CFG+4 write\n");
+            trace_hpet_ram_write_invalid_tn_cfg(4);
             break;
         case HPET_TN_CMP: // comparator register
-            DPRINTF("qemu: hpet_ram_writel HPET_TN_CMP\n");
+            trace_hpet_ram_write_tn_cmp(0);
             if (timer->config & HPET_TN_32BIT) {
                 new_val = (uint32_t)new_val;
             }
@@ -566,7 +559,7 @@ static void hpet_ram_write(void *opaque, hwaddr addr,
             }
             break;
         case HPET_TN_CMP + 4: // comparator register high order
-            DPRINTF("qemu: hpet_ram_writel HPET_TN_CMP + 4\n");
+            trace_hpet_ram_write_tn_cmp(4);
             if (!timer_is_periodic(timer)
                 || (timer->config & HPET_TN_SETVAL)) {
                 timer->cmp = (timer->cmp & 0xffffffffULL) | new_val << 32;
@@ -591,7 +584,7 @@ static void hpet_ram_write(void *opaque, hwaddr addr,
             timer->fsb = (new_val << 32) | (timer->fsb & 0xffffffff);
             break;
         default:
-            DPRINTF("qemu: invalid hpet_ram_writel\n");
+            trace_hpet_ram_write_invalid();
             break;
         }
         return;
@@ -631,7 +624,7 @@ static void hpet_ram_write(void *opaque, hwaddr addr,
             }
             break;
         case HPET_CFG + 4:
-            DPRINTF("qemu: invalid HPET_CFG+4 write\n");
+            trace_hpet_invalid_hpet_cfg(4);
             break;
         case HPET_STATUS:
             val = new_val & s->isr;
@@ -643,24 +636,20 @@ static void hpet_ram_write(void *opaque, hwaddr addr,
             break;
         case HPET_COUNTER:
             if (hpet_enabled(s)) {
-                DPRINTF("qemu: Writing counter while HPET enabled!\n");
+                trace_hpet_ram_write_counter_write_while_enabled();
             }
             s->hpet_counter =
                 (s->hpet_counter & 0xffffffff00000000ULL) | value;
-            DPRINTF("qemu: HPET counter written. ctr = 0x%" PRIx64 " -> "
-                    "%" PRIx64 "\n", value, s->hpet_counter);
+            trace_hpet_ram_write_counter_written(0, value, s->hpet_counter);
             break;
         case HPET_COUNTER + 4:
-            if (hpet_enabled(s)) {
-                DPRINTF("qemu: Writing counter while HPET enabled!\n");
-            }
+            trace_hpet_ram_write_counter_write_while_enabled();
             s->hpet_counter =
                 (s->hpet_counter & 0xffffffffULL) | (((uint64_t)value) << 32);
-            DPRINTF("qemu: HPET counter + 4 written. ctr = 0x%" PRIx64 " -> "
-                    "%" PRIx64 "\n", value, s->hpet_counter);
+            trace_hpet_ram_write_counter_written(4, value, s->hpet_counter);
             break;
         default:
-            DPRINTF("qemu: invalid hpet_ram_writel\n");
+            trace_hpet_ram_write_invalid();
             break;
         }
     }
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 8145e18e3d..de769f4b71 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -99,3 +99,18 @@ sifive_pwm_write(uint64_t data, uint64_t offset) "Write 0x%" PRIx64 " at address
 sh_timer_start_stop(int enable, int current) "%d (%d)"
 sh_timer_read(uint64_t offset) "tmu012_read 0x%" PRIx64
 sh_timer_write(uint64_t offset, uint64_t value) "tmu012_write 0x%" PRIx64 " 0x%08" PRIx64
+
+# hpet.c
+hpet_timer_id_out_of_range(uint8_t timer_id) "timer id out of range: 0x%" PRIx8
+hpet_invalid_hpet_cfg(uint8_t reg_off) "invalid HPET_CFG + %u" PRIx8
+hpet_ram_read(uint64_t addr) "enter hpet_ram_readl at 0x%" PRIx64
+hpet_ram_read_reading_counter(uint8_t reg_off, uint64_t cur_tick) "reading counter + %" PRIu8 " = 0x%" PRIx64
+hpet_ram_read_invalid(void) "invalid hpet_ram_readl"
+hpet_ram_write(uint64_t addr, uint64_t value) "enter hpet_ram_writel at 0x%" PRIx64 " = 0x%" PRIx64
+hpet_ram_write_timer_id(uint64_t timer_id) "hpet_ram_writel timer_id = 0x%" PRIx64
+hpet_ram_write_tn_cfg(void) "hpet_ram_writel HPET_TN_CFG"
+hpet_ram_write_invalid_tn_cfg(uint8_t reg_off) "invalid HPET_TN_CFG + %" PRIu8 " write"
+hpet_ram_write_tn_cmp(uint8_t reg_off) "hpet_ram_writel HPET_TN_CMP + %" PRIu8
+hpet_ram_write_invalid(void) "invalid hpet_ram_writel"
+hpet_ram_write_counter_write_while_enabled(void) "Writing counter while HPET enabled!"
+hpet_ram_write_counter_written(uint8_t reg_off, uint64_t value, uint64_t counter) "HPET counter + %" PRIu8 "written. crt = 0x%" PRIx64 " -> 0x%" PRIx64
-- 
2.41.0


