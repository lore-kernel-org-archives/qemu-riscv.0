Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADEDCC6B30
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:37:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIlZ-0004ku-Py; Thu, 15 Oct 2026 06:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIhr-0007yu-Nv
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:29:09 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIho-0004To-Fo
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:29:03 -0400
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso66551775e9.0
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060138; x=1792664938;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fQuO1OoAvVLPWqu+N7yVLkIN0/A7JAcl4F1lEKElbWw=;
 b=ieK9lL+kzE399MlauhwwWb+xp6SyBiKlHjXjspBBf0ePQr2iXfP+3JyK4vi2ehaIbj
 k9kE69WSxQW+9dfnPpLMN4pk3S925OqZzCZlfnVVfTgL+giEA72ZxfeBCDMqUPADITvx
 Rad6lMSYp6Zc0AbzWytrXRPQBKLMSxYOpoJNCV3703HqkX7RjSJZ8A2NAgjYe1DQzm3K
 mkYFHKPaTrxbz9qpjbjl53fn9AgDc3GTZ9WuKTP4rVflh6XSY7ZL9vbXUBelvf8Ss0gf
 i5K7cCXoZBYvPP6eI3t2vpODnfpgyg4ss6wZIo/MKxtlN4K39zcl6JLiEB4s/R0UXmt8
 7zyA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwvjk4Hjk1EXsCnZc+IB+BkcKqlHLsT35zFpzhU0jLtAjTXXWGEyC8W9BDj6GxLEgJCzhfqP2g2da8T@nongnu.org
X-Gm-Message-State: AFq9FYL6IEoLVfUo2nvN6++xBnM005JSta3J6yyWYsuSu4dpZuXQXkc2
 JBvvzPKcMdvRlZYDR9Jih2GDYJBCahNWvjRm7xUZsUgKXfY0Z7CgZALV
X-Gm-Gg: AYBFou2tJzSxUwTWaoSKhTchlMABpfZOvYJ+XbVg8lvsW8GJ3h8Pu2km0xfl4xcsYHG
 7ZahK/bOMe9dpprjde4nmbIxcXLJzKTSHhk1/a2Bt/z88PGbBwh0r2/rJezn4JIvKZ0VbZMduj+
 5t2alTW5PQZjKdIpkgjL1Apk0QQQ8Labe/3iMDd2SF+G7Y96rG1VZnsTcwTNGCm10abOijvD9LP
 kWPMiYfiBUhlAKSqBqJL/ZOmRvRLcVxCQtf1HEqxureTsEPPtcvY5sloTiRvK0VIGjgKPqMzijv
 XxrYLSAcvRrugTZvrkI4CDVebpY1HLpJ9c2uOcCWHzU6XP9K6MUW9FUeNUtKZQMSAgk+e0lihNJ
 +yZH9+Dkr87XYSMwPoSTx9voivqrdHK7wrFZmr5NUCaNaWiaHXVnfS/o8go1U+AHN1if+Pwjcgf
 ZGWwavfeKA0vj5vXK9u5s1qVFuTBp1pRPgwSkD1XL8r5CvdLP3St3EaUifS21DqUh1HorvLWcAx
 FG3XIJXW3rPv116wQZ1kj62WpiXkKmPSW6ONJ/s5zDLXA==
X-Received: by 2002:a05:600c:620d:b0:4a1:8d46:6235 with SMTP id
 5b1f17b1804b1-4a18e483d48mr342766665e9.3.1792060138069; 
 Thu, 15 Oct 2026 03:28:58 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd97ed33sm69798235e9.5.2026.10.15.03.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:28:54 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:29 +0200
Subject: [PATCH v3 42/50] tests/qtest: ina238: cover voltage/temperature
 injection and derivation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-42-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056477; l=7015;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=NE+vwOg7NY0/COEtyB9HSra4PfJKCB6NE5KYmmh/nfk=;
 b=tA1VejM1wsL6C9qnmxTbEGVklU6oShqEl3vy8eqkPA4Dg3GGcQoTQMp8gIkwcRPbQ2qTjBOyL
 WjseqtOWLspDxX+QtOFjd5sdAqCsRyVmd4T2qH87VrQRNdbbn3NDPSH
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

Cover the shunt-, bus- and die-temperature injection properties and the
current and power values derived through the Shunt Calibration register,
including the zero-calibration case, the ADCRANGE rescaling and the
clamp/overflow edges.

Reviewed-by: Glenn Miles <milesg@linux.ibm.com>
Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina238-test.c | 156 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/tests/qtest/ina238-test.c b/tests/qtest/ina238-test.c
index 6e59ed30b5..693139f988 100644
--- a/tests/qtest/ina238-test.c
+++ b/tests/qtest/ina238-test.c
@@ -89,6 +89,20 @@ static void qmp_ina238_set(const char *property, int value)
     qobject_unref(resp);
 }
 
+static int qmp_ina238_get(const char *property)
+{
+    QDict *resp;
+    int ret;
+
+    resp = qmp("{ 'execute': 'qom-get', 'arguments':"
+               " { 'path': %s, 'property': %s } }",
+               INA238_TEST_ID, property);
+    g_assert(qdict_haskey(resp, "return"));
+    ret = qdict_get_int(resp, "return");
+    qobject_unref(resp);
+    return ret;
+}
+
 /* Power-on-reset default values and the ID registers */
 static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -160,6 +174,139 @@ static void test_config_wmask(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get16(dev, REG_CONFIG), ==, CONFIG_POR);
 }
 
