Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB75C79F99
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:13:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3ctp-0001y3-Fl; Mon, 07 Sep 2026 13:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cVx-0003is-M5
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:48:13 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cVu-0003w8-OD
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:48:13 -0400
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49d036e0e99so12814255e9.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 09:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799689; x=1789404489;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xDaZUroT2n8sJrtLzMe0uCr4D4Xox3szI0g/uL81yHs=;
 b=cSDEqI8o6u+PO6Qv9JdbhADe6PwGNDdoxTzJwGoy6T6HWlcN1UIt7a/4JgaNh9/5v3
 vLXtp4bdHcObRR/Rh5z77OuG6w/4PIJBU9hpyKBGZ/0Q8wbLsKp5scyGRxjIh8E/VZWZ
 QBQc0FLvi4HUstO0lvc5CvcYC+6/EmTDBsayPD+UvPL03vEqvcR0KxWhPOQ6ZZlkMjd9
 DSHUPacBfC5OpVfLivIk89tKAnJ2XiDvZVcISP10t/XLixLWgiPRp2z/AjrIqBc0Fk4P
 jRz8xhWISJyrvwMdZPKrRcXxfrhpF+j7KcBpqUC+07M7Px/vJ0kWRKL5Bg5FUjhgkWNj
 F0zA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxRKa6k7HBO/JBWXywCPieg8XojjCpOPn4uDQjEm5w8gRahv96hTr/S1EZsWC9s2aR3aIW1mv4MIo+n@nongnu.org
X-Gm-Message-State: AFuF++nKVWx7iSyQ+RZhG4AGs/KjF5UB4nPZwHfKs32JN7EOVBx9jaKS
 WCyshW9wxdXtcDu6HFI6Gir4Apj0AFVFFZeKZ6imEYOD13yfZ2z8ik8g
X-Gm-Gg: AYBFou0x4ax3kgLbHIXyF6RsvjkmHVLEwE9ZqHl05H9NkThTOqs3UNbVDNce0JS9CtQ
 dQ3wYyyHsE9yNIkorETyNRm8VsZZfeXhl7IneC8D1TfBhDmd/NwCMqfcGUES4f14aRmcGhnB7yc
 LyIQ9arpTZnz4d0Eg/XTGSmHNRLHRmBLMyV2FGFcy+t3y4T5fDTlKv0EmwVRJvFTT35tnTRFK+2
 aX3XABjaJJm3ZfPxK01n9KyYOmmmLXvlhRBepoX39WZjKC1xkk15BeAYeiDbb49Wb5zWu8Zu5Vp
 Qq/HeTSYCHWUzLtGcDKWdd/A7xKwY3sqeXUDM9ZlL2epunAbhoXNh2PJr5Wpi2u8D7ZG+Of613F
 ApFxmbZM6dL0NIYqvchnWIspXu1sj4SnwGFrLOoZgb7hArpy8R+T+FuqQia4Rgil2p5kEOe0ZUB
 QhlVGg8+0z+InLDb5UlJBo7t50ienEXgmr6YUr8yiblM/Vg103K6DOY/iXQ5KH5sMoCoboV/PAL
 zrLscC+Mc8TKb+FUzz01aj8v6037HK04D8=
X-Received: by 2002:a05:600c:4f12:b0:49c:fc6c:be00 with SMTP id
 5b1f17b1804b1-49cfc6cbfcamr207136815e9.23.1788799689202; 
 Mon, 07 Sep 2026 09:48:09 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee5d476esm447480005e9.1.2026.09.07.09.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:48:07 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:19 +0200
Subject: [PATCH 29/50] tests/qtest: ds1339: cover the day-of-week counter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-29-0d83ad610c3b@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799321; l=2630;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=K9HOm83SsQOK9R4XDnsjhxDGcTLTCjXMrgk6bTqgUo0=;
 b=JqTAAXTa1cgPUsXsODqk7cQoKOlWxIWYoUxLPLHP78hdfyu1C66KsHKEnMwiCVuEejruUkYW9
 +AjcmKkEYZKDOS7XaDGtsoOYcPKbdBQ6nYI8iT7cbeDpTL7w97ZWif2
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
2.50.1


