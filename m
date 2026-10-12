Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32B4CA9ED1
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:13:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHi0-00024L-OD; Mon, 12 Oct 2026 11:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHhz-000230-9V
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:12:59 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHhw-0007yJ-DZ
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:12:59 -0400
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so17236765e9.0
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791817973; x=1792422773;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=CE66LIeSclgE4NkiTTrzb49MDOENKPAt6wmOxVbF85E=;
 b=SCQ4rGpMIsH3E6q+DSK9P27AiCJlLgJt3Ed4wxrbpPKQG3i1kUjaTH+ZWG31sUOdCm
 oUv2j+cNodCQIvxR++BQAatWT8SXBg4zXxbBzRxy5tuUhJ1thPWZLS72Vx+FK8gJmwFJ
 +UaP3lDvT2Yvna1sZbnFdrXshClhx9fxA17r2I3VgdxkOo8C5lfpheVuLzdhkupRyWSm
 2Xt9Dd5QvuAm1J+7UH95axDPXwGtmJx0+/n1n+PtHal7YYAFu29e9XeWpjS4GUmTjrix
 Bksjp6yu7FAcPGS9VMtK8Tgzjr6GcI3o8Jnf4zcPG66ytLP8HesBxfqY+aH/LVd1AtlJ
 KCog==
X-Forwarded-Encrypted: i=1;
 AKwUvBxmIxwSbHuXxn8tJpmM8dqTyVLESIjoXTFPJtzzeDGQnm6POP4ipwKcpp26/MQr50oxoDPrFIncHppm@nongnu.org
X-Gm-Message-State: AFq9FYKKZZ0F0HECaLu3c2hkQuUsa0cLrcoN7P5NDskUKGldtm1pZuC5
 3pWYhHsMUt6gN2dhHg9zme4D+NoVQF1Qof/cyANAH8igd/EClV5SbLEg
X-Gm-Gg: AYBFou16BUER78pp83mtpFn4si28lXS4JHPIIngThEJ2+LdLaT6QsGv6vU5hZuV+G5n
 in0kmbRbcwRXqL9jjQ7ZrwnUgXaN8XcdJchGtAs3oEl9E9G8jRVvNNB+FJHKNXPLRCieEC3zqdT
 5+g7KQqemPy6Z74ix1gVXpiVnZ3S3j6qoZ6FfB5PuJ8VBnkYVeVjNC1OEhAiN0/PZy6/sS45vKO
 hmmD5aulS4uvIvqSbxTfWX7KMyD48zhySnnePRfiM2m/DNi2IwOHUHA2WPAJNBDFhtfVwcrqAw4
 fFlo7YmGQcdi+kzYZNOKFvKbx2xa5GNeTvwZbUKElldhNbkwiSqWdjqWmsf9dELaZGE+m4OkUJJ
 wYCZiPSej9SWx1J7jJhN01wHNUvphMCDwR+I3LXWP2zfLJIHVSUYOZ3KPwiLPhV5xxbaKVPJwrD
 sEzpPkR39BTnXXflx6E0v+H1Omkr2PsUGK77u+RCywXCBskxNHLWLWnsX4GBfirPW0UJ5lYhku1
 ur5aH3WixWzPK4Ksbg7/taGPJbvj89ke9LZcJV9kiPR11A=
X-Received: by 2002:a05:600c:5247:b0:4a1:6991:36d7 with SMTP id
 5b1f17b1804b1-4a18e49d570mr182551895e9.10.1791817973142; 
 Mon, 12 Oct 2026 08:12:53 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db98c2800sm19934060f8f.26.2026.10.12.08.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:12:52 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:13 +0200
Subject: [PATCH v2 20/50] tests/qtest: ds1338: cover persist-on-reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-20-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815520; l=3608;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=whBRDkq86D+HpAogEE9qlSe08li7AMBnF3gE+b/1tiI=;
 b=oylJ/3/R/JR+puOD69en13ppagms6hP/Q1YumayLxX1u2VKcVoQ0z5PHE0+X6J0iOyuwhwp5N
 Y4kwiNuyQ6rDMibV7fOZrGDEe2s3B8JrU3weIPpW+sIxGq9KfB7OajV
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

