Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCBCCA9ED1
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:38:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGI6O-0001gY-2Z; Mon, 12 Oct 2026 11:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGI5k-0001T8-Nl
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:37:38 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGI5h-0003Un-Fo
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:37:32 -0400
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49ff680331aso16175635e9.3
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791819447; x=1792424247;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Fhp3wv+1ffAiyOIOMf1hqrOLyXTWHsYqm0QrDErev70=;
 b=v6YuYv7e8gQCW5iHyICApzkIqRk6lJyqyhnWBlSqHjeQTLJc7E14EgrdPHEL31ljul
 RJWZJ0BbzprsTaihoQYO6WDlmobyzYW4R5ZczhT8rrCXnDB82n2TpOZzoL/rr5eQ6Kl0
 +nU9cFrwg3lJTaykMqbDAjJ21sUxQOa4x3FVg7YdMPN3ekAW9izumoDXXRaszmioQL+i
 xLsz3BGPEz0lMXXc8RT7eO1E6vkKOAjKhFvUuSd4O0v0bW7gu5y+GbzYW926iGOhKywg
 3DRjGsDQ5RjEteQm2Vfs9WBnTZM1E58NGl/aX9oGhCXYeeQqWoJ+K930YfGqVRsP5He/
 JTew==
X-Forwarded-Encrypted: i=1;
 AKwUvBxiDrvGP3lr0Xr2Kyftgkzk+2jE3fCefQLi9iYQTPEiG5O0UMX5XX+HBWJPS+hP/ORbrXvYZbbSYRAT@nongnu.org
X-Gm-Message-State: AFq9FYLfKFqOf1XAU+POvcWEqghtzxxpWocwAlsU8HQNUN2DUTukl2El
 F4hmDtCaKnmclO+QBSjjNctdSICB0B15H1F7EJzbd8dIxndp5ZkJ22fi
X-Gm-Gg: AYBFou2/1dGRrnYCSWEAW1/7wZqxATbZ/qprjXycHdlwPT0HKboSm+PvjsvzPOB3jRz
 oyFqhU5FgRf0fR99kw8cw4RfrekWWxFmnpEcZ2mP9bkCgcybrBBUT/q/Th6TYGC88figg8dDynv
 2ZCznPC4wDvJyOeHSx66ZfqNfqVSwRgPpyA3PZm6eySWd1MjlBlcTwf+pBkmHREpb1pN8csbHUr
 GGFE5mXeupxI3MHgfJUlQ5EY5CPD4myrxtkv9Vu0b3xpfp/GDwy0MgcZDWixhl0KjOexx23WQlu
 FoYfaGx3dV/qNmNY46sP+KS984WXdeJCsmGUm6c/OnRXnvxo4Lf9O0sYCnvAyy37VBqI/mCFUdi
 RFRyz5A3fgTwqihHosprZ+g8rS/giqSSvrgKr3MUoPWxwPF1njAFH5N7T+sUJH5HwsqOebYOK+6
 sZCDq1JCs/hfYMkqoN9NZ/JgF3Q0ugzqGKUcsS///nTAqOJ5GL3xaG2W+zH8+UusZTq6qvc8Tag
 YkH29eyq4zTcK24rhWwLVpTz5/Iq7GafNaFwJQqHN1b/Q==
X-Received: by 2002:a05:600c:620f:b0:49f:dc71:e609 with SMTP id
 5b1f17b1804b1-4a18e499874mr178712715e9.20.1791819447221; 
 Mon, 12 Oct 2026 08:37:27 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf2e0dbsm314783575e9.11.2026.10.12.08.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:37:26 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:37 +0200
Subject: [PATCH v2 44/50] tests/qtest: ina238: cover the injection-property
 limits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-44-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815522; l=5321;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=JgwMXMS8XORDALoqQbGBJ4suPCUY8Bpl7Mu6Xt66s/I=;
 b=KcLhAcJG532wxOFfBCNz7nnWV8CurTa9x+WvY+eexQKyoq5Wqn+4GDuJo++iv4dS5w87vGxq1
 HF1p4cn2991Ar4nG9JrM1fRr3YznpSXy2FazfOP4fnDFj4S+gPZgUtM
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.44; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f44.google.com
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

Verify that the extremes of the shunt-voltage, bus-voltage and
die-temperature injection ranges round-trip through the QOM property
without truncation or wraparound, and that values just outside are
rejected rather than silently wrapped.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina238-test.c | 84 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/tests/qtest/ina238-test.c b/tests/qtest/ina238-test.c
index 08813377c9..74912424c0 100644
--- a/tests/qtest/ina238-test.c
+++ b/tests/qtest/ina238-test.c
@@ -67,6 +67,13 @@
 #define MANUFACTURER_ID_VAL 0x5449
 #define DEVICE_ID_VAL       0x2381
 
