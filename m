Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BED0C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:14:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxVF-0003fN-Fl; Mon, 06 Nov 2023 06:10:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxUc-0002cI-6c
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:10:12 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxUX-0005iB-I6
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:10:05 -0500
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c50fbc218bso53680681fa.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268999; x=1699873799; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MGUqOvUDBSiuVjcJL6HNGd3FosLBI9RMurHd3wgpnc0=;
 b=UM/kvCtl5sMb4dU0M0RhM3utLMRVEe44EiQluYmQMRPIJBIeygRHNutW6Axx9RFStf
 cOyoDiv5mpOZkVW8tQPFhsSoWecJTow03yjIwqaFQ3O41yKBfeWUREylR/kS+wQN2yq9
 +UxEuRaRfjekMwmL3YrlkcVnKrOLR+44bAKBi0+W1QZK/uW4ErfSnHP1GvipmlA5U3w2
 cf16waTBJyWbLLxRh4GPe8aVWOmInEtyrHdG+9sga/3aIvhTbYHiVM37z8b/dwyeF6T/
 vStH1506Pa/tISHjccY+kunBexR+BH+psTEpKMElTFXUi+kRMykgP7KXd1kxVFEd/yjn
 pjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268999; x=1699873799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MGUqOvUDBSiuVjcJL6HNGd3FosLBI9RMurHd3wgpnc0=;
 b=uVlJpYcWNdiAES1cRA2k4hky/1xefJr7EL0oiEjP6+ScMotBI4BWe20dnYhS/4zOD4
 C1dC3ymvmuHXcu4joZr0V4lzR6UDgy1jRtw5GhBlRaQOQ6zSWbsbnkISmN+E287UaV4n
 NtE1L+BugjKjiScE5VQ5W8e1ymqDjOPdLBQBhSri57BAD3ANVy/oUeqNKY8Vyn44wp46
 m/N6LzglWOq+572U1nL5xFz5sI9HVZBvmx5xiXDhWIYLlTZNVmTtI1/LtooVfNyvyOLH
 DbJinDIKxbYwOj0a+7hIPX/nuuyJvzm4VblVd/JZLgDSBGbpdGeXyjI6jlRkFUG7oSk3
 JDfg==
X-Gm-Message-State: AOJu0YzeCGXoKVpWaLUDHIMGokPknJT0nKvJZOZHJXRVUU3QYDFZyD8D
 c4GZT7M9TGR7K6s0cmohmM4qaw==
X-Google-Smtp-Source: AGHT+IFzu+WNTNvikEhT3RfrTXgUYqfUsIePLUoFbNzyRmjcJbd74z4iaBvydg4KqQIGnFcZE2qYAg==
X-Received: by 2002:a2e:8719:0:b0:2c5:1075:5ec9 with SMTP id
 m25-20020a2e8719000000b002c510755ec9mr21956567lji.13.1699268999654; 
 Mon, 06 Nov 2023 03:09:59 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b0040596352951sm11684422wmq.5.2023.11.06.03.09.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:09:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 56/60] hw/i2c: pmbus: reset page register for out of range reads
Date: Mon,  6 Nov 2023 12:03:28 +0100
Message-ID: <20231106110336.358-57-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Titus Rwantare <titusr@google.com>

The linux pmbus driver scans all possible pages and does not reset the
current page after the scan, making all future page reads fail as out of range
on devices with a single page.

This change resets out of range pages immediately on write.

Also added a qtest for simultaneous writes to all pages.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
Message-ID: <20231023-staging-pmbus-v3-v4-8-07a8cb7cd20a@google.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/pmbus_device.c       | 18 +++++++++---------
 tests/qtest/max34451-test.c | 24 ++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 481e158380..1b978e588f 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -1255,6 +1255,15 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
 
     if (pmdev->code == PMBUS_PAGE) {
         pmdev->page = pmbus_receive8(pmdev);
+
+        if (pmdev->page > pmdev->num_pages - 1 && pmdev->page != PB_ALL_PAGES) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: page %u is out of range\n",
+                          __func__, pmdev->page);
+            pmdev->page = 0; /* undefined behaviour - reset to page 0 */
+            pmbus_cml_error(pmdev);
+            return PMBUS_ERR_BYTE;
+        }
         return 0;
     }
 
@@ -1268,15 +1277,6 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         return 0;
     }
 
-    if (pmdev->page > pmdev->num_pages - 1) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                        "%s: page %u is out of range\n",
-                        __func__, pmdev->page);
-        pmdev->page = 0; /* undefined behaviour - reset to page 0 */
-        pmbus_cml_error(pmdev);
-        return PMBUS_ERR_BYTE;
-    }
-
     index = pmdev->page;
 
     switch (pmdev->code) {
diff --git a/tests/qtest/max34451-test.c b/tests/qtest/max34451-test.c
index 0c98d0764c..dbf6ddc829 100644
--- a/tests/qtest/max34451-test.c
+++ b/tests/qtest/max34451-test.c
@@ -18,6 +18,7 @@
 #define TEST_ID "max34451-test"
 #define TEST_ADDR (0x4e)
 
+#define MAX34451_MFR_MODE               0xD1
 #define MAX34451_MFR_VOUT_PEAK          0xD4
 #define MAX34451_MFR_IOUT_PEAK          0xD5
 #define MAX34451_MFR_TEMPERATURE_PEAK   0xD6
@@ -315,6 +316,28 @@ static void test_ot_faults(void *obj, void *data, QGuestAllocator *alloc)
     }
 }
 
+#define RAND_ON_OFF_CONFIG  0x12
+#define RAND_MFR_MODE       0x3456
+
+/* test writes to all pages */
+static void test_all_pages(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, PMBUS_PAGE, PB_ALL_PAGES);
+    i2c_set8(i2cdev, PMBUS_ON_OFF_CONFIG, RAND_ON_OFF_CONFIG);
+    max34451_i2c_set16(i2cdev, MAX34451_MFR_MODE, RAND_MFR_MODE);
+
+    for (int i = 0; i < MAX34451_NUM_TEMP_DEVICES + MAX34451_NUM_PWR_DEVICES;
+         i++) {
+        i2c_value = i2c_get8(i2cdev, PMBUS_ON_OFF_CONFIG);
+        g_assert_cmphex(i2c_value, ==, RAND_ON_OFF_CONFIG);
+        i2c_value = max34451_i2c_get16(i2cdev, MAX34451_MFR_MODE);
+        g_assert_cmphex(i2c_value, ==, RAND_MFR_MODE);
+    }
+}
+
 static void max34451_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -332,5 +355,6 @@ static void max34451_register_nodes(void)
     qos_add_test("test_ro_regs", "max34451", test_ro_regs, NULL);
     qos_add_test("test_ov_faults", "max34451", test_ov_faults, NULL);
     qos_add_test("test_ot_faults", "max34451", test_ot_faults, NULL);
+    qos_add_test("test_all_pages", "max34451", test_all_pages, NULL);
 }
 libqos_init(max34451_register_nodes);
-- 
2.41.0


