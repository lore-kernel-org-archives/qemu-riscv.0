Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B4DCAC5B0
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 11:32:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v4HQX-0005pQ-8e; Thu, 02 Oct 2025 07:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v4HQR-0005ny-Dh
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 07:24:43 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v4HPz-0005rb-7Q
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 07:24:43 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-71d603b674aso10462157b3.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Oct 2025 04:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1759404243; x=1760009043; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NuMtNn4IEWqu0nSgd/Vpbd+blTbg4EbRmfmu7Dqn8lc=;
 b=JjB6QjZvjvKNgD7Dj0UQK9G3T91BfAHOcm1bdfB2C7vtwEmmZA9X5nE4MyYClF0Tgh
 jo1Dc+3g1VY75qCTIx+TIL8vQtxFc6W4hFeHu81NygTHmhBLXkdj5QBrGNOqSd57Yg9N
 X7UATyJN+iYa1w2fmLxZLWPTdu8LmtXqFdHqTFUQj4bnpEfn/TAP0jP24U1XkddiFE8q
 07vGQ1Ig0CZfKvIQHMsVvGlESjUaI4vAvWvIa/jbpS//B05GRGRuL3g8yv720cGsfbs8
 7+eTgDAuU63bzrod7CkIn2mo6j2JuOZ9GP3LGBVeTnGZAPUfqxamxLTCU5RxykR8Spum
 Ni8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759404243; x=1760009043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NuMtNn4IEWqu0nSgd/Vpbd+blTbg4EbRmfmu7Dqn8lc=;
 b=o+o8y2vVBTwLIBEIHP9A3wQ8Kqg6dYUNvjmrM4tYuBrXVPvm0rubCoicv4s5xH8FEO
 3CfMKkJulCIuVt5vcsfA7OcKurYWY9TwpNkG9WKy4AUjf+BtJPTasab/z0mLI/wsXk8g
 VEPSpV1iMaNaVBQjW96yr/VgRiN3blbLj+z+7xBYz9M3CyAZsE4OP7yar/2Xzlf2er9e
 MEcm1lY2f7+WKr4Hu45UFb2RCclOAFPeR+gkjv/f/GHV5pxC2DTd3IClgV9q/CykKt8a
 ZX+WySPlD3fG3uX02lUePZSUN43lFVHjyQEGT+wlNfAljKy1Ri6k7X2z3ZSQbVSAG6ob
 CdUA==
X-Gm-Message-State: AOJu0YwWNYU2LyEymMWlyg81yfq1k+bPYc9TXCsmrduMuPgLpqa27gqr
 VOawMyyoctxzQKQ7W7sBNTPbHHkEYIxP9jKhl5Ab43kOICA8/ScZJ3KuHqNSjWVYwVE=
X-Gm-Gg: ASbGnctx83+3s9qGpStERqG6uOffcBYenHY6dy+ePAO2KXtrIPUTWABb0NvTTDNq29T
 RRt1cPpNkaaFNNXPu7ouoqdF0o4/eniqGObtdEO0ZuiDeGhd5d7gssmD1HUgMoUO1np0aL3Szga
 SBYZAnj8M168i4Ef+fwUgO4h02cKGTUiwoO1Ik06mwJHMc3kfm9pnm2ropNOVL8dnV7JUCr69PJ
 hRslpayn7Y2ChhQDNgur4PF5/jV/5Mn/zxDIZh1QJT1ttUbs+ZofXHzLEhZKZdBv6WvIn5Js3Ql
 pPkIPMKRMWkwhuxBLY140ovKY2e67E8BFZA4vqmHW59bO1JIAS1b5jA6icyk0gCAkfVxe+OmGuS
 M1q/m4xu2r78oVmPMICSSgweMPtIbhnJHrKgdDMoMvfoQCz4qmqzr9XAXLNCeDi7dqnFEl2kyfd
 46FiKhgHOtyQ==
X-Google-Smtp-Source: AGHT+IFrggn5mb3PMctRl7y8EHsMx+If0Wfhw6KS3IueJxHUN+cwlDwX3NN/+j3w9pXOWiyPLfZLoA==
X-Received: by 2002:a05:690c:9981:b0:76c:9251:1a15 with SMTP id
 00721157ae682-77f6f35d337mr104781837b3.41.1759404243429; 
 Thu, 02 Oct 2025 04:24:03 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 ([2804:7f0:bcc0:b174:a9af:8146:7deb:fbf3])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-77f81c068f6sm7331627b3.5.2025.10.02.04.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 04:24:03 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 09/17] test/qtest: add riscv-trace-test.c
Date: Thu,  2 Oct 2025 08:23:27 -0300
Message-ID: <20251002112335.2374517-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002112335.2374517-1-dbarboza@ventanamicro.com>
References: <20251002112335.2374517-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Add a simple smoke test for the trace encoder/trace ram sink integration
with the RISC-V 'virt' machine.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c                |   2 +-
 tests/qtest/meson.build        |   2 +-
 tests/qtest/riscv-trace-test.c | 120 +++++++++++++++++++++++++++++++++
 3 files changed, 122 insertions(+), 2 deletions(-)
 create mode 100644 tests/qtest/riscv-trace-test.c

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 7ab407d782..b701e1dcc6 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1711,7 +1711,7 @@ static void virt_machine_init(MachineState *machine)
                                 hart_count, &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_fatal);
 
