Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680F0C369B2
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 10:57:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u5MtI-0000XH-4M; Thu, 17 Apr 2025 06:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u5MtF-0000QG-La
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 06:54:42 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u5MtB-0003nd-Au
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 06:54:41 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-22c33677183so7161665ad.2
 for <qemu-riscv@nongnu.org>; Thu, 17 Apr 2025 03:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744887276; x=1745492076; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zQPqjXYVy2MZpkzlsyhoG+MQg9fKVsZKI/VvPlBGP+g=;
 b=KRK9X5QTdQjpJLo6yOINvlj9KNuSEZCmQYkhb84enEeg73Il+kiDaRGsfFQARZ7z3V
 uSMVCBCJXXYAyreSozkODU23DUq47ydms9WvkI7O/VYTryY4zukxrAgTYPxOrSKAN6Lj
 n1fxkQn05d+BMC0QGpfRMpygV7vLlE1psUifyWyUZUk2VEdU/rGlT7WRLHkjI/AmUclB
 X8bl8hHNSPdYEg43CdEueMNFWor2ibYzws5kaV4Frd1uFLlaBs9cFEAFTeKs84Uy5HgV
 WtYxPzTgO/EpZLdVVkxzgxdJ56JTlVUgJrDgt/gb4LUdiU1TDTAAYWJK1HXWnx/I6r4P
 z3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744887276; x=1745492076;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zQPqjXYVy2MZpkzlsyhoG+MQg9fKVsZKI/VvPlBGP+g=;
 b=CSmqzBWrrdhLS5HH+6QLGRBC1Sgckezt3Pn2naNDTGLvexLy864PCKuCIe4q04zmn1
 1qZ64GPS0E69fDhAzt6s7R9Om8V6BvvEOIDywzMtpKnBJNv0jBPec9Xnpl6fFp8Vj/C1
 9bUupBxxn/kBUH98JV4bLsT7msHBga9PYbHxzgrJEjmF300vzWfYZGumKUocWO+PpXEz
 h0f2Os7iBjlUyUFQDalI7v+pNontPwX4yYvDKbmspr4h153Ul+0Sr3FAM6KgtgqdY0od
 dNGPV/tpbTJXBbSPA4v8w5hweK5QJLjpHMIT+OuBZ3UD4/wTDRIjcjJWIrtCwBH2YV87
 Uwhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD49Ja4XpJ9z8oooJlhW/og4/DhPt2+FEJP3pWZ4szxRMcI2lC6Sf+AEPgV29pLsYChB00fb3gRLQF@nongnu.org
X-Gm-Message-State: AOJu0Yy6l95SWVSajybdEZXxudAfaJjdDbAML3vhiay/5SkbGDRHucJQ
 B3ctVRfMLTb5nOKUhpyX7RKbSt6gTyID6wacQn1hOVaELnQEoKSJPByamqErJxA=
X-Gm-Gg: ASbGncsKxGlwpg+yC2cEmp8nhC6DG51ytPFKo1Dr2N8BC05Mv6lUddHdINtbh1hydY0
 uRvGwGb4CE0eXnSIKnlS9ajULoCZ3EOO3XD3TyQAi6RYNesa52ehxMZFTwfk9hFguWiw1V7tQZ0
 Qd5DCjpR5f2wKmhm2VBBiv7/uxbJMSn4q94pV7p3MbsDkTjfX5HSU1qQD3vI7uFnLn1wZPLiUsL
 1LPDwtUmCvTifr6oe5S02vDqDvB0EmS4xpOsdQGhtibVZ5aKHe8BMl+E1Rw9tkzvSwMZjLiRw88
 3Cu50d5qgZzM17CRSRbdsduf4wf//8xxnIQMzJXJGwSlsY8/lnnHP2qpDXS7rNs=
X-Google-Smtp-Source: AGHT+IE4m/QZrr2Q6Luap6Pg7J62BHPXXU9yOa9/DWDaGYQ/X6pxr3b7Xqvv907SRhkPiLLuthmhAA==
X-Received: by 2002:a17:902:ea12:b0:223:5241:f5ca with SMTP id
 d9443c01a7336-22c358db91bmr60556795ad.20.1744887275787; 
 Thu, 17 Apr 2025 03:54:35 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd230ddaasm12366251b3a.138.2025.04.17.03.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 03:54:35 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 17/18] hw/misc: riscv_wgchecker: Check the slot settings in
 translate
Date: Thu, 17 Apr 2025 18:52:48 +0800
Message-Id: <20250417105249.18232-18-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250417105249.18232-1-jim.shu@sifive.com>
References: <20250417105249.18232-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The final part of wgChecker we need to implement is actually using the
wgChecker slots programmed by guest to determine whether to block the
transaction or not.

Since this means we now change transaction mappings when
the guest writes to wgChecker slots, we must also call the IOMMU
notifiers at that point.

One tricky part here is that the perm of 'blocked_io_as' is the
condition of deny access. For example, if wgChecker only permits RO
access, the perm of 'downstream_as' will be IOMMU_RO and the perm of
'blocked_io_as' will be IOMMU_WO.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 hw/misc/riscv_wgchecker.c | 70 ++++++++++++++++++++++++++++++++++++---
 hw/misc/trace-events      |  1 +
 2 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/hw/misc/riscv_wgchecker.c b/hw/misc/riscv_wgchecker.c
