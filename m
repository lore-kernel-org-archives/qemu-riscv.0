Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkHU-0002oi-Cc
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHT-0002n0-Cd
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31715
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHR-00089v-Ha
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKgZ6rumXDcRDPMbmvtvFrKHcFm+r1xyGKVfqjvJc6Q=;
 b=RmOItFHqrv2r/rVDol+3dwM1pZ8hlwTTXliSnX2CvdGocBMqvB8xPgQaDVsD/Fu78LwnjN
 U6AdubpsIbaIUoBJD/kw3AEPsGX5AivaMxrjL5/chXdnqE5bjm6m2zE/xH191zqLylOugv
 5uey4rMB9STQDK3Cna6D3Ctwa+kD8c8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-iwYr1l9xNNGSa4CZ77YKpw-1; Sat, 04 Jul 2020 11:40:39 -0400
X-MC-Unique: iwYr1l9xNNGSa4CZ77YKpw-1
Received: by mail-wr1-f72.google.com with SMTP id b8so21935423wro.19
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKgZ6rumXDcRDPMbmvtvFrKHcFm+r1xyGKVfqjvJc6Q=;
 b=K52aHbm2U9Cdj/xOxvJZzrc7xAjt0oHMmGxoda8RMrQnB7AXTd7bbJHRgb58cVVYnP
 ANHbMGL9TCZyjPg286pD96E1Rm0AS3ItluUPLqZUiP1xnKDLSwFf8seQWmRKhoj6Ocas
 TrE0FQH8c8edMSqdcy5tRBfqmMPJv84/Y7Gc51FHbApfM6od3iRNofRYzRuNYlhBs7vQ
 JuBQJP4Ng/mGcDa4LAYlDkwOxdK7/eQDhvZ+g9mDkvx04ETAWbOTIqC1BDbtod59MghV
 6atXm/rdOL4nB/QmR7AteNTa6X7RQBQl1/Ql6JzbJojOYCLIWucOKqCb0GSIH60qV3uk
 5GdQ==
X-Gm-Message-State: AOAM532Uhl+ghT1uhBDYBNqBeUBIta0uvLRGcQwvsEnsZ6wYmZvCS/UZ
 4S7bR24YzhJbU+fySri5qmqpsfLcgYP5D2JbLYjSY+VCBmK8q699UfRQFNcCXHwmfbU71rm0/Xw
 2FrbSM9TvHXdDhnE=
X-Received: by 2002:adf:fa81:: with SMTP id h1mr43381475wrr.288.1593877238230; 
 Sat, 04 Jul 2020 08:40:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEWHTNdpfbHRO/8gBgJUIEPlagpqc6fDVjKOne2cud7rlfrE72yVHWORnhefyOUyX2+OKgwQ==
X-Received: by 2002:adf:fa81:: with SMTP id h1mr43381457wrr.288.1593877238087; 
 Sat, 04 Jul 2020 08:40:38 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id k11sm18662570wrd.23.2020.07.04.08.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:37 -0700 (PDT)
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
Subject: [RFC PATCH v2 16/23] hw/misc/cbus: Emit warning when old code is used
Date: Sat,  4 Jul 2020 17:39:01 +0200
Message-Id: <20200704153908.12118-17-philmd@redhat.com>
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
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:14
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
X-List-Received-Date: Sat, 04 Jul 2020 15:40:43 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/misc/cbus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/misc/cbus.c b/hw/misc/cbus.c
index 3c3721ad2d..24e197684f 100644
--- a/hw/misc/cbus.c
+++ b/hw/misc/cbus.c
@@ -25,6 +25,7 @@
 #include "hw/irq.h"
 #include "hw/misc/cbus.h"
 #include "sysemu/runstate.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG
 
@@ -135,6 +136,8 @@ CBus *cbus_init(qemu_irq dat)
 {
     CBusPriv *s = (CBusPriv *) g_malloc0(sizeof(*s));
 
+    qdev_warn_deprecated_function_used();
+
     s->dat_out = dat;
     s->cbus.clk = qemu_allocate_irq(cbus_clk, s, 0);
     s->cbus.dat = qemu_allocate_irq(cbus_dat, s, 0);
-- 
2.21.3


