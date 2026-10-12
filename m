Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52331CA9EC5
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:11:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHg4-0000ld-R0; Mon, 12 Oct 2026 11:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHfy-0000gQ-Hg
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:10:55 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHfw-0007kv-V0
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:10:54 -0400
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48b0584ad71so1079724f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791817851; x=1792422651;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9bQz/dpQcTFmknV0ZVNikpRUpVUFhyWc4TFL1C+8fm4=;
 b=YUmuFaZ6TR3+1mmmvFfrxWCB6AQdN+oSfXQWe2NOMezdT7u8OUwXfJ+fsuQIeuXIer
 ot11qiRPD0h/z6VqMomCexRn7hb4y37FrKEM4V3El2link6Gh0cHakJAtSDl4/iI7R8d
 I2InUBnM7oXryI7iaeFLZov1ZyiSXhRjbbgYIKUWddmnjUSQSH2GiCv+oUrn6iVKPnRi
 UR4BofgrMMzWu9nzlj016gxAo8nnBOQEND9fWlrBp1UbCsW/tCA6TsB3pupsRogH40pL
 aEawuq5lNAp/rddUnR3F1OtyFxh1kRuX/ibqYQ31NTslssYu5YLQQhFpUEDXNJcQ0CHs
 3YcQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzen/b1x0XjkbmhkVLK09d2bnIAYCerTRnQOvBULUAWGDzF+St7N22zBh7Ygdbx/Z5ObxV3zOOUNu16@nongnu.org
X-Gm-Message-State: AFq9FYLXVFnpANju0exdxWlh9rt1CTNLGhhO64CeSSoOaOvikmNJZQMK
 qiOKBXo4TCacOy86prTPg3EB+7CBUCIqaayOgfkzpI8g+hZLmfTL/siM
X-Gm-Gg: AYBFou0gxTr1WvSbdlYqHnZQ3TaKjZY6q6/CanFBxCsG9+2XB9VmeAraTieenJwVfGg
 bdHydciRQaW9MYZJT3Lfz5eWqFWvKR72b1K6wqLwcMbCIeJ98D5nWt39+G8N+bsY49w0a4u5dPf
 3oQAVGYhiXQTffrN5sB+kP1BmsD2yS3tctCKK3+36Id6m0DD2kh/e5ftlS/Da3ZCwegnysMPnzy
 4XrBPiCG08qzpu+uGs5fM0BbchRzqx6pFy5UKCqz3h85ar3KmuYfKKRd5OQTiGiosHDtoSkkEEf
 BGgYt5jDT58fo1PS/UcjI4ysb6Mtn52RKiz8JFgNREubBMptf8tW/wbOzKYmX3lkvJV6c+JZkDd
 sUYTh0Q+e675hOXg5ubNBOOii6al9nr3ajXaVVrD/rOHuxnObP32dSIY69kRSfkUTCl3sdRgiNa
 mQpTLOBsVFQV15GC9VpEBuaBzRgXpFOZLQWueBr0Jfv7TDfZ/RW6pgrnQfQ24NOlH0N8v0CcAPw
 N/cqSVqiye12z5WADbOxH2AwCiqDZPwXNqqKvv1Z4zzzg==
X-Received: by 2002:a05:6000:29d6:b0:487:40a:5ba8 with SMTP id
 ffacd0b85a97d-48dbacecc29mr10911946f8f.15.1791817850809; 
 Mon, 12 Oct 2026 08:10:50 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abd3aasm19361499f8f.32.2026.10.12.08.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:10:50 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:11 +0200
Subject: [PATCH v2 18/50] tests/qtest: ds1338: cover the power-on register
 defaults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-18-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815520; l=1856;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=9nlnuEXuVbr9L6NPGTObkdBzIqjpFAqXLz9Eqo8+gf4=;
 b=EJka7OBMD+c0KBxDRvlXbDlcNQsODRKuSGgPWLO44rhTjOmICbJOPv7rRbgDjhdmigeBEQo8V
 88tDnBOTX2eCk+HxE0JRj6QNbiPu+RHy+uCJpiagxA9hyRs7ktIb/Oy
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.42; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f42.google.com
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

Nothing pinned the reset value of the control register, which is how it
sat at zero rather than at its documented power-on state.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ds1338-test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qtest/ds1338-test.c b/tests/qtest/ds1338-test.c
index 6066a34846..fad0ca53d4 100644
--- a/tests/qtest/ds1338-test.c
+++ b/tests/qtest/ds1338-test.c
@@ -31,6 +31,7 @@
 #define DS1338_NUM_REGS  0x40
 
 #define DS1338_CTRL_OSF  0x20
+#define DS1338_CTRL_POR  0xb3
 
 /* The clock and calendar come up on the host time. */
 static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
@@ -49,6 +50,14 @@ static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmpuint(2000 + from_bcd(resp[6]), == , 1900 + tm_ptr->tm_year);
 }
 
+/* The control register comes up in its documented power-on state. */
+static void test_reset_defaults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    g_assert_cmphex(i2c_get8(i2cdev, DS1338_CONTROL), ==, DS1338_CTRL_POR);
+}
+
 /* Writable control bits round-trip; the reserved ones read back zero. */
 static void test_control_register(void *obj, void *data,
                                   QGuestAllocator *alloc)
@@ -110,6 +119,7 @@ static void ds1338_register_nodes(void)
     qos_node_consumes("ds1338", "i2c-bus", &opts);
 
     qos_add_test("tx-rx", "ds1338", send_and_receive, NULL);
+    qos_add_test("reset-defaults", "ds1338", test_reset_defaults, NULL);
     qos_add_test("control-register", "ds1338", test_control_register, NULL);
     qos_add_test("osf-write-protect", "ds1338", test_osf_write_protect, NULL);
     qos_add_test("nvram", "ds1338", test_nvram, NULL);

-- 
2.50.1


