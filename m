Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkGj-0001UL-09
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGf-0001PA-G3
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:39:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25061
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGU-0007WI-30
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rks+Tfho7iTcd0gXl80y4nGQ128O77rhCXPnXo+rESA=;
 b=d1mUZEWwp7H2orldx1KgtO+K469gqlZcutQOWDq8XzHQsdAJVQA5C1Ig0iRR3bTYdOR3u6
 96CPkP0bw8i18zqRDoKK5od7oJlb83KCogJKnpL35oVz+QTnT8eTUgoqbJuJbp0vXTG4r/
 yyOwEcGvAl5KdK+FzprzQFBmZB8+D/8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-nKdl4lfsN5em1vj5CbZMOQ-1; Sat, 04 Jul 2020 11:39:39 -0400
X-MC-Unique: nKdl4lfsN5em1vj5CbZMOQ-1
Received: by mail-wr1-f72.google.com with SMTP id j5so35935391wro.6
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rks+Tfho7iTcd0gXl80y4nGQ128O77rhCXPnXo+rESA=;
 b=cQzHy29fT1xRGUtMCBuFf7ZChuB+szchtWGoRB78r8lKz3+mNpvk5qYz3nV7W9RvK1
 08luL+lNWnrtcy1SJjqjNXMKVF9MtA8x6Iapo3oc2FF44XqJh7txIHC7F4ixVV0zZ014
 xYqtTFflCQwpTkAZ6z9Vs0M0xgCetUAdQBW5zcjZUgwWrTOAjyUKaE9MzYymIgLtzVXb
 Xgjq5cEhKf3iJJIHEeIMLTY9d5d+OeCi25mTWV0PILipUneDbeybBhR5gAUB/+sGcuiG
 xvaeR2kEQpCzek986o/flLZXrxbmoLierWJuHgAsM7jnakIUnbMav33HKXbjZPdSU+Th
 w88Q==
X-Gm-Message-State: AOAM531D71A9+H5QpdklqBZyIuCzF4338j4JNp16ksv+Dbf0ZERSICc2
 JTBJlqGhv5/kUnTdh8yv5QT6HChUjQfdCe9I0+yr2gBw5PN8QcP3wNaaxlVKbxltc+dXmcTmP9R
 YNOnJQFPYdbP1y+8=
X-Received: by 2002:a1c:9a06:: with SMTP id c6mr3150437wme.23.1593877178605;
 Sat, 04 Jul 2020 08:39:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxB1gKgaHOBS47S3MJ/UYF2A0WCTc6kX7+rFK8WZCuTwFtAIA5kSKscovRMBnoqAVy0TebZQ==
X-Received: by 2002:a1c:9a06:: with SMTP id c6mr3150423wme.23.1593877178454;
 Sat, 04 Jul 2020 08:39:38 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id t16sm18660887wru.9.2020.07.04.08.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:39:37 -0700 (PDT)
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
Subject: [RFC PATCH v2 05/23] hw/arm/nseries: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:38:50 +0200
Message-Id: <20200704153908.12118-6-philmd@redhat.com>
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
X-List-Received-Date: Sat, 04 Jul 2020 15:39:54 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/nseries.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 428a2a2c5a..e647ec32e3 100644
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


