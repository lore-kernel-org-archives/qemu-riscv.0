Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B65C369B2
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 10:54:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u5MsG-0007Sc-FW; Thu, 17 Apr 2025 06:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u5Ms2-0007LS-4v
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 06:53:27 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u5Mry-0003Jo-BT
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 06:53:25 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-225477548e1so6154515ad.0
 for <qemu-riscv@nongnu.org>; Thu, 17 Apr 2025 03:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744887200; x=1745492000; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=J1izik/mp/cOi9QWmmKUFGo6rJs6LGatGvCKXun7+9w=;
 b=Bdj+tiNU8RWcmSZxcS4Lk1FyE11uMYY8x5uFKJMZZQ52b63TubVZ4B2Eci17RjGerh
 pJ0DIU0wlGb3dxT1b8crP2+dXGF3uphzqoxb2lvDWj2eTXDLL/13l0UWrOYR3wa/gdKB
 3tLLWB77KSG+xG+6X6Ztj7yc02v1H/ogEC3ToaHLEiUaMzAiiRwMfDMsmbb6mJkHCpUW
 IPw/MRJ+z9TrXBQ3HQQCAWHgDRdk5aXZOuKiszLZuYNiWOgtrMkIieWSkCDYBx1MT0Vn
 e2Ydu7kEj+lIe6NugaOuP2lpJP/y/V5sg0DWJ52C238sNAggFdLV6lxZFfvT16hw09T6
 bxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744887200; x=1745492000;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J1izik/mp/cOi9QWmmKUFGo6rJs6LGatGvCKXun7+9w=;
 b=s+EEp8zQh9KQIGucuzQcaI0SRWWYLRdrzCxLKE7XLnmzM0ihr+/KWBJ1UF/OyrxXon
 J5Hg9mfFiWG56wDp5XNxZj0AOHXBA+J0SSlRJWSzrFb9WykeJHGOZ75/Q3CpsqA99ycu
 62Lyretfgpuxg/FJGOgGCMRISEtAfjBx58AR9dht4gUM/6rx0o/mO3iAVgbkbjh0FEpD
 8Kq1Fp1QmDhlcZiJSRUEki/SwdJWvhL/4vXi1f+pcJ1miv9qDqWIxDGRo2RHmyytQ+vA
 95on5lHRpPvlbjx9iCZC4b7TXoj79lCubQFfxoGYu0nd4JGyhfNucRmufSEYVLUMZqDJ
 JIug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf/4O7qUUh8A8xUezFpdDvHI3o76v/EqHy0DFZ2mjCyxEpB1i+k85ameQITiLdUqQ5K5qk2wpy7V8E@nongnu.org
X-Gm-Message-State: AOJu0YwMNHTigSmKG8s25MgAeT5PfJ2aW4ZVCNfFpCiqDmXQChmV7QDX
 x8JOeYPNlTjts+8IQmc/W0w+KZlXCYWRbb+8KU/HCtQVsEvr0Y7BbijqhK7sAB0=
X-Gm-Gg: ASbGncsgn6z9h701l75ltjYFb1UFtQ6YK0kubXKd8wazbNTX9fkzudCDa4WtrsqfoJH
 8UF6FJtVANjxI9Z7bgS6giyxqblR1ewW/KntlaMqxoy448tbslyZklgo7ErZgOU6TuTIsB4Nshu
 pnqZ4IzRN1W6DH6vdgcspJdtndiK0iDlrLrzm2ZSONXwW29p9k6vGfCEZN78+gSJQ+8t9/tjiR6
 SAeLy0RBoVIVUUdL+923oGjviQq5RSqbOu67OOZtqkk4nwSfHduAIoffqjY8JrqOG2pB6bgVUxw
 7GObB95pZLFAptk3yyN101KQqX3PwouWLomXUJyMjs9oyqdgJAn0M/BrasNqbp+aOYNAk6/2Rg=
 =
X-Google-Smtp-Source: AGHT+IGVpKLbE4JsLFjLmTiTUYHpFUFCeggAHf39EohNH3m35C24khnjnino8A1si3dmuJv/h8PhfA==
X-Received: by 2002:a17:902:d552:b0:224:191d:8a87 with SMTP id
 d9443c01a7336-22c358e8c34mr94382175ad.26.1744887200240; 
 Thu, 17 Apr 2025 03:53:20 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd230ddaasm12366251b3a.138.2025.04.17.03.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 03:53:19 -0700 (PDT)
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
Subject: [PATCH v2 03/18] accel/tcg: memory access from CPU will pass
 access_type to IOMMU