index 5d2af7946f..5a70231837 100644
--- a/hw/misc/riscv_wgchecker.c
+++ b/hw/misc/riscv_wgchecker.c
@@ -100,6 +100,52 @@ REG32(SLOT_CFG,             0x010)
 #define P_READ                  (1 << 0)
 #define P_WRITE                 (1 << 1)
 
+static IOMMUAccessFlags wgc_perm_to_iommu_flags(int wgc_perm)
+{
+    if (wgc_perm == (P_READ | P_WRITE)) {
+        return IOMMU_RW;
+    } else if (wgc_perm & P_WRITE) {
+        return IOMMU_WO;
+    } else if (wgc_perm & P_READ) {
+        return IOMMU_RO;
+    } else {
+        return IOMMU_NONE;
+    }
+}
+
+static void wgchecker_iommu_notify_all(RISCVWgCheckerState *s)
+{
+    /*
+     * Do tlb_flush() to whole address space via memory_region_notify_iommu()
+     * when wgChecker changes it's config.
+     */
+
+    IOMMUTLBEvent event = {
+        .entry = {
+            .addr_mask = -1ULL,
+        }
+    };
+
+    trace_riscv_wgc_iommu_notify_all();
+
+    for (int i=0; i<WGC_NUM_REGIONS; i++) {
+        WgCheckerRegion *region = &s->mem_regions[i];
+        uint32_t nworlds = worldguard_config->nworlds;
+
+        if (!region->downstream) {
+            continue;
+        }
+        event.entry.iova = 0;
+        event.entry.translated_addr = 0;
+        event.type = IOMMU_NOTIFIER_UNMAP;
+        event.entry.perm = IOMMU_NONE;
+
+        for (int wid=0; wid<nworlds; wid++) {
+            memory_region_notify_iommu(&region->upstream, wid, event);
+        }
+    }
+}
+
 static void decode_napot(hwaddr a, hwaddr *sa, hwaddr *ea)
 {
     /*
@@ -309,6 +355,9 @@ static IOMMUTLBEntry riscv_wgc_translate(IOMMUMemoryRegion *iommu,
 {
     WgCheckerRegion *region = container_of(iommu, WgCheckerRegion, upstream);
     RISCVWgCheckerState *s = RISCV_WGCHECKER(region->wgchecker);
+    bool is_write;
+    WgAccessResult result;
+    int wgc_perm;
     hwaddr phys_addr;
     uint64_t region_size;
 
@@ -327,18 +376,25 @@ static IOMMUTLBEntry riscv_wgc_translate(IOMMUMemoryRegion *iommu,
      * Look at the wgChecker configuration for this address, and
      * return a TLB entry directing the transaction at either
      * downstream_as or blocked_io_as, as appropriate.
-     * For the moment, always permit accesses.
      */
 
     /* Use physical address instead of offset */
     phys_addr = addr + region->region_offset;
+    is_write = (flags == IOMMU_WO);
 
-    is_success = true;
+    result = wgc_check_access(s, phys_addr, iommu_idx, is_write);
 
     trace_riscv_wgc_translate(phys_addr, flags,
-        iommu_idx, is_success ? "pass" : "block");
+        iommu_idx, result.is_success ? "pass" : "block");
 
-    ret.target_as = is_success ? &region->downstream_as : &region->blocked_io_as;
+    wgc_perm = result.perm;
+    if (!result.is_success) {
+        /* if target_as is blocked_io_as, the perm is the condition of deny access. */
+        wgc_perm ^= (P_READ | P_WRITE);
+    }
+    ret.perm = wgc_perm_to_iommu_flags(wgc_perm);
+
+    ret.target_as = result.is_success ? &region->downstream_as : &region->blocked_io_as;
     return ret;
 }
 
@@ -604,6 +660,9 @@ static void riscv_wgchecker_writeq(void *opaque, hwaddr addr,
             break;
         }
 
+        /* Flush softmmu TLB when wgChecker changes config. */
+        wgchecker_iommu_notify_all(s);
+
         return;
     }
 
@@ -699,6 +758,9 @@ static void riscv_wgchecker_writel(void *opaque, hwaddr addr,
             break;
         }
 
+        /* Flush softmmu TLB when wgChecker changes config. */
+        wgchecker_iommu_notify_all(s);
+
         return;
     }
 
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index b1d8538220..54dfcd50a1 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -403,3 +403,4 @@ riscv_wgchecker_mmio_write(uint64_t base, uint64_t offset, unsigned int size, ui
 riscv_wgc_mem_blocked_read(uint64_t addr, unsigned size, uint32_t wid) "wgChecker blocked read: offset 0x%" PRIx64 " size %u wid %" PRIu32
 riscv_wgc_mem_blocked_write(uint64_t addr, uint64_t data, unsigned size, uint32_t wid) "wgChecker blocked write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u wid %" PRIu32
 riscv_wgc_translate(uint64_t addr, int flags, int wid, const char *res) "wgChecker translate: addr 0x%016" PRIx64 " flags 0x%x wid %d: %s"
+riscv_wgc_iommu_notify_all(void) "wgChecker iommu: notifying UNMAP for all"
-- 
2.17.1


