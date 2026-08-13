Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D64C5CFEB
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 13:38:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuVcj-0005rW-IS; Thu, 13 Aug 2026 09:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rao232328@gmail.com>)
 id 1wuVch-0005qm-Op
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 09:37:31 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rao232328@gmail.com>)
 id 1wuVcf-0005WA-Gw
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 09:37:31 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-84faf87d19dso832110b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 06:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786628248; x=1787233048; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pkgNS/wFPS/nmbz6lf4/O2cmnILygdjZpZuFH7CC0uQ=;
 b=sAzZ7Th+hGN997cHFJGMuyvVwIVlP4zzVX/mZ8gET/PtdlvLc86hbkDJW0/Zi+PL2/
 g7NZLvKA51nqFDIDbBPhlRZxBJYu2/2wbc40kqb6HPCY1XGeAloty+XHG7dWe00WcKbI
 WQ55Swwj2g4Mq9071GNehsjO07WgG0vqHOwmCGfz7J1Evs8fLq3Qut31salpd75IBu+Z
 HGNqD8YETlx7LbwEF+LB5GMyS/JybPoRZGOcec4sDmjPFVtRpIPUOLoBze8FTruhKuVS
 TEXeUIEyqvo9611nEcbz2fRL+nwaVvD8bboLZ/DxEchETDFlbEjTct14QRnouXhSWXs6
 HDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786628248; x=1787233048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pkgNS/wFPS/nmbz6lf4/O2cmnILygdjZpZuFH7CC0uQ=;
 b=NoQEdQlgBo4GGuSdwBTRyL0bbGGZxKijN5skAiwr1aCwA0Zxxn2PRY4uY2hiqOFM35
 2H+m1o2OYqF4WcKbxBiG6OaXczx5d7aDv7bjnhjdafa9Ybl/BQHnEJ720DY62uxPhgDZ
 FUR+MKTbHN53CM/1+yV2bQprKtQMmJ4DY8Fv1Rc8Wz5A4T/M4NRw+++09kgrRkTkuQe9
 HlFlZH3h8n6TxoWv5RRWqJsqLYk4O4BgGPSeObT+He17SfqyK3BJgOteLjYTHoJLSTUV
 3YMZmrsfIXeMB+M1BVnZQVhOq01fF6uobNYBzU5gmFZh0NZor6WW9Ex7FeEEK2hmfoLG
 3fIw==
X-Gm-Message-State: AOJu0YwSPaeRXUpdToifKX+ZnHUkwiJLFci7z7xvDUkCzOg/5pDkCjsR
 fRgIyt2jnbw5wRf8+gY3jGbNx7QDm1AEXFzknkQjUUQpnYEG/XmR7O8d
X-Gm-Gg: AR+sD13mkchCvCUkp8lPjHd/F0zv6wMsyf1LVK5RswneWM01tC43Nr0RyYiHJohBB88
 9tjUe8tfNWPRS86p4J9hmetumUr8MevGMi4pfCn/p01HQKmb8/rRJWu3vt3gvR5CpWoehY5BEtL
 dbD2cIEOmC+AlQuIR0tvHXM8K2Ln9O3yQjX0zlXIPmBdBH0nPnLcANuCdT4wG+DFS5gV8Kn3UN9
 gCL0t4gIyDYn+RnC+xMOFK9m8iF74PdS4KjkhpxVkoe1O4SMKYv15MQm9o9aaVP+N0Qh9GS/xrI
 YIuo/sjitWTRXI9qugIMzjVyMtqZX8ZL0CJFgR0OJYVTxq214J61r3FTq9xv8IVrGD6tkaCFfOq
 0CLAS3sMyeVGav2kZBHsbePTpuu2e8rRKeDkGt/7pieY79LZvZK/4qn7GNnnMTnCSpi9KQfTuWm
 BwSP/hMgIsrGnla17u/qzvOK52VQuBSMWrihmKIKoRfUMsZzC6
