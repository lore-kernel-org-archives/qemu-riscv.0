Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B37C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 20:39:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvL8p-0008Nw-0c; Sat, 15 Aug 2026 16:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8n-0008LE-1f
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:38:05 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8c-0008IO-MY
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:38:04 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-38e69bdb0fcso1701211a91.1
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 13:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826266; x=1787431066; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=a24LZzn/VPxjQJEt2LC7ZUVxYoHxQJoEEiHc8hSgRl8=;
 b=th7U+C5UhfWLAYSbHzvtXdPeNMnMnkc9irmEnTRw3C1kai0Z9m4wn8zkhE8ojWXRlX
 QIc4noJpSwwQ+AYQYqegQ6TOD1FI2rcHWaFatc5Kt1U3FkA3OJbqU2pZKqFpWo5VPWh8
 +TooesDmH9f893jVKdvGJczbO+gDnuYSuxxnPt4GCibcUhx4xVupiubVR3XO9gwjU8Zv
 +eFK0FsXTlppPDkEb+57DYN4vmr4eSM+iuZ5vmrbe0kcXSGy6tcTnOUWF0DGfc8XFJ51
 IVAwZBbh0NAGbLxkzsLux4R5RL+ki/rELCyCgi754F2lcyc1lnwD7b6yYOyoNS2V3MOP
 0szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826266; x=1787431066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=a24LZzn/VPxjQJEt2LC7ZUVxYoHxQJoEEiHc8hSgRl8=;
 b=CGurlTcrOshkSNtXOYHQ7PEk+vYLvidD9CvJurCMZYjHnsCk+yG+V0H8YDtTG6zO8q
 bs95uZRmZJOR2LOL3fh9T4vHaCB8eCpiqkUJybL7MrHanuwGUQeBMaJ1pA4wuLFuBnpC
 j6kkTSOUO//tpZaRtMNcznxdNGLmAZ+kEazXQPhxGE+4AbG0Wja53IcjOIbRCo+Qc+ML
 fOKcbhaXOC2vgU1Hq5sIl7x2B4sGk1yhws7Am5cL/ufRupVNoIuEcvqv+ZeTsRIXwYuV
 jSOcF8uD4KxFVFF9rOIb2aNI4zec5CURwQrjqm9Y8oYh3hVajc2vI62jYeEnhJZ9+af7
 ypPg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqEZ3fjhqE4lL8Xw/g7jaBOVEwa9XHn6IrySv1X4VVNbng7bdXrzyhfdY+sYaCLfywXd5zDMgeoglfR@nongnu.org
X-Gm-Message-State: AOJu0YxQkiL410NF9e1UEeglzdC4jZODFm5q3oRaSKgZSqHXJM6xo8zo
 cBLRAtYMuq1rg3MZeCEj8SLVrLNN+5xSIGdCQF+2uaoVdmquf2uO8i41LhxNq5xMm1o=
X-Gm-Gg: AR+sD13fUz6/i9mOIcMLeE5S+G5fLMrG+kme0RGt9JgJrSAyQh7vmleiEgTcJ0ldtLx
 FH2kXlzk7FCukMVywnYxGo8I8+azsNjdoSzddg+n9M3rEHK8H2RAcRyvtXbg5GAiow0WPEsqZV7
 oAIqf+FapnoupbKFkFngdZqpqPk5nhG0/5hDWqj1L/msawB+JbjXjwXkgf9MK6lIVqjdXbcG15M
 NOk7JIzkLMsuuy9wCl5MFIPZcaJXZCoehwwG6KM64N6s8RkD0M/YDwUPcXFlILSpoZ2KbIoMJXq
 X/y6Ar7N2LjIKfv3wkjac86lyvtRH2aQCkdiCfSGdbEmJhxZHlJG9I2XHe0oKH0voRq6Ovv5tBE
 Y28/2yoJRyW9JjOBCwiD8gqcMhUB6sq4YgX0eX0xpPlxADzEMt6AhlBmJ2MTlLK1Pzvz4zy3fCP
 dAZqu3nNraexI/QtGr0w1yEoBX7LT50YiSrRFOpRUhLrvbsKt9zHfYaKJcpe9q1sz3/r84ZGQon
 NOt9bsb5XS2YH1QiYMcuZ7EdwYPBgc=
X-Received: by 2002:a17:90b:2245:b0:37d:f983:7b5 with SMTP id
 98e67ed59e1d1-3933cb9859cmr14421160a91.9.1786826265857; 
 Sat, 15 Aug 2026 13:37:45 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 08/18] accel/tcg: Replace size with first/last in
 probe_access_flags
Date: Sat, 15 Aug 2026 13:37:20 -0700
Message-ID: <20260815203730.1468365-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/accel/tcg/probe.h        | 24 +++++++++++++++++-------
 accel/tcg/cputlb.c               | 15 ++++++++-------
 accel/tcg/user-exec.c            |  7 +++++--
 semihosting/uaccess.c            | 10 ++++------
 target/arm/tcg/sve_helper.c      |  5 ++++-
 target/riscv/tcg/op_helper.c     |  4 ++--
 target/riscv/tcg/vector_helper.c | 21 ++++++++++++---------
 target/s390x/tcg/mem_helper.c    |  4 ++--
 8 files changed, 54 insertions(+), 36 deletions(-)

