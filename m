Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkGj-0001Uy-8R
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGh-0001Qm-Av
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:39:55 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35340
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGe-0007Y9-6G
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ohYFQDQtBBzlIBSO6MkXhxqMR6JUtdL8Voi/meJKGaU=;
 b=QWnfbi/H0MTAsLlDU0xPTJrRfxnn3ipwKeTMkzcAwMXHuRMJlSO25UNmmDFbdisZSW+WJY
 ScGOOFzJIZXZBxQfeCYcgyqcGDlIcRh/zgSTDdanMb6VtHNWUkjDmaY37DmII8QQaEDEU6
 ncAmCLUbv30ev4N/O6vZFD1kuaPETgo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-yWfQjhepOlmmtmV0gQdb2Q-1; Sat, 04 Jul 2020 11:39:45 -0400
X-MC-Unique: yWfQjhepOlmmtmV0gQdb2Q-1
Received: by mail-wm1-f71.google.com with SMTP id t145so39825946wmt.2
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ohYFQDQtBBzlIBSO6MkXhxqMR6JUtdL8Voi/meJKGaU=;
 b=PuJUHYHWIKsbJC5yQ3YBZRHAnZqDjbbGhChnE8gHUpJA0W+5HxlPoJPjKdpNfjQE0m
 AWk2M1OO5Vum6VVgRhKEnnxHDuBllzphj+iG5TKWT2HlYBcm2M2kLtrU0+rXTX/F7OED
 637i5Eb4LRkfdP2xb6/1wUlwTYJkFvQN2U2QV+Y8zCwmY6DrzqsTVMNIYVXxJW/BjRCA
 1Op62rk/1+MsOVhijHd3bdIRGJTz4CTFTjTnq+ZC2HEgod9RUNDws/1px+herYD8f2jP
 jbvwri2444A9AFIeU8LjZuHEHlTb0yKypsTV7HQVup7XuLNOSqf+CXqtPRmlnR1Q3106
 d7FA==
X-Gm-Message-State: AOAM530vgupGo6XtADeq+aEoWLnLlt7fTgaEGL05NCEhZZ8ukJHH6qVK
 Ipas2Egh/+jPkRjIxNnH99NY+yoG/E/A5WELpfFoPjxYtYdVN4GiiR9TMFrtp/+ovzMJtkV62CQ
 jw6XqEBfD5wP+LHc=
X-Received: by 2002:a5d:5706:: with SMTP id a6mr6327518wrv.328.1593877184618; 
 Sat, 04 Jul 2020 08:39:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDyQfrlFYLem5JvihWImL7s/IF9MxEKw/4mF0qGNZlD+1PxiIv8dDz1GKbcIs8wlyY8frjng==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr6327492wrv.328.1593877184429; 
 Sat, 04 Jul 2020 08:39:44 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id w128sm17724101wmb.19.2020.07.04.08.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:39:43 -0700 (PDT)
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
Subject: [RFC PATCH v2 06/23] hw/char/parallel: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:38:51 +0200
Message-Id: <20200704153908.12118-7-philmd@redhat.com>
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
X-List-Received-Date: Sat, 04 Jul 2020 15:39:55 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/char/parallel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index c0f34bf924..02eb1a7ef4 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -36,6 +36,7 @@
 #include "hw/char/parallel.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
+#include "hw/qdev-deprecated.h"
 #include "trace.h"
 
 //#define DEBUG_PARALLEL
@@ -621,6 +622,8 @@ bool parallel_mm_init(MemoryRegion *address_space,
 {
     ParallelState *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(ParallelState));
     s->irq = irq;
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
-- 
2.21.3


