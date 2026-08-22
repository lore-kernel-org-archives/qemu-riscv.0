Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A191C5DF9C
	for <qemu-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 19:45:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxrdN-000209-3J; Sat, 22 Aug 2026 15:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1wxrdL-0001zU-JC
 for qemu-riscv@nongnu.org; Sat, 22 Aug 2026 15:44:03 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1wxrdJ-0007Aj-OI
 for qemu-riscv@nongnu.org; Sat, 22 Aug 2026 15:44:03 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2ceb096e675so25355795ad.0
 for <qemu-riscv@nongnu.org>; Sat, 22 Aug 2026 12:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787427840; x=1788032640; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8iUTYzqk/yld4kIzHN6VkkIW+lJhL3ZopkBmiNVwt70=;
 b=Ga9S84ypOt1JkfESAarV2jjqKQzsCqpRVJbeJzlBkDEqnE+qt2BDbhknlD8dowwUr/
 j4i0YnEd2dqlLObhWtI9x+DucbagA3fBMAzmPM5GpNSDmK9JzJNQffEhSHaIpg6+Nht7
 W6vzZ0KNLr8Nxp19lptJGUFTkbo8bE+9ZOfoa/Hfn4uyUw3/91Xw0yXob1l0N9YJ+964
 Wt/jqoqx9oqeMgyfuJ8gs/Qoqt6RN+34+hytu0/6o9CYmoP4/rgeXfq8nwJhJqbMADxW
 30VO9nJ9SjM2bLhOdOlEWmStqZePXK+6m06b/aGce8eVTZ091jfPD8uD6DZSd/PEC+8J
 AXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787427840; x=1788032640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8iUTYzqk/yld4kIzHN6VkkIW+lJhL3ZopkBmiNVwt70=;
 b=o2jurIzzjFs8dNIMZq+BcqJF45fYYktdD0yIvfxajxlASTtxXiFVxTtcS/RIbPe47H
 Ti0dQWrDEchsg0G6Uql6pEPDrqk9OH4H6L+bTLLGxVxsvTTfeXW3VwgCAdYVH+ts9lQp
 W8Uoni1dQJjFCjZn+CMDDFUcAS1L88T73g5trqPoQ4GbaAAk5Hq5GDVzKNkGFkFWg8AG
 lr/cRwvnwqsT6Zy3gkIsVczJf0gSXgFsMgdUemtnm12WyYAMYWNQyRONjBbJ9eY93ZDK
 AD72dLr7uFEMYFHh+W5jSnYJVindVjPx0cIfB5qRTVWQAIQez+XeN9H+hCvIHU4yTm3E
 N8xg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp9GVGJffbVm9ahWQmlNVfdFVjaIAaFhMtDZYJe6+gDuleh+uPKraT5algpnGp/c3MtlD4fTnNCSGtP@nongnu.org
X-Gm-Message-State: AFuF++mQ6niuKb0szpTVPMAUM4kNpVZulIgBCyimADW4l5RHnXQkPIQJ
 56nXmobr31GQR7XEQfnn0JniabF1bMHyjiIhu2wNy6+NWx7e0xMhc5iN
X-Gm-Gg: AR+sD10gS0I+UXaBcvQoXzOLw/JjtWgu5knGBftxLycbNHWxFARDNDwyxs2Ke4NT4pg
 JTiDsTjtxSY1XUkkY8fopVCRbcP8CJlyiwLx/SyvZPjl5CEWH0KR58caAZ6woMTsHmTMz6sRa36
 kmBpTEPaT6gsB5JSIcyfaSFQ2kb/yKNAOKS9oXBtcrbG3DmwjtHiaEfBfZQhyocrrhxYqWUbxPF
 vUsbIFXLPi4c3pcb9+MyCdVCzHCFC3YkRMHvXVkRUuvv4tGHn5paUjkCmGL4Fzta1cgFVXwIZsg
 irQpnDbwWgMWXZF3nFthQn3DJhdS7A/uGxTlm8pSLcPTniAMgu4nCMfunzJgDh4awV3eWWpVEBT
 m/g9O5fn/JUg0sExvaG3OAJiaQVGiqd/sDpRgLuh3uMOBWoy81GTRXYTNTKpHLUh1II8/SGUQSO
 H4aPiKFde8MTRmjf4uUSRg80uAj2PfLFfrNJDYC54o3setbDY83fuGu9pJ62iB7N+ekqfckHi4J
 vHqhtW2P2GHopWLt6/IvRg4LsLic+wk+4ZsNxs9RfrHk2rO2x+f4ck2YGO17Hxiww==
X-Received: by 2002:a17:902:ceca:b0:2d6:6953:717b with SMTP id
 d9443c01a7336-2d670c81ef4mr121635375ad.10.1787427840251; 
 Sat, 22 Aug 2026 12:44:00 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com
 (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d676895799sm5892715ad.38.2026.08.22.12.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2026 12:43:59 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: pierrick.bouvier@oss.qualcomm.com, almer@dabbelt.com,
 alistair.francis@wdc.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 farosas@suse.de, lvivier@redhat.com
Cc: liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 wxchen0913@gmail.com, jserv@ccns.ncku.edu.tw, marscheng@google.com,
 eleanor15x@gmail.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v4 5/7] tests/qtest: Add qtest for Milk-V Duo board
