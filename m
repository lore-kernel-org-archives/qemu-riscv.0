Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B6CCC6B3D
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:27:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIeX-0001Rt-Pr; Thu, 15 Oct 2026 06:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIeR-0001OH-WF
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:25:32 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIeO-0003kU-Lk
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:25:31 -0400
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so42687695e9.3
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059927; x=1792664727;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HXzz1QMMzZ/n/bvN4ExUkbI8aUO54r3IoptKCcv3x0M=;
 b=RKbQZn6NIkWUqhf0dq4GZAOehcVBC9QxpXl5YW5Bl2qdkwOqVP0o3DAq5JMM7vHokg
 hfSU9FpRjBjWQPwfi06XQLrQ23wNY1ghAywcz+N9JyyGHDA0rA7K1dk4/fCwRFUyg5n/
 KV2RhHgGQORyBvJybgTLp5ugxG6X43aooEFdfojAalm9tIrrNK1Vx03Al3QhDmwXp3sF
 F+zmeIL0IeMAFY6NxEcyQ9AClyxgR9/uHpceyW1koYbUj9uK0q7Fb0Dvcwne4hXEEf27
 XTr3KQZGtvNgcQDFrFj+4hb5lPTijkJqT3yGtyd1bh23AhF/CLFohylsR4rLomVUCXYx
 Ty1A==
X-Forwarded-Encrypted: i=1;
 AKwUvBznhQ4cjLwB/pCNuuKekKW7hRU29sAj5fwPxynXDmv4A67ECNIjL7Z3J0Xeoef98YT5uXIibNHsLApN@nongnu.org
X-Gm-Message-State: AFq9FYK6AXc/Gb2fgv6CCY9iStxbvghn/MZDspPw3uLhzh0KcifnyaYi
 7MN2BGwXE3QJaXaGRzCBba2/y2hdV38cBTNBNoODHQIYmm3IKbKfmiER
X-Gm-Gg: AYBFou1sqSMAb9N9jmv723JP4OvN2XK1YS5zqcPz7FmDakUUt3XKirHgMVEDLMYbs4W
 5zxF8YTIPa1CvnXdJJX4OQJ0pYCkFHNQ21M3w+OVEcjIfaZTnfS4WkKL5NNy7YPwo97cuTJLVja
 TC4iVaB/uyIw+t1lrmT0ABc0mylzErGkE0BWhSN5+X5cT6LixX4wv01VNa0h7xF6zYY1fE7Jp7g
 MGiYlSY8N0vg3XcbeW+Q+1pM3fBRGIwyCQLuIDqfPsQ7Em9qTgn6EbZpxtqxsnqp39z90IcR3gT
 iwE8P5us5HX2RCYFuq11cVVuGuQcVptSBc9OUtxBbwe6r2Se+eqkI1Ev79vbFsNmGq+LHhVt+6I
 zisGG7cgfqJnk8LJahtaJmawxD6cGJl3+wyi+bwYSoVwLOCgNsLX7aKUmYlBnRhWc4gNMtAidTu
 z2oNvp28svw8gzneCt3TjunOUdq2qGpiK/9nKdH8MqL0AE0UZ2GpGtiuXK28ikJHfKKejonCak7
 RTLhrlDFzkGxPOhMaahTAO8keGAPk9qhQ1yYDTgz0QdEw==
X-Received: by 2002:a05:600c:4e01:b0:49f:ce78:3567 with SMTP id
 5b1f17b1804b1-4a18e4afc3amr359952785e9.24.1792059926852; 
 Thu, 15 Oct 2026 03:25:26 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd9b8b5fsm64707865e9.9.2026.10.15.03.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:25:26 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:27:59 +0200
Subject: [PATCH v3 12/50] hw/rtc: ds1338: parameterise the register map via
 a device class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-bmc-minerva-v3-12-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056475; l=6152;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=niz1W2ft4OO1YofOLf1Lxh2AyTzJFOItAAqnZjDIB4k=;
 b=Ygv8bDxOTK8E2FKEGjhcxFe1cli3Hv7JzkKuV83w69/LRJK2KU397QdXlLiZqN4SEJPN3kdlc
 ajqbL2f8hXVBNFKf7c7DKHXg0vsRlmGnz0a7Mi6dcb/svx806mrTCck
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.54; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f54.google.com
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

In preparation for a register-compatible variant, refactor DS1338
register map. Introduce DS1338Class, carrying the register-pointer wrap
boundary and the control/OSF register location and masks, and drive
inc_regptr() and the control-register handling.

The control-register power-on value is parameterised along with them,
so the part comes up holding the contents its datasheet specifies
rather than zero, and its oscillator-stop flag now reads set at
power-on.

Encode the year register modulo 100 (tm_year % 100) instead of
tm_year - 100.

