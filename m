Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZyHN-0006vA-Nv
	for mharc-qemu-riscv@gnu.org; Tue, 03 Nov 2020 10:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1kZyHL-0006qe-Rg
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 10:31:23 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1kZyHJ-0000VY-Sx
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 10:31:23 -0500
Received: by mail-wm1-x342.google.com with SMTP id c18so13172762wme.2
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2020 07:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=js34qtFAWEEhN4hZ3S1qe+LxhZvCX3mSPr9nH2fRNTQ=;
 b=R4hBV56OJe1H26q5lVFlwZ3GhF0rIRlI5TBh01KwgCmkc5fGsKTB99aL533ZcxVzk8
 jVJjwHVBh5Pkk1qO8FgbKYCGNSPIp1frFQQuI3ElonWBJF/BCZPhQN/ZV7viQLHc7zFK
 RZDzgzt3EQdV2B0WHbDXCeMnTKXskPT/Fm3jr55vr/TcGAkaeUA2oq/d8qhTu+B2Ic0q
 AQl/dFP0IjiR1VfC4y1+WirGrBD/ifekCZ2Vid8XteBOKk7vFdrUqgVTa2Ws/0ah4Gvr
 nLK4zFUjMBla7R+fNY0II2NHMeafClz62E120AAg+lE5wS+H+dJwNtDpCDv5nG833XXQ
 nyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=js34qtFAWEEhN4hZ3S1qe+LxhZvCX3mSPr9nH2fRNTQ=;
 b=grq/3h66Q1PCjBcgxi3LRapKMSgndg9Y1HsHvqEtktm0txIIHFM03CXbmrPD3ejbkf
 uJ28gUnvBhmFeYYM3txc6jZLRnwBKGS+0S6NMRkhysdnKhhAW7hAzU1nUUTRFdeAqfU3
 ACBeQvzdaNPUZ4n+pbHKzQwHoYPotnF6lphMm0Zd4wQHa+MwOe/ZMFNQt1R7SwYqPXKX
 r47gZ2krgMEGraY2jWjWvq8+N4br4RGSB9szV9bU196vUBtnm6Woz/RkFv6gGcZuqLV2
 ubGU52rd7uTWyc9h+D8hLldsPaP8chEWYaTMtbt1k4+wFOlAIC9NW40BLG+G5G9Io7Lx
 sWsQ==
X-Gm-Message-State: AOAM532xC970TI+VxDUlZPABcqPmTW30sUgzTvQqjfw7dOFt2geDsxNs
 ATL9vY8obtT8jvIek630vm6lbW+KUzwBzXhG
X-Google-Smtp-Source: ABdhPJzsdsIkQ4ycH9s2Ed5HKD5q2ZFATvgCnEPkXZs0DOt+Cvz4DDQbgy/plHp9+OTyz+RImiQlvw==
X-Received: by 2002:a1c:3142:: with SMTP id x63mr313577wmx.168.1604417480213; 
 Tue, 03 Nov 2020 07:31:20 -0800 (PST)
Received: from thurso.iroazh.eu (net.iroazh.eu. [109.190.73.171])
 by smtp.gmail.com with ESMTPSA id e6sm19443716wrs.7.2020.11.03.07.31.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Nov 2020 07:31:19 -0800 (PST)
From: Emmanuel Blot <emmanuel.blot@sifive.com>
To: qemu-riscv@nongnu.org
Cc: Emmanuel Blot <emmanuel.blot@sifive.com>
Subject: [PATCH 2/2] hw/riscv: plic: Make IRQ slot 0 part of the IRQ priority
 array
Date: Tue,  3 Nov 2020 16:29:19 +0100
Message-Id: <20201103152920.90957-3-emmanuel.blot@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201103152920.90957-1-emmanuel.blot@sifive.com>
References: <20201103152920.90957-1-emmanuel.blot@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=emmanuel.blot@sifive.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 03 Nov 2020 15:31:24 -0000