Date: Thu, 17 Apr 2025 18:52:34 +0800
Message-Id: <20250417105249.18232-4-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250417105249.18232-1-jim.shu@sifive.com>
References: <20250417105249.18232-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

It is the preparation patch for upcoming RISC-V wgChecker device.

Since RISC-V wgChecker could permit access in RO/WO permission, the
IOMMUMemoryRegion could return different section for read & write
access. The memory access from CPU should also pass the access_type to
IOMMU translate function so that IOMMU could return the correct section
of specified access_type.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 accel/tcg/cputlb.c                   | 17 ++++++++++-------
 include/exec/cputlb.h                | 11 +++++++----
 include/exec/exec-all.h              |  3 ++-
 system/physmem.c                     | 16 +++++++++++-----
 target/alpha/helper.c                |  2 +-
 target/avr/helper.c                  |  2 +-
 target/hppa/mem_helper.c             |  1 -
 target/i386/tcg/system/excp_helper.c |  3 ++-
 target/loongarch/tcg/tlb_helper.c    |  2 +-
 target/m68k/helper.c                 | 10 +++++++---
 target/microblaze/helper.c           |  8 ++++----
 target/mips/tcg/system/tlb_helper.c  |  4 ++--
 target/openrisc/mmu.c                |  2 +-
 target/ppc/mmu_helper.c              |  2 +-
 target/riscv/cpu_helper.c            |  2 +-
 target/rx/cpu.c                      |  3 ++-
 target/s390x/tcg/excp_helper.c       |  2 +-
 target/sh4/helper.c                  |  2 +-
 target/sparc/mmu_helper.c            |  6 +++---
 target/tricore/helper.c              |  2 +-
 target/xtensa/helper.c               |  3 ++-
 21 files changed, 61 insertions(+), 42 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index d51bfc19c1..9396024e75 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1017,7 +1017,8 @@ static inline void tlb_set_compare(CPUTLBEntryFull *full, CPUTLBEntry *ent,
  * critical section.
  */
 void tlb_set_page_full(CPUState *cpu, int mmu_idx,
-                       vaddr addr, CPUTLBEntryFull *full)
+                       vaddr addr, MMUAccessType access_type,
+                       CPUTLBEntryFull *full)
 {
     CPUTLB *tlb = &cpu->neg.tlb;
     CPUTLBDesc *desc = &tlb->d[mmu_idx];
@@ -1044,7 +1045,8 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
     prot = full->prot;
     asidx = cpu_asidx_from_attrs(cpu, full->attrs);
     section = address_space_translate_for_iotlb(cpu, asidx, paddr_page,
-                                                &xlat, &sz, full->attrs, &prot);
+                                                &xlat, &sz, full->attrs, &prot,
+                                                access_type);
     assert(sz >= TARGET_PAGE_SIZE);
 
     tlb_debug("vaddr=%016" VADDR_PRIx " paddr=0x" HWADDR_FMT_plx
@@ -1180,7 +1182,8 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
 
 void tlb_set_page_with_attrs(CPUState *cpu, vaddr addr,
                              hwaddr paddr, MemTxAttrs attrs, int prot,
-                             int mmu_idx, vaddr size)
+                             MMUAccessType access_type, int mmu_idx,
+                             vaddr size)
 {
     CPUTLBEntryFull full = {
         .phys_addr = paddr,
@@ -1190,15 +1193,15 @@ void tlb_set_page_with_attrs(CPUState *cpu, vaddr addr,
     };
 
     assert(is_power_of_2(size));
-    tlb_set_page_full(cpu, mmu_idx, addr, &full);
+    tlb_set_page_full(cpu, mmu_idx, addr, access_type, &full);
 }
 
 void tlb_set_page(CPUState *cpu, vaddr addr,
-                  hwaddr paddr, int prot,
+                  hwaddr paddr, int prot, MMUAccessType access_type,
                   int mmu_idx, vaddr size)
 {
     tlb_set_page_with_attrs(cpu, addr, paddr, MEMTXATTRS_UNSPECIFIED,
-                            prot, mmu_idx, size);
+                            prot, access_type, mmu_idx, size);
 }
 
 /**
@@ -1240,7 +1243,7 @@ static bool tlb_fill_align(CPUState *cpu, vaddr addr, MMUAccessType type,
     if (ops->tlb_fill_align) {
         if (ops->tlb_fill_align(cpu, &full, addr, type, mmu_idx,
                                 memop, size, probe, ra)) {
-            tlb_set_page_full(cpu, mmu_idx, addr, &full);
+            tlb_set_page_full(cpu, mmu_idx, addr, type, &full);
             return true;
         }
     } else {
diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
index fea0474cf6..4ea67e8a96 100644
--- a/include/exec/cputlb.h
+++ b/include/exec/cputlb.h
@@ -40,6 +40,7 @@ void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
  * @cpu: CPU context
  * @mmu_idx: mmu index of the tlb to modify
  * @addr: virtual address of the entry to add
+ * @access_type: access was read/write/execute
  * @full: the details of the tlb entry
  *
  * Add an entry to @cpu tlb index @mmu_idx.  All of the fields of
@@ -55,6 +56,7 @@ void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
  * used by tlb_flush_page.
  */
 void tlb_set_page_full(CPUState *cpu, int mmu_idx, vaddr addr,
+                       MMUAccessType access_type,
                        CPUTLBEntryFull *full);
 
 /**
@@ -64,6 +66,7 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx, vaddr addr,
  * @paddr: physical address of the page
  * @attrs: memory transaction attributes
  * @prot: access permissions (PAGE_READ/PAGE_WRITE/PAGE_EXEC bits)
+ * @access_type: access was read/write/execute
  * @mmu_idx: MMU index to insert TLB entry for
  * @size: size of the page in bytes
  *
@@ -80,9 +83,9 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx, vaddr addr,
  * used by tlb_flush_page.
  */
 void tlb_set_page_with_attrs(CPUState *cpu, vaddr addr,
-                             hwaddr paddr, MemTxAttrs attrs,
-                             int prot, int mmu_idx, vaddr size);
-
+                             hwaddr paddr, MemTxAttrs attrs, int prot,
+                             MMUAccessType access_type, int mmu_idx,
+                             vaddr size);
 /**
  * tlb_set_page:
  *
@@ -91,7 +94,7 @@ void tlb_set_page_with_attrs(CPUState *cpu, vaddr addr,
  * as a convenience for CPUs which don't use memory transaction attributes.
  */
 void tlb_set_page(CPUState *cpu, vaddr addr,
-                  hwaddr paddr, int prot,
+                  hwaddr paddr, int prot, MMUAccessType access_type,
                   int mmu_idx, vaddr size);
 
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 46be330d99..63bec1446c 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -217,7 +217,8 @@ static inline tb_page_addr_t get_page_addr_code(CPUArchState *env,
 MemoryRegionSection *
 address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
                                   hwaddr *xlat, hwaddr *plen,
-                                  MemTxAttrs attrs, int *prot);
+                                  MemTxAttrs attrs, int *prot,
+                                  MMUAccessType access_type);
 hwaddr memory_region_section_get_iotlb(CPUState *cpu,
                                        MemoryRegionSection *section);
 #endif
