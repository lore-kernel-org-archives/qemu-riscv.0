Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKDx-0006c8-44
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDu-0006aK-I5
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:06 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50216
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDs-0007nj-L1
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JPFQ0bX3Ul9NeHHcjGis7Hob0YUuGxD/aHEXimgfPe0=;
 b=SNg3Vw1wOv3e531S7bQvEPa0ySxt/QmIxqGPmHm/U1zxU1WjNFWluxou2WsblLYn2lyaBM
 tWW3Vjg0Ms+1vtmiSD1HfOBfIBEXNjXKjrV04oUxlAqtQaMwUvew9W0ltKOY5mwQYPF0DX
 w8mMKJPlge1H2E7RMOkn/Rn4IoSse68=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-_0cqXONoOJ2wi3iR50Ai6Q-1; Mon, 08 Jun 2020 12:01:16 -0400
X-MC-Unique: _0cqXONoOJ2wi3iR50Ai6Q-1
Received: by mail-wr1-f71.google.com with SMTP id p10so7358658wrn.19
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JPFQ0bX3Ul9NeHHcjGis7Hob0YUuGxD/aHEXimgfPe0=;
 b=bXiqavPfZ5UFJXJQd0juikilC26qQh5K4gn35qeOSlXgeXEOgXFWx235opmJhQGRjE
 EQ3Pvg671pizJA2hnklXHdJLyyUSqq/KzAdy+7dU22yONA3gUksJOFDhZJldQfeB4LsW
 SQ4vaRn9UKDlZqvtBeoJf78uBxqemjwMQU0FBqW0Wm2w52fpKEjIInmXP0DYfObZPv0H
 FWBvae7EEcFHrSrpdE8AoPXZFRplTpuHxKOGMadv0WAx/6+kNw30YUQ3GdccqkdrE3RV
 CNd3yec52xIGJnhCutGoG/EUXIDNUXgyEJHqxzJNwzzcs0ARwKOkyJrAgZJLwbsKveR9
 Vy1g==
X-Gm-Message-State: AOAM530k8LRDJI72gn6o7RY2ArPUGqKBHuTV8oDpNAKCs8x74iX36ZVO
 P4XAqG3w9RECvV4c69YVisltwAdPuSYf31ZEcxtn3KBPoliNXZPkutnvII7rtEjURZzFCZB8NDz
 uVU3tLofgPgR0pbw=
X-Received: by 2002:a1c:63c2:: with SMTP id x185mr71329wmb.68.1591632075683;
 Mon, 08 Jun 2020 09:01:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHSTbXCqkGc9kOsbxhlXHtghZhPx9xWZVb7ZeU/GWo7Q7cDZTZJUQ93U+AAUtsWNU3dUVBvg==
X-Received: by 2002:a1c:63c2:: with SMTP id x185mr71295wmb.68.1591632075484;
 Mon, 08 Jun 2020 09:01:15 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id h12sm145322wro.80.2020.06.08.09.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:14 -0700 (PDT)
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
Subject: [RFC PATCH 05/35] hw/arm/nseries: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:14 +0200
Message-Id: <20200608160044.15531-6-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:02:07 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/nseries.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index eae800b5c1..bd0c3f39a9 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -44,6 +44,7 @@
 #include "hw/sysbus.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 /* Nokia N8x0 support */
 struct n800_s {
@@ -703,6 +704,7 @@ static void *mipid_init(void)
 {
     struct mipid_s *s = (struct mipid_s *) g_malloc0(sizeof(*s));
 
+    qdev_warn_deprecated_function_used();
     s->id = 0x838f03;
     mipid_reset(s);
 
-- 
2.21.3


