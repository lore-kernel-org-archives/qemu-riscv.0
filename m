Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKEZ-00075U-Nr
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEW-00070U-DM
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:44 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21155
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEU-0007tR-Ef
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WCNM8bx54yBBH5o9OGeaVnQ5KO/kQFXlsHgIbovX6w0=;
 b=OSP+kVLeIhqukfrvtEtsMVywZKXWRhzo95azkYUBDgNofS3KrnVOoAXpLsyuTz8agIcqca
 tnYw9n8/ecymqMUxmKxAusqsuDLbO48qqHTHv9nKxR24C9fz7kCPl0e2jTufYah1EzE/8d
 CZ6q7kEbbAuXPx+i6dq1kLaPIOTc94k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-aLGuZ2_oOZe5rSKs09kEiw-1; Mon, 08 Jun 2020 12:02:31 -0400
X-MC-Unique: aLGuZ2_oOZe5rSKs09kEiw-1
Received: by mail-wr1-f69.google.com with SMTP id n6so7363140wrv.6
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WCNM8bx54yBBH5o9OGeaVnQ5KO/kQFXlsHgIbovX6w0=;
 b=BWE02yhHgrQhR7bzeRRqA70z1S8N7OReOJzN4LgSYhCQZOVccY2NYshQDsb4FgWTfo
 beRVMltNFkAHZLLT8ZKqbHm1Z/yIvLZcSdMwOIdLzypKu9vFX0ixohGaX3AXi56yVVO1
 y0apvysD15ULOJRRCiUbOD8hGv+rJo+cezD/y3E4GH7i53uoQzdHJGG75n3qhjcjQrS+
 5EnVyW1eGacPJXrh1oR5jhDmgIFTuIxSz9tMqnh/DyXVuLdozwwD0zsvu4nrkVxgvhff
 LuN5T7qMXsDxhLoO549y1/myUMV8In+KY24dJ7ZVw7l1EE4oq+wnejjCQwmLgMYMP54l
 D0Pg==
X-Gm-Message-State: AOAM532oaiCFQ40fbwgR84GD8f3e7Jw1IbLQQRhBVmJeFDyf44Zrr6z4
 4Y+8JJbNhrRPWJpvfYDDfnk664kqlZn0REs0e6yd5soFJkl+eddVbSg8wszTwudfJqmGq8dxbNm
 g5L9JN8ujLQW+s/E=
X-Received: by 2002:adf:e592:: with SMTP id l18mr25927547wrm.175.1591632150057; 
 Mon, 08 Jun 2020 09:02:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHbdh31UUEH4xek22DEL2omJfknmcGPt3J3CvVWH4WiiSsovdS3jiUsnUw+9yn+Qkjdrssug==
X-Received: by 2002:adf:e592:: with SMTP id l18mr25927507wrm.175.1591632149848; 
 Mon, 08 Jun 2020 09:02:29 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id c6sm144638wro.92.2020.06.08.09.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:29 -0700 (PDT)
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
Subject: [RFC PATCH 18/35] hw/input/ps2: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:27 +0200
Message-Id: <20200608160044.15531-19-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:02:44 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/input/ps2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index f8746d2f52..0d84061cae 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -30,7 +30,7 @@
 #include "ui/input.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
-
+#include "hw/qdev-deprecated.h"
 #include "trace.h"
 
 /* debug PC keyboard */
@@ -1136,6 +1136,8 @@ void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
 {
     PS2KbdState *s = (PS2KbdState *)g_malloc0(sizeof(PS2KbdState));
 
+    qdev_warn_deprecated_function_used();
+
     trace_ps2_kbd_init(s);
     s->common.update_irq = update_irq;
     s->common.update_arg = update_arg;
@@ -1158,6 +1160,8 @@ void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
 {
     PS2MouseState *s = (PS2MouseState *)g_malloc0(sizeof(PS2MouseState));
 
+    qdev_warn_deprecated_function_used();
+
     trace_ps2_mouse_init(s);
     s->common.update_irq = update_irq;
     s->common.update_arg = update_arg;
-- 
2.21.3


