Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKDN-0006CV-Tp
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDH-00069h-LV
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23539
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDF-0007dW-LT
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NJCGR9/510Qhv58TRWbd4o5i6q1ayDSJg7ikac3wKxM=;
 b=UauDAhDGFRgKdqzcEuS6rAFZY9lrbCSzRjw4PexB+cP9ih7n8GAbaUadFdsMJq3+8Z6w3b
 fnNQxTdpoDdgMXZMq99R7pjhMJsLOOOeMGP6ydRJvYeox26UuoGC/TY5o8uuqEuEQtRCHE
 zBctfuOHHrY+x0XJF5bv5zXhK5XSqps=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-6fzq_fI3NbqqJcI8Wml21g-1; Mon, 08 Jun 2020 12:01:23 -0400
X-MC-Unique: 6fzq_fI3NbqqJcI8Wml21g-1
Received: by mail-wr1-f69.google.com with SMTP id r5so7361293wrt.9
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NJCGR9/510Qhv58TRWbd4o5i6q1ayDSJg7ikac3wKxM=;
 b=qlvXy/FjC1uYcfBMpqrRJPlXfYCT/tJZiCE6dinTksCZBTSC0DQzZoUPUzXh2FcHCu
 HxOhBQmwQUspD1EGygUq/W8qqlKApiCd+7Oajm4dYqolCUXXKySXhgDErGiBZY9nBK2e
 lbrfjMsXHcYOVKkkg7WEiMY1VF4ogC6EwRLOY9MdQU//z/+LBM+RxelMJgP+X+YqWI2q
 F+nAxnGqEJxgH0EDYj1IDrXK59W/PPmGxhIBrvXJgsMnk4IrXzBGjgudG8gtM9V8JROe
 T1xLsTvzhHgfKyJ2EhhlOBOApsm8Ez2j6wc1WqMfyL+alfcEzNbMtq76w54CXONnMmJT
 qgOQ==
X-Gm-Message-State: AOAM532sPsuywGyEbTA/VEps2MxYSdLwTSI7lJkruxyE9ML4TWzWPV63
 ZdBu4d1Xg8pttwbo07Iztc6AWvenqfY8Co/GIXyqokocu6NoloQg1Cq0V3Rl3A7TGdUNMkSSzxC
 UCqQeEfweDKtypbM=
X-Received: by 2002:a1c:6884:: with SMTP id d126mr21802wmc.121.1591632081532; 
 Mon, 08 Jun 2020 09:01:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOzP/TSo/GdCDA4q3fBC5fMN7fhQwZz7nfPzYVtVlA4zhoIpThGRIoQT2iemjQz07LOwJssw==
X-Received: by 2002:a1c:6884:: with SMTP id d126mr21765wmc.121.1591632081336; 
 Mon, 08 Jun 2020 09:01:21 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id g25sm25750wmh.18.2020.06.08.09.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:20 -0700 (PDT)
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
Subject: [RFC PATCH 06/35] hw/timer/arm_timer: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:15 +0200
Message-Id: <20200608160044.15531-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 01:05:50
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
X-List-Received-Date: Mon, 08 Jun 2020 16:01:29 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/timer/arm_timer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 9607366d78..e23e6b4b31 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -16,6 +16,7 @@
 #include "hw/qdev-properties.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
+#include "hw/qdev-deprecated.h"
 
 /* Common timer implementation.  */
 
@@ -175,6 +176,8 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
 {
     arm_timer_state *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = (arm_timer_state *)g_malloc0(sizeof(arm_timer_state));
     s->freq = freq;
     s->control = TIMER_CTRL_IE;
-- 
2.21.3


