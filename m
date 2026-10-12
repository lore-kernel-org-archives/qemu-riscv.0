Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283F2CA9EDD
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 14:58:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHTA-0000xs-H5; Mon, 12 Oct 2026 10:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHT4-0000x1-Uu
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 10:57:35 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHT1-0005ZQ-DB
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 10:57:34 -0400
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48afcd7ba9bso1115364f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 07:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791817049; x=1792421849;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ck3CEQnd+90nZi0PVMSkxvUrGGVcHfbcdge1sB9r9S4=;
 b=ByTGtvrWKhjkvsmVeBu//4T16gQsJCNYFkuRf/sTELk1jz0YBlVxBC8quVhl8LLdZx
 P2YNVOw5YZVafE3Wybpi/aCKNzJB8rT9YCGZ0uFTgHPJ/SUvEiM2avYxqHO8GIFpwQT7
 RZ3LyhPIM240rMkJEb/Gvbj0kKZwLdZ6zmqdESznXzoy6z0iooHJF9Wfw+eLepxX0d2G
 fZYwex+Ml45lsi1bXXt6Wx95eDvJJ65sQcgcQc/dZ0DGcwDgmjeWafoYIHX1dw27QPOc
 ru2NHWGKABTKSi4oeGK0JzTYx5WvKyCVyVt33mW9kBd3kXFYPZe0F/khv+H7y3sx3Bfl
 sxHw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzNzfY+AZs18Bga4PbB0JT3Edj+0PbopORivQkG/vd8i6hZRVuU9S61T6JdXWUiy8Yj8Wd2d1k/GSAE@nongnu.org
X-Gm-Message-State: AFq9FYJ6CGdM7IUn9N1jZoBSxz+mUdvQU6fXBJmWpV2h1wtkguwHbRL7
 nIZi7HKAyC7xjLRQc67uhofc7MNS1JQL7UI0rboVObg8YrHcCqbm0Oln
X-Gm-Gg: AYBFou360QDH/oAJHkTlmJVvw5sdY1MSjzkZbAo+e7xra6DO37ivD+kp8UpjjEIHcfY
 WfPrJBs67dZa9LErXctZuHgXiwqFUbDs4bhiBs3cHBMrJmBesC0DtsCULwoIQ2pywJ+jaeI4kIa
 DWFIICC615Xj9bW6OIV/QNMWi3OKvgv+OyVdrBpVQJ+U2y+NfoTAxHJhI2kPzIQPLAAKKZrcmGw
 hUmuAKfzpEEemkj7wBN9P7zdNOaYq1HNb7Z5u87DY3uVaeG3KMkwjcxf7I+2/9+Xn+4q2gMj7oZ
 SXFa6yfyPr88nPFnwKWZIqPM2CJQMTcfZxON9qBlHMBNDcAUh9QKEfv/6rFOu3+a08m75sT0vpC
 VyOsJIJk6eFUT7XhAhVDAb6RNkuJN9BWugZLHuU9hSfrVn5F1MbGYCi8RW21iOiczWvQQRysWr4
 xzTotTwGXSEvaGr0zpuXsSEUh4wT2m9pqQYcXs7/k2vs8AxuI1ZwNc9E4Rpceou3hNQiTTNNXWC
 FdcLMbiLopO91TCbAyN+rl0vlb4WX2kOvGt+Dybsuv73g==
X-Received: by 2002:adf:ed90:0:b0:487:1646:8740 with SMTP id
 ffacd0b85a97d-48dbaaeab93mr13395801f8f.29.1791817049381; 
 Mon, 12 Oct 2026 07:57:29 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ac02cfsm18873073f8f.39.2026.10.12.07.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 07:57:28 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:31:58 +0200
Subject: [PATCH v2 05/50] hw/i2c: pca954x: add PCA9545 4-channel mux model
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-5-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815519; l=6615;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=guhP+3BLl/RYjFmMgEVS/5ykcSVJY8JOeua1R3YAv18=;
 b=Gqpg+agYb3dqrWFh9kXFsNENYITjwNhxpDiAUIvkQIdB/6zIbqhRnQiZldzXd/V6nto3PbNhc
 5xzjyPjfqibDI/kfQgQ+nud/EDzI5ibD8fbDmhsWSWEAui9fEPEUzel
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.49; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f49.google.com
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

The PCA9545 is a 4-channel I2C mux/switch. What sets it apart from the
plain PCA9546 is its interrupt logic: one INTn input per channel and a
shared INT output, both active low, asserted whenever any channel
interrupt is active.

Model this behind a new has_irq class flag. The PCA9545 gains four named
"interrupt" GPIO inputs and an "interrupt-out" output, and its control
read-back merges the latched status nibble; the plain PCA9546/PCA9548
switches keep their previous behaviour.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/i2c/i2c_mux_pca954x.c         | 71 ++++++++++++++++++++++++++++++++++++++--
 include/hw/i2c/i2c_mux_pca954x.h |  1 +
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index c8e75da8b2..4bb078a03c 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -12,12 +12,20 @@
  * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
  * for more details.
+ *
+ * Limitations:
+ * - A control write longer than one byte is rejected rather than retaining the
+ *   last received byte as the datasheet specifies.
+ * - On reset the cached per-channel interrupt state is cleared; a downstream
+ *   INT input that stays asserted across the reset is not re-sampled until it
+ *   next toggles.
  */
 
 #include "qemu/osdep.h"
 #include "hw/i2c/i2c.h"
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_slave.h"
+#include "hw/core/irq.h"
 #include "hw/core/qdev.h"
 #include "hw/core/qdev-properties.h"
 #include "qemu/log.h"
@@ -26,11 +34,15 @@
 #include "trace.h"
 
 #define PCA9548_CHANNEL_COUNT 8