diff --git a/system/physmem.c b/system/physmem.c
index da58d5c8ae..fc04725096 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -681,12 +681,14 @@ void tcg_iommu_init_notifier_list(CPUState *cpu)
 MemoryRegionSection *
 address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr orig_addr,
                                   hwaddr *xlat, hwaddr *plen,
-                                  MemTxAttrs attrs, int *prot)
+                                  MemTxAttrs attrs, int *prot,
+                                  MMUAccessType access_type)
 {
     MemoryRegionSection *section;
     IOMMUMemoryRegion *iommu_mr;
     IOMMUMemoryRegionClass *imrc;
     IOMMUTLBEntry iotlb;
+    IOMMUAccessFlags iommu_flags;
     int iommu_idx;
     hwaddr addr = orig_addr;
     AddressSpaceDispatch *d = cpu->cpu_ases[asidx].memory_dispatch;
@@ -703,10 +705,14 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr orig_addr,
 
         iommu_idx = imrc->attrs_to_index(iommu_mr, attrs);
         tcg_register_iommu_notifier(cpu, iommu_mr, iommu_idx);
-        /* We need all the permissions, so pass IOMMU_NONE so the IOMMU
-         * doesn't short-cut its translation table walk.
-         */
-        iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, iommu_idx);
+
+        if (access_type == MMU_DATA_STORE) {
+            iommu_flags = IOMMU_WO;
+        } else {
+            iommu_flags = IOMMU_RO;
+        }
+
+        iotlb = imrc->translate(iommu_mr, addr, iommu_flags, iommu_idx);
         addr = ((iotlb.translated_addr & ~iotlb.addr_mask)
                 | (addr & iotlb.addr_mask));
         /* Update the caller's prot bits to remove permissions the IOMMU
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 57cefcba14..e16dcde3ac 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -318,7 +318,7 @@ bool alpha_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
     }
 
     tlb_set_page(cs, addr & TARGET_PAGE_MASK, phys & TARGET_PAGE_MASK,
-                 prot, mmu_idx, TARGET_PAGE_SIZE);
+                 prot, access_type, mmu_idx, TARGET_PAGE_SIZE);
     return true;
 }
 
diff --git a/target/avr/helper.c b/target/avr/helper.c
index 3412312ad5..05a89b3614 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -149,7 +149,7 @@ bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         }
     }
 
-    tlb_set_page(cs, address, paddr, prot, mmu_idx, page_size);
+    tlb_set_page(cs, address, paddr, prot, access_type, mmu_idx, page_size);
     return true;
 }
 
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index fb1d93ef1f..4f0982a2c1 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -473,7 +473,6 @@ bool hppa_cpu_tlb_fill_align(CPUState *cs, CPUTLBEntryFull *out, vaddr addr,
     out->prot = prot;
     out->attrs = MEMTXATTRS_UNSPECIFIED;
     out->lg_page_size = TARGET_PAGE_BITS;
-
     return true;
 }
 
diff --git a/target/i386/tcg/system/excp_helper.c b/target/i386/tcg/system/excp_helper.c
index 6876329de2..831e178927 100644
--- a/target/i386/tcg/system/excp_helper.c
+++ b/target/i386/tcg/system/excp_helper.c
@@ -624,7 +624,8 @@ bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         tlb_set_page_with_attrs(cs, addr & TARGET_PAGE_MASK,
                                 out.paddr & TARGET_PAGE_MASK,
                                 cpu_get_mem_attrs(env),
-                                out.prot, mmu_idx, out.page_size);
+                                out.prot, access_type, mmu_idx,
+                                out.page_size);
         return true;
     }
 
diff --git a/target/loongarch/tcg/tlb_helper.c b/target/loongarch/tcg/tlb_helper.c
index 70d1b5cf99..b57775908d 100644
--- a/target/loongarch/tcg/tlb_helper.c
+++ b/target/loongarch/tcg/tlb_helper.c
@@ -522,7 +522,7 @@ bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (ret == TLBRET_MATCH) {
         tlb_set_page(cs, address & TARGET_PAGE_MASK,
                      physical & TARGET_PAGE_MASK, prot,
-                     mmu_idx, TARGET_PAGE_SIZE);
+                     access_type, mmu_idx, TARGET_PAGE_SIZE);
         qemu_log_mask(CPU_LOG_MMU,
                       "%s address=%" VADDR_PRIx " physical " HWADDR_FMT_plx
                       " prot %d\n", __func__, address, physical, prot);
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 0bf574830f..e652c23485 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -969,7 +969,7 @@ bool m68k_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         tlb_set_page(cs, address & TARGET_PAGE_MASK,
                      address & TARGET_PAGE_MASK,
                      PAGE_READ | PAGE_WRITE | PAGE_EXEC,
-                     mmu_idx, TARGET_PAGE_SIZE);
+                     qemu_access_type, mmu_idx, TARGET_PAGE_SIZE);
         return true;
     }
 
@@ -989,7 +989,8 @@ bool m68k_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                                address, access_type, &page_size);
     if (likely(ret == 0)) {
         tlb_set_page(cs, address & TARGET_PAGE_MASK,
-                     physical & TARGET_PAGE_MASK, prot, mmu_idx, page_size);
+                     physical & TARGET_PAGE_MASK, prot, qemu_access_type,
+                     mmu_idx, page_size);
         return true;
     }
 
@@ -1461,6 +1462,7 @@ void HELPER(ptest)(CPUM68KState *env, uint32_t addr, uint32_t is_read)
     int prot;
     int ret;
     target_ulong page_size;
+    MMUAccessType qemu_access_type;
 
     access_type = ACCESS_PTEST;
     if (env->dfc & 4) {
@@ -1468,9 +1470,11 @@ void HELPER(ptest)(CPUM68KState *env, uint32_t addr, uint32_t is_read)
     }
     if ((env->dfc & 3) == 2) {
         access_type |= ACCESS_CODE;
+        qemu_access_type = MMU_INST_FETCH;
     }
     if (!is_read) {
         access_type |= ACCESS_STORE;
+        qemu_access_type = MMU_DATA_STORE;
     }
 
     env->mmu.mmusr = 0;
@@ -1480,7 +1484,7 @@ void HELPER(ptest)(CPUM68KState *env, uint32_t addr, uint32_t is_read)
     if (ret == 0) {
         tlb_set_page(env_cpu(env), addr & TARGET_PAGE_MASK,
                      physical & TARGET_PAGE_MASK,
-                     prot, access_type & ACCESS_SUPER ?
+                     prot, qemu_access_type, access_type & ACCESS_SUPER ?
                      MMU_KERNEL_IDX : MMU_USER_IDX, page_size);
     }
 }
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index 27fc929bee..fd8847e71f 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -53,8 +53,8 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         /* MMU disabled or not available.  */
         address &= TARGET_PAGE_MASK;
         prot = PAGE_RWX;