Reviewed-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c | 71 ++++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 18 deletions(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 1755a3a37c..7eaa663113 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -30,7 +30,14 @@
 #define HOURS_PM   0x20
 #define CTRL_OSF   0x20
 
-OBJECT_DECLARE_SIMPLE_TYPE(DS1338State, DS1338)
+/* DS1338 register map */
+#define DS1338_NUM_REGS    NVRAM_SIZE   /* 0x00..0x3f, then wraps */
+#define DS1338_CONTROL     0x07
+#define DS1338_CTRL_MASK   0xb3         /* bits 2, 3 and 6 read back as zero */
+/* POR: OUT, OSF, SQWE and both rate-select bits come up set. */
+#define DS1338_CTRL_RESET  0xb3
+
+OBJECT_DECLARE_TYPE(DS1338State, DS1338Class, DS1338)
 
 struct DS1338State {
     I2CSlave parent_obj;
@@ -42,6 +49,17 @@ struct DS1338State {
     bool addr_byte;
 };
 
+struct DS1338Class {
+    I2CSlaveClass parent_class;
+
+    uint8_t num_regs;       /* register-pointer wrap boundary */
+    uint8_t ctrl_addr;      /* control register address */
+    uint8_t ctrl_mask;      /* writable/read-back bits of the control reg */
+    uint8_t osf_addr;       /* register holding the OSF flag */
+    uint8_t osf_mask;       /* OSF bit within osf_addr */
+    uint8_t ctrl_reset;     /* control-register power-on value */
+};
+
 static const VMStateDescription vmstate_ds1338 = {
     .name = "ds1338",
     .version_id = 2,
@@ -82,16 +100,19 @@ static void ds1338_capture_current_time(DS1338State *s)
     s->nvram[3] = (now.tm_wday + s->wday_offset) % 7 + 1;
     s->nvram[4] = to_bcd(now.tm_mday);
     s->nvram[5] = to_bcd(now.tm_mon + 1);
-    s->nvram[6] = to_bcd(now.tm_year - 100);
+    s->nvram[6] = to_bcd(now.tm_year % 100);
 }
 
 static void ds1338_inc_regptr(DS1338State *s)
 {
-    /* The register pointer wraps around after 0x3F; wraparound
-     * causes the current time/date to be retransferred into
-     * the secondary registers.
+    DS1338Class *k = DS1338_GET_CLASS(s);
+
+    /*
+     * The register pointer wraps around after the last register; wraparound
+     * causes the current time/date to be retransferred into the secondary
+     * registers.
      */
-    s->ptr = (s->ptr + 1) & (NVRAM_SIZE - 1);
+    s->ptr = (s->ptr + 1) % k->num_regs;
     if (!s->ptr) {
         ds1338_capture_current_time(s);
     }
@@ -136,11 +157,12 @@ static uint8_t ds1338_recv(I2CSlave *i2c)
 static int ds1338_send(I2CSlave *i2c, uint8_t data)
 {
     DS1338State *s = DS1338(i2c);
+    DS1338Class *k = DS1338_GET_CLASS(i2c);
 
     trace_ds1338_send(s->ptr, data);
 
     if (s->addr_byte) {
-        s->ptr = data & (NVRAM_SIZE - 1);
+        s->ptr = data % k->num_regs;
         s->addr_byte = false;
         return 0;
     }
@@ -190,18 +212,19 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
             break;
         }
         s->offset = qemu_timedate_diff(&now);
-    } else if (s->ptr == 7) {
-        /* Control register. */
-
-        /* Ensure bits 2, 3 and 6 will read back as zero. */
-        data &= 0xB3;
-
-        /* Attempting to write the OSF flag to logic 1 leaves the
-           value unchanged. */
-        data = (data & ~CTRL_OSF) | (data & s->nvram[s->ptr] & CTRL_OSF);
-
-        s->nvram[s->ptr] = data;
     } else {
+        if (s->ptr == k->ctrl_addr) {
+            /* Control register: reserved bits read back as zero. */
+            data &= k->ctrl_mask;
+        }
+        if (s->ptr == k->osf_addr) {
+            /*
+             * Attempting to write the OSF flag to logic 1 leaves the
+             * value unchanged.
+             */
+            data = (data & ~k->osf_mask) |
+                   (data & s->nvram[s->ptr] & k->osf_mask);
+        }
         s->nvram[s->ptr] = data;
     }
     ds1338_inc_regptr(s);
@@ -211,11 +234,13 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
 static void ds1338_reset_hold(Object *obj, ResetType type)
 {
     DS1338State *s = DS1338(obj);
+    DS1338Class *k = DS1338_GET_CLASS(s);
 
     /* The clock is running and synchronized with the host */
     s->offset = 0;
     s->wday_offset = 0;
     memset(s->nvram, 0, NVRAM_SIZE);
+    s->nvram[k->ctrl_addr] = k->ctrl_reset;
     s->ptr = 0;
     s->addr_byte = false;
 }
@@ -225,12 +250,21 @@ static void ds1338_class_init(ObjectClass *klass, const void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DS1338Class *dsc = DS1338_CLASS(klass);
 
     k->event = ds1338_event;
     k->recv = ds1338_recv;
     k->send = ds1338_send;
     rc->phases.hold = ds1338_reset_hold;
+    dc->desc = "DS1338 I2C RTC with 56-byte NV RAM";
     dc->vmsd = &vmstate_ds1338;
+
+    dsc->num_regs   = DS1338_NUM_REGS;
+    dsc->ctrl_addr  = DS1338_CONTROL;
+    dsc->ctrl_mask  = DS1338_CTRL_MASK;
+    dsc->osf_addr   = DS1338_CONTROL;
+    dsc->osf_mask   = CTRL_OSF;
+    dsc->ctrl_reset = DS1338_CTRL_RESET;
 }
 
 static const TypeInfo ds1338_types[] = {
@@ -238,6 +272,7 @@ static const TypeInfo ds1338_types[] = {
         .name          = TYPE_DS1338,
         .parent        = TYPE_I2C_SLAVE,
         .instance_size = sizeof(DS1338State),
+        .class_size    = sizeof(DS1338Class),
         .class_init    = ds1338_class_init,
     },
 };

-- 
2.53.0-Meta


