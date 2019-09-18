Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsT-0007AN-IJ
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49416)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsO-00071X-83
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsM-0006lo-Q7
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:15 -0400
Received: from mail-pl1-f176.google.com ([209.85.214.176]:36011)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsM-0006lD-KU
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:14 -0400
Received: by mail-pl1-f176.google.com with SMTP id f19so125461plr.3
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=G7Nvco3Ed4SzCOF6c1+pxFi6zNWbYlWlCIq1YYzo3nE=;
 b=iSFRXD7xnStaU7j7DHcTxpjfj6YwfFoGfFMA820aLsPQDOy8AQEVBA8p+GCXzI+PKI
 Qw/IiCbXzkq5daB8fc60t5yqH4YVh6YS9zrzov92TINdkQ9JhUdj5yTv2jRtC76RwTYd
 wXCT0PuCpnF4RkTZlM2ss6axGV65FwEfcBN+0wdEmAAV2zj6lP/EL2FZDvRde10TPiMp
 /m5ly2bhIfGQzMolxAbUXiearTpaueQcWXq7O9TDdje4+T5jLwRTNnfooWE9hiDBdSEA
 4HHc7Hd2eevpklyUP17csU9c5IRQro1EZYQRTIcFmGwiwW6YFwXV5cyWC60CK1J0LrAg
 I9uQ==
X-Gm-Message-State: APjAAAUtlwCPL9NBBEvJcHINdaOTjPoFZs+7FxZw3zAahckuJ6sXDRRn
 PRZbbBZFy/25fntWeQ5jfI7OZmNzV1g=
X-Google-Smtp-Source: APXvYqwIOma6cOn7KB0pxWbpMJAZmnQU6FbRlF/vme2tkNn77uuak9fR0IKIgozI8ljAe2uwn3or8w==
X-Received: by 2002:a17:902:7797:: with SMTP id
 o23mr4671797pll.247.1568820493245; 
 Wed, 18 Sep 2019 08:28:13 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id j23sm7217453pfn.75.2019.09.18.08.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:12 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:12 -0700
Message-Id: <20190918145640.17349-21-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.176
Subject: [Qemu-riscv] [PULL 20/48] riscv: hw: Remove the unnecessary include
 of target/riscv/cpu.h
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:20 -0000

From: Bin Meng <bmeng.cn@gmail.com>

The inclusion of "target/riscv/cpu.h" is unnecessary in various
sifive model drivers.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_prci.c | 1 -
 hw/riscv/sifive_test.c | 1 -
 hw/riscv/sifive_uart.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_prci.c
index 982fbb26fd..c413f0cb76 100644
--- a/hw/riscv/sifive_prci.c
+++ b/hw/riscv/sifive_prci.c
@@ -22,7 +22,6 @@
 #include "hw/sysbus.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
-#include "target/riscv/cpu.h"
 #include "hw/hw.h"
 #include "hw/riscv/sifive_prci.h"
 
diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
index aa544e7428..339195c6ff 100644
--- a/hw/riscv/sifive_test.c
+++ b/hw/riscv/sifive_test.c
@@ -23,7 +23,6 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
-#include "target/riscv/cpu.h"
 #include "hw/hw.h"
 #include "hw/riscv/sifive_test.h"
 
diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
index 215990b443..a403ae90f5 100644
--- a/hw/riscv/sifive_uart.c
+++ b/hw/riscv/sifive_uart.c
@@ -22,7 +22,6 @@
 #include "hw/sysbus.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
-#include "target/riscv/cpu.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/riscv/sifive_uart.h"
-- 
2.21.0


