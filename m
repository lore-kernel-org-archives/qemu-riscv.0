Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25436CC6B33
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:37:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIla-0004pm-Mx; Thu, 15 Oct 2026 06:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIiM-0008PC-SL
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:29:36 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIiJ-0004bK-JV
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:29:34 -0400
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48c02782159so3120419f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060170; x=1792664970;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GgVTUxuGD9oTRYIDiMSJ0REbd9D3oR+ntYCQl5qLzoc=;
 b=J+GwSEUQqv3qyq6eK0H82P1mGC+AdWp/dx7ZF8XMuK7tGsWuzHN5F2Ejs8sWvzFk2O
 TrhGL4alOQ0c1zvJRvYALMJS4i9Jp4kJaqv5Knz7GPa05vGOmWJMDs7HdTCumy0/l4CX
 kNsLJzGliZcTAHWt5j1rDIvK+/Aww4PNsPDsLjznJMaQxtCeb5m520LAyT8kW53CzDuY
 u793mYwz2PI1U7XJ4B1sLNhPVnstt6ZdML2NEDZfAsA/N84WjEgsgjKJDXJt+3B95jqc
 5oVpw7bmCaC/nyikx+QHkMCrKaVJfgaU+WIw3RibHsjetSdRXLjVnj3j2ppveDsbrGl6
 QmWw==
X-Forwarded-Encrypted: i=1;
 AKwUvBywJmnckt1UT/I8i9bFG96Mgy86HZtJ4HYkWdzJM2rjQnGoh9wM3BZp5SLsY6cG5VAX8gKi89gV6YSi@nongnu.org
X-Gm-Message-State: AFq9FYKg1VNkdWuWlmyRHNVntj+UFzT9ULq9oZM/oO85c7vgbuzO7Mgb
 VDeGy5Y7J17rpoG6VjrCHNNnuBIN5+WbhCxt0Yp3mHadtR1OszX8gnFKiCk9vg==
X-Gm-Gg: AYBFou0ouc/uiMr4PsvTl42VJru0QtbrfgBbBauXu3FBL9CNdw5U9obnTB0ilwV6RfI
 BQayJOYY68EpXR9/b5FfiCtdvfJa4+GheXojGzEroqAOQtXjUMGYl3vfy32IVnJe/tOFu3yNKNp
 0jlojj1ffAd7aJhfpRrb6tMcHBdFdzJre7ZyK2v+kayHqQcxU/eHFUCc3B1hUQgr4sq8mvnkzJ3
 iu6LpL/bGIwGdg+a/T5sguqPn33vpHRqckFGin+tIxSYvXNmGg+u3hQbi1xkoaSsG8PbkB9Pi4O
 Vltv173YpKUjdhDOgafUYzg2oK5tRzwp2ah7Kp+Jsp+BMqgFT/RqywAAl86EUS4Fmo49wOqYI2f
 Fz3amvXNI1A0gIHWqYDsShTn0HGlnbrYaV5lXoz6WPRoY0xREke/OIqbJx3ULPzUFrMmjIhf5+z
 pEQQk26JPsRsJ7bBlQ8hWcYNuXNzQHDASDw/weutjdzWy3Wjsw3IvoyB62PjBWfweLZGbhfzRYX
 3YYb2s0yVZev8Ndy69FmAze2NSV/1bfjnSYCVweeglT8Q==
X-Received: by 2002:adf:e009:0:10b0:48c:7dac:8957 with SMTP id
 ffacd0b85a97d-48dbacda6b7mr26548472f8f.32.1792060169949; 
 Thu, 15 Oct 2026 03:29:29 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48df3cbb78asm4380945f8f.48.2026.10.15.03.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:29:29 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:34 +0200
Subject: [PATCH v3 47/50] tests/qtest: ina238: cover a cleared calibration
 per channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-47-7d50c8a108e5@free.fr>
References: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
In-Reply-To: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
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
 Emmanuel Blot <emmanuel.blot@free.fr>, Glenn Miles <milesg@linux.ibm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056477; l=4102;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=2gZSb8/zG9OIbMPLJl7bRBev6cgnZtrY0rkeYgdq44I=;
 b=wNIc+sVHCxAllJTqaogpZtOhqWDui41nSrmTwkeit3qftZL+w+Lh3IRGHnvq+HUl4OejmKpUx
 NBiSh83jIlQC+gRWDzSUqwbYkXncwCvzgZw0cCxOpv7Yssyman1hCBj
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.49; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f49.google.com
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

