Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C12C4167D
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:37:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxUt-00030H-Uo; Mon, 06 Nov 2023 06:10:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxUN-0002Ag-HR
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:09:51 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxUL-0005dA-2l
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:09:51 -0500
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c501bd6ff1so61029181fa.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268986; x=1699873786; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=41ppFX+7R6F7tVGh9dGaG+2Fh2vMVrU15YTc5GYKvbI=;
 b=SyOnp2tZpsddipCQlZ8zG9BViO2b4Tm/7JtvFdWmxXAl2yjQ9ncLVdB44wpReCpj3k
 Or6Lxzjlk5vyVwpPLOMYXDCO/Xct39NCycAtNOTJg5CXI5iRMX3wDK0iKiBBihE7Nj7U
 nf4qoycCrD26gg1rWFIdJvPwvC+so8rgKGoRgxXfAk8bOyIWi6vbOwbiw5e4z/mVpWSa
 qCdTnzxkd1JpDYDZegppF9oxKTpGAQp29Gx7Oezbix1zOmn7DVcZEc3jkT5svGkDWh91
 eBn0PR7t0S6SMsOs3hHUQGm68YYAZVLjly0RYQIrj6xDPJFX78frBWX4WBrBdCdHd8ag
 WJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268986; x=1699873786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=41ppFX+7R6F7tVGh9dGaG+2Fh2vMVrU15YTc5GYKvbI=;
 b=kaK1Pz1KkUK+RnQnOEH3dOuOCLDbZVJ/S2AjPf6jrcAJsypxsmM6fiMW6ilsClwMwj
 jiQQsxmuqQgYzmGbUvOuo+U91+e9+aSEmDMpyqbieAyLrrKN/ysDfSwERwmBIjvz5XYw
 DrOGpQVmKHhkLz8GjLlIcJNv/npnpBMR0P3vVNcPdxIvKNuLx5G8nB2I4AjR+SvF7TJK
 CSfYp+ubTVtITlgmNDlgkFvly6IQgR81zrQvnc9xe1LSb7F+YQtpzAjONvKcH0Mbs5qX
 zrsbDdZZHbUxAUUpeO0cZO4lXl+qzsi9xJ8oA+WQydahSdVj5exPBccwOULVkd3lqIAg
 C66Q==
X-Gm-Message-State: AOJu0Ywn9TeRlB2xr0tfcz6SkF2Fkckw9SmePKDLQKiDme7230r9Uexh
 oy8SuXZ39rMi8XZ4jwYO/KVcgw==
X-Google-Smtp-Source: AGHT+IGDxDJzV8LF3nVlPJCOzZ9JzcZJLsFS8T/4TpQBPgzwCOrVVhFIKHp0AK1loMGLRLjuvYWbMg==
X-Received: by 2002:a05:651c:3dc:b0:2c5:14d3:f295 with SMTP id
 f28-20020a05651c03dc00b002c514d3f295mr19960731ljp.35.1699268986606; 
 Mon, 06 Nov 2023 03:09:46 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 l4-20020adfa384000000b0032d2489a399sm9245951wrb.49.2023.11.06.03.09.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:09:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Tyrone Ting <kfting@nuvoton.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 54/60] tests/qtest: add tests for ADM1266
Date: Mon,  6 Nov 2023 12:03:26 +0100
Message-ID: <20231106110336.358-55-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Titus Rwantare <titusr@google.com>

The ADM1266 can have string fields written by the driver, so
it's worth specifically testing.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
[PMD: Cover file in MAINTAINERS]
Message-ID: <20231023-staging-pmbus-v3-v4-6-07a8cb7cd20a@google.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                |   1 +
 tests/qtest/adm1266-test.c | 122 +++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build    |   1 +
 3 files changed, 124 insertions(+)
 create mode 100644 tests/qtest/adm1266-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e6a2f57442..c01c2e6ec0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -862,6 +862,7 @@ F: hw/*/npcm*
 F: hw/sensor/adm1266.c
 F: include/hw/*/npcm*
 F: tests/qtest/npcm*
+F: tests/qtest/adm1266-test.c
 F: pc-bios/npcm7xx_bootrom.bin
 F: roms/vbootrom
 F: docs/system/arm/nuvoton.rst
