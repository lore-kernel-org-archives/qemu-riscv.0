Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F746CC6B34
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:26:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIf1-00028Z-W8; Thu, 15 Oct 2026 06:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIeY-0001TQ-AX
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:25:38 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIeV-0003m2-3q
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:25:38 -0400
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48b042c0728so1215941f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059934; x=1792664734;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/7vqyfsfQSXKfw69CwuMNDomx2TM2p1e+fdBs9WDTis=;
 b=n4ZaY6Sxcqz8M1guTrHoWwUSmSQZcMkBKNWuwm0xxu9zwCZOLWG+AW3txNqWoL0hQL
 ITLKP05XoPj73ztzrqa7jKOr9wLBwf81AW2xRbhggg2JG8h95utFwigTqG8t0kJOH3/F
 X7suJgYNaL178wz/mShxpi8iLMJfVDpUi6xh47cwvqioJ+fNOwWuTchs+QDBDRn9iCHk
 7d0a99IPdTbuCr0ZAo/cTo4ns9/RqHGSlkKtQvo0lohifX8cJ/dwCaweFTbD/Zq9Q8x7
 V0+/eWaQJMKZeIvs7Q4vEk28+kLeZ68cx/j0cK95Ta/YZmVcGmENch3j2HMETVXJ1FvE
 l6kg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzWJ3NSIYB+EJj/cyh4tLN/n4Ie0tgoNR7+cody6z9c0lDuGpqq6zSLGOezaAwiEgwmsQHIoyvUvPAY@nongnu.org
X-Gm-Message-State: AFq9FYJBZ5Ch13L7kJr85pVkQOXJ4xniFGU3NMAvp+/UW8hRR5msziKV
 KA6tGndRg07gyoL0MvIsVWB7mYgBmpThPYcA2/gD3755HDU+XD7iJmFW
X-Gm-Gg: AYBFou1wk7+hjb+tyeL+QpgEF8G1HdPNSgSnTq40xUsM1azQpt+XHJH+pSP873pCS9s
 cDFBQ+a8XIUlQJcJGMeLGKu473Lwyyks+Lcrhhw9aFn0MEL/3v1yN5BSpyRNmNkyk9habuFAg65
 P04vEtf2luQupVoWhArSFXzGkzYCE09aFEGfYrBQfg6lZiME+MaANmUiwpYmTHpzMJ3uamB5jhm
 hr5YhPeCYTk8m0DsunmMA67LSlMVG8gyBidivDfKCNiYgP371H2zeKAknddlhOzwayqXa+ZB0Jy
 6PpIQPDs6sUCd7FMHoo0wfPFY6ndusl83vRWludpUvHpECirdtf5ASc3ZuoCHHF7oxiShk7hqRK
 G2FB5qmTnhESJPYUoHMfHOep5d32G+rkvJ7B767Ufnw2UZ93WlPEGSU2lioVlKVfnhTxBayeBwi
 j8XjzuXecmDUY85da9A6Nh0MrE7VlyDjvv26Li/p3BuLv41ZYgbEBw7zzfMVgQjkiaXNTNWREQy
 q4hASZklotWgbhqbLM8aoe3ZdM3tajykOt4u4nA+DDxRA==
X-Received: by 2002:a05:600c:1d0b:b0:4a0:13ea:2ec3 with SMTP id
 5b1f17b1804b1-4a18e4ddca6mr373974445e9.35.1792059933158; 
 Thu, 15 Oct 2026 03:25:33 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd68144fsm43754785e9.4.2026.10.15.03.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:25:32 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:00 +0200
Subject: [PATCH v3 13/50] hw/rtc: ds1338: program the clock from the time
 registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-13-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056475; l=6068;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=uej/UOj+V/lpxWjtnR1AN5iwpDxP7F3nxb3Qip3BUmg=;
 b=+WaU57kgTcaSV+G3yvRq6EYp7j5INJrXeUH8WFLguWiiFv+TvFUn9GrnEVfKmes/chigPXsyW
 Qd0nTma3H8aB8/yd0+xFZbukgmVlzvIqV4TKPeXsOWJLZCbbDHpuKiq
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.52; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f52.google.com
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

A write to a time register rebuilt a struct tm from the current date,
substituted the field being written and folded the result back into
the offset. Every byte of a multi-byte transfer was therefore
normalised against the fields the guest had not written yet: a date of
31 programmed while the month register still held a 30-day month moved
the clock into the following month.

Keep the written value in the register file and derive the offset from
the file as a whole. This needs the registers refreshed on a
START_SEND, as the hardware does on any START.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c | 116 ++++++++++++++++++++++++++++++--------------------------
 1 file changed, 63 insertions(+), 53 deletions(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 7eaa663113..862e03bd32 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -8,6 +8,12 @@
  *
  * Contributions after 2012-01-13 are licensed under the terms of the
  * GNU GPL, version 2 or (at your option) any later version.
+ *
+ * Limitations:
+ * - Writing the seconds register does not reset the internal countdown chain,
+ *   so the sub-second phase of the clock is not modelled.
+ * - Leap years follow the Gregorian rule, where the parts stop at 2100: they
+ *   derive the leap year from the two-digit year alone.
  */
 
 #include "qemu/osdep.h"
@@ -75,6 +81,41 @@ static const VMStateDescription vmstate_ds1338 = {
     }
 };
 
