Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkI3-0003fn-Jm
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkI1-0003cM-5r
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:41:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45762
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHz-0008PU-Lp
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T05aSWsXj6XqlyyRKFN7AiT8E00rxZAH7ivGzBAXguo=;
 b=efJhT5VtjTDSURLhsSXPpP6YAgREm1z+/g0OAGE85Uy+/9pMMXWPIZrRxq1OgxZXoNqwDs
 DGHg4eVlKHoK0/oyFsFmQVcfu25vaNGUdLczVgVhyQNOONErQIqja0F6OVKOwk3l7i/n3k
 PjQs8XMcXdG4CRwtB2mvKixkWOA7LEU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-3IuXEuCzO6-uV1gZ2T_Nsg-1; Sat, 04 Jul 2020 11:41:11 -0400
X-MC-Unique: 3IuXEuCzO6-uV1gZ2T_Nsg-1
Received: by mail-wr1-f70.google.com with SMTP id i12so35824225wrx.11
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T05aSWsXj6XqlyyRKFN7AiT8E00rxZAH7ivGzBAXguo=;
 b=lpY+2RNel7TCXjqUcYIde8CBqCkL97trJe67DR5EhcehBk4ZjJsWLZ2ThjII0sIWud
 8BqxWGBl4rWwFMGdqaKlCLDg8suYyCrosH0Edc0fKrX1KOSTcq+lAAiwT4GhBjifvMPN
 T4tZt8sfV4XMapJ0cwQYOBQjxmyoGRNCJX7WmAcOfKLCzf5J1q+F4pYIYqAy0faVQeVm
 MnPN70YWZyAu9vcqncL5H+K3pyZbIqzlvoleVC7llJWX+YaHTVXn5G2c+EPBB+LFo0d6
 EQIVGRVTqhR2T12ipb+gZLP6JTMf/6yxS3AnmmUC1nu20E1D/hq54NCcm83u/YHibpjk
 5mJQ==
X-Gm-Message-State: AOAM5309ROLc9T2iV1a35IHMF/x0cA1qKx/s9NXTzGYgKwlxaALidJHv
 I8bil74e84eBwfC9oCyQDaw6TSSeJeQqX4GJxxPsg1I/L7e2fzB1suWbRzme4RfUzmbyBRpA4y7
 iM2mAoXFYjqISqxY=
X-Received: by 2002:a1c:398b:: with SMTP id g133mr40165686wma.76.1593877270489; 
 Sat, 04 Jul 2020 08:41:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY6jjMSQWiKHCzETU0E+/X0LPKuPCnnd4xVQP5+FKyucBMWp08OCApfnD7RL8JFbFT8AYF3A==
X-Received: by 2002:a1c:398b:: with SMTP id g133mr40165682wma.76.1593877270343; 
 Sat, 04 Jul 2020 08:41:10 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id h2sm17134778wrw.62.2020.07.04.08.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:41:09 -0700 (PDT)
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
Subject: [RFC PATCH v2 22/23] hw/usb/hcd-musb: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:39:07 +0200
Message-Id: <20200704153908.12118-23-philmd@redhat.com>
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
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:14
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
X-List-Received-Date: Sat, 04 Jul 2020 15:41:17 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/usb/hcd-musb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
index 85f5ff5bd4..f09464ed5e 100644
--- a/hw/usb/hcd-musb.c
+++ b/hw/usb/hcd-musb.c
@@ -26,6 +26,7 @@
 #include "hw/usb/hcd-musb.h"
 #include "hw/irq.h"
 #include "hw/hw.h"
+#include "hw/qdev-deprecated.h"
 
 /* Common USB registers */
 #define MUSB_HDRC_FADDR		0x00	/* 8-bit */
@@ -378,6 +379,8 @@ struct MUSBState *musb_init(DeviceState *parent_device, int gpio_base)
     MUSBState *s = g_malloc0(sizeof(*s));
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     for (i = 0; i < musb_irq_max; i++) {
         s->irqs[i] = qdev_get_gpio_in(parent_device, gpio_base + i);
     }
-- 
2.21.3


