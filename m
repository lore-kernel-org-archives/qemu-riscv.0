Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKEJ-0006uK-KY
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEH-0006qO-0M
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41694
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEF-0007sI-Sp
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rWjAvYJiR2Vce0nRqDWV8FQMXBd2aTRIKVfGqqqeffM=;
 b=Fp3ELPStTjOuCI2wh3Qr1TxUN+zTA1lS6oawlpuxmNGFJPlQRZwuKuXedi5PKnlf/ijE01
 RwYWOHNOOW4vESN2GPUueV8V7Ox8+YRINfCOpDu1PedOV7M9UCIC2Zkm/vclokoeIzlOIb
 JzgEh7DdVApaLHtoL1g1lgUtvtaPjY8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-mgdF7SvXN3ijJTOWP_1TQw-1; Mon, 08 Jun 2020 12:02:24 -0400
X-MC-Unique: mgdF7SvXN3ijJTOWP_1TQw-1
Received: by mail-wm1-f70.google.com with SMTP id x6so4210wmj.9
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rWjAvYJiR2Vce0nRqDWV8FQMXBd2aTRIKVfGqqqeffM=;
 b=s4m/YWz1rjQYIImG012cEKL1k22AS5xt6vU7ollzsR4oqA9mb0BRfbAYPeY2nPfqwV
 Nmv6gH0YmRZY67tvaGAfDetNyYqulj40E3ngrLIG+b3CNe2ipuKRGZOvyNyDEr5Bunir
 tpcF1OO0Gc0oVmkkfPl8GP98eMa/3gZqvN5Gi1g8CFvSFlZP3uHoFddyfOug+MjEn1We
 /3EpACaW10z0dQH8emuZQ0B/Vn2vKRx6jgt2s+k1JNxWbLQ4/MzyYvflnrw419oYWVlw
 MCYZ6NrVYX2RX6Yk8yLepl40Rf1GaoljTBUjJE4jXlYcg0MC3vTT7GeGgXSF0EdAGhfo
 bPsA==
X-Gm-Message-State: AOAM531UncLc4GA3M6apxXbSj2NeCphJHJF5oI0UUvLhS3++T7rt/t3G
 Ir81u9WHFEQEdAqDBwzT8KOvbUkECyBUAladSainKf4tRzzPUkS3RBq1PEqvLZTNga2HcSb+Enj
 7jF0LZVxh3uV+/UI=
X-Received: by 2002:a5d:4987:: with SMTP id r7mr23761271wrq.316.1591632143873; 
 Mon, 08 Jun 2020 09:02:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8yfQfybue0LoXzyzfK8+trtOuK8e4qLitwG3WzemMauiha6gB9njX0C0ZNjvkq/B156qsJg==
X-Received: by 2002:a5d:4987:: with SMTP id r7mr23761254wrq.316.1591632143730; 
 Mon, 08 Jun 2020 09:02:23 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id s8sm142543wrm.96.2020.06.08.09.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:23 -0700 (PDT)
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
Subject: [RFC PATCH 17/35] hw/input/pckbd: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:26 +0200
Message-Id: <20200608160044.15531-18-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 08 Jun 2020 16:02:29 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/input/pckbd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 60a4130320..c7f42be63b 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -31,7 +31,7 @@
 #include "hw/input/i8042.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
-
+#include "hw/qdev-deprecated.h"
 #include "trace.h"
 
 /*	Keyboard Controller Commands */
@@ -467,6 +467,8 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 {
     KBDState *s = g_malloc0(sizeof(KBDState));
 
+    qdev_warn_deprecated_function_used();
+
     s->irq_kbd = kbd_irq;
     s->irq_mouse = mouse_irq;
     s->mask = mask;
-- 
2.21.3


