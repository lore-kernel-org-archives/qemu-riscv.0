Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088D3CC6B33
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:26:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIeL-0001GJ-Oj; Thu, 15 Oct 2026 06:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIeD-00015l-KR
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:25:18 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIeB-0003g1-Lr
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:25:17 -0400
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a1698ea378so41647875e9.2
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059914; x=1792664714;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FE9EBUZhqaKkcddPc+39V0rw7VbXhB6SBbD4e6broq8=;
 b=LF6w9L4u+0ohg8J7uYam57VbZ9+I63qCPl7SpF6/ReNRibpyjTpEZ6H+gr+j2v/WdJ
 nI1YY6Mn0BzIZXVQoAH5DqSI6qzYc3sRjC4fERUxwX6hRnJTQdQBkugJscJbc6eqlezq
 Ygut0kuOyHOzYwHnqsyK6XqxUrK6Gc5on2i/1I/y1klBHpL2lQyjgUZtl4bEE82bAOJX
 PDIGXxScYALTzfpdCGbERpO7AT+nynUiPZkf/yRFdOoF/jsXsVsxN4u0ib2hqPr+g0Ry
 0weEqC8STJt7BC2zCUPbVBGQ7IaKLwrM2gf3NA2cS80SkhMV8QEY2vD7+l5zXtqY1ePD
 TPpA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxFRMq1wwWk+S3X8ADGUyDRmw7Az4Aq2kH5va00pCsbfDbC750/A1czZ1wxhSur40hPpsw0G5+6DBPg@nongnu.org
X-Gm-Message-State: AFq9FYJezWNU30H5XQVpGdiSm2SL9Sci43xthd8bdxs2TBnQW1V4TaMr
 Rj8T+yaq7nZ1Exshd6SPElCZRCRNVOG2ilkDi0tRpXct71cE3kB9seM/
X-Gm-Gg: AYBFou1DDplBFeBN43wnmbbX6tU5i41yvLx9CI/u4ArVT+s2Ll4W/j4Cm5B0qIiKyk0
 445lNS9kdl+B9cQIpCPzmt4aYs5FpkfY1K+inPPMYb9p7D8ts5f6G4slMaxQvzsvulyTjvgT4q7
 R3OhAEdoHls40Flzn0Ozbf9F7K4ShKbkOCfqTskJMiB6AP30lPjsoOd8qnwk0vtanKWHo5Y16Kx
 YXofIIS6OHP2Wd0VelmE5peBayYml6c49rF5HTDN0lf5lT4rkwimNvG/9naZgCxeQXxPv9p/5Jb
 xcIOzH+sG8CbL8TsLMyp25THMk96vSS+YzvkYPFZxYeq0m1BCqhPtv3izJ3nlGm8P8Z4zuY/K49
 9rdQv30kwWOPNweo8VrZEYewTtzreEQ6P8Pq2wZBKXiZuyjuMlSFl/matdcKQkIqlbI8BuemqTs
 yii9i3BhKn/Fhs/ZjvCaRoxCb6DfyOJ2jxQfZ+XRiWGHtUgBqJ8SWUv1VO2C8Q/z7zgWsJHecll
 u/Ac4n80mBQi1ScBLl3hU9b0CDe9Yr4hXRBruMPir0j8A==
X-Received: by 2002:a05:600c:8b01:b0:4a1:c4d3:2fc0 with SMTP id
 5b1f17b1804b1-4a1c4d32fe7mr12605005e9.6.1792059914206; 
 Thu, 15 Oct 2026 03:25:14 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd96fed4sm61331865e9.2.2026.10.15.03.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:25:13 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:27:57 +0200
Subject: [PATCH v3 10/50] hw/rtc: ds1338: implement Resettable reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-bmc-minerva-v3-10-7d50c8a108e5@free.fr>
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
 Emmanuel Blot <emmanuel.blot@free.fr>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056475; l=1388;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=Yb1Zh34x6jrS484Xx/w7PuZZxma8LedPKe6tazap2S0=;
 b=SnOmwT7Zf8wEjEhQ9q5+5OYXjUkHVzgPRC4uRFLHLhKjBjCeOBnlqp61QxMFGSrZzocihtQvF
 QjyJPKbe9BpBHu3ThZUodPNKfvRzjtg8s0FevwM230g0L9sKfFjLkCY
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.48; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f48.google.com
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

The device relied on device_class_set_legacy_reset(), a compatibility
shim around the legacy DeviceState reset hook. Convert ds1338_reset()
into a proper Resettable hold phase, dropping the legacy shim.

Reviewed-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index f8b3340bf0..74aee6c746 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -208,9 +208,9 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
     return 0;
 }
 
-static void ds1338_reset(DeviceState *dev)
+static void ds1338_reset_hold(Object *obj, ResetType type)
 {
-    DS1338State *s = DS1338(dev);
+    DS1338State *s = DS1338(obj);
 
     /* The clock is running and synchronized with the host */
     s->offset = 0;
@@ -224,11 +224,12 @@ static void ds1338_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     k->event = ds1338_event;
     k->recv = ds1338_recv;
     k->send = ds1338_send;
-    device_class_set_legacy_reset(dc, ds1338_reset);
+    rc->phases.hold = ds1338_reset_hold;
     dc->vmsd = &vmstate_ds1338;
 }
 

-- 
2.53.0-Meta