-        tlb_set_page_with_attrs(cs, address, address, attrs, prot, mmu_idx,
-                                TARGET_PAGE_SIZE);
+        tlb_set_page_with_attrs(cs, address, address, attrs, prot, access_type,
+                                mmu_idx, TARGET_PAGE_SIZE);
         return true;
     }
 
@@ -65,8 +65,8 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
         qemu_log_mask(CPU_LOG_MMU, "MMU map mmu=%d v=%x p=%x prot=%x\n",
                       mmu_idx, vaddr, paddr, lu.prot);
-        tlb_set_page_with_attrs(cs, vaddr, paddr, attrs, lu.prot, mmu_idx,
-                                TARGET_PAGE_SIZE);
+        tlb_set_page_with_attrs(cs, vaddr, paddr, attrs, lu.prot, access_type,
+                                mmu_idx, TARGET_PAGE_SIZE);
         return true;
     }
 
diff --git a/target/mips/tcg/system/tlb_helper.c b/target/mips/tcg/system/tlb_helper.c
index df80301a41..172640aef0 100644
--- a/target/mips/tcg/system/tlb_helper.c
+++ b/target/mips/tcg/system/tlb_helper.c
@@ -933,7 +933,7 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (ret == TLBRET_MATCH) {
         tlb_set_page(cs, address & TARGET_PAGE_MASK,
                      physical & TARGET_PAGE_MASK, prot,
-                     mmu_idx, TARGET_PAGE_SIZE);
+                     access_type, mmu_idx, TARGET_PAGE_SIZE);
         return true;
     }
 #if !defined(TARGET_MIPS64)