-        if (tcg_enabled()) {
+        if (tcg_enabled()  || qtest_enabled()) {
             virt_init_socket_trace_hw(s, i);
         }
 
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 669d07c06b..07663c4836 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -281,7 +281,7 @@ qtests_s390x = \
 qtests_riscv32 = \
   (config_all_devices.has_key('CONFIG_SIFIVE_E_AON') ? ['sifive-e-aon-watchdog-test'] : [])
 
-qtests_riscv64 = ['riscv-csr-test'] + \
+qtests_riscv64 = ['riscv-csr-test', 'riscv-trace-test'] + \
   (unpack_edk2_blobs ? ['bios-tables-test'] : [])
 
 qos_test_ss = ss.source_set()
diff --git a/tests/qtest/riscv-trace-test.c b/tests/qtest/riscv-trace-test.c
new file mode 100644
index 0000000000..e442f69286
--- /dev/null
+++ b/tests/qtest/riscv-trace-test.c
@@ -0,0 +1,120 @@
+/*
+ * Testcase for RISC-V Trace framework
+ *
+ * Copyright (C) 2025 Ventana Micro Systems Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+
+#include "qemu/timer.h"
+#include "qemu/bitops.h"
+#include "libqtest.h"
+#include "hw/registerfields.h"
+
+/* taken from virt machine memmap */
+#define TE_BASE   0x3020000
+#define TRAM_BASE 0x6000000
+
+REG32(TR_TE_CONTROL, 0x0)
+    FIELD(TR_TE_CONTROL, ACTIVE, 0, 1)
+    FIELD(TR_TE_CONTROL, ENABLE, 1, 1)
+    FIELD(TR_TE_CONTROL, INST_TRACING, 2, 1)
+
+REG32(TR_RAM_START_LOW, 0x010)
+    FIELD(TR_RAM_START_LOW, ADDR, 0, 32)
+REG32(TR_RAM_START_HIGH, 0x014)
+    FIELD(TR_RAM_START_HIGH, ADDR, 0, 32)
+
+REG32(TR_RAM_LIMIT_LOW, 0x018)
+    FIELD(TR_RAM_LIMIT_LOW, ADDR, 0, 32)
+REG32(TR_RAM_LIMIT_HIGH, 0x01C)
+    FIELD(TR_RAM_LIMIT_HIGH, ADDR, 0, 32)
+
+REG32(TR_RAM_WP_LOW, 0x020)
+    FIELD(TR_RAM_WP_LOW, WRAP, 0, 1)
+    FIELD(TR_RAM_WP_LOW, ADDR, 0, 32)
+REG32(TR_RAM_WP_HIGH, 0x024)
+    FIELD(TR_RAM_WP_HIGH, ADDR, 0, 32)
+
+static uint32_t test_read_te_control(QTestState *qts)
+{
+    return qtest_readl(qts, TE_BASE + A_TR_TE_CONTROL);
+}
+
+static void test_write_te_control(QTestState *qts, uint32_t val)
+{
+    qtest_writel(qts, TE_BASE + A_TR_TE_CONTROL, val);
+}
+
+static uint64_t test_read_tram_ramstart(QTestState *qts)
+{
+    uint64_t reg = qtest_readl(qts, TRAM_BASE + A_TR_RAM_START_HIGH);
+
+    reg <<= 32;
+    reg += qtest_readl(qts, TRAM_BASE + A_TR_RAM_START_LOW);
+    return reg;
+}
+
+static uint64_t test_read_tram_writep(QTestState *qts)
+{
+    uint64_t reg = qtest_readl(qts, TRAM_BASE + A_TR_RAM_WP_HIGH);
+
+    reg <<= 32;
+    reg += qtest_readl(qts, TRAM_BASE + A_TR_RAM_WP_LOW);
+    return reg;
+}
+
+static void test_trace_simple(void)
+{
+    QTestState *qts = qtest_init("-machine virt -accel tcg");
+    double timeout_sec = 0.5;
+    uint64_t reg_tram_start, reg_tram_writep;
+    uint32_t reg;
+
+    reg = test_read_te_control(qts);
+    reg = FIELD_DP32(reg, TR_TE_CONTROL, ACTIVE, 1);
+    test_write_te_control(qts, reg);
+    reg = test_read_te_control(qts);
+    g_assert(1 == FIELD_EX32(reg, TR_TE_CONTROL, ACTIVE));
+
+    reg = FIELD_DP32(reg, TR_TE_CONTROL, ENABLE, 1);
+    test_write_te_control(qts, reg);
+    reg = test_read_te_control(qts);
+    g_assert(1 == FIELD_EX32(reg, TR_TE_CONTROL, ENABLE));
+
+    /*
+     * Verify if RAM Sink write pointer is equal to
+     * ramstart before start tracing.
+     */
+    reg_tram_start = test_read_tram_ramstart(qts);
+    g_assert(reg_tram_start > 0);
+    reg_tram_writep = test_read_tram_writep(qts);
+    g_assert(reg_tram_writep == reg_tram_start);
+
+    reg = FIELD_DP32(reg, TR_TE_CONTROL, INST_TRACING, 1);
+    test_write_te_control(qts, reg);
+    reg = test_read_te_control(qts);
+    g_assert(1 == FIELD_EX32(reg, TR_TE_CONTROL, INST_TRACING));
+
+    g_test_timer_start();
+    for (;;) {
+        reg_tram_writep = test_read_tram_writep(qts);
+        if (reg_tram_writep > reg_tram_start) {
+            break;
+        }
+
+        g_assert(g_test_timer_elapsed() <= timeout_sec);
+    }
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char *argv[])
+{
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/riscv-trace-test/test-trace-simple",
+                   test_trace_simple);
+    return g_test_run();
+}
-- 
2.51.0


