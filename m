Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48219C2A09B
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 16:42:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsNd8-0001mt-Ca; Fri, 07 Aug 2026 12:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wzy15515798875@gmail.com>)
 id 1wsMVV-0004Qy-KM
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 11:29:13 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wzy15515798875@gmail.com>)
 id 1wsMVT-0007Om-FW
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 11:29:13 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2d004f135b1so42611505ad.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 08:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786116550; x=1786721350; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/Dl+jMIxfRI9WOJazK+zPFzjGcmCKJrAWcw1IrtW8bA=;
 b=UHqwV1RKitKnZEjyrPf5Z0KVgNEHihedHnujC7lOcx6K8UgauGRBft9ayoMUJBx5ee
 CyPJAk27UTpnevYCejY4X+axV2Rk1u5kgs2SdEKzgUDE/lR1sXs9cSzTtcryaELhipiV
 ea6vv2keDrRYKnXUlv8oj8ikzHw6hVu626d7qNaT3gUSQk5u3gMOufwyq7zbRQgrutcq
 h6DwH8eAXStysJxtCOGn5kbyfNu+2mqzsp1a+qJny43ritbhy1Yqj1m6+CEzEVhXJ2MB
 bhmMn+pNjnTJu70C8YviLCp+TbDv31fjkImGlPBZQot+XHDhfvUtYg4MNQQ8O71SA5s6
 K9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786116550; x=1786721350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/Dl+jMIxfRI9WOJazK+zPFzjGcmCKJrAWcw1IrtW8bA=;
 b=k09oC6CrltWR/j/JTnfFYNMqSUCsm1qxNc2fSC7R5uw8WXuQTmM9V+EEBTMPoggEVm
 70TwjX5zF1iXn6oMiJCvjA/8mEPOmXhP0sw4MTsFy+BKi0UoDeCg/AcdUHnoVMBhXlQp
 NUucnlJfgV5jmlbCERmS3ilFQBXxsRVA1McsTzC0eiqPQnMS/p9Lyb1Apn1wpZQlNj7E
 sqQmNUXGhC3xApLmmuG6D1zoORCp/CJRhBD92wzTlIYp4PidJMWauS27gONbU+dqiwtG
 VdrFPdSwPi1ZRnjlWDAzkKdeYAnbUnUR/uZxBF1tYoFXrHnlG1NZ6ssjBTwaR5MjwVP8
 lGTQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqMtb63e4wLfiDPKlVCLfjPJSaGo5iD2v5nCcA5e0fHw/tFkYkUWGFrvfCerzyWjy2Ab4xP8xJJo5G5@nongnu.org
X-Gm-Message-State: AOJu0Yxa5ED4dyn0w13JUzhIYYX1fCJ0yAMp5R51PUVWrEHH8RbY6gb2
 F4JYqhI3E1H234wZPAIdirHYTR1izMK0jaqbjXU1eHgK2VblmvCGadaX
X-Gm-Gg: AR+sD13pGJ43Xrc55QWMFb3h+8cQst6D6g9TjKMcl4aU9UcA20TxIG6NmYzBVfOcNxe
 hv6sbrrkLZcZgU7bFo/atu2zqJ0QT/KWZcfZecr5yuMqJ3HVFTZRTib4e0sB4ohukZ6+3liY+jZ
 V1LWs+qj4dLonyDGYz2fUx3dpEdSpN9wTYFX/XgCEZ5qX1uY5gYr8iyh3+4p8c6VxOAu8XMcf9D
 B/qoU1l3wqhtU8EFp/djhq15RHcuVK4T5OCn4XTWeu/K8CpWVniFGG8CJaOhgibrAuzaTxSM9ff
 QnoLam58SOt4Rgzempe1bQuUaUjg/l+Qu3iDis9DyN5oBiJ1FPMYKtx7ZMgCIzx/XZGUNfnh1/p
 SH8WH1fOvl4FhLvcDgm0F+/3XFVD6Kzo61ZgrVFePr3VjK+8EaWAljsrMVZjPYB/QM+zOlz3fxf
 UI1VQiu6C3mZZwngiWc45HHdfKJngTxZ0nLoHB+mHdAM2kaM6UG9qIHcKoGQUjn3ArUjOSUVnPN
 Yas5z407Rs=
