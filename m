Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkGZ-0001Is-PH
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGU-0001FW-C9
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:39:42 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23860
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGQ-0007Vk-Jk
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wUMsI8pPCoJLWJQxhYCjSGYgbzwxCwXM4hINsxgIP8Y=;
 b=c+FHDCMB6aTt8QZVon+yDZ3tg0JsoatghoYHK1lPcfZt7FMoFEhUON0y/C1xnEGg68T2zt
 PmmKBd3Zcb7hwG5kEnhqppJA0pO456P7VBllTngce9KubJhLQA6l8XiNs8o7oyDzpSVW2h
 ME7C/RZhNE+uczcaGI8LUxc73bVufAc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-zn26B5a1MlyAdGvcVGBv6w-1; Sat, 04 Jul 2020 11:39:34 -0400
X-MC-Unique: zn26B5a1MlyAdGvcVGBv6w-1
Received: by mail-wr1-f70.google.com with SMTP id i12so35818150wrx.11
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wUMsI8pPCoJLWJQxhYCjSGYgbzwxCwXM4hINsxgIP8Y=;
 b=O4EgVt+zM8uFXDXIEvR+6UXwx9hj0nwPOznTZFpuiuVLEu6OgxH8SWmRAhLuJE3TU2
 XZIkuP2KIbTBg6/kofD+5DPl06bK8Awj/HWqCmenGsy5HFtst2e9dUOunQUY7ul9I99B
 UmPQgMAQBzaWaga+DSa48EPlGeA8iIpmb/EPZQUdfQfEKLBTOyuvEZo68bEZP2OIxadf
 peSqE3+plIu4HlnBSoDGSdiXOa4AwOqp0WI5xlnhyrMjqMk5FfofamANa2nUFoBbp/PF
 sTu80up2QaK+V8SbJsKmWjnPT+otq4zw9P+LsYaHn+2tgjqTHAKWCoLFkJuPeuzfXk0v
 oVQw==
X-Gm-Message-State: AOAM532t2vXdxIUIdLF1ag7a/mCaFOLqbpLlGD1jHJp5/ab1xfwMP8aM
 sC61fH4avsPu1mXPzvAGnkD5zyOACu/V1JRu9LBhfFcszZt0tJmzb4241d4VAZexTe7npRi3EOt
 2PBy+CTOJPjUvxyg=
X-Received: by 2002:a05:6000:111:: with SMTP id
 o17mr43727439wrx.178.1593877173363; 
 Sat, 04 Jul 2020 08:39:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhZpaC4/kffjhUCkKRReiugjCiLRymQ9MrOurXjYEblSE5KLvKS6tusliBNPYaGxM9snMfzQ==
X-Received: by 2002:a05:6000:111:: with SMTP id
 o17mr43727419wrx.178.1593877173151; 
 Sat, 04 Jul 2020 08:39:33 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id e5sm17685316wrs.33.2020.07.04.08.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:39:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Stafford Horne <shorne@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Thomas Huth <huth@tuxfamily.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH v2 04/23] hw/arm/pxa2xx: Emit warning when old code is used
Date: Sat,  4 Jul 2020 17:38:49 +0200
Message-Id: <20200704153908.12118-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704153908.12118-1-philmd@redhat.com>
References: <20200704153908.12118-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 08:57:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Jul 2020 15:39:43 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/pxa2xx.c          | 3 +++
 hw/display/pxa2xx_lcd.c  | 3 +++
 hw/input/pxa2xx_keypad.c | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index f104a33463..adc7263e59 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -27,6 +27,7 @@
 #include "sysemu/qtest.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
+#include "hw/qdev-deprecated.h"
 
 static struct {
     hwaddr io_base;
@@ -1768,6 +1769,8 @@ static PXA2xxI2SState *pxa2xx_i2s_init(MemoryRegion *sysmem,
 {
     PXA2xxI2SState *s = g_new0(PXA2xxI2SState, 1);
 
+    qdev_warn_deprecated_function_used();
+
     s->irq = irq;
     s->rx_dma = rx_dma;
     s->tx_dma = tx_dma;
diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index ff90104b80..cf6241ff21 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -20,6 +20,7 @@
 /* FIXME: For graphic_rotate. Should probably be done in common code.  */
 #include "sysemu/sysemu.h"
 #include "framebuffer.h"
+#include "hw/qdev-deprecated.h"
 
 struct DMAChannel {
     uint32_t branch;
@@ -1011,6 +1012,8 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
     PXA2xxLCDState *s;
     DisplaySurface *surface;
 
+    qdev_warn_deprecated_function_used();
+
     s = (PXA2xxLCDState *) g_malloc0(sizeof(PXA2xxLCDState));
     s->invalidated = 1;
     s->irq = irq;
diff --git a/hw/input/pxa2xx_keypad.c b/hw/input/pxa2xx_keypad.c
index 62aa6f6b15..6de1e9e4bb 100644
--- a/hw/input/pxa2xx_keypad.c
+++ b/hw/input/pxa2xx_keypad.c
@@ -17,6 +17,7 @@
 #include "migration/vmstate.h"
 #include "hw/arm/pxa.h"
 #include "ui/console.h"
+#include "hw/qdev-deprecated.h"
 
 /*
  * Keypad
@@ -316,6 +317,8 @@ PXA2xxKeyPadState *pxa27x_keypad_init(MemoryRegion *sysmem,
 {
     PXA2xxKeyPadState *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = (PXA2xxKeyPadState *) g_malloc0(sizeof(PXA2xxKeyPadState));
     s->irq = irq;
 
-- 
2.21.3


