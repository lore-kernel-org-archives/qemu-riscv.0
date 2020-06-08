Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKDn-0006Wb-U3
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDi-0006Ua-SO
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:55 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23698
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDi-0007lv-0J
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faJPKsgnKj1MSj1B3bxzpLa01+W3HhU/7Hynie77jqI=;
 b=BraiGcuqhBJTZvyP01ln1EDdlVP4iukGUaYNjEkAsplcCPa80S7uzGD/uk5W4Y+HDg639U
 ZHZfrehcBp/PmoTk89r1r5croXhB3vwZQYcOIbU4nVzeZGS60ANwsenlpIbOX8c39ugU5O
 +L87u46bczE/68zOp6VuzPPxXsnrL3s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-f2x8h5NuNZObxLB6y9Cw_A-1; Mon, 08 Jun 2020 12:01:50 -0400
X-MC-Unique: f2x8h5NuNZObxLB6y9Cw_A-1
Received: by mail-wr1-f72.google.com with SMTP id m14so7337743wrj.12
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=faJPKsgnKj1MSj1B3bxzpLa01+W3HhU/7Hynie77jqI=;
 b=tNgfRKaKSMHxssq7krihUd6562qr+KITkENwF7z0+dtXU+6xcsJZ2188YvnBcWqotq
 HE0Zl9MNfBKIbiqNXi4I4IF3ANrcfKr5z3aQ2P5yWCvY/5gjdxJzDVm1XHyAlw/mqyTt
 DMaDBqvzV9YZB/892beJKDJKPPU4qk1SNtnm+DRN52+pAOK4B3iG8h+FqkxTZgmR5vg6
 l4UnMxPm1+JsC0mOsp3hG6b6UmerlD/+nNrSlnBIIi6A84/ouXKDpbJ4zmtaAfkbKraH
 vZlh0yxEjZL9pSKmnIHRCBUDSGWdjK30VYWQfgYMN6NCOBaI0tdWaS+vidam90ZQ3N9R
 Nu1A==
X-Gm-Message-State: AOAM531mfAdCU2ZOJm+TrZK4Y69aZylzhfU4LD3dCJo1W570ndn14Gvl
 Oe8jT2ToWjUq1hpXNnyQAOyRZCVpiazfKOpOUucKA/HEeKJwUKH3xPYohCQyCmpKcMlTmI9O1eG
 D8dI5S07MPsPCpQ4=
X-Received: by 2002:adf:9304:: with SMTP id 4mr25264205wro.280.1591632109663; 
 Mon, 08 Jun 2020 09:01:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9mBFO0YH5teWKyWXjB3IP6YUG1XRf7/NfjmoGjY1J2DcXSECmfNz6g9nRc2AB3mdjKgV/Zg==
X-Received: by 2002:adf:9304:: with SMTP id 4mr25264164wro.280.1591632109513; 
 Mon, 08 Jun 2020 09:01:49 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id l1sm220993wrb.31.2020.06.08.09.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:48 -0700 (PDT)
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
Subject: [RFC PATCH 11/35] hw/display/vga-isa-mm: Emit warning when old code
 is used
Date: Mon,  8 Jun 2020 18:00:20 +0200
Message-Id: <20200608160044.15531-12-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:01:56 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/vga-isa-mm.c | 5 +++++
 hw/display/vga.c        | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-isa-mm.c
index 7321b7a06d..3e62389b63 100644
--- a/hw/display/vga-isa-mm.c
+++ b/hw/display/vga-isa-mm.c
@@ -29,6 +29,7 @@
 #include "hw/display/vga.h"
 #include "vga_int.h"
 #include "ui/pixel_ops.h"
+#include "hw/qdev-deprecated.h"
 
 #define VGA_RAM_SIZE (8 * MiB)
 
@@ -71,6 +72,8 @@ static void vga_mm_init(ISAVGAMMState *s, hwaddr vram_base,
 {
     MemoryRegion *s_ioport_ctrl, *vga_io_memory;
 
+    qdev_warn_deprecated_function_used();
+
     s->it_shift = it_shift;
     s_ioport_ctrl = g_malloc(sizeof(*s_ioport_ctrl));
     memory_region_init_io(s_ioport_ctrl, NULL, &vga_mm_ctrl_ops, s,
@@ -99,6 +102,8 @@ int isa_vga_mm_init(hwaddr vram_base,
 
     s = g_malloc0(sizeof(*s));
 
+    qdev_warn_deprecated_function_used();
+
     s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
     s->vga.global_vmstate = true;
     vga_common_init(&s->vga, NULL);
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 061fd9ab8f..d59a9c896b 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -35,6 +35,7 @@
 #include "hw/xen/xen.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG_VGA_MEM
 //#define DEBUG_VGA_REG
@@ -2262,6 +2263,8 @@ MemoryRegion *vga_init_io(VGACommonState *s, Object *obj,
 {
     MemoryRegion *vga_mem;
 
+    qdev_warn_deprecated_function_used();
+
     *vga_ports = vga_portio_list;
     *vbe_ports = vbe_portio_list;
 
-- 
2.21.3


