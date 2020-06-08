Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKEv-0007D2-6t
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEl-0007AF-2R
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:59 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31705
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEk-0007xc-30
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3z7/2H5A05Y0veUntj0sB8fSeRKRdeeSYeKdBwF4Hw=;
 b=fpmhIKFvXLBpniJCwiDDDhPv207fXRcRPf8Fyzb5skveGIlLOsn5quV6q8sdbFQl24gin0
 pn8EXow3zBSue5C8vbvUVw2Mp3zYD3fBOtJEipjW+o09za2eUlMYrD7hIhzVutB/3tAQPA
 bz1mHO1dTKHznxeOYtNDRhN1EJmjMr0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-tXa0ARPBNB6Vy53BfapBwA-1; Mon, 08 Jun 2020 12:02:55 -0400
X-MC-Unique: tXa0ARPBNB6Vy53BfapBwA-1
Received: by mail-wr1-f70.google.com with SMTP id o1so7300050wrm.17
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L3z7/2H5A05Y0veUntj0sB8fSeRKRdeeSYeKdBwF4Hw=;
 b=NU1P5e5ss/LDb0LNvTQauj7pg416PcG/rs+LWhknxSdyziz3sLIqUYrf5VrcnbojsU
 UkQM/V4ajXBrJna6B7aTUqN7vy5uaugEykBI1OCtvTmFoNuv3wvdR01G2QuRRx6jGTEg
 uIVLyWDrNyGbIWWVfgdvbQLUIc6+/e1OKL0psYENo9s4FYIAti527qv1jTRAkN3j/9+l
 lK8hBq5iiWCIuwUNbQ6l48TnCN8ao1izgVBOHcL1gBMqCNNFT8G21x6REyKwS/y+Jyu0
 r/qO9DYDVaEyOIn1GnQB3ZkfCsu/nlaBHYU+GZLI84Itq4NuliwjDQX/rPlpZZtIFB36
 LVfQ==
X-Gm-Message-State: AOAM530ayXi5FuKM8QRohw6/QV3mFf8Tkylk2TjeRSnLrB8qQ0nTniOx
 8x5YJKEmc8PlFxVplVbVrVMdrZ2c9/7K+d1nJOsbwUXP2BPxTxLWtpHLf8LStw5dPfaJSq40MYI
 yoPnhwwiyN0R89p4=
X-Received: by 2002:a5d:4841:: with SMTP id n1mr25485565wrs.64.1591632174021; 
 Mon, 08 Jun 2020 09:02:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxA5a/fZ3ZxfFd0NOMzf3yCM2KT4oTBQZPfei9kF9bupOnm+jcw1E0PX8MzjNlME16qgafXA==
X-Received: by 2002:a5d:4841:: with SMTP id n1mr25485541wrs.64.1591632173820; 
 Mon, 08 Jun 2020 09:02:53 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id q8sm49134wmq.1.2020.06.08.09.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:53 -0700 (PDT)
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
Subject: [RFC PATCH 22/35] hw/m68k/mcf520x: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:31 +0200
Message-Id: <20200608160044.15531-23-philmd@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 16:03:03 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/m68k/mcf5206.c | 5 +++++
 hw/m68k/mcf5208.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index a2fef04f8e..ec0d176674 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -16,6 +16,7 @@
 #include "qemu/timer.h"
 #include "hw/ptimer.h"
 #include "sysemu/sysemu.h"
+#include "hw/qdev-deprecated.h"
 
 /* General purpose timer module.  */
 typedef struct {
@@ -144,6 +145,8 @@ static m5206_timer_state *m5206_timer_init(qemu_irq irq)
 {
     m5206_timer_state *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_new0(m5206_timer_state, 1);
     s->timer = ptimer_init(m5206_timer_trigger, s, PTIMER_POLICY_DEFAULT);
     s->irq = irq;
@@ -566,6 +569,8 @@ qemu_irq *mcf5206_init(MemoryRegion *sysmem, uint32_t base, M68kCPU *cpu)
     m5206_mbar_state *s;
     qemu_irq *pic;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_new0(m5206_mbar_state, 1);
 
     memory_region_init_io(&s->iomem, NULL, &m5206_mbar_ops, s,
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 2ab9701ad6..72627f6833 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -26,6 +26,7 @@
 #include "hw/sysbus.h"
 #include "elf.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 #define SYS_FREQ 166666666
 
@@ -191,6 +192,8 @@ static void mcf5208_sys_init(MemoryRegion *address_space, qemu_irq *pic)
     m5208_timer_state *s;
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     /* SDRAMC.  */
     memory_region_init_io(iomem, NULL, &m5208_sys_ops, NULL, "m5208-sys", 0x00004000);
     memory_region_add_subregion(address_space, 0xfc0a8000, iomem);
-- 
2.21.3