diff --git a/tests/qtest/adm1266-test.c b/tests/qtest/adm1266-test.c
new file mode 100644
index 0000000000..6c312c499f
--- /dev/null
+++ b/tests/qtest/adm1266-test.c
@@ -0,0 +1,122 @@
+/*
+ * Analog Devices ADM1266 Cascadable Super Sequencer with Margin Control and
+ * Fault Recording with PMBus
+ *
+ * Copyright 2022 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include <math.h>
+#include "hw/i2c/pmbus_device.h"
+#include "libqtest-single.h"
+#include "libqos/qgraph.h"
+#include "libqos/i2c.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qnum.h"
+#include "qemu/bitops.h"
+
+#define TEST_ID "adm1266-test"
+#define TEST_ADDR (0x12)
+
+#define ADM1266_BLACKBOX_CONFIG                 0xD3
+#define ADM1266_PDIO_CONFIG                     0xD4
+#define ADM1266_READ_STATE                      0xD9
+#define ADM1266_READ_BLACKBOX                   0xDE
+#define ADM1266_SET_RTC                         0xDF
+#define ADM1266_GPIO_SYNC_CONFIGURATION         0xE1
+#define ADM1266_BLACKBOX_INFORMATION            0xE6
+#define ADM1266_PDIO_STATUS                     0xE9
+#define ADM1266_GPIO_STATUS                     0xEA
+
+/* Defaults */
+#define ADM1266_OPERATION_DEFAULT               0x80
+#define ADM1266_CAPABILITY_DEFAULT              0xA0
+#define ADM1266_CAPABILITY_NO_PEC               0x20
+#define ADM1266_PMBUS_REVISION_DEFAULT          0x22
+#define ADM1266_MFR_ID_DEFAULT                  "ADI"
+#define ADM1266_MFR_ID_DEFAULT_LEN              32
+#define ADM1266_MFR_MODEL_DEFAULT               "ADM1266-A1"
+#define ADM1266_MFR_MODEL_DEFAULT_LEN           32
+#define ADM1266_MFR_REVISION_DEFAULT            "25"
+#define ADM1266_MFR_REVISION_DEFAULT_LEN        8
+#define TEST_STRING_A                           "a sample"
+#define TEST_STRING_B                           "b sample"
+#define TEST_STRING_C                           "rev c"
+
+static void compare_string(QI2CDevice *i2cdev, uint8_t reg,
+                           const char *test_str)
+{
+    uint8_t len = i2c_get8(i2cdev, reg);
+    char i2c_str[SMBUS_DATA_MAX_LEN] = {0};
+
+    i2c_read_block(i2cdev, reg, (uint8_t *)i2c_str, len);
+    g_assert_cmpstr(i2c_str, ==, test_str);
+}
+
+static void write_and_compare_string(QI2CDevice *i2cdev, uint8_t reg,
+                                     const char *test_str, uint8_t len)
+{
+    char buf[SMBUS_DATA_MAX_LEN] = {0};
+    buf[0] = len;
+    strncpy(buf + 1, test_str, len);
+    i2c_write_block(i2cdev, reg, (uint8_t *)buf, len + 1);
+    compare_string(i2cdev, reg, test_str);
+}
+
+static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_OPERATION);
+    g_assert_cmphex(i2c_value, ==, ADM1266_OPERATION_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_REVISION);
+    g_assert_cmphex(i2c_value, ==, ADM1266_PMBUS_REVISION_DEFAULT);
+
+    compare_string(i2cdev, PMBUS_MFR_ID, ADM1266_MFR_ID_DEFAULT);
+    compare_string(i2cdev, PMBUS_MFR_MODEL, ADM1266_MFR_MODEL_DEFAULT);
+    compare_string(i2cdev, PMBUS_MFR_REVISION, ADM1266_MFR_REVISION_DEFAULT);
+}
+
+/* test r/w registers */
+static void test_rw_regs(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    /* empty strings */
+    i2c_set8(i2cdev, PMBUS_MFR_ID, 0);
+    compare_string(i2cdev, PMBUS_MFR_ID, "");
+
+    i2c_set8(i2cdev, PMBUS_MFR_MODEL, 0);
+    compare_string(i2cdev, PMBUS_MFR_MODEL, "");
+
+    i2c_set8(i2cdev, PMBUS_MFR_REVISION, 0);
+    compare_string(i2cdev, PMBUS_MFR_REVISION, "");
+
+    /* test strings */
+    write_and_compare_string(i2cdev, PMBUS_MFR_ID, TEST_STRING_A,
+                             sizeof(TEST_STRING_A));
+    write_and_compare_string(i2cdev, PMBUS_MFR_ID, TEST_STRING_B,
+                             sizeof(TEST_STRING_B));
+    write_and_compare_string(i2cdev, PMBUS_MFR_ID, TEST_STRING_C,
+                             sizeof(TEST_STRING_C));
+}
+
+static void adm1266_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "id=" TEST_ID ",address=0x12"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
+
+    qos_node_create_driver("adm1266", i2c_device_create);
+    qos_node_consumes("adm1266", "i2c-bus", &opts);
+
+    qos_add_test("test_defaults", "adm1266", test_defaults, NULL);
+    qos_add_test("test_rw_regs", "adm1266", test_rw_regs, NULL);
+}
+
+libqos_init(adm1266_register_nodes);
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c9945e69b1..47dabf91d0 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -241,6 +241,7 @@ qos_test_ss = ss.source_set()
 qos_test_ss.add(
   'ac97-test.c',
   'adm1272-test.c',
+  'adm1266-test.c',
   'ds1338-test.c',
   'e1000-test.c',
   'eepro100-test.c',
-- 
2.41.0


