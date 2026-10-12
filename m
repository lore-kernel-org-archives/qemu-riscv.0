Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C6ECA9ED1
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:16:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHlA-0003em-Dd; Mon, 12 Oct 2026 11:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHkw-0003YC-Du
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:16:08 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHkt-0008Uf-AN
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:16:02 -0400
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48c4be28b82so1945035f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791818158; x=1792422958;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hXF/Uyp0IqUhL1rx9an+YyWuRquSX9DskObYxu27U/A=;
 b=iCqOzH1Yxwoq1Sfvz6Bshg2QQztipcBQVKbZl3qfBzyVipdTy92jgkD0tLnBDvs7YE
 y4AWxVyVyK05FuIpl6S3JWJwZuXT0lZrjHVfWBgvo0co3+PrdGbordvKaxf/vC7wvYrw
 auj98Mk7DxOHHuzvkf467M9BQ11SefOY0OtjND2QBUzh7EJkVLXlqOPdd8P/wyv4vvAP
 j07JMfAdF3vakyWuiqsgRG4E8wxJwOOSMiAXuiWncJCmyqJm77JyYYtPjeKtfT9/TTfw
 qxHbQtTv5ZoPOz8JXhO7cSn+aAJoyWoztRjJF3Zw6aqMaqInejA9Y/GhceOBKowKnOek
 DgWg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwElkYwzbvwA0ns57h2UneGb4eo6l0KIWFmwdk0/DoNl2FdrKNJ0w7zJCElEHSrvWa5631b+BP+2CzH@nongnu.org
X-Gm-Message-State: AFq9FYLfOmEy71gS/9lMePH3VxBkFPduSbsSVGB3mrm6OKKCHkjTPQDi
 deDj5qYq91QZaCU+o1Q6mr4MINtCVYGInk64CA5irn1Jn88Yg+fBZIze
X-Gm-Gg: AYBFou0QInCQNxx0NCOKgniURk2mQHk9QbuTDCXN4oFzJ1CrNHMHMZVXuX2oxXj4V54
 GK6wO8tvDb0z5I5WKQ0F7R0o/yiwxuffNmRaZBm6sGw9jQIkd4uDpDlMTpybkzhZwnfw06l8q/K
 sE5nXazEHSueQh6S/7Zymz7U9ARYwQVLx5nG4i4A/4XilcOcwB9I2J84jmgaimgNhcd+XuQyec6
 3ON8y760x8oLDI1d1JcOrjbs/njs7G/AalFr6y5I8BjCEQR5m8i/gNadY79vs+v5yRkNrAhGNWb
 lXeyQuzLDy+ag5SrCzViOLbeP4SrKdSQBVeIk9s8130QXL1gu64jXSBwfwiS/NA+4/KeKvB4x3i
 giWaQ85Mp+CmAheMkr1WN/+j+bRb4Udp9959v43iYEQrfL9mgDMvMWOCQXw3psUso7ibaxWciM0
 RF4+XIVAJb3FrrLECsKYIoUbV9WCcmtkHoKC9EjPqTuzpszSMWzqHu7WYE/AK8lyMMtf7bj2ZCe
 fa2odSDVSLaXrBf0cdevg/eD9fGFyH8znLOmSlHmnx8Dw==
X-Received: by 2002:a5d:6084:0:b0:488:8525:4979 with SMTP id
 ffacd0b85a97d-48dbacdb462mr14942243f8f.45.1791818157642; 
 Mon, 12 Oct 2026 08:15:57 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaaad1sm9541f8f.17.2026.10.12.08.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:15:56 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:16 +0200
Subject: [PATCH v2 23/50] tests/qtest: ds1339: add RTC test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-23-4c3dff084ec9@free.fr>
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815520; l=7120;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=3fFqJMbI+w2Mg/c2PcpO40N3CXUqXKnFcNeMq9t8SbQ=;
 b=6t130iCePXBh6J4cRIyZZ9rCE1CNs/1qc64NRzus65WZ8pJb3AHEQPZsMwhVfrqYyUXPmtMZy
 0qpsD/GcGmVBNIeXasdSddzm+BRfrnE56Ha6nOMc1XAJaY/a1tAnIrt
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.53; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f53.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The variant had no test of its own. Cover its register map, the
write-protection of the oscillator-stop flag, and the wrap of the
register pointer at the end of the map.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1339-test.c | 166 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build   |   1 +
 2 files changed, 167 insertions(+)

