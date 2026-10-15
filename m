Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C6ACC6B38
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:28:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIgi-0005Ug-2m; Thu, 15 Oct 2026 06:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIfC-0002Nc-Lq
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:26:20 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIfA-0003tX-TM
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:26:18 -0400
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a16af2a232so40036685e9.1
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059975; x=1792664775;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QSX7oFL3j7413Q4nQT+SGQuVL91uJZdU8V0ijp2OEps=;
 b=et5STtZmTVWhViMhXzHUHjB8wANz5aoRRVpF7Lm0CDCaYD6/k7mY84jphOMxGK06ug
 YYeV6J6xQiiJxc2h0F8LOarQEGzejO8vg05QZ++H/Tnhky2dXXa9hp3eCUfT+eo9/mUw
 id+2hD4iMJevdf537TbSPojt8jbDK4Z0ct+jAcp/EkopIf7hcE13fbvZhK7LudpbQ/Xt
 jVApD5WnwxsGF3+QTsEXEeLVm/wu30DEtBNIEPTie+rU1W1zoPNEm3DQoCare78MDRVp
 P9C7Jv2IpMVcIjQo7M0MdvnAl34r5uB2Jfsn5GykPqA1D7BYXMa69ev0EbG0HOb2CkfO
 GIyg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzREMGPO5HpcbZFHUPRSCTBqyVl5qzwtU/U9RO3w7bVNB8i9yZi0g/6dYFiCJDctO58TyZqbnD+vsOj@nongnu.org
X-Gm-Message-State: AFq9FYLNxXD5hPcW9PRSGjg8xntbFU/RdSORUb31O8MEgd6l1/ubOdy/
 Eo9+oXCQsbdIf62lmfhlSnYqEgmPh4i0s7snyeh2f8b8qc0auMWnRQH7
X-Gm-Gg: AYBFou04EQAm+5x4MPdOYc5P9C8UsfNvMQ3YcRUStaueLA4by1wp9cvE7zALoDkcvnb
 sM9V2otR0lIGLlmNWnBr553odTHpqklmPUr3dS48wyLLewXlAENcNUFJOamZXXKptr34TjnX/z2
 8HaYs7jq2MltTpcoKhP338TWs2FEl5zCI+yhOiS4y7eT9Yw/dfoxABAGGTdURs/FjDdHiZ4EHhA
 Oxc29poXB+Ap2GiJaSb4XwYnYgCW1QaDfIqwehBPqYWqftYIBv+wTSSoIDDfQnqBdCOoyyYQL/o
 fBUHqUrhzWCyG+SuZ7TyKwlcwlPyIyrOOWiuYKn45Bb8nHpnkaW98btYMHE0kMqgUrvsP8hxyZM
 xp2ttCKY3DEoF6BWOfry8JFp/5245WXFZbBMIk2DB0Z6nl+Ye0cf2p+pl0qaJhB/lTon43AIlDa
 20+yTUu3QD9GirrObp1iiiEV2uOAomF27IxTIVZdeFRX3uUzrsiM7e3GMKOchKqb5K/fMOStzll
 FO3iXNDAxAaYkNV9zYqi90wJqmAnQ1uYxZZHJ5o0letMg==
X-Received: by 2002:a05:600d:8644:20b0:4a1:9eb2:b2a8 with SMTP id
 5b1f17b1804b1-4a19eb2b2dfmr181516715e9.29.1792059974927; 
 Thu, 15 Oct 2026 03:26:14 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd64b5e7sm59827875e9.2.2026.10.15.03.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:26:11 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:06 +0200
Subject: [PATCH v3 19/50] tests/qtest: ds1338: cover the clock-halt bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-19-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056475; l=2998;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=ZuX+spACHMjQ3cHCqU6XOjJREiGhA+BBWl2nnVGddEk=;
 b=QvrwoeOUmFWDQQvXZbmJm6utK8KmIgrJuafMbJKRJTRRW6Fvu4kz+S++4Sg29UqtgHEB1SgZO
 lI7EXn1H/SvBJrwU9YRZSIl6j1hNjSt71ODsDWnKmbAuBJQ8bo9+w2+
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
2.53.0-Meta


