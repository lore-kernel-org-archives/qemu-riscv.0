Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKDV-0006JP-DD
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDS-0006Fs-5e
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23486
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDQ-0007hD-Pz
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ORhV1sd4nU6DWHF34s88hmmcxuNYxVDeCG6mbf27fE=;
 b=JJUP9ER8KE3KF5U2kBQXvEj6Xxob5FydoTad7dumr4tP0WHDfbg1XHEtLB8QloACYUiuwQ
 TlKEb2JOfwgcxsq79TugRcDx9jVRCuozPuvJpZBam9kw/inh7/OR7VfjrBjhdjZyJ6pv9+
 ussJ5YqczLxr30Yudw7285wt5oa0lRQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-d-jnvma5Phuo5rsIDt08nQ-1; Mon, 08 Jun 2020 12:01:34 -0400
X-MC-Unique: d-jnvma5Phuo5rsIDt08nQ-1
Received: by mail-wr1-f70.google.com with SMTP id l18so7395903wrm.0
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ORhV1sd4nU6DWHF34s88hmmcxuNYxVDeCG6mbf27fE=;
 b=TOCKxym2LeJIOm7NLe6H3TNWKWo7ZcuL2pgdsCNY6gbs+v4WoZvVizppTcyK5mV18/
 CccLM6qWvCwf+cRd14KUrGtMExwZB2qdk0PEniLZVQFkm2AFcnGvBruh0SewBZ0r+Aw4
 KbCsJxDwfkb3PDby+jzR500bUOGWh0O3R6uEVlXtfGIVAes/SrXCzLnZ+hwho83gbIeL
 LypNQKkTh/T0u0HM9gc9zl1k4k9IKz8EyAP9SKeX7bRcz2sWKR77M+DB67oxg1+wDwsE
 HH/9e/kb7o+sClqLiUMJB9QBiiUfqeG8aSODIshG+NgcOPOW47Bt4KlU7f8XH9Nk9myJ
 jZsw==
X-Gm-Message-State: AOAM531utHy6zw78dUn3rQhfGssHUZ3Ju9CvGFaleM5sUj0hLyjH2KFp
 JyZopZJftcKMQV52moNGKzriRI5zZhrVPx6Z8AFVs/3WwZrnoppsTzq7d5MB2bP2bxkRHVJnicm
 zn8atsczjgLXWIrU=
X-Received: by 2002:a5d:6a4b:: with SMTP id t11mr23943719wrw.404.1591632092852; 
 Mon, 08 Jun 2020 09:01:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzX3WHm4bb0lVL0OqrCVvYAl9aSgd4/p4YzE7wN3r2SHFS1TTcIn2CmgHMd0vmMkRzt+4NE2w==
X-Received: by 2002:a5d:6a4b:: with SMTP id t11mr23943661wrw.404.1591632092491; 
 Mon, 08 Jun 2020 09:01:32 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id a3sm122524wrp.91.2020.06.08.09.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:31 -0700 (PDT)
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
Subject: [RFC PATCH 08/35] hw/display/blizzard: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:17 +0200
Message-Id: <20200608160044.15531-9-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:01:38 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/blizzard.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
index 105241577d..74557b152b 100644
--- a/hw/display/blizzard.c
+++ b/hw/display/blizzard.c
@@ -23,6 +23,7 @@
 #include "ui/console.h"
 #include "hw/display/blizzard.h"
 #include "ui/pixel_ops.h"
+#include "hw/qdev-deprecated.h"
 
 typedef void (*blizzard_fn_t)(uint8_t *, const uint8_t *, unsigned int);
 
@@ -1010,6 +1011,8 @@ void *s1d13745_init(qemu_irq gpio_int)
     BlizzardState *s = (BlizzardState *) g_malloc0(sizeof(*s));
     DisplaySurface *surface;
 
+    qdev_warn_deprecated_function_used();
+
     s->fb = g_malloc(0x180000);
 
     s->con = graphic_console_init(NULL, 0, &blizzard_ops, s);
-- 
2.21.3


