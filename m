Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKEG-0006pP-67
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKE8-0006jg-Dt
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59651
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKE1-0007q9-Bj
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swd27F6/1+WGmnfSzwg22l5POZg58LkwHV81fIkNGaQ=;
 b=O5AjMlEIDJRE7ztGDYiH01wNO/ZQ9yWmGUJ6KDjK3liV/PxeojBEXzAxOhw95UvpQaJxdv
 seYzNySXKHmXkKr3hqkAqTTLF+TX36Bb1f13k/RtvB2Z+KGd4mFmBKKy/gsO/nuDS1qljS
 FroHZ8q43NeEhIhFDoKhlHkW6wgJNJw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-YXSyHvyFOHiw33ILCQFK1Q-1; Mon, 08 Jun 2020 12:02:10 -0400
X-MC-Unique: YXSyHvyFOHiw33ILCQFK1Q-1
Received: by mail-wm1-f71.google.com with SMTP id p24so12388wmc.1
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=swd27F6/1+WGmnfSzwg22l5POZg58LkwHV81fIkNGaQ=;
 b=PeAe7wOjXJVsb1K8sF2XY5oZA1UG+KDOlxh2gd3ha8UUbTDCMr5njVQFD6R06VjvS6
 d617VYGmPeHugSXIMAVo1045iY/kG6XQC7nPD2sAgapipy23+8QwK5jq1/DNcoI3pihw
 zM23hol1iDLr/Hgqmms+eW5uToiiLDTpN0MoLS/3/8j0uy1tcpagCn5zvMqFdlmosQJE
 56yfEfWotPOaUwvtjZaHpGFWgHYz++XndICBNi8bnMm1bc3eskPqJOP2lhw/44S3UKlS
 D0ZoL47NjCOxSqsDjMI98okiI5hdWJXLR4h8NECTnB1ocbTgCSSdBSFtUerTLHWb5KS/
 yIWA==
X-Gm-Message-State: AOAM531AR1ct2z0/mzb9le108UuvP6VV8vATQX3L4exYN7/l8u4EW3WY
 Q6hj1DeYL3K36b35Cm1fXM4JXovo+qcVeEXWr7AQ3hm+I5RgNZCGQqfZQe6qlMir7QKUZ3/JaXR
 tofz8v6DlnFLf7S4=
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr58657wmb.168.1591632126777;
 Mon, 08 Jun 2020 09:02:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD9AlGEl1YrzMFzzhVE1vb4kbCf4YFVdSir7m67DLKARx2zMO0OlXdHqSCrgQOgDPIF6US1w==
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr58578wmb.168.1591632126013;
 Mon, 08 Jun 2020 09:02:06 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id z206sm13115wmg.30.2020.06.08.09.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:05 -0700 (PDT)
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
Subject: [RFC PATCH 14/35] hw/i386/pc: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:23 +0200
Message-Id: <20200608160044.15531-15-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:02:21 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/pc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2128f3d6fe..c71809fd28 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -94,6 +94,7 @@
 #include "vmport.h"
 #include "fw_cfg.h"
 #include "trace.h"
+#include "hw/qdev-deprecated.h"
 
 GlobalProperty pc_compat_5_0[] = {};
 const size_t pc_compat_5_0_len = G_N_ELEMENTS(pc_compat_5_0);
@@ -348,6 +349,8 @@ GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled)
 {
     GSIState *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_new0(GSIState, 1);
     if (kvm_ioapic_in_kernel()) {
         kvm_pc_setup_irq_routing(pci_enabled);
-- 
2.21.3


