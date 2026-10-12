Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E24CA9EC5
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:22:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHr4-0007mX-19; Mon, 12 Oct 2026 11:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHqs-0007hh-Mt
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:22:12 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHqp-00010J-Vi
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:22:10 -0400
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a0e1b0681bso14613565e9.3
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791818526; x=1792423326;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xDaZUroT2n8sJrtLzMe0uCr4D4Xox3szI0g/uL81yHs=;
 b=euRPjYOr8IyqhhRHm8hdXE7jW0xzkVYKLzru1n9hCZ/4RWZvki+TKE1gGfc6fK4alb
 X4XUIrd7hmbmPl6KkI+NDRJwCghoMmmeGV2d7KdzM6h/LCdwvwmfJvt93x4zXPyuvcfU
 vW2VY9LDPkmCnj8Om/O+0v8e7ZpCk2cvaUydxO+Bn1Tg4d601L/+m9pYnupCftBeUeD+
 mocm50ApClOIkH+lhK83mxjAHzRiZJKLEIjhT/f4zDXHzQjYAuHln94sqX966JiXECP4
 TJbJUlqmnoubne+PzTVHoJzfa46K8KC4v5Wgd9M+K41yY/vQ6rPr0i+7fJHyoAvHHcPq
 xbNA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwAP5Wa4ZwDaGGjsafB4V2FqpL9KPmW+T6zZJNfwtZEIbdLco6TWdn7/atHRFy2IekfTCLeYJYq9dzV@nongnu.org
X-Gm-Message-State: AFq9FYJr7gYKJPJ7drveFaDN0jqKu0gQbZ6SYNamUbfBoIaTn3aZtiS9
 nPijnA1MrGJHDaM59P6KBD9X5DIHr6Oa1RgS2tmIGsXQVJ6eDvlgjUvh
X-Gm-Gg: AYBFou0jkaeDkpTF7647qbAArGQBeY4A8WQsfP2PFnAl7tF5Kriksx2LByKNDCW4hV5
 3l/JwFlgYz0eYxJM/Adfr6VdiYcaBB5eFF7UC11FYb8GQ4bsAVTHxYVnI9t8mbk2RRTQD3J4sIG
 ltQKEyb6zWq+hATn7fezqr7bFQ62/Pbm6bfK9H8aqZmMEuUVL/sjvfvVy7i5dgWYvQzzWD2dgiV
 3kQbj9Bq7X/JPsmDOgRUfsype9DP3IyG0PsR+Mi0R8vF+D9zDIf9lLmFaTS5PykchRDuCGKL/Hk
 d+Ontp6IRLFrY61liw0EbUr103ZNXGrijHxF+Pd/qUHHpmvsPo8mcHjbELa/t6fzy8X6vvutWnK
 MmJRQtfLtB/DMIQ6IGbZ4NQu5GHfACIxWZbUFB6Rc901JMTqECANIu+FCHmlDc2G/b3wgldDPkZ
 WEcW6XqMbmW5+I3UZ5I4p3jnnLGdhk1aF3vjixUJvDBo3YkSHWwWMwc+ip6EroAA7H/6WpHJEp1
 ietxAAaOcK8zwUoPMQK0Dtzk46vwklUXdNAFqI3Iatv9A==
X-Received: by 2002:a05:600c:8709:b0:4a0:20c7:6d4c with SMTP id
 5b1f17b1804b1-4a18e3eccebmr193751195e9.0.1791818526154; 
 Mon, 12 Oct 2026 08:22:06 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bc85b1sm8340f8f.54.2026.10.12.08.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:22:05 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:22 +0200
Subject: [PATCH v2 29/50] tests/qtest: ds1339: cover the day-of-week
 counter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-29-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815521; l=2630;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=K9HOm83SsQOK9R4XDnsjhxDGcTLTCjXMrgk6bTqgUo0=;
 b=becHwSrqJhCcJAcvCpfFfr3igfA+ZHnrM6SShPCihQ1wDv3AdB0mXZW/d11ZJMqrAuh/S/IOF
 XBHKs7RokgPDlhEPwCvo3TG/wgfxZxNBZYRJDCMcpGRTBDEwfIBm2Zc
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.42; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f42.google.com
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
2.50.1


