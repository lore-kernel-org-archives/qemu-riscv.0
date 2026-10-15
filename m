Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDFDCC6B30
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:35:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIlQ-0003eA-1N; Thu, 15 Oct 2026 06:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIhF-0007eP-Ey
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:28:29 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIhB-0004KR-Uy
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:28:25 -0400
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a172eb31f0so44234135e9.1
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060100; x=1792664900;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OOFmzhwngATj5QXbK6+ilaV21N6JVdHVnASw6Lr12jc=;
 b=tAmsuG7KZADA8nVf7aKqcYUOOLNqzu7ptnEh+NK7seprm/Uf0dMlGYkMz04RpO/V0v
 jgnqt1KKXynVBIe4rmtvRZnZdxtaUoqgGDpPIzqaFzMQQ8CUB/rLEXfsAsNNm4zyo4Vk
 3pqupP7MSqah3JqvUUgXHB8LPfZRIhw0InHeqwAggdV30B6TRA46Vl9Fo2JUzjvUSkJW
 jQFKvIlRFSK8bQl2E7/4la3xoga8lrKohbaGHnZXV72uP7axh6kPA/G/8THREP+EV3HX
 NAYjL7847KYk1//QtfOck6bedqxJ7ekX0KDYaQou4ybfg5IRsuJQoe0JXljv9stnURmn
 DBVA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz+WnjaZatA2DtdDGr6u829sBRemVYsljivGf0JLxflDxeklisNZ1n+K7oWpmdCFZyWnBwuYyOfEBB4@nongnu.org
X-Gm-Message-State: AFq9FYLyx6d7/lXne9dmxeJagm6/SVnM0qNH8UcOO6eibrRdt5+hbxcE
 Artvic5lLXcRYPEIGy+hycbdvQ4w82gfZH0H31WHkc7CSAlM1oZ/wUN6
X-Gm-Gg: AYBFou3EmKxuqA5tSy1iLkosLHspn1ChVyhNrhHLTH5Zgg5uk7vf3nLj0O3MHaHtqba
 vhgEtR3VnIwpDzHVTHX7nVrEitANaK+SURrZ93lFW1kvupaf1caFrknp502rVQPrAqjTiEUdblC
 ognoG+dYrwcpwj2oerJ+JS/pwNJvMLpgyBSwqXLy1owiWmbxuPWBAxIivo7WHaetpqZXaZq8y3A
 MCmrt4VX14z3ARt9oWtw8sv+WribSVfr4XINZDIjSTEtrlJjeGNwAa/GXvSBQ0d2B5bZYf7QLhm
 CE0Kg+dHXufQjc/5x6eMAqoyyRKLBNol5cfalnd8Xwuxzr2EOvrCrIgNtfcByYqMEKuJIwoopNX
 EVc6Ehc5zUPnDyFHdja1zywmhLPcx54eVe8/PxWHVWg5wlrK7IzK3DXJ9t/0Ip795j/US3hjOva
 YRp9Mfsg6PmoGQUuq8GUPE+OV3CL8mnDOKqzMmY7mXl3yZZFmif45v4dwAe9W9nckruc5pF4KSa
 /AxvkeUMdFN9xZcdeYoRx9Vh4W7oSenA4xYtzVYK2oLnXs=
X-Received: by 2002:a05:600d:1b:b0:4a1:9661:14b7 with SMTP id
 5b1f17b1804b1-4a196611b9amr267914405e9.32.1792060100051; 
 Thu, 15 Oct 2026 03:28:20 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd66c5e6sm40366255e9.2.2026.10.15.03.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:28:19 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:24 +0200
Subject: [PATCH v3 37/50] tests/qtest: ina230: cover operating modes and
 triggered conversions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-37-7d50c8a108e5@free.fr>
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
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056476; l=5268;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=M/AP87tzHPyKIB2/isqSVgsUBIucUWr9P38+NmmmCT4=;
 b=Yg5mzoaTRKUYOwLQCo+DrFpSzZQ/xsxjaSNkp9VVBeOdH8mjTi6omkFfwMDnOncs48DVluoXG
 7BNCbFgGVXOAb22pR0PGra4CZsXz52fJQINZOtClEjyUXgkAKe3SUGH
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.41; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f41.google.com
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

Add coverage for the MODE field: power-down retains the last results,
the shunt/bus channel-enable bits gate which registers track new inputs,
triggered modes convert once per Config write, and bus-only mode still
derives power from the retained current.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina230-test.c | 95 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/ina230-test.c b/tests/qtest/ina230-test.c
index 36c899efee..4d601c74b5 100644
--- a/tests/qtest/ina230-test.c
+++ b/tests/qtest/ina230-test.c
@@ -142,7 +142,97 @@ static void test_config_wmask(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get16(dev, REG_CONFIG), ==, 0x7FFF);
 }
 
