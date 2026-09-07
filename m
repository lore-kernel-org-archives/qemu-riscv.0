Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFB7C79FA0
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:15:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3ctp-0001y1-8i; Mon, 07 Sep 2026 13:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cU3-0005gU-9m
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:46:21 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cU1-0003d3-7n
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:46:14 -0400
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-484374f54d0so2336221f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 09:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799572; x=1789404372;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QueqO13xdW/ZwsAlzziCNKkk2yOl7iMFMMHkLAoSdjc=;
 b=IRpFrQrqvQ6KYEVmxoAoq28gqy2l3nW5NySvP4Y/kye8E5liJNqTWGELMYW1m5Lf3a
 VARZTNK216dCCc1FfqlbPP2rnM0Wj1K5jziYomuM2x4A5FG3zTnZ6teMvHW1eu7slPF5
 2YOaDHslZsdYwYoj+fIQv9U6nSae7zvVbkgrLRbXQBisBP4nMBxfNXLQf93xGaRHdu1l
 ZKT2yZ8AkFRXXpj5ATLjaLVrMRPPryIJq+oGO3iguqqLDbba6BwouiVwH3izQdxXnCZL
 dYcbb4Xp7C/hWjhKU8/8sZF+h69BaJeK0QjDRnIz1CSaay1TFCzRaDJ4dBveIU48f2vo
 UR8A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwAZ0cDTa/zYRWGs5w9Rwdu4XP4nry9Nh/f/iXKwlCxxZaJgINxXwXU43J/L3TC0wxhIj0EnzzIDqXg@nongnu.org
X-Gm-Message-State: AFuF++moJFU+0ZQQ0g/5czfKCHxEzsdTA3yDqERcEX8+PRed7Hs52Fv5
 492ZqzpuGCABdH31AL7uW9PxiRo4FiCxYoRwGDjbytRvbi9yWujRB61Y
X-Gm-Gg: AYBFou2TNazEJZqwxoU+IpjxGBXi9pw8W+fvC4FcFmSTQ4Mjl7sL28QXDklwjXaPUB3
 eRThs8yZxR+FKMeo+HUgnoxXD5V5aAL9OosCHPbe9DlCHQeORwFtpN2rbUiZVMKzuJBUv0Klt1m
 ZX1H3CuActVPvz2IovgmFzqv34jAb64RNAm0cR3EJQ3kh03HnXRpLqZhu1o5utwnjkknr+3jh18
 rbjHV7QYq9Qt4TzjkiadTClAUzZkaMwzggjs7TVsTR57BRaeNrzBVW7YtW8wxZDQq0ABBX1XEUn
 ZkjeRPdg/lerCLhSgxcUNJ/uc0g8sxAzaR8D6Spa5fg43qqCpIpvlGNJOXpdBUzpWnatEk2rO3J
 G+KV7/V0/rrfOAGGJnb+N5K4FG+8WmOLYQm+C5LHdaCDAg5ucB+mahJ29OTkaobyoVuMEFG/DQg
 gkPPTy0iVhOsY18Sdqv0CLAxx0yKOWirQmfhO2at1N6tRi2bZY/nJJPOICCDhp1coFrVtAKGM3T
 JwuuOoTCfy78XC1p+K3tlZYKazQAQr4f+4=
X-Received: by 2002:a05:6000:612:b0:485:8e19:1979 with SMTP id
 ffacd0b85a97d-4858e191d46mr38805662f8f.11.1788799571524; 
 Mon, 07 Sep 2026 09:46:11 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48588135600sm25864304f8f.2.2026.09.07.09.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:46:11 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:09 +0200
Subject: [PATCH 19/50] tests/qtest: ds1338: cover the clock-halt bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-19-0d83ad610c3b@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799320; l=2993;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=PGqbxjw1SjqsGpwA7KFSLwn1aqj7opA+7ReWeQn2c+U=;
 b=mxihoUkXSwclIFf8U2Czb5eGHX6bwlGb6DU0RvxeGe+mLp9dNf4FZbOagdvHlxDFwvt7ikQuq
 uLsj5+k/vLuBlrF46LsUuA0EHcV0yftCDK+qEyuVCyejUXtbDf/qE8T
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.47; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f47.google.com
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

The clock-halt bit had no coverage, nor did its effect on the
oscillator-stop flag.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1338-test.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/qtest/ds1338-test.c b/tests/qtest/ds1338-test.c
index fad0ca53d4..1b73dca98d 100644
--- a/tests/qtest/ds1338-test.c
+++ b/tests/qtest/ds1338-test.c
@@ -32,6 +32,7 @@
 
 #define DS1338_CTRL_OSF  0x20
 #define DS1338_CTRL_POR  0xb3
+#define DS1338_SEC_CH    0x80
 
 /* The clock and calendar come up on the host time. */
 static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
@@ -85,6 +86,42 @@ static void test_osf_write_protect(void *obj, void *data,
     g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL) & DS1338_CTRL_OSF, ==, 0);
 }
 
+/* Halting the clock freezes the counters; clearing the halt resumes them. */
+static void test_clock_halt(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    uint8_t frozen[7], again[7];
+    unsigned idx;
+
+    /* Clear OSF first, so that halting the clock is what sets it again. */
+    i2c_set8(i2cdev, DS1338_CONTROL, 0x00);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL) & DS1338_CTRL_OSF, ==, 0);
+
+    i2c_set8(i2cdev, DS1338_SECONDS, DS1338_SEC_CH | 0x30);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_SECONDS), ==,
+                    DS1338_SEC_CH | 0x30);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL) & DS1338_CTRL_OSF,
+                    ==, DS1338_CTRL_OSF);
+
+    i2c_read_block(i2cdev, DS1338_SECONDS, frozen, sizeof(frozen));
+    g_usleep(1200 * 1000);
+    i2c_read_block(i2cdev, DS1338_SECONDS, again, sizeof(again));
+    g_assert_cmpmem(frozen, sizeof(frozen), again, sizeof(again));
+
+    i2c_set8(i2cdev, DS1338_SECONDS, 0x30);
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_SECONDS) & DS1338_SEC_CH, ==, 0);
+    for (idx = 0; idx < 50; idx++) {
+        if (i2c_get8(i2cdev, DS1338_SECONDS) != 0x30) {
+            break;
+        }
+        g_usleep(100 * 1000);
+    }
+    g_assert_cmpuint(from_bcd(i2c_get8(i2cdev, DS1338_SECONDS)), >, 30);
+
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL) & DS1338_CTRL_OSF,
+                    ==, DS1338_CTRL_OSF);
+}
+
 /* The user RAM returns what the guest wrote to it. */
 static void test_nvram(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -122,6 +159,7 @@ static void ds1338_register_nodes(void)
     qos_add_test("reset-defaults", "ds1338", test_reset_defaults, NULL);
     qos_add_test("control-register", "ds1338", test_control_register, NULL);
     qos_add_test("osf-write-protect", "ds1338", test_osf_write_protect, NULL);
+    qos_add_test("clock-halt", "ds1338", test_clock_halt, NULL);
     qos_add_test("nvram", "ds1338", test_nvram, NULL);
     qos_add_test("address-wrap", "ds1338", test_address_wrap, NULL);
 }

-- 
2.50.1