+/* Injection-property limits (see ina238.c) */
+#define SHUNT_MIN_NV        (-163840000) /* -32768 * 5 uV  */
+#define SHUNT_MAX_NV        163835000    /*  32767 * 5 uV  */
+#define BUS_MAX_UV          85000000     /* 27200 * 3.125 mV */
+#define TEMP_MIN_MC         (-40000)     /*  -320 * 125 m-degC */
+#define TEMP_MAX_MC         125000       /*  1000 * 125 m-degC */
+
 /* Read the 24-bit POWER register (MSB first) */
 static uint32_t i2c_get24(QI2CDevice *dev, uint8_t reg)
 {
@@ -103,6 +110,18 @@ static int qmp_ina238_get(const char *property)
     return ret;
 }
 
+/* A qom-set expected to be rejected (value outside the supported range) */
+static void qmp_ina238_set_fail(const char *property, int64_t value)
+{
+    QDict *resp;
+
+    resp = qmp("{ 'execute': 'qom-set', 'arguments':"
+               " { 'path': %s, 'property': %s, 'value': %lld } }",
+               INA238_TEST_ID, property, (long long)value);
+    g_assert(qdict_haskey(resp, "error"));
+    qobject_unref(resp);
+}
+
 /* Power-on-reset default values and the ID registers */
 static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -443,6 +462,68 @@ static void test_cnvrf(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_CNVRF, ==, 0);
 }
 
+/* Shunt-voltage injection limits */
+static void test_shunt_limits(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    qmp_ina238_set("shunt-voltage", SHUNT_MAX_NV);
+    g_assert_cmphex(i2c_get16(dev, REG_VSHUNT), ==, 0x7FFF);
+    g_assert_cmpint(qmp_ina238_get("shunt-voltage"), ==, SHUNT_MAX_NV);
+
+    qmp_ina238_set("shunt-voltage", SHUNT_MIN_NV);
+    g_assert_cmphex(i2c_get16(dev, REG_VSHUNT), ==, 0x8000);
+    g_assert_cmpint(qmp_ina238_get("shunt-voltage"), ==, SHUNT_MIN_NV);
+
+    qmp_ina238_set_fail("shunt-voltage", (int64_t)SHUNT_MAX_NV + 1);
+    qmp_ina238_set_fail("shunt-voltage", (int64_t)SHUNT_MIN_NV - 1);
+    g_assert_cmpint(qmp_ina238_get("shunt-voltage"), ==, SHUNT_MIN_NV);
+    g_assert_cmphex(i2c_get16(dev, REG_VSHUNT), ==, 0x8000);
+}
+
+/* Bus-voltage injection limits */
+static void test_bus_limits(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    qmp_ina238_set("bus-voltage", 0);
+    g_assert_cmphex(i2c_get16(dev, REG_VBUS), ==, 0x0000);
+
+    qmp_ina238_set("bus-voltage", BUS_MAX_UV);
+    g_assert_cmphex(i2c_get16(dev, REG_VBUS), ==, 0x6A40);
+    g_assert_cmpint(qmp_ina238_get("bus-voltage"), ==, BUS_MAX_UV);
+
+    qmp_ina238_set_fail("bus-voltage", (int64_t)BUS_MAX_UV + 1);
+    qmp_ina238_set_fail("bus-voltage", -1);
+    g_assert_cmpint(qmp_ina238_get("bus-voltage"), ==, BUS_MAX_UV);
+    g_assert_cmphex(i2c_get16(dev, REG_VBUS), ==, 0x6A40);
+}
+
+/* Die-temperature injection limits */
+static void test_temp_limits(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    qmp_ina238_set("die-temperature", TEMP_MAX_MC);
+    g_assert_cmphex(i2c_get16(dev, REG_DIETEMP), ==, 0x3E80);
+    g_assert_cmpint(qmp_ina238_get("die-temperature"), ==, TEMP_MAX_MC);
+
+    qmp_ina238_set("die-temperature", TEMP_MIN_MC);
+    g_assert_cmphex(i2c_get16(dev, REG_DIETEMP), ==, 0xEC00);
+    g_assert_cmpint(qmp_ina238_get("die-temperature"), ==, TEMP_MIN_MC);
+
+    qmp_ina238_set_fail("die-temperature", (int64_t)TEMP_MAX_MC + 1);
+    qmp_ina238_set_fail("die-temperature", (int64_t)TEMP_MIN_MC - 1);
+    g_assert_cmpint(qmp_ina238_get("die-temperature"), ==, TEMP_MIN_MC);
+    g_assert_cmphex(i2c_get16(dev, REG_DIETEMP), ==, 0xEC00);
+}
+
 static void ina238_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -459,6 +540,9 @@ static void ina238_register_nodes(void)
     qos_add_test("shunt-injection", "ina238", test_shunt_injection, NULL);
     qos_add_test("bus-injection", "ina238", test_bus_injection, NULL);
     qos_add_test("temp-injection", "ina238", test_temp_injection, NULL);
+    qos_add_test("shunt-limits", "ina238", test_shunt_limits, NULL);
+    qos_add_test("bus-limits", "ina238", test_bus_limits, NULL);
+    qos_add_test("temp-limits", "ina238", test_temp_limits, NULL);
     qos_add_test("calibration-current", "ina238", test_calibration_current,
                  NULL);
     qos_add_test("power", "ina238", test_power, NULL);

-- 
2.50.1


