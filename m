Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189C6CA9EDD
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:19:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHnv-0005O9-W1; Mon, 12 Oct 2026 11:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHns-0005IJ-8b
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:19:04 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHnq-0000NV-K5
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:19:04 -0400
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so1387016f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791818341; x=1792423141;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ofy5Q7w1hiOQ65qRkRFvKTBxqy4svZeHJL4ReaZKNBI=;
 b=E1ycgoJ+yAXaRbqZp6sW9Z+v8RzTng8Lz/lzoTwtKeTSAjX9RnFzo7FV3Kb31HN2Hy
 h6ugzOBNinMFIpfePZ45SilqwepuZqkOlHLYtPpnerAGG4UhSvzZpjOtbKPb7xjE5wm9
 7isDTN9fkyYQesstmsk0Zyu+0x9yWYEsuX3AYrVKptjVePxdrf/+MABTly2HmzkGbHuh
 wV/ixiCzB2j35F9QsEWVL98YY4ikzaJ2ONOHmwJoCItqWH4c4FOA2JCdscDjD5uWT6vz
 X/yP+VKI7tzQTEX7XFHkV2w2nryRi29pSAuKll/lL+F5fLOPI6BYMviv1X+b3u8RT9If
 BhUA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxM0+y885qUrqaRvlWfhzfSgfGaI8eWpr+DjlpWHWPx6+q1Vqp7/h2eZEhCXjW2RMjNqctW7BPIXfGC@nongnu.org
X-Gm-Message-State: AFq9FYJiTnY1gaWNWZpVW2LC/6zfOH3u8a6s5F4of/fRM/VsM7l7v8ro
 sp8Yh8KdPNMyQEoEzyIXDZProV5vunAW9QwWAEYubeA0T1TvrKA9Lk6p
X-Gm-Gg: AYBFou3hpXkZmU3MXWd3Sq/k+PFYTvEsb4A9gb4j2ttwTpErFeXQXe/mGDSWgUXZnzE
 D9hvaFO3Av4hLBudAQAVlqq17S4lG0zx6wA2Q7aXZKiRnmQdbBHWcJ4cp1gP9gGg/Yayj23m4EY
 d26wkys+iyqWbrrjkWyahGw3yUcbQ3nRdF/s2WVEvo9TNyn+vUc6FBbQBW2krO9iI7I/UHSF6v/
 JRA3YIOEuViHSKqqCreu3TppTr9nX/tW5CHdu+rp+0HB1BGaPIYvBhCxfC+tSZ6rcOcz/uWZnZQ
 fbelbmjuZJsQ9Y2aZfcaHS9Pk9yAVq+3Tx8ZvniQQCmfxVL5qCbxfPKMLcc+5NXLCQvqAuKwUlY
 UfxbiY5cKWxOJlMbUc+hZRIMpu5vps8iZXu/XSMx5O5k6Nyhte1rLuOZOh32KAD45xPNvKGicub
 d1VbXqc9Y8kkE/xjRe5lchFpfYA9VBAAPatrWCMseRBJjQVhcsPUCeRkTwfjFTBCbE+6iKrWmix
 QQEi6xZswTTT354l1yAbB3QNtK7M42uzeDh+THTOiD5O3Rjpw2gU2UI
X-Received: by 2002:a05:6000:2503:b0:48c:7083:be67 with SMTP id
 ffacd0b85a97d-48dbace462emr15821467f8f.42.1791818341002; 
 Mon, 12 Oct 2026 08:19:01 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ab506bsm16935f8f.27.2026.10.12.08.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:19:00 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:19 +0200
Subject: [PATCH v2 26/50] tests/qtest: ds1339: cover the Century bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-26-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815521; l=3686;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=/UwwOgMrezr7gWWbisIg/npwXf+K73UBVrdeGOhT6D4=;
 b=BMQjhHEhJM96Dydf3SrrUcv4UzlD0zhtGSM+sbAn/w5+eTtqpQE1J8XOpgW6cFgxMaHEFmQ/V
 hKJomWLyBSxDiS1A0mQMNmTe5AQIkm0Sfz/u8eDEQ3JzSPbNUEUbHQZ
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.41; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f41.google.com
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

The Century bit had no coverage: neither its guest read/write
behaviour, nor the rule that only an elapsed rollover toggles it.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1339-test.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tests/qtest/ds1339-test.c b/tests/qtest/ds1339-test.c
index ac19ebd71d..8c144579e6 100644
--- a/tests/qtest/ds1339-test.c
+++ b/tests/qtest/ds1339-test.c
@@ -169,6 +169,62 @@ static void test_eosc_restart(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(resp[6], ==, 0x31);
 }
 
+/* The Century bit is guest-writable and survives an oscillator restart. */
+static void test_century_bit(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, DS1339_MONTH, 0x86); /* Century | June */
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_MONTH) & 0x80, ==, 0x80);
+
+    i2c_set8(i2cdev, DS1339_CONTROL, 0x18 | 0x80);
+    i2c_set8(i2cdev, DS1339_CONTROL, 0x18);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_MONTH) & 0x80, ==, 0x80);
+
+    i2c_set8(i2cdev, DS1339_MONTH, 0x06); /* June, century clear */
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_MONTH) & 0x80, ==, 0x00);
+}
+
+/* A guest write never toggles the Century bit. */
+static void test_century_write_no_toggle(void *obj, void *data,
+                                         QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, DS1339_MONTH, 0x86);
+    i2c_set8(i2cdev, DS1339_YEAR, 0x99);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_MONTH) & 0x80, ==, 0x80);
+    i2c_set8(i2cdev, DS1339_YEAR, 0x00);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_MONTH) & 0x80, ==, 0x80);
+
+    i2c_set8(i2cdev, DS1339_MONTH, 0x06);
+    i2c_set8(i2cdev, DS1339_YEAR, 0x99);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_MONTH) & 0x80, ==, 0x00);
+    i2c_set8(i2cdev, DS1339_YEAR, 0x00);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_MONTH) & 0x80, ==, 0x00);
+}
+
+/* A clock-driven year rollover from 99 to 00 toggles the Century bit. */
+static void test_century_rollover(void *obj, void *data,
+                                  QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    const uint8_t tod[7] = { 0x59, 0x59, 0x23, 0x01, 0x31, 0x12, 0x99 };
+    unsigned idx;
+
+    i2c_write_block(i2cdev, DS1339_SECONDS, tod, sizeof(tod));
+
+    for (idx = 0; idx < 50; idx++) {
+        if (i2c_get8(i2cdev, DS1339_YEAR) == 0x00) {
+            break;
+        }
+        g_usleep(100 * 1000);
+    }
+
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_YEAR), ==, 0x00);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_MONTH) & 0x80, ==, 0x80);
+}
+
 /* The register pointer wraps at the end of the map. */
 static void test_address_wrap(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -258,6 +314,10 @@ static void ds1339_register_nodes(void)
     qos_add_test("eosc-restart", "ds1339", test_eosc_restart, NULL);
     qos_add_test("stopped-reserved-bits", "ds1339",
                  test_stopped_reserved_bits, NULL);
+    qos_add_test("century-bit", "ds1339", test_century_bit, NULL);
+    qos_add_test("century-write-no-toggle", "ds1339",
+                 test_century_write_no_toggle, NULL);
+    qos_add_test("century-rollover", "ds1339", test_century_rollover, NULL);
     qos_add_test("address-wrap", "ds1339", test_address_wrap, NULL);
     qos_add_test("block-wrap", "ds1339", test_block_wrap, NULL);
     qos_add_test("alarm-registers", "ds1339", test_alarm_registers,

-- 
2.50.1


