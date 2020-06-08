Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKEH-0006rU-Kk
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEC-0006o2-69
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24990
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEB-0007rm-Bz
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5ly0fcUXOf9qpye/9fR2nyQtN4aqsUxjucs8EhlOCo=;
 b=KBOaR8c99ngR+4aSR2mkH8Ans4ohxU2RPgBRcCKZTDAYWmyysiiD5hGFI6WmNGjVa7LuhX
 SrVgOdLxrxmgL0WX53kcWbiK3FSjtv2rI8fb46zRMGrAicZ4rqkdC1J8eqJ1fP6kr5N6tq
 H02FyPwXqfmkbJ9LKFGWhCNf3AaQeEU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-a95eylMHPbOX45YmnyNMnQ-1; Mon, 08 Jun 2020 12:02:19 -0400
X-MC-Unique: a95eylMHPbOX45YmnyNMnQ-1
Received: by mail-wm1-f69.google.com with SMTP id x6so4090wmj.9
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g5ly0fcUXOf9qpye/9fR2nyQtN4aqsUxjucs8EhlOCo=;
 b=mI76HarHv2Bjy5LRFCfhudme1U3WVE658R75qpDtr4lsFK9KsloDYWjg3jq75/ldMR
 kcuhRNqM5AwzM0HMgl8s4X7M2j8ennGGiE6uYx6xSmsCVBaPrTmlpfK8iLNo87TtH109
 ijfZ6pmzy62jIdi32Cz50t1ovFVhMippOmU3Y/z9qURbhmYhcYnZYPPlyLCVP6h9CJDp
 ltP9NeMCoEoT8mHdvJZKkbRJZI4P4Ec8Cbe/C+YLcCso3DKMvJbeIfRO0iYrkmEjU4V8
 77O3eiPgV5d6g3dBXk0ZFxKyY7yq54Ly1Yl6D9EwG3V7NZ3t94yO4XArXks65JAk5xml
 g9xQ==
X-Gm-Message-State: AOAM533RyqS7WVciSr+xq0BWsFzWlNjVK5gpiKkaM2MfCb1Wr5YHDELR
 SJEFS+zJyKKS947NNwbo1bI5NjMNuj8fr+lX9Jm72/9ly7+qh4ReFSniCK19u60RNnVgWq3H6Ms
 DTarjQR+QWgpX+bY=
X-Received: by 2002:a5d:6944:: with SMTP id r4mr23775346wrw.169.1591632138152; 
 Mon, 08 Jun 2020 09:02:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoiY9HH6DYEAYHN6rucdTjohElJ6XD9T5NIDyn78LYZQIrFIp9Ryvcx8eKgENNoeOnl+u4SA==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr23775315wrw.169.1591632137954; 
 Mon, 08 Jun 2020 09:02:17 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id u130sm12527wmg.32.2020.06.08.09.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:17 -0700 (PDT)
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
Subject: [RFC PATCH 16/35] hw/input/lasips2: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:25 +0200
Message-Id: <20200608160044.15531-17-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:02:26 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/input/lasips2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 0786e57338..452244f037 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -34,7 +34,7 @@
 #include "exec/address-spaces.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
-
+#include "hw/qdev-deprecated.h"
 
 struct LASIPS2State;
 typedef struct LASIPS2Port {
@@ -269,6 +269,8 @@ void lasips2_init(MemoryRegion *address_space,
 {
     LASIPS2State *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(LASIPS2State));
 
     s->irq = irq;
-- 
2.21.3


