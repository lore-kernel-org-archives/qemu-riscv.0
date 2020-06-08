Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKFm-0007zC-5u
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFk-0007w5-6O
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:04:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32457
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFj-0008GD-BH
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:03:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfeQjgHHg6Ez9waCGJmOrJzAr/zUBGXbuFUiyuF/Rfo=;
 b=hfrBoHJqMyON57NcVUx6le369GteQZ3DTmOPG0SMoJric94KLFLphP5Rn580/MHd4fJF9m
 C1OOKCxafyaITFdmX+SuytuxLcVww88Cf3UuAVRnMy7uffE90GyE5W6zVaKpL+jkffLVxG
 KCKbFvr5TOSLkDeJ/0nDzNUXHKOItQ4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-ccENYbwANeeDTk4asVYeRg-1; Mon, 08 Jun 2020 12:03:57 -0400
X-MC-Unique: ccENYbwANeeDTk4asVYeRg-1
Received: by mail-wm1-f70.google.com with SMTP id s15so6575wmc.8
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qfeQjgHHg6Ez9waCGJmOrJzAr/zUBGXbuFUiyuF/Rfo=;
 b=CQxPiYMTSfC6Efwb+Qr1mhqirGx+obXGUz19HHo1mIcnA6MhlMWgKf3MLtJHMtCalw
 Z4bayFEZiyL1h3FO+01aH+EotuFTLPRin/K6vugvI7BIoI7pbGKd7FHZkEPDrQk9g59D
 um/WB4qXh4YC1lvxVzv/UTpGiBMPf6U76y5dD+rsLmcJsV7G6x1/0PYscDW/xP/NtBfS
 QCTK7lH0lwTnufFJ5ZALQsOducWv+Eg2lrnYAEhB464mWfj9NXMxz+iVzlIO9VdlD1Rm
 RLj9PPGCMn7K0yjelNVNL4588E0BWR185W4XwvjT+1VDQI6rDZBPvMwSyUwJ2kDquH0W
 qKxA==
X-Gm-Message-State: AOAM533qFC1ihGFkka2ubgsSRw5M9YBLY2SWwsQNLWSJ6SI6FQCTRlpR
 a4VzjlDmosSy0TDjNyrQ4W88U30B446M6j/zbk4V4R9NHWig4QZRu7yF8NPapmafyoJsMe+tUSo
 UbK/HefaM2fkWvgM=
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr54296wmj.3.1591632232861;
 Mon, 08 Jun 2020 09:03:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLcq9fw++IqBSfctMa2VnenePzSclzDPUX9srn5OE/PiQtrx427TCsmbU35rGSbrlanE52/A==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr54282wmj.3.1591632232663;
 Mon, 08 Jun 2020 09:03:52 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id q4sm4466wma.47.2020.06.08.09.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:52 -0700 (PDT)
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
Subject: [RFC PATCH 32/35] hw/riscv: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:41 +0200
Message-Id: <20200608160044.15531-33-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 08 Jun 2020 16:04:00 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/riscv/riscv_htif.c  | 4 ++++
 hw/riscv/sifive_uart.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/hw/riscv/riscv_htif.c b/hw/riscv/riscv_htif.c
index ca87a5cf9f..bd080dbefb 100644
--- a/hw/riscv/riscv_htif.c
+++ b/hw/riscv/riscv_htif.c
@@ -30,6 +30,7 @@
 #include "hw/riscv/riscv_htif.h"
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
+#include "hw/qdev-deprecated.h"
 
 #define RISCV_DEBUG_HTIF 0
 #define HTIF_DEBUG(fmt, ...)                                                   \
@@ -238,6 +239,9 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
     uint64_t fromhost_offset = fromhost_addr - base;
 
     HTIFState *s = g_malloc0(sizeof(HTIFState));
+
+    qdev_warn_deprecated_function_used();
+
     s->address_space = address_space;
     s->main_mem = main_mem;
     s->main_mem_ram_ptr = memory_region_get_ram_ptr(main_mem);
diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
index 9350482662..1a5890d5f7 100644
--- a/hw/riscv/sifive_uart.c
+++ b/hw/riscv/sifive_uart.c
@@ -25,6 +25,7 @@
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/riscv/sifive_uart.h"
+#include "hw/qdev-deprecated.h"
 
 /*
  * Not yet implemented:
@@ -183,6 +184,9 @@ SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
     Chardev *chr, qemu_irq irq)
 {
     SiFiveUARTState *s = g_malloc0(sizeof(SiFiveUARTState));
+
+    qdev_warn_deprecated_function_used();
+
     s->irq = irq;
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
     qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
-- 
2.21.3


