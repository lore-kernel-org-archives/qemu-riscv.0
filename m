Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A971CC79FA0
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:15:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3ctr-0001yO-Js; Mon, 07 Sep 2026 13:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cVl-0002qQ-MQ
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:48:01 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cVi-0003uE-9b
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:48:01 -0400
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49b965570d7so44219885e9.0
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 09:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799676; x=1789404476;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LphZT+IzejkArL3oUvhqeY3sCcOug01WUt4J0/5+FMM=;
 b=VVZtNAGighlHWTVsCzSDb2Zw9dYyS43TdtM+FFgKnEXE9anl52rM7A8OA6Agg3CCey
 /Hf5B8SNPKkuP+t5bgUXHjioEB5S41VTm2LLz/M9sHLFGHFvotLF6aAOYi0dbakxcNsl
 Z6J+qf1or/wAVNwtqktrww4SBBs7pkX910jfCklKsUtebL/pbziqtrutjks2SxuaPqI/
 3UtbSIpGtIsVLHJZCMTAsZ1v4ry60+mjcyxGfdf+1K//4BkuXyAJNJLJYOOO4UnE6iE5
 kHy3w+4XlNZN/gDRVU5GQOgoo43Ae7Cp3K6XTzT+plwo3bdsLS9ZPjn9JMNBAYEdXbL6
 3/Pw==
X-Forwarded-Encrypted: i=1;
 AKwUvByRW1W7bSgYHVqnMVgCqya7bylMtz0/idTuLzdwynsvdKCKBPe6l04o5hHf28Kvev0K3T0B3MeBSCbw@nongnu.org
X-Gm-Message-State: AFuF++kXMtrnF5s0JUtXVBLPAXj66xuFbB9x4B29icI8PSL/CAi8zAES
 gH1JRKGt2Jjp+Y6Qgss9n3TZEt0P9V4cvH7KE5X7nzNewTN7mcoWLilA
X-Gm-Gg: AYBFou1Q/zKDjgV98kvI3QBpph66kE30b8kKTV7I5os7K+F/+wC+WMFSMTw04zRZ0ty
 z5a9WTcNsHL68ddncUcdFlZQ2k1lrjnTY2EFGJQq9TTQXlvikRIkN65ZOTdmcLmfg9pmMIAaidi
 V65nuzys9LHuNZ+kpP3/yxEDpB6bWqMndZyBJl23PUUmpfAFpSzBZbg3S40jJt7mWVQ2A2xbQYy
 ytOjMsTBeYH1Iu+MmZ/HQPaf2nJddT/llyJl9mhKpW54hfwM7oWqEm0EgpdwurYiV0g9JO7ZvYN
 4TCYN9t7LU+jlVIT2S4dEShAJ2LLobBcmGl52fmCFkVj+OY4jRUXR1rDzDYUAT/4Egc4DoY5ib3
 7vW1IM1YrF2Immwk0x1y8Zm6ww7aprFBOT7w7L2zP4sK4wFZR5Cd7p5a7XP/zfxlPzX7vmZ7Ebh
 G4ux+4lht+vm1MniluMXFcOUAElumt9qBljopzqhst2JKtVcOnNB7rQLWfr5V6fUdc6/5j5uThH
 J9hHdQpfvBDe3hR/FtYe/ijfgTSDNeLVVU=
X-Received: by 2002:a05:600c:4714:b0:49d:462:6eda with SMTP id
 5b1f17b1804b1-49d04627387mr147409055e9.28.1788799676293; 
 Mon, 07 Sep 2026 09:47:56 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d00a5b19dsm256272105e9.2.2026.09.07.09.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:47:55 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:18 +0200
Subject: [PATCH 28/50] tests/qtest: ds1339: cover the 12-hour format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-28-0d83ad610c3b@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799321; l=3517;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=d52DOv2V3QB3CGvMZYkl6mYb22coBmAW9Fq+mpMglf8=;
 b=8YgWFhQAHFckAd2VW3wFUmavs5Bco2/obcvgu7M/qizAK5VPt6XBRsk08kjKwkLhWfijPK4Y2
 8pQQ88Q1t3YC4kI6csgDojdwBWslTEvHTHBOUQoQtO+YnxF+6vyMBKB
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
2.50.1


