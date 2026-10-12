Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A1ECA9ED1
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 14:59:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGHUh-0001bU-1d; Mon, 12 Oct 2026 10:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHUB-0001Uj-U6
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 10:58:48 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHU0-0005fC-7e
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 10:58:40 -0400
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48afcd7ba9bso1115913f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 07:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791817111; x=1792421911;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cBS24KyVkFdx9K1mrb9mnaPLSyXbJlcPXKfV6TpuYbc=;
 b=REapz1iic+WPjIU4sIUBIdLVTgihPCts50dIvapz2T5f3oFG+twmin2ph5zO8I1dN9
 TpABhi4cWD+f+rJ8NpqQLk+KprR9B4vZdX/CBU3HHlNT/8FBOrDwTROCXhbx/bHAV3yw
 DypEIUx1m+vngOWjT2pJh0LTfZxfZMhR3zg1kz6OJkXHEjz+ATXgLJoi+J1g3PWoCLXj
 8glE6OLE3wY3wGETnX0lnz28xYtj7dDjDqDGLycsPffeHRjUwSG8EMcCLlPx9NVkZ/AY
 DeIF74RyujRnB9FgcN+nJHeLDfeNLFFcP8KUHz+cVSU+MQ24pOWVD9v2Jheax3nI9eBR
 fcdQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByFE4kfJS23VGmEOh+Lygjl8xHud/siPMNZVQMtvg9u21EdBeuZVrQ7Tvc/idC+q7YdwMCAti+JRf3s@nongnu.org
X-Gm-Message-State: AFq9FYIO0q+E1V3UKPq/fhHI4Wx3r1rkdYH1Es9RlZrETmU3R4rxZx8l
 kHpBOSCsC213iJ4XpamCwCVReKXYym5DUSEgzXBrRCc3v2CX0cvkg/Ri
X-Gm-Gg: AYBFou14uz6ACCRBtdb7ynBI+IvZvOH/xkm4gtkkMPlVRrvubsI3UKI6u4F2mKQeTpa
 EnYLnrX4iFFb7l/iKoJDwjyMSSZa8KQ8MyiQ8ngg+27g7HAV2BxFeeWa2HRAYGtZtFnSB4PQ4Ci
 Kku7hYFYr+lNtEGjSjc45UkIQqXkE1pnYOZUeqrDp724tfOSE2ZWvZmzQ8i3rxgVNlgV8d/vct8
 NOXRaFxirHOL38uZzz0SIFh6i2zjMcuHWSVri5VD5CTVMVYosj3I6eOkdDYxZ+Z4q3wnVNB3Zja
 JpBHT09lvqVuX8Nbd329hI0MVCo4mIuAN8M128s+SOwojKqK6vzSXTE1IyFzOnQ50sr4HGETPkg
 NsZ6crvx0E9jPbvq8y1gpHt/ilYaSu5OvXFppWwQBm1IzHHN8KKWBOy+jp1igj9pQrusYjrQJqg
 OXqkBAvCFk6TI2z/mfNopIFSV0LilrCgcuhSJRB7EBI5bdOPo4bQMO14qvNynt+F9mGBtpQLAIJ
 mDmfGv/utP5vGpKQvm8cAfMlMNBXkmmltzQvZMDyXhJwA==
X-Received: by 2002:a5d:5e01:0:b0:487:35d:cb0f with SMTP id
 ffacd0b85a97d-48dbaadde6dmr19172721f8f.14.1791817110618; 
 Mon, 12 Oct 2026 07:58:30 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9acfa28sm20117000f8f.51.2026.10.12.07.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 07:58:30 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:31:59 +0200
Subject: [PATCH v2 06/50] hw/i2c: pca954x: migrate mux state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-6-4c3dff084ec9@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815519; l=1912;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=6X3qtF5y9bDFv2QNu2TGa306El/FnP4ElGjKxh8N7cM=;
 b=a/5no+gY9vkPrY0vzsK8im6C2uagcbkgarXXe3eLjxbo6dEPrkuWZVv3+pquCSlmGHutp1fVZ
 M4UyIV9d2W9BZCOIO8chhhFYJQro60j5KZq24p4nRLpQIdLv5ilwr2h
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


