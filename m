Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xw5-0007wm-5d
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57306)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xw0-0007px-7o
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvy-0006Zd-Sr
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:04 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41438)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xvy-0006ZM-NR
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:02 -0400
Received: by mail-wr1-f66.google.com with SMTP id h7so22433544wrw.8
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=KCqazI/HGpARV6iRaKwxJd00KfwFI0UZc3AfbfiROjY=;
 b=Pvg1b+JM9v37EVkYcGRmcvOaPj990jvIOVRVQ21dUxabA0/gamUDSmiIzl2O+O2ajB
 6H1QOwNsr9llf05hqoKe/5jgHbX4dLLh37OAiTloFCgfmIey8SLQRKn8QHWN9X5yBpgK
 aq5AyF7yIoYUuubAk8+K23apWd9ttin3XtPmy3MYPWaZDDkOiqDLag05DaNyS79WE4ic
 0gCNM8c87apnlLagWesHeWnPR/WPrXw3y9o8mMR4F8TzJMwdRPHh+/I88T0D25GRMmAZ
 GEy1DZOPQoD6tA78CJKAiVpLEfjHGBNiZzQnw/NvHmhndD0t/OmGVelCXQx8W+tq6eRt
 JU9g==
X-Gm-Message-State: APjAAAXEwRkYid00Bm8iuyrMiKBZMadBKs62WEc5ULTfmquxd7c6KrQq
 GrsWF6+4/I+CasAvQ0LL7oTdpqO/rgijVg==
X-Google-Smtp-Source: APXvYqxUziEu+EhEJJDoUoqZ9MA/qNu6FanQT+HElJxKoc/4HrXS657uPmvFgzK+X7tmFdWH4jwtiA==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr6566190wru.335.1568190301373; 
 Wed, 11 Sep 2019 01:25:01 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id x6sm3133853wmf.38.2019.09.11.01.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:00 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:45 -0700
Message-Id: <20190910190513.21160-20-palmer@sifive.com>
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
X-Received-From: 209.85.221.66
Subject: [Qemu-riscv] [PULL 19/47] riscv: hw: Change to use
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:07 -0000

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


