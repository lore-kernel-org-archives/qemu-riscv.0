Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB0ACA9EC5
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:19:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHnZ-0004u2-Hj; Mon, 12 Oct 2026 11:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHmt-0004Vf-Gl
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:18:06 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHmr-0000GU-JW
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:18:03 -0400
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so17284165e9.0
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791818280; x=1792423080;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9Z7GCM1tL+WVU4df/9TtqoR10rm4Dif9ExOLVyo6FeE=;
 b=fAlHqesM4XQ78NdInNNPYQGvhaqtOJpoxv+VLCKT/EonHaFNmv2kV/1jjstYi+hAL0
 CQv0Mimo/tLVStb0Yhj6CzoxuMkDlZdDTV8uhzR5kZR6SfZd9JOlL4oM9jpxrKG0WWON
 Mixk17Ld+TBVNlqfEu1XPCh0oW4n3ecX8Szjy3yTesHOCNBn+0AArYhIfRSGGIGeDJIR
 +zX//NeTSde7GnWdZUL2uoQ/FwO57fJj3HSbW/ac6kiecqZFbq9npZHY4m8P4U2Esu9s
 +rod/M68ZcMuhT+JOOW1YolHZV0lINzWMrjK+6dx5y3Cnu/rjZAmXuVLgJWFbsnfeVBQ
 vDMA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw/Xa2NV8n+R7Wd7d+A7Pg+YgVZQnnHVlXEeklz0V0QaPBQvqGSiSfw3Rie0Lcv/kuoi8Ky5ZZumPW/@nongnu.org
X-Gm-Message-State: AFq9FYLMsV+V6M0t/L11Sc27Rjg+XkocI0zJ0OUppofLkLZPAVo69AZy
 TPpsbs7Ta+nzLkbfaQBiNrp1sjSNsOty5ICErbaODZeuWBVOH4lcTUw0
X-Gm-Gg: AYBFou08v5y8OvZ715sMVsufzj8ERiVLRXlpi4zjUb7SsHWI+0JS6rIRD58sXsExxp7
 BMO3GdQzeD05jLOjiUABvGPmNJRc0pP2fEeBqA1HZ7clIba7IysTO2p+Xb10+E3xva3IVZl6kNv
 sNSbtWt1Y6QaG+KVws8i/rZj2iYTLTD7O5qZxSNtJ+cnDvIw2FHi6AMoKKW7tKqOIL+118DZf0S
 1KY72PvRwiVbgUJVxJW0DmQoug5cN6RAesw+FjtTsCOhoDKQlnostAGryP4SAehOGV+xjIwc+6Y
 Gj5i7mTbjDqUt0QUbyD1IsPnaT7zTltgDOtHcPkXCyeyUTrenqGZr+LL/3Lz5KAN6WIEIsNusQ+
 gWlNYgqQf/7WFe8R4v3LaRBWyszIpJBzBDViV6ABPT8PSDmdnTDKjtN3NwJ9Jpvs40rgL9rsxQV
 DX55auhEo52BHdDYhwqIlft0Evx6y/jQacYjV+FIkIJoPYVvjgGcd9DiCM3etY0uVfC5GTincPK
 DKsFb4oMAUuyCh8lrX4v/laRwOkYF0nw7IIyhj0LPbVkw==
X-Received: by 2002:a05:600c:1908:b0:49f:ce73:5e94 with SMTP id
 5b1f17b1804b1-4a18e4dd018mr188370435e9.34.1791818279914; 
 Mon, 12 Oct 2026 08:17:59 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18c198134sm295148385e9.15.2026.10.12.08.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:17:59 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:18 +0200
Subject: [PATCH v2 25/50] tests/qtest: ds1339: cover oscillator
 stop/restart and time programming
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-25-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815520; l=3342;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=esijdRHOnlyhX21Z9j9OPDDssjLY1EB+c0uBQYJ2KSk=;
 b=MOw9N0s++3yN+hGM84UByGLThnpwrDptXO0NVpuP8imLKb9i9JGfkbB2+yFmtD/IakBybU0eD
 x/zpIsCjoc1AESXcxuUaKya2XFIs8q9A2Gt+kM8DgPDo/b2aoGY9uf4
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

Stopping and restarting the oscillator had no coverage, nor did the
time the clock resumes from.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1339-test.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/qtest/ds1339-test.c b/tests/qtest/ds1339-test.c
index e9dcdc36da..ac19ebd71d 100644
--- a/tests/qtest/ds1339-test.c
+++ b/tests/qtest/ds1339-test.c
@@ -121,6 +121,54 @@ static void test_stopped_reserved_bits(void *obj, void *data,
     g_assert_cmphex(resp[6], ==, 0xff);
 }
 
+/* Setting EOSC stops the oscillator and sets OSF; OSF outlives the restart. */
+static void test_eosc(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, DS1339_STATUS, 0x00);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF, ==, 0);
+
+    i2c_set8(i2cdev, DS1339_CONTROL, 0x18 | 0x80);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF,
+                    ==, DS1339_STATUS_OSF);
+
+    i2c_set8(i2cdev, DS1339_CONTROL, 0x18);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF,
+                    ==, DS1339_STATUS_OSF);
+    i2c_set8(i2cdev, DS1339_STATUS, 0x00);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF, ==, 0);
+}
+
+/* A stopped clock resumes from the time it was programmed with. */
+static void test_eosc_restart(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    /* 10:20:30 on the 12th of July 2031, the day counter reading 2. */
+    const uint8_t tod[7] = { 0x30, 0x20, 0x10, 0x02, 0x12, 0x07, 0x31 };
+    uint8_t resp[7];
+    unsigned idx;
+
+    i2c_set8(i2cdev, DS1339_CONTROL, 0x18 | 0x80);
+    i2c_write_block(i2cdev, DS1339_SECONDS, tod, sizeof(tod));
+
+    i2c_read_block(i2cdev, DS1339_SECONDS, resp, sizeof(resp));
+    g_assert_cmpmem(resp, sizeof(resp), tod, sizeof(tod));
+
+    i2c_set8(i2cdev, DS1339_CONTROL, 0x18);
+    /* The seconds counter steps within a second of the restart. */
+    for (idx = 0; idx < 15 && i2c_get8(i2cdev, DS1339_SECONDS) == 0x30; idx++) {
+        g_usleep(100 * 1000);
+    }
+
+    i2c_read_block(i2cdev, DS1339_SECONDS, resp, sizeof(resp));
+    g_assert_cmpuint(from_bcd(resp[0]), >, 30);
+    g_assert_cmphex(resp[2], ==, 0x10);
+    g_assert_cmphex(resp[4], ==, 0x12);
+    g_assert_cmphex(resp[5] & 0x1f, ==, 0x07);
+    g_assert_cmphex(resp[6], ==, 0x31);
+}
+
 /* The register pointer wraps at the end of the map. */
 static void test_address_wrap(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -206,6 +254,8 @@ static void ds1339_register_nodes(void)
     qos_add_test("control-register", "ds1339", test_control_register, NULL);
     qos_add_test("status-register", "ds1339", test_status_register, NULL);
     qos_add_test("osf-write-protect", "ds1339", test_osf_write_protect, NULL);
+    qos_add_test("eosc", "ds1339", test_eosc, NULL);
+    qos_add_test("eosc-restart", "ds1339", test_eosc_restart, NULL);
     qos_add_test("stopped-reserved-bits", "ds1339",
                  test_stopped_reserved_bits, NULL);
     qos_add_test("address-wrap", "ds1339", test_address_wrap, NULL);

-- 
2.50.1


