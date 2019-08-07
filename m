Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvGdz-0001MO-Mx
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 03:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36735)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGdu-00016x-Jn
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:45:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGds-00089Z-TA
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:45:54 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42813)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hvGdm-00082h-91; Wed, 07 Aug 2019 03:45:46 -0400
Received: by mail-pl1-x643.google.com with SMTP id ay6so39529267plb.9;
 Wed, 07 Aug 2019 00:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=22OUNLHIuaiTt9aSMUQBk/o0JnEHWgUDvI8KUvBr+sQ=;
 b=SRqIRKis4jDiqQCnUhI0FRdJa2ZK9u+TlEAJevcNJaqvxoZsDva55jDQBW6aLM/f2E
 pLydbmn2SLLYqt0dA9sahonV0jYI5XrSZWI8tdr4rSw4VnyeY9VOpfuS+GyXVop7Dt4u
 K5XI2N30EpN1Ts/uJQBCd8AwWYvWSP3ShX4pNzKBZQoF88nFufiBQU9Ggdt1ft10sLGf
 5vMKDeUEbO6CLj1nX6V2DhWxokNiyXmBOhZda2NTR/1jzvSNuPCxrfPgLy/DeguH63Hc
 3kkFWE24VJN4bHArlQJlEhnz/j8BJRinmk9vDqJ3+fpQztEUIomMwx8/sTOCF8kK9Rzy
 LbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=22OUNLHIuaiTt9aSMUQBk/o0JnEHWgUDvI8KUvBr+sQ=;
 b=BsLatY6XviNAMNNCMeajxj7GpHOyDr459ukXJ4KBfsPbE2I1MYo0t74ZNn9WBIkY/5
 bsUK6fHS0IFWPw/L7EDNgjaA6pwjAAOhMK02lRxVHSpnR+OL83JdzFfiF/bVN02RPHIq
 eCQHGmRXaMb1gz+0zgYRzwcmjturDHEdn9YVsKxiN1U33abGXb8ilLBP73sdpfc738bK
 G2GuWfPNZmk7sBT4JavbEYUHnTDdtkH/7cBKKcQLlO8HIN6vieYMNXFeXqLZjXbSkC3Q
 FUv7N989O9Kv/CJ5dtWMGh0bk/ZcXCMLpWvuo7NJcUnsedGgrdpZdvuRuW6qQDxtgOj4
 29FA==
X-Gm-Message-State: APjAAAXHqO5k6eLOjg+70RUSyz5CWbyYPC2bMa60EINNWkPw8D5Ahy0Y
 ONDr4OM9N5gTvN1YTy6smTE=
X-Google-Smtp-Source: APXvYqwSaa84Kfj1r0fbcw/qXbn1foQFKVmOceHfg6DzpbhCPErvJ1HVo3ZxuuJRuhL4jNryFCNpxA==
X-Received: by 2002:a63:2bd2:: with SMTP id r201mr6453372pgr.193.1565163942533; 
 Wed, 07 Aug 2019 00:45:42 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id l44sm20154449pje.29.2019.08.07.00.45.41
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 00:45:41 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Wed,  7 Aug 2019 00:45:07 -0700
Message-Id: <1565163924-18621-12-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-riscv] [PATCH v2 11/28] riscv: sifive: Rename sifive_prci.{c,
 h} to sifive_e_prci.{c, h}
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
X-List-Received-Date: Wed, 07 Aug 2019 07:45:57 -0000

Current SiFive PRCI model only works with sifive_e machine, as it
only emulates registers or PRCI block in the FE310 SoC.

Rename the file name to make it clear that it is for sifive_e.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

Changes in v2: None

 hw/riscv/Makefile.objs                              |  2 +-
 hw/riscv/sifive_e.c                                 |  4 ++--
 hw/riscv/{sifive_prci.c => sifive_e_prci.c}         | 14 +++++++-------
 include/hw/riscv/{sifive_prci.h => sifive_e_prci.h} | 14 +++++++-------
 4 files changed, 17 insertions(+), 17 deletions(-)
 rename hw/riscv/{sifive_prci.c => sifive_e_prci.c} (90%)
 rename include/hw/riscv/{sifive_prci.h => sifive_e_prci.h} (82%)

diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
index eb9d4f9..c859697 100644
--- a/hw/riscv/Makefile.objs
+++ b/hw/riscv/Makefile.objs
@@ -2,9 +2,9 @@ obj-y += boot.o
 obj-$(CONFIG_SPIKE) += riscv_htif.o
 obj-$(CONFIG_HART) += riscv_hart.o
 obj-$(CONFIG_SIFIVE_E) += sifive_e.o
+obj-$(CONFIG_SIFIVE_E) += sifive_e_prci.o
 obj-$(CONFIG_SIFIVE) += sifive_clint.o
 obj-$(CONFIG_SIFIVE) += sifive_gpio.o
-obj-$(CONFIG_SIFIVE) += sifive_prci.o
 obj-$(CONFIG_SIFIVE) += sifive_plic.o
 obj-$(CONFIG_SIFIVE) += sifive_test.o
 obj-$(CONFIG_SIFIVE_U) += sifive_u.o
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 2a499d8..2d67670 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -41,9 +41,9 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_plic.h"
 #include "hw/riscv/sifive_clint.h"
