Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00B5CC6B3D
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:33:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIlU-0004D6-Si; Thu, 15 Oct 2026 06:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIho-0007yU-H4
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:29:05 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIhc-0004QR-U4
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:28:52 -0400
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso3748614f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060113; x=1792664913;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=eT68nxMn01vW7O3JJprDmDkWOIfn9yjPcnQ/rqWRCTw=;
 b=C9PRnCX8gAdFZkf9o0bS5vQi6Ot0/rUVO4eT1FRJo+2ebPI9SCB00/2Ltl5mkmraBL
 SNqlmJlBjdKW8un5vb8xWvm7hqYcyARC/Dt4wyURhwWeWS9gNUQM2KFJDg88W81MQnSr
 51icaHJqzAKQygV0roWVWRm5I1WIGYtKwNrylh9SxqEcPDfJTZN/9sVtOgjr1dZPvLfo
 uUq851kUuPlRGC6dGT+biQfCF+Iodekxe4dc+iavYIF3KuqBCvkYsWFWakzuqHLT+5RF
 sL040KQPho9HqkRLghJzYgO1VXzlgRr5skUk3rY6tKjKMOlY7fgHSt/09CQ/+B73ECeb
 7Rvw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzT4VWafjUzY3NyTtIOPOhNl+nMmgyuIF192RphH+1eZmucbycGybcJI8I1sfOzUQ11uR1cRU7OySsK@nongnu.org
X-Gm-Message-State: AFq9FYI7v9okSLLH0kobtNYOa42KRX8PIg5ZeG1HBpH2BAUvemRDJS9L
 Be6ZiZbUMwWbIimJ1S9fe4a7X7M94aNIXHu7QEybS5jcleHZozM0BwMe
X-Gm-Gg: AYBFou3y6iDrD1TFrHl4sCmEjHQhxeOhQwJMPMJ/fHRFiR57tU382n61glIismAQUdM
 9IeIkBSTwLmKhDaVB9o3OL6gSXnH+dH6A0lG9UaCDVRyoXFy1Aysaj6+X1iRifjxSbUEMQsb0xc
 BdPi0UTW/gLT41NCJDNj9OoKNerhmAFQEEGtb3bV87W+CB5um2GHqeS6fTY0KfDzLDL1/YH5oEF
 YInV6ObhRJ0HK2PLjo72u5FKCix7z5lipRmw1GTy+LdP7rYwIYocrlCk/QB2c0d0POHqMFgE+2R
 MmcJ4NGm2h4F6b5boJMzEUoR94z9MzGXMKlm6BlSQU7mrmyKwaP0yem85v80eVuvmT+v0una5SH
 u7ikNh08sBEoBUxI2E1QV5wjYE9iAEKaCHOArRFn3w/I07Wuut6YMhf9839eAJq+v2gNWjA8kyh
 xXdPDctjOf25RL3MJkcrVQtdEgD2ESyjLfhhzUNlaiQcLCLxsko5JGxsJZujtj0ROn09Co4qhOU
 XWPcsVVbAb7p0jmEPZ+m0sS8LKwPxKugCW9TAcRLbVsPg==
X-Received: by 2002:a05:6000:2584:b0:48d:f14a:917a with SMTP id
 ffacd0b85a97d-48df14a9278mr6447729f8f.48.1792060113001; 
 Thu, 15 Oct 2026 03:28:33 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48df57e8549sm2765816f8f.0.2026.10.15.03.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:28:32 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:26 +0200
Subject: [PATCH v3 39/50] tests/qtest: ina230: cover a cleared calibration
 per channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-39-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056476; l=2313;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=PzxGOCXpiAe3gOLqCnGKqAPPjR61GoJKj4uRIt53Dm4=;
 b=bJb2wT2ZeI9+k0h0aJE+pP6RFyQjal6KrsGQyeAEVh0Rk0I4neF+iKUwkSgCoFfyixERZAvjo
 VjOp9Ccuu+6Azeo5m8qFQlKX6FAnoLmcrFpXjR+gHv+97ssbMj/KXe7
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.51; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f51.google.com
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

Verify that without a calibration value the current and power
registers read zero, whichever channels the mode converts.

Reviewed-by: Glenn Miles <milesg@linux.ibm.com>
Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina230-test.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/qtest/ina230-test.c b/tests/qtest/ina230-test.c
index cda52bb815..f9e8d3ab9f 100644
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
2.53.0-Meta


