Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWFh-0001OX-R2
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60646)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWFQ-0001GW-S7
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWFM-0006cg-AI
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:23:38 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41595)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWFJ-0006Vt-N0
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:23:34 -0400
Received: by mail-pl1-f194.google.com with SMTP id m7so1478696pls.8
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=skpCsY6OAelSjirFF1wZzpzLaY2+CMd8k4r3QNyFPh4=;
 b=eforyQWjN5QQCsGh28u5WR/iRN031/ZqlSGJNrPgl+Q5zPvjRmQzsurzRvYhXeb7zd
 cKOuuH5akEirSrsI6d4wvtCYJBDdvxjGbdI2mT1U1Rbodoi8jvZY7jnm75q+i7aoVFTN
 KB4FHZsclgCdRKVY6bcxhFK4ox2qkznvQmVeXM9DaoyyRcOl0jT8Qg/XKOqiDvLw2KKD
 kyYzffWPKhYUl2dt2zhrN7CqWdfVVAHKhaHfdZPYJIv3Lk4RMeEM70SHMxK0W+3U6QXB
 JpjysdW9yst+jPSbiKavfazCQ9SkQpP4PAiT9I2bCHi4tDVF7xrWMA01AeIsWf9n8zeY
 DRcw==
X-Gm-Message-State: APjAAAW2zo3ShWqUVvjbvUBaAZ6+yZk4eRL7YqGmfUhkTn4SKr9ApACV
 7ANmeTe7HGawLPI2pg3a1C3kYfaGR7FARw==
X-Google-Smtp-Source: APXvYqw5igcTkIulzG0XzC2nR1GXO//87ZtAwk+TL9KVkTl6rdxcSJHXY7oYPi23MOdiTkgbJFVHrg==
X-Received: by 2002:a17:902:ac86:: with SMTP id
 h6mr5006282plr.98.1561649007217; 
 Thu, 27 Jun 2019 08:23:27 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id f7sm2739438pgc.82.2019.06.27.08.23.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:23:26 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:39 -0700
Message-Id: <20190627152011.18686-3-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Nathaniel Graff <nathaniel.graff@sifive.com>, Michael Clark <mjc@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.194
Subject: [Qemu-riscv] [PULL 02/34] sifive_prci: Read and write PRCI registers
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
X-List-Received-Date: Thu, 27 Jun 2019 15:23:43 -0000

From: Nathaniel Graff <nathaniel.graff@sifive.com>

Writes to the SiFive PRCI registers are preserved while leaving the
ready bits set for the HFX/HFR oscillators and the lock bit set for the
PLL.

Signed-off-by: Nathaniel Graff <nathaniel.graff@sifive.com>
Reviewed-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_prci.c         | 49 ++++++++++++++++++++++++++++------
 include/hw/riscv/sifive_prci.h | 32 ++++++++++++++++++++++
 2 files changed, 73 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_prci.c
index fa136b5a9fe9..f406682c91f1 100644
--- a/hw/riscv/sifive_prci.c
+++ b/hw/riscv/sifive_prci.c
@@ -24,15 +24,18 @@
 #include "target/riscv/cpu.h"
 #include "hw/riscv/sifive_prci.h"
 