X-Received: by 2002:a05:6a00:4c9b:b0:848:2f2c:b2c8 with SMTP id
 d2e1a72fcca58-84fc6e5b2f9mr6540515b3a.24.1786628247907; 
 Thu, 13 Aug 2026 06:37:27 -0700 (PDT)
Received: from DESKTOP-DFGP8OG ([2409:8a55:ad2:6951::258])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef6849625sm1078901a12.1.2026.08.13.06.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 06:37:27 -0700 (PDT)
From: raoyi <rao232328@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 bmeng.cn@gmail.com, philmd@oss.qualcomm.com, pbonzini@redhat.com,
 lvivier@redhat.com, farosas@suse.de, caojunze424@gmail.com,
 raoyi <rao232328@gmail.com>
Subject: [PATCH v4 3/3] tests/qtest: add k230 dwapb timer test
Date: Thu, 13 Aug 2026 21:36:43 +0800
Message-ID: <20260813133643.20380-4-rao232328@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813133643.20380-1-rao232328@gmail.com>
References: <20260813133643.20380-1-rao232328@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=rao232328@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Add qtest coverage for K230 DW APB timer including
free-running, periodic, interrupt mask, disable
behavior, current value, dynamic reload, and
multi-channel scenarios.

Add timer test file to MAINTAINERS.

Signed-off-by: raoyi <rao232328@gmail.com>
---
 MAINTAINERS                         |   1 +
 tests/qtest/k230-dwapb-timer-test.c | 274 ++++++++++++++++++++++++++++
 tests/qtest/meson.build             |   4 +-
 3 files changed, 278 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/k230-dwapb-timer-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cf689433ff..82e5643a93 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1830,6 +1830,7 @@ F: hw/timer/dw-apb-timer.c
 F: include/hw/riscv/k230.h
 F: include/hw/watchdog/k230_wdt.h
 F: include/hw/timer/dw-apb-timer.h
+F: tests/qtest/k230-dwapb-timer-test.c
 F: tests/qtest/k230-wdt-test.c
 
 RX Machines
