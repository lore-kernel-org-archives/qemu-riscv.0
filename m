Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwC-00086N-Cb
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xw6-0007yb-GG
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xw4-0006cP-AC
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:10 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:37634)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xw4-0006c0-47
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:08 -0400
Received: by mail-wm1-f49.google.com with SMTP id r195so2394290wme.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=uaaeDV21osAF1X52o0hd+ZKqnU6X+y3n6S/4tLEW+sw=;
 b=DSdrLfNcy4FjbGfarDXD4wkNsJn1tPOYeAKtukwi66CMQAuAnw3/Y9uYupaRm7BCcz
 j49azGCEP/30hlG3tM5KWKxt/EpBwWpGaEX/HKGAYcBEZRQugJtvLfemORLwoBwR1g7e
 Fbm94B9woYGawn7OQ343jwshinUiDlL2B7BkpCl9cd/9l8Z7OIA8/9AS8JrpEQzzR2uW
 JJYhgCeebGrt3khL+ZLPNDt32TUJulD3sgG2XqSZ7ct+UQH3Or55TT1FcWcB6VR8XDjx
 8+CWQT6FfL0iR3ExMUp/nvLS3lX8dybupP5Y0oeSvplyp3GWAkbmjco/CvJ2xBR4JTkS
 vE4Q==
X-Gm-Message-State: APjAAAUqYTrNXHAquo5VG9nNiLn+6qWwGopv2GoAU+1j5R23junPNemK
 kF9N/RU8b5TqIlzaevgWqv+xkdDDHkpJxw==
X-Google-Smtp-Source: APXvYqxQr/1MhDZW3sHoB/kDGjjqe0KjoFnhMuQYuXEN6Fsv9Sl83jb8Mgzy0eF4OxFReGPRkw4BEw==
X-Received: by 2002:a05:600c:289:: with SMTP id 9mr2549809wmk.61.1568190306437; 
 Wed, 11 Sep 2019 01:25:06 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id x9sm7041816wru.26.2019.09.11.01.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:06 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:49 -0700
Message-Id: <20190910190513.21160-24-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.49
Subject: [Qemu-riscv] [PULL 23/47] riscv: sifive: Rename sifive_prci.{c,
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:14 -0000

From: Bin Meng <bmeng.cn@gmail.com>

Current SiFive PRCI model only works with sifive_e machine, as it
only emulates registers or PRCI block in the FE310 SoC.

Rename the file name to make it clear that it is for sifive_e.
This also prefix "sifive_e"/"SIFIVE_E" for all macros, variables
and functions.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/Makefile.objs                      |  2 +-
 hw/riscv/sifive_e.c                         |  4 +-
 hw/riscv/{sifive_prci.c => sifive_e_prci.c} | 79 ++++++++++-----------
 include/hw/riscv/sifive_e_prci.h            | 69 ++++++++++++++++++
 include/hw/riscv/sifive_prci.h              | 71 ------------------
 5 files changed, 111 insertions(+), 114 deletions(-)
 rename hw/riscv/{sifive_prci.c => sifive_e_prci.c} (51%)
 create mode 100644 include/hw/riscv/sifive_e_prci.h
 delete mode 100644 include/hw/riscv/sifive_prci.h

diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
index eb9d4f9ffc..c8596977a8 100644
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
index 792d75a1a3..1428a99fce 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -40,9 +40,9 @@
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
similarity index 51%
rename from hw/riscv/sifive_prci.c
rename to hw/riscv/sifive_e_prci.c
index c413f0cb76..b6d32db935 100644
--- a/hw/riscv/sifive_prci.c
+++ b/hw/riscv/sifive_e_prci.c
@@ -1,5 +1,5 @@
 /*
- * QEMU SiFive PRCI (Power, Reset, Clock, Interrupt)
+ * QEMU SiFive E PRCI (Power, Reset, Clock, Interrupt)
  *
  * Copyright (c) 2017 SiFive, Inc.
  *
@@ -23,19 +23,19 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/hw.h"
-#include "hw/riscv/sifive_prci.h"
+#include "hw/riscv/sifive_e_prci.h"
 
-static uint64_t sifive_prci_read(void *opaque, hwaddr addr, unsigned int size)
+static uint64_t sifive_e_prci_read(void *opaque, hwaddr addr, unsigned int size)
 {
-    SiFivePRCIState *s = opaque;
+    SiFiveEPRCIState *s = opaque;
     switch (addr) {
-    case SIFIVE_PRCI_HFROSCCFG:
+    case SIFIVE_E_PRCI_HFROSCCFG:
         return s->hfrosccfg;
-    case SIFIVE_PRCI_HFXOSCCFG:
+    case SIFIVE_E_PRCI_HFXOSCCFG:
         return s->hfxosccfg;
-    case SIFIVE_PRCI_PLLCFG:
+    case SIFIVE_E_PRCI_PLLCFG:
         return s->pllcfg;
-    case SIFIVE_PRCI_PLLOUTDIV:
+    case SIFIVE_E_PRCI_PLLOUTDIV:
         return s->plloutdiv;
     }
     qemu_log_mask(LOG_GUEST_ERROR, "%s: read: addr=0x%x\n",
@@ -43,27 +43,27 @@ static uint64_t sifive_prci_read(void *opaque, hwaddr addr, unsigned int size)
     return 0;
 }
 
-static void sifive_prci_write(void *opaque, hwaddr addr,
-           uint64_t val64, unsigned int size)
+static void sifive_e_prci_write(void *opaque, hwaddr addr,
+                                uint64_t val64, unsigned int size)
 {
-    SiFivePRCIState *s = opaque;
+    SiFiveEPRCIState *s = opaque;
     switch (addr) {
-    case SIFIVE_PRCI_HFROSCCFG:
+    case SIFIVE_E_PRCI_HFROSCCFG:
         s->hfrosccfg = (uint32_t) val64;
         /* OSC stays ready */
-        s->hfrosccfg |= SIFIVE_PRCI_HFROSCCFG_RDY;
+        s->hfrosccfg |= SIFIVE_E_PRCI_HFROSCCFG_RDY;
         break;
-    case SIFIVE_PRCI_HFXOSCCFG:
+    case SIFIVE_E_PRCI_HFXOSCCFG:
         s->hfxosccfg = (uint32_t) val64;
         /* OSC stays ready */
-        s->hfxosccfg |= SIFIVE_PRCI_HFXOSCCFG_RDY;
+        s->hfxosccfg |= SIFIVE_E_PRCI_HFXOSCCFG_RDY;
         break;
-    case SIFIVE_PRCI_PLLCFG:
+    case SIFIVE_E_PRCI_PLLCFG:
         s->pllcfg = (uint32_t) val64;
         /* PLL stays locked */
-        s->pllcfg |= SIFIVE_PRCI_PLLCFG_LOCK;
+        s->pllcfg |= SIFIVE_E_PRCI_PLLCFG_LOCK;
         break;
-    case SIFIVE_PRCI_PLLOUTDIV:
+    case SIFIVE_E_PRCI_PLLOUTDIV:
         s->plloutdiv = (uint32_t) val64;
         break;
     default:
@@ -72,9 +72,9 @@ static void sifive_prci_write(void *opaque, hwaddr addr,
     }
 }
 
