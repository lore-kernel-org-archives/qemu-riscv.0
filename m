Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrkHh-0002zR-Uq
	for mharc-qemu-riscv@gnu.org; Sat, 04 Jul 2020 11:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHd-0002w2-S4
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53270
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHa-0008Ju-7f
 for qemu-riscv@nongnu.org; Sat, 04 Jul 2020 11:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7tSIIx0YAEULmCHrXDbhmRzYLD86lXGUTjUWu9J2Gg=;
 b=KuPubh4J19CZdhy/zPAbbXfOqOvTcQ5FpDUfISEwK8KnGSaL+6oxwi7wO5za2QmVpPgFKD
 SfQqPaHl9y4ceugw8yUfFHR6rntNsEqdzNHH+SY0Q5BUeYKVS4PIUi93OlR3wEphndbHMy
 SB4XAXhUn/GhvDZOHjimvG3IK44lFLk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-aL2yYq2bMS6rWn199nCrbg-1; Sat, 04 Jul 2020 11:40:44 -0400
X-MC-Unique: aL2yYq2bMS6rWn199nCrbg-1
Received: by mail-wm1-f71.google.com with SMTP id f68so18805670wmf.1
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2020 08:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7tSIIx0YAEULmCHrXDbhmRzYLD86lXGUTjUWu9J2Gg=;
 b=qTIhxKOzeImOJCQlQsjXqSPcYvuCFEY1tUhMPfNiryJqbHp9ul9G7qXUF53C9iKuQH
 Kh2EFzsyAJppsOp2uDBydhVlZJC1karcm9zgrVg7cRAmHEatel7g4K50h46Z9yYv+xy4
 nQUGyxJNxY7DoS5MnFL41tmPj0Hig9fM9L49sGAS/GWcorGfegUt7gTg1dk1dQaxpjgU
 xTTUGTbcmzGEpcL2wJLtLRPet+/2kbVVXX5IuIjq5HNduNGxqoie62nz6in0HTC3Gzdb
 1hwSBo40gk/2hCJG6bEf/QakJsGpFD5T5S35SF+tJHQIbBfep3TBDn5QzjM5YNc+5F0t
 oO3w==
X-Gm-Message-State: AOAM530cCblQpWpk1WT/ne7l/BZrifAsZFg8HC/oq3mevmdXWyzvrRci
 KxY9z52rhhUJXO6AD98bveoDYzbQ4Asj666tNuYuLId30ymSYzjg6AO21yfyV+WWlPrZfgENlJB
 /80fb+yk3VKQkhU0=
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr40996380wrj.265.1593877243515; 
 Sat, 04 Jul 2020 08:40:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQIKLMWFxNGm+uuZl3W/8KNm9CfIgW+kgC0ZhT9nNbjtg+gssdP3TvkF5C2DIW+SRqj3+qeQ==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr40996372wrj.265.1593877243337; 
 Sat, 04 Jul 2020 08:40:43 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id u8sm16661313wrt.28.2020.07.04.08.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:42 -0700 (PDT)
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
Subject: [RFC PATCH v2 17/23] hw/nvram/eeprom93xx: Emit warning when old code
 is used
Date: Sat,  4 Jul 2020 17:39:02 +0200
Message-Id: <20200704153908.12118-18-philmd@redhat.com>
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
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:14
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
X-List-Received-Date: Sat, 04 Jul 2020 15:40:54 -0000

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


