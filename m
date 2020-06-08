Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKDg-0006Tw-G3
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDd-0006RD-OD
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:49 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60323
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDc-0007jx-QO
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wevOFGWECaRJOmLpbzON6N0ynWLO2tBiVdtI/WyaADw=;
 b=L7iBk/vQYfsoXEyIA0kMskAXcwZF2qob/dtTtYkmop+wG9psrSwkWTA2g832jATpDVluok
 oDQU91ZaxtjMubZB2QpXtHweHIGwy8m1N0/uBQexPpjPmi5Le8LZVZ91wx/YePOqLUqVP1
 uz//RoSBiRHXRGFSepa+rKuSqcFAOXw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-rQ65WM2MOFCyOHT_8NVuOw-1; Mon, 08 Jun 2020 12:01:44 -0400
X-MC-Unique: rQ65WM2MOFCyOHT_8NVuOw-1
Received: by mail-wr1-f70.google.com with SMTP id p10so7359421wrn.19
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wevOFGWECaRJOmLpbzON6N0ynWLO2tBiVdtI/WyaADw=;
 b=FHQg5kZ64f4gFOxw9VvPz4NJsG0mBxluVjqmeI7nVpYE9lvFxoKFbP9ezYQFNTlMbX
 lt2pd0nCAM8kiuL7g2ttXvfQdrNPgMOGxcAWl/sN3VaGxezAjoDRjl5ygobsEJTU0Krf
 MC8FKqMBfzdHBG2xm/VWRGXiK36GnMsMpXB5Ds4IGXqQtPoAwMW1/fSIYovCB5HM1kuH
 FlrLY8321nrlrZ5S2d6XtPovCVXO3s5B8ifTmA4XL5g45LjWMUBya1RBa5qswlYiDZBn
 OaQ/UWFvLpDVkuUkWoPQyAGke/NKe8hIMuhKjHGZgqNbRYbZAvw2UVnlcbdPjeMUVyeG
 yIPg==
X-Gm-Message-State: AOAM532YFpxMbeGSag8EmjHW8pCzFCpLBI3st/709NF633x2r0W1kLjx
 HcE4Gf6QdgddhmNRe0lqsEwCgpEjKlkxmKr9VsWM2DN4VJkHP3wW+nVFZpFgUQht12giDK0dA+p
 rCtY7V56MVNqrIhU=
X-Received: by 2002:adf:fd81:: with SMTP id d1mr24815718wrr.96.1591632103558; 
 Mon, 08 Jun 2020 09:01:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgYI93lvZ2rTNUf8uc34cwDYk4WA9pXLtkl6aiMXyXdGzMVgF1rzOkVGZM3nz7yDUz0VO1vA==
X-Received: by 2002:adf:fd81:: with SMTP id d1mr24815694wrr.96.1591632103352; 
 Mon, 08 Jun 2020 09:01:43 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id b185sm342940wmd.3.2020.06.08.09.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:42 -0700 (PDT)
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
Subject: [RFC PATCH 10/35] hw/display/tc6393xb: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:19 +0200
Message-Id: <20200608160044.15531-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 08 Jun 2020 16:01:50 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/tc6393xb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 49a676d1b0..e4900e9502 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -21,6 +21,7 @@
 #include "ui/console.h"
 #include "ui/pixel_ops.h"
 #include "sysemu/blockdev.h"
+#include "hw/qdev-deprecated.h"
 
 #define IRQ_TC6393_NAND		0
 #define IRQ_TC6393_MMC		1
@@ -556,6 +557,8 @@ TC6393xbState *tc6393xb_init(MemoryRegion *sysmem, uint32_t base, qemu_irq irq)
         },
     };
 
+    qdev_warn_deprecated_function_used();
+
     s = (TC6393xbState *) g_malloc0(sizeof(TC6393xbState));
     s->irq = irq;
     s->gpio_in = qemu_allocate_irqs(tc6393xb_gpio_set, s, TC6393XB_GPIOS);
-- 
2.21.3