X-Received: by 2002:a17:902:e94c:b0:2c8:4c29:afeb with SMTP id
 d9443c01a7336-2d0ca7b5520mr304869535ad.8.1786116550071; 
 Fri, 07 Aug 2026 08:29:10 -0700 (PDT)
Received: from localhost.localdomain
 ([2406:da14:1cf8:d800:471c:a879:4603:554f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d14ccae6f8sm10953895ad.1.2026.08.07.08.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 08:29:09 -0700 (PDT)
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
Subject: [PATCH 3/5] tests/qtest: add K230 I2C controller tests
Date: Fri,  7 Aug 2026 23:28:28 +0800
Message-ID: <20260807152830.6833-4-wzy15515798875@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807152830.6833-1-wzy15515798875@gmail.com>
References: <20260807152830.6833-1-wzy15515798875@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=wzy15515798875@gmail.com; helo=mail-pl1-x62c.google.com
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

Add qtests covering reset values, all five controller instances,
register access and locking, enable and disable behavior, interrupt
masking, RX underflow, and address NACK reporting.

Signed-off-by: Wang Zhongyu <wzy15515798875@gmail.com>
---
 MAINTAINERS                 |   1 +
 tests/qtest/k230-i2c-test.c | 335 ++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build     |   2 +-
 3 files changed, 337 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/k230-i2c-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ac61054dd1..d0053441a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1834,6 +1834,7 @@ F: include/hw/i2c/k230_i2c.h
 F: include/hw/riscv/k230.h
 F: include/hw/watchdog/k230_wdt.h
 F: tests/functional/riscv64/test_k230.py
+F: tests/qtest/k230-i2c-test.c
 F: tests/qtest/k230-wdt-test.c
 
 RX Machines
diff --git a/tests/qtest/k230-i2c-test.c b/tests/qtest/k230-i2c-test.c
new file mode 100644
index 0000000000..cc8dd54153
--- /dev/null
+++ b/tests/qtest/k230-i2c-test.c
@@ -0,0 +1,335 @@
+/*
+ * QTest testcase for K230 DesignWare I2C controller
+ *
+ * Copyright (c) 2026 Wang Zhongyu <wzy15515798875@gmail.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "qemu/bitops.h"
+
+/* K230 I2C controller base addresses */
+#define K230_I2C0_BASE                 0x91405000
+#define K230_I2C1_BASE                 0x91406000
+#define K230_I2C2_BASE                 0x91407000
+#define K230_I2C3_BASE                 0x91408000
+#define K230_I2C4_BASE                 0x91409000
+
+#define K230_I2C_COUNT                 5
+
+/* Register offsets used by the tests */
+#define K230_IC_CON                    0x00
+#define K230_IC_TAR                    0x04
+#define K230_IC_SAR                    0x08
+#define K230_IC_HS_MADDR               0x0c
+#define K230_IC_DATA_CMD               0x10
+#define K230_IC_INTR_STAT              0x2c
+#define K230_IC_INTR_MASK              0x30
+#define K230_IC_RAW_INTR_STAT          0x34
+#define K230_IC_RX_TL                  0x38
+#define K230_IC_TX_TL                  0x3c
+#define K230_IC_CLR_RX_UNDER           0x44
+#define K230_IC_CLR_TX_ABRT            0x54
+#define K230_IC_ENABLE                 0x6c
+#define K230_IC_STATUS                 0x70
+#define K230_IC_TXFLR                  0x74
+#define K230_IC_RXFLR                  0x78
+#define K230_IC_TX_ABRT_SOURCE         0x80
+#define K230_IC_ENABLE_STATUS          0x9c
+#define K230_IC_COMP_PARAM_1           0xf4
+#define K230_IC_COMP_VERSION           0xf8
+#define K230_IC_COMP_TYPE              0xfc
+
+#define IC_CON_10BITADDR_MASTER        BIT(4)
+
+/* IC_DATA_CMD */
+#define IC_DATA_CMD_STOP               BIT(9)
+
+/* IC_INTR_STAT and IC_RAW_INTR_STAT */
+#define IC_INTR_RX_UNDER               BIT(0)
+#define IC_INTR_TX_EMPTY               BIT(4)
+#define IC_INTR_TX_ABRT                BIT(6)
+
+/* IC_STATUS */
+#define IC_STATUS_TFNF                 BIT(1)
+#define IC_STATUS_TFE                  BIT(2)
+
+/* IC_TX_ABRT_SOURCE */
+#define IC_ABRT_7B_ADDR_NOACK          BIT(0)
+
+#define K230_IC_COMP_PARAM_1_VALUE     0x001f3fae
+#define K230_IC_COMP_VERSION_VALUE     0x3132302a
+#define K230_IC_COMP_TYPE_VALUE        0x44570140
+
+static const uint64_t k230_i2c_base[K230_I2C_COUNT] = {
+    K230_I2C0_BASE,
+    K230_I2C1_BASE,
+    K230_I2C2_BASE,
+    K230_I2C3_BASE,
+    K230_I2C4_BASE,
+};
+
+static void test_reset_values(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+    uint32_t status;
+
+    g_assert_cmphex(qtest_readl(qts, K230_I2C0_BASE + K230_IC_CON),
+                    ==, 0x7f);
+    g_assert_cmphex(qtest_readl(qts, K230_I2C0_BASE + K230_IC_TAR),
+                    ==, 0x55);
+    g_assert_cmphex(qtest_readl(qts, K230_I2C0_BASE + K230_IC_SAR),
+                    ==, 0x55);
+    g_assert_cmphex(qtest_readl(qts,
+                               K230_I2C0_BASE + K230_IC_HS_MADDR),
+                    ==, 0x1);
+
+    g_assert_cmphex(qtest_readl(qts, K230_I2C0_BASE + K230_IC_ENABLE),
+                    ==, 0);
+    g_assert_cmphex(qtest_readl(qts,
+                               K230_I2C0_BASE + K230_IC_ENABLE_STATUS),
+                    ==, 0);
+
+    g_assert_cmphex(qtest_readl(qts, K230_I2C0_BASE + K230_IC_TXFLR),
+                    ==, 0);
+    g_assert_cmphex(qtest_readl(qts, K230_I2C0_BASE + K230_IC_RXFLR),
+                    ==, 0);
+
+    status = qtest_readl(qts, K230_I2C0_BASE + K230_IC_STATUS);
+    g_assert_cmphex(status, ==, IC_STATUS_TFNF | IC_STATUS_TFE);
+
+    g_assert_cmphex(qtest_readl(qts,
+                               K230_I2C0_BASE + K230_IC_RAW_INTR_STAT),
+                    ==, 0);
+
+    g_assert_cmphex(qtest_readl(qts,
+                               K230_I2C0_BASE + K230_IC_COMP_PARAM_1),
+                    ==, K230_IC_COMP_PARAM_1_VALUE);
+    g_assert_cmphex(qtest_readl(qts,
+                               K230_I2C0_BASE + K230_IC_COMP_VERSION),
+                    ==, K230_IC_COMP_VERSION_VALUE);
+    g_assert_cmphex(qtest_readl(qts,
+                               K230_I2C0_BASE + K230_IC_COMP_TYPE),
+                    ==, K230_IC_COMP_TYPE_VALUE);
+
+    qtest_quit(qts);
+}
+
+static void test_all_instances(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+
+    for (int i = 0; i < K230_I2C_COUNT; i++) {
+        g_assert_cmphex(qtest_readl(qts,
+                                   k230_i2c_base[i] +
+                                   K230_IC_COMP_TYPE),
+                        ==, K230_IC_COMP_TYPE_VALUE);
+    }
+
+    qtest_quit(qts);
+}
+
+static void test_register_access(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_CON, UINT32_MAX);
+    g_assert_cmphex(qtest_readl(qts, K230_I2C0_BASE + K230_IC_CON),
+                    ==, 0x7f);
+
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_TAR, UINT32_MAX);
+    g_assert_cmphex(qtest_readl(qts, K230_I2C0_BASE + K230_IC_TAR),
+                    ==, 0xfff);
+
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_SAR, UINT32_MAX);
+    g_assert_cmphex(qtest_readl(qts, K230_I2C0_BASE + K230_IC_SAR),
+                    ==, 0x3ff);
+
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_HS_MADDR,
+                 UINT32_MAX);
+    g_assert_cmphex(qtest_readl(qts,
+                               K230_I2C0_BASE + K230_IC_HS_MADDR),
+                    ==, 0x7);
+
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_RX_TL,
+                 UINT32_MAX);
+    g_assert_cmphex(qtest_readl(qts, K230_I2C0_BASE + K230_IC_RX_TL),
+                    ==, 63);
+
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_TX_TL,
+                 UINT32_MAX);
+    g_assert_cmphex(qtest_readl(qts, K230_I2C0_BASE + K230_IC_TX_TL),
+                    ==, 32);
+
+    qtest_quit(qts);
+}
+
+static void test_register_lock_while_enabled(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_TAR, 0x22);
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_ENABLE, 1);
+
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_TAR, 0x33);
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_CON, 0);
+
+    g_assert_cmphex(qtest_readl(qts, K230_I2C0_BASE + K230_IC_TAR),
+                    ==, 0x22);
+    g_assert_cmphex(qtest_readl(qts, K230_I2C0_BASE + K230_IC_CON),
+                    ==, 0x7f);
+
+    qtest_quit(qts);
+}
+
+static void test_enable_disable(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+    uint32_t raw;
+
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_ENABLE, 1);
+
+    g_assert_cmphex(qtest_readl(qts, K230_I2C0_BASE + K230_IC_ENABLE),
+                    ==, 1);
+    g_assert_cmphex(qtest_readl(qts,
+                               K230_I2C0_BASE + K230_IC_ENABLE_STATUS),
+                    ==, 1);
+
+    raw = qtest_readl(qts,
+                      K230_I2C0_BASE + K230_IC_RAW_INTR_STAT);
+    g_assert_cmphex(raw & IC_INTR_TX_EMPTY, ==, IC_INTR_TX_EMPTY);
+
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_ENABLE, 0);
+
+    g_assert_cmphex(qtest_readl(qts, K230_I2C0_BASE + K230_IC_ENABLE),
+                    ==, 0);
+    g_assert_cmphex(qtest_readl(qts,
+                               K230_I2C0_BASE + K230_IC_ENABLE_STATUS),
+                    ==, 0);
+
+    raw = qtest_readl(qts,
+                      K230_I2C0_BASE + K230_IC_RAW_INTR_STAT);
+    g_assert_cmphex(raw & IC_INTR_TX_EMPTY, ==, 0);
+
+    qtest_quit(qts);
+}
+
+static void test_interrupt_mask(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+    uint32_t raw;
+    uint32_t stat;
+
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_ENABLE, 1);
+
+    raw = qtest_readl(qts,
+                      K230_I2C0_BASE + K230_IC_RAW_INTR_STAT);
+    g_assert_cmphex(raw & IC_INTR_TX_EMPTY, ==, IC_INTR_TX_EMPTY);
+
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_INTR_MASK, 0);
+
+    stat = qtest_readl(qts, K230_I2C0_BASE + K230_IC_INTR_STAT);
+    g_assert_cmphex(stat, ==, 0);
+
+    raw = qtest_readl(qts,
+                      K230_I2C0_BASE + K230_IC_RAW_INTR_STAT);
+    g_assert_cmphex(raw & IC_INTR_TX_EMPTY, ==, IC_INTR_TX_EMPTY);
+
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_INTR_MASK,
+                 IC_INTR_TX_EMPTY);
+
+    stat = qtest_readl(qts, K230_I2C0_BASE + K230_IC_INTR_STAT);
+    g_assert_cmphex(stat & IC_INTR_TX_EMPTY, ==, IC_INTR_TX_EMPTY);
+
+    qtest_quit(qts);
+}
+
+static void test_rx_underflow(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+    uint32_t raw;
+
+    g_assert_cmphex(qtest_readl(qts,
+                               K230_I2C0_BASE + K230_IC_DATA_CMD),
+                    ==, 0);
+
+    raw = qtest_readl(qts,
+                      K230_I2C0_BASE + K230_IC_RAW_INTR_STAT);
+    g_assert_cmphex(raw & IC_INTR_RX_UNDER, ==, IC_INTR_RX_UNDER);
+
+    qtest_readl(qts, K230_I2C0_BASE + K230_IC_CLR_RX_UNDER);
+
+    raw = qtest_readl(qts,
+                      K230_I2C0_BASE + K230_IC_RAW_INTR_STAT);
+    g_assert_cmphex(raw & IC_INTR_RX_UNDER, ==, 0);
+
+    qtest_quit(qts);
+}
+
+static void test_address_nack(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+    uint32_t con;
+    uint32_t raw;
+    uint32_t source;
+
+    /*
+     * No slave is attached at address 0x7f, so the address phase
+     * must terminate with TX_ABRT.
+     */
+    con = qtest_readl(qts, K230_I2C0_BASE + K230_IC_CON);
+    con &= ~IC_CON_10BITADDR_MASTER;
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_CON, con);
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_TAR, 0x7f);
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_ENABLE, 1);
+
+    qtest_writel(qts, K230_I2C0_BASE + K230_IC_DATA_CMD,
+                 IC_DATA_CMD_STOP | 0x55);
+
+    raw = qtest_readl(qts,
+                      K230_I2C0_BASE + K230_IC_RAW_INTR_STAT);
+    source = qtest_readl(qts,
+                         K230_I2C0_BASE + K230_IC_TX_ABRT_SOURCE);
+
+    g_assert_cmphex(raw & IC_INTR_TX_ABRT, ==, IC_INTR_TX_ABRT);
+    g_assert_cmphex(source & IC_ABRT_7B_ADDR_NOACK,
+                    ==, IC_ABRT_7B_ADDR_NOACK);
+
+    qtest_readl(qts, K230_I2C0_BASE + K230_IC_CLR_TX_ABRT);
+
+    raw = qtest_readl(qts,
+                      K230_I2C0_BASE + K230_IC_RAW_INTR_STAT);
+    source = qtest_readl(qts,
+                         K230_I2C0_BASE + K230_IC_TX_ABRT_SOURCE);
+
+    g_assert_cmphex(raw & IC_INTR_TX_ABRT, ==, 0);
+    g_assert_cmphex(source, ==, 0);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/k230-i2c/reset-values",
+                   test_reset_values);
+    qtest_add_func("/k230-i2c/all-instances",
+                   test_all_instances);
+    qtest_add_func("/k230-i2c/register-access",
+                   test_register_access);
+    qtest_add_func("/k230-i2c/register-lock-while-enabled",
+                   test_register_lock_while_enabled);
+    qtest_add_func("/k230-i2c/enable-disable",
+                   test_enable_disable);
+    qtest_add_func("/k230-i2c/interrupt-mask",
+                   test_interrupt_mask);
+    qtest_add_func("/k230-i2c/rx-underflow",
+                   test_rx_underflow);
+    qtest_add_func("/k230-i2c/address-nack",
+                   test_address_nack);
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 56ff860e21..56fb0af800 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -297,7 +297,7 @@ qtests_riscv64 = ['riscv-csr-test'] + \
   (config_all_devices.has_key('CONFIG_IOMMU_TESTDEV') and
    config_all_devices.has_key('CONFIG_RISCV_IOMMU') ?
    ['iommu-riscv-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test'] : [])
+  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test', 'k230-i2c-test'] : [])
 
 qtests_hexagon = ['boot-serial-test']
 
-- 
2.43.0


