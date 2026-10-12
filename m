Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FEDCA9ED1
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:33:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGI1R-00074D-7b; Mon, 12 Oct 2026 11:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGI0s-0006i5-Tz
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:32:35 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGI0n-0002jI-T7
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:32:29 -0400
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a172eb31f0so14936015e9.1
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791819141; x=1792423941;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7JIouwvsYhybUqJx3bKqTjTPWbvwF34ZaZVav4+/RP8=;
 b=L1/WE4XrB6WxuvA2PWm5XegAZOWXrN9IcE9Sjhqhp6PAhzy/Eb3vPXOPiNxGJgoiXJ
 P7MaU865vY5HG6KW0zKayRmA4DyWr+BTdT+rrNocwnuVN+JBeVHbQeeV6D8ypGPnF+Q8
 3kdNzhEnhGTHQedA8Uorem4Pxd1E6zvKb69S/liWdWEjcKVUJGTIRQQi0yH6/LyrldzM
 e/AKi3xb2abx8fRNPllGbqZtYzPMobQihNYFC1mL4h9Wb4M8Hj5FvdxKdS2V8kHOLmrN
 g670Vtk5EEtuDtOn6B4twOsXehgmiQTROkIA2aSg+av4onnYYXNp1eKTUCYF86z5jNSW
 npVA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy3zDIloykasfIbpnyc8DnZYrZtYc/P5+LpfxyAO8FCobKZmszvZaXFVrtoLdPAc40OA1BfendTeVRm@nongnu.org
X-Gm-Message-State: AFq9FYL2rKQkUFdBUKYNNqbPdsR7G2U3HiDahE8DrgAKL3wF/c5uq86H
 kfoFpMhBp7f4KGEVOwWdPCURouuHYrnaTz0BM7BQG5X+DFAIGM0tHESw
X-Gm-Gg: AYBFou25eNK3R4U45OQYn4M0/l33aJ+bgpfTl8soJSvtLetIIMfKrWc1nDk4bfGIhxB
 /lPRiEwyndEKxFfKMozkkPmDnB4Z8vJAf5PuY5xiWiB61wg2yUFU66ePfDK9yZOcqKWe4bXxYvI
 a79Ply3n/pdg4Ls61PqEZRAqMr6f/fiVfW03fCxplyujMUMP1abibZLOtQx3GQgUCOOe0LQ5LlN
 DfZSW3ElNOQlxFXpSuwelkgtq5f4cwUGfJpQdo6ZQiZ5Xmi97VmSpr4OzKV5XhWXBOrR3ME8dK/
 R44xv/4cTV5RR4ZzTdg2/TAT80bS6smG5hgn7IN3bnSUdidxl0v6YQD6UApd/A5+zD6M/yUeHqS
 5tfeKRqTMciwfMhQeWx74s1TXQQBMA4a2YJbnShOgezAmJFOK+u/hdcsOyq9wSPAS23xRxR+AXl
 zrNUfPDMMDCi2iFg1XDd/zsd43Q9cVFqNH+9fw9V8ry5xCKa3jqG11ZVs0nooS8VlZN5gbF0Eru
 ENvrwpoSksQABvH2CGjuj+LyywcxURwWsnh9wOVwflplg==
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1419 with SMTP id
 5b1f17b1804b1-4a18e4cd667mr186910165e9.26.1791819140449; 
 Mon, 12 Oct 2026 08:32:20 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaa9f9sm85865f8f.19.2026.10.12.08.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:32:19 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:32 +0200
Subject: [PATCH v2 39/50] tests/qtest: ina230: cover a cleared calibration
 per channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-39-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815521; l=2259;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=GNmGo7bU7FZIBaUuYEeUYDpyrPaavNbXBkjimavlGKE=;
 b=YHHcAWAL+RN/mB2DoSS6parFIvowP00mb1BSSostYSkVZ3/SSqW4obiZgjD8l/BZpUp350YFr
 5qNe/1wGWl7CDAUdOv5Dw5YM2jtNJeS4xjpTNnfdJwWiY7dOVIndjHS
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

Verify that without a calibration value the current and power
registers read zero, whichever channels the mode converts.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina230-test.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/qtest/ina230-test.c b/tests/qtest/ina230-test.c
index 591927e551..5749b0bd46 100644
--- a/tests/qtest/ina230-test.c
+++ b/tests/qtest/ina230-test.c
@@ -301,6 +301,30 @@ static void test_zero_cal(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_get16(dev, REG_POWER), ==, 0x0000);
 }
 
+/* Clearing the Calibration zeroes both derived registers in any mode */
+static void test_zero_cal_channels(void *obj, void *data,
+                                   QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    static const uint8_t modes[] = { 0x5, 0x6, 0x7 };
+    size_t idx;
+
+    for (idx = 0; idx < ARRAY_SIZE(modes); idx++) {
+        i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+        i2c_set16(dev, REG_CALIBRATION, 0x0A00);
+        qmp_ina230_set("shunt-voltage", 20000000);
+        qmp_ina230_set("bus-voltage", 11980000);
+        g_assert_cmphex(i2c_get16(dev, REG_CURRENT), !=, 0x0000);
+        g_assert_cmphex(i2c_get16(dev, REG_POWER), !=, 0x0000);
+
+        i2c_set16(dev, REG_CONFIG, modes[idx]);
+        i2c_set16(dev, REG_CALIBRATION, 0x0000);
+
+        g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x0000);
+        g_assert_cmphex(i2c_get16(dev, REG_POWER), ==, 0x0000);
+    }
+}
+
 /* Clamping at full scale and the OVF (math overflow) flag */
 static void test_edges_overflow(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -560,6 +584,7 @@ static void ina230_register_nodes(void)
                  NULL);
     qos_add_test("power", "ina230", test_power, NULL);
     qos_add_test("zero-cal", "ina230", test_zero_cal, NULL);
+    qos_add_test("zero-cal-channels", "ina230", test_zero_cal_channels, NULL);
     qos_add_test("edges-overflow", "ina230", test_edges_overflow, NULL);
     qos_add_test("alert-shunt-over", "ina230", test_alert_shunt_over, NULL);
     qos_add_test("alert-latch", "ina230", test_alert_latch, NULL);

-- 
2.50.1


