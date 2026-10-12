Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23837CA9EC5
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:32:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHzr-0006Ia-6u; Mon, 12 Oct 2026 11:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHzo-0006F1-0L
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:31:24 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHzk-0002RC-FJ
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:31:23 -0400
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so24952655e9.0
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791819079; x=1792423879;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ss51PCL4wPLTllRT5+2kCLycXbHqe9UGZco7OGSZnQA=;
 b=goLB/oaA3C924mWSZib4buxKk/3EWJwkC8cBCgLKHygsZr5ehPe/weUgnMf9XgdIWN
 LcSiuvRPbiFdGt8DkovcabnlK1Yw4Ry140hWnosPZYY4muxWVFMkYmQfMsnnZqj9Gyp6
 dd/fOruXVXoMnFQbmcYimN4qMvqYFNWkSwveT2w6MajaQaZ7casU8u270VMkQ6VZIaTO
 1rZYsIRxQJ8BPRfDtwLFV1Ku2GzHwbt7j+RBT+1locrHEiqz8pC4ceFw8+rYCiUrsuim
 nXJ8K3HB2065kT03b0uVQm8j94d3rwA/jdO7E6M9sm80YJF5ezl22LmeJFiXifK+uzgI
 FrCQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx6JSg0quELKy6PDZ7DBDqnE4ImusIPnaIc4dvdKCRbGSxABoLx7I8KDBsy1XGbW/R58zrrbBXwuVSb@nongnu.org
X-Gm-Message-State: AFq9FYJcQUjxQaExlM6mHHKn/DgZVLmqAA/1XoTNDyE/2tx9OwLz1z0t
 /haFs/k/2AYwskoHROItekkYSvWe70vf8iN48pEc/tZ6jwMm4lkH8QWX
X-Gm-Gg: AYBFou02SIdo0fg1NRc5/F0O5MDrETawIBwgxPulc3+QtqRugnJGucb8aZ/z1g/PbP1
 wuyFdUJMvzs9ndtcYsWfiVGHC6sWPf7sa40YOWdGR7/yrV+MpPurhqi0n1MS2i+EAE6seYo+dxb
 7EI4r26p7KN4dUkBO2PY+Biv44jzoh42gI1JEPrfCjZg7DBHoIJE6NYON4gHBCDUvu6YXpEhK7x
 Wx0M37jej1P1tceN8aZTpSkpSHyUYTgn1oDKZnbwvJWXjf0fxg3cfQpGTwLoeh5f1mMv4CG/O4C
 vDQJlE/5y/ZJxWYbNyWlfjXhxOhcXZcLh7Gb//TOqJWL4+/Oz6EfeStCJK8Isq8QMM9MAANkHxs
 NR0iiepEPQkySuZN3YYaE+3J9QrYhavwU8KgIztWuVF7AwL45ujPnX4foN1axxb+oKKd9gEyVY5
 opZtOEJF10gQOSE7LsGdXq07I5uSrt7d/QabHFQKgfPBOmIOjxw2FRDt3FGpyujRHjf41Gl6gLs
 BSEA7HmiG6wndT3Jv/qdnTP6CMLsILNZckS5AA8BFproQ==
X-Received: by 2002:a05:600d:6413:10b0:4a1:88d7:4e6a with SMTP id
 5b1f17b1804b1-4a19470eccamr93577085e9.27.1791819078612; 
 Mon, 12 Oct 2026 08:31:18 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0967a0dsm102603f8f.3.2026.10.12.08.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:31:18 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:31 +0200
Subject: [PATCH v2 38/50] tests/qtest: ina230: cover ALERT latch
 persistence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-38-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815521; l=4916;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=jOC1vYeVhUY+5GdpU2iOwoUFRCa5a2ZvcAIYA/RAl8s=;
 b=ThodW9poXQ6lo666YxHvdLiafRZcgdhyvXtVIZpC8rNiT/mJFpsjM2vSMilw3a0/WIP+8UWc0
 gWxbNv23ltnCLHUvBqkyQgfsm+xoE1U9kevWlNc97N74YJkf2IEjcPK
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.50; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f50.google.com
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

