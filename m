Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKE8-0006je-Dr
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKE7-0006ht-26
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:19 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39193
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKE5-0007qO-UQ
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOyQYXnEE/P1L9M062K4OG7LDuRa+UfsKXeI8IczatQ=;
 b=Ej19fgNay42mFAX4IrBp9/J/ULaNfeSgJuU8D9STnZUt8pxaNmdTah60UR07JKN8WGgTHO
 YWKLvTstUBpnO5XNmXMGzbfyT+oVOWsPxoqEtTMZdNBtLkA4xEdHKtIOoVGq//xXG0XX3x
 UCPuxt09AmFaHYUcabpVIMu9DbGXh70=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-f9ow9wpiObqThdVIwgEz0Q-1; Mon, 08 Jun 2020 12:02:13 -0400
X-MC-Unique: f9ow9wpiObqThdVIwgEz0Q-1
Received: by mail-wm1-f71.google.com with SMTP id x6so3952wmj.9
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jOyQYXnEE/P1L9M062K4OG7LDuRa+UfsKXeI8IczatQ=;
 b=AQY4ovtk6PZJBdYCM/8hWg9sGCG0k/Jh1GQWTVWtcAZte2ML5b6gQTChJt1CNs0W/p
 QliUJqLCfXzNVxjFUh5CBWm5K7VVD8YXhBfXLpe/fqhHPf8YEAPTN9PCj2ZPscr7wrke
 fer0DFeZ5lMbiGtf4WCQkNhRnWDUTtEWKKv1NGT3q9iqnfDMr9DN7/0pYSl559L98+SJ
 KrrPyA6TyIsi4NCi0wkN8ToZAntJCejmKWist4uf5/wF6cleAqL/uR7YZj5hxa5rG3IG
 utwUxnxJ+5AOwfaDzaeiK7qEWlrf0aub97vu/CstALhzH4w5kVuRRFW9DVV0vS0NVol3
 NeAA==
X-Gm-Message-State: AOAM531TAP222Vd8qwwD8awitOLDjqV/fbPKSXQiyE1dwDDqIotSmoxm
 MM9L1AUQ8ZoQceGIsfSxNiAPqRLIWWsRaPctgO0mzFAbJpgxIB+Di38QYaJACBe1oqIk4zoa4Go
 M1yC0zwSdXGcNxLc=
X-Received: by 2002:a05:600c:2256:: with SMTP id
 a22mr82462wmm.18.1591632132280; 
 Mon, 08 Jun 2020 09:02:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvLE6gRX7XM83bmbZu8lLW6Zr2jKGWG6aII1A2AXMFr5e4D5cYkpsPFEEPHv3ro5n12uF+eA==
X-Received: by 2002:a05:600c:2256:: with SMTP id
 a22mr82438wmm.18.1591632132052; 
 Mon, 08 Jun 2020 09:02:12 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id z25sm31297wmf.10.2020.06.08.09.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:11 -0700 (PDT)
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
Subject: [RFC PATCH 15/35] hw/i386/xen/xen-hvm: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:24 +0200
Message-Id: <20200608160044.15531-16-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:02:19 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/xen/xen-hvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 82ece6b9e7..a1163b1529 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -31,7 +31,7 @@
 #include "sysemu/xen-mapcache.h"
 #include "trace.h"
 #include "exec/address-spaces.h"
-
+#include "hw/qdev-deprecated.h"
 #include <xen/hvm/ioreq.h>
 #include <xen/hvm/e820.h>
 
@@ -1401,6 +1401,8 @@ void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory)
     xen_pfn_t ioreq_pfn;
     XenIOState *state;
 
+    qdev_warn_deprecated_function_used();
+
     state = g_malloc0(sizeof (XenIOState));
 
     state->xce_handle = xenevtchn_open(NULL, 0);
-- 
2.21.3


