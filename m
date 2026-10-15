Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA9CCC6B34
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:32:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIgs-0006aR-Lz; Thu, 15 Oct 2026 06:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIfq-0003Bb-0m
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:27:01 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIfm-0003zF-3I
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:26:57 -0400
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a0213948d3so31239045e9.2
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060009; x=1792664809;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=T+aQuOytqkO9L6viQdmuDORw5uxFjnolQFIJ54bA1P8=;
 b=e0TcB0N8QDV6QZUu+fdtEmRz5h9tW/7i0FaekDzz76Hq6eDtao7oAaVPFFPvbHQgLl
 jpRjWPyA0yAIVHf2MxzTfnBsdeabO6ynfD8u4VzOVYegxsmxb6WdxXt+6GJOd8nP2I8P
 /GUuFu67IHjJEx6mvTNkOsEcpSCNopB8JIZwl/pVuSqDKkjHGcdTGE10nzAfty0HicAE
 vhRf97CFQ+6im0nUETRu3ePkbj32PfBKidRq7cLzZ3sahWVW+GG/gR/hfzjKstT6dzFl
 txJtYaZW40i9mz2X2fHgiKRR76H/gUPHKUWQAmhp8avouWzaC2qIq8l4o+KVSwSpnqnV
 Ufpw==
X-Forwarded-Encrypted: i=1;
 AKwUvByg6Nz5sSOndeo3BnkxqwOeXWEz5TGh8x/KkDygIQVQc0qcpPPknkKWDqP2YAdDJu44B02Wx5gXmg/f@nongnu.org
X-Gm-Message-State: AFq9FYKSO/OnjfRxDEeLVM3DUMvT3CbgXwkNVg4N9N+6wnMbYhGqBJOW
 FIAU/YHAv3kuJCAW4UB5w80ZONIouhfrQdGZ6eZROIcIlyXItbUPg/Mx
X-Gm-Gg: AYBFou1Ley+Aj9AntIGfepgschrQ+VpCS+fnyOCCOBTUx9B5MFCLRU4o6MJJqXHdM/G
 WccW7AYlbnj6vOAKqfZ+YKqplkI8eB66ywAgpHzho2cUu/sCQtak7wZoVFXFFfKGDyXwm/1MY3l
 8aFAasM9EZPeRu+3j1ibijvP077eiEFQRolIfYCWnRqbOGtua3uEQfaBJVK0cBgMUXFAPFyeOen
 VdjD3XJgh3Qhv2cVYxofWbszBgMCnAxd4dU3J33ZvYb9Ajk3aB4FWDIAZJct4oUs6SyqkjK67vc
 1ZbBu567VwO4oBoM4kWm6jomBNS56h92jjkE3NOY/ktQxXVKAe1LsdQfbm6xRDZJS1byXuWC9P1
 FvsuSrN1xjmM+RJxqpTgJ70hAnqpYsajtj8ol4ZG0JtzPXIp8iCxRZiPzcb0nH/ZCgtIJxotXTG
 Zk6IFvVUga7CAz7iG9Ymg0UEzZIwpHq48l9SK2lHFg2O9Cbr+y5oJhP2jG1hHSUC9NMEy0UIK31
 zLY1VvUZ4rwJrFwuVqKxRYSptar/dm9UoCWi9+RpZiTYw==
X-Received: by 2002:a05:600c:609b:b0:49f:ce78:356d with SMTP id
 5b1f17b1804b1-4a18e4c9944mr370499565e9.30.1792060009306; 
 Thu, 15 Oct 2026 03:26:49 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd993caesm121133065e9.12.2026.10.15.03.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:26:48 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:11 +0200
Subject: [PATCH v3 24/50] tests/qtest: ds1339: cover power-on defaults and
 reserved-bit masking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-24-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056476; l=3431;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=4kpdPaxvZVkT90Xwee/1AVTNKhV96yGus/onpPPZ95Q=;
 b=i3Tm8leRLj5bP7SHK5ToXEEgS5s3WTD7f43095ebsS1hBelVa0cpcDUuTM0EaI9F0Q8wG8ZQy
 UvLwr0l3A4AB4q+6NJQNd/wdwF8J7p+WoZJQB/I0Ipfy8Z6IYqUgPvC
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.43; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f43.google.com
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

Neither the power-on defaults nor the reserved bits of the register
file were pinned.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1339-test.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/qtest/ds1339-test.c b/tests/qtest/ds1339-test.c
index 08fc16acda..e9dcdc36da 100644
--- a/tests/qtest/ds1339-test.c
+++ b/tests/qtest/ds1339-test.c
@@ -74,6 +74,53 @@ static void test_osf_write_protect(void *obj, void *data,
     g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF, ==, 0);
 }
 
+/* The control and status registers come up in their power-on state. */
+static void test_reset_defaults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_CONTROL), ==, 0x18);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS) & DS1339_STATUS_OSF,
+                    ==, DS1339_STATUS_OSF);
+}
+
+/* Neither the reserved status bits nor the alarm flags are guest-writable. */
+static void test_status_register(void *obj, void *data,
+                                 QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, DS1339_STATUS, 0x7c);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS), ==, 0x00);
+
+    i2c_set8(i2cdev, DS1339_STATUS, 0x03);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS), ==, 0x00);
+
+    i2c_set8(i2cdev, DS1339_STATUS, 0xff);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1339_STATUS), ==, 0x00);
+}
+
+/* Reserved time-register bits read back zero even with the clock stopped. */
+static void test_stopped_reserved_bits(void *obj, void *data,
+                                       QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    const uint8_t all_ones[7] = { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
+    uint8_t resp[7];
+
+    i2c_set8(i2cdev, DS1339_CONTROL, 0x18 | 0x80);
+    i2c_write_block(i2cdev, DS1339_SECONDS, all_ones, sizeof(all_ones));
+
+    i2c_read_block(i2cdev, DS1339_SECONDS, resp, sizeof(resp));
+    g_assert_cmphex(resp[0], ==, 0x7f);
+    g_assert_cmphex(resp[1], ==, 0x7f);
+    g_assert_cmphex(resp[2], ==, 0x7f);
+    g_assert_cmphex(resp[3], ==, 0x07);
+    g_assert_cmphex(resp[4], ==, 0x3f);
+    g_assert_cmphex(resp[5], ==, 0x9f);
+    g_assert_cmphex(resp[6], ==, 0xff);
+}
+
 /* The register pointer wraps at the end of the map. */
 static void test_address_wrap(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -155,8 +202,12 @@ static void ds1339_register_nodes(void)
     qos_node_consumes("ds1339", "i2c-bus", &opts);
 
     qos_add_test("time", "ds1339", test_time, NULL);
+    qos_add_test("reset-defaults", "ds1339", test_reset_defaults, NULL);
     qos_add_test("control-register", "ds1339", test_control_register, NULL);
+    qos_add_test("status-register", "ds1339", test_status_register, NULL);
     qos_add_test("osf-write-protect", "ds1339", test_osf_write_protect, NULL);
+    qos_add_test("stopped-reserved-bits", "ds1339",
+                 test_stopped_reserved_bits, NULL);
     qos_add_test("address-wrap", "ds1339", test_address_wrap, NULL);
     qos_add_test("block-wrap", "ds1339", test_block_wrap, NULL);
     qos_add_test("alarm-registers", "ds1339", test_alarm_registers,

-- 
2.53.0-Meta


