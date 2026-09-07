Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477F6C79F99
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:13:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3ctp-0001xy-0O; Mon, 07 Sep 2026 13:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cRf-0007tP-DG
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:43:47 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cRc-0002uD-JT
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:43:47 -0400
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-485850cf499so2405164f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 09:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799420; x=1789404220;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cBS24KyVkFdx9K1mrb9mnaPLSyXbJlcPXKfV6TpuYbc=;
 b=J/nZ5BogL97D4z0C71X8Z5BRpY2QqINOefRAO0c8UTtPfpi4PnSER2rK45RE6xwcvX
 qYi2iSCf6DoL27DuIX9pH4iFJ2ryd5VJLichEp3PDrZyF17YnjVuqwRNsX+CTJAq7uye
 d9SIdp4GsWzxZZQotdktQYf8pGnuhUqhUD9YPtnmFBwYxtolaBn4YXjultNxtov2kUXu
 uZrFjzElRGcpWPMEyqO8+52CWWNkwGn5x8F6U3rCpi8P1Nsd5QUg4jE6leU63WpGri/E
 hrdeN2Q8OOHQ0YV6KmN0vx6DRrDqbTD3pyUG8ubvpQAZ7Q2Zk3ET7l8QQgAv9tD3ypqH
 1rHA==
X-Forwarded-Encrypted: i=1;
 AKwUvByp4WdHWHG2DZ0O20vhgCV41YzyCtllRpbMpUM/jyuJX+VP5oK3O58yXFwVQlDl9n+nrpcBKt3XKSoo@nongnu.org
X-Gm-Message-State: AFuF++nJyGSye/HCjgdxnFzzzNVYYjvz8xSSoBq4MnublstTDaR8DpSK
 axNEa1jCFcOaFJ5/GzDvEjE5cf46dD7abw/YcDWlzqW2eYeMI53R7oaOvOC3l4Sp
X-Gm-Gg: AYBFou32JlA/pQIgmiagJ+fvQdqzf33rQ7E71j++fLWNZcqtTvKUG7LdTpXe5kIdKsR
 /WAiNfD1IprkveDxhBRQ76uXcKRS236aYBrUdHXjZURuChqHSP5RJiRdn/yr29aOMjj1I4OHaKy
 8+VDGiJlY6dzJmFg/qZuuRs+8c/znQqNcz3fvrchrtWU14mFV3gglaG6mlcAnlqIM5I5OeOtqkr
 R9qkox2DLa/mBDxKM0s4NrDwPPxz81x0gtvGoRykd3dZ3ykWBdesPirxXeTj+2Ve+ecoupOxp/g
 P1eS28PcLoB2s5iBwFS1Oclvcvq14WSW7kxs+2o3ht6TbFbQmVMsP/5zNISGx2BtwDGs8pfl1nw
 0pBaXDbnuqospTCib9pO/ll1ZAjHHrNsG70t99Swx/RvTnAUzj1XPEyS9yBof2SLGrGcfl1uXWm
 LgmayrXHpxPsTCztCn2VDrJ4MD5cL5EQaUy5kCqv/rNacSQmihnnmMMyAmj2D1LSlER5lSolAPE
 tNTPlb7wDk0Utlk3pL0NYitSy2KaBRhpBI=
X-Received: by 2002:a05:600c:474a:b0:49c:e42b:a4ac with SMTP id
 5b1f17b1804b1-49cf823f60amr211651975e9.11.1788799420181; 
 Mon, 07 Sep 2026 09:43:40 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce5563c6csm349072185e9.4.2026.09.07.09.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:43:39 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:41:56 +0200
Subject: [PATCH 06/50] hw/i2c: pca954x: migrate mux state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-6-0d83ad610c3b@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799319; l=1912;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=6X3qtF5y9bDFv2QNu2TGa306El/FnP4ElGjKxh8N7cM=;
 b=RiY+touNeouJPHPg0XaLz54f1yFoRxrHYeecw6h5+E0u9TudjvUcFTHm+cxKznm1V2R++OJcC
 WWf1JvKmu5fD9TJJYF0+bv84pS8EjMvOlHxF49uXBu7d64srbnWoc5A
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.51; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f51.google.com
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

The pca954x model had no VMStateDescription, so neither the channel
selection nor the PCA9545 interrupt status survived a migration.

This changes the migration stream of the pre-existing PCA9546 and
PCA9548, which an older QEMU rejects.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/i2c/i2c_mux_pca954x.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index 4bb078a03c..597e57d99a 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -28,6 +28,7 @@
 #include "hw/core/irq.h"
 #include "hw/core/qdev.h"
 #include "hw/core/qdev-properties.h"
+#include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/queue.h"
 #include "qom/object.h"
@@ -270,6 +271,28 @@ static void pca954x_init(Object *obj)
     }
 }
 
+static int pca954x_post_load(void *opaque, int version_id)
+{
+    Pca954xState *s = PCA954X(opaque);
+
+    pca954x_enable_channel(s, s->control);
+    qemu_set_irq(s->int_out, s->int_status == 0);
+    return 0;
+}
+
+static const VMStateDescription vmstate_pca954x = {
+    .name = "pca954x",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = pca954x_post_load,
+    .fields = (const VMStateField[]) {
+        VMSTATE_SMBUS_DEVICE(parent, Pca954xState),
+        VMSTATE_UINT8(control, Pca954xState),
+        VMSTATE_UINT8(int_status, Pca954xState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const Property pca954x_props[] = {
     DEFINE_PROP_STRING("name", Pca954xState, name),
 };
@@ -287,6 +310,7 @@ static void pca954x_class_init(ObjectClass *klass, const void *data)
 
     dc->desc = "Pca954x i2c-mux";
     dc->realize = pca954x_realize;
+    dc->vmsd = &vmstate_pca954x;
 
     k->write_data = pca954x_write_data;
     k->receive_byte = pca954x_read_byte;

-- 
2.50.1


