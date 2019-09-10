Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xvy-0007n4-Dw
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57190)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvt-0007dw-CE
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvs-0006VA-98
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:57 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35180)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xvs-0006Un-45
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:56 -0400
Received: by mail-wr1-f68.google.com with SMTP id g7so23512990wrx.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=EmC0jz3GTl2BrX2tWMEAqndIZJCvRtbADNjHP8GTEXU=;
 b=uAcrunKUoJQnVlxAnxBO9YE9ZJ0Lk9DM3ky6/Wu0+sJNl/cjQipL22I/VUKE5mrq5j
 vRgQ57QKb780ZgAtzSORc6C9krRkUMyB9r5lhvWgmasIYvN1sDo6GYwmUJd8NAcbwCdO
 V09gLDW6jkZxz2s/gfCc4f4JfOUOph4Fk2sZKQH4GNJKoETrwwdsHlezw3V9sQgIyYV0
 10nivLSGVOPpz6kfkkOFFI73YBChAI78YrW/4fe52bkQWeTlpk3VKilQ7dNKsf8aT4yC
 PSio6ApLtmsiB9Q3ojQwbeOn3PcyoPTN271GVFxoTJEqd5iVn1cm/uUnm20vt/5l1fBv
 Rb2Q==
X-Gm-Message-State: APjAAAXW+gKtHeb2UkR5xy5yJnXU/fZDcXB9U/oPZXbvSv+jRnwkjZBq
 ++Ngk+Jy9zD1GFIXFV80PMNLV9xixq+OUQ==
X-Google-Smtp-Source: APXvYqxX2mfqKW+Onp1mVznhxDuMGzXtQS5BdN1yvcP5UsZqx5n3GPrbXDJcfaSISVN+7uW/n3RpoQ==
X-Received: by 2002:a5d:68c9:: with SMTP id p9mr29574469wrw.95.1568190294704; 
 Wed, 11 Sep 2019 01:24:54 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id x6sm3092127wmf.35.2019.09.11.01.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:24:54 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:40 -0700
Message-Id: <20190910190513.21160-15-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: [Qemu-riscv] [PULL 14/47] riscv: hw: Remove duplicated "hw/hw.h"
 inclusion
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:00 -0000

From: Bin Meng <bmeng.cn@gmail.com>

Commit a27bd6c779ba ("Include hw/qdev-properties.h less") wrongly
added "hw/hw.h" to sifive_prci.c and sifive_test.c.

Another inclusion of "hw/hw.h" was later added via
commit 650d103d3ea9 ("Include hw/hw.h exactly where needed"), that
resulted in duplicated inclusion of "hw/hw.h".

Fixes: a27bd6c779ba ("Include hw/qdev-properties.h less")
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_prci.c | 1 -
 hw/riscv/sifive_test.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_prci.c
index 9837b6166f..562bc3dc4c 100644
--- a/hw/riscv/sifive_prci.c
+++ b/hw/riscv/sifive_prci.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/hw.h"
 #include "hw/sysbus.h"
 #include "qemu/module.h"
 #include "target/riscv/cpu.h"
diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
index 3557e16701..711740939e 100644
--- a/hw/riscv/sifive_test.c
+++ b/hw/riscv/sifive_test.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/hw.h"
 #include "hw/sysbus.h"
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
-- 
2.21.0


