Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i6Gyd-0004Y5-JB
	for mharc-qemu-riscv@gnu.org; Fri, 06 Sep 2019 12:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56329)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i6GyV-0004KU-I6
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2019 12:20:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i6GyT-0004HU-VM
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2019 12:20:39 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:44671)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i6GyQ-0004CN-5k; Fri, 06 Sep 2019 12:20:34 -0400
Received: by mail-pf1-x441.google.com with SMTP id q21so4809596pfn.11;
 Fri, 06 Sep 2019 09:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=vf7a8GCMbH83cRyflZHrepWCwbI1OlbfFZDZAklT6m8=;
 b=P8ZVrJILT1oyV7kohEAYnYyZFK0fCScG916ArPrhWJIoi3lfhCzqELoiJ0zSGgA8Vp
 SI/ovMsI6+4SQqOyYKPWhwcJinx/9cGwA9GZu8ezOxhAgFEoA3La4wmWn+5fqFSTmOGO
 SyqHIh/iZyBUeLxBOBfuKQPYAlubnoSjwpMhodBIaZLoOtNRx6iGkpRNK1XqGnd46tZu
 2NGoiy4RHCoLl9JiADLRS3dvJTiyzTtHRkIcfFfsMuDFQwDKeRML2kttkkG65aBR1tCq
 yUz3t14lXSnR3EyXaQpZrxzyFcFP0e+1J+AWSreuYPkHycwKIojemAIJDb0TDDEK8PFC
 G3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=vf7a8GCMbH83cRyflZHrepWCwbI1OlbfFZDZAklT6m8=;
 b=XmyK9AYEQrYo2pU8oBR8LomXXxuYWIktyg7t2E2SJhJgmkHjnhaO3DxswZglTnd8u6
 8t8evv3Xg3DPewib+jLneYlzqN1AgpQM7FbbB1IAzNjfrFZw2dDmJrvnMZQNoU6p9ywL
 SOpTXV8FtM3PjKItIo19hYrkKEV3f8YoICDAFO/BEedr/pTys5vK624w8f5RQQYB3z0j
 hVPHQIMnh24rTx7kYu88yADS/KTHxXDnbz8jEsdkh0Alojcdj9f7RvT5z3bnN87UYY4g
 OxTq56hk28N1JqMQ/Bde2kdg9I25zE2w/7PM5wIRDx+qvBZkuVG6CwXHFNFlCOqXBbjo
 XU9Q==
X-Gm-Message-State: APjAAAVrt1o3vOr1cLYtrVt+Go7Jf77FuN+WrrFgZMfGN2AtlHvF6kO+
 1PmB+nVD+RmObgYwtfbRcxU=
X-Google-Smtp-Source: APXvYqy/eQSkf0haQsoe9p/j08UXcDdQXmEq9NRWaH5cKxARFuK1HbJshoDTLsxSnXnaezNLopD76g==
X-Received: by 2002:a62:1603:: with SMTP id 3mr11794310pfw.0.1567786833348;
 Fri, 06 Sep 2019 09:20:33 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id f89sm11146228pje.20.2019.09.06.09.20.32
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 09:20:32 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Fri,  6 Sep 2019 09:19:54 -0700
Message-Id: <1567786819-22142-8-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567786819-22142-1-git-send-email-bmeng.cn@gmail.com>
References: <1567786819-22142-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-riscv] [PATCH v8 07/32] riscv: hw: Change to use
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
X-List-Received-Date: Fri, 06 Sep 2019 16:20:42 -0000

Replace the call to hw_error() with qemu_log_mask(LOG_GUEST_ERROR,...)
in various sifive models.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5:
- new patch to change to use qemu_log_mask(LOG_GUEST_ERROR,...) instead
  in various sifive models

Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_prci.c | 8 +++++---
 hw/riscv/sifive_test.c | 5 +++--
 hw/riscv/sifive_uart.c | 9 +++++----
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_prci.c
index 562bc3d..982fbb2 100644
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
index 7117409..aa544e7 100644
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
index 9de42b1..215990b 100644
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
2.7.4


