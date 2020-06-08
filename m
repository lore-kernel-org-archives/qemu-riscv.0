Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKEk-000799-6v
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEa-000760-Df
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32648
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEZ-0007ux-PM
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Lcxf8cj+CxLJSf8aQEjLTWyUhOWt7SwLOi9PO4gCM4=;
 b=bTuRUsghHF8edA4IKhtHO6aCcHr9aVh/FSflEbuzraXxufNAWXT2kFk0Lx0SO3fRtZejOU
 LAh6lF3YTn4PdzKiNuSrjuQoapJ5vrapRkjWCCysEMRSRyABVRUKUFZyJwaUDtN6vjQXLn
 fCTAEyhji/CF9DBLdszWjJtzuKcYxRw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-E6v-Ix-_NDau4aZHacqUrw-1; Mon, 08 Jun 2020 12:02:45 -0400
X-MC-Unique: E6v-Ix-_NDau4aZHacqUrw-1
Received: by mail-wr1-f70.google.com with SMTP id t5so7327318wro.20
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Lcxf8cj+CxLJSf8aQEjLTWyUhOWt7SwLOi9PO4gCM4=;
 b=DPKgXInzee2m80J6G0rZLAY4G0V6twHjtMpmeXfCqp2URArkowHRG0ZSzlnzFPYFga
 pxhE1ncQO2nRwGeySS81BmGHsTtPMXMJU1ixI3TYhzVXhNJYTyNnLaETAXH35otC/Mzq
 PXC43E/PYevp13wZjOpDYJ22KdbwsiTjwiOEZwjmZUN56hc5DZC7gDHl6cmh1mB+N5m5
 Bd0qfYE2J1tWSI5GdGPnh1oHNT+2KqIiufOl7cQfNxFkefgDkW751XtXG+MlEoZMwIoG
 smxaP+EJi3+Tta48fl03KL1xqN4Qc1v9A8kn1waKIsNq0ApcrX9oACHtlw8n1qVdEjw4
 hxtA==
X-Gm-Message-State: AOAM533bmDZIgr3HwvK6yy2nUlkhwMfbh8P/IhY/bJAV9znHrCuPt22F
 g8R4Ocj0TdILyeScvGUPdnPioi1Dkr2pZV1EfEGQysQskYLaF1ponaA7eQvq+dCwOk2QV66+z9a
 7Pan0j8tGK5Bdjw8=
X-Received: by 2002:a1c:6056:: with SMTP id u83mr60196wmb.138.1591632161717;
 Mon, 08 Jun 2020 09:02:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztIcOuKmMAnKpEQL/s7NO4XNCQYfWj4X6mQCPh85ejUPn/olQa6U5W1zctaCPlsras+JjNJA==
X-Received: by 2002:a1c:6056:: with SMTP id u83mr60154wmb.138.1591632161497;
 Mon, 08 Jun 2020 09:02:41 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id a81sm19165wmd.25.2020.06.08.09.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:40 -0700 (PDT)
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
Subject: [RFC PATCH 20/35] hw/intc/i8259: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:29 +0200
Message-Id: <20200608160044.15531-21-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:02:56 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/intc/i8259.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 51b27f6a34..9d9609cdab 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -30,6 +30,7 @@
 #include "qemu/log.h"
 #include "hw/isa/i8259_internal.h"
 #include "trace.h"
+#include "hw/qdev-deprecated.h"
 
 /* debug PIC */
 //#define DEBUG_PIC
@@ -414,6 +415,8 @@ qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq)
     ISADevice *isadev;
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     irq_set = g_new0(qemu_irq, ISA_NUM_IRQS);
 
     isadev = i8259_init_chip(TYPE_I8259, bus, true);
-- 
2.21.3


