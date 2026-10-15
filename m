Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F4CCC6B34
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:27:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHIdq-0000iC-C6; Thu, 15 Oct 2026 06:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIdo-0000hP-6m
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:24:52 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIdl-0003JG-Ls
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 06:24:51 -0400
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a0e1b0681bso36993635e9.3
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 03:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059888; x=1792664688;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JjVEKQw/S4Vf3YjNZwTZdRS7A1MNMQtDr+WqsJKWaZY=;
 b=JTSWsK8knxpahmTHi+Iw6X5BIe8SwwdONZ8+U3glEf3qGSW3fmQcBhIXdlpe+BzXow
 p5CCTxtY4ep1cAkZsHu5vaxoGtj2cq/zjOY8B0u6nmuDmoWtxcat2E3cIyEkozqKJNQn
 v+yczVpZvkZIpxWXlE0mjKr63h0JriLpzyziXWqouiOfUCr5BjBDGlmx11gSr3ENHuqN
 6XJXgBdLyte0AfUkIQ36HvUKYNY7XGriFmnnwwkScQb0c4FivU5TDIbrvAgLGYL1dVjZ
 4EMB184HXVJfjt9cNFfm+kRkSYYpVqY7h2E1eYaj5kLTrl5W+WhwfL7ZrON1SiH/YhBy
 74Yg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxfvHQ8BEU8tBsTB54nZ8lz/I5n1dsP3iqsdrQmcvBQM/gzkfXH13YfqnzfzVov0JpbLWNHo1BRVvpV@nongnu.org
X-Gm-Message-State: AFq9FYKyj3DIBrkN0OaepaIBTwGKhrPmpYJFsOFwuDYPskRC4BsC/HO5
 M2U9A9YP6jOM4jLcWurX+UuAOhxQrL5LMM8yvOVsQ609+UzEIOKltgIA
X-Gm-Gg: AYBFou22bNxJdO0NcnQJIsSR3pEi7O5i1OU6iWGGcu25R58lIB9d3nhIaT4j3voNFcB
 Nn7ivJJxwq7zTlxRQnfwZzIGbQ/kDcypJCI85tw59s/br0ckWNsd8bix9F5utRzDbSyfT9E91k7
 uVWsroye+lg7NLFwxhI6FSWa8Vzpjm9y7KWAc9uNycsBIfWtXi+9r+yrkzIXJ+LrDDKPzbRxRtS
 4ELMxiTgtS3jUKkT0ieQbBZuGDtEvsz5+CjnhhLRd6e1rA8fcK3I/CiESR0LrRjyA8DytSwA60Z
 XIh+SETktRf7aHWp5dev6GJcMen/1VoxtJTsVJWYfUT16h22kh1Pl3E7gFJlqYMD9eojEBth/EB
 d+3DN0OcxoGvDPzktlHnejlUA/fPP0R3D9OS17ZO3muJpioK9HE2bTw+2rn/wW5lKAiyIOrxBy9
 rhSkVn4XGM4jq0+4XrPnB5EKtGJTCQ5hK4RklASjy4PfRKDhCeJur62hGJNAmZjF81V6KcEusZT
 uroRv5acESKRxzmMk08WBt56F8eBVv6dzB4pKWDlI13sg==
X-Received: by 2002:a05:600c:548f:b0:4a1:a39b:e71e with SMTP id
 5b1f17b1804b1-4a1a39becefmr227675705e9.5.1792059888163; 
 Thu, 15 Oct 2026 03:24:48 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac4f65sm18029670f8f.39.2026.10.15.03.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:24:47 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:27:53 +0200
Subject: [PATCH v3 06/50] hw/i2c: pca954x: migrate mux state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-bmc-minerva-v3-6-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056474; l=1966;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=t4t1cTl1TBk4ZFey4DyqPbSCs2Si9Ly258qm/fFJSEU=;
 b=RTok9Uwq6hu+67AmOoubb0na8Uw7B/SmD2aMaJ10Gg1O+bpY9eZEIbEGn5USrsV78uXyULqjh
 O6rYKduPQU7Aq9mP4TQqZg3SD/g2XgxQ5sDAkEAujERHEJqdO0eAEJc
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.47; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f47.google.com
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

Reviewed-by: Cédric Le Goater <clg@redhat.com>
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
2.53.0-Meta


