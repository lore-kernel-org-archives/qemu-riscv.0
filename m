Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKEA-0006m6-3n
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKE8-0006j6-0C
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55808
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKE7-0007qV-0i
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8wt5v6YHTpbkeCWEGxoSB2Z3fXavqt1TINJtdAbbd4=;
 b=Uco4YaRe3hMr07HFj38pGS4HP//z2aWjJ0WRMrG9Vl8in5/8wHs1/VqyYQDjZSUHkgnMim
 5IeQN+PoaO6Wuh3gRcXLp+3li987Gk4rDz+UeGCizz9pRmxwYluntbGPlH0fPyj8CEuN/v
 owy63odkIfSPiAmbPc28vxN8aRye1nE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-EHyqKjfKNJC2IaEP5_pozQ-1; Mon, 08 Jun 2020 12:02:01 -0400
X-MC-Unique: EHyqKjfKNJC2IaEP5_pozQ-1
Received: by mail-wm1-f72.google.com with SMTP id c4so13524wmd.0
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y8wt5v6YHTpbkeCWEGxoSB2Z3fXavqt1TINJtdAbbd4=;
 b=YRxIKgta+ohcS1+xsUQOenY2bXM4/TTv3THPVaSV/h5fWRwIJ14qp48JbvCz0cSI24
 d4qj+Gx8KmCK8Qa1bu2q1PjFvqzyrfuSB8Tn6mQyVu8AxionP61XavPiEbHPUG5U7AO9
 u43pHmV8Tvm+sZ/wOmVS5snci+CLe8flhMIoZeRL0bdZVHZ6oB1xvNfr2rwjYG+D1IKm
 6dNkbyEQy1uzCykkHcRBcmR493ybZJaV68I0Krk41GCMQzXhq1kHD4ENB6lDzWmjWkjp
 8iNb5LvMc8m7Z/nKdg4ZDAxBELM4sfDq9ZAXGCNS9gjSwoc8vJeTBBrIk09BJCJoDqUd
 mM6A==
X-Gm-Message-State: AOAM5319E9em43sF16MWCaVS0M7rLAcD47PIq532eGcNhsoZAcgnvAYY
 H5Im3Lnah3oFD7NxMQH8q3KM+Vbv4EnygaYAN0w1zIZJA3jWo4EgImhm6C0LrxYcMXPFQHwVa6q
 qO6x7wryLqoXEuGg=
X-Received: by 2002:a1c:49c1:: with SMTP id w184mr73372wma.46.1591632120646;
 Mon, 08 Jun 2020 09:02:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOUfdYxrvW9CPb/dnvfewyhVs9Qx2I/bhjoR6HiKlxToMKENTue7cOTAycSFeLnlY6TznpXw==
X-Received: by 2002:a1c:49c1:: with SMTP id w184mr73337wma.46.1591632120442;
 Mon, 08 Jun 2020 09:02:00 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id j11sm154169wru.69.2020.06.08.09.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:59 -0700 (PDT)
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
Subject: [RFC PATCH 13/35] hw/dma/soc_dma: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:22 +0200
Message-Id: <20200608160044.15531-14-philmd@redhat.com>
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
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 16:02:20 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/dma/soc_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/dma/soc_dma.c b/hw/dma/soc_dma.c
index 3a430057f5..22fd8c38b0 100644
--- a/hw/dma/soc_dma.c
+++ b/hw/dma/soc_dma.c
@@ -21,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
 #include "hw/arm/soc_dma.h"
+#include "hw/qdev-deprecated.h"
 
 static void transfer_mem2mem(struct soc_dma_ch_s *ch)
 {
@@ -242,6 +243,8 @@ struct soc_dma_s *soc_dma_init(int n)
     int i;
     struct dma_s *s = g_malloc0(sizeof(*s) + n * sizeof(*s->ch));
 
+    qdev_warn_deprecated_function_used();
+
     s->chnum = n;
     s->soc.ch = s->ch;
     for (i = 0; i < n; i ++) {
-- 
2.21.3