-#include "hw/riscv/sifive_prci.h"
 #include "hw/riscv/sifive_uart.h"
 #include "hw/riscv/sifive_e.h"
+#include "hw/riscv/sifive_e_prci.h"
 #include "hw/riscv/boot.h"
 #include "chardev/char.h"
 #include "sysemu/arch_init.h"
@@ -174,7 +174,7 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
     sifive_mmio_emulate(sys_mem, "riscv.sifive.e.aon",
         memmap[SIFIVE_E_AON].base, memmap[SIFIVE_E_AON].size);
-    sifive_prci_create(memmap[SIFIVE_E_PRCI].base);
+    sifive_e_prci_create(memmap[SIFIVE_E_PRCI].base);
 
     /* GPIO */
 
diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_e_prci.c
similarity index 90%
rename from hw/riscv/sifive_prci.c
rename to hw/riscv/sifive_e_prci.c
index f406682..acb914d 100644
--- a/hw/riscv/sifive_prci.c
+++ b/hw/riscv/sifive_e_prci.c
@@ -1,5 +1,5 @@
 /*
- * QEMU SiFive PRCI (Power, Reset, Clock, Interrupt)
+ * QEMU SiFive E PRCI (Power, Reset, Clock, Interrupt)
  *
  * Copyright (c) 2017 SiFive, Inc.
  *
@@ -22,7 +22,7 @@
 #include "hw/sysbus.h"
 #include "qemu/module.h"
 #include "target/riscv/cpu.h"
-#include "hw/riscv/sifive_prci.h"
+#include "hw/riscv/sifive_e_prci.h"
 
 static uint64_t sifive_prci_read(void *opaque, hwaddr addr, unsigned int size)
 {
@@ -82,10 +82,10 @@ static const MemoryRegionOps sifive_prci_ops = {
 
 static void sifive_prci_init(Object *obj)
 {
-    SiFivePRCIState *s = SIFIVE_PRCI(obj);
+    SiFivePRCIState *s = SIFIVE_E_PRCI(obj);
 
     memory_region_init_io(&s->mmio, obj, &sifive_prci_ops, s,
-                          TYPE_SIFIVE_PRCI, 0x8000);
+                          TYPE_SIFIVE_E_PRCI, 0x8000);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 
     s->hfrosccfg = (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI_HFROSCCFG_EN);
@@ -97,7 +97,7 @@ static void sifive_prci_init(Object *obj)
 }
 
 static const TypeInfo sifive_prci_info = {
-    .name          = TYPE_SIFIVE_PRCI,
+    .name          = TYPE_SIFIVE_E_PRCI,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(SiFivePRCIState),
     .instance_init = sifive_prci_init,
@@ -114,9 +114,9 @@ type_init(sifive_prci_register_types)
 /*
  * Create PRCI device.
  */
-DeviceState *sifive_prci_create(hwaddr addr)
+DeviceState *sifive_e_prci_create(hwaddr addr)
 {
-    DeviceState *dev = qdev_create(NULL, TYPE_SIFIVE_PRCI);
+    DeviceState *dev = qdev_create(NULL, TYPE_SIFIVE_E_PRCI);
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
     return dev;
diff --git a/include/hw/riscv/sifive_prci.h b/include/hw/riscv/sifive_e_prci.h
similarity index 82%
rename from include/hw/riscv/sifive_prci.h
rename to include/hw/riscv/sifive_e_prci.h
index bd51c4a..7932fe7 100644
--- a/include/hw/riscv/sifive_prci.h
+++ b/include/hw/riscv/sifive_e_prci.h
@@ -1,5 +1,5 @@
 /*
- * QEMU SiFive PRCI (Power, Reset, Clock, Interrupt) interface
+ * QEMU SiFive E PRCI (Power, Reset, Clock, Interrupt) interface
  *
  * Copyright (c) 2017 SiFive, Inc.
  *
@@ -16,8 +16,8 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef HW_SIFIVE_PRCI_H
-#define HW_SIFIVE_PRCI_H
+#ifndef HW_SIFIVE_E_PRCI_H
+#define HW_SIFIVE_E_PRCI_H
 
 enum {
     SIFIVE_PRCI_HFROSCCFG   = 0x0,
@@ -47,10 +47,10 @@ enum {
     SIFIVE_PRCI_PLLOUTDIV_DIV1  = (1 << 8)
 };
 
-#define TYPE_SIFIVE_PRCI "riscv.sifive.prci"
+#define TYPE_SIFIVE_E_PRCI      "riscv.sifive.e.prci"
 
-#define SIFIVE_PRCI(obj) \
-    OBJECT_CHECK(SiFivePRCIState, (obj), TYPE_SIFIVE_PRCI)
+#define SIFIVE_E_PRCI(obj) \
+    OBJECT_CHECK(SiFivePRCIState, (obj), TYPE_SIFIVE_E_PRCI)
 
 typedef struct SiFivePRCIState {
     /*< private >*/
@@ -64,6 +64,6 @@ typedef struct SiFivePRCIState {
     uint32_t plloutdiv;
 } SiFivePRCIState;
 
-DeviceState *sifive_prci_create(hwaddr addr);
+DeviceState *sifive_e_prci_create(hwaddr addr);
 
 #endif
-- 
2.7.4


