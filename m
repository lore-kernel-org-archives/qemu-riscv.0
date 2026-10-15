Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67902CC6B34
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:27:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIfS-0002g6-6K; Thu, 15 Oct 2026 06:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIeh-0001hF-8Q
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:25:57 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIec-0003nB-3J
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:25:44 -0400
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so863460f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059939; x=1792664739;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=W5PhRPYjPeVIiLmDaG68Pb9QynlP1yOMDtzh8f0rn+Q=;
 b=YjaMQJjxwH4EaGR+aflvlV8YncG+y/60BcbBDYTfivxSEyGk3JOo/iApRUDI7WlzJM
 QM+Rx/nBMzhVjrrsuy3UeltRyRxwuvCNRBueDIUeCuAlpQJ/9/4xH3eRI4SrZ7YMOXGT
 /AE4G8WtrYYI45eIv9VunkInM1XZxqxqL0k5V+uyHFGfeZ5bDQpmgG+uuPC8VogCjddA
 htQSnD6KmZSSW0fLWwxoN0mh8u8kIE18oXIk5UquYX+iHLGFr7vaCmBfrB58iXKPtlSb
 wYvCj43FBjujJHr+TfQVh6XNgy9IbgtdiK5daUZxVmzbFbEmZWSpcGn1YSeVOsmFIT44
 je6A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwgxolzHeUiCllsqM0SCX8o/yUwXiBIQ+Cu+8kPVnEJmXTKEnHSoD1KX1DSNuAWwwM4s0jIotfiHDs/@nongnu.org
X-Gm-Message-State: AFq9FYIwgSbNh7U8idd1/wlKmGPxhwETDZcM1iGtxKVVyEtrchzi762N
 FH934CedEo+pau9xcfM7tW5nXlVFGx9WwovfMUMTVPU/eORkOGITwl6o
X-Gm-Gg: AYBFou10g4q5Yse5L4xCj1jH0FMx+7Pl4kTtaR5KjrgnkysBtphy6xIH3SNELUCi5pM
 aun+c1mLUXdLxj34/So5cssGGYXJYk41dQ5z+Ejz3j0jZs6wM4BzEk++Wvjn0itLGUi5f0+pnRI
 uf8zP7I3kubnxK95MdxecSeJI0exhIyNCvSgM7e5U85Vpr++16AK833m9XC2CleRkKS7p5hKCtK
 sp3Rn7pVknRHumzu0E0/NXTI4n0fLCCy2IVeIiA6+d4pjJ1YH1bw21c7K/RG79JIYvD63B1MPtx
 toLX11vlIySaDzY31ACOgMpFkK5NfWNVRmYeE9NGF3h2G2+9qP6Dh9KWh8PZOIpPZx3/r6d7h5b
 bWfWpyzTtkWTvOA8DRBzqA8X1EHKsrmzRCSG943OYCrxhbbrvuZibilrnWlsESCn79nPhmnG5Kk
 eXM69P/QdLcZkwbHCJnISWSM963e9G+D4HYbt/3gMf35qF7Ee2rJ/j205KQtn0arAdnpbPEQiCU
 5qmvWkhLSiOeVyFHm5Za/mcsVgqP1E8/PzKg/a6fuhE+g==
X-Received: by 2002:a05:6000:4694:b0:48c:67d8:abd1 with SMTP id
 ffacd0b85a97d-48dba9be288mr25519734f8f.13.1792059939384; 
 Thu, 15 Oct 2026 03:25:39 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0967affsm16109509f8f.1.2026.10.15.03.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:25:38 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:01 +0200
Subject: [PATCH v3 14/50] hw/rtc: ds1338: implement the DS1338 clock-halt bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-14-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056475; l=4398;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=Kzt6qfQ8xw5u2qhWKCAbs8upbxPA4Z4PtksNYulDrzo=;
 b=zIeN5UVvq13Nz2bsi2czZzqePs3GsxgGsdMwKogSUbKN2sAf7mp21XbHwLdmaLu+l9l+DVJSl
 xNaVjnGC9L9ARGqYeN1dsKxLbY7Cul0qUuzYJnF8SlYXRl8YE3WF57Z
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.50; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f50.google.com
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
2.53.0-Meta


