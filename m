Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18299CC6B33
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:32:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIkX-0001bX-3Z; Thu, 15 Oct 2026 06:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIgt-0006kz-T2
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:28:04 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIgr-0004FB-Jw
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:28:03 -0400
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so46420535e9.1
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060080; x=1792664880;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YHMfEpRBCghPOlLiattQp/tdJSULFxB9dFeHDoCkMiY=;
 b=DP1e1rFA0DHVaZkBnigKbKodlIqiKDClkbjLxgUd9EcCrG0r5YvuN9SJbBE+2d+VaF
 i5mYVNSRce9SQfzDTzQI3v/aWCwmSPxOZDbKUg6Fsbc45hvnmEt0ngA7ClgjCzRtaPAM
 LnAVx2OdC6Vs8hFiAQjDY6lfjE4AoSSw5WqlFclIQHSM3i9sMGuDyiMxlryOWgL75roV
 Na/PtWFW2n/JXzMml/2lJrrloh1/BcnZAkfD4xiqt4/ALHqEwabBlPurLjg4Fz/4NC77
 V6TjHspnwU2CZ5odIgtCbPm23Ur7r+ZtLhgf73dhkAgZNaaEa+PpFtOg9XxCxvvYsSZ6
 5jmw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzmdrcUTCnPlww774eewv/bVYJ9d4DMP0Nza4wVjDl2M0ZrO0sjCSZuAtz+Ypy0z/P5UjOKhUvfNHL2@nongnu.org
X-Gm-Message-State: AFq9FYKDNdfpYU80u9jBy8BhOVtEgmOgzGVo8bcYGVKLzlzfIY07GpMe
 vWqqsXsuIg+5adBOLqlWguXYjQgf0lLPvVXMrKDRb3rbnzuO+RZxSqKv
X-Gm-Gg: AYBFou0RS63vraagMbAc3pd2m9VDASefQAHzdNmuvvuOx+0/8jXycdc1yagvPWDGDYh
 QC1KIMen+wdv3J0/d3fmdUMlIY58dMWiL5+oy2nTmoGJhTIaVnMAXjkcE6lCYj8DEaSRFdYRSZf
 H2FlWD05sFpj6GWxO5ZxgMrSsTynOSnEWhYfii5MPKVzcEsJdhAxGVZt+qh4YlWdWpYdWDUS2yL
 9m9gXH9dFS+u61uDHErd43iJESB98i6GqWF+XpVif59Jbkyy91KSxsg8iQn0vhLyeUbN+nxXcR1
 8JBZuZY1vCkFTlb3YYREWHwcrR3ZM3cp8He5ZpBzNGtQnw39owZB+2fa19UzdNUQg3e9Xiga8Kh
 jp8KHOpD2ods/vFp+RAxq3JGuXgJw9AzSbuSROp4Z1b9HmsyG6cJB+rl6OCfUVG6i7gLu3dmKqp
 1ONkdh0rs1d0gWzcrLYxOqmbNdTziZxvYMg4LylNDYyc9kKAnV9l6MddNVfHZtnZ9fSuMS0jveO
 kk5IXp1bJ4AJEMz7JA4ZAsjtORwnyK9ym9s63tHBe+YcQ==
X-Received: by 2002:a05:600c:3507:b0:4a1:afcd:3919 with SMTP id
 5b1f17b1804b1-4a1afcd393emr143929615e9.7.1792060079898; 
 Thu, 15 Oct 2026 03:27:59 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bdbb4a30sm57940475e9.15.2026.10.15.03.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:27:59 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:21 +0200
Subject: [PATCH v3 34/50] tests/qtest: ina230: cover voltage injection and
 power derivation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-34-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056476; l=5805;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=NCCZ3C0XT97Dof+ZcjxjWcN4sAhVvyKJXvbHGJ+/418=;
 b=C4YCCdDUPnB9tvynBR9FlIsyuBXUmpNSEJhjsxKIPOsPg/DJ5u1UYuj1gOeZ5PzynMxr8VJqc
 Pq65f5spBtdBGWI5Sr6Siry5KCI4R/TVbE5udsN68vDsOAuq5J/3YN3
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.49; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f49.google.com
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

Reviewed-by: Glenn Miles <milesg@linux.ibm.com>
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
2.53.0-Meta


