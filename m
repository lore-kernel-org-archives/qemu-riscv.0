Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKG4-0008DB-Dd
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFy-00089t-KG
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:04:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48925
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFv-0008HL-H5
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1YHmjQuhKrVQhVboVAQhCqKWsJQjJvIRsihRuyQB5QA=;
 b=QeBTV3VndGltXq/DlxsZu6gkF9OU+lbVVjfXPV18QD2abhn8ojF510uUKQYa0W4j5B9Nug
 H6YjgbgCLUj0Ift7EEKSO9+cCZ9jD45ZCwvB4EESozg/wjZaxKEQshq40nblr+wO7dAkZy
 JAmfbpTMfENL2/ZmjAOvd5f2lUT7bx0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-jLrC2QQ6PLWkLWXfOhwoZg-1; Mon, 08 Jun 2020 12:04:05 -0400
X-MC-Unique: jLrC2QQ6PLWkLWXfOhwoZg-1
Received: by mail-wm1-f72.google.com with SMTP id g84so11263wmf.4
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1YHmjQuhKrVQhVboVAQhCqKWsJQjJvIRsihRuyQB5QA=;
 b=XdlUudGAjUbMquYjINbvhXHt86We32K7EBE7YFt2B4ZUiQaZVfov6CIZVbbOD/t/XI
 WuVikxJqFM/nHXY4mdrhbW1mF9kfbx/aN7Bt8vWUVieQItipBXwM0f3QLCM5IFnczIi+
 nddqWpuoWk9ulbmrCjE2ctpFQgCm+w7krOTtNB5vC4PpJRpN2EWsd1ZJzQice1W2OaBD
 VUv/mWkLRjJmXrIrikLMAKjwIw5EivowPhcPrYhUKiswwf5M1AL5LXLqjMqzafxFwTyE
 e1M2J0EuFyA45sJalhe9ILblxEu/fvHcllbIBhSd4QZBP9C+w22Ev1qyknLAq2e+mH7H
 YrLg==
X-Gm-Message-State: AOAM532oBHW3u1g2g3tay3ZPqL0eoPSMLuKchlazW6IIz3+9LGfQQHJ6
 Nn7gJDWbq9EZ3vN7GjGG+cKENBU8dfzezl+amdG0ptlDe2Z2gMfuVJBzlolDg2hN7I3vG/Qrqfb
 XRCfdXzJBRQuOXJw=
X-Received: by 2002:adf:e68a:: with SMTP id r10mr23902481wrm.384.1591632244554; 
 Mon, 08 Jun 2020 09:04:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU7/QCokRt2M0EtovQUdkQHNPZYj9jN1RqUTvUD0f6M2vtgvgHtmb2W1P0W/noN9Fx2nTHYQ==
X-Received: by 2002:adf:e68a:: with SMTP id r10mr23902460wrm.384.1591632244335; 
 Mon, 08 Jun 2020 09:04:04 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id k17sm177411wrl.54.2020.06.08.09.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:04:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <rth@twiddle.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Anthony Perard <anthony.perard@citrix.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 34/35] hw/usb/hcd-musb: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:43 +0200
Message-Id: <20200608160044.15531-35-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 16:04:16 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/usb/hcd-musb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
index c29fbef6fc..9b3cf1ca8f 100644
--- a/hw/usb/hcd-musb.c
+++ b/hw/usb/hcd-musb.c
@@ -25,6 +25,7 @@
 #include "hw/usb.h"
 #include "hw/irq.h"
 #include "hw/hw.h"
+#include "hw/qdev-deprecated.h"
 
 /* Common USB registers */
 #define MUSB_HDRC_FADDR		0x00	/* 8-bit */
@@ -377,6 +378,8 @@ struct MUSBState *musb_init(DeviceState *parent_device, int gpio_base)
     MUSBState *s = g_malloc0(sizeof(*s));
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     for (i = 0; i < musb_irq_max; i++) {
         s->irqs[i] = qdev_get_gpio_in(parent_device, gpio_base + i);
     }
-- 
2.21.3


