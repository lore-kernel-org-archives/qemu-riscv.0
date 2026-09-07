Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374F9C79F99
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:15:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3cts-0001yl-6h; Mon, 07 Sep 2026 13:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cWv-0005cW-0Z
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:49:13 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cWr-00046f-9Q
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:49:12 -0400
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49cdc81f40eso27662335e9.2
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 09:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799748; x=1789404548;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yMnW4a8crPYO2wOiMAzPMEvePpA+mW750LYZ6d0wg08=;
 b=ZA3BDRBGXfqR1+9xIjR9ex6doSwsOusncXpCo9OCPU5xfZm1fpz4paAWnYMs5cLebh
 YzaJvugYRHDmkJkN99zQvkvICfS1Dxbt6TgxDuF/m+WCAgRrvqm9cQThnnV1geijMr3a
 B3WC6DUPN3k/zC4cjOe5Z/ifJarQTgcEy+QEKky8v6apND3v/F6QyOoh7HDcWeVOdmME
 KQZRJijdLkUyzYvCX4M30FtlVJbBrp1OgrEKidQaZGNP6/Olh8ksSraXBvldg1fD2Vsn
 tTVfzok3E4VE+v9cfuYAP6suQftN5f+SPBbzQCt+wm7mZA9iwXNZm3AGOY3zlXcbA6LT
 ex7w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwDWL8ga0lpYW3OvwM33I8tfzR9VVYj8nRVape5ghnz6HPvth9koAwbvOj9vrl2KkK6NP6QwTtwfXgY@nongnu.org
X-Gm-Message-State: AFuF++lWctPzfryhsH8vqt/hvjU+3nNlk4UlV4+5GtXUCloji3kFvk2n
 YdOgPoCzdb9gRSAIWGBjoHxLKXdeqO2asWIUs2hB92SehhY9+s/2Cpv2
X-Gm-Gg: AYBFou3fTyQpBl4IEMeo/PALcYZY20cEUvNe/56bEhW0VDwU5FJRUZPlkDw0iEGBx1z
 YFpGzDPcghArDH853gcsZ6Q0cUi0FcSihKbVmdLW+Ity7OQe81h0sJjoh0yhTO7Xuv2wqOAqiyt
 fLSDKja5Zcm9YY/pEU7y0PLiJTb7tk09un/olwAY86K9VvsklMbJlX9iFU9cWMcY6FW9zIOSU+N
 hsVZ2WxemdJoqHpusH8k26/Jq15T4Qho9DBdQqdcN2Q6KRHLS6I70v+jNKuKU3MhS+i3TBRB1OE
 uydQvmujulyvAZLBUimVcqkvn1fLtLhED9q8KYYPPn9PqEnniSXNFDZ/KN2dQSwbg57ZXoijtCN
 ioeZBocTXDEMO9AxhAM3TYj0Mn91qjPxOOayYqM4ddVEnWJuOL/1RHEMfbRlWEx21u6bTdMR45D
 qpdur0HKWW6hPAw+gEm46GLAAs9ErWDSy3fmyfSFqRUR1RpVUhOm4aNbBMg2anp73xep2s7B+x5
 jjrl+HS0TfNHg1xyL+CU/uHhnAswCb5biI=
X-Received: by 2002:a05:600c:4f4b:b0:499:83f1:398 with SMTP id
 5b1f17b1804b1-49cf823f53emr455128335e9.9.1788799747726; 
 Mon, 07 Sep 2026 09:49:07 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee7febb4sm441986105e9.14.2026.09.07.09.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:49:07 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:24 +0200
Subject: [PATCH 34/50] tests/qtest: ina230: cover voltage injection and
 power derivation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-34-0d83ad610c3b@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799322; l=5751;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=Lxa/vLTiqltAne2a9oGEC4v4uDweYMzTuPg2HL1aV2c=;
 b=NNmaz6nQ0Z1CYNpeUlQLsa5YBdRlrZFxGQp4E5/qtKiQDepQyv7y/6kcki86cX2TqUrJygxN2
 TeU9HAUfONeCCFnmQivGsZp85iaFCjqXkzA5vZDv3u+8gVipQV+d+OA
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.51; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f51.google.com
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


