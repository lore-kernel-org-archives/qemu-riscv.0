Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKDS-0006Fk-0n
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDN-0006C4-8h
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36981
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDM-0007gn-37
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P++PpnzVmXXtn3Xqf4XIHbmL4uqsh2R3Dd1pfn2k/GY=;
 b=KuLTfay+BjUA9tm25il0dVm1obY2X+WoFOeRz4dL/tw/N+nLrrfdHiWh0+RHp5r+xgIJIt
 zdtGAp8UaVSWVevhmHB3N3V21ASJGWIo2xTXpmmGljkthpWIra3S/Wvh34rygklxtq2hS3
 MmbgampXCMaaOT/W60SmlaHJTIwg9HY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-NrexuC5kNouwin5duU1pdA-1; Mon, 08 Jun 2020 12:01:28 -0400
X-MC-Unique: NrexuC5kNouwin5duU1pdA-1
Received: by mail-wr1-f72.google.com with SMTP id e1so7366664wrm.3
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P++PpnzVmXXtn3Xqf4XIHbmL4uqsh2R3Dd1pfn2k/GY=;
 b=PVpCmarbAizkYUdgiTyHVZrCoujGB9q5bBem9wlgf+SQBGRTGsnRH4UGaFmcsmrdm1
 LOl6aTnqYA9Gcfo9vVraN/Iecp6mZ1KeLV0LA9UrH27u2N2jbpkmBvbmQvex5tIFXa7e
 DiMvZ1NGqgqdk+wOSw6z1rSsMjgsZ8SZ0TPzFlUxgU2VH/5UYfyn+sixH5KSAglizuTf
 3eTVlEetVcjJnHYZfcfzzXSTEjC1N/Yt94Ggcf6T/vpz6ivf+KpLBNnmEg+7fd5MMgPv
 hEGqGapqbOV6NuWwmkyYqa0JLwT1vx9pvXPEuT2osUSqmLbVXg5AYnXeIH/6/rxnzo9g
 bIaA==
X-Gm-Message-State: AOAM533hwLvfVblSVooDb03uImFwJ+4S8NEfM7Ukg+XsAyoACcWTxP7y
 ZAqNc+XGvn5XvnObEyt+Z8W4D1mnF7H17kutiotS3QcFHVtuuoa7ddtTNALdYYuawjEKn0frSu+
 uTFy3b0LuN/a1wdI=
X-Received: by 2002:a1c:f007:: with SMTP id a7mr27124wmb.103.1591632087256;
 Mon, 08 Jun 2020 09:01:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi6QGEqKJNT1xfJrXVN1hFb5ZVsGqmEk2sV/P9tBTDLMUlN7hRgEWpk7m+66ilMFrnYarGkA==
X-Received: by 2002:a1c:f007:: with SMTP id a7mr27088wmb.103.1591632086930;
 Mon, 08 Jun 2020 09:01:26 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id o9sm7066wmh.37.2020.06.08.09.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:26 -0700 (PDT)
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
Subject: [RFC PATCH 07/35] hw/char/parallel: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:16 +0200
Message-Id: <20200608160044.15531-8-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:01:34 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/char/parallel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index 8dd67d1375..0ee577d420 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -35,6 +35,7 @@
 #include "hw/char/parallel.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
+#include "hw/qdev-deprecated.h"
 #include "trace.h"
 
 //#define DEBUG_PARALLEL
@@ -601,6 +602,8 @@ bool parallel_mm_init(MemoryRegion *address_space,
 {
     ParallelState *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(ParallelState));
     s->irq = irq;
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
-- 
2.21.3