diff --git a/tests/qtest/ds1339-test.c b/tests/qtest/ds1339-test.c
new file mode 100644
index 0000000000..08fc16acda
--- /dev/null
+++ b/tests/qtest/ds1339-test.c
@@ -0,0 +1,166 @@
+/*
+ * QTest testcase for the DS1339 RTC
+ *
+ * Copyright (c) 2026 Meta Platforms, Inc. and affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bcd.h"
+#include "libqos/i2c.h"
+
+#define DS1339_ADDR 0x68
+
+/* DS1339 register map */
+#define DS1339_SECONDS   0x00
+#define DS1339_MONTH     0x05
+#define DS1339_YEAR      0x06
+#define DS1339_ALARM1    0x07
+#define DS1339_ALARM2    0x0b
+#define DS1339_CONTROL   0x0e
+#define DS1339_STATUS    0x0f
+#define DS1339_TRICKLE   0x10
+#define DS1339_NUM_REGS  0x11
+
+#define DS1339_STATUS_OSF 0x80
+
+/* The clock and calendar come up on the host time. */
+static void test_time(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    uint8_t resp[7];
+    time_t now = time(NULL);
+    struct tm *tm_ptr = gmtime(&now);
+
+    i2c_read_block(i2cdev, DS1339_SECONDS, resp, sizeof(resp));
+
+    g_assert_cmpuint(from_bcd(resp[4]), ==, tm_ptr->tm_mday);
+    g_assert_cmpuint(from_bcd(resp[5]), ==, 1 + tm_ptr->tm_mon);
+    g_assert_cmpuint(2000 + from_bcd(resp[6]), ==, 1900 + tm_ptr->tm_year);
+}
+
+/* Writable control bits round-trip; the reserved one reads back zero. */
+static void test_control_register(void *obj, void *data,
+                                  QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, DS1339_CONTROL, 0x1c);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_CONTROL), ==, 0x1c);
+
+    i2c_set8(i2cdev, DS1339_CONTROL, 0xff);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_CONTROL), ==, 0xbf);
+
+    i2c_set8(i2cdev, DS1339_CONTROL, 0x00);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_CONTROL), ==, 0x00);
+}
+
+/* The oscillator-stop flag can only be cleared by a write, never set. */
+static void test_osf_write_protect(void *obj, void *data,
+                                   QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF,
+                    ==, DS1339_STATUS_OSF);
+    i2c_set8(i2cdev, DS1339_STATUS, DS1339_STATUS_OSF);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF,
+                    ==, DS1339_STATUS_OSF);
+
+    i2c_set8(i2cdev, DS1339_STATUS, 0x00);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF, ==, 0);
+    i2c_set8(i2cdev, DS1339_STATUS, DS1339_STATUS_OSF);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF, ==, 0);
+}
+
+/* The register pointer wraps at the end of the map. */
+static void test_address_wrap(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, DS1339_CONTROL, 0x2a);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_CONTROL + DS1339_NUM_REGS),
+                    ==, 0x2a);
+}
+
+/* A block transfer off the end of the map carries on from the start. */
+static void test_block_wrap(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    /* The alarm 2 block, then on into the time registers once it wraps. */
+    const uint8_t out[11] = {
+        0x0b, 0x0c, 0x0d,              /* alarm 2 */
+        0x18,                          /* control */
+        0x00,                          /* status */
+        0xa5,                          /* trickle charger */
+        0x30, 0x20, 0x10, 0x05, 0x12,  /* 10:20:30, day 5, the 12th */
+    };
+    uint8_t resp[11];
+
+    /* A month and year the wrapping write never reaches. */
+    i2c_set8(i2cdev, DS1339_MONTH, 0x07);
+    i2c_set8(i2cdev, DS1339_YEAR, 0x31);
+
+    i2c_write_block(i2cdev, DS1339_ALARM2, out, sizeof(out));
+
+    i2c_read_block(i2cdev, DS1339_SECONDS, resp, 7);
+    g_assert_cmphex(resp[2], ==, 0x10);
+    g_assert_cmphex(resp[3], ==, 0x05);
+    g_assert_cmphex(resp[4], ==, 0x12);
+    g_assert_cmphex(resp[5] & 0x1f, ==, 0x07);
+    g_assert_cmphex(resp[6], ==, 0x31);
+
+    i2c_read_block(i2cdev, DS1339_ALARM2, resp, sizeof(resp));
+    g_assert_cmphex(resp[0], ==, 0x0b);
+    g_assert_cmphex(resp[1], ==, 0x0c);
+    g_assert_cmphex(resp[2], ==, 0x0d);
+    g_assert_cmphex(resp[3], ==, 0x18);
+    g_assert_cmphex(resp[4], ==, 0x00);
+    g_assert_cmphex(resp[5], ==, 0xa5);
+    g_assert_cmphex(resp[8], ==, 0x10);
+    g_assert_cmphex(resp[9], ==, 0x05);
+    g_assert_cmphex(resp[10], ==, 0x12);
+}
+
+/* The alarm and trickle registers are stored but never evaluated. */
+static void test_alarm_registers(void *obj, void *data,
+                                 QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    static const uint8_t regs[] = {
+        DS1339_ALARM1, 0x08, 0x09, 0x0a,        /* alarm 1 */
+        DS1339_ALARM2, 0x0c, 0x0d,              /* alarm 2 */
+        DS1339_TRICKLE,
+    };
+    static const uint8_t vals[] = { 0xff, 0x00, 0x5a, 0xa5 };
+    unsigned reg, val;
+
+    for (reg = 0; reg < ARRAY_SIZE(regs); reg++) {
+        for (val = 0; val < ARRAY_SIZE(vals); val++) {
+            i2c_set8(i2cdev, regs[reg], vals[val]);
+            g_assert_cmphex(i2c_get8(i2cdev, regs[reg]), ==, vals[val]);
+        }
+    }
+}
+
+static void ds1339_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "address=0x68"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { DS1339_ADDR });
+
+    qos_node_create_driver("ds1339", i2c_device_create);
+    qos_node_consumes("ds1339", "i2c-bus", &opts);
+
+    qos_add_test("time", "ds1339", test_time, NULL);
+    qos_add_test("control-register", "ds1339", test_control_register, NULL);
+    qos_add_test("osf-write-protect", "ds1339", test_osf_write_protect, NULL);
+    qos_add_test("address-wrap", "ds1339", test_address_wrap, NULL);
+    qos_add_test("block-wrap", "ds1339", test_block_wrap, NULL);
+    qos_add_test("alarm-registers", "ds1339", test_alarm_registers,
+                 NULL);
+}
+
+libqos_init(ds1339_register_nodes);
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e05d8a07b9..e23eb9bbca 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -326,6 +326,7 @@ qos_test_ss.add(
   'adm1272-test.c',
   'adm1266-test.c',
   'ds1338-test.c',
+  'ds1339-test.c',
   'e1000-test.c',
   'eepro100-test.c',
   'es1370-test.c',

-- 
2.50.1