+/* Reconstruct a struct tm from the BCD time registers in nvram. */
+static void ds1338_time_from_regs(DS1338State *s, struct tm *now)
+{
+    qemu_get_timedate(now, s->offset);
+    now->tm_sec = from_bcd(s->nvram[0] & 0x7f);
+    now->tm_min = from_bcd(s->nvram[1] & 0x7f);
+    if (s->nvram[2] & HOURS_12) {
+        int tmp = from_bcd(s->nvram[2] & (HOURS_PM - 1));
+        if (s->nvram[2] & HOURS_PM) {
+            tmp += 12;
+        }
+        if (tmp % 12 == 0) {
+            tmp -= 12;
+        }
+        now->tm_hour = tmp;
+    } else {
+        now->tm_hour = from_bcd(s->nvram[2] & (HOURS_12 - 1));
+    }
+    now->tm_mday = from_bcd(s->nvram[4] & 0x3f);
+    now->tm_mon = from_bcd(s->nvram[5] & 0x1f) - 1;
+    now->tm_year = from_bcd(s->nvram[6]) + 100;
+}
+
+static void ds1338_resync_from_regs(DS1338State *s)
+{
+    struct tm now;
+    int user_wday;
+
+    ds1338_time_from_regs(s, &now);
+    s->offset = qemu_timedate_diff(&now);
+    qemu_get_timedate(&now, s->offset);
+    user_wday = (s->nvram[3] & 7) - 1;
+    s->wday_offset = (user_wday - now.tm_wday + 7) % 7;
+}
+
 static void ds1338_capture_current_time(DS1338State *s)
 {
     /* Capture the current time into the secondary registers
@@ -123,16 +164,16 @@ static int ds1338_event(I2CSlave *i2c, enum i2c_event event)
     DS1338State *s = DS1338(i2c);
 
     switch (event) {
-    case I2C_START_RECV:
-        /* In h/w, capture happens on any START condition, not just a
-         * START_RECV, but there is no need to actually capture on
-         * START_SEND, because the guest can't get at that data
-         * without going through a START_RECV which would overwrite it.
-         */
-        ds1338_capture_current_time(s);
-        break;
     case I2C_START_SEND:
         s->addr_byte = true;
+        /* fall through */
+    case I2C_START_RECV:
+        /*
+         * In h/w the time is transferred to the user registers on any START
+         * condition, so a write modifies the running time rather than
+         * whatever the last read left behind.
+         */
+        ds1338_capture_current_time(s);
         break;
     default:
         break;
@@ -167,51 +208,20 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
         return 0;
     }
     if (s->ptr < 7) {
-        /* Time register. */
-        struct tm now;
-        qemu_get_timedate(&now, s->offset);
-        switch(s->ptr) {
-        case 0:
-            /* TODO: Implement CH (stop) bit.  */
-            now.tm_sec = from_bcd(data & 0x7f);
-            break;
-        case 1:
-            now.tm_min = from_bcd(data & 0x7f);
-            break;
-        case 2:
-            if (data & HOURS_12) {
-                int tmp = from_bcd(data & (HOURS_PM - 1));
-                if (data & HOURS_PM) {
-                    tmp += 12;
-                }
-                if (tmp % 12 == 0) {
-                    tmp -= 12;
-                }
-                now.tm_hour = tmp;
-            } else {
-                now.tm_hour = from_bcd(data & (HOURS_12 - 1));
-            }
-            break;
-        case 3:
-            {
-                /* The day field is supposed to contain a value in
-                   the range 1-7. Otherwise behavior is undefined.
-                 */
-                int user_wday = (data & 7) - 1;
-                s->wday_offset = (user_wday - now.tm_wday + 7) % 7;
-            }
-            break;
-        case 4:
-            now.tm_mday = from_bcd(data & 0x3f);
-            break;
-        case 5:
-            now.tm_mon = from_bcd(data & 0x1f) - 1;
-            break;
-        case 6:
-            now.tm_year = from_bcd(data) + 100;
-            break;
-        }
-        s->offset = qemu_timedate_diff(&now);
+        /*
+         * Time register. The write lands in the register file and the clock
+         * is then rebuilt from it as a whole: a transfer that programs the
+         * date before the month it belongs to must not be normalised away
+         * against the month still held from the previous date.
+         *
+         * TODO: Implement CH (stop) bit.
+         */
+        static const uint8_t valid[7] = {
+            0x7f, 0x7f, 0x7f, 0x07, 0x3f, 0x1f, 0xff
+        };
+
+        s->nvram[s->ptr] = data & valid[s->ptr];
+        ds1338_resync_from_regs(s);
     } else {
         if (s->ptr == k->ctrl_addr) {
             /* Control register: reserved bits read back as zero. */

-- 
2.53.0-Meta


