Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B583C79F99
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:13:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3ctp-0001y6-QH; Mon, 07 Sep 2026 13:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cYa-00028m-ET
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:50:56 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cYW-0004j8-BB
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:50:56 -0400
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-499b2981a7bso40177125e9.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 09:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799850; x=1789404650;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3XplpicYtnjwg/F/PhuqE/con32vEXnk067HsKJkOiY=;
 b=i9mWEPyP3BqZyE07XT7bLVLxG75R/vSa6/jH7pwUbKU8AwU0/mn8vIGiiNjAQwiweC
 jp53DLNZyxFLc0IS+Zq/6i5pWNUacE+7uzKO7oPMGZyeaPxEm27aM1JtR3kIMGhanIS6
 XV4usfu2CcISdegpHAx7yZjYAy/OFpyCjw9ecCaJJID2Madcz+i8P4lEa3zCXydRaKj4
 9xg+bz7le3zmj04EEtfBu7Fe+E0oC7Djt7BtkLXqu4kfOPfaFff4ZvutO087bHgKWxxl
 nkK+OYaGk1ZpbSefvJvST9ghBH1u53A7FoGeFHUo647gRed/ULonF3Q6iYAD5ac7TF/z
 uECA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxeomV2kodnyqmTH+5gMcf3xML0El9e0hsmq6QzLGdAlGezVXpNKFv7/SagPxv1Sz2O4Sm+UwejwlUi@nongnu.org
X-Gm-Message-State: AFuF++kR1Uv37Z/GVCtJPCgxazRDxQ1yiwF0et6Vis8hRq55oWI0xu1j
 3p1InYMTgdPOjQyGgGYngJuZIvrQBVY3hV0n5DEsxD1wicK3ejtwmZ4V
X-Gm-Gg: AYBFou2VLhqMPA8Km7htwUY5ZCCrZ/JTi84aw5gxGJelwoLTV/Vmvlgf+5SJk90pncL
 exrveFu67Gam6KtAVcUy0RR5G0tEtNFbKjeAiHfdGsT5Jkqwr1cZO5fqXdeGiZs1dk9ZgqTJ/89
 T2KNgcaulvL/WCtboFDogaET0qBYa+GuLkEYNu0LepKHejxN+ihsfjf9LbKf8hq22v0zp6TiI4f
 L1cm1oG/q5nxNbI+oyiZGNBkF3IY1ksfcnKUA1qcKgkHb3MTrV9AD7pBDuVeNN4kWSus2vWOOzW
 qQLciHSWaj7K+c2C7RtTQUHPxDeLRNbkyzq7PBMgfArvLQP154u1k+sXMk95+jwaAD2r7VadLxO
 gFPxMZhcjdpluq/XUoZJhwEtGgPVzSJeoapy0wzSmfWkrhnggy3qx3opPGQW4+3l4HUqFTX24lN
 hsRX5mlSmxbSyusXVJAiyfcVsfozAKw4kSq/FeSHt3Mv5z599eF5SVdqHcDuxvH5Mgy275pkJS/
 +3UuGPg0hmeEjSUNGtWEoIG8SIiZ8WK35E=
X-Received: by 2002:a05:600c:1990:b0:49c:f512:2361 with SMTP id
 5b1f17b1804b1-49cf82524a2mr357973325e9.14.1788799849739; 
 Mon, 07 Sep 2026 09:50:49 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee7febb4sm442093055e9.14.2026.09.07.09.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:50:49 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:33 +0200
Subject: [PATCH 43/50] tests/qtest: ina238: cover the ALERT path and
 conversion-ready flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-43-0d83ad610c3b@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799322; l=6665;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=in5M3OrP79f45k7Uk1wA7KrYQ9pr2rECNsyuX2iK4go=;
 b=B+e8ojfnwrt/igqDSazatqwnBaFePSaAXueJchYjWo5SgCcH8zRSfCKv3dKYYoDNMKRL0W/BY
 F2ACU+Vx0H6CFQGaB+fkfSxuIWVfbN2eRPRx4C5kLKpE4G7H37USwQO
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.45; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f45.google.com
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