Verify that without a calibration value the current and power
registers read zero, whichever channels the mode converts.

Reviewed-by: Glenn Miles <milesg@linux.ibm.com>
Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina238-test.c | 48 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/qtest/ina238-test.c b/tests/qtest/ina238-test.c
index e7dd50a822..4e4146461c 100644
--- a/tests/qtest/ina238-test.c
+++ b/tests/qtest/ina238-test.c
@@ -282,6 +282,30 @@ static void test_zero_cal(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmpuint(i2c_get24(dev, REG_POWER), ==, 0);
 }
 
+/* Clearing SHUNT_CAL zeroes both derived registers in any mode */
+static void test_zero_cal_channels(void *obj, void *data,
+                                   QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    static const uint16_t modes[] = { 0x9000, 0xA000, 0xF000 };
+    size_t idx;
+
+    for (idx = 0; idx < ARRAY_SIZE(modes); idx++) {
+        i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+        i2c_set16(dev, REG_SHUNT_CAL, 0x0FD2);
+        qmp_ina238_set("shunt-voltage", 97200000);
+        qmp_ina238_set("bus-voltage", 48000000);
+        g_assert_cmphex(i2c_get16(dev, REG_CURRENT), !=, 0x0000);
+        g_assert_cmpuint(i2c_get24(dev, REG_POWER), !=, 0);
+
+        i2c_set16(dev, REG_ADC_CONFIG, modes[idx]);
+        i2c_set16(dev, REG_SHUNT_CAL, 0x0000);
+
+        g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x0000);
+        g_assert_cmpuint(i2c_get24(dev, REG_POWER), ==, 0);
+    }
+}
+
 /* ADCRANGE changes the shunt LSB, not the current divisor. */
 static void test_adcrange(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -458,6 +482,27 @@ static void test_alert_power(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_POL, ==, 0);
 }
 
+/* Clearing SHUNT_CAL drops the power alert with the power reading */
+static void test_alert_power_zero_cal(void *obj, void *data,
+                                      QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    qmp_ina238_set("shunt-voltage", 97200000);
+    qmp_ina238_set("bus-voltage", 48000000);
+    i2c_set16(dev, REG_SHUNT_CAL, 0x0FD2);
+    i2c_set16(dev, REG_PWR_LIMIT, 0x0100);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_POL, ==, DIAG_POL);
+
+    /* Continuous shunt-only: the power register is not reconverted. */
+    i2c_set16(dev, REG_ADC_CONFIG, 0xA000);
+    i2c_set16(dev, REG_SHUNT_CAL, 0x0000);
+
+    g_assert_cmpuint(i2c_get24(dev, REG_POWER), ==, 0);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_POL, ==, 0);
+}
+
 /* Two thresholds crossed at once are reported simultaneously (multi-alert) */
 static void test_alert_multi(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -733,6 +778,7 @@ static void ina238_register_nodes(void)
                  NULL);
     qos_add_test("power", "ina238", test_power, NULL);
     qos_add_test("zero-cal", "ina238", test_zero_cal, NULL);
+    qos_add_test("zero-cal-channels", "ina238", test_zero_cal_channels, NULL);
     qos_add_test("adcrange", "ina238", test_adcrange, NULL);
     qos_add_test("mode-shutdown", "ina238", test_mode_shutdown, NULL);
     qos_add_test("mode-triggered", "ina238", test_mode_triggered, NULL);
@@ -742,6 +788,8 @@ static void ina238_register_nodes(void)
     qos_add_test("alert-bus", "ina238", test_alert_bus, NULL);
     qos_add_test("alert-temp", "ina238", test_alert_temp, NULL);
     qos_add_test("alert-power", "ina238", test_alert_power, NULL);
+    qos_add_test("alert-power-zero-cal", "ina238", test_alert_power_zero_cal,
+                 NULL);
     qos_add_test("alert-multi", "ina238", test_alert_multi, NULL);
     qos_add_test("alert-latch", "ina238", test_alert_latch, NULL);
     qos_add_test("alert-latch-persist", "ina238", test_alert_latch_persist,

-- 
2.53.0-Meta


