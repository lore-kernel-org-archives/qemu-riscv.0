Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFF6CA9EC5
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:28:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHwA-0003t3-3u; Mon, 12 Oct 2026 11:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHvs-0003mu-0n
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:27:21 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHvm-0001mA-By
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:27:17 -0400
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-486e70f2457so886748f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791818833; x=1792423633;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yMnW4a8crPYO2wOiMAzPMEvePpA+mW750LYZ6d0wg08=;
 b=Iagj1MnfVevn3f3sy3uOILlsdJRTImWhQcILMQr75yAQ1uJPhZvewdlhbFYk6AMqz8
 W4s5uUhXRN8M0TgPZgJ6NfQWX4IWZHN+xT1zNB05YyQrtMLiYsCfdW0e6cX0z/O5jMIX
 aC/+2vRZYObZy3deKsdKXZWEdhvoAq+BgHBPx8F3+831Nb++c1wa1rkTmxJaJPSUXH/j
 yK/wWdN4j+Lz2r48svtbAdm+YtH0FNn+3jblmi8gtRoox23+4UE5ibXgoegj7zZVzpQ6
 b5Ad2jip2Y4CIGLY8WE5bxdVn2IzqDwBmKgrXOYFRiK0vS8Ax5JR+mgF+OoCVXI1m8yN
 EIbg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxPat0n8uVR+CVDBfXlVKRiShmQKZekznamnVEIhlIGzbY6DzMYqXLviNvacCU+FWavMGidYidZadkQ@nongnu.org
X-Gm-Message-State: AFq9FYJmD5nxAJ1uiNnY0dvPY0PFaQcMz/PZzXoPmWCmOg8MG7q764Ln
 PcMeInvQ2AjvkmQQxINzxdmJImacRhj+iHF3//XUPaGI+cby+150DcY1
X-Gm-Gg: AYBFou1TQoYf8q6Q1vBW0Dly2P/P0eCwAlU+4RQ2f4UZDMOW8KheZM/fJR0peZCeJPW
 +nB9sCx0uVdjHKSZIv085JYjfK/ldQKfMP+QY+MEkRbi1yQWVkU1/OHskEuKcoTluSsUiXVuKHw
 VFVHFAL6WqnfnOfs9W1QoRBovCeOUx3wCGeFWo1CHKqJbFPmSDIighh4XwhHrlPtZW2/DWntSs3
 Q8I3+kjq0ExCoM//26z3mBn2DK+bZ5++9+VowBOV8tO5ecPdX55l43CZQsWFCfqcKig0Z56NYYo
 1yeVaayhopMUhoBAW1vQ1b2ol2h17GJcKzV3xNwMQ3hNCLSJjs8cCUjuGJrsPdqwbWjvL+ymecc
 d53JpgelWv1B3GARbOGeLBo0/qrpZUHWZK4YKGRnBB2xb7zJS3F8Ar/L1KtZ+z2znMYt/TFeRiO
 h80jY/2xHqwZ89hud669F/vBlxeVvujPwlT6GnNEhAY32qbWTsbMjj4MU5jhQq8DimrA0ZpHpyy
 WbsnHnEP4GTw7cvRM4qFnGnQAcs239twJNrOObkVjJwdA==
X-Received: by 2002:adf:f341:0:b0:487:197a:5c1f with SMTP id
 ffacd0b85a97d-48dbaae84e0mr14930321f8f.49.1791818832771; 
 Mon, 12 Oct 2026 08:27:12 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bd733fsm21996f8f.58.2026.10.12.08.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:27:12 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:27 +0200
Subject: [PATCH v2 34/50] tests/qtest: ina230: cover voltage injection and
 power derivation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-34-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815521; l=5751;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=Lxa/vLTiqltAne2a9oGEC4v4uDweYMzTuPg2HL1aV2c=;
 b=qlM2sMAwtWBpe7RscPECgWxplCp5Dir6hNCtOQM4g5waAub3h+xyXuVvKg5qB4o2bJsPFZExO
 JeufTS4x2rNDXRK29THBkdLWGuYJux4qfT4d4XyUflzmQoUigIGGwpq
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.46; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f46.google.com
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

Cover the shunt- and bus-voltage injection properties and the current
and power values the device derives from them through the Calibration
register, including the zero-calibration case and the clamp/overflow
edges.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina230-test.c | 124 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/tests/qtest/ina230-test.c b/tests/qtest/ina230-test.c
index f7aefd2d97..b01f9445d1 100644
--- a/tests/qtest/ina230-test.c
+++ b/tests/qtest/ina230-test.c
@@ -49,6 +49,33 @@
 
 #define DIE_ID_VAL          0x2310
 
