Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82A5C43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 10:23:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjaIB-0002ca-EH; Tue, 14 Jul 2026 06:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wjaI9-0002c6-OM
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 06:23:09 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wjaI7-0007hJ-QJ
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 06:23:09 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-384930ca5e2so4291088a91.3
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 03:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784024586; x=1784629386; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RJ4n0pKDBLEuU0sSi4l36zr8h0d3e9krCQHDQBpmEWg=;
 b=TXdtmJ6lP3VKD3LqopMwLKaoZZIGlg28UuKg4G/P1t2IqgR/pJL97qIY1niOlDQBOf
 BFlOKMm1V49Ub6Us5JUXR6gahShlsIyNXysekHcnISNX6Osx4ox7gm/cm4fERZYx0cIg
 So0bNjrd5j3Adsbu6xhVSSZdd9o0qDtYjDc7QI/uJeBi31IoaqOSqxS8eZ++mALPmKpw
 NiTbf08Cb48MAc4DsFO7Z2HBkeWlOwiFaT0TzF8qsWFN3/LCljqhUv5vN9QiJTNuDVSR
 CT8O+8dBiqQBdWuCsMDLtTZY1pCNgQCR6DFnn7KU8T63MUDq6boSk3sFm+QFs82GcWrm
 +d+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784024586; x=1784629386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RJ4n0pKDBLEuU0sSi4l36zr8h0d3e9krCQHDQBpmEWg=;
 b=naaG4x4J63e5yrZV5143IumEa7n1xi9FYe0D1UwHMKnS52nbRdnMfXQiRVOGx+gII2
 iXKDmTxKzawPhkXBdSlqKNZ5XMYGOBd92HkG08hvmvX6pXuDfGbi8VaVizwEBTWnBKOl
 l1oJfAUEknLlwh5ocrqf4sH6y8z6w4pCRDpsRdPithIZBXoApzhsyQGaSCScOKuOdKA9
 xa+GCY7Y4rawzviQsykrSu5hcXBfx/1oDP2VmZU+xHNedKokHeiwJlsyGtmmU3Vq9dZX
 iZPr72+Ei7D/zMFbViILLpGu5XX2fmQOOI0umDNWJQp/YkVYPmKY3P01XkfdzB6N1Le9
 G2Ag==
X-Gm-Message-State: AOJu0YzZU+XBFbrUnwtYiL0L/osC7OZ6i5bhIl1eQwuWxY+br5ksU7fS
 sn+CKABzIIK4QZMnIyZudoXhnUNMesLxMf7jgeXHynB3Qv1nQKLKRrEf
X-Gm-Gg: AfdE7cmEhbHmLPPNOpKKrwuAThWH7HLz351vljUGlpewZhbAyizNcVfYPnfJqVipHN+
 CJff2FeO4rL5WkJCzdUJbdqmwm5mFPCs3PX9lwmSxiU7FrBTIWjbfbtnUAcD9nCjTlrGsz521Zw
 EUMXGdW0z5z1suwNT+qEN21Ab+FfD4dXECMW650N1eNBqtkCxD7JNakZUacKOAEV4tdDPFIkKRe
 tdzCvxJJLpOHxluUoaXzrB6rRSXO+v8Mh3j58ygjGrAgU6xBkMLyPlxhmrkqrKgKcZ5kZ6NaW6u
 MC+2bS0op7zCoOvUoGRdce8HA4XNHrJsqf8IU7MYXYrTCWWESsClf/6WSAyrgPlz4z8u198Wk5y
 uFGp9IT8kt7/43ia6Rw7QG5IeyVDFUd3O+xijN3Wm+X3oSTK0sTmCifZi3TgFCVas1lZg1t5TLt
 +k46PaeZgNWLr0iiJ6pEaruEI6ia/AlGkSopXTyErjLw==
X-Received: by 2002:a17:90b:3c8a:b0:38d:858c:834d with SMTP id
 98e67ed59e1d1-38dc7605fd3mr11823736a91.17.1784024586190; 
 Tue, 14 Jul 2026 03:23:06 -0700 (PDT)
Received: from LAPTOP-CS7CB8K1.localdomain
 ([2409:8900:9fe:241d:8c09:365b:5b34:d891])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bc1fsm113824285ad.55.2026.07.14.03.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 03:23:05 -0700 (PDT)
