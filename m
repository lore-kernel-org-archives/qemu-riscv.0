Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkHx-0003VY-LE
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHv-0003Qp-Ky
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:41:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30102
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHt-0008OB-Vm
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtUEaayxY7dmCSI9Atr+yr9J3sNs3cVN+JMD3iSh+ak=;
 b=Cz3QznPH+UCqtY8etVwDAmgLQz1v668jVw4Fs7BEaTXP5PA3W7+pgMAysVefzl9HGYz9oK
 HzrI47kLHPmaa7ErLJ2DYUsHPNXl3J+PwjxuWT8AIuQTSotDbTVhoIs0vdIQ+DPeEpxO1k
 UM4dNj1fJmitbJe4Wu+ayxzL3MZ2nps=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-hgh4xmYtPHuxHVYzkjDjiw-1; Sat, 04 Jul 2020 11:41:07 -0400
X-MC-Unique: hgh4xmYtPHuxHVYzkjDjiw-1
Received: by mail-wr1-f70.google.com with SMTP id c6so16829111wru.7
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EtUEaayxY7dmCSI9Atr+yr9J3sNs3cVN+JMD3iSh+ak=;
 b=c/RpE/Kw8HX4blodJVQh9vK59oEqEftb1e2R0NLBJ2IEu2MSn/61U8oP8bV0P7l/tA
 nzn1oC2F1gWrQ9EsJ8bW5StFivIqnzf+6gpgfgXKs9UYMReXrT7JbL3GsylrCAVxdp/n
 OWo1TuwCNGgUl7hEZjKRq6hOWuJM4zBo83KkZu8oXoNFhb4TtCviVL9UTN5fMdZYfY9R
 Hcmff1+sI6e4XuOnaZzTh/cUxKjrorAAchEREczB/ul379VQ40qXELYGt0oeuWWH9LTZ
 BsHF3D9gJLI/8YyyOIALy6NmLx9lUjoUc+XtLH9gNEB5LL/ZAVAicTxmuOjJMCCEhmvG
 V+HQ==
X-Gm-Message-State: AOAM533hYfYVdlAvxC3LmLbjmq8BRChQKHN5rej8LPCQQ2k2NCRr6Eah
 pA+6LWo/c2NDAJ5fKdp4b08GVruC12iF95/gnxLQ28RqpFdBRnfQJdTD4e9I++M9WR4JV/QY3xI
 9OVgfZsQx6Xx64vY=
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr41373481wml.170.1593877265244; 
 Sat, 04 Jul 2020 08:41:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBQ+oFQ07HIPe/VONHqPVER0qLoAra3sFJaOR728rzbo9eCzhVkGvzuwBIXrIuo+Dcy5zd6g==
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr41373449wml.170.1593877265082; 
 Sat, 04 Jul 2020 08:41:05 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id v6sm4904514wrr.85.2020.07.04.08.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:41:04 -0700 (PDT)
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
Subject: [RFC PATCH v2 21/23] hw/riscv: Emit warning when old code is used
Date: Sat,  4 Jul 2020 17:39:06 +0200
Message-Id: <20200704153908.12118-22-philmd@redhat.com>
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
X-List-Received-Date: Sat, 04 Jul 2020 15:41:12 -0000

This code hasn't been QOM'ified yet. Warn the user.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
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


