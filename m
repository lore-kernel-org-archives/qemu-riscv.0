Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEACCA9EC5
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:07:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHcA-0006tv-4P; Mon, 12 Oct 2026 11:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHc0-0006sR-LG
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:06:49 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHby-00070c-U7
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 11:06:48 -0400
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so20413165e9.2
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 08:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791817605; x=1792422405;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=G/mKfLQNBKAXK5zANjKJNAiRPm31akVLZZtUavo8HIg=;
 b=tzBCAglza34G16IadUE6G3MVV+/3Jud+zuCAz/ImqKaC7HIgkWEErXv1/xqxul0ITs
 YkRZ/WA2ROGUAozLz70l9OjQeY5RjYhID818fxu3Pl3lGAeuUCHdHhiJkN5eg0v0D418
 RUjNncnOyqhfL6tDIOggjznHVt4+PVOOhk5rcwfLxsBdxTEt4qGwRAb1LGD0Lvxc41f2
 cDQjts9NCs0PhhrFi0/mZWtY7a1SonfQPA6YlCRgYFy2nV7PecMUz92APmVs+jIK1e4m
 4YcQfEZMOTR/EkYbL0ukk0zblBN4UzyI5i03xslYWMT5YWvUfjHH+zFhl+1aQa6i2O3n
 d3+A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwEkOUImbxGfumC8Rm92vkxRSxbjjPgwbTqooJ1jFMgvkuoYFRzmtYWUmNZUKS6k4jt8vcZEjK+Eo/Y@nongnu.org
X-Gm-Message-State: AFq9FYI+AAjj16zCWi7F/oIFFwRiPd9z4rnoUuHAhW4hXHTVaMWtLQeD
 94muZPv/IhRd7yVn+WJCfwKQj5YvjHAWYylQfoUFs2hIkpgwhRsU3Y2y
X-Gm-Gg: AYBFou1fcVbGh3p7Zr8TWqSonlBgUH00Y2hDsJw9QObW/wXxDJKCohBfsx7XHYA8W9p
 9uzTAM9HOhwpLKgJZwKNNyyvrGoDyAQYq0ueINjjfEHOgytwTAbCFMkLL5U1aLivaBAGc+A/rZp
 ygCEBT4y8dZprPVyw8TAezXdcvI6G69Kq7dkXislBUzbcVeUVNueHW+RRuOu2Cq0H9EvMp+xR9/
 ng4jmtRJkCJGr3kwGk9RtTyqi/10JIKR7hgJPwVRCJrhFuIaEPFIdorwdgFcY+g92DdeNFDEeaC
 bj+Muym1JxSoEw94pNXCGh015KAGVoBdT92F0QgFkfD+WQh3tK9zFtY9YEg7x+99W/pa+UN9dXd
 g/1ycROJNgE/YjqdLq9XfTF9ewyQ7vDh39HT/gNClhOV+y8R+G8d9olA2nCtlzjDrS2AeosvE04
 mhydIwhrY00f4s8PmfSLeY/yOVawndxzAr7EpSwZA/1nr7fBSqk0lX5K9TRrijZyZkEfoxlqUYm
 kFHY+xyvlhJQ91IYU0bS3NSgg328XmFPJ9K+ar+cPVw/g==
X-Received: by 2002:a05:600c:19ca:b0:49d:10d6:fd55 with SMTP id
 5b1f17b1804b1-4a18e4487b5mr192263745e9.1.1791817605215; 
 Mon, 12 Oct 2026 08:06:45 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19c8244edsm126166345e9.2.2026.10.12.08.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:06:44 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:07 +0200
Subject: [PATCH v2 14/50] hw/rtc: ds1338: implement the DS1338 clock-halt bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-14-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815520; l=4393;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=a6K3mP3V1bOItKsHSSEEMqE6FAeOlFgY8HlKMCgf6ls=;
 b=g12HGd3oM/Ybh5DhnXSjpJX9/p34oNb4XcUDEkWVTTChjmU8AVXRSJHupzhnGyeF1RoQa0sxE
 ptmpzuuAGO2C/JysAnKkWmlZbTB67gj2vozOOy26D0LqW2VBdqVZnEX
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

Bit 7 of the seconds register disables the oscillator, and the guest is
expected to clear it before trusting the time. The bit was masked away
on every write, so it always read back zero and the clock never
stopped.