From: Kangjie Huang <flamboyant.h.01@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>,
 Kangjie Huang <flamboyant.h.01@gmail.com>
Subject: [PATCH v2 3/3] tests/qtest: add test for K230 IOMUX
Date: Tue, 14 Jul 2026 18:22:02 +0800
Message-ID: <8986fd154ff098dc843f0ab2a4cbcf9a6c07b343.1784022244.git.flamboyant.h.01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784022244.git.flamboyant.h.01@gmail.com>
References: <cover.1784022244.git.flamboyant.h.01@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Cover the 64 documented reset values, writable field storage and
masking, read-modify-write accesses, the final IO63 register, reserved
offsets, and system reset.

Signed-off-by: Kangjie Huang <flamboyant.h.01@gmail.com>
---
 tests/qtest/k230-iomux-test.c | 155 ++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build       |   5 +-
 2 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/k230-iomux-test.c

diff --git a/tests/qtest/k230-iomux-test.c b/tests/qtest/k230-iomux-test.c
new file mode 100644
index 0000000000..39653cf832
--- /dev/null
+++ b/tests/qtest/k230-iomux-test.c
@@ -0,0 +1,155 @@
+/*
+ * QTest testcase for Kendryte K230 IOMUX
+ *
+ * Copyright (c) 2026 Kangjie Huang <flamboyant.h.01@gmail.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Provides test coverage for the Function IO configuration registers.
+ *
+ * K230 Technical Reference Manual V0.3.1 (2024-11-18):
+ * https://github.com/revyos/external-docs/blob/master/K230/en-us/K230_Technical_Reference_Manual_V0.3.1_20241118.pdf
+ *
+ * For more information, see <https://www.kendryte.com/en/proDetail/230>
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "hw/misc/k230_iomux.h"
+
+#define K230_IOMUX_BASE 0x91105000
+#define K230_IOMUX_IO0  (K230_IOMUX_BASE + 0x00)
+#define K230_IOMUX_IO1  (K230_IOMUX_BASE + 0x04)
+#define K230_IOMUX_IO63 (K230_IOMUX_BASE + 0xfc)
+#define K230_IOMUX_RESERVED_FIRST (K230_IOMUX_BASE + 0x100)
+#define K230_IOMUX_RESERVED_LAST \
+    (K230_IOMUX_BASE + K230_IOMUX_MMIO_SIZE - 4)
+#define K230_IOMUX_IO_SEL_MASK (0x7 << 11)
+#define K230_IOMUX_IO_SEL(value) ((value) << 11)
+
+static const uint32_t k230_iomux_reset_values[K230_IOMUX_NUM_REGS] = {
+    0x944, 0x944, 0x929, 0x908, 0x888, 0x908, 0x948, 0x890,
+    0x890, 0x890, 0x910, 0x890, 0x890, 0x8a9, 0xa9e, 0xabf,
+    0xb9e, 0xb9e, 0xb9e, 0xb9e, 0xb9e, 0xb9e, 0xb9e, 0xb9e,
+    0xb1e, 0xa90, 0xabf, 0xb9e, 0xb9e, 0xb9e, 0xb9e, 0xb9e,
+    0xbd0, 0xbd0, 0xbd0, 0xbd0, 0xbd0, 0xbd0, 0x890, 0x910,
+    0x890, 0x910, 0x890, 0x910, 0x890, 0x910, 0x890, 0x910,
+    0x890, 0x910, 0x890, 0x910, 0x890, 0x910, 0x89e, 0x89f,
+    0x99e, 0x99e, 0x99e, 0x99e, 0x890, 0x890, 0x8a9, 0x8a9,
+};
+
+static void test_reset_values(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+
+    for (size_t i = 0; i < G_N_ELEMENTS(k230_iomux_reset_values); i++) {
+        g_assert_cmphex(qtest_readl(qts, K230_IOMUX_BASE +
+                                    i * sizeof(uint32_t)), ==,
+                        k230_iomux_reset_values[i]);
+    }
+
+    qtest_quit(qts);
+}
+
+static void test_rw(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+
+    qtest_writel(qts, K230_IOMUX_IO0, 0x00001234);
+    g_assert_cmphex(qtest_readl(qts, K230_IOMUX_IO0), ==, 0x00001234);
+
+    qtest_writel(qts, K230_IOMUX_IO1, 0x00002abc);
+    g_assert_cmphex(qtest_readl(qts, K230_IOMUX_IO1), ==, 0x00002abc);
+    g_assert_cmphex(qtest_readl(qts, K230_IOMUX_IO0), ==, 0x00001234);
+
+    qtest_quit(qts);
+}
+
+static void test_write_mask(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+
+    qtest_writel(qts, K230_IOMUX_IO0, UINT32_MAX);
+    g_assert_cmphex(qtest_readl(qts, K230_IOMUX_IO0), ==,
+                    K230_IOMUX_WRITABLE_MASK);
+
+    qtest_quit(qts);
+}
+
+static void test_rmw(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+    uint32_t value;
+
+    value = qtest_readl(qts, K230_IOMUX_IO0);
+    value = (value & ~K230_IOMUX_IO_SEL_MASK) | K230_IOMUX_IO_SEL(3);
+    qtest_writel(qts, K230_IOMUX_IO0, value);
+
+    g_assert_cmphex(qtest_readl(qts, K230_IOMUX_IO0), ==,
+                    (k230_iomux_reset_values[0] &
+                     ~K230_IOMUX_IO_SEL_MASK) | K230_IOMUX_IO_SEL(3));
+
+    qtest_quit(qts);
+}
+
+static void test_io63_rw(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+
+    qtest_writel(qts, K230_IOMUX_IO63, 0x00000abc);
+    g_assert_cmphex(qtest_readl(qts, K230_IOMUX_IO63), ==, 0x00000abc);
+
+    qtest_quit(qts);
+}
+
+static void test_reserved_offsets(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+
+    qtest_writel(qts, K230_IOMUX_RESERVED_FIRST, 0x00001234);
+    g_assert_cmphex(qtest_readl(qts, K230_IOMUX_RESERVED_FIRST), ==, 0);
+
+    qtest_writel(qts, K230_IOMUX_RESERVED_LAST, 0x00002abc);
+    g_assert_cmphex(qtest_readl(qts, K230_IOMUX_RESERVED_LAST), ==, 0);
+
+    qtest_quit(qts);
+}
+
+static void test_reset_after_write(void)
+{
+    QTestState *qts = qtest_init("-machine k230");
+
+    qtest_writel(qts, K230_IOMUX_IO0, 0x00001234);
+    qtest_writel(qts, K230_IOMUX_IO1, 0x00002abc);
+    qtest_writel(qts, K230_IOMUX_IO63, 0x00000abc);
+
+    g_assert_cmphex(qtest_readl(qts, K230_IOMUX_IO0), ==, 0x00001234);
+    g_assert_cmphex(qtest_readl(qts, K230_IOMUX_IO1), ==, 0x00002abc);
+    g_assert_cmphex(qtest_readl(qts, K230_IOMUX_IO63), ==, 0x00000abc);
+
+    qtest_system_reset(qts);
+
+    g_assert_cmphex(qtest_readl(qts, K230_IOMUX_IO0), ==,
+                    k230_iomux_reset_values[0]);
+    g_assert_cmphex(qtest_readl(qts, K230_IOMUX_IO1), ==,
+                    k230_iomux_reset_values[1]);
+    g_assert_cmphex(qtest_readl(qts, K230_IOMUX_IO63), ==,
+                    k230_iomux_reset_values[63]);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/k230-iomux/reset", test_reset_values);
+    qtest_add_func("/k230-iomux/rw", test_rw);
+    qtest_add_func("/k230-iomux/write-mask", test_write_mask);
+    qtest_add_func("/k230-iomux/rmw", test_rmw);
+    qtest_add_func("/k230-iomux/io63-rw", test_io63_rw);
+    qtest_add_func("/k230-iomux/reserved-offsets", test_reserved_offsets);
+    qtest_add_func("/k230-iomux/reset-after-write", test_reset_after_write);
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 56ff860e21..cb8001ecbf 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -297,7 +297,10 @@ qtests_riscv64 = ['riscv-csr-test'] + \
   (config_all_devices.has_key('CONFIG_IOMMU_TESTDEV') and
    config_all_devices.has_key('CONFIG_RISCV_IOMMU') ?
    ['iommu-riscv-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test'] : [])
+  (config_all_devices.has_key('CONFIG_K230') ? [
+    'k230-wdt-test',
+    'k230-iomux-test',
+  ] : [])
 
 qtests_hexagon = ['boot-serial-test']
 
-- 
2.43.0


