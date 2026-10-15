Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF09CC6B33
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:32:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIiq-0000I6-Dp; Thu, 15 Oct 2026 06:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIgE-0003xG-0A
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:27:22 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIgB-00045s-Ac
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:27:20 -0400
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a1682bff3cso8641265e9.1
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060038; x=1792664838;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=D3hF72qvu3mgNYGBtKwkXMBkTiV/O1VMMDWIM4mwyd4=;
 b=hSszONVAFOhikn2e/LtVy2HtyZse9fm+M4GDId8f6bHyYaiK/MxGR+CVRZ2oxPc7rs
 fdGJFPbQmk3QulWsRqSteCattLPl8fXZ3e+hQhhlkLjHMIQgmoVof7MSgGb+V9ccd4uH
 bOD/fRn49nJs7qtPIrEvOpD0VZ2d1O3DFTCDH+JmOLfF0VAhE+CjnKcsIBjIEajDiwDJ
 G5lea+VpbN4udJ6uMRMcXNX+HhFR8UNUe6yr+ciyEB7nbE94QFNEvKei2KxRmb4LG2gD
 bv0SCYok1R9m5luG0nDFuCeSNfITlMHpPswpMgmLuj1lke8y9hIOTyh8w7NSlPzRfIdx
 7o8g==
X-Forwarded-Encrypted: i=1;
 AKwUvBy6BmQpn2L6+agg8BLN1rO1Rz+jaO3RfH+QTkcoIb3pgG3PN5AfWww0f2g8MKcSgcC1KyuWXV6QNcq3@nongnu.org
X-Gm-Message-State: AFq9FYIN8q7wD8k4/Mo2h1g2oxcQUOHkPmNJh/t0a4csSJIs12d9k7eK
 s6U0qbCDXG5zDOSHCxRV6KO/4S6dO/PlshCJ65X3mNaUtiA0Ns2E3RGE
X-Gm-Gg: AYBFou1dyn2Cq7gsveIDEqIFJS0pU9x/b+8/rSU/JaOHKawiT60M8i1WJBTewXc9nWQ
 1YKw9qVFZym7JFT2UZTjERHhBdpl4ZAtFj+5Lv9UD+Km75ep5gedIeg8VMv3ubvcGDemTm7z3zF
 eAUnb+7xPGxEbrPJjC8xrOfktqkMrq7RQyAzYbYk88AP/76rB3CQBML7EOjfZlycsXOx1NSzovF
 VrcKP5sofQl7O13TNNbPouxSSxWVmxiDjdt7V1qm4+ae9GVC0PdEqbrMpt2sbWoin0i1nLS1V5Q
 M1GdUjiY+JM/HL729Apx7kre2DT13GKd6SgKIpMyY5hx0vCKgEE+xCc2Z8wUEKskaY78EnWhCWD
 WPVTBxoLxH4Or/ERXbfVLAaPqGIjaNoIVUwlW149f/kS/O57qGQng780Xk/qQa6ebny8GpJI5t5
 +5bihuVv/Hzpnsm0z5f+jF2UYeCZUExZHLZazZ1z1nwP2whUHqoSPCrJn2i1bO86J3I5nr+GQ10
 KlzgCDz2lAGnBNLW7FNkXQJH27miKtZh5Wmr1b1OBO49Q==
X-Received: by 2002:a05:600c:6215:b0:49f:ff32:8044 with SMTP id
 5b1f17b1804b1-4a18e47a88fmr344547825e9.7.1792060037886; 
 Thu, 15 Oct 2026 03:27:17 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd9a8a22sm67733135e9.5.2026.10.15.03.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:27:16 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:15 +0200
Subject: [PATCH v3 28/50] tests/qtest: ds1339: cover the 12-hour format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-28-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056476; l=3522;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=H+2NRBVduAD0kusIRvsLO1TF7emsp4ss30ZRGVmVNhU=;
 b=kgK1KOPriKfBLbra3npt1yfQDCgIZ5Ia6Ofrho6uYIjWiv8TpzKN46QhjNPpHBvqVL30yNJIW
 NTjCTEsudIYDN/W7HJUesZVdgUjISErDmefewuWFeR0ayIImBYX2DXK
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.49; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f49.google.com
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

