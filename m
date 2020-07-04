Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkGx-0001wJ-Aa
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGv-0001sF-Lg
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:09 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31789
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGs-0007hh-EI
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wevOFGWECaRJOmLpbzON6N0ynWLO2tBiVdtI/WyaADw=;
 b=F+NDGwBwNrJkQ1NfQbkboCvadiFp3OBm1mKzaKqsQDNp5MvyH1EXfp2W71Ot+sDWOBsUWC
 enIEGXobosDp66vJ4sD2gPPUSYUNhEkXRXCsWVps1s92ubh1KJVoAqZzPt2mI8fzmTbHd0
 vhBzIuEb5x/eOWZQyZ5FZHX992fDv5w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-tfdMVrIMM5ivmczHHo97Xg-1; Sat, 04 Jul 2020 11:40:01 -0400
X-MC-Unique: tfdMVrIMM5ivmczHHo97Xg-1
Received: by mail-wr1-f71.google.com with SMTP id b8so21933194wro.19
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wevOFGWECaRJOmLpbzON6N0ynWLO2tBiVdtI/WyaADw=;
 b=kgonYmrUnXpbLwuiQRK6nPwyeTAPsViQZuyzKTnC3M+ldCsNUKLMV3dsdwciQMOFb4
 YibLTbajoEVr/VaFpGcePlWV3gfbyGrcYt8N2v5lGAsOHZVFgrXoCjNswclFd+QuVZDk
 Vtx0DhnIgOlHCEwYTIhTY3UVzaPi+/AmduNfhEyN3L1FZtmk+pMxfvkMBQrVYyxUd2Y5
 KhnT2g2t56gGoCk7hG0j+0hbEK4++F/K3fe7JgkQ/WP50ZiR0xuL//jo7w6UnuzRx/sq
 94mOUXhbNg1Zshs39jlkEp76DghwiscP9nOZojLKUxW6IIr0biFv/NaqWivawlWIamEv
 tTHQ==
X-Gm-Message-State: AOAM532ixFj3+VP5QMwTgLPJwwikodkXzfLpmRiXHcYZJDuraW3YrCfm
 RX+zS8cPZzn1JhLw5DXII4KH4SBFeUyESbmMdjL+EOL6T8ZEN2ji0P651C0a/XcusfVD8dRiB48
 1Aw24E/mlk5Qg0ac=
X-Received: by 2002:adf:e701:: with SMTP id c1mr42222353wrm.350.1593877200717; 
 Sat, 04 Jul 2020 08:40:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7bRq3+QaGDlbCyiTBMme4FfYVY7TosEB0YYMwsTU9tY8KuV4ltQNPb9RIjotuQTPhhrgyYQ==
X-Received: by 2002:adf:e701:: with SMTP id c1mr42222337wrm.350.1593877200575; 
 Sat, 04 Jul 2020 08:40:00 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id n14sm17970909wro.81.2020.07.04.08.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:00 -0700 (PDT)
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
Subject: [RFC PATCH v2 09/23] hw/display/tc6393xb: Emit warning when old code
 is used
Date: Sat,  4 Jul 2020 17:38:54 +0200
Message-Id: <20200704153908.12118-10-philmd@redhat.com>
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
X-List-Received-Date: Sat, 04 Jul 2020 15:40:10 -0000

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


