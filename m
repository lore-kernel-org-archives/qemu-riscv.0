Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D9BCA9EDD
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:12:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHh6-0001a4-4K; Mon, 12 Oct 2026 11:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHgz-0001XY-04
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:11:58 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHgv-0007rc-Ku
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:11:56 -0400
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-487049569b6so1419646f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791817912; x=1792422712;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QueqO13xdW/ZwsAlzziCNKkk2yOl7iMFMMHkLAoSdjc=;
 b=ILxaEWCSFwmym4N1GgFg4aHHqxHy/wmoA3XqrS85DZn56XmZPCFAZj0Jb9o/5Ij+5k
 nQvUNpgKFlnUwF1ZPtRqg2qzmAgBIKOS7MpYPe6eHiMvnKVv4xpGalGJppXJO85W4h0e
 759ZW6CrS2Oivsg0XoueUtAKn5DaHsn7s6ic8dw5T840aMN7hk12nqqwfrRCunNDWj0g
 +SseAc4b2cmXAN36EUP63WezdK+jhWFHLH4SSMUbyef4BRIlu59qtGCazL3AjY4/+uWP
 /KimxpI2APdSsIyQvg/cMAJVeyT/rrpXnkgW0qInkyjcgqr2rruhkkzfBPdV265nCwUY
 +VIg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwlaD9A8Fb3PmGv0U+et/IpgWMMcAZhRN269YPazNk/P1hNq/7WMTgUz6BYL5sehLS0K9e5x1Vx0BPW@nongnu.org
X-Gm-Message-State: AFq9FYLSfh8cFY5Xdsd1DC1FjYFkUwVpavV5ui9kGZotXGE1FJF7TBBD
 aO1duPdZJMg3wA738pKLV4Fb6VRDRygeyvc5sq+PSe87ajMX7X3EQhZE
X-Gm-Gg: AYBFou1DcaW4Jf9wrrb2KOPeu5QHjoKiJ25wdKCPxS7LdYxz2sBc4YV8BFnG1NxTseu
 7mz/xmbmRJgowNzRtCAG5PKCh3YenMiFHdaCSNBOMhsBVrJvtarbfjWmirT/t9PoD1F/UBz+wAg
 kreYayENWGJMGhMgOsR5q86+meOAaOtKGHByzfR+Gdd2TP88XmeIUSqq4l7mSJDisbAi/4ImwjM
 cMGTAgSDKDAabmSqfjKWIgL5pQJY9J+AyCxymJepUFbWNyHqWlgXnjs8376ZfwUnhapUPJu3Yzg
 WTa2e2goUL14SwCgyMOHbjP9or/luhfBeC6z/P2vBLpV+vvo974+aUjAxt7Y8U4LFiTlXDhp6jN
 jnTTRM2ZOWMDF2iXh/XXtLuEDCPKH6/ZI3jQTDeNkMX0Ph22vqed/T4yqhqEUjMgdPxYRqeR9o1
 IqSFM2XfzD0NevgLhsezmOPcr4r7LVnumeXJEIdkSzYGQFjzyz5F/Tk7ucRsP36F3pkOjT24NL2
 fs5rQJRY41gWnJhkGdrDJLqkXZ9f07XWQ55NG+WlvVSHw==
X-Received: by 2002:a05:600c:8b83:b0:4a1:811c:8064 with SMTP id
 5b1f17b1804b1-4a18e4d5512mr184353285e9.26.1791817912010; 
 Mon, 12 Oct 2026 08:11:52 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19c71a1d7sm114618035e9.5.2026.10.12.08.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:11:51 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:12 +0200
Subject: [PATCH v2 19/50] tests/qtest: ds1338: cover the clock-halt bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-19-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815520; l=2993;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=PGqbxjw1SjqsGpwA7KFSLwn1aqj7opA+7ReWeQn2c+U=;
 b=zjTBktTePMzZboKFMmcjtbHyQErYjv+tMeqwk9qkm+WoYd9cxaciTIh0isAwQ1FsWxHZ9yEHg
 rQ6oNNGuQPNDv8Q4lgAm75fXFpeTK5XJDpL4LhW5OewWi1hYz8uOfUd
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.53; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f53.google.com
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