-static const MemoryRegionOps sifive_prci_ops = {
-    .read = sifive_prci_read,
-    .write = sifive_prci_write,
+static const MemoryRegionOps sifive_e_prci_ops = {
+    .read = sifive_e_prci_read,
+    .write = sifive_e_prci_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid = {
         .min_access_size = 4,
@@ -82,43 +82,42 @@ static const MemoryRegionOps sifive_prci_ops = {
     }
 };
 
-static void sifive_prci_init(Object *obj)
+static void sifive_e_prci_init(Object *obj)
 {
-    SiFivePRCIState *s = SIFIVE_PRCI(obj);
+    SiFiveEPRCIState *s = SIFIVE_E_PRCI(obj);
 
-    memory_region_init_io(&s->mmio, obj, &sifive_prci_ops, s,
-                          TYPE_SIFIVE_PRCI, 0x8000);
+    memory_region_init_io(&s->mmio, obj, &sifive_e_prci_ops, s,
+                          TYPE_SIFIVE_E_PRCI, 0x8000);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 
-    s->hfrosccfg = (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI_HFROSCCFG_EN);
-    s->hfxosccfg = (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI_HFROSCCFG_EN);
-    s->pllcfg = (SIFIVE_PRCI_PLLCFG_REFSEL | SIFIVE_PRCI_PLLCFG_BYPASS |
-                SIFIVE_PRCI_PLLCFG_LOCK);
-    s->plloutdiv = SIFIVE_PRCI_PLLOUTDIV_DIV1;
-
+    s->hfrosccfg = (SIFIVE_E_PRCI_HFROSCCFG_RDY | SIFIVE_E_PRCI_HFROSCCFG_EN);
+    s->hfxosccfg = (SIFIVE_E_PRCI_HFROSCCFG_RDY | SIFIVE_E_PRCI_HFROSCCFG_EN);
+    s->pllcfg = (SIFIVE_E_PRCI_PLLCFG_REFSEL | SIFIVE_E_PRCI_PLLCFG_BYPASS |
+                 SIFIVE_E_PRCI_PLLCFG_LOCK);
+    s->plloutdiv = SIFIVE_E_PRCI_PLLOUTDIV_DIV1;
 }
 
-static const TypeInfo sifive_prci_info = {
-    .name          = TYPE_SIFIVE_PRCI,
+static const TypeInfo sifive_e_prci_info = {
+    .name          = TYPE_SIFIVE_E_PRCI,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(SiFivePRCIState),
-    .instance_init = sifive_prci_init,
+    .instance_size = sizeof(SiFiveEPRCIState),
+    .instance_init = sifive_e_prci_init,
 };
 
-static void sifive_prci_register_types(void)
+static void sifive_e_prci_register_types(void)
 {
-    type_register_static(&sifive_prci_info);
+    type_register_static(&sifive_e_prci_info);
 }
 
-type_init(sifive_prci_register_types)
+type_init(sifive_e_prci_register_types)
 
 
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
diff --git a/include/hw/riscv/sifive_e_prci.h b/include/hw/riscv/sifive_e_prci.h
new file mode 100644
index 0000000000..c4b76aa17a
--- /dev/null
+++ b/include/hw/riscv/sifive_e_prci.h
@@ -0,0 +1,69 @@
+/*
+ * QEMU SiFive E PRCI (Power, Reset, Clock, Interrupt) interface
+ *
+ * Copyright (c) 2017 SiFive, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_SIFIVE_E_PRCI_H
+#define HW_SIFIVE_E_PRCI_H
+
+enum {
+    SIFIVE_E_PRCI_HFROSCCFG = 0x0,
+    SIFIVE_E_PRCI_HFXOSCCFG = 0x4,
+    SIFIVE_E_PRCI_PLLCFG    = 0x8,
+    SIFIVE_E_PRCI_PLLOUTDIV = 0xC
+};
+
+enum {
+    SIFIVE_E_PRCI_HFROSCCFG_RDY = (1 << 31),
+    SIFIVE_E_PRCI_HFROSCCFG_EN  = (1 << 30)
+};
+
+enum {
+    SIFIVE_E_PRCI_HFXOSCCFG_RDY = (1 << 31),
+    SIFIVE_E_PRCI_HFXOSCCFG_EN  = (1 << 30)
+};
+
+enum {
+    SIFIVE_E_PRCI_PLLCFG_PLLSEL = (1 << 16),
+    SIFIVE_E_PRCI_PLLCFG_REFSEL = (1 << 17),
+    SIFIVE_E_PRCI_PLLCFG_BYPASS = (1 << 18),
+    SIFIVE_E_PRCI_PLLCFG_LOCK   = (1 << 31)
+};
+
+enum {
+    SIFIVE_E_PRCI_PLLOUTDIV_DIV1 = (1 << 8)
+};
+
+#define TYPE_SIFIVE_E_PRCI      "riscv.sifive.e.prci"
+
+#define SIFIVE_E_PRCI(obj) \
+    OBJECT_CHECK(SiFiveEPRCIState, (obj), TYPE_SIFIVE_E_PRCI)
+
+typedef struct SiFiveEPRCIState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+    uint32_t hfrosccfg;
+    uint32_t hfxosccfg;
+    uint32_t pllcfg;
+    uint32_t plloutdiv;
+} SiFiveEPRCIState;
+
+DeviceState *sifive_e_prci_create(hwaddr addr);
+
+#endif
diff --git a/include/hw/riscv/sifive_prci.h b/include/hw/riscv/sifive_prci.h
deleted file mode 100644
index 8b7de134f8..0000000000
--- a/include/hw/riscv/sifive_prci.h
+++ /dev/null
@@ -1,71 +0,0 @@
-/*
- * QEMU SiFive PRCI (Power, Reset, Clock, Interrupt) interface
- *
- * Copyright (c) 2017 SiFive, Inc.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2 or later, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef HW_SIFIVE_PRCI_H
-#define HW_SIFIVE_PRCI_H
-
-#include "hw/sysbus.h"
-
-enum {
-    SIFIVE_PRCI_HFROSCCFG   = 0x0,
-    SIFIVE_PRCI_HFXOSCCFG   = 0x4,
-    SIFIVE_PRCI_PLLCFG      = 0x8,
-    SIFIVE_PRCI_PLLOUTDIV   = 0xC
-};
-
-enum {
-    SIFIVE_PRCI_HFROSCCFG_RDY   = (1 << 31),
-    SIFIVE_PRCI_HFROSCCFG_EN    = (1 << 30)
-};
-
-enum {
-    SIFIVE_PRCI_HFXOSCCFG_RDY   = (1 << 31),
-    SIFIVE_PRCI_HFXOSCCFG_EN    = (1 << 30)
-};
-
-enum {
-    SIFIVE_PRCI_PLLCFG_PLLSEL   = (1 << 16),
-    SIFIVE_PRCI_PLLCFG_REFSEL   = (1 << 17),
-    SIFIVE_PRCI_PLLCFG_BYPASS   = (1 << 18),
-    SIFIVE_PRCI_PLLCFG_LOCK     = (1 << 31)
-};
-
-enum {
-    SIFIVE_PRCI_PLLOUTDIV_DIV1  = (1 << 8)
-};
-
-#define TYPE_SIFIVE_PRCI "riscv.sifive.prci"
-
-#define SIFIVE_PRCI(obj) \
-    OBJECT_CHECK(SiFivePRCIState, (obj), TYPE_SIFIVE_PRCI)
-
-typedef struct SiFivePRCIState {
-    /*< private >*/
-    SysBusDevice parent_obj;
-
-    /*< public >*/
-    MemoryRegion mmio;
-    uint32_t hfrosccfg;
-    uint32_t hfxosccfg;
-    uint32_t pllcfg;
-    uint32_t plloutdiv;
-} SiFivePRCIState;
-
-DeviceState *sifive_prci_create(hwaddr addr);
-
-#endif
-- 
2.21.0