Both directions of the 12-hour conversion carry a fixup for midnight
and noon, and neither had been exercised.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1339-test.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tests/qtest/ds1339-test.c b/tests/qtest/ds1339-test.c
index 7eec163049..3259fa1df3 100644
--- a/tests/qtest/ds1339-test.c
+++ b/tests/qtest/ds1339-test.c
@@ -14,6 +14,7 @@
 
 /* DS1339 register map */
 #define DS1339_SECONDS   0x00
+#define DS1339_HOURS     0x02
 #define DS1339_DATE      0x04
 #define DS1339_MONTH     0x05
 #define DS1339_YEAR      0x06
@@ -26,6 +27,9 @@
 
 #define DS1339_STATUS_OSF 0x80
 
+#define DS1339_HOURS_12  0x40
+#define DS1339_HOURS_PM  0x20
+
 /* The clock and calendar come up on the host time. */
 static void test_time(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -170,6 +174,46 @@ static void test_eosc_restart(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(resp[6], ==, 0x31);
 }
 
+/* Midnight and noon are the hours the 12-hour encoding special-cases. */
+static void test_hour_mode_12(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    const uint8_t tod[3] = {
+        0x59, 0x59, DS1339_HOURS_12 | DS1339_HOURS_PM | 0x11 /* 11:59:59 PM */
+    };
+    unsigned idx;
+
+    i2c_set8(i2cdev, DS1339_HOURS, DS1339_HOURS_12 | 0x12);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_HOURS), ==,
+                    DS1339_HOURS_12 | 0x12);          /* 12 AM is midnight */
+
+    i2c_set8(i2cdev, DS1339_HOURS, DS1339_HOURS_12 | DS1339_HOURS_PM | 0x12);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_HOURS), ==,
+                    DS1339_HOURS_12 | DS1339_HOURS_PM | 0x12); /* 12 PM noon */
+
+    i2c_set8(i2cdev, DS1339_HOURS, DS1339_HOURS_12 | DS1339_HOURS_PM | 0x01);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_HOURS), ==,
+                    DS1339_HOURS_12 | DS1339_HOURS_PM | 0x01);
+
+    i2c_set8(i2cdev, DS1339_HOURS, DS1339_HOURS_12 | 0x11);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_HOURS), ==,
+                    DS1339_HOURS_12 | 0x11);
+
+    i2c_set8(i2cdev, DS1339_HOURS, 0x13);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_HOURS), ==, 0x13);
+
+    /* An elapsed midnight moves 11 PM on to 12 AM, not to 00 or 13. */
+    i2c_write_block(i2cdev, DS1339_SECONDS, tod, sizeof(tod));
+    for (idx = 0; idx < 50; idx++) {
+        if (i2c_get8(i2cdev, DS1339_HOURS) != tod[2]) {
+            break;
+        }
+        g_usleep(100 * 1000);
+    }
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_HOURS), ==,
+                    DS1339_HOURS_12 | 0x12);
+}
+
 /* Program 23:59:59 on the last day of a month and run the clock past it. */
 static void check_month_rollover(QI2CDevice *i2cdev,
                                  uint8_t date, uint8_t month, uint8_t year,
@@ -370,6 +414,7 @@ static void ds1339_register_nodes(void)
     qos_add_test("eosc-restart", "ds1339", test_eosc_restart, NULL);
     qos_add_test("stopped-reserved-bits", "ds1339",
                  test_stopped_reserved_bits, NULL);
+    qos_add_test("hour-mode-12", "ds1339", test_hour_mode_12, NULL);
     qos_add_test("month-28-days", "ds1339", test_month_28_days, NULL);
     qos_add_test("month-29-days", "ds1339", test_month_29_days, NULL);
     qos_add_test("month-30-days", "ds1339", test_month_30_days, NULL);

-- 
2.53.0-Meta


