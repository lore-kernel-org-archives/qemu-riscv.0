Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA66BCA9EC5
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:37:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGI4u-0001Aq-UH; Mon, 12 Oct 2026 11:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGI4m-0001A8-6u
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:36:33 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGI4i-0003O6-P9
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:36:31 -0400
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a168355946so17614625e9.0
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791819386; x=1792424186;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3XplpicYtnjwg/F/PhuqE/con32vEXnk067HsKJkOiY=;
 b=mHAJMsNboDcVpvrgp/oYQhnNTdAMOz4N1u8V7Z9JRFFGU1lCEy5usTftnH5w2ps+th
 ooDK8v+lS+hHecoicR/HPxWvxhtlk4kPZ1wkQxZ3tFQ6uhRnIkHylmyat3p5E8/Tgfup
 JK4X/3i9J7OHAK6nMJMyKiylBoVLarSSZXGmvV0w4CybJNChi5uI6X+sic3W0ucjBLjz
 56uGV7Ajr3V4v9PNlFbwI7L2k1nhFNJgAm/E3nWA4Rk9jTDCuuj+/TrNOappas34Zs1D
 bwWb4JBk9qPn+Li3eqaK/E4+AYEBG/y4zTqZporwu6CxUJmtbkanDiz84+48CcdJ+AJu
 XAqw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwsAzlOL5GiR9AkhxsItfKSQ8IT0OUTyeX8rRT7lAr9bh06BP7OAv6h0/oUbdkGm+B1JZZcC/WOESm3@nongnu.org
X-Gm-Message-State: AFq9FYIRb/L52abMjWRo7dvnk7ipy3KBq2LtZZkEd3ixqLhOa/2jyS4Y
 KClLjcJ7SxZTRIDn7jXcale5OtU0yptrEehu0qcWxs0qxAyDegj0D9V5
X-Gm-Gg: AYBFou1QkLhguSxJ3npEbibJ4zwdK3msWWvZU4gI3q4p2mV516c/csW2n81t3laINY6
 S1KvuR4yXOzpDB0F171W8h+9AhaW3/Bl8FQSY/nRYB8YuhLuPV9zjhej6aeggmlIT20uXGwTysb
 bbuaiwyUowRVlAXfF7nClyrXsbCKYhmEBn410WtocEqlY+zbpQAd1/lhggOfeWH39iOwAkG2rPN
 rDbO08OG2cGWpgs4lrJ/NvoheSXud76795jmGGWZv/J5T1Xw6euYaQrE8kyBgJOdJobYc+388jF
 ZiabOSrznrM7++3o5Mq07EJkw6mNsGXN3PpeCWwn+SCAAJWSSXQP1TM+RLjgsvZ8Bbb52woL5rJ
 MZ7OiSMlea4Kdrdrr0Fpc6yMuQbPaZcyrrMj3JeupPSVg/vK4BXwljFhvmgXhc02mHeqqw12fk1
 uyyy2lv2LtzuztGWQKgNqvlyJe/aDk6+1AoOWr8OPR9PlDcoWREY01Jjdf0LvYqR6pUgZqUhkDg
 BWlpfcZjs0wtzGRkABLLgUaXyVWPktKuWscJx1H3i0zwQ==
X-Received: by 2002:a05:600c:3488:b0:4a1:7690:d878 with SMTP id
 5b1f17b1804b1-4a18e4b8028mr195587315e9.17.1791819386106; 
 Mon, 12 Oct 2026 08:36:26 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf214a1sm340431605e9.7.2026.10.12.08.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:36:25 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:36 +0200
Subject: [PATCH v2 43/50] tests/qtest: ina238: cover the ALERT path and
 conversion-ready flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-43-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815522; l=6665;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=in5M3OrP79f45k7Uk1wA7KrYQ9pr2rECNsyuX2iK4go=;
 b=lPTDkqyx2BghMey/BI0wIZhMVQa4ufsY6iBk7KaIPkYXxxuFogIVDoCCKXbE+WJ1rHzcPAcKF
 rU09oHfyp2pA5eSTsJjp0rSmPfVIIq4OtqC7vlmv+uxYkgPBUi7cXj6
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.52; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f52.google.com
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

Cover the shunt/bus/temperature/power alert thresholds, the multi-alert
OR behaviour, the alert latch, the DIAG_ALRT control bits and the
conversion-ready (CNVRF) flag.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina238-test.c | 146 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 145 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/ina238-test.c b/tests/qtest/ina238-test.c
index 693139f988..08813377c9 100644
--- a/tests/qtest/ina238-test.c
+++ b/tests/qtest/ina238-test.c
@@ -306,7 +306,143 @@ static void test_overflow(void *obj, void *data, QGuestAllocator *alloc)
                     DIAG_MATHOF);
 }
 
