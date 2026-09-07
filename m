Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8F9C79F99
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:14:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3ctp-0001xz-6J; Mon, 07 Sep 2026 13:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cVB-0001Pf-5B
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:47:31 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cV9-0003p5-3d
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:47:24 -0400
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso32066005e9.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 09:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799641; x=1789404441;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9Z7GCM1tL+WVU4df/9TtqoR10rm4Dif9ExOLVyo6FeE=;
 b=TzOXtg7T0ZZhAAOeUg0TMfBeS957gMnKT7e//RyA2Fr6SugbIHrUPMewNzTI9oqOE6
 H/7jjJq7IR0+6zdfBOWaKYVOQks61Z1Z4MRKjW2GUyRL8sv0cAt28wgUj50b/OVNb8v9
 U2cl48jGN7kx0ZmakE9J3i2O/cYsv/diXMQNI1sxin1m96omELZekdXh1VQ4B81Deg+l
 RUumdFwCDzo51Sy3SYQT7q/Qh8jT9iObvoSoAzoLYIUmaSLEzvXge+5aa8JZfJQnWPGb
 neitNrLmvZIt+/KDTC44Jr2/gUZBbDOkK18gtS5g7hUvt70J6hOYw4F5b/aKv1ZGM9Qh
 BY9w==
X-Forwarded-Encrypted: i=1;
 AKwUvByCtDH0SQpqc4+3KvLhgdY0KExLrgBZiP1kcznJQtVR8nF8LR9x13Cj/l03sT4/RCARDb5Rihsi/K83@nongnu.org
X-Gm-Message-State: AFuF++n+s/6L8YJ/a5tewxP79+c1u/hCQfOwEyXy6x825mQK/OmcTe8p
 oWUVKZuNgS1bxhM5/5aFjkf+vSW2r0xmiwYLRhH7QERJdj4w3RCg7E3g
X-Gm-Gg: AYBFou0f3muqf8NgvOvAubWCPb5l8/dx0togCKUUverzcu2unX1aDmj+MuRPf+J6yNk
 /Tp0tOTP0ik6O0c36+B4dbXgStUP8GMEZkehYO25NaEefswu6mNA0tC2MqFcr6DftacIODj7V/E
 g0sZevsBD/YPZsQiR0vZjD0yATi7IKGQmbd5XGnXfONsX9VfBBANSf+3tmXs3ys3klmtOXoJLSd
 Bj3zTxj4pQjjrsBkwMN61eZNmfhDo8PlluaxKES5ATBePAWOT5E/Snc+8FS9I92+wYmipKfM0tz
 W9iXXFRVWpla6PWoZbE28XzYiPHC3vDYbwnKJt7fMsi738IlN/opkb3S/CHHphwUgnWut0Un8y2
 Prdtp7ZE87MUuRLShJVGRcgvFLxZiUNUNU5yNQqpTcmVyfVsM3oZF/TdbOWv2a2AEtTUmxBReQz
 OBYM72otylhpsj7NQCTdSqdtIYuvhjJUhslHs/ZXaM5y1nGi2Q655atruZGRR8NJ9UA5gT+LMBJ
 9/IJImZ736qD6EUr7UfaLJQSX/dI/ZLFhk=
X-Received: by 2002:a05:600c:8b8c:b0:49c:e3ad:41d3 with SMTP id
 5b1f17b1804b1-49cf7f4aea6mr227666265e9.0.1788799641377; 
 Mon, 07 Sep 2026 09:47:21 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf772692dsm383628135e9.10.2026.09.07.09.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:47:20 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:15 +0200
Subject: [PATCH 25/50] tests/qtest: ds1339: cover oscillator stop/restart
 and time programming
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-25-0d83ad610c3b@free.fr>
References: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
In-Reply-To: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799321; l=3342;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=esijdRHOnlyhX21Z9j9OPDDssjLY1EB+c0uBQYJ2KSk=;
 b=hpZohmErGnafbPmY6SrCvDNdZC15IjJYRUesdKtybWDwS25NNzThv9DYNZs6LYKCAnV4HDSSy
 ibW6g3IcybwBL3Ppe+9LZLnImxtUxolek31t+7ctZJ/jjoJn1s7p4Au
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.42; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f42.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Sep 2026 13:12:51 -0400
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

Stopping and restarting the oscillator had no coverage, nor did the
time the clock resumes from.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1339-test.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/qtest/ds1339-test.c b/tests/qtest/ds1339-test.c
index e9dcdc36da..ac19ebd71d 100644
--- a/tests/qtest/ds1339-test.c
+++ b/tests/qtest/ds1339-test.c
@@ -121,6 +121,54 @@ static void test_stopped_reserved_bits(void *obj, void *data,
     g_assert_cmphex(resp[6], ==, 0xff);
 }
 
+/* Setting EOSC stops the oscillator and sets OSF; OSF outlives the restart. */
+static void test_eosc(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, DS1339_STATUS, 0x00);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF, ==, 0);
+
+    i2c_set8(i2cdev, DS1339_CONTROL, 0x18 | 0x80);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF,
+                    ==, DS1339_STATUS_OSF);
+
+    i2c_set8(i2cdev, DS1339_CONTROL, 0x18);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF,
+                    ==, DS1339_STATUS_OSF);
+    i2c_set8(i2cdev, DS1339_STATUS, 0x00);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF, ==, 0);
+}
+
+/* A stopped clock resumes from the time it was programmed with. */
+static void test_eosc_restart(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    /* 10:20:30 on the 12th of July 2031, the day counter reading 2. */
+    const uint8_t tod[7] = { 0x30, 0x20, 0x10, 0x02, 0x12, 0x07, 0x31 };
+    uint8_t resp[7];
+    unsigned idx;
+
+    i2c_set8(i2cdev, DS1339_CONTROL, 0x18 | 0x80);
+    i2c_write_block(i2cdev, DS1339_SECONDS, tod, sizeof(tod));
+
+    i2c_read_block(i2cdev, DS1339_SECONDS, resp, sizeof(resp));
+    g_assert_cmpmem(resp, sizeof(resp), tod, sizeof(tod));
+
+    i2c_set8(i2cdev, DS1339_CONTROL, 0x18);
+    /* The seconds counter steps within a second of the restart. */
+    for (idx = 0; idx < 15 && i2c_get8(i2cdev, DS1339_SECONDS) == 0x30; idx++) {
+        g_usleep(100 * 1000);
+    }
+
+    i2c_read_block(i2cdev, DS1339_SECONDS, resp, sizeof(resp));
+    g_assert_cmpuint(from_bcd(resp[0]), >, 30);
+    g_assert_cmphex(resp[2], ==, 0x10);
+    g_assert_cmphex(resp[4], ==, 0x12);
+    g_assert_cmphex(resp[5] & 0x1f, ==, 0x07);
+    g_assert_cmphex(resp[6], ==, 0x31);
+}
+
 /* The register pointer wraps at the end of the map. */
 static void test_address_wrap(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -206,6 +254,8 @@ static void ds1339_register_nodes(void)
     qos_add_test("control-register", "ds1339", test_control_register, NULL);
     qos_add_test("status-register", "ds1339", test_status_register, NULL);
     qos_add_test("osf-write-protect", "ds1339", test_osf_write_protect, NULL);
+    qos_add_test("eosc", "ds1339", test_eosc, NULL);
+    qos_add_test("eosc-restart", "ds1339", test_eosc_restart, NULL);
     qos_add_test("stopped-reserved-bits", "ds1339",
                  test_stopped_reserved_bits, NULL);
     qos_add_test("address-wrap", "ds1339", test_address_wrap, NULL);

-- 
2.50.1


