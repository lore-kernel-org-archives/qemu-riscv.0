Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkHt-0003LD-Oa
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHr-0003H4-Vu
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:41:08 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43079
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHp-0008NU-DR
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MU7ruh/10BWYTVNZhg+Fh18ywKF1bn8cc3b/vsMMid8=;
 b=MlD+IiGFwJd5pYZTH424mgv2PfEOcDa5WCvoZI4hrk57QGLbNLDDffFzF9aJf6Mb4cxe66
 Ee5+58CEwu1yWh75ek9Hu3XvlfViAQiC015r6BHHSfN1n3WEmNT8EJpEr9ZHRuzYO0oEQ7
 rY+WpeByaY4UiR21MFIWR6oBHXvok34=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-g0uYTaEKOE2-yJGhenUM7Q-1; Sat, 04 Jul 2020 11:41:03 -0400
X-MC-Unique: g0uYTaEKOE2-yJGhenUM7Q-1
Received: by mail-wm1-f70.google.com with SMTP id q20so29888555wme.3
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MU7ruh/10BWYTVNZhg+Fh18ywKF1bn8cc3b/vsMMid8=;
 b=WbRAxI4NSrdNYlkauDfuvjoIUVt8jSeLl7pIUQs86HJRtmT4mSZjvLmVCihrznoUzT
 F87d1JrCJfGWZ1amMLz6utDzc7ox7C3eW5/hVDIPvkMUA5qBlzy1TKNSj1B2rPaymL6G
 u5UZd++kasYUH2EoWIfWaLMk7MJZ0D8O1WO+c47GLU66Fvg9/PFAIa23e/jCdWgDQ0aG
 VGQZegiLWZZYFgxe58EeqwzyZFzf0JF/aTBRwpyHg0IocWr3lvfzaxCK2N/GZcdHMI8L
 /eloX/3J8D6Mx+89H+iy/MFwimWRlGf+MgEWCQQ6BsXDTd/4AAIYjRCNetx3UT6NUgHo
 xrNQ==
X-Gm-Message-State: AOAM530G82x60bkZbv/q3B1lX087VEzjFLhfxjXlMhHuEr3aLeiPbKKD
 KO15W38q83lseif9mMxq3k301Pnac/mhZeoXbE6NK4tS1bQIRqO2JaZ+h9xoJoRhRKmTWAxg6bN
 nAOpSDy0zlKtcHVI=
X-Received: by 2002:a5d:698e:: with SMTP id g14mr44409189wru.301.1593877260078; 
 Sat, 04 Jul 2020 08:41:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxftjPNjUMdxjrRBqmZD6edir9YtaTKoU0Eg13XzXVSYHSv0Pt0WI+/zvIE89o3YNtuucpRKw==
X-Received: by 2002:a5d:698e:: with SMTP id g14mr44409166wru.301.1593877259854; 
 Sat, 04 Jul 2020 08:40:59 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id b62sm16727187wmh.38.2020.07.04.08.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:59 -0700 (PDT)
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
Subject: [RFC PATCH v2 20/23] hw/sh4: Emit warning when old code is used
Date: Sat,  4 Jul 2020 17:39:05 +0200
Message-Id: <20200704153908.12118-21-philmd@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:20
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
X-List-Received-Date: Sat, 04 Jul 2020 15:41:08 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/char/sh_serial.c | 3 +++
 hw/intc/sh_intc.c   | 3 +++
 hw/sh4/r2d.c        | 3 +++
 hw/sh4/sh7750.c     | 4 ++++
 hw/timer/sh_timer.c | 5 +++++
 5 files changed, 18 insertions(+)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 167f4d8cb9..9366a23dd2 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -31,6 +31,7 @@
 #include "chardev/char-fe.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG_SERIAL
 
@@ -382,6 +383,8 @@ void sh_serial_init(MemoryRegion *sysmem,
 {
     sh_serial_state *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(sh_serial_state));
 
     s->feat = feat;
diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 72a55e32dd..c90fbf47bb 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -13,6 +13,7 @@
 #include "hw/sh4/sh_intc.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG_INTC
 //#define DEBUG_INTC_SOURCES
@@ -444,6 +445,8 @@ int sh_intc_init(MemoryRegion *sysmem,
 {
     unsigned int i, j;
 
+    qdev_warn_deprecated_function_used();
+
     desc->pending = 0;
     desc->nr_sources = nr_sources;
     desc->mask_regs = mask_regs;
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 443820901d..5b4d383a86 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -43,6 +43,7 @@
 #include "hw/usb.h"
 #include "hw/block/flash.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 #define FLASH_BASE 0x00000000
 #define FLASH_SIZE (16 * MiB)
@@ -187,6 +188,8 @@ static qemu_irq *r2d_fpga_init(MemoryRegion *sysmem,
 {
     r2d_fpga_t *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(r2d_fpga_t));
 
     s->irl = irl;
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index f8ac3ec6e3..82549139f9 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -33,6 +33,7 @@
 #include "hw/timer/tmu012.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "hw/qdev-deprecated.h"
 
 #define NB_DEVICES 4
 
@@ -757,6 +758,8 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 {
     SH7750State *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(SH7750State));
     s->cpu = cpu;
     s->periph_freq = 60000000;	/* 60MHz */
@@ -867,6 +870,7 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 
 qemu_irq sh7750_irl(SH7750State *s)
 {
+    qdev_warn_deprecated_function_used();
     sh_intc_toggle_source(sh_intc_source(&s->intc, IRL), 1, 0); /* enable */
     return qemu_allocate_irq(sh_intc_set_irl, sh_intc_source(&s->intc, IRL), 0);
 }
diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index bb0e1c8ee5..d0740b2ae6 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -15,6 +15,7 @@
 #include "hw/sh4/sh.h"
 #include "hw/timer/tmu012.h"
 #include "hw/ptimer.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG_TIMER
 
@@ -200,6 +201,8 @@ static void *sh_timer_init(uint32_t freq, int feat, qemu_irq irq)
 {
     sh_timer_state *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = (sh_timer_state *)g_malloc0(sizeof(sh_timer_state));
     s->freq = freq;
     s->feat = feat;
@@ -320,6 +323,8 @@ void tmu012_init(MemoryRegion *sysmem, hwaddr base,
     tmu012_state *s;
     int timer_feat = (feat & TMU012_FEAT_EXTCLK) ? TIMER_FEAT_EXTCLK : 0;
 
+    qdev_warn_deprecated_function_used();
+
     s = (tmu012_state *)g_malloc0(sizeof(tmu012_state));
     s->feat = feat;
     s->timer[0] = sh_timer_init(freq, timer_feat, ch0_irq);
-- 
2.21.3


