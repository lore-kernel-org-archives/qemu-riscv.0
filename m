Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkHO-0002cj-Tx
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHI-0002Y5-S7
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:36 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38067
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHE-0007xN-KQ
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5ly0fcUXOf9qpye/9fR2nyQtN4aqsUxjucs8EhlOCo=;
 b=QUpq5JPrbbE0VHpXBaZckc7+kTFQy+VKlGIXNTKhlaB2AriEAotUbiB+i601M3VEGbgJXY
 VKXc+dcHUbq9sz25M+D3WgQQdnvcpthE2nssIT8unw10qlOeMBHmByQImKC/tXUM2Or1en
 DoWb2HCxyZFcj0khuK2Z2DDPxtWsKJQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-mpKjLY4JN2Kpadn8FuVMEw-1; Sat, 04 Jul 2020 11:40:23 -0400
X-MC-Unique: mpKjLY4JN2Kpadn8FuVMEw-1
Received: by mail-wr1-f70.google.com with SMTP id z1so6147649wrn.18
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g5ly0fcUXOf9qpye/9fR2nyQtN4aqsUxjucs8EhlOCo=;
 b=VCVfpS8ziWDg5I82IuJ6ylMS+5pAnnFLtwzs9YAFxsETdLk7qA3MW97ZoUYgDAtqlU
 dHrlEPlKW81lyzI3hl2CuJlzcVesBJYQ5mRKKPru3qXf1j+ZhIsmTkV4/x2M2xcA1q27
 QKESHDYVgtjI3a78g/kbpckR3ovxFYsJnDa0Pxf1sdIZH+qCDvLVHch1SeUlNcHzptCJ
 YLlP8cSQz9/4lbpdVIotyBNwsfQkFhPOxuqTNg/MZ7WX1WMQV7ptSTGG75P9nSMUemZl
 Iej96zdETbpOYyUfW8ays55c8qmCqEhmHxGpXfQ31n2L6cLZjJupbo92htlIimqLHMrD
 c1ng==
X-Gm-Message-State: AOAM533AieiaA+SEqbTy5Cd/+F2aIsWb6mhine96y9lTLxhm/85wCu3E
 +q4MGFY5bJ3yNBUW4Hn4OZXFVP/P5vqhIDca1RKr2TSLboTDNOsY2HIwM3ek6e114mP2oSm+gcO
 vrLhn+hvjitoRVLQ=
X-Received: by 2002:a5d:658a:: with SMTP id q10mr38375943wru.220.1593877221943; 
 Sat, 04 Jul 2020 08:40:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyMKgD3/a3jy6iGiInZDbrcH8w26uYQl56sAGdQc8KZPWj5YW69Fw4oOJxni+dn0nj12wpKw==
X-Received: by 2002:a5d:658a:: with SMTP id q10mr38375922wru.220.1593877221764; 
 Sat, 04 Jul 2020 08:40:21 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id v7sm18015001wrp.45.2020.07.04.08.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:21 -0700 (PDT)
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
Subject: [RFC PATCH v2 13/23] hw/input/lasips2: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:38:58 +0200
Message-Id: <20200704153908.12118-14-philmd@redhat.com>
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
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 08:57:02
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
X-List-Received-Date: Sat, 04 Jul 2020 15:40:37 -0000

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