@@ -951,7 +951,7 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             if (ret == TLBRET_MATCH) {
                 tlb_set_page(cs, address & TARGET_PAGE_MASK,
                              physical & TARGET_PAGE_MASK, prot,
-                             mmu_idx, TARGET_PAGE_SIZE);
+                             access_type, mmu_idx, TARGET_PAGE_SIZE);
                 return true;
             }
         }
diff --git a/target/openrisc/mmu.c b/target/openrisc/mmu.c
index 47ac783c52..5248c168b2 100644
--- a/target/openrisc/mmu.c
+++ b/target/openrisc/mmu.c
@@ -128,7 +128,7 @@ bool openrisc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
     if (likely(excp == 0)) {
         tlb_set_page(cs, addr & TARGET_PAGE_MASK,
                      phys_addr & TARGET_PAGE_MASK, prot,
-                     mmu_idx, TARGET_PAGE_SIZE);
+                     access_type, mmu_idx, TARGET_PAGE_SIZE);
         return true;
     }
     if (probe) {
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index ad9ba8294c..d0e8f20e11 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1369,7 +1369,7 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
     if (ppc_xlate(cpu, eaddr, access_type, &raddr,
                   &page_size, &prot, mmu_idx, !probe)) {
         tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
-                     prot, mmu_idx, 1UL << page_size);
+                     prot, access_type, mmu_idx, 1UL << page_size);
         return true;
     }
     if (probe) {
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 6c4391d96b..f4c4b69a3c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1967,7 +1967,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
     if (ret == TRANSLATE_SUCCESS) {
         tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
-                     prot, mmu_idx, tlb_size);
+                     prot, access_type, mmu_idx, tlb_size);
         return true;
     } else if (probe) {
         return false;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 0ba0d55ab5..9d8afa150c 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -182,7 +182,8 @@ static bool rx_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
     /* Linear mapping */
     address = physical = addr & TARGET_PAGE_MASK;
     prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-    tlb_set_page(cs, address, physical, prot, mmu_idx, TARGET_PAGE_SIZE);
+    tlb_set_page(cs, address, physical, prot, access_type,
+                 mmu_idx, TARGET_PAGE_SIZE);
     return true;
 }
 
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index f969850f87..ec6d4076e8 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -179,7 +179,7 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       "%s: set tlb %" PRIx64 " -> %" PRIx64 " (%x)\n",
                       __func__, (uint64_t)vaddr, (uint64_t)raddr, prot);
         tlb_set_page(cs, address & TARGET_PAGE_MASK, raddr, prot,
-                     mmu_idx, TARGET_PAGE_SIZE);
+                     access_type, mmu_idx, TARGET_PAGE_SIZE);
         return true;
     }
     if (probe) {
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 7567e6c8b6..7531f6d933 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -808,7 +808,7 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (ret == MMU_OK) {
         address &= TARGET_PAGE_MASK;
         physical &= TARGET_PAGE_MASK;
-        tlb_set_page(cs, address, physical, prot, mmu_idx, TARGET_PAGE_SIZE);
+        tlb_set_page(cs, address, physical, prot, access_type, mmu_idx, TARGET_PAGE_SIZE);
         return true;
     }
     if (probe) {
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 3821cd91ec..08dd73b210 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -229,7 +229,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       "Translate at %" VADDR_PRIx " -> "
                       HWADDR_FMT_plx ", vaddr " TARGET_FMT_lx "\n",
                       address, full.phys_addr, vaddr);
-        tlb_set_page_full(cs, mmu_idx, vaddr, &full);
+        tlb_set_page_full(cs, mmu_idx, vaddr, access_type, &full);
         return true;
     }
 