-/* Shunt over-limit alert (transparent mode) */
+/* Shunt over-limit alert */
+static void test_alert_shunt(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_SOVL, 0x1000);
+
+    qmp_ina238_set("shunt-voltage", 5000000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_SHNTOL, ==, 0);
+
+    qmp_ina238_set("shunt-voltage", 97200000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_SHNTOL, ==,
+                    DIAG_SHNTOL);
+
+    qmp_ina238_set("shunt-voltage", 5000000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_SHNTOL, ==, 0);
+}
+
+/* Bus over-limit alert */
+static void test_alert_bus(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_BOVL, 0x1000);
+
+    qmp_ina238_set("bus-voltage", 12000000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_BUSOL, ==, 0);
+
+    qmp_ina238_set("bus-voltage", 48000000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_BUSOL, ==, DIAG_BUSOL);
+}
+
+/* Over-temperature alert */
+static void test_alert_temp(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_TEMP_LIMIT, 0x0A00);
+
+    qmp_ina238_set("die-temperature", 10000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_TMPOL, ==, 0);
+
+    qmp_ina238_set("die-temperature", 25000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_TMPOL, ==, DIAG_TMPOL);
+}
+
+/* Power over-limit alert */
+static void test_alert_power(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    qmp_ina238_set("shunt-voltage", 97200000);
+    qmp_ina238_set("bus-voltage", 48000000);
+    i2c_set16(dev, REG_SHUNT_CAL, 0x0FD2);
+
+    i2c_set16(dev, REG_PWR_LIMIT, 0x0100);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_POL, ==, DIAG_POL);
+
+    i2c_set16(dev, REG_PWR_LIMIT, 0x7FFF);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_POL, ==, 0);
+}
+
+/* Two thresholds crossed at once are reported simultaneously (multi-alert) */
+static void test_alert_multi(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t diag;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_SOVL, 0x1000);
+    i2c_set16(dev, REG_BOVL, 0x1000);
+
+    qmp_ina238_set("shunt-voltage", 97200000);
+    qmp_ina238_set("bus-voltage", 48000000);
+
+    diag = i2c_get16(dev, REG_DIAG_ALRT);
+    g_assert_cmphex(diag & DIAG_SHNTOL, ==, DIAG_SHNTOL);
+    g_assert_cmphex(diag & DIAG_BUSOL, ==, DIAG_BUSOL);
+}
+
+/* Latch mode holds the flag until the DIAG_ALRT register is read */
+static void test_alert_latch(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_SOVL, 0x1000);
+    i2c_set16(dev, REG_DIAG_ALRT, DIAG_ALATCH);
+
+    qmp_ina238_set("shunt-voltage", 97200000);
+    qmp_ina238_set("shunt-voltage", 5000000);
+
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_SHNTOL, ==,
+                    DIAG_SHNTOL);
+
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_SHNTOL, ==, 0);
+}
+
+/* DIAG_ALRT control bits are writable; status bits are read-only */
+static void test_diag_control(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t diag;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    i2c_set16(dev, REG_DIAG_ALRT,
+              DIAG_ALATCH | DIAG_CNVR | DIAG_SLOWALERT | DIAG_APOL);
+    diag = i2c_get16(dev, REG_DIAG_ALRT);
+    g_assert_cmphex(diag & DIAG_ALATCH, ==, DIAG_ALATCH);
+    g_assert_cmphex(diag & DIAG_CNVR, ==, DIAG_CNVR);
+    g_assert_cmphex(diag & DIAG_SLOWALERT, ==, DIAG_SLOWALERT);
+    g_assert_cmphex(diag & DIAG_APOL, ==, DIAG_APOL);
+    /* MEMSTAT stays set */
+    g_assert_cmphex(diag & DIAG_MEMSTAT, ==, DIAG_MEMSTAT);
+}
+
+/* Every DIAG_ALRT read clears CNVRF, whatever the alert-latch mode. */
+static void test_cnvrf(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    qmp_ina238_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_CNVRF, ==, DIAG_CNVRF);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_CNVRF, ==, 0);
+
+    i2c_set16(dev, REG_DIAG_ALRT, DIAG_ALATCH);
+    qmp_ina238_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_CNVRF, ==, DIAG_CNVRF);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_CNVRF, ==, 0);
+}
+
 static void ina238_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -329,5 +465,13 @@ static void ina238_register_nodes(void)
     qos_add_test("zero-cal", "ina238", test_zero_cal, NULL);
     qos_add_test("adcrange", "ina238", test_adcrange, NULL);
     qos_add_test("overflow", "ina238", test_overflow, NULL);
+    qos_add_test("alert-shunt", "ina238", test_alert_shunt, NULL);
+    qos_add_test("alert-bus", "ina238", test_alert_bus, NULL);
+    qos_add_test("alert-temp", "ina238", test_alert_temp, NULL);
+    qos_add_test("alert-power", "ina238", test_alert_power, NULL);
+    qos_add_test("alert-multi", "ina238", test_alert_multi, NULL);
+    qos_add_test("alert-latch", "ina238", test_alert_latch, NULL);
+    qos_add_test("diag-control", "ina238", test_diag_control, NULL);
+    qos_add_test("cnvrf", "ina238", test_cnvrf, NULL);
 }
 libqos_init(ina238_register_nodes);

-- 
2.50.1


