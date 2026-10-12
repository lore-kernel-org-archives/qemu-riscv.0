Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6491CA9ED1
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:14:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHj9-0002ZA-GS; Mon, 12 Oct 2026 11:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHiw-0002Y2-Or
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:14:00 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHiu-00085D-0t
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:13:58 -0400
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso1403308f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791818034; x=1792422834;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=m2GA4fazsDlog1s+fRBtwXY8L09cn4aW6lhQjZ5SfME=;
 b=IL6oDDPyu2aXm3wuDhF8WC3q2bePBcnC2LDOlHsAovdf3QXzV1lyD56ySRT4IaBN9i
 BKr/Xk+eQpPWrAy0dfPiMOSXCgPZ22mdM9ki6vVo3vU2hcaMfTHtrPfSAx1RsogCnTqw
 DahrYyLDrVN79oLDzDCOOJEHnyL3F9QvsZmj1Pfbjr6+fiwMq1zg0qUskqSRwvgrbiNv
 fYzq6T/aw5VZCnXeTaDwKtEYR08+LrdX+qsL4j0REvEHckF+7lPeBlIsEbRHBHbCJVLI
 SeoWot9tt4LbMekBzxWSi07Ze5IUA8IST501VQAGoyOV0h1x7mcOzwf6Q01u7nd3k+Os
 2K0w==
X-Forwarded-Encrypted: i=1;
 AKwUvBx5WiwZtRPYwAGr2LdNxjdWPtSTek8g9AivD+h0glaWFSzYvLqI6miXa+WRhEfym8NSlrDD4tvWpn7K@nongnu.org
X-Gm-Message-State: AFq9FYJ7AgDJUrwh4ltD1m003/C0lIx6xGvsItekTbXclAKuR2s6FNkV
 aOQUZeBVToOqKab0qTtxELh1l/jofFvDc86QwT/Fhzg3YEU7NyHQDEsF
X-Gm-Gg: AYBFou00vtKeMCKD0ZLAvz4zv0B8AD3U5w0FqMRbRK3tJjAIunGuvp/dlBHFg5Ib9f0
 caENj9ldB+e3etqg3Sa+POpCwxyiXFP3/R3ne0+FEmlelD83/KvRRcmiyBWCIvF9YAoKhvCnBGJ
 qjmh19xhqcFbM30Fqg4v1QVBroqpjDkfdpIhwiqGS2QOgDxBrzyA+caRoTvky48bqYHZDq0yjK0
 Io74PF010tQ23m0VlFC1hjKqJNVNpj4eveOpzWEjFcsm+qsYU3LC5zDIroSqBOrTp6mGalpqwlL
 b2kNQnS3E35QzLz+GnXxyNK50v1Dhbh41rnNpxEz+SK4bTFgHSAZKR3OZVePc7x34g3YJfmGA/o
 TMCQGa0QayofOX5gtcc3yGD+uSWouJ/JihmPjD0eVV0BtSN/zuy8dverBFLwTGW7S41K6ZmaC5t
 X/7yDJm86nkO91ISkDb2zlCEI5qfX/975jPq0jQSyXfp4PgcmskGorpqY00JXE96lTGKdhvLF8f
 77ms0DdBtunfEW2eOoaqGgE/J8S8SgcalGuIbwhjSyBNQ==
X-Received: by 2002:a5d:59c5:0:b0:48a:f592:fb63 with SMTP id
 ffacd0b85a97d-48dba7bea5dmr18541428f8f.1.1791818034234; 
 Mon, 12 Oct 2026 08:13:54 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0514ab1sm122891f8f.0.2026.10.12.08.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:13:53 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:14 +0200
Subject: [PATCH v2 21/50] tests/qtest: ds1338: cover the reserved bits of
 the time registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-21-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815520; l=2162;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=KJY0zIrKxG//LL1WKd4K1qyh6CHHxQ+6MszW1XMqpgc=;
 b=1iKV0oV3yRvjn623f+4E7dwXeJvrn/Atpfy20ZcQS0vfIIs2QwYrYErpilCTCDogvTZkW0I7j
 s42MtSTZ0vFByJP2wL5Ur5U+fqT3yfRebJ4WUolrZbgU803kZn3A1Ck
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.45; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f45.google.com
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

Nothing pinned which bits of a time register survive a write.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1338-test.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/qtest/ds1338-test.c b/tests/qtest/ds1338-test.c
index 1b9c02d931..9e2e257307 100644
--- a/tests/qtest/ds1338-test.c
+++ b/tests/qtest/ds1338-test.c
@@ -125,6 +125,26 @@ static void test_clock_halt(void *obj, void *data, QGuestAllocator *alloc)
                     ==, DS1338_CTRL_OSF);
 }
 
+/* Reserved time-register bits read back zero even with the clock halted. */
+static void test_stopped_reserved_bits(void *obj, void *data,
+                                       QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    const uint8_t all_ones[7] = { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
+    uint8_t resp[7];
+
+    i2c_write_block(i2cdev, DS1338_SECONDS, all_ones, sizeof(all_ones));
+
+    i2c_read_block(i2cdev, DS1338_SECONDS, resp, sizeof(resp));
+    g_assert_cmphex(resp[0], ==, 0xff);   /* the halt bit is writable here */
+    g_assert_cmphex(resp[1], ==, 0x7f);
+    g_assert_cmphex(resp[2], ==, 0x7f);
+    g_assert_cmphex(resp[3], ==, 0x07);
+    g_assert_cmphex(resp[4], ==, 0x3f);
+    g_assert_cmphex(resp[5], ==, 0x1f);   /* no century bit on this part */
+    g_assert_cmphex(resp[6], ==, 0xff);
+}
+
 /* The user RAM returns what the guest wrote to it. */
 static void test_nvram(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -207,6 +227,8 @@ static void ds1338_register_nodes(void)
     qos_add_test("control-register", "ds1338", test_control_register, NULL);
     qos_add_test("osf-write-protect", "ds1338", test_osf_write_protect, NULL);
     qos_add_test("clock-halt", "ds1338", test_clock_halt, NULL);
+    qos_add_test("stopped-reserved-bits", "ds1338",
+                 test_stopped_reserved_bits, NULL);
     qos_add_test("nvram", "ds1338", test_nvram, NULL);
     qos_add_test("address-wrap", "ds1338", test_address_wrap, NULL);
     qos_add_test("reset-clears", "ds1338", test_reset_clears, NULL);

-- 
2.50.1


