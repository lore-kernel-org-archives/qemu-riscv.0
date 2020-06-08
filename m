Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKFV-0007fZ-K3
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFT-0007c2-Px
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:03:43 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28431
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFT-0008Cl-1P
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:03:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tavsnBMcjbLYqmKTQpJNbu5aW+OtaIuHgP5ZHfhD4y8=;
 b=eTeBdDQGsa/LrE8sj2CQmX8iur7HQNbShZc9uFuZB6fKePQ+t8HJVOwGuaIuvTpbBhJJ2Y
 K6RUOPfwiOQg4/ejuFu790JwzHBIGwcW2sSsLhrL8MgfIs/A2Smp/udig9f+s0fOIdpJHe
 EEcZYWXHIJOa5WCpsOaqrV92W6clB2c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-29d6IRQ2P_So-DxyEiz8Dg-1; Mon, 08 Jun 2020 12:03:40 -0400
X-MC-Unique: 29d6IRQ2P_So-DxyEiz8Dg-1
Received: by mail-wr1-f70.google.com with SMTP id c14so7329427wrm.15
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tavsnBMcjbLYqmKTQpJNbu5aW+OtaIuHgP5ZHfhD4y8=;
 b=FND/nsEtyPMc8RoZcIU3owpxdz1Y7gb9PZ1m+OnazwqrtoGrjXbjHDPpz41rOSzRKP
 jbW9PV3BFl81/Yd2e6WfCWvidljmBowE3OITJgu4B7lFvWQvtNJaMtWex5lPcv2DJv5c
 SXefioO+9ek8Paba1eJOs9Mx75rglj2llc7Wve4zOmhUBNBey+IJiS5RdrpDtGQssd90
 NJEjqzkmVruN4Z3Dur9OBd1IEVCCvboUgWjuoD9g+KfQnT86WnIDqK0W4M0CvU7LGieY
 /k2qrpC2ySgnQtPjneH8uZASZOXKJ0ntN/Y1SML9BOBIKIg1S3Sd9z80+ByycgUyUceZ
 +/DQ==
X-Gm-Message-State: AOAM533bM3P3hI+xT2pnm/mR3GxdeIoYqMBZG65HAllxuea1HzGamQ1+
 NsgGWMc22CWKWCfymEBaBYC74iMrc+4vP3WAddtgdJDRsof6NS0HpTs7Rdz1T2Vh2iNosEAvON0
 oYnNCwDIg6i8agng=
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr73330wmj.118.1591632216897;
 Mon, 08 Jun 2020 09:03:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1E2OUT8wjgYne61y8m5ATBeXEAgbFH/vhvj6PwSHzmhBdaDf8vJ9I14Vkb0SP4ZL7hYVwYg==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr73214wmj.118.1591632215737;
 Mon, 08 Jun 2020 09:03:35 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id l17sm200565wrq.17.2020.06.08.09.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:35 -0700 (PDT)
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
Subject: [RFC PATCH 29/35] hw/ppc/ppc_booke: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:38 +0200
Message-Id: <20200608160044.15531-30-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:03:44 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/ppc_booke.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
index 652a21b806..a9e5e68578 100644
--- a/hw/ppc/ppc_booke.c
+++ b/hw/ppc/ppc_booke.c
@@ -31,7 +31,7 @@
 #include "qemu/log.h"
 #include "hw/loader.h"
 #include "kvm_ppc.h"
-
+#include "hw/qdev-deprecated.h"
 
 /* Timer Control Register */
 
@@ -338,6 +338,8 @@ void ppc_booke_timers_init(PowerPCCPU *cpu, uint32_t freq, uint32_t flags)
     booke_timer_t *booke_timer;
     int ret = 0;
 
+    qdev_warn_deprecated_function_used();
+
     tb_env      = g_malloc0(sizeof(ppc_tb_t));
     booke_timer = g_malloc0(sizeof(booke_timer_t));
 
-- 
2.21.3


