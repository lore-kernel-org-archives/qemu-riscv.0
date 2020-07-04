Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkGz-00023M-Q9
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGy-0001yg-5P
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40806
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGv-0007j8-DG
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faJPKsgnKj1MSj1B3bxzpLa01+W3HhU/7Hynie77jqI=;
 b=QTvGTbU0FsA594nbpizQXCxVMsQeofTLwepRpExoxQp+2hOdJNxMbsl5+Pbnzo1hhKbvei
 Yu1EAO+1isTSs0V/IjI9WJ2Pedg/K0nuNny9adg1fWWrvxSkw20QAUYKzAiMtFttXk8RFB
 DtCUNIiOIGkqAayZJyKsSoZLx363CoQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-oDfVccgrMkSx4ViDRt_s1A-1; Sat, 04 Jul 2020 11:40:07 -0400
X-MC-Unique: oDfVccgrMkSx4ViDRt_s1A-1
Received: by mail-wr1-f69.google.com with SMTP id y16so35857497wrr.20
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=faJPKsgnKj1MSj1B3bxzpLa01+W3HhU/7Hynie77jqI=;
 b=hc3wLJh3Np0SkvDZ3SGgh1onQypGcFhKb5IaFGn2vt+vrdjEktN4r6KVhnnBmQR8V1
 ms7F7EbkdjKiW+pvzMLtEVKLCHyA/cUPvJ3tZco3lpPPRXN2wDMFWVUGo7A0HCNP+QoF
 /6eicw3F0VKxbDmWU/UBiUfiprqxEwCfyS7YR7U2FKkwh+cd+Jivwa8/i7EDSmfmxZSU
 T0W+GOgErF2Qsm1uQBFHWaJgG57b2rbmubxfs4O6bp50vu/xlkMusljr4WrfqMeS0s12
 LHstGOt7bFuzEae3hNcJ/hjoFGkji3b2wt7mII0yrZ6L0rQnOgPVGC7iVC3K1yEUR/mR
 h1+g==
X-Gm-Message-State: AOAM5324VWOGKTaJWashIfkdzs13bIY2MGkqN7/kUdD6MI6gbzVDSwV7
 Hf6H0Fxs5BGGByL+tG+SYzSf1GBwSCIfRlq8tdZp6MokkTEQDvmT59nMqqI2xTT7OSmFPxulvSo
 mY/SQjN5fZdj4esw=
X-Received: by 2002:adf:e44c:: with SMTP id t12mr13768459wrm.103.1593877205940; 
 Sat, 04 Jul 2020 08:40:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy098jPxb/frQeho469Gp43aPTWxVhQy55qlR1MGFXuliyYTgtCF30tAWMv6lLp78b+1yIBsQ==
X-Received: by 2002:adf:e44c:: with SMTP id t12mr13768451wrm.103.1593877205790; 
 Sat, 04 Jul 2020 08:40:05 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id f186sm16650455wmf.29.2020.07.04.08.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:05 -0700 (PDT)
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
Subject: [RFC PATCH v2 10/23] hw/display/vga-isa-mm: Emit warning when old
 code is used
Date: Sat,  4 Jul 2020 17:38:55 +0200
Message-Id: <20200704153908.12118-11-philmd@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:15
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
X-List-Received-Date: Sat, 04 Jul 2020 15:40:12 -0000

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


