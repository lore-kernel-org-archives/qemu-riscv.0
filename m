Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC06FC79FA0
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:14:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3cts-0001zn-Px; Mon, 07 Sep 2026 13:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cXR-0007MM-TN
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:49:45 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cXO-0004CA-Le
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:49:45 -0400
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-484374f54d0so2338358f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 09:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799781; x=1789404581;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vlKqMzmrK40spXKv/yB5zNGWaGlUqMdf8882/o2C+B4=;
 b=SUzlHhjyjg21CFX87O1uelI2H5aQSBNPAJmB83h9lEAowrPadmyZgTqoGLVWQQeY0V
 JDbQJ01M2cdrYDqxDEw8psyEst2QTk7S6GIKLKp2uMtV7eooEBPBDP1RDkEX4STD9CvE
 5mJhAYRxVa5VjkJpZR52SvnMFJP7hZxVj08qqf/MlTl+2ShnLimou5Em0P3xCm+FZRqA
 fIkYlmhgYfMrVrlRh1xbvMKr8WD8loo/ZNxHc2N8ra6yrLUawlVjiT1wYPpJpkUsrZ2U
 04L6B+ZccnoEWXX6O+iVX8IDF0LL68fG7JVtAQX16MMrwE2sVsPX1cbSnD6MiO4Prvop
 2uEw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz7xMQmoiMZ15u3OxGIuNlDOGUnvm1E7OYadnC3s3R0myLlWN6GBWLV/hn0AU3utPHWNEmwcI45H6we@nongnu.org
X-Gm-Message-State: AFuF++kXfSf4/ygmUJZKj5VNDBlF7fI6r/uZpq0DyRP/L6vmlNvLbXxL
 R1jeT1+jyyMdQwzoujAuO7hHYr8iCKcsxrzXLGBDVvaxoED/ilNJzpL3
X-Gm-Gg: AYBFou0rbb39S8mM/lxlm6rzI/T8pcm5O3RUPmhi3KoaWrMVYcHoYnqNi3g7GREuFtP
 duBcHFpokUWZcFlskXo3HLqdn0grT8fUJN3h/mkwTTZrAU/V3JbdAhbJmYFzSfwXH7XAWneYzqN
 igNwY70PGO9nqVukYK4sUbFQnE/a1aw4YZw9HzOPX/7ugYPGsChoF2QWvh8K9fz6Ed83ertCIcH
 t0gmJ41H+LZW7nLko3s0L19FZbpB20PRicWNxsea4xlL7NtQafgsPzje7Inr+9TuZBy2M6Eg+Cm
 AqBy7fmnWEpixR3cPT7mLmpTCSPLHkyryQ/9TXEZNW6jhkV0ZSsOcdVapUcgQfJ21XCHah/TbYl
 ooYP50hJvDXcaBt29nzgSIEDHzhWL+ilTsUgag/21vYaXZwPBCoPv9eGUnmYMJdw5oMwt6WRGfO
 3CgeN2/smrzENGfGv4Ei1/6fo1pehBxsqpBqJaizg08X+MNPP8FZwH0/HSbqA1BSLG2ZvuY3S7F
 HBlyfrIlcRErQPjFO5zFDW+Al+pGUnhjMs=
X-Received: by 2002:a05:6000:420d:b0:485:8ebb:be1a with SMTP id
 ffacd0b85a97d-4858ebbbee4mr38457374f8f.4.1788799781076; 
 Mon, 07 Sep 2026 09:49:41 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885bf3f0sm32571466f8f.33.2026.09.07.09.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:49:40 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:27 +0200
Subject: [PATCH 37/50] tests/qtest: ina230: cover operating modes and
 triggered conversions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-37-0d83ad610c3b@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799322; l=5271;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=Mc0oCEh0KqXrK8lJcAnq4Li1G/vyttVEriaHtSwE3o8=;
 b=Yx/Z6BPfNgz8qAjgf1heLMVSxs0JUqEhTM9MeBEQi5Ax4rW9sNQ82bZ6nZak3Zsm2trWV6MTS
 Sa28skbvUiNDetNTEhv77D4b+W3yJmXTXk2hdW3rt6hOQURUyWEIlvz
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

Add coverage for the MODE field: power-down retains the last results,
the shunt/bus channel-enable bits gate which registers track new inputs,
triggered modes convert once per Config write, and bus-only mode still
derives power from the retained current.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina230-test.c | 95 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/ina230-test.c b/tests/qtest/ina230-test.c
index 36c899efee..f8b982686a 100644
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
+    qmp_ina230_set("shunt-voltage", 20000000); /* A */
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
2.50.1


