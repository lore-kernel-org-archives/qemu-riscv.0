Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKDr-0006ZF-0l
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDo-0006XD-8O
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:00 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48601
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDm-0007ma-Bp
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHbfMTMnP0pPoIUOMaNBIF3qcn8JPSW/pdevUa2NjDA=;
 b=FpF4eDcfAtrF/PCga4L5v4LJ/fkMSyuZchTlSs/sjRwmrIZHt3KruPO4ic/slfdA7ekyOW
 TM8fg+jamCenJ88JGGsbY4EPbKUd22wgmF1++KUf4LfZjlKIgd65Y9riR2USmHzLPFTDkR
 0WrCCxnwwAnU/vRsqjHkN0o/tf2Mzmk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-rmhtf2WvNziPVaruFPKkpg-1; Mon, 08 Jun 2020 12:01:56 -0400
X-MC-Unique: rmhtf2WvNziPVaruFPKkpg-1
Received: by mail-wm1-f71.google.com with SMTP id y15so12427wmi.0
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uHbfMTMnP0pPoIUOMaNBIF3qcn8JPSW/pdevUa2NjDA=;
 b=aAK/Y0ZQU6rj234UVyU/LwzJP+abMvuJHvsOHrORrbcL1DLj4nyAuHACDx5V4jooas
 dLKnmLbiLAvMJnM05tpS9lo2odz6ALbo/uq78k9FrC+pXB+lTSN08KOiOZvSx0RWxd21
 2ZM5fOYdX0c27UL5CqHB5atK0RqOsKsIyk4DIEc+z1rdZm/H6GZ6EkU9PhRV2yfKSXob
 UYFkScVtV4Wdqn1imotuLLgARYUYGN6z+LUkBlHXSH3sUg5BYNPlGAbRtlFttPOkRCl4
 zGH4a3zwYnauC5JUfLwbthsS76Ej9Farkvp5Xv4/SSZ/ZVWHt5SIrGkFKORcIkEgvTd1
 Tu+w==
X-Gm-Message-State: AOAM533SjaL5m/fITsB9h48H/Wg3WmyLQCezCw6s4KciaksDdneR7DNo
 4hSV3G5/XemNIbZACDbwvnEeDoCoJslz/rWQFa8lJpJzYFL3wxr6hjew7g1vxIBaEXddpEXjBak
 MMCKaK+G0zsNa30k=
X-Received: by 2002:a05:6000:4c:: with SMTP id
 k12mr23864537wrx.215.1591632114946; 
 Mon, 08 Jun 2020 09:01:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjnqOGBWofUhF/g/CPg0SMkJ8njA1iKr2pcTJ7xpwajdAOHpMg7tlHe1H6wlLAySWDO/5VvQ==
X-Received: by 2002:a05:6000:4c:: with SMTP id
 k12mr23864524wrx.215.1591632114766; 
 Mon, 08 Jun 2020 09:01:54 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id y17sm194731wrn.12.2020.06.08.09.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:54 -0700 (PDT)
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
Subject: [RFC PATCH 12/35] hw/dma/etraxfs_dma: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:21 +0200
Message-Id: <20200608160044.15531-13-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:02:01 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/dma/etraxfs_dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index c4334e87bf..d2f7e7ca9d 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -28,7 +28,7 @@
 #include "qemu/main-loop.h"
 #include "sysemu/runstate.h"
 #include "exec/address-spaces.h"
-
+#include "hw/qdev-deprecated.h"
 #include "hw/cris/etraxfs_dma.h"
 
 #define D(x)
@@ -765,6 +765,8 @@ void *etraxfs_dmac_init(hwaddr base, int nr_channels)
 {
 	struct fs_dma_ctrl *ctrl = NULL;
 
+    qdev_warn_deprecated_function_used();
+
 	ctrl = g_malloc0(sizeof *ctrl);
 
         ctrl->bh = qemu_bh_new(DMA_run, ctrl);
-- 
2.21.3