+/* Shunt voltage register */
+static void test_shunt_injection(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    qmp_ina238_set("shunt-voltage", 97200000);
+    g_assert_cmphex(i2c_get16(dev, REG_VSHUNT), ==, 0x4BF0);
+
+    qmp_ina238_set("shunt-voltage", -80000000);
+    g_assert_cmphex(i2c_get16(dev, REG_VSHUNT), ==, 0xC180);
+
+    g_assert_cmpint(qmp_ina238_get("shunt-voltage"), ==, -80000000);
+}
+
+/* Bus voltage register */
+static void test_bus_injection(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    qmp_ina238_set("bus-voltage", 48000000);
+    g_assert_cmphex(i2c_get16(dev, REG_VBUS), ==, 0x3C00);
+
+    qmp_ina238_set("bus-voltage", 12000000);
+    g_assert_cmphex(i2c_get16(dev, REG_VBUS), ==, 0x0F00);
+}
+
+/* Die temperature register */
+static void test_temp_injection(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    qmp_ina238_set("die-temperature", 25000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIETEMP), ==, 0x0C80);
+
+    qmp_ina238_set("die-temperature", -25000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIETEMP), ==, 0xF380);
+
+    g_assert_cmpint(qmp_ina238_get("die-temperature"), ==, -25000);
+}
+
+/* Calibration-derived current */
+static void test_calibration_current(void *obj, void *data,
+                                     QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    qmp_ina238_set("shunt-voltage", 97200000);
+
+    i2c_set16(dev, REG_SHUNT_CAL, 0x0000);
+    g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x0000);
+
+    i2c_set16(dev, REG_SHUNT_CAL, 0x0FD2);
+    g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x4CCC);
+}
+
+/* Calibration-derived power */
+static void test_power(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    qmp_ina238_set("shunt-voltage", 97200000);
+    qmp_ina238_set("bus-voltage", 48000000);
+    i2c_set16(dev, REG_SHUNT_CAL, 0x0FD2);
+
+    g_assert_cmpuint(i2c_get24(dev, REG_POWER), ==, 4718400);
+}
+
+/* With SHUNT_CAL == 0 the current and power registers stay zero */
+static void test_zero_cal(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_SHUNT_CAL, 0x0000);
+    qmp_ina238_set("shunt-voltage", 97200000);
+    qmp_ina238_set("bus-voltage", 48000000);
+
+    g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x0000);
+    g_assert_cmpuint(i2c_get24(dev, REG_POWER), ==, 0);
+}
+
+/* ADCRANGE changes the shunt LSB, not the current divisor. */
+static void test_adcrange(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    qmp_ina238_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_VSHUNT), ==, 0x0FA0);
+
+    i2c_set16(dev, REG_SHUNT_CAL, 0x0800);
+    g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x1F40);
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_ADCRANGE);
+    g_assert_cmphex(i2c_get16(dev, REG_VSHUNT), ==, 0x3E80);
+
+    g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x7D00);
+
+    i2c_set16(dev, REG_SHUNT_CAL, 0x2000);
+    g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x1F40);
+}
+
+/* Clamping at full scale and the MATHOF flag */
+static void test_overflow(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_ADCRANGE);
+    qmp_ina238_set("shunt-voltage", 97200000);
+    g_assert_cmphex(i2c_get16(dev, REG_VSHUNT), ==, 0x7FFF);
+    qmp_ina238_set("shunt-voltage", -97200000);
+    g_assert_cmphex(i2c_get16(dev, REG_VSHUNT), ==, 0x8000);
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_POR);
+    qmp_ina238_set("shunt-voltage", 163835000);
+    i2c_set16(dev, REG_SHUNT_CAL, 0x0001);
+    g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x7FFF);
+    g_assert_cmphex(i2c_get16(dev, REG_DIAG_ALRT) & DIAG_MATHOF, ==,
+                    DIAG_MATHOF);
+}
+
+/* Shunt over-limit alert (transparent mode) */
 static void ina238_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -173,5 +320,14 @@ static void ina238_register_nodes(void)
     qos_add_test("defaults", "ina238", test_defaults, NULL);
     qos_add_test("soft-reset", "ina238", test_soft_reset, NULL);
     qos_add_test("config-wmask", "ina238", test_config_wmask, NULL);
+    qos_add_test("shunt-injection", "ina238", test_shunt_injection, NULL);
+    qos_add_test("bus-injection", "ina238", test_bus_injection, NULL);
+    qos_add_test("temp-injection", "ina238", test_temp_injection, NULL);
+    qos_add_test("calibration-current", "ina238", test_calibration_current,
+                 NULL);
+    qos_add_test("power", "ina238", test_power, NULL);
+    qos_add_test("zero-cal", "ina238", test_zero_cal, NULL);
+    qos_add_test("adcrange", "ina238", test_adcrange, NULL);
+    qos_add_test("overflow", "ina238", test_overflow, NULL);
 }
 libqos_init(ina238_register_nodes);

-- 
2.53.0-Meta