-/* currently implements enough to mock freedom-e-sdk BSP clock programming */
-
 static uint64_t sifive_prci_read(void *opaque, hwaddr addr, unsigned int size)
 {
-    if (addr == 0 /* PRCI_HFROSCCFG */) {
-        return 1 << 31; /* ROSC_RDY */
-    }
-    if (addr == 8 /* PRCI_PLLCFG    */) {
-        return 1 << 31; /* PLL_LOCK */
+    SiFivePRCIState *s = opaque;
+    switch (addr) {
+    case SIFIVE_PRCI_HFROSCCFG:
+        return s->hfrosccfg;
+    case SIFIVE_PRCI_HFXOSCCFG:
+        return s->hfxosccfg;
+    case SIFIVE_PRCI_PLLCFG:
+        return s->pllcfg;
+    case SIFIVE_PRCI_PLLOUTDIV:
+        return s->plloutdiv;
     }
     hw_error("%s: read: addr=0x%x\n", __func__, (int)addr);
     return 0;
@@ -41,7 +44,30 @@ static uint64_t sifive_prci_read(void *opaque, hwaddr addr, unsigned int size)
 static void sifive_prci_write(void *opaque, hwaddr addr,
            uint64_t val64, unsigned int size)
 {
-    /* discard writes */
+    SiFivePRCIState *s = opaque;
+    switch (addr) {
+    case SIFIVE_PRCI_HFROSCCFG:
+        s->hfrosccfg = (uint32_t) val64;
+        /* OSC stays ready */
+        s->hfrosccfg |= SIFIVE_PRCI_HFROSCCFG_RDY;
+        break;
+    case SIFIVE_PRCI_HFXOSCCFG:
+        s->hfxosccfg = (uint32_t) val64;
+        /* OSC stays ready */
+        s->hfxosccfg |= SIFIVE_PRCI_HFXOSCCFG_RDY;
+        break;
+    case SIFIVE_PRCI_PLLCFG:
+        s->pllcfg = (uint32_t) val64;
+        /* PLL stays locked */
+        s->pllcfg |= SIFIVE_PRCI_PLLCFG_LOCK;
+        break;
+    case SIFIVE_PRCI_PLLOUTDIV:
+        s->plloutdiv = (uint32_t) val64;
+        break;
+    default:
+        hw_error("%s: bad write: addr=0x%x v=0x%x\n",
+                 __func__, (int)addr, (int)val64);
+    }
 }
 
 static const MemoryRegionOps sifive_prci_ops = {
@@ -61,6 +87,13 @@ static void sifive_prci_init(Object *obj)
     memory_region_init_io(&s->mmio, obj, &sifive_prci_ops, s,
                           TYPE_SIFIVE_PRCI, 0x8000);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+
+    s->hfrosccfg = (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI_HFROSCCFG_EN);
+    s->hfxosccfg = (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI_HFROSCCFG_EN);
+    s->pllcfg = (SIFIVE_PRCI_PLLCFG_REFSEL | SIFIVE_PRCI_PLLCFG_BYPASS |
+                SIFIVE_PRCI_PLLCFG_LOCK);
+    s->plloutdiv = SIFIVE_PRCI_PLLOUTDIV_DIV1;
+
 }
 
 static const TypeInfo sifive_prci_info = {
diff --git a/include/hw/riscv/sifive_prci.h b/include/hw/riscv/sifive_prci.h
index b6f4c486cc1e..bd51c4af3c1c 100644
--- a/include/hw/riscv/sifive_prci.h
+++ b/include/hw/riscv/sifive_prci.h
@@ -19,6 +19,34 @@
 #ifndef HW_SIFIVE_PRCI_H
 #define HW_SIFIVE_PRCI_H
 
+enum {
+    SIFIVE_PRCI_HFROSCCFG   = 0x0,
+    SIFIVE_PRCI_HFXOSCCFG   = 0x4,
+    SIFIVE_PRCI_PLLCFG      = 0x8,
+    SIFIVE_PRCI_PLLOUTDIV   = 0xC
+};
+
+enum {
+    SIFIVE_PRCI_HFROSCCFG_RDY   = (1 << 31),
+    SIFIVE_PRCI_HFROSCCFG_EN    = (1 << 30)
+};
+
+enum {
+    SIFIVE_PRCI_HFXOSCCFG_RDY   = (1 << 31),
+    SIFIVE_PRCI_HFXOSCCFG_EN    = (1 << 30)
+};
+
+enum {
+    SIFIVE_PRCI_PLLCFG_PLLSEL   = (1 << 16),
+    SIFIVE_PRCI_PLLCFG_REFSEL   = (1 << 17),
+    SIFIVE_PRCI_PLLCFG_BYPASS   = (1 << 18),
+    SIFIVE_PRCI_PLLCFG_LOCK     = (1 << 31)
+};
+
+enum {
+    SIFIVE_PRCI_PLLOUTDIV_DIV1  = (1 << 8)
+};
+
 #define TYPE_SIFIVE_PRCI "riscv.sifive.prci"
 
 #define SIFIVE_PRCI(obj) \
@@ -30,6 +58,10 @@ typedef struct SiFivePRCIState {
 
     /*< public >*/
     MemoryRegion mmio;
+    uint32_t hfrosccfg;
+    uint32_t hfxosccfg;
+    uint32_t pllcfg;
+    uint32_t plloutdiv;
 } SiFivePRCIState;
 
 DeviceState *sifive_prci_create(hwaddr addr);
-- 
2.21.0