-/* Shunt voltage register, including two's-complement negatives */
+/* Operating modes */
+static void test_modes(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    static const struct {
+        uint8_t mode;
+        uint16_t shunt, bus, current, power;
+    } cases[] = {
+        /* Power-down: no conversion, every register retains the baseline */
+        { 0x0, 0x1F40, 0x2570, 0x2710, 0x12B8 },
+        { 0x4, 0x1F40, 0x2570, 0x2710, 0x12B8 },
+        /* Shunt only (continuous): shunt and current track the probe */
+        { 0x5, 0x0FA0, 0x2570, 0x1388, 0x12B8 },
+        /* Shunt and bus (continuous): every register tracks the probe */
+        { 0x7, 0x0FA0, 0x12C0, 0x1388, 0x04B0 },
+    };
+    size_t idx;
+
+    for (idx = 0; idx < ARRAY_SIZE(cases); idx++) {
+        i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+        i2c_set16(dev, REG_CALIBRATION, 0x0A00);
+        qmp_ina230_set("shunt-voltage", 20000000);
+        qmp_ina230_set("bus-voltage", 11980000);
+
+        i2c_set16(dev, REG_CONFIG, cases[idx].mode);
+        qmp_ina230_set("shunt-voltage", 10000000);
+        qmp_ina230_set("bus-voltage", 6000000);
+
+        g_assert_cmphex(i2c_get16(dev, REG_SHUNT), ==, cases[idx].shunt);
+        g_assert_cmphex(i2c_get16(dev, REG_BUS), ==, cases[idx].bus);
+        g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, cases[idx].current);
+        g_assert_cmphex(i2c_get16(dev, REG_POWER), ==, cases[idx].power);
+    }
+}
+
+/*
+ * Triggered modes perform exactly one conversion per trigger, where the
+ * trigger is a Configuration-register write. Injected input changes
+ * between triggers are ignored until the next write.
+ */
+static void test_triggered(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_CALIBRATION, 0x0A00);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+    qmp_ina230_set("bus-voltage", 11980000);
+
+    i2c_set16(dev, REG_CONFIG, 0x03);
+    g_assert_cmphex(i2c_get16(dev, REG_SHUNT), ==, 0x1F40);
+    g_assert_cmphex(i2c_get16(dev, REG_BUS), ==, 0x2570);
+
+    qmp_ina230_set("shunt-voltage", 10000000);
+    qmp_ina230_set("bus-voltage", 6000000);
+    g_assert_cmphex(i2c_get16(dev, REG_SHUNT), ==, 0x1F40);
+    g_assert_cmphex(i2c_get16(dev, REG_BUS), ==, 0x2570);
+
+    i2c_set16(dev, REG_CONFIG, 0x03);
+    g_assert_cmphex(i2c_get16(dev, REG_SHUNT), ==, 0x0FA0);
+    g_assert_cmphex(i2c_get16(dev, REG_BUS), ==, 0x12C0);
+
+    i2c_set16(dev, REG_CONFIG, 0x07);
+    qmp_ina230_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_SHUNT), ==, 0x1F40);
+}
+
+/*
+ * In a bus-only mode the current register is retained, but the power register
+ * is still refreshed on each bus conversion from that retained current.
+ */
+static void test_bus_only_power(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_CALIBRATION, 0x0A00);
+    qmp_ina230_set("shunt-voltage", 20000000);
+    qmp_ina230_set("bus-voltage", 11980000);
+    g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x2710);
+
+    i2c_set16(dev, REG_CONFIG, 0x06);
+    qmp_ina230_set("bus-voltage", 6000000);
+
+    g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x2710);
+    g_assert_cmphex(i2c_get16(dev, REG_BUS), ==, 0x12C0);
+    g_assert_cmphex(i2c_get16(dev, REG_POWER), ==, 0x0960);
+}
+
+/* Shunt voltage register */
 static void test_shunt_injection(void *obj, void *data, QGuestAllocator *alloc)
 {
     QI2CDevice *dev = (QI2CDevice *)obj;
@@ -377,6 +467,9 @@ static void ina230_register_nodes(void)
     qos_add_test("defaults", "ina230", test_defaults, NULL);
     qos_add_test("soft-reset", "ina230", test_soft_reset, NULL);
     qos_add_test("config-wmask", "ina230", test_config_wmask, NULL);
+    qos_add_test("modes", "ina230", test_modes, NULL);
+    qos_add_test("triggered", "ina230", test_triggered, NULL);
+    qos_add_test("bus-only-power", "ina230", test_bus_only_power, NULL);
     qos_add_test("shunt-injection", "ina230", test_shunt_injection, NULL);
     qos_add_test("bus-injection", "ina230", test_bus_injection, NULL);
     qos_add_test("shunt-limits", "ina230", test_shunt_limits, NULL);

-- 
2.53.0-Meta


