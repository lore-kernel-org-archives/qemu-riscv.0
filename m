Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkGj-0001XH-W6
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGi-0001UJ-UE
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:39:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22360
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGg-0007Yn-Vj
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ORhV1sd4nU6DWHF34s88hmmcxuNYxVDeCG6mbf27fE=;
 b=PdxxxNSjW+X5GSf+ZRYLkeBTC+K3lufMSY7VUcnM3NA/4o65E1ESbePtGGQFeHZKgYe22A
 4WUNB/sdTbzJyR/5ceQzl+gQkBuKLpO4XUFowAzbAiybUYPvXlV4EspgrVRf2uQDj44MJu
 LP+B8STb+qqqmq0pzwHWciJlbrptI94=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-2A-_fR0IOdqsg7OtniqFHg-1; Sat, 04 Jul 2020 11:39:51 -0400
X-MC-Unique: 2A-_fR0IOdqsg7OtniqFHg-1
Received: by mail-wr1-f69.google.com with SMTP id i14so35796180wru.17
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ORhV1sd4nU6DWHF34s88hmmcxuNYxVDeCG6mbf27fE=;
 b=SDaPqVuiKHDgf5ULv54ZmtmJKvcwpJcaS9+1zXija8YiSGHIS8J3U5zCJ6onCZcCw7
 Ex+6qAc4bz1fvzPx2SJvGkfvUlnm0GP93g4UFl/aw0iltNBgmhhfR9vLsPmOwslJRd83
 t6LjvrAC8l9CsU+yHAFDVx5PFVtizlmfp5zPFK38d+bug0eFkutPAE+KW/oKYwkOS/6B
 bxElpNr9ZOMdYdlC1bA0QsLOvsYLsJz3eQvVgUV/nMCEUKKDOQYpr6scI5uBULVZUI5b
 ARQBm9uQI2VHCRfmJeARvQC8U0TMvYaI81Qs7LL+n5D5wYSzHwZRU0PzZz36qj7qa1Uz
 +nUQ==
X-Gm-Message-State: AOAM533tKsUDVTcg6QJWgnvBDGfDFl/mqFOMDzHzOhZsCbJT5npqPwhL
 TBBUVmIXW9oSj+DbFtyOhTuNinR5aBY5tAagEWwdoQuzUlRF7H/qwDCY9gLn6dGZr/xDfA2fe86
 JIW7l2GYqoKert1w=
X-Received: by 2002:adf:e74e:: with SMTP id c14mr43648122wrn.143.1593877190108; 
 Sat, 04 Jul 2020 08:39:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjnfcSH3EG5UKTwABJ/4LKUdBUBcDeNizmIjl25mkK7GKnfOC2qP/XZGKJMftsfGb2dy4yLA==
X-Received: by 2002:adf:e74e:: with SMTP id c14mr43648104wrn.143.1593877189914; 
 Sat, 04 Jul 2020 08:39:49 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id f16sm16575426wmf.17.2020.07.04.08.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:39:49 -0700 (PDT)
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
Subject: [RFC PATCH v2 07/23] hw/display/blizzard: Emit warning when old code
 is used
Date: Sat,  4 Jul 2020 17:38:52 +0200
Message-Id: <20200704153908.12118-8-philmd@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:15
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
X-List-Received-Date: Sat, 04 Jul 2020 15:39:57 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/blizzard.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
index 105241577d..74557b152b 100644
--- a/hw/display/blizzard.c
+++ b/hw/display/blizzard.c
@@ -23,6 +23,7 @@
 #include "ui/console.h"
 #include "hw/display/blizzard.h"
 #include "ui/pixel_ops.h"
+#include "hw/qdev-deprecated.h"
 
 typedef void (*blizzard_fn_t)(uint8_t *, const uint8_t *, unsigned int);
 
@@ -1010,6 +1011,8 @@ void *s1d13745_init(qemu_irq gpio_int)
     BlizzardState *s = (BlizzardState *) g_malloc0(sizeof(*s));
     DisplaySurface *surface;
 
+    qdev_warn_deprecated_function_used();
+
     s->fb = g_malloc(0x180000);
 
     s->con = graphic_console_init(NULL, 0, &blizzard_ops, s);
-- 
2.21.3


