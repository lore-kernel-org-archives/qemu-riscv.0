Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CAAC79FA0
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:13:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3ctz-00028K-Rs; Mon, 07 Sep 2026 13:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cVO-0001TZ-BP
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:47:39 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cVL-0003qn-4U
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:47:37 -0400
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-482dbe4d247so2136191f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 09:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799653; x=1789404453;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ofy5Q7w1hiOQ65qRkRFvKTBxqy4svZeHJL4ReaZKNBI=;
 b=nqs0E7k8NVoFIO1XolABVgzVcaRjcCVrEVzI0LJ/RkgTjA7wQjWKK5RfGGHxUKVtFx
 1Tx1K78/lGgXxf+fsCrzBKF56guT8fPtl0+RerQybg566RnI9KWF/S4JJGegJCEM0uQE
 YIW4lAa0/9U4o4Ngq4dnGEvdIUA4XLKwfsZBkoaV9vN1byT5lA1KHyHmNvvoDdFBxgn0
 IYLFO28OIV3G4wyklB6E02lK7TBr7ZsTddoy5YKdLREk25QzjI9kBtpt67OsasGhOpwr
 J02le9+RcrgCkOMkvu22q2RqImTR0688Q3YmsA0VBhLKbDdx22n0GOvpU8Kvlc51vX5o
 MrJA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwg8ydROa8dCmRND47QlS2wmUltN40NtWg3o65ENGq80yCEzjcyUXLRRPYUnK3f3GtUXNzdvvvNGdsZ@nongnu.org
X-Gm-Message-State: AFuF++k3UwJb9G2t5di/aMlAp1n765fgWz5F+tNMl3xX6KkLXidpcxOl
 jVc7Zvk1TN2v02JTd1SQrFuvM6md1TnXQRf1q7OBb4r2AqtKwk6rDOJ9
X-Gm-Gg: AYBFou2NN5FhFJ/cOsmaT/VWMjNp1ZQ/C+IuoVuYvCEhOfy97UZvDH+tOmhXEXRnW0B
 NoVel1A1meo088rdxhwRzqM/F0jQdiSW+++JeH/TAsysBOh7SA9EjWIlw6+hC+i1Z+PDvcsBjew
 UJID2Ul1nQ8x6Dsi7aYLgWzAtbvA5drJnpmTTJaENrNvcB44XBehhtUwFQWcQRSB9ZTWsa/J6fr
 w+8Gq9uwonAgV73xy9ghsaWDNnr6iolw22HC+VyYAFF2zdZSL8tvzdIy2frjcupRdki0t0bv6we
 gJZhBgC4yYyycmqRdf9fZprq+VXhlUV81GmhMxKQIpXSnp7UoA3Rt6UxvfcLrdQPdSnsTuOG4mK
 rZR0w/4Abrqe5R23AWuHwy2iOoSV2sibETkiE0VTGV13btyrEYYjknMHxteLkL/aqkGBy+jUi3L
 gE4jj0MZtd5MRcuj8ZDPXbSMoFav/0S1xjmtWtxWbTEbKv+ggzFH9EOsuRL511EicJ6LyIqny8L
 D1kW4taIKpz5IH21KtRbQnQPQiN7RvIaNvcwOiYuyuuQA==
X-Received: by 2002:a05:6000:4796:b0:484:3312:f127 with SMTP id
 ffacd0b85a97d-4858709b371mr39745451f8f.27.1788799652619; 
 Mon, 07 Sep 2026 09:47:32 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885bfe14sm30173358f8f.35.2026.09.07.09.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:47:32 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:16 +0200
Subject: [PATCH 26/50] tests/qtest: ds1339: cover the Century bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-26-0d83ad610c3b@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799321; l=3686;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=/UwwOgMrezr7gWWbisIg/npwXf+K73UBVrdeGOhT6D4=;
 b=N6fnnAznNmfjWKA/VE1Pm7HkIlJMDde0pw2072nYiJT415TG6+vkLNOSANxYynvB5LBRwEXzR
 DRLCwwmBlTiDa58Rlp4RpAau0E9xpAOnuebfL+TWm3ASoc/X4yd/HRu
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.50; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f50.google.com
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


