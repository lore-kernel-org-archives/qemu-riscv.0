Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C12AC79FA1
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:13:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3ctz-00028L-S5; Mon, 07 Sep 2026 13:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cTV-0004zb-1N
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:45:43 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cTT-0003W1-7o
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:45:40 -0400
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49b392ccaacso56587555e9.2
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 09:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799537; x=1789404337;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yoI5CWQNkKU3FBXCClJtroQLxmdLnKfTK0MOA70taBk=;
 b=M8Z8pG/CzInYFslHPq2I9wcCZ4cXcaOBzKGWGGRQlMQTJhBFIOiYWt29/dyEv8gT38
 XE8uF50wqfFvjha73KmQRnWHWfV+LNIIpzxuFApzQJjdmZShDEg252xChq3d3HjwbwAy
 zfU8bzzsGAMVwX2sTMd1dw9vnDSAab+PlmHPObbrOKl9oPXaJvXBZpVlC08eQaHS9Xql
 NC+9ORjXPygq8jj4GnVFkat8N2XrhyJua5aMs96yWNGhBawqXruuN3wZZDl6sWEzP135
 DzUrYQ9Hu3pc1W3LrLW1iVgsvvyamGMwq1QtGXBaSmoULa6j+etKcIWYMEgcHKUfaZ3i
 5iuQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxsrBRZgrcc9VzG6ADTDkEjOWWuH1OI2y7WbAF6HuATXAVSBM3VFlO0q2iaIUKeEYLkfxFHl54Onfsj@nongnu.org
X-Gm-Message-State: AFuF++n9stBil1DDtptPMBolqnBKzvhHNy6O/M+bMU8OMCItq87zU+Gt
 LntI8dIWj+QwAjUyoybBhW4t43TJlxLtbbWkqBUcAQXjjo4KjkYQvAd4
X-Gm-Gg: AYBFou3aDEKGlRq+JYbm8rDONGVSTm/GtBy6wF1AGl2qnOOH5FTFfwZet/PsIDPmpJO
 l5gyc4W6E22r/SscLaujFzK9Zjx13ARCnj7y1o1lQVV4zMGC/4sEJ02fJGOxp1O6v9Z2RkrCFZL
 winzBdzRUVMJydRAshMesovLDhAbVcmcuIvDG2zZGXWdxpZp9KcNBGYaMCU3k7uBPwWa5lsdBuw
 Gf8miqZJ0fi7+xmiCmM7fkQxlo9WB/Nv5EJUIpPm9xjIUa30UOvRmxzRt5BzyCFwKXFlK4N78JY
 B5POAScLyGKjw8zEZvaCNJXNklapUtMwI2hmpRZRC5p+65FPdH4lA4QU8IhCowWBLwD0Uaxqbjf
 T3peJztHDpQJq656pWxsKhneocqtbroz2sIuas5IS3SBuH4l4ZtrIy9R1tzugU4saZ/QCkisA7T
 ODaVVdIqvnkdPE0LeUNJXIeKLVJf5xv1vuBgbT54uoowx2DpbY+2coY50WHxGWzUVWVwcsCrr+E
 pR38uzTSJEthvDTRJG7tLu0DsHTNAvIaAk=
X-Received: by 2002:a05:600c:5303:b0:49c:fa21:1c87 with SMTP id
 5b1f17b1804b1-49cfa211dadmr202126655e9.28.1788799537542; 
 Mon, 07 Sep 2026 09:45:37 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce5533ffbsm327256975e9.3.2026.09.07.09.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:45:37 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:06 +0200
Subject: [PATCH 16/50] hw/rtc: ds1338: add a persist-on-reset property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-16-0d83ad610c3b@free.fr>
References: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
In-Reply-To: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799320; l=2768;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=iRJ3rs2DSADN75Y/aKHhGRl/gUKlcklqtq6S9GY4iFg=;
 b=R1zNsI39Wl6jksng4NyYVJYC2BQuA6xSnHaHVXPj/v9jnRKS9zfyzLQs/rxG/3dJmDtQ+EEn2
 bTl0tSv/mlLAIpwmVTyiK5tUUdcySRpKst8ZmuJWIMCWgE9enT86e1f
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.46; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f46.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Sep 2026 13:12:51 -0400
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

A real RTC keeps counting across a reboot of the machine it sits in,
and its register file comes back with it. The model instead wiped the
registers on every reset and resynchronised the clock with the host.

Add a property selecting between the two. It defaults off, leaving
every board as it was.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index c5fc74e6ca..21deb94689 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -22,6 +22,7 @@
 #include "qemu/osdep.h"
 #include "hw/i2c/i2c.h"
 #include "hw/rtc/ds1338.h"
+#include "hw/core/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qemu/bcd.h"
 #include "qom/object.h"
@@ -56,7 +57,8 @@ struct DS1338State {
     uint8_t nvram[NVRAM_SIZE];
     int32_t ptr;
     bool addr_byte;
-    bool osc_stopped;   /* oscillator halted: time is frozen */
+    bool osc_stopped;      /* oscillator halted: time is frozen */
+    bool persist_on_reset; /* keep the registers across a reset */
 };
 
 struct DS1338Class {
@@ -263,9 +265,8 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
     return 0;
 }
 
-static void ds1338_reset_hold(Object *obj, ResetType type)
+static void ds1338_power_on(DS1338State *s)
 {
-    DS1338State *s = DS1338(obj);
     DS1338Class *k = DS1338_GET_CLASS(s);
 
     /* The clock is running and synchronized with the host */
@@ -273,11 +274,29 @@ static void ds1338_reset_hold(Object *obj, ResetType type)
     s->wday_offset = 0;
     memset(s->nvram, 0, NVRAM_SIZE);
     s->nvram[k->ctrl_addr] = k->ctrl_reset;
+    s->osc_stopped = false;
+}
+
+static void ds1338_realize(DeviceState *dev, Error **errp)
+{
+    ds1338_power_on(DS1338(dev));
+}
+
+static void ds1338_reset_hold(Object *obj, ResetType type)
+{
+    DS1338State *s = DS1338(obj);
+
+    if (!s->persist_on_reset) {
+        ds1338_power_on(s);
+    }
     s->ptr = 0;
     s->addr_byte = false;
-    s->osc_stopped = false;
 }
 
+static const Property ds1338_properties[] = {
+    DEFINE_PROP_BOOL("persist-on-reset", DS1338State, persist_on_reset, false),
+};
+
 static void ds1338_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -289,6 +308,8 @@ static void ds1338_class_init(ObjectClass *klass, const void *data)
     k->recv = ds1338_recv;
     k->send = ds1338_send;
     rc->phases.hold = ds1338_reset_hold;
+    dc->realize = ds1338_realize;
+    device_class_set_props(dc, ds1338_properties);
     dc->desc = "DS1338 I2C RTC with 56-byte NV RAM";
     dc->vmsd = &vmstate_ds1338;
 

-- 
2.50.1