The property had no coverage in either of its two settings.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1338-test.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tests/qtest/ds1338-test.c b/tests/qtest/ds1338-test.c
index 1b73dca98d..1b9c02d931 100644
--- a/tests/qtest/ds1338-test.c
+++ b/tests/qtest/ds1338-test.c
@@ -20,12 +20,15 @@
 #include "qemu/osdep.h"
 #include "qemu/bcd.h"
 #include "libqtest.h"
+#include "libqtest-single.h"
 #include "libqos/i2c.h"
+#include "qobject/qdict.h"
 
 #define DS1338_ADDR 0x68
 
 /* DS1338 register map */
 #define DS1338_SECONDS   0x00
+#define DS1338_YEAR      0x06
 #define DS1338_CONTROL   0x07
 #define DS1338_NVRAM     0x08
 #define DS1338_NUM_REGS  0x40
@@ -136,6 +139,50 @@ static void test_nvram(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get8(i2cdev, 0x3f), ==, 0xc3);
 }
 
+/* A reset restores the power-on state, unless persist-on-reset is set. */
+static void check_reset(QI2CDevice *i2cdev, bool persists)
+{
+    uint8_t year = i2c_get8(i2cdev, DS1338_YEAR);
+    /* A year the clock is not already showing, so the check discriminates. */
+    uint8_t marker = year == 0x42 ? 0x77 : 0x42;
+    QDict *rsp;
+
+    i2c_set8(i2cdev, DS1338_NVRAM, 0xa5);
+    i2c_set8(i2cdev, DS1338_CONTROL, 0x00);
+    i2c_set8(i2cdev, DS1338_YEAR, marker);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_NVRAM), ==, 0xa5);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL), ==, 0x00);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_YEAR), ==, marker);
+
+    rsp = qmp("{ 'execute': 'system_reset' }");
+    g_assert(qdict_haskey(rsp, "return"));
+    qobject_unref(rsp);
+    qmp_eventwait("RESET");
+
+    if (persists) {
+        g_assert_cmphex(i2c_get8(i2cdev, DS1338_NVRAM), ==, 0xa5);
+        g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL), ==, 0x00);
+        g_assert_cmphex(i2c_get8(i2cdev, DS1338_YEAR), ==, marker);
+    } else {
+        g_assert_cmphex(i2c_get8(i2cdev, DS1338_NVRAM), ==, 0x00);
+        g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL), ==, DS1338_CTRL_POR);
+        /* Back on host time, which is where the year came from. */
+        g_assert_cmphex(i2c_get8(i2cdev, DS1338_YEAR), ==, year);
+    }
+}
+
+/* Without persist-on-reset, a reset takes the part back to power-on. */
+static void test_reset_clears(void *obj, void *data, QGuestAllocator *alloc)
+{
+    check_reset((QI2CDevice *)obj, false);
+}
+
+/* With persist-on-reset, the registers and the clock survive a reset. */
+static void test_reset_persists(void *obj, void *data, QGuestAllocator *alloc)
+{
+    check_reset((QI2CDevice *)obj, true);
+}
+
 /* The register pointer wraps at the end of the map. */
 static void test_address_wrap(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -162,6 +209,13 @@ static void ds1338_register_nodes(void)
     qos_add_test("clock-halt", "ds1338", test_clock_halt, NULL);
     qos_add_test("nvram", "ds1338", test_nvram, NULL);
     qos_add_test("address-wrap", "ds1338", test_address_wrap, NULL);
+    qos_add_test("reset-clears", "ds1338", test_reset_clears, NULL);
+
+    opts.extra_device_opts = "address=0x68,persist-on-reset=on";
+    qos_node_create_driver_named("ds1338-persist", "ds1338", i2c_device_create);
+    qos_node_consumes("ds1338-persist", "i2c-bus", &opts);
+
+    qos_add_test("reset-persists", "ds1338-persist", test_reset_persists, NULL);
 }
 
 libqos_init(ds1338_register_nodes);

-- 
2.50.1


