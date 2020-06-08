Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKFI-0007RS-PQ
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKF7-0007Ou-4b
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:03:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46052
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKF6-00089m-6u
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7tSIIx0YAEULmCHrXDbhmRzYLD86lXGUTjUWu9J2Gg=;
 b=cOwnDtZLLJcMCJvmM0j/E44reR1cmdhkjv3qP+vvfnztpf7Jtd8jRwdMU/IBKan7qlvOUG
 8PDP5lFuNMkmheU7GrQuy+Xtuxh7L6oiHuHv8xZPb7PrpXrjm9VY1bqIJHGbUBqzYKacys
 ClEmrN/d/KNCRz7XQ9PdW2641WC7EtQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-pNvrcqaNNwm3VarD4GcK3Q-1; Mon, 08 Jun 2020 12:03:12 -0400
X-MC-Unique: pNvrcqaNNwm3VarD4GcK3Q-1
Received: by mail-wm1-f69.google.com with SMTP id g84so10378wmf.4
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7tSIIx0YAEULmCHrXDbhmRzYLD86lXGUTjUWu9J2Gg=;
 b=Bg/e33zMDuUqZfRt870WFzdjDF8YItBjFr8/1xMJO1yyID9c/aOX928ZkIQHI8yY9A
 8L+vHW7/+9h2nh1GGxMtq0k788bG2Qmryt+UVG7HlLBN9ZJUeUlfAEVqwz9rP9VVGFqG
 jl4f1x2nBx6W4fVKdP+VmcvMV2GakELPYNBp1xcYtC5J9OMRHGyUbWXVBA8We7ifmwLL
 yTT226sKqI8oQ+wXY1Wr2N6EIrvigVCeEXj9Ycj9KpURKaGFE4KnyNGjvgt7RDugus5d
 15aaEqMyane6usJ0tFWmG/tJNik4+yQe0qOE5bqwI3QL/lPVT4e8YMicM5nmEi7pwyzY
 gq7A==
X-Gm-Message-State: AOAM533aQUJwEj3TtINC+C6gw2RjRgCMdYwV8ul9fj4qlq2BHLGkGr1x
 EdGMycqlDuvk3h0Kkt/RQ6V3aHDcHe1CBdpavF2jRw8PyJNSsLzBGSNr6YnCf4ExI9B5fYBcAga
 zvzFxu/jBq+cNWZY=
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr23742574wrx.214.1591632191242; 
 Mon, 08 Jun 2020 09:03:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiLyN7q/sPm3H+0NWOb+JiZp0uyhOR/YmqM2AxV/YlDV1PyuM240OziAWJ+tx+PgKwy933zg==
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr23742535wrx.214.1591632190993; 
 Mon, 08 Jun 2020 09:03:10 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id e15sm39541wme.9.2020.06.08.09.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:10 -0700 (PDT)
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
Subject: [RFC PATCH 25/35] hw/nvram/eeprom93xx: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:34 +0200
Message-Id: <20200608160044.15531-26-philmd@redhat.com>
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
X-List-Received-Date: Mon, 08 Jun 2020 16:03:29 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/nvram/eeprom93xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/nvram/eeprom93xx.c b/hw/nvram/eeprom93xx.c
index ca6f591c84..56603ea42b 100644
--- a/hw/nvram/eeprom93xx.c
+++ b/hw/nvram/eeprom93xx.c
@@ -39,6 +39,7 @@
 #include "hw/nvram/eeprom93xx.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-deprecated.h"
 
 /* Debug EEPROM emulation. */
 //~ #define DEBUG_EEPROM
@@ -300,6 +301,8 @@ eeprom_t *eeprom93xx_new(DeviceState *dev, uint16_t nwords)
     eeprom_t *eeprom;
     uint8_t addrbits;
 
+    qdev_warn_deprecated_function_used();
+
     switch (nwords) {
     case 16:
     case 64:
-- 
2.21.3