Verify what releases a latched alert and what can bring it back: a
Mask/Enable read and a Configuration write both clear it, and only a
conversion that re-samples the fault on a channel it converted asserts
it again.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina230-test.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tests/qtest/ina230-test.c b/tests/qtest/ina230-test.c
index f8b982686a..591927e551 100644
--- a/tests/qtest/ina230-test.c
+++ b/tests/qtest/ina230-test.c
@@ -364,6 +364,88 @@ static void test_alert_latch(void *obj, void *data, QGuestAllocator *alloc)
 }
 
 /* Bus over-limit alert */
+static void test_alert_latch_persist(void *obj, void *data,
+                                     QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x1000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_SOL | ME_LEN);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+
+    /* First read shows the latched AFF and clears the latch */
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, ME_AFF);
+
+    /* Fault still present but no new conversion: AFF stays cleared */
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, ME_AFF);
+}
+
+/* A Configuration write releases the latch as a Mask/Enable read does. */
+static void test_alert_latch_config(void *obj, void *data,
+                                    QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x1000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_SOL | ME_LEN);
+
+    /* Latch a fault, then bring the input back below the limit */
+    qmp_ina230_set("shunt-voltage", 20000000);
+    qmp_ina230_set("shunt-voltage", 2500000);
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_POR);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+
+    /* With the fault present, the reconversion latches it again */
+    qmp_ina230_set("shunt-voltage", 20000000);
+    i2c_set16(dev, REG_CONFIG, CONFIG_POR);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, ME_AFF);
+}
+
+/* The releasing write need not reconvert: a power-down leaves it clear. */
+static void test_alert_latch_shutdown(void *obj, void *data,
+                                      QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x1000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_SOL | ME_LEN);
+
+    qmp_ina230_set("shunt-voltage", 20000000);
+
+    i2c_set16(dev, REG_CONFIG, 0x0000); /* power-down */
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+}
+
+/*
+ * A conversion only re-samples the alert of a channel it converted: the bus
+ * register a shunt-only conversion left stale must not re-latch.
+ */
+static void test_alert_channel(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x2000);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_BOL | ME_LEN);
+
+    qmp_ina230_set("bus-voltage", 12000000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, ME_AFF);
+
+    /* Shunt-only mode: the bus register keeps its over-limit value */
+    i2c_set16(dev, REG_CONFIG, 0x0005);
+    qmp_ina230_set("shunt-voltage", 20000000);
+    g_assert_cmphex(i2c_get16(dev, REG_BUS), ==, 0x2580);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE) & ME_AFF, ==, 0);
+}
+
 static void test_alert_bus(void *obj, void *data, QGuestAllocator *alloc)
 {
     QI2CDevice *dev = (QI2CDevice *)obj;
@@ -481,6 +563,13 @@ static void ina230_register_nodes(void)
     qos_add_test("edges-overflow", "ina230", test_edges_overflow, NULL);
     qos_add_test("alert-shunt-over", "ina230", test_alert_shunt_over, NULL);
     qos_add_test("alert-latch", "ina230", test_alert_latch, NULL);
+    qos_add_test("alert-latch-persist", "ina230", test_alert_latch_persist,
+                 NULL);
+    qos_add_test("alert-latch-config", "ina230", test_alert_latch_config,
+                 NULL);
+    qos_add_test("alert-latch-shutdown", "ina230", test_alert_latch_shutdown,
+                 NULL);
+    qos_add_test("alert-channel", "ina230", test_alert_channel, NULL);
     qos_add_test("alert-bus", "ina230", test_alert_bus, NULL);
     qos_add_test("alert-power", "ina230", test_alert_power, NULL);
     qos_add_test("cvrf", "ina230", test_cvrf, NULL);

-- 
2.50.1


