Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKG2-0008CS-Hg
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFx-00089U-LL
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:04:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60678
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFw-0008HW-FJ
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bGDaAMWSjpprqA7Io3dm7QCtlFgafERZCyah8ISMES0=;
 b=itgO2mmoNIRHw/0n2dmXz5/K16m6fCVBikjveHR9eauJBXl04FZoaO8A2yNkmRufLpms8D
 HWz2tK3fzbTY4zPAGUSNGBsWxVGkAcdD4y77SuENTb/Jviv5jGL73J9YFwJC9m6ZwtE/Sb
 bV3P0aANuCdW33BbHZBUh34sboIpOQ0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-P27bgqt4O_ejlW0MJzklxQ-1; Mon, 08 Jun 2020 12:04:01 -0400
X-MC-Unique: P27bgqt4O_ejlW0MJzklxQ-1
Received: by mail-wm1-f70.google.com with SMTP id c4so14624wmd.0
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bGDaAMWSjpprqA7Io3dm7QCtlFgafERZCyah8ISMES0=;
 b=CR5nV0ohdXCG9k12Q9zJQYvG6QQS3ZS6r8/SnuqqzQrMbKGcyOE39XJR4n3m1BN35T
 OBqgdXkgd9SrP7xs6I/dQoALU4cTmOu70BJm5dq2S8cchdVtb2OAFGpDKMlTloHirCUX
 DtBGeLvvb4IQgG8pKL0tjNTedlUCz5Ip2bEdoHZiEWenjoVzPNv3jDkh5o5EKfz03TVc
 ot8g8zS6tZWJOO+cX5xRykr0uhpxZ/KhWsuVIOwCGMWQw4PsvmnEMRmVG5BpOHo1+LYm
 OllHVRMZTADxfYqKsjM89yiiHQO846oqiioJoKoDW7A+LlTzRqGXEKrTMkjgsvL0S1lj
 uoJQ==
X-Gm-Message-State: AOAM533d2Z7A4SkCxwnNl6QKnbp8Oyn+SHk0b6r9j1HXQuyx5bNGejdP
 h5YhKM8i7hXZQnlz5GALLepauOrmGgflq7WiFx+AoG7o4OwR/juE0eFSKUiDr6+uGpGZHN4Z6Ir
 oG6rGXplktNG+qyQ=
X-Received: by 2002:a7b:c201:: with SMTP id x1mr78877wmi.58.1591632180064;
 Mon, 08 Jun 2020 09:03:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF5+TIjMo5Pv/JZUc9oRpRqa5yr/ufMOXB39AL2QL+RAu+P6Qy6euM0Zs2QNe7FGM5NNcPJw==
X-Received: by 2002:a7b:c201:: with SMTP id x1mr78842wmi.58.1591632179907;
 Mon, 08 Jun 2020 09:02:59 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id q1sm34631wmc.12.2020.06.08.09.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:59 -0700 (PDT)
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
Subject: [RFC PATCH 23/35] hw/misc/applesmc: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:32 +0200
Message-Id: <20200608160044.15531-24-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:04:14 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/misc/applesmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 1c4addb201..d63f19038d 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -36,6 +36,7 @@
 #include "ui/console.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
+#include "hw/qdev-deprecated.h"
 
 /* #define DEBUG_SMC */
 
@@ -253,6 +254,8 @@ static void applesmc_add_key(AppleSMCState *s, const char *key,
 {
     struct AppleSMCData *def;
 
+    qdev_warn_deprecated_function_used();
+
     def = g_malloc0(sizeof(struct AppleSMCData));
     def->key = key;
     def->len = len;
-- 
2.21.3


