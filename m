Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DBAC79F99
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:14:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3ctt-00020K-2v; Mon, 07 Sep 2026 13:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cXo-0007vC-33
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:50:08 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cXl-0004Q9-VK
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:50:07 -0400
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso32080335e9.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 09:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799804; x=1789404604;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7JIouwvsYhybUqJx3bKqTjTPWbvwF34ZaZVav4+/RP8=;
 b=S4sYgMcFOta06AfmFbiyNPzwUQai75b7JwYVFmDypW8OXtjcuw6Wexb7UMnjtRW3Sg
 mnC1YcQt1q5A0y2/TzuDH86lG9QfoMsMYb9ZNIoO6i4+UVdIqDXf2H+hEF77cjcjTqXI
 bpG7eBmJmjilBvxWAyFF9+hKKY+IL5OFRgHQy0YGpC8pBu06d75PSAEMn63j/mQ6Q5i6
 gYgz3Y20ZBmB4i+VRCLZH39uGbYh5/m6HJoKIm5sr3fpHEYdGqZDGD2ri0yUWiJKL9M1
 VqdE0eCmSIlWLipUCojBKqHURzzCxEuWu4NE924ccK48Z/bqW9cQVqJ1TJj4oSFror7N
 ui2g==
X-Forwarded-Encrypted: i=1;
 AKwUvBwF0y1v1DYOM+aDPCpyncQ0X/OjbhQXbsMfar+PhSJTR8wxHSoGYpsHB+7Tn7c0/tnluVH+AD8VJDCW@nongnu.org
X-Gm-Message-State: AFuF++kHfqMw9rOEMGDp5gn+DFlmMEBAQzKqDugZheHVc0LyJPtIGQ4+
 RmeJTdcUP8O+mABfhQaFqShiRQBdtRQwsR6hMKA7Gtg32O0op7MjwQR6
X-Gm-Gg: AYBFou1nMoQAKHpBO5l2Y3K6vKc2aiDpGrtFfzjsTgfMos1PHZgxKpo5hvbIH06WuZz
 mcso8Tona75sso8FbSbSIa+TJj6vmN0GhRNy6LGPrNusQpIQ2AoqRrQ1yoXkWktcu7pR3TyT87U
 oLyZEOqdeoQEEF9jaJ9WKeXH2TD3E8u6YrIBXoQZocv16p3EcbQ5kMxn6mKy5LCqErv0oMuLbnP
 bHfCJk2n+U/bArK9aRNDqrdgLFEi1JzDkShZtaJFetKgvY+dWImTNYX+WgzLdVlrYcNeFA30il7
 qORHQM4aZbc595op6OXuk+k91XP+Ovca+wa5j7qU8OKWJVL1lo4J3D6mBvYYqReOaWs9AxLZ0c5
 DMEUFuJiIDim4KtV4jhuFUolSJwfofo+9+UhXKuwt6BktXtv8Jd9n+7ldgsxspl2voW6ZvHBqyN
 oTWSwbRUTz4TeKhOPDPwQNncbM42I8aFIJt/uuTJQBu/t4zs/mkZBEjhfCvMoei7E/UzWEY6RkO
 wM/PpKGlls2V13krYSBTXf34jxSiyT+BoQknJF8jO+aMg==
X-Received: by 2002:a05:600c:4515:b0:49c:c0d4:53d9 with SMTP id
 5b1f17b1804b1-49cf8273002mr232397105e9.14.1788799804299; 
 Mon, 07 Sep 2026 09:50:04 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce591f846sm200827645e9.1.2026.09.07.09.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:50:03 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:29 +0200
Subject: [PATCH 39/50] tests/qtest: ina230: cover a cleared calibration per
 channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-39-0d83ad610c3b@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799322; l=2259;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=GNmGo7bU7FZIBaUuYEeUYDpyrPaavNbXBkjimavlGKE=;
 b=Bxzff034JA32VQyuB9pyTahSx5144M/bWSmix9wX7PcRLpDcyyV78rP35YuNYlveXHJCxHQO3
 Nz6cmtOhAaIAZcUOU3HGurJ+xKbriGP/o5JChoVHjOXKUKRJuLzqpFV
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

Verify that without a calibration value the current and power
registers read zero, whichever channels the mode converts.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina230-test.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/qtest/ina230-test.c b/tests/qtest/ina230-test.c
index 591927e551..5749b0bd46 100644
--- a/tests/qtest/ina230-test.c
+++ b/tests/qtest/ina230-test.c
@@ -301,6 +301,30 @@ static void test_zero_cal(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get16(dev, REG_POWER), ==, 0x0000);
 }
 
+/* Clearing the Calibration zeroes both derived registers in any mode */
+static void test_zero_cal_channels(void *obj, void *data,
+                                   QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    static const uint8_t modes[] = { 0x5, 0x6, 0x7 };
+    size_t idx;
+
+    for (idx = 0; idx < ARRAY_SIZE(modes); idx++) {
+        i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+        i2c_set16(dev, REG_CALIBRATION, 0x0A00);
+        qmp_ina230_set("shunt-voltage", 20000000);
+        qmp_ina230_set("bus-voltage", 11980000);
+        g_assert_cmphex(i2c_get16(dev, REG_CURRENT), !=, 0x0000);
+        g_assert_cmphex(i2c_get16(dev, REG_POWER), !=, 0x0000);
+
+        i2c_set16(dev, REG_CONFIG, modes[idx]);
+        i2c_set16(dev, REG_CALIBRATION, 0x0000);
+
+        g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x0000);
+        g_assert_cmphex(i2c_get16(dev, REG_POWER), ==, 0x0000);
+    }
+}
+
 /* Clamping at full scale and the OVF (math overflow) flag */
 static void test_edges_overflow(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -560,6 +584,7 @@ static void ina230_register_nodes(void)
                  NULL);
     qos_add_test("power", "ina230", test_power, NULL);
     qos_add_test("zero-cal", "ina230", test_zero_cal, NULL);
+    qos_add_test("zero-cal-channels", "ina230", test_zero_cal_channels, NULL);
     qos_add_test("edges-overflow", "ina230", test_edges_overflow, NULL);
     qos_add_test("alert-shunt-over", "ina230", test_alert_shunt_over, NULL);
     qos_add_test("alert-latch", "ina230", test_alert_latch, NULL);

-- 
2.50.1


