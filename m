Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B7FCC6B30
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:32:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIjS-0000na-90; Thu, 15 Oct 2026 06:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIgL-00048K-Dh
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:27:34 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIgH-00047p-TS
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:27:28 -0400
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a0e1b0681bso37014965e9.3
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060044; x=1792664844;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=imFMkJM4Su/meWF7Bk/irxYZZDqQDWRnzR3YhZvsMNY=;
 b=XyAZuerXgKsF/9OCSePzMWr1TExj0buL+62Cz82CODdF9LON4AeVMHPyAr96k2YvZn
 RrDqE7qFyG4rREIn4kISg1p+vhA2iUwwvFHfmKBejq15aOlEchADRbgs8ONnOs0NA/m+
 Ye8YTMbtljZfMwTboL6leIK+Bc1FSQ2/23IvsOshl7tFcbjNeCd7Ilah3+3C0EOihGSe
 4ihzdPGL3l8R+DtnsPJMorgYFDEaDSvf8TXQGmEgl8O9KDxYv/XoDC4OslbomCAzmjpc
 vSM+WutdO6+/fvLSOEFdhpCU6HL5NVYa9oqwzd16aTWQ3md9MOpk+zUkRmUpKZWFjDX/
 Qyjg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy401dYTEcsteNH0iE+0en3TXZSXbKeGqTGXRFtGq6b0UDiQNgHj0C8WxLusd9T2I1ybj1mhrfGcLLu@nongnu.org
X-Gm-Message-State: AFq9FYJl/ctay8cXdRxNfAG0qqST7oEFMHsca4rv7CDGKpWx1fR/d5ns
 xdISgAVkffmQj7rdc1jNSV6xf+jQAOTFq0C2e3BN67hiy0nDczp8QG/n
X-Gm-Gg: AYBFou22v4FFNg06nbqwTyqUDTol8gT/3ON2Vf6zreAa0JExb6G5DESyUbkEqCu3COV
 XjTnM6YMLbJxqRpdBdari9M7z1lq7UYWZ51ue75MVxPI1/Dh4ktkzyD9mO08FKqEvifof4fInF4
 b3/54lB9LWf31faISwlNRDrIglKLZx2F52yCSy+BLdPqbrZUTzhvl8SMwO8cAareE1Bl0TSMM+S
 xNmRyggck+4G0OuJtAIImqkkPUBgyJ3A7fY5emav/HLNzJKnhnmB7Z8JJ15GT+8e1IZZq4JTXkj
 Mjr2CdT7WHKjHQZ4l5SJtKMmpFX9GVeXNpT3IORanHuAF4DV4G7vZjB2WIT1ahqHwW0yEkKAYCF
 G8OBIlVXBDaqNYtEQwMxzcpTLzTmxD6uSBUNFCl5tkEFQ+jnB1IFqeyvWfQpxuEow0aICTAfpwl
 XcesYZbNvKKnB/tW1SEIwgkwKnLCNxh5jqf/iWjEFNIWcb6FubzErGBir9WU11dydkjTi1s94v/
 7iOr/ywVKd100pQz94cnZ9EZT9kI/DWmLAOTjoYAiUAWg==
X-Received: by 2002:a05:600c:524a:b0:4a0:251f:a726 with SMTP id
 5b1f17b1804b1-4a18e4a54f2mr391008825e9.24.1792060044282; 
 Thu, 15 Oct 2026 03:27:24 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd5e9dd7sm39694475e9.0.2026.10.15.03.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:27:23 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:16 +0200
Subject: [PATCH v3 29/50] tests/qtest: ds1339: cover the day-of-week
 counter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-29-7d50c8a108e5@free.fr>
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
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056476; l=2635;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=eyo+ejkyIwGpn53A6NDRDtcAT+GA1L3xUgmQjCv7Q5U=;
 b=+Sk24fn+A1CTVTRUyTLcv2AiuUMZSXksKbZwB6Kq2jE9ne2mGilDjJ/o6goP5C8kUsYiHyQ1a
 nQdER5bFZyYD0rNltnAKexpw5vG8BgblxULHjfRgTo4EB7cP7iGzzBh
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.47; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f47.google.com
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

The day-of-week register and the offset behind it had no coverage at
all.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1339-test.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/qtest/ds1339-test.c b/tests/qtest/ds1339-test.c
index 3259fa1df3..12562eff5f 100644
--- a/tests/qtest/ds1339-test.c
+++ b/tests/qtest/ds1339-test.c
@@ -15,6 +15,7 @@
 /* DS1339 register map */
 #define DS1339_SECONDS   0x00
 #define DS1339_HOURS     0x02
+#define DS1339_DAY       0x03
 #define DS1339_DATE      0x04
 #define DS1339_MONTH     0x05
 #define DS1339_YEAR      0x06
@@ -174,6 +175,36 @@ static void test_eosc_restart(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(resp[6], ==, 0x31);
 }
 
+/* The day counter is the guest's own numbering, and steps at midnight. */
+static void test_day_of_week(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    /* 23:59:59 on 14 June 2024, the day counter reading 7. */
+    const uint8_t tod[7] = { 0x59, 0x59, 0x23, 0x07, 0x14, 0x06, 0x24 };
+    unsigned idx;
+
+    for (idx = 1; idx <= 7; idx++) {
+        i2c_set8(i2cdev, DS1339_DAY, idx);
+        g_assert_cmphex(i2c_get8(i2cdev, DS1339_DAY), ==, idx);
+    }
+
+    i2c_set8(i2cdev, DS1339_DAY, 0x03);
+    i2c_set8(i2cdev, DS1339_DATE, 0x14);
+    i2c_set8(i2cdev, DS1339_MONTH, 0x06);
+    i2c_set8(i2cdev, DS1339_YEAR, 0x24);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_DAY), ==, 0x03);
+
+    i2c_write_block(i2cdev, DS1339_SECONDS, tod, sizeof(tod));
+    for (idx = 0; idx < 50; idx++) {
+        if (i2c_get8(i2cdev, DS1339_DAY) != 0x07) {
+            break;
+        }
+        g_usleep(100 * 1000);
+    }
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_DAY), ==, 0x01);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_DATE), ==, 0x15);
+}
+
 /* Midnight and noon are the hours the 12-hour encoding special-cases. */
 static void test_hour_mode_12(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -414,6 +445,7 @@ static void ds1339_register_nodes(void)
     qos_add_test("eosc-restart", "ds1339", test_eosc_restart, NULL);
     qos_add_test("stopped-reserved-bits", "ds1339",
                  test_stopped_reserved_bits, NULL);
+    qos_add_test("day-of-week", "ds1339", test_day_of_week, NULL);
     qos_add_test("hour-mode-12", "ds1339", test_hour_mode_12, NULL);
     qos_add_test("month-28-days", "ds1339", test_month_28_days, NULL);
     qos_add_test("month-29-days", "ds1339", test_month_29_days, NULL);

-- 
2.53.0-Meta