This definition is more consistent with other PLIC registers where IRQ slot 0 (bit 0 of the first word) is reserved for no IRQ signalling.

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
---
 hw/intc/sifive_plic.c              | 12 ++++++------
 include/hw/riscv/microchip_pfsoc.h |  2 +-
 include/hw/riscv/sifive_e.h        |  2 +-
 include/hw/riscv/sifive_u.h        |  2 +-
 include/hw/riscv/virt.h            |  2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index e2e3d0b4c8..d6d4b02238 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -206,10 +206,10 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
         goto err;
     }
 
-    if (addr >= plic->priority_base && /* 4 bytes per source */
-        addr < plic->priority_base + (plic->num_sources << 2))
+    if (addr >= (plic->priority_base + 0x4) && /* 4 bytes per source */
+        addr < plic->priority_base + ((plic->num_sources + 1) << 2))
     {
-        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
+        uint32_t irq = ((addr - plic->priority_base) >> 2);
         if (RISCV_DEBUG_PLIC) {
             qemu_log("plic: read priority: irq=%d priority=%d\n",
                 irq, plic->source_priority[irq]);
@@ -281,10 +281,10 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
         goto err;
     }
 
-    if (addr >= plic->priority_base && /* 4 bytes per source */
-        addr < plic->priority_base + (plic->num_sources << 2))
+    if (addr >= (plic->priority_base + 0x4) && /* 4 bytes per source */
+        addr < plic->priority_base + ((plic->num_sources + 1) << 2))
     {
-        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
+        uint32_t irq = ((addr - plic->priority_base) >> 2);
         plic->source_priority[irq] = value & 7;
         if (RISCV_DEBUG_PLIC) {
             qemu_log("plic: write priority: irq=%d priority=%d\n",
diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index 8bfc7e1a85..4c18d902f6 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -123,7 +123,7 @@ enum {
 #define MICROCHIP_PFSOC_PLIC_HART_CONFIG        "MS"
 #define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        185
 #define MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES     7
-#define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x04
+#define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x0
 #define MICROCHIP_PFSOC_PLIC_PENDING_BASE       0x1000
 #define MICROCHIP_PFSOC_PLIC_ENABLE_BASE        0x2000
 #define MICROCHIP_PFSOC_PLIC_ENABLE_STRIDE      0x80
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 83604da805..749161098c 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -83,7 +83,7 @@ enum {
 #define SIFIVE_E_PLIC_HART_CONFIG "M"
 #define SIFIVE_E_PLIC_NUM_SOURCES 127
 #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
-#define SIFIVE_E_PLIC_PRIORITY_BASE 0x04
+#define SIFIVE_E_PLIC_PRIORITY_BASE 0x0
 #define SIFIVE_E_PLIC_PENDING_BASE 0x1000
 #define SIFIVE_E_PLIC_ENABLE_BASE 0x2000
 #define SIFIVE_E_PLIC_ENABLE_STRIDE 0x80
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index a9f7b4a084..dfdcf92757 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -140,7 +140,7 @@ enum {
 #define SIFIVE_U_PLIC_HART_CONFIG "MS"
 #define SIFIVE_U_PLIC_NUM_SOURCES 54
 #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
-#define SIFIVE_U_PLIC_PRIORITY_BASE 0x04
+#define SIFIVE_U_PLIC_PRIORITY_BASE 0x0
 #define SIFIVE_U_PLIC_PENDING_BASE 0x1000
 #define SIFIVE_U_PLIC_ENABLE_BASE 0x2000
 #define SIFIVE_U_PLIC_ENABLE_STRIDE 0x80
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index b4ed9a32eb..26ec4b5871 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -73,7 +73,7 @@ enum {
 #define VIRT_PLIC_HART_CONFIG "MS"
 #define VIRT_PLIC_NUM_SOURCES 127
 #define VIRT_PLIC_NUM_PRIORITIES 7
-#define VIRT_PLIC_PRIORITY_BASE 0x04
+#define VIRT_PLIC_PRIORITY_BASE 0x0
 #define VIRT_PLIC_PENDING_BASE 0x1000
 #define VIRT_PLIC_ENABLE_BASE 0x2000
 #define VIRT_PLIC_ENABLE_STRIDE 0x80
-- 
2.28.0