diff --git a/tests/qtest/k230-dwapb-timer-test.c b/tests/qtest/k230-dwapb-timer-test.c
new file mode 100644
index 0000000000..a74f36999e
--- /dev/null
+++ b/tests/qtest/k230-dwapb-timer-test.c
@@ -0,0 +1,274 @@
+/*
+ * QTest testcase for the DesignWare APB timer through the K230 machine
+ *
+ * Copyright (c) 2026 raoyi <rao232328@gmail.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "qemu/timer.h"
+#include "libqtest.h"
+
+#define TIMER_BASE 0x91105800
+#define K230_TIMER_NUM_CHANNELS 6
+#define K230_TIMER_DEFAULT_FREQ 6250000
+
+#define DW_APB_TIMER_STRIDE       0x14
+#define DW_APB_TIMER_N_LOAD_COUNT     0x00
+#define DW_APB_TIMER_N_CURRENT_VALUE  0x04
+#define DW_APB_TIMER_N_CONTROL        0x08
+#define DW_APB_TIMER_N_EOI            0x0c
+#define DW_APB_TIMER_N_INT_STATUS     0x10
+#define DW_APB_TIMER_INT_STATUS        0xa0
+#define DW_APB_TIMER_EOI               0xa4
+#define DW_APB_TIMER_RAW_INT_STATUS    0xa8
+#define DW_APB_TIMER_CONTROL_ENABLE        BIT(0)
+#define DW_APB_TIMER_CONTROL_MODE_PERIODIC BIT(1)
+#define DW_APB_TIMER_CONTROL_INT           BIT(2)
+
+#define TIMER_REG(n, reg) (TIMER_BASE + (n) * DW_APB_TIMER_STRIDE + (reg))
+#define TIMER_TICK_NS (NANOSECONDS_PER_SECOND / K230_TIMER_DEFAULT_FREQ)
+
+static void timer_load(QTestState *qts, int n, uint32_t value)
+{
+    qtest_writel(qts, TIMER_REG(n, DW_APB_TIMER_N_LOAD_COUNT), value);
+}
+
+static void timer_enable(QTestState *qts, int n, uint32_t ctrl)
+{
+    qtest_writel(qts, TIMER_REG(n, DW_APB_TIMER_N_CONTROL), ctrl);
+}
+
+static void timer_disable(QTestState *qts, int n)
+{
+    qtest_writel(qts, TIMER_REG(n, DW_APB_TIMER_N_CONTROL), 0);
+}
+
+static uint32_t timer_get_and_clear_status(QTestState *qts, int n)
+{
+    uint32_t int_status = qtest_readl(qts,
+                            TIMER_REG(n, DW_APB_TIMER_N_INT_STATUS));
+
+    if (int_status) {
+        qtest_readl(qts, TIMER_REG(n, DW_APB_TIMER_N_EOI));
+    }
+
+    return int_status;
+}
+
+static void test_timer_free_running(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+
+    timer_load(qts, 0, 100);
+    timer_enable(qts, 0, DW_APB_TIMER_CONTROL_ENABLE);
+
+    qtest_clock_step(qts, 101ULL * TIMER_TICK_NS + 1);
+    g_assert_cmphex(timer_get_and_clear_status(qts, 0), ==, 1);
+
+    qtest_clock_step(qts, 10ULL * TIMER_TICK_NS);
+    uint32_t cur = qtest_readl(qts,
+                      TIMER_REG(0, DW_APB_TIMER_N_CURRENT_VALUE));
+    g_assert_cmphex(cur, <, UINT32_MAX);
+    g_assert_cmphex(cur, >, 0);
+
+    g_assert_cmphex(qtest_readl(qts,
+                      TIMER_REG(0, DW_APB_TIMER_N_INT_STATUS)), ==, 0);
+
+    qtest_quit(qts);
+}
+
+static void test_timer_periodic(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+    int i;
+
+    timer_load(qts, 0, 100);
+    timer_enable(qts, 0, DW_APB_TIMER_CONTROL_ENABLE |
+                        DW_APB_TIMER_CONTROL_MODE_PERIODIC);
+
+    for (i = 0; i < 3; i++) {
+        qtest_clock_step(qts, 101ULL * TIMER_TICK_NS + 1);
+        g_assert_cmphex(timer_get_and_clear_status(qts, 0), ==, 1);
+        uint32_t cur = qtest_readl(qts,
+                          TIMER_REG(0, DW_APB_TIMER_N_CURRENT_VALUE));
+        g_assert_cmphex(cur, <=, 100);
+    }
+
+    qtest_quit(qts);
+}
+
+static void test_timer_int_mask(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+
+    timer_load(qts, 0, 100);
+    timer_enable(qts, 0, DW_APB_TIMER_CONTROL_ENABLE |
+                        DW_APB_TIMER_CONTROL_MODE_PERIODIC |
+                        DW_APB_TIMER_CONTROL_INT);
+
+    qtest_clock_step(qts, 101ULL * TIMER_TICK_NS + 1);
+
+    g_assert_cmphex(qtest_readl(qts,
+                      TIMER_REG(0, DW_APB_TIMER_N_INT_STATUS)) & 1, ==, 0);
+    g_assert_cmphex(qtest_readl(qts,
+                      TIMER_BASE + DW_APB_TIMER_INT_STATUS), ==, 0);
+    g_assert_cmphex(qtest_readl(qts,
+                      TIMER_BASE + DW_APB_TIMER_RAW_INT_STATUS) & 1, ==, 1);
+
+    /* Unmasking a pending interrupt must assert it immediately. */
+    timer_enable(qts, 0, DW_APB_TIMER_CONTROL_ENABLE |
+                        DW_APB_TIMER_CONTROL_MODE_PERIODIC);
+    g_assert_cmphex(qtest_readl(qts,
+                      TIMER_REG(0, DW_APB_TIMER_N_INT_STATUS)), ==, 1);
+    g_assert_cmphex(qtest_readl(qts,
+                      TIMER_BASE + DW_APB_TIMER_INT_STATUS) & 1, ==, 1);
+
+    qtest_quit(qts);
+}
+
+static void test_timer_disable_clears_irq(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+
+    timer_load(qts, 0, 100);
+    timer_enable(qts, 0, DW_APB_TIMER_CONTROL_ENABLE |
+                        DW_APB_TIMER_CONTROL_MODE_PERIODIC);
+
+    qtest_clock_step(qts, 101ULL * TIMER_TICK_NS + 1);
+    g_assert_cmphex(qtest_readl(qts,
+                      TIMER_REG(0, DW_APB_TIMER_N_INT_STATUS)) & 1, ==, 1);
+
+    timer_disable(qts, 0);
+    g_assert_cmphex(qtest_readl(qts,
+                      TIMER_REG(0, DW_APB_TIMER_N_INT_STATUS)) & 1, ==, 0);
+
+    qtest_quit(qts);
+}
+
+static void test_timer_current_disabled(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+
+    /* TRM: "A '0' is always read back when the timer is not enabled" */
+    g_assert_cmphex(qtest_readl(qts,
+                      TIMER_REG(0, DW_APB_TIMER_N_CURRENT_VALUE)), ==, 0);
+
+    timer_load(qts, 0, 9999);
+    g_assert_cmphex(qtest_readl(qts,
+                      TIMER_REG(0, DW_APB_TIMER_N_CURRENT_VALUE)), ==, 0);
+
+    timer_enable(qts, 0, DW_APB_TIMER_CONTROL_ENABLE);
+    qtest_clock_step(qts, 10ULL * TIMER_TICK_NS);
+    uint32_t cur_enabled = qtest_readl(qts,
+                              TIMER_REG(0, DW_APB_TIMER_N_CURRENT_VALUE));
+    g_assert_cmphex(cur_enabled, >, 0);
+    g_assert_cmphex(cur_enabled, <, UINT32_MAX);
+
+    timer_disable(qts, 0);
+    g_assert_cmphex(qtest_readl(qts,
+                      TIMER_REG(0, DW_APB_TIMER_N_CURRENT_VALUE)), ==, 0);
+
+    qtest_quit(qts);
+}
+
+static void test_timer_dynamic_reload(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+    uint32_t cur;
+
+    timer_load(qts, 0, 1000);
+    timer_enable(qts, 0, DW_APB_TIMER_CONTROL_ENABLE |
+                        DW_APB_TIMER_CONTROL_MODE_PERIODIC);
+
+    qtest_clock_step(qts, 100ULL * TIMER_TICK_NS);
+
+    timer_load(qts, 0, 200);
+
+    qtest_clock_step(qts, 901ULL * TIMER_TICK_NS + 1);
+    g_assert_cmphex(timer_get_and_clear_status(qts, 0), ==, 1);
+
+    qtest_clock_step(qts, 100ULL * TIMER_TICK_NS);
+    cur = qtest_readl(qts, TIMER_REG(0, DW_APB_TIMER_N_CURRENT_VALUE));
+    g_assert_cmphex(cur, ==, 99);
+
+    qtest_quit(qts);
+}
+
+static void test_timer_all_channels(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+    int i;
+
+    for (i = 0; i < K230_TIMER_NUM_CHANNELS; i++) {
+        timer_load(qts, i, 100 + i * 50);
+        timer_enable(qts, i, DW_APB_TIMER_CONTROL_ENABLE |
+                             DW_APB_TIMER_CONTROL_MODE_PERIODIC);
+    }
+
+    /* Step past timer 0 expiry (load=100) - only timer 0 should fire */
+    qtest_clock_step(qts, 101ULL * TIMER_TICK_NS + 1);
+    uint32_t sts = qtest_readl(qts, TIMER_BASE + DW_APB_TIMER_INT_STATUS);
+    g_assert_cmphex(sts & 1, ==, 1);
+    g_assert_cmphex(sts & 0x3e, ==, 0);
+
+    /* Step to timer 1 expiry (another 50 ticks) */
+    qtest_clock_step(qts, 50ULL * TIMER_TICK_NS + 1);
+    sts = qtest_readl(qts, TIMER_BASE + DW_APB_TIMER_INT_STATUS);
+    g_assert_cmphex(sts & 0x3, ==, 0x3);
+    g_assert_cmphex(sts & 0x3c, ==, 0);
+
+    /* Step to expiry of all remaining timers (another 200 ticks) */
+    qtest_clock_step(qts, 200ULL * TIMER_TICK_NS + 1);
+    sts = qtest_readl(qts, TIMER_BASE + DW_APB_TIMER_INT_STATUS);
+    g_assert_cmphex(sts, ==, 0x3f);
+
+    /* EOI_ALL clears all */
+    qtest_readl(qts, TIMER_BASE + DW_APB_TIMER_EOI);
+    sts = qtest_readl(qts, TIMER_BASE + DW_APB_TIMER_INT_STATUS);
+    g_assert_cmphex(sts, ==, 0);
+
+    qtest_quit(qts);
+}
+
+static void test_timer_reset(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+
+    timer_load(qts, 0, 100);
+    timer_enable(qts, 0, DW_APB_TIMER_CONTROL_ENABLE |
+                        DW_APB_TIMER_CONTROL_MODE_PERIODIC);
+    qtest_clock_step(qts, 10ULL * TIMER_TICK_NS);
+
+    qtest_system_reset(qts);
+
+    g_assert_cmphex(qtest_readl(qts,
+                      TIMER_REG(0, DW_APB_TIMER_N_LOAD_COUNT)), ==, 0);
+    g_assert_cmphex(qtest_readl(qts,
+                      TIMER_REG(0, DW_APB_TIMER_N_CONTROL)), ==, 0);
+    g_assert_cmphex(qtest_readl(qts,
+                      TIMER_REG(0, DW_APB_TIMER_N_CURRENT_VALUE)), ==, 0);
+    g_assert_cmphex(qtest_readl(qts,
+                      TIMER_BASE + DW_APB_TIMER_RAW_INT_STATUS), ==, 0);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char *argv[])
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/dw-apb-timer/free_running", test_timer_free_running);
+    qtest_add_func("/dw-apb-timer/periodic", test_timer_periodic);
+    qtest_add_func("/dw-apb-timer/int_mask", test_timer_int_mask);
+    qtest_add_func("/dw-apb-timer/disable_clears_irq",
+                   test_timer_disable_clears_irq);
+    qtest_add_func("/dw-apb-timer/current_disabled",
+                   test_timer_current_disabled);
+    qtest_add_func("/dw-apb-timer/dynamic_reload",
+                   test_timer_dynamic_reload);
+    qtest_add_func("/dw-apb-timer/all_channels", test_timer_all_channels);
+    qtest_add_func("/dw-apb-timer/reset", test_timer_reset);
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 56ff860e21..295a724116 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -297,7 +297,9 @@ qtests_riscv64 = ['riscv-csr-test'] + \
   (config_all_devices.has_key('CONFIG_IOMMU_TESTDEV') and
    config_all_devices.has_key('CONFIG_RISCV_IOMMU') ?
    ['iommu-riscv-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test'] : [])
+  (config_all_devices.has_key('CONFIG_K230') and
+   config_all_devices.has_key('CONFIG_DW_APB_TIMER') ?
+   ['k230-wdt-test', 'k230-dwapb-timer-test'] : [])
 
 qtests_hexagon = ['boot-serial-test']
 
-- 
2.53.0


