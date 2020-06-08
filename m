Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKFS-0007Z3-Do
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFG-0007Q3-K1
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:03:30 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:41177
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKF6-00089z-7Q
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKgZ6rumXDcRDPMbmvtvFrKHcFm+r1xyGKVfqjvJc6Q=;
 b=h/L7DB3OazdrSAwSWd/51Tbfu2L2z8ogW+KqgJ6mCU5A2TxHlMowWoXXSxAj/JzNvz1M4s
 gM9etjK0QPR7FKuek+3rR/FzJ7enJEUpErUOMNvHjIJY4ZgWmKmERYXbCeWEN2ZllZCR6u
 1gUNFAW2Yr+qiL8WvajIydtvQTChXFU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-h6-o_9MDNriuF6ijX9SLpQ-1; Mon, 08 Jun 2020 12:03:10 -0400
X-MC-Unique: h6-o_9MDNriuF6ijX9SLpQ-1
Received: by mail-wr1-f72.google.com with SMTP id j16so7294533wre.22
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKgZ6rumXDcRDPMbmvtvFrKHcFm+r1xyGKVfqjvJc6Q=;
 b=dJ7rxFRUYYedb6bs5fCuXVpma27uc7oHCANCN6Qq7fUfLCBDNyaDZSb5e4ca+g5POZ
 yzJKyRgYtOpKx8AIevEgHuV23dzBSWKJ/MvQ6PYz2MCn7Do6Uc3iTqga1ppM6MPW9oel
 CofM3bcnguGvBpsr5wpkmGGLEXotnEfkc+osuXMI9QM0UFLMBEl28JiMn19RMzFxlg+J
 y7fda/Dhf3qd1nOMloeBPFfj689YErujYyoDUkvnVbNhr0okTk/nODJ8CZTqsEbIh3Mp
 PMv0iM60e5pVycgs0GUGObm3H1W9HSCvepLzdL4UyVGrlu9wuJT3Y4YegC/OcdfhRHev
 UHOw==
X-Gm-Message-State: AOAM530WcB+UsvvdJoDZlwIhZ7T2Y3w0dgOrURRgxNHOEtSuxvrbUB0l
 sp5rkjzfzv3AL11E0jEszph4vpwHETQYqNDxDAaoaFW5GOyOtTGpd03WXiKXAn8c8wjzCsdCp46
 ZUyYz8Fu33WUz15Q=
X-Received: by 2002:a1c:a906:: with SMTP id s6mr21505wme.171.1591632185574;
 Mon, 08 Jun 2020 09:03:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU3FFzPx8GJONXk2lb2PRS9hlQzh1ioPeLu4txPuU4I7Pa7KejCTY0NavLN6WE+tDOlF/rwQ==
X-Received: by 2002:a1c:a906:: with SMTP id s6mr21489wme.171.1591632185399;
 Mon, 08 Jun 2020 09:03:05 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id g25sm30434wmh.18.2020.06.08.09.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:04 -0700 (PDT)
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
Subject: [RFC PATCH 24/35] hw/misc/cbus: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:33 +0200
Message-Id: <20200608160044.15531-25-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 11:58:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 16:03:31 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/misc/cbus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/misc/cbus.c b/hw/misc/cbus.c
index 3c3721ad2d..24e197684f 100644
--- a/hw/misc/cbus.c
+++ b/hw/misc/cbus.c
@@ -25,6 +25,7 @@
 #include "hw/irq.h"
 #include "hw/misc/cbus.h"
 #include "sysemu/runstate.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG
 
@@ -135,6 +136,8 @@ CBus *cbus_init(qemu_irq dat)
 {
     CBusPriv *s = (CBusPriv *) g_malloc0(sizeof(*s));
 
+    qdev_warn_deprecated_function_used();
+
     s->dat_out = dat;
     s->cbus.clk = qemu_allocate_irq(cbus_clk, s, 0);
     s->cbus.dat = qemu_allocate_irq(cbus_dat, s, 0);
-- 
2.21.3