+#define PCA9545_CHANNEL_COUNT 4
 #define PCA9546_CHANNEL_COUNT 4
 
 /*
  * struct Pca954xState - The pca954x state object.
  * @control: The value written to the mux control.
+ * @int_status: Per-channel interrupt status, for parts with interrupt logic.
+ * @int_out: The mux INT output, driven low while any channel interrupt is
+ * active.
  * @channel: The set of i2c channel buses that act as channels which own the
  * i2c children.
  */
@@ -38,6 +50,8 @@ typedef struct Pca954xState {
     SMBusDevice parent;
 
     uint8_t control;
+    uint8_t int_status;
+    qemu_irq int_out;
 
     bool enabled[PCA9548_CHANNEL_COUNT];
     I2CBus *bus[PCA9548_CHANNEL_COUNT];
@@ -48,11 +62,13 @@ typedef struct Pca954xState {
 /*
  * struct Pca954xClass - The pca954x class object.
  * @nchans: The number of i2c channels this device has.
+ * @has_irq: Whether the part implements interrupt logic.
  */
 typedef struct Pca954xClass {
     SMBusDeviceClass parent;
 
     uint8_t nchans;
+    bool has_irq;
 } Pca954xClass;
 
 #define TYPE_PCA954X "pca954x"
@@ -116,8 +132,10 @@ static void pca954x_enable_channel(Pca954xState *s, uint8_t enable_mask)
 
 static void pca954x_write(Pca954xState *s, uint8_t data)
 {
-    s->control = data;
-    pca954x_enable_channel(s, data);
+    Pca954xClass *c = PCA954X_GET_CLASS(s);
+
+    s->control = c->has_irq ? data & ((1 << c->nchans) - 1) : data;
+    pca954x_enable_channel(s, s->control);
 
     trace_pca954x_write_bytes(data);
 }
@@ -148,16 +166,45 @@ static int pca954x_write_data(SMBusDevice *d, uint8_t *buf, uint8_t len)
 static uint8_t pca954x_read_byte(SMBusDevice *d)
 {
     Pca954xState *s = PCA954X(d);
+    Pca954xClass *c = PCA954X_GET_CLASS(s);
     uint8_t data = s->control;
+
+    /*
+     * On parts with interrupt logic the read-back byte carries the per-channel
+     * interrupt status in the upper nibble.
+     */
+    if (c->has_irq) {
+        data = (s->int_status << 4) | (s->control & 0x0f);
+    }
+
     trace_pca954x_read_data(data);
     return data;
 }
 
+/*
+ * A downstream device drives one of the INTn inputs. INTn and INT are active
+ * low, and both carry the physical level: 0 is asserted, 1 is idle.
+ */
+static void pca954x_irq_handler(void *opaque, int n, int level)
+{
+    Pca954xState *s = PCA954X(opaque);
+
+    if (level) {
+        s->int_status &= ~(1 << n);
+    } else {
+        s->int_status |= (1 << n);
+    }
+
+    qemu_set_irq(s->int_out, s->int_status == 0);
+}
+
 static void pca954x_enter_reset(Object *obj, ResetType type)
 {
     Pca954xState *s = PCA954X(obj);
     /* Reset will disable all channels. */
     pca954x_write(s, 0);
+    s->int_status = 0;
+    qemu_set_irq(s->int_out, 1); /* INT released */
 }
 
 I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel)
@@ -169,6 +216,13 @@ I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel)
     return pca954x->bus[channel];
 }
 
+static void pca9545_class_init(ObjectClass *klass, const void *data)
+{
+    Pca954xClass *s = PCA954X_CLASS(klass);
+    s->nchans = PCA9545_CHANNEL_COUNT;
+    s->has_irq = true;
+}
+
 static void pca9546_class_init(ObjectClass *klass, const void *data)
 {
     Pca954xClass *s = PCA954X_CLASS(klass);
@@ -184,12 +238,20 @@ static void pca9548_class_init(ObjectClass *klass, const void *data)
 static void pca954x_realize(DeviceState *dev, Error **errp)
 {
     Pca954xState *s = PCA954X(dev);
+    Pca954xClass *c = PCA954X_GET_CLASS(dev);
     DeviceState *d = DEVICE(s);
     if (s->name) {
         d->id = g_strdup(s->name);
     } else {
         d->id = g_strdup_printf("pca954x[%x]", s->parent.i2c.address);
     }
+
+    if (c->has_irq) {
+        /* One INTn input per channel, plus the shared INT output. */
+        qdev_init_gpio_in_named(dev, pca954x_irq_handler, "interrupt",
+                                c->nchans);
+        qdev_init_gpio_out_named(dev, &s->int_out, "interrupt-out", 1);
+    }
 }
 
 static void pca954x_init(Object *obj)
@@ -242,6 +304,11 @@ static const TypeInfo pca954x_info[] = {
         .class_init    = pca954x_class_init,
         .abstract      = true,
     },
+    {
+        .name          = TYPE_PCA9545,
+        .parent        = TYPE_PCA954X,
+        .class_init    = pca9545_class_init,
+    },
     {
         .name          = TYPE_PCA9546,
         .parent        = TYPE_PCA954X,
diff --git a/include/hw/i2c/i2c_mux_pca954x.h b/include/hw/i2c/i2c_mux_pca954x.h
index 3dd25ec983..19a1050505 100644
--- a/include/hw/i2c/i2c_mux_pca954x.h
+++ b/include/hw/i2c/i2c_mux_pca954x.h
@@ -3,6 +3,7 @@
 
 #include "hw/i2c/i2c.h"
 
+#define TYPE_PCA9545 "pca9545"
 #define TYPE_PCA9546 "pca9546"
 #define TYPE_PCA9548 "pca9548"
 

-- 
2.50.1