The reset value stays clear rather than set as on real hardware,
keeping the model's convention that the clock comes up running and
synchronised with the host.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 862e03bd32..79bcff4599 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -14,6 +14,7 @@
  *   so the sub-second phase of the clock is not modelled.
  * - Leap years follow the Gregorian rule, where the parts stop at 2100: they
  *   derive the leap year from the two-digit year alone.
+ * - The model comes up with the clock running; real hardware comes up halted.
  */
 
 #include "qemu/osdep.h"
@@ -53,6 +54,7 @@ struct DS1338State {
     uint8_t nvram[NVRAM_SIZE];
     int32_t ptr;
     bool addr_byte;
+    bool osc_stopped;   /* oscillator halted: time is frozen */
 };
 
 struct DS1338Class {
@@ -64,11 +66,12 @@ struct DS1338Class {
     uint8_t osf_addr;       /* register holding the OSF flag */
     uint8_t osf_mask;       /* OSF bit within osf_addr */
     uint8_t ctrl_reset;     /* control-register power-on value */
+    uint8_t ch_mask;        /* Clock-halt bit in the seconds reg */
 };
 
 static const VMStateDescription vmstate_ds1338 = {
     .name = "ds1338",
-    .version_id = 2,
+    .version_id = 3,
     .minimum_version_id = 1,
     .fields = (const VMStateField[]) {
         VMSTATE_I2C_SLAVE(parent_obj, DS1338State),
@@ -77,6 +80,7 @@ static const VMStateDescription vmstate_ds1338 = {
         VMSTATE_UINT8_ARRAY(nvram, DS1338State, NVRAM_SIZE),
         VMSTATE_INT32(ptr, DS1338State),
         VMSTATE_BOOL(addr_byte, DS1338State),
+        VMSTATE_BOOL_V(osc_stopped, DS1338State, 3),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -122,6 +126,11 @@ static void ds1338_capture_current_time(DS1338State *s)
      * which will be actually read by the data transfer operation.
      */
     struct tm now;
+
+    if (s->osc_stopped) {
+        return;
+    }
+
     qemu_get_timedate(&now, s->offset);
     s->nvram[0] = to_bcd(now.tm_sec);
     s->nvram[1] = to_bcd(now.tm_min);
@@ -213,15 +222,30 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
          * is then rebuilt from it as a whole: a transfer that programs the
          * date before the month it belongs to must not be normalised away
          * against the month still held from the previous date.
-         *
-         * TODO: Implement CH (stop) bit.
          */
         static const uint8_t valid[7] = {
             0x7f, 0x7f, 0x7f, 0x07, 0x3f, 0x1f, 0xff
         };
+        uint8_t mask = valid[s->ptr];
+        bool halt = s->osc_stopped;
 
-        s->nvram[s->ptr] = data & valid[s->ptr];
-        ds1338_resync_from_regs(s);
+        if (s->ptr == 0) {
+            mask |= k->ch_mask;
+            if (k->ch_mask) {
+                halt = data & k->ch_mask;
+            }
+        }
+
+        if (halt && !s->osc_stopped) {
+            /* CH set: freeze the counters before the register is stored. */
+            ds1338_capture_current_time(s);
+            s->nvram[k->osf_addr] |= k->osf_mask;
+        }
+        s->nvram[s->ptr] = data & mask;
+        s->osc_stopped = halt;
+        if (!halt) {
+            ds1338_resync_from_regs(s);
+        }
     } else {
         if (s->ptr == k->ctrl_addr) {
             /* Control register: reserved bits read back as zero. */
@@ -253,6 +277,7 @@ static void ds1338_reset_hold(Object *obj, ResetType type)
     s->nvram[k->ctrl_addr] = k->ctrl_reset;
     s->ptr = 0;
     s->addr_byte = false;
+    s->osc_stopped = false;
 }
 
 static void ds1338_class_init(ObjectClass *klass, const void *data)
@@ -275,6 +300,7 @@ static void ds1338_class_init(ObjectClass *klass, const void *data)
     dsc->osf_addr   = DS1338_CONTROL;
     dsc->osf_mask   = CTRL_OSF;
     dsc->ctrl_reset = DS1338_CTRL_RESET;
+    dsc->ch_mask = SECONDS_CH;
 }
 
 static const TypeInfo ds1338_types[] = {

-- 
2.50.1


