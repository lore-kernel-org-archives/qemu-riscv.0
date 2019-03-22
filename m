Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h782a-00030B-In
	for mharc-qemu-riscv@gnu.org; Thu, 21 Mar 2019 20:28:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h782X-0002zR-QK
	for qemu-riscv@nongnu.org; Thu, 21 Mar 2019 20:28:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h782W-0001Zs-Kx
	for qemu-riscv@nongnu.org; Thu, 21 Mar 2019 20:28:05 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:39303)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h782W-0001Wx-3m
	for qemu-riscv@nongnu.org; Thu, 21 Mar 2019 20:28:04 -0400
Received: by mail-pg1-x543.google.com with SMTP id h8so212128pgp.6
	for <qemu-riscv@nongnu.org>; Thu, 21 Mar 2019 17:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:mime-version:content-transfer-encoding:cc
	:from:to; bh=P0PmWB4MEKCw4NufvvW/W6VRhua7JfOUfUf8LMy67Nw=;
	b=RCTCIjMVKFXzVXxYtYpXDxycK0yT878i8qFxOqJ7K9rpmxJRPVPHOk9WGvSvzjkHOw
	EEUdtFmrYy0TKyvXY1SEZ1yc6UYiPhXcXn1nV65lLfWGpF2zZH1XAradu7AjgMgghd0B
	4J7oVCXTOQ37t9ytcLvfC6XvhaVENd1U1XHU+fgIY+TGKxBmXHY0Gw0EypMP9xGquCCv
	nJUJpmdBIRsk74YXa1jtAD1KUjKb/Kdeqyykb1ThmVic8l9zhptr/ros3jygHnb6dcrl
	ykBJEBVeuhSg5umpvo34UQWOEN2I2Z8Bc16BllGVGBPza1KnM40r+Esg97YtO2489DiQ
	8rdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=P0PmWB4MEKCw4NufvvW/W6VRhua7JfOUfUf8LMy67Nw=;
	b=Qzi/v3yd39w0NWHOS1DJCPg158fRxIty39NMZMf09EK14y4googFAFDEgXr2NIGgFm
	TmSt7XGHX/JEU04us+l1R1XxNJ1h7oL4bR4e6QceCT0u3hIcsere2akqIBnYYSErQfii
	0Q6B/ADTK9vogUuuRrP6cU5HSl7SVephe7ZRWb1BkkjIguYqM2EX8Wu6Zek2v6m56FZI
	TcMIOtF7vaO0h80J0ZChI+1uC4RH66GxKB9YjkBI4MVgatgLoXnvavSuqitH+4+je2lu
	UjEXuumbLCN/Hy4AFh4CVgPCE4Y3vsg/1XBCHK2AW2YfmlL+HXI7WXKEC0479Lacp73c
	YPDw==
X-Gm-Message-State: APjAAAUkqYoWexnq2YC0Xfxb4mG2cFQHwU2LJdVJ3SiMTvcUGNcpkeot
	qTqsAF+sbrzpik8sYT5TtRAtXQ==
X-Google-Smtp-Source: APXvYqxXSVY+r0ZviyvrqKYKwLd4FsEo9W0wW7yURBvoel2f45H0nuK/dqZzpHAICFofnSbgu2Ju6w==
X-Received: by 2002:a63:ff0c:: with SMTP id k12mr6031929pgi.358.1553214482844; 
	Thu, 21 Mar 2019 17:28:02 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1ed7-23f1-a55b-5e6a-d75e.dynamic-ip6.hinet.net.
	[2001:b011:7001:1ed7:23f1:a55b:5e6a:d75e])
	by smtp.gmail.com with ESMTPSA id
	p3sm9377942pfp.136.2019.03.21.17.28.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Mar 2019 17:28:01 -0700 (PDT)
Date: Thu, 21 Mar 2019 17:27:49 -0700
Message-Id: <20190322002749.26561-1-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org, Nathaniel Graff <nathaniel.graff@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-riscv] [PATCH] sifive_prci: Read and write PRCI registers
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2019 00:28:07 -0000

From: Nathaniel Graff <nathaniel.graff@sifive.com>

Writes to the SiFive PRCI registers are preserved while leaving the
ready bits set for the HFX/HFR oscillators and the lock bit set for the
PLL.

Signed-off-by: Nathaniel Graff <nathaniel.graff@sifive.com>
Reviewed-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_prci.c         | 51 ++++++++++++++++++++++++++++------
 include/hw/riscv/sifive_prci.h | 32 +++++++++++++++++++++
 2 files changed, 75 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/sifive_prci.c b/hw/riscv/sifive_prci.c
index 0910ea32c1a5..1435423a23e4 100644
--- a/hw/riscv/sifive_prci.c
+++ b/hw/riscv/sifive_prci.c
@@ -23,15 +23,19 @@
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
+    switch(addr)
+    {
+        case SIFIVE_PRCI_HFROSCCFG:
+            return s->hfrosccfg;
+        case SIFIVE_PRCI_HFXOSCCFG:
+            return s->hfxosccfg;
+        case SIFIVE_PRCI_PLLCFG:
+            return s->pllcfg;
+        case SIFIVE_PRCI_PLLOUTDIV:
+            return s->plloutdiv;
     }
     hw_error("%s: read: addr=0x%x\n", __func__, (int)addr);
     return 0;
@@ -40,7 +44,31 @@ static uint64_t sifive_prci_read(void *opaque, hwaddr addr, unsigned int size)
 static void sifive_prci_write(void *opaque, hwaddr addr,
            uint64_t val64, unsigned int size)
 {
-    /* discard writes */
+    SiFivePRCIState *s = opaque;
+    switch(addr)
+    {
+        case SIFIVE_PRCI_HFROSCCFG:
+            s->hfrosccfg = (uint32_t) val64;
+            /* OSC stays ready */
+            s->hfrosccfg |= SIFIVE_PRCI_HFROSCCFG_RDY;
+            break;
+        case SIFIVE_PRCI_HFXOSCCFG:
+            s->hfxosccfg = (uint32_t) val64;
+            /* OSC stays ready */
+            s->hfxosccfg |= SIFIVE_PRCI_HFXOSCCFG_RDY;
+            break;
+        case SIFIVE_PRCI_PLLCFG:
+            s->pllcfg = (uint32_t) val64;
+            /* PLL stays locked */
+            s->pllcfg |= SIFIVE_PRCI_PLLCFG_LOCK;
+            break;
+        case SIFIVE_PRCI_PLLOUTDIV:
+            s->plloutdiv = (uint32_t) val64; 
+            break;
+        default:
+            hw_error("%s: bad write: addr=0x%x v=0x%x\n",
+                    __func__, (int)addr, (int)val64);
+    }
 }
 
 static const MemoryRegionOps sifive_prci_ops = {
@@ -60,6 +88,13 @@ static void sifive_prci_init(Object *obj)
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
2.19.2


