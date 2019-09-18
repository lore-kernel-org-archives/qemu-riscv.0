Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsS-00078h-Nx
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49395)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsM-0006yK-Ut
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsL-0006ki-Hh
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:14 -0400
Received: from mail-pg1-f180.google.com ([209.85.215.180]:42969)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsL-0006k0-0B
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:13 -0400
Received: by mail-pg1-f180.google.com with SMTP id z12so33409pgp.9
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=KCqazI/HGpARV6iRaKwxJd00KfwFI0UZc3AfbfiROjY=;
 b=hj4yY51hDOenKK51isBoLuQOfKi6/7RTtjnTayI+pTS3m6nl2C/xmuloifsxg7Worg
 66j+6cmHXWTIC3nLr9efwtWZMkw0nW7zXYqnRmWhs+sxZArmy26IThd4wpzVQz3jPnKs
 3u+Lga7DViAUtJ2HrvX8b91RNQVwoNAv67RpW4s5hiTzydajwJuDRRlc/4ljDzNYPr61
 +skJ13QKKa9sJIrAwwuEdE4PfY1ZKMcEnx7oZ0YmKFtkoJN9+6XhwJvPVJziscZccyz3
 zEzItWDYJN56nxbJL1QpKF10l86DC0V320b9WzO0a5b7b3g83s99A+MdgNviW/qBubmy
 3hIg==
X-Gm-Message-State: APjAAAUKNPRDg2Dg6drth7Af77DHjctkIg6pFkXK8K1sf7jqMXNV22Et
 gt1HcZb1iXiCpkmEXXrV5++TW5Rt5Og=
X-Google-Smtp-Source: APXvYqyCHQNJ0TL5sGz229DHxOjSjO3GfpFHbHCXsXu+mj78TVER6BUEtdDdVL59ZDoLIKWFGCMqxQ==
X-Received: by 2002:a63:ec12:: with SMTP id j18mr4437209pgh.327.1568820491407; 
 Wed, 18 Sep 2019 08:28:11 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id d20sm10884860pfq.88.2019.09.18.08.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:10 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:11 -0700
Message-Id: <20190918145640.17349-20-palmer@sifive.com>
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
X-Received-From: 209.85.215.180
Subject: [Qemu-riscv] [PULL 19/48] riscv: hw: Change to use
 qemu_log_mask(LOG_GUEST_ERROR, ...) instead
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:19 -0000

From: Bin Meng <bmeng.cn@gmail.com>

Replace the call to hw_error() with qemu_log_mask(LOG_GUEST_ERROR,...)
in various sifive models.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_prci.c | 8 +++++---
 hw/riscv/sifive_test.c | 5 +++--
 hw/riscv/sifive_uart.c | 9 +++++----
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_prci.c
index 562bc3dc4c..982fbb26fd 100644
--- a/hw/riscv/sifive_prci.c
+++ b/hw/riscv/sifive_prci.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "target/riscv/cpu.h"
 #include "hw/hw.h"
@@ -38,7 +39,8 @@ static uint64_t sifive_prci_read(void *opaque, hwaddr addr, unsigned int size)
     case SIFIVE_PRCI_PLLOUTDIV:
         return s->plloutdiv;
     }
-    hw_error("%s: read: addr=0x%x\n", __func__, (int)addr);
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: read: addr=0x%x\n",
+                  __func__, (int)addr);
     return 0;
 }
 
@@ -66,8 +68,8 @@ static void sifive_prci_write(void *opaque, hwaddr addr,
         s->plloutdiv = (uint32_t) val64;
         break;
     default:
-        hw_error("%s: bad write: addr=0x%x v=0x%x\n",
-                 __func__, (int)addr, (int)val64);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=0x%x v=0x%x\n",
+                      __func__, (int)addr, (int)val64);
     }
 }
 
diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
index 711740939e..aa544e7428 100644
--- a/hw/riscv/sifive_test.c
+++ b/hw/riscv/sifive_test.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
 #include "target/riscv/cpu.h"
@@ -49,8 +50,8 @@ static void sifive_test_write(void *opaque, hwaddr addr,
             break;
         }
     }
-    hw_error("%s: write: addr=0x%x val=0x%016" PRIx64 "\n",
-        __func__, (int)addr, val64);
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: write: addr=0x%x val=0x%016" PRIx64 "\n",
+                  __func__, (int)addr, val64);
 }
 
 static const MemoryRegionOps sifive_test_ops = {
diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
index 9de42b1680..215990b443 100644
--- a/hw/riscv/sifive_uart.c
+++ b/hw/riscv/sifive_uart.c
@@ -18,6 +18,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/log.h"
 #include "hw/sysbus.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
@@ -95,8 +96,8 @@ uart_read(void *opaque, hwaddr addr, unsigned int size)
         return s->div;
     }
 
-    hw_error("%s: bad read: addr=0x%x\n",
-        __func__, (int)addr);
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=0x%x\n",
+                  __func__, (int)addr);
     return 0;
 }
 
@@ -127,8 +128,8 @@ uart_write(void *opaque, hwaddr addr,
         s->div = val64;
         return;
     }
-    hw_error("%s: bad write: addr=0x%x v=0x%x\n",
-        __func__, (int)addr, (int)value);
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=0x%x v=0x%x\n",
+                  __func__, (int)addr, (int)value);
 }
 
 static const MemoryRegionOps uart_ops = {
-- 
2.21.0