@@ -245,7 +245,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
            neverland. Fake/overridden mappings will be flushed when
            switching to normal mode. */
         full.prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        tlb_set_page_full(cs, mmu_idx, vaddr, &full);
+        tlb_set_page_full(cs, mmu_idx, vaddr, access_type, &full);
         return true;
     } else {
         if (access_type == MMU_INST_FETCH) {
@@ -769,7 +769,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         trace_mmu_helper_mmu_fault(address, full.phys_addr, mmu_idx, env->tl,
                                    env->dmmu.mmu_primary_context,
                                    env->dmmu.mmu_secondary_context);
-        tlb_set_page_full(cs, mmu_idx, address, &full);
+        tlb_set_page_full(cs, mmu_idx, address, access_type, &full);
         return true;
     }
     if (probe) {
diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index a64412e6bd..4a4688f109 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -84,7 +84,7 @@ bool tricore_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (ret == TLBRET_MATCH) {
         tlb_set_page(cs, address & TARGET_PAGE_MASK,
                      physical & TARGET_PAGE_MASK, prot | PAGE_EXEC,
-                     mmu_idx, TARGET_PAGE_SIZE);
+                     rw, mmu_idx, TARGET_PAGE_SIZE);
         return true;
     } else {
         assert(ret < 0);
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index 4824b97e37..5d5d69a811 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -281,7 +281,8 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         tlb_set_page(cs,
                      address & TARGET_PAGE_MASK,
                      paddr & TARGET_PAGE_MASK,
-                     access, mmu_idx, page_size);
+                     access, access_type, mmu_idx,
+                     page_size);
         return true;
     } else if (probe) {
         return false;
-- 
2.17.1


