Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKEi-00076U-Gc
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEW-00070T-BH
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:44 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52934
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEU-0007ty-Hk
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WzkinKDRWpQmIIO97X+MugaJnDZKw0ffp1ti6/ctwc=;
 b=OrH1ySDQhciBHAMMlCFm4kH3NnMfKOW6Rrsn+MN8vBqGsSCBE9D5Rkubnl8cVNVI+pYciS
 PxSH95EG9F0aP/B8p0tSKjDwShOa6YG4edWj4FIUZmvz4E+UY6QyiCmmfgXVYaLrJT9ZLo
 h/Lf5yhDu7Lgg0/6i4onVc9OIEbQVz0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-C_N2bJP_NaCPtJd68hNsjw-1; Mon, 08 Jun 2020 12:02:36 -0400
X-MC-Unique: C_N2bJP_NaCPtJd68hNsjw-1
Received: by mail-wm1-f70.google.com with SMTP id t145so11994wmt.2
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3WzkinKDRWpQmIIO97X+MugaJnDZKw0ffp1ti6/ctwc=;
 b=FV5WHNDPnlOWuBd07/MQMRicE9AWZFWn+E6rcBLRWMRA0kOM9r2KFnnt2Ve9mH9Y2/
 cjJKZxTBqKogR2rTOBD8kBvaYwAhhN/AfhGqe5ho5sYz+9Ww7fR2A0mwI6TXwzd8a7+K
 x+Ynhsq0+8IwlH9vaFuffK5nkttg7K989xcMPUcrr3z+IJYO6JSSc6w1Cwhan+Z/5Ro/
 1d/J5ATfRnno75pnSBgwSG5eErNARZXH7w78aGxhPiLwX0snPqCLyL6vDxURwQj7/8RS
 lrVu6dmE0lcq/7S8dykX8M1fpNt4CBrTACH5WNpW6i4ipi27ZckyyN8aJ+geCeVHqYGc
 nRxQ==
X-Gm-Message-State: AOAM533vqrJ+tnmYasafscHIsJxztLhtXzQLm3Mj5K4W4Nm70cwe5O7T
 aKGhzmX0c+1D8US7YjMYP1fXeva5DpglvVt940K8xsGYJ8wXCLa9kGmPMHOcUDfcjqf2QEB0Mto
 ENXx7JIxLegmDgWc=
X-Received: by 2002:a5d:6391:: with SMTP id p17mr25853395wru.118.1591632155834; 
 Mon, 08 Jun 2020 09:02:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDmwNfyaecxfbcj81e+/jUBcU6vumJ01a4QLGsVfaCgs3E8cqqhTSmTr88Achkag+c/jFzSw==
X-Received: by 2002:a5d:6391:: with SMTP id p17mr25853379wru.118.1591632155624; 
 Mon, 08 Jun 2020 09:02:35 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id o10sm183753wrj.37.2020.06.08.09.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:34 -0700 (PDT)
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
Subject: [RFC PATCH 19/35] hw/input/tsc2005: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:28 +0200
Message-Id: <20200608160044.15531-20-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:02:44 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/input/tsc2005.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 55d61cc843..1f97b82379 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -27,6 +27,7 @@
 #include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "hw/qdev-deprecated.h"
 
 #define TSC_CUT_RESOLUTION(value, p)	((value) >> (16 - (p ? 12 : 10)))
 
@@ -489,6 +490,8 @@ void *tsc2005_init(qemu_irq pintdav)
 {
     TSC2005State *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = (TSC2005State *)
             g_malloc0(sizeof(TSC2005State));
     s->x = 400;
-- 
2.21.3