+/* QMP helpers for injecting the physical inputs */
+
+static void qmp_ina230_set(const char *property, int value)
+{
+    QDict *resp;
+
+    resp = qmp("{ 'execute': 'qom-set', 'arguments':"
+               " { 'path': %s, 'property': %s, 'value': %d } }",
+               INA230_TEST_ID, property, value);
+    g_assert(qdict_haskey(resp, "return"));
+    qobject_unref(resp);
+}
+
+static int qmp_ina230_get(const char *property)
+{
+    QDict *resp;
+    int ret;
+
+    resp = qmp("{ 'execute': 'qom-get', 'arguments':"
+               " { 'path': %s, 'property': %s } }",
+               INA230_TEST_ID, property);
+    g_assert(qdict_haskey(resp, "return"));
+    ret = qdict_get_int(resp, "return");
+    qobject_unref(resp);
+    return ret;
+}
+
 /* Power-on-reset default values and the Die ID */
 static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -98,6 +125,96 @@ static void test_config_wmask(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get16(dev, REG_CONFIG), ==, 0x7FFF);
 }
 
+/* Shunt voltage register, including two's-complement negatives */
+static void test_shunt_injection(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_SHUNT), ==, 0x1F40);
+
+    qmp_ina230_set("shunt-voltage", -80000000);
+    g_assert_cmphex(i2c_get16(dev, REG_SHUNT), ==, 0x8300);
+
+    g_assert_cmpint(qmp_ina230_get("shunt-voltage"), ==, -80000000);
+}
+
+/* Bus voltage register */
+static void test_bus_injection(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    qmp_ina230_set("bus-voltage", 12000000);
+    g_assert_cmphex(i2c_get16(dev, REG_BUS), ==, 0x2580);
+
+    qmp_ina230_set("bus-voltage", 11980000);
+    g_assert_cmphex(i2c_get16(dev, REG_BUS), ==, 0x2570);
+}
+
+/* Calibration-derived current, using the datasheet worked example */
+static void test_calibration_current(void *obj, void *data,
+                                     QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x0000);
+
+    i2c_set16(dev, REG_CALIBRATION, 0x0A00);
+    g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x2710);
+}
+
+/* Calibration-derived power, using the datasheet worked example */
+static void test_power(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+    qmp_ina230_set("bus-voltage", 11980000);
+    i2c_set16(dev, REG_CALIBRATION, 0x0A00);
+
+    g_assert_cmphex(i2c_get16(dev, REG_POWER), ==, 0x12B8);
+}
+
+/* With Calibration == 0 the Current and Power registers stay at zero */
+static void test_zero_cal(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+    qmp_ina230_set("bus-voltage", 11980000);
+
+    g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x0000);
+    g_assert_cmphex(i2c_get16(dev, REG_POWER), ==, 0x0000);
+}
+
+/* Clamping at full scale and the OVF (math overflow) flag */
+static void test_edges_overflow(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    qmp_ina230_set("shunt-voltage", 81917500);
+    g_assert_cmphex(i2c_get16(dev, REG_SHUNT), ==, 0x7FFF);
+    qmp_ina230_set("shunt-voltage", -81920000);
+    g_assert_cmphex(i2c_get16(dev, REG_SHUNT), ==, 0x8000);
+
+    qmp_ina230_set("bus-voltage", 36000000);
+    g_assert_cmphex(i2c_get16(dev, REG_BUS), ==, 0x7080);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+    i2c_set16(dev, REG_CALIBRATION, 0x7FFF);
+    g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x7FFF);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_OVF, ==, ME_OVF);
+}
+
 static void ina230_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -111,5 +228,12 @@ static void ina230_register_nodes(void)
     qos_add_test("defaults", "ina230", test_defaults, NULL);
     qos_add_test("soft-reset", "ina230", test_soft_reset, NULL);
     qos_add_test("config-wmask", "ina230", test_config_wmask, NULL);
+    qos_add_test("shunt-injection", "ina230", test_shunt_injection, NULL);
+    qos_add_test("bus-injection", "ina230", test_bus_injection, NULL);
+    qos_add_test("calibration-current", "ina230", test_calibration_current,
+                 NULL);
+    qos_add_test("power", "ina230", test_power, NULL);
+    qos_add_test("zero-cal", "ina230", test_zero_cal, NULL);
+    qos_add_test("edges-overflow", "ina230", test_edges_overflow, NULL);
 }
 libqos_init(ina230_register_nodes);

-- 
2.50.1