Date: Sat, 22 Aug 2026 19:43:12 +0000
Message-ID: <20260822194315.2550260-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.766.g2966f0265a-goog
In-Reply-To: <20260822194315.2550260-1-visitorckw@gmail.com>
References: <20260822194315.2550260-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=visitorckw@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Add minimal qtest coverage for the Milk-V Duo machine to validate basic
MMIO mapping and register access.

Currently tested:
- Verify DW8250 UART component version and type signatures.
- Test read/write access to CV1800B clock bypass register.

Tested with:
$ meson test -C build -v qemu:qtest-riscv64/milkv-duo-test
[...]
Ok:                 1
Fail:               0

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS                  |  1 +
 tests/qtest/meson.build      |  3 +-
 tests/qtest/milkv-duo-test.c | 70 ++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/milkv-duo-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index dde85ef420..245eb7bb58 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1861,6 +1861,7 @@ F: hw/riscv/milkv_duo.c
 F: include/hw/char/dw8250.h
 F: include/hw/misc/cv1800b_clk.h
 F: include/hw/riscv/cv1800b.h
+F: tests/qtest/milkv-duo-test.c
 
 RX Machines
 -----------
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 12ed368997..d02dbf7433 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -299,7 +299,8 @@ qtests_riscv64 = ['riscv-csr-test'] + \
   (config_all_devices.has_key('CONFIG_IOMMU_TESTDEV') and
    config_all_devices.has_key('CONFIG_RISCV_IOMMU') ?
    ['iommu-riscv-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test'] : [])
+  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test'] : []) + \
+   ['milkv-duo-test']
 
 qtests_hexagon = ['boot-serial-test', 'l2vic-test', 'qct-qtimer-test']
 
diff --git a/tests/qtest/milkv-duo-test.c b/tests/qtest/milkv-duo-test.c
new file mode 100644
index 0000000000..06064b8733
--- /dev/null
+++ b/tests/qtest/milkv-duo-test.c
@@ -0,0 +1,70 @@
+/*
+ * QTest for Milk-V Duo Board
+ *
+ * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+
+#define CV1800B_CLK_BASE            0x03002000
+#define CV1800B_CLK_BYPASS          0x030
+#define CV1800B_CLK_BYPASS_RESET    0xFFFFFFFF
+#define TEST_PATTERN_5A             0x5A5A5A5A
+#define TEST_PATTERN_A5             0xA5A5A5A5
+
+#define CV1800B_UART0_BASE          0x04140000
+#define DW_UART_UCV                 0xF8
+#define DW_UART_CTR                 0xFC
+#define DW_UART_VERSION_3_23A       0x3332332A
+#define DW_UART_TYPE_SIGNATURE      0x44570110
+
+static void test_milkv_duo_uart(void)
+{
+    QTestState *qts;
+    uint32_t component_version;
+    uint32_t component_type;
+
+    qts = qtest_init("-M milkv-duo");
+
+    component_version = qtest_readl(qts, CV1800B_UART0_BASE + DW_UART_UCV);
+    g_assert_cmphex(component_version, ==, DW_UART_VERSION_3_23A);
+
+    component_type = qtest_readl(qts, CV1800B_UART0_BASE + DW_UART_CTR);
+    g_assert_cmphex(component_type, ==, DW_UART_TYPE_SIGNATURE);
+
+    qtest_quit(qts);
+}
+
+static void test_milkv_duo_clk(void)
+{
+    QTestState *qts;
+    uint32_t clk_bypass_val;
+
+    qts = qtest_init("-M milkv-duo");
+
+    clk_bypass_val = qtest_readl(qts, CV1800B_CLK_BASE + CV1800B_CLK_BYPASS);
+    g_assert_cmphex(clk_bypass_val, ==, CV1800B_CLK_BYPASS_RESET);
+
+    qtest_writel(qts, CV1800B_CLK_BASE + CV1800B_CLK_BYPASS, TEST_PATTERN_5A);
+    clk_bypass_val = qtest_readl(qts, CV1800B_CLK_BASE + CV1800B_CLK_BYPASS);
+    g_assert_cmphex(clk_bypass_val, ==, TEST_PATTERN_5A);
+
+    qtest_writel(qts, CV1800B_CLK_BASE + CV1800B_CLK_BYPASS, TEST_PATTERN_A5);
+    clk_bypass_val = qtest_readl(qts, CV1800B_CLK_BASE + CV1800B_CLK_BYPASS);
+    g_assert_cmphex(clk_bypass_val, ==, TEST_PATTERN_A5);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/riscv/milkv-duo/uart", test_milkv_duo_uart);
+    qtest_add_func("/riscv/milkv-duo/clk", test_milkv_duo_clk);
+
+    return g_test_run();
+}
-- 
2.55.0.766.g2966f0265a-goog