diff --git a/include/accel/tcg/probe.h b/include/accel/tcg/probe.h
index e3068a79de..06faf1269d 100644
--- a/include/accel/tcg/probe.h
+++ b/include/accel/tcg/probe.h
@@ -49,23 +49,33 @@ static inline void *probe_read(CPUArchState *env, vaddr addr, int size,
 /**
  * probe_access_flags:
  * @env: CPUArchState
- * @addr: guest virtual address to look up
- * @size: size of the access
+ * @addr: virtual address
+ * @first: beginning of virtual address range
+ * @last: end of virtual address range
  * @access_type: read, write or execute permission
  * @mmu_idx: MMU index to use for lookup
  * @nonfault: suppress the fault
  * @phost: return value for host address
  * @retaddr: return address for unwinding
  *
- * Similar to probe_access, loosely returning the TLB_FLAGS_MASK for
- * the page, and storing the host address for RAM in @phost.
+ * Probe an access for [@first, @last], where @addr is somewhere
+ * in that range.  Normally @addr == @first, but some targets have
+ * accesses which are forcibly aligned after an initial fault for an
+ * inaccessible page (e.g. Arm DC_ZVA, where [@first, @last] will be
+ * the bounds of the cacheline containing @addr).
+ *
+ * If the access does not satisfy @access_type:
+ *   - if @nonfault is false, raise an exception at @addr
+ *   - otherwise return TLB_INVALID_MASK.
+ *
+ * Otherwise, return the TLB_FLAGS_MASK for the page, and set @phost:
+ *   - host address for @addr, if direct host accesses are allowed,
+ *   - otherwise NULL.
  *
- * If @nonfault is set, do not raise an exception but return TLB_INVALID_MASK.
  * Do not handle watchpoints, but include TLB_WATCHPOINT in the returned flags.
  * Do handle clean pages, so exclude TLB_NOTDIRY from the returned flags.
- * For simplicity, all "mmio-like" flags are folded to TLB_MMIO.
  */
-int probe_access_flags(CPUArchState *env, vaddr addr, int size,
+int probe_access_flags(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr);
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 6299cc73a4..a192c50e90 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1460,23 +1460,24 @@ int probe_access_full_mmu(CPUArchState *env, vaddr addr, int size,
     return flags;
 }
 
-int probe_access_flags(CPUArchState *env, vaddr addr, int size,
+int probe_access_flags(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr)
 {
     CPUTLBEntryFull *full;
     int flags;
 
-    g_assert(-(addr | TARGET_PAGE_MASK) >= size);
+    assert(first <= addr);
+    assert(addr <= last);
+    assert(((first ^ last) & TARGET_PAGE_MASK) == 0);
 
-    flags = probe_access_internal(env_cpu(env), addr, size, access_type,
-                                  mmu_idx, nonfault, phost, &full, retaddr,
-                                  true);
+    flags = probe_access_internal(env_cpu(env), addr, last - addr + 1,
+                                  access_type, mmu_idx, nonfault,
+                                  phost, &full, retaddr, true);
 
     /* Handle clean RAM pages. */
     if (unlikely(flags & TLB_NOTDIRTY)) {
-        int dirtysize = size == 0 ? 1 : size;
-        notdirty_write(env_cpu(env), addr, dirtysize, full, retaddr);
+        notdirty_write(env_cpu(env), first, last - first + 1, full, retaddr);
         flags &= ~TLB_NOTDIRTY;
     }
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 3724e5d98e..44e9f7fa1a 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -790,13 +790,16 @@ static int probe_access_internal(CPUArchState *env, vaddr addr,
     cpu_loop_exit_sigsegv(env_cpu(env), addr, access_type, maperr, ra);
 }
 
-int probe_access_flags(CPUArchState *env, vaddr addr, int size,
+int probe_access_flags(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t ra)
 {
     int flags;
 
-    g_assert(-(addr | TARGET_PAGE_MASK) >= size);
+    assert(first <= addr);
+    assert(addr <= first);
+    assert(((first ^ last) & TARGET_PAGE_MASK) == 0);
+
     flags = probe_access_internal(env, addr, access_type, nonfault, ra);
     *phost = (flags & TLB_INVALID_MASK) ? NULL : g2h_vaddr(env_cpu(env), addr);
     return flags;
diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
index ff944d8c2f..1efe8464d7 100644
--- a/semihosting/uaccess.c
+++ b/semihosting/uaccess.c
@@ -33,15 +33,13 @@ ssize_t uaccess_strlen_user(CPUArchState *env, vaddr addr)
     size_t len = 0;
 
     while (1) {
-        size_t left_in_page;
+        vaddr last_in_page = addr | ~TARGET_PAGE_MASK;
+        size_t left_in_page = last_in_page - addr + 1;
         int flags;
         void *h;
 
-        /* Find the number of bytes remaining in the page. */
-        left_in_page = TARGET_PAGE_SIZE - (addr & ~TARGET_PAGE_MASK);
-
-        flags = probe_access_flags(env, addr, 0, MMU_DATA_LOAD,
-                                   mmu_idx, true, &h, 0);
+        flags = probe_access_flags(env, addr, addr, last_in_page,
+                                   MMU_DATA_LOAD, mmu_idx, true, &h, 0);
         if (flags & TLB_INVALID_MASK) {
             return -1;
         }
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 4e77a824dd..b824933694 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -6036,7 +6036,10 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
     addr = useronly_clean_ptr(addr);
 
 #ifdef CONFIG_USER_ONLY
-    flags = probe_access_flags(env, addr, 0, access_type, mmu_idx, nofault,
+    flags = probe_access_flags(env, addr,
+                               addr & TARGET_PAGE_MASK,
+                               addr | ~TARGET_PAGE_MASK,
+                               access_type, mmu_idx, nofault,
                                &info->host, retaddr);
 #else
     CPUTLBEntryFull *full;
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index a7bd42d2c6..b18bf683f4 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -250,8 +250,8 @@ static void check_zicbom_access(CPURISCVState *env,
      * addresses, whether a cache-block management instruction is
      * permitted to access the cache block is UNSPECIFIED."
      */
-    ret = probe_access_flags(env, address, cbomlen, MMU_DATA_LOAD,
-                             mmu_idx, true, &phost, ra);
+    ret = probe_access_flags(env, address, address, address + cbomlen - 1,
+                             MMU_DATA_LOAD, mmu_idx, true, &phost, ra);
     if (ret != TLB_INVALID_MASK) {
         /* Success: readable */
         return;
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index b7b3805a6d..87f2196bc7 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -704,7 +704,7 @@ vext_ldff(void *vd, target_ulong base, CPURISCVState *env,
     uint32_t esz = 1 << log2_esz;
     uint32_t msize = nf * esz;
     uint32_t vma = vext_vma(desc);
-    target_ulong addr, last, last_in_page, page_split, elems;
+    target_ulong addr, last, last_in_page, page_split, elems, adj, adj_last;
     MemOpIdx oi = vext_oi(desc, log2_esz);
     int mmu_index = get_mmuidx(oi);
     bool first_active;
@@ -759,10 +759,10 @@ vext_ldff(void *vd, target_ulong base, CPURISCVState *env,
      * Test whether the first page is accessible.
      * If the first element is active, it must succeed.
      */
-    flags = probe_access_flags(env, adjust_addr(env, addr),
-                               MIN(last, last_in_page) - addr + 1,
-                               MMU_DATA_LOAD, mmu_index, !first_active,
-                               &host, ra);
+    adj = adjust_addr(env, addr);
+    adj_last = MIN(last, last_in_page) - (addr - adj);
+    flags = probe_access_flags(env, adj, adj, adj_last, MMU_DATA_LOAD,
+                               mmu_index, !first_active, &host, ra);
 
     /* Get number of complete elements in the first page. */
     elems = MIN(page_split / msize, vl - i);
@@ -853,8 +853,10 @@ vext_ldff(void *vd, target_ulong base, CPURISCVState *env,
          * We have not yet advanced addr to the next page.
          */
         target_ulong next_page = addr + page_split;
-        flags |= probe_access_flags(env, adjust_addr(env, next_page),
-                                    last - next_page + 1, MMU_DATA_LOAD,
+
+        adj = adjust_addr(env, next_page);
+        adj_last = last - (next_page - adj);
+        flags |= probe_access_flags(env, adj, adj, adj_last, MMU_DATA_LOAD,
                                     mmu_index, true, &host, ra);
 
         /* Stop if invalid (unmapped) or mmio (transaction may fail). */
@@ -873,8 +875,9 @@ vext_ldff(void *vd, target_ulong base, CPURISCVState *env,
             host += addr - next_page;
         }
     } else {
-        flags = probe_access_flags(env, adjust_addr(env, addr),
-                                   last - addr + 1, MMU_DATA_LOAD,
+        adj = adjust_addr(env, addr);
+        adj_last = last - (addr - adj);
+        flags = probe_access_flags(env, adj, adj, adj_last, MMU_DATA_LOAD,
                                    mmu_index, true, &host, ra);
 
         /* Stop if invalid (unmapped) or mmio (transaction may fail). */
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 414e6838c8..d490434806 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -155,8 +155,8 @@ static inline int s390_probe_access(CPUArchState *env, vaddr addr,
                                     int mmu_idx, bool nonfault,
                                     void **phost, uintptr_t ra)
 {
-    int flags = probe_access_flags(env, addr, size, access_type, mmu_idx,
-                                   nonfault, phost, ra);
+    int flags = probe_access_flags(env, addr, addr, addr + size - 1,
+                                   access_type, mmu_idx, nonfault, phost, ra);
 
     if (unlikely(flags & TLB_INVALID_MASK)) {
 #ifdef CONFIG_USER_ONLY
-- 
2.43.0


