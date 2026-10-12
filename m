Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A9FCA9ED1
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:28:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHx5-0004Pc-I5; Mon, 12 Oct 2026 11:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHwo-0004J0-N0
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:28:18 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHwl-0001rq-Mv
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:28:18 -0400
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48afbd2c386so1051700f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791818894; x=1792423694;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MZwOnu4u3mbwMqdzuk9WWRV5vzGX0PpwyIdVH5RHZDU=;
 b=YqHkFJZPc6odbfkULmdBe3CTtqJ5yF3SDdv4H1Ez9SYYPH2SKXah0YyCzHcdQ8boL/
 icALxquQjjzQzfQ/nVhFjbDnH76XC9NFHc/LEKhHqm+jr3r0W1EdONd3ZoWj5NaPpBVF
 LjKEhlouLX6JDeGBPfK50AGllLtI0UUZrsPg/8Eb+tGjju6f7wHduRH2spXQvZXNQwJC
 0wYFEsG0oCd11olaH3dY352Q0xyOv6Uo4NGI/uyVj8adwMNIKVCcADNyT1PsWjQLOMhu
 xQsQFhaaqxamzyK6G8poVSFmadwE114kAg8eCGTNQIZnr85VLTcO2QpC1xZKGnXGWWgb
 gBoA==
X-Forwarded-Encrypted: i=1;
 AKwUvByRUbbKmnJIF4VhsJS6PfqMOrBpd1GZr+HkQJX572m7Bxo+cFMD7ab48wr054WkXNGEylpm3ccEMGf2@nongnu.org
X-Gm-Message-State: AFq9FYL/bat4B9mqpSU/Qqn+/LyeHvXAo3xXUfDffUruonKkOsN2aXA5
 oWMqiEIS9hwQbWkcGBfjZxIWZLxBIpXocRFbZZ3T0CQZcvW6NR8GpSUK
X-Gm-Gg: AYBFou0mdIMwJITVxv9FmoY+GmY+1C20KNk0IeFMGGd50Cm1KB7tRqqj8RKpQAwHRoK
 ex78miYq62ideNN3S6NsCNBFOsQsyvaHmilk2uFNP3h/xTKT3uxM1rkOgCEVSzGX0Fp5rh1g7g0
 WTFBjxlukamuToSiqmLb/noZ8XvAQ168xdoUCRcgTWzXg1pZkp+7Mm0XvvWb78nRfE7dQqWwBXZ
 8/dfUNv+VSeBBTHzXXIHcPlkhD9GH6fn9jNPykINBZEcb7fvm1Y/y7/Btv0+hGqeuKNWB0YJUqo
 CdDfJq5f5Qn2y/t0sRjbYfF++9jk5LyQGnc+/QrM8glNIDCAOGZWlg3ABcwj4Bj5O6xLFCDsipf
 aM7EjwRUdE8H8Tj6Bx3BAG//tjezrJdmlwSlVy7Na0j0PwJ7/QvF6bglMqkbeXgJ9mzooVm9N78
 /0HGdnUF+1dvYdcwk59KKyBa0Ylcl+yS1cKez9Pga+FGl0ihauun+DkdP4B+zsmK2/orkW8GI0s
 JwaGUv+kNGVmKiaW94keYXNCeRMfWSIF+yqzUI76fVe/zMnIP4T4AmUlA==
X-Received: by 2002:a05:6000:481b:b0:48b:11ee:de66 with SMTP id
 ffacd0b85a97d-48dbad1217fmr16296782f8f.34.1791818894054; 
 Mon, 12 Oct 2026 08:28:14 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bc50e0sm45948f8f.49.2026.10.12.08.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:28:13 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:28 +0200
Subject: [PATCH v2 35/50] tests/qtest: ina230: cover the ALERT limit
 functions and CVRF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-35-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815521; l=4599;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=g1WQNWNWvejsNUmKknPzwDjtl/zzqUIEuhP5ANmhVl4=;
 b=65OnQLfX8QBukL+ykDWwsyLTTx2PdYzkrPwt93bRTQOwUz6a3SBgM8G/Y8a6EqH1nmCbL95Pz
 f02zXQq2+KlBIlZ4Blc/ffjRIeXlvDSBzpkHxXTPvXVni3VSXIToVvl
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.53; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f53.google.com
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

Cover the shunt/bus/power alert-limit functions, the alert latch
behaviour and the conversion-ready flag.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina230-test.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tests/qtest/ina230-test.c b/tests/qtest/ina230-test.c
index b01f9445d1..1c55028fcb 100644
--- a/tests/qtest/ina230-test.c
+++ b/tests/qtest/ina230-test.c
@@ -215,6 +215,98 @@ static void test_edges_overflow(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_OVF, ==, ME_OVF);
 }
 
+/* Shunt over-limit alert (transparent mode) sets the AFF flag */
+static void test_alert_shunt_over(void *obj, void *data,
+                                  QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x1000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_SOL);
+
+    qmp_ina230_set("shunt-voltage", 2500000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, ME_AFF);
+
+    qmp_ina230_set("shunt-voltage", 2500000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+}
+
+/* Latch mode holds the alert until the Mask/Enable register is read */
+static void test_alert_latch(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t me;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x1000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_SOL | ME_LEN);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+    qmp_ina230_set("shunt-voltage", 2500000);
+
+    me = i2c_get16(dev, REG_MASK_ENABLE);
+    g_assert_cmphex(me & ME_AFF, ==, ME_AFF);
+
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+}
+
+/* Bus over-limit alert */
+static void test_alert_bus(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x2000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_BOL);
+
+    qmp_ina230_set("bus-voltage", 5000000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+
+    qmp_ina230_set("bus-voltage", 12000000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, ME_AFF);
+}
+
+/* Power over-limit alert */
+static void test_alert_power(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+    qmp_ina230_set("bus-voltage", 11980000);
+    i2c_set16(dev, REG_CALIBRATION, 0x0A00);
+
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x1000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_POL);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, ME_AFF);
+
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x2000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+}
+
+/* Conversion Ready Flag: set on conversion, cleared by reading Mask/Enable */
+static void test_cvrf(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    /* A conversion (triggered by injection) sets CVRF */
+    qmp_ina230_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_CVRF, ==, ME_CVRF);
+
+    /* The previous read cleared CVRF; no conversion since, so it stays clear */
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_CVRF, ==, 0);
+}
+
 static void ina230_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -235,5 +327,10 @@ static void ina230_register_nodes(void)
     qos_add_test("power", "ina230", test_power, NULL);
     qos_add_test("zero-cal", "ina230", test_zero_cal, NULL);
     qos_add_test("edges-overflow", "ina230", test_edges_overflow, NULL);
+    qos_add_test("alert-shunt-over", "ina230", test_alert_shunt_over, NULL);
+    qos_add_test("alert-latch", "ina230", test_alert_latch, NULL);
+    qos_add_test("alert-bus", "ina230", test_alert_bus, NULL);
+    qos_add_test("alert-power", "ina230", test_alert_power, NULL);
+    qos_add_test("cvrf", "ina230", test_cvrf, NULL);
 }
 libqos_init(ina230_register_nodes);

-- 
2.50.1


