Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57F9CA9EDD
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:04:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHZh-0004MJ-1X; Mon, 12 Oct 2026 11:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHZ3-00049X-AP
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:03:59 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHZ0-0006SB-Io
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:03:45 -0400
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so17352785e9.3
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791817421; x=1792422221;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vPB5f/PPZ/fTGUrJWi/0AwBmdqaHERhdZDqmO3v6YS0=;
 b=mveM8YzcKhwVZTy+kZ6t9+VEdl/26xnUMpICmpIJr2cmppjUgvya9LQ4m2+6xyTqUO
 onl3nR4/PoQvYVm/Ki1JIeZDyXUjOPqzSPhJuF2cvMb+N9tyqWvHUSvQxLYT2TZ8x/LU
 lwia3H8KC++JRN1YnLf9phVV/yi2bllSZsjcHoruApe1N0e4wfRhrf2GNuqYcu8iyLW9
 YzfcuLwvCknZtREad1+yP4ZXX2h2CD6eR+K8Rw+/RAAPjpWcjGt+yqXy+fiqNgdJMckG
 09p1tql8JndH+ls0EleF596KinHtkV9izn3jEusQrTnyA1BqpsfBOgl4xjLeVklEGmWz
 J00Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxX1pLe9FCu8sjDyN9DYVbAaeNqP+bXaU8ZetKaXKDCN7VOv/rFGy1dBmN1RjTIp3pJ0U16RPXEiuZ3@nongnu.org
X-Gm-Message-State: AFq9FYJk0uYdfWYZqbtZ1H7qKLRugxecyfyzN6zQGCzKuLRrupMwc7LW
 iZerQoUOgy6SvvRUFKM3K9tSeeuhjR0crq6HN+CkP/dz1+6shfC4ImZ3
X-Gm-Gg: AYBFou2hr8/84AJdz8/fFl7NetT9+Zv0mUSSfO/zjqVLtCdmss++KQNo4R4VEMQ/kmh
 mpeK1ckQRBXxbWg9BynU73D2+KRryiVTkbLyP+lQEaud+CrBu0eUS0Q3IF+zAeD0Zlf3DtkkCUq
 feKCsbXWCWKCScZtL59qq0KjBkLMj7TBhGLxcTXd0CyOtFeKz+MUQ5uZOTMp2vBjZpVw69PiftD
 bMkBDgjvXBbah+v/Sz5D6SCNpABiupA6tgUeghSXp/wFdZqdix8dFdHw3N6Ze5Q04fYZR4Fzcwa
 HNQbJ0M5QIsg4JFcGCtsxbMBdUt9/k7uS44STH5aUpiocomaHS3lQkwFMWwHzhz4Ez6PLhOzMRP
 /Z4NpisaVSy+oN/mR+ciMa/fjYjPVdg176ckB30xT0U9D2L9rCavxUxZzDLTOP+tGItQeNbdWtC
 hpFWFBEhwCveTXlRw+7F2JwUn7Kd5tQ4A4faosR6GuKtjiXmfFTjtfL+ITSxwqCm56Vrnbd9620
 6i+d/ig87I+itdbcwGI2JXQnmiwa7B/XOvxmCvcgOzngA==
X-Received: by 2002:a05:600c:3554:b0:4a0:1b14:e283 with SMTP id
 5b1f17b1804b1-4a18e43a1cemr187370475e9.1.1791817420622; 
 Mon, 12 Oct 2026 08:03:40 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1a1feb78csm87213025e9.0.2026.10.12.08.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:03:40 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:04 +0200
Subject: [PATCH v2 11/50] hw/rtc: ds1338: prefix the file-local helpers
 with ds1338_
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-11-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815520; l=2049;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=4sMpXciwY1X59HescikiS3PryefwPgkY5TQZ1q6pfqQ=;
 b=HZAMH3EH9Mhlg4TMlDcCgbSk796PNWu8xS95fvrSTWKaIU2aFTYUDy/d7lzBqdmKvM23CQWd0
 NmK9iB+ZkFIBCkxnYuJg0LygW1TYHoB+dgtho+6v6apz7MWyUgpti1C
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.45; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f45.google.com
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

Two static helpers predate the rest of the file and carry no device
prefix.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 74aee6c746..1755a3a37c 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -57,7 +57,7 @@ static const VMStateDescription vmstate_ds1338 = {
     }
 };
 
-static void capture_current_time(DS1338State *s)
+static void ds1338_capture_current_time(DS1338State *s)
 {
     /* Capture the current time into the secondary registers
      * which will be actually read by the data transfer operation.
@@ -85,7 +85,7 @@ static void capture_current_time(DS1338State *s)
     s->nvram[6] = to_bcd(now.tm_year - 100);
 }
 
-static void inc_regptr(DS1338State *s)
+static void ds1338_inc_regptr(DS1338State *s)
 {
     /* The register pointer wraps around after 0x3F; wraparound
      * causes the current time/date to be retransferred into
@@ -93,7 +93,7 @@ static void inc_regptr(DS1338State *s)
      */
     s->ptr = (s->ptr + 1) & (NVRAM_SIZE - 1);
     if (!s->ptr) {
-        capture_current_time(s);
+        ds1338_capture_current_time(s);
     }
 }
 
@@ -108,7 +108,7 @@ static int ds1338_event(I2CSlave *i2c, enum i2c_event event)
          * START_SEND, because the guest can't get at that data
          * without going through a START_RECV which would overwrite it.
          */
-        capture_current_time(s);
+        ds1338_capture_current_time(s);
         break;
     case I2C_START_SEND:
         s->addr_byte = true;
@@ -129,7 +129,7 @@ static uint8_t ds1338_recv(I2CSlave *i2c)
 
     trace_ds1338_recv(s->ptr, res);
 
-    inc_regptr(s);
+    ds1338_inc_regptr(s);
     return res;
 }
 
@@ -204,7 +204,7 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
     } else {
         s->nvram[s->ptr] = data;
     }
-    inc_regptr(s);
+    ds1338_inc_regptr(s);
     return 0;
 }
 

-- 
2.50.1


