Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOP5-00006O-U9
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOP3-0008Vt-Ud
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:32:41 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOOq-0004B8-FH
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:32:41 -0400
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2a8baeac4d1so60884561fa.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451147; x=1685043147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TNOwPdw13oV5pbwhhGogevI1pWDH//U3rXo9/oNBk00=;
 b=GpXvyOVm0YUzakVMGSgh4JapHnIfbtchCGX0+rJF24a1AdQnxRDv7inJUO3PsgFpWA
 wkDvu7qXklGoWiutMRj0UIChnXpzd0LCoQH1Gs27Vt5wN6/QKtJAsTlgzQysbs6suy0s
 NJtAOtcJ2rQ20XZk2Z87GcOEVtHXF2R7t1QGwgYV9psa5Dh4jokTW/I0b1Ft5/kvSIDb
 k1zUvTm4NpsPZr4bBJOku4ksi+8azpQDXnUBCcXqCQ/6chjD5bEZbV06eCy3bb923Yyt
 QRa/fMdiJkdBTAH9Y4KLFpHNlMF1JUJXzx3P64+NP6VahUx1j0YlIuHoJd2cxC8i3jEF
 mS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451147; x=1685043147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TNOwPdw13oV5pbwhhGogevI1pWDH//U3rXo9/oNBk00=;
 b=CJuLRNbjMevMJmi6n+qMN68vXh54TKBvE/y8HbxjU8drmJ80L8dXGgqFjXFc8aVpc4
 CRjlRv5/miLPBCVplPbJ8SwBavzcT+QyvCBUwT81HVuXkyxwDOZjdHBfgz6rJzjrVHXM
 oY5Y2TJ7QTrkVsw2Fina7jIOPU911dKqZAiCs1joloLJp1avm4oLJeP2i7xB611cWUa2
 igu64LkY/ldYYovwkDq5cdslq7+ja7c3jmlDeJR5dDYOFwXugWH66htuHtN/yaVUELww
 235drI9bTgW2vFgDd6AuaIbtmCSG7J4Yz9JlPnxNh1suMkkAFfJLp9GdVkUNkvsvlFVC
 uaJw==
X-Gm-Message-State: AAQBX9dbKo/1ExWncO4w+nHHjh/Nu1MG0SEWjBUwyix0HUuR6aMPpIdG
 nQm2QsxpunTYTbfoFx4u5cfzcQ==
X-Google-Smtp-Source: AKy350bIlMa4d0mOYGY1yYC+at9PbhFDDiGiNb5CDGIK++nqgnb0gYWUBzEijI0lrxkzTDXEuPvTQw==
X-Received: by 2002:a05:651c:1207:b0:2a7:6e37:ee68 with SMTP id
 i7-20020a05651c120700b002a76e37ee68mr3767990lja.12.1682451146693; 
 Tue, 25 Apr 2023 12:32:26 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:32:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 04/57] accel/tcg: Reorg system mode load helpers
Date: Tue, 25 Apr 2023 20:30:53 +0100
Message-Id: <20230425193146.2106111-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 19:32:42 -0000

Instead of trying to unify all operations on uint64_t, pull out
mmu_lookup() to perform the basic tlb hit and resolution.
Create individual functions to handle access by size.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 612 +++++++++++++++++++++++++++++++--------------
 1 file changed, 419 insertions(+), 193 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e68cf422c5..1b699ad786 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1711,6 +1711,178 @@ bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
 
 #endif
 
+/*
+ * Probe for a load/store operation.
+ * Return the host address and into @flags.
+ */
+
+typedef struct MMULookupPageData {
+    CPUTLBEntryFull *full;
+    void *haddr;
+    target_ulong addr;
+    int flags;
+    int size;
+} MMULookupPageData;
+
+typedef struct MMULookupLocals {
+    MMULookupPageData page[2];
+    MemOp memop;
+    int mmu_idx;
+} MMULookupLocals;
+
+/**
+ * mmu_lookup1: translate one page
+ * @env: cpu context
+ * @data: lookup parameters
+ * @mmu_idx: virtual address context
+ * @access_type: load/store/code
+ * @ra: return address into tcg generated code, or 0
+ *
+ * Resolve the translation for the one page at @data.addr, filling in
+ * the rest of @data with the results.  If the translation fails,
+ * tlb_fill will longjmp out.  Return true if the softmmu tlb for
+ * @mmu_idx may have resized.
+ */
+static bool mmu_lookup1(CPUArchState *env, MMULookupPageData *data,
+                        int mmu_idx, MMUAccessType access_type, uintptr_t ra)
+{
+    target_ulong addr = data->addr;
+    uintptr_t index = tlb_index(env, mmu_idx, addr);
+    CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
+    target_ulong tlb_addr = tlb_read_idx(entry, access_type);
+    bool maybe_resized = false;
+
+    /* If the TLB entry is for a different page, reload and try again.  */
+    if (!tlb_hit(tlb_addr, addr)) {
+        if (!victim_tlb_hit(env, mmu_idx, index, access_type,
+                            addr & TARGET_PAGE_MASK)) {
+            tlb_fill(env_cpu(env), addr, data->size, access_type, mmu_idx, ra);
+            maybe_resized = true;
+            index = tlb_index(env, mmu_idx, addr);
+            entry = tlb_entry(env, mmu_idx, addr);
+        }
+        tlb_addr = tlb_read_idx(entry, access_type) & ~TLB_INVALID_MASK;
+    }
+
+    data->flags = tlb_addr & TLB_FLAGS_MASK;
+    data->full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
+    /* Compute haddr speculatively; depending on flags it might be invalid. */
+    data->haddr = (void *)((uintptr_t)addr + entry->addend);
+
+    return maybe_resized;
+}
+
+/**
+ * mmu_watch_or_dirty
+ * @env: cpu context
+ * @data: lookup parameters
+ * @access_type: load/store/code
+ * @ra: return address into tcg generated code, or 0
+ *
+ * Trigger watchpoints for @data.addr:@data.size;
+ * record writes to protected clean pages.
+ */
+static void mmu_watch_or_dirty(CPUArchState *env, MMULookupPageData *data,
+                               MMUAccessType access_type, uintptr_t ra)
+{
+    CPUTLBEntryFull *full = data->full;
+    target_ulong addr = data->addr;
+    int flags = data->flags;
+    int size = data->size;
+
+    /* On watchpoint hit, this will longjmp out.  */
+    if (flags & TLB_WATCHPOINT) {
+        int wp = access_type == MMU_DATA_STORE ? BP_MEM_WRITE : BP_MEM_READ;
+        cpu_check_watchpoint(env_cpu(env), addr, size, full->attrs, wp, ra);
+        flags &= ~TLB_WATCHPOINT;
+    }
+
+    if (flags & TLB_NOTDIRTY) {
+        notdirty_write(env_cpu(env), addr, size, full, ra);
+        flags &= ~TLB_NOTDIRTY;
+    }
+    data->flags = flags;
+}
+
+/**
+ * mmu_lookup: translate page(s)
+ * @env: cpu context
+ * @addr: virtual address
+ * @oi: combined mmu_idx and MemOp
+ * @ra: return address into tcg generated code, or 0
+ * @access_type: load/store/code
+ * @l: output result
+ *
+ * Resolve the translation for the page(s) beginning at @addr, for MemOp.size
+ * bytes.  Return true if the lookup crosses a page boundary.
+ */
+static bool mmu_lookup(CPUArchState *env, target_ulong addr, MemOpIdx oi,
+                       uintptr_t ra, MMUAccessType type, MMULookupLocals *l)
+{
+    unsigned a_bits;
+    bool crosspage;
+    int flags;
+
+    l->memop = get_memop(oi);
+    l->mmu_idx = get_mmuidx(oi);
+
+    tcg_debug_assert(l->mmu_idx < NB_MMU_MODES);
+
+    /* Handle CPU specific unaligned behaviour */
+    a_bits = get_alignment_bits(l->memop);
+    if (addr & ((1 << a_bits) - 1)) {
+        cpu_unaligned_access(env_cpu(env), addr, type, l->mmu_idx, ra);
+    }
+
+    l->page[0].addr = addr;
+    l->page[0].size = memop_size(l->memop);
+    l->page[1].addr = (addr + l->page[0].size - 1) & TARGET_PAGE_MASK;
+    l->page[1].size = 0;
+    crosspage = (addr ^ l->page[1].addr) & TARGET_PAGE_MASK;
+
+    if (likely(!crosspage)) {
+        mmu_lookup1(env, &l->page[0], l->mmu_idx, type, ra);
+
+        flags = l->page[0].flags;
+        if (unlikely(flags & (TLB_WATCHPOINT | TLB_NOTDIRTY))) {
+            mmu_watch_or_dirty(env, &l->page[0], type, ra);
+        }
+        if (unlikely(flags & TLB_BSWAP)) {
+            l->memop ^= MO_BSWAP;
+        }
+    } else {
+        /* Finish compute of page crossing. */
+        int size1 = l->page[1].addr - addr;
+        l->page[1].size = l->page[0].size - size1;
+        l->page[0].size = size1;
+
+        /*
+         * Lookup both pages, recognizing exceptions from either.  If the
+         * second lookup potentially resized, refresh first CPUTLBEntryFull.
+         */
+        mmu_lookup1(env, &l->page[0], l->mmu_idx, type, ra);
+        if (mmu_lookup1(env, &l->page[1], l->mmu_idx, type, ra)) {
+            uintptr_t index = tlb_index(env, l->mmu_idx, addr);
+            l->page[0].full = &env_tlb(env)->d[l->mmu_idx].fulltlb[index];
+        }
+
+        flags = l->page[0].flags | l->page[1].flags;
+        if (unlikely(flags & (TLB_WATCHPOINT | TLB_NOTDIRTY))) {
+            mmu_watch_or_dirty(env, &l->page[0], type, ra);
+            mmu_watch_or_dirty(env, &l->page[1], type, ra);
+        }
+
+        /*
+         * Since target/sparc is the only user of TLB_BSWAP, and all
+         * Sparc accesses are aligned, any treatment across two pages
+         * would be arbitrary.  Refuse it until there's a use.
+         */
+        tcg_debug_assert((flags & TLB_BSWAP) == 0);
+    }
+
+    return crosspage;
+}
+
 /*
  * Probe for an atomic operation.  Do not allow unaligned operations,
  * or io operations to proceed.  Return the host address.
@@ -1885,113 +2057,6 @@ load_memop(const void *haddr, MemOp op)
     }
 }
 
-static inline uint64_t QEMU_ALWAYS_INLINE
-load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
-            uintptr_t retaddr, MemOp op, MMUAccessType access_type,
-            FullLoadHelper *full_load)
-{
-    const unsigned a_bits = get_alignment_bits(get_memop(oi));
-    const size_t size = memop_size(op);
-    uintptr_t mmu_idx = get_mmuidx(oi);
-    uintptr_t index;
-    CPUTLBEntry *entry;
-    target_ulong tlb_addr;
-    void *haddr;
-    uint64_t res;
-
-    tcg_debug_assert(mmu_idx < NB_MMU_MODES);
-
-    /* Handle CPU specific unaligned behaviour */
-    if (addr & ((1 << a_bits) - 1)) {
-        cpu_unaligned_access(env_cpu(env), addr, access_type,
-                             mmu_idx, retaddr);
-    }
-
-    index = tlb_index(env, mmu_idx, addr);
-    entry = tlb_entry(env, mmu_idx, addr);
-    tlb_addr = tlb_read_idx(entry, access_type);
-
-    /* If the TLB entry is for a different page, reload and try again.  */
-    if (!tlb_hit(tlb_addr, addr)) {
-        if (!victim_tlb_hit(env, mmu_idx, index, access_type,
-                            addr & TARGET_PAGE_MASK)) {
-            tlb_fill(env_cpu(env), addr, size,
-                     access_type, mmu_idx, retaddr);
-            index = tlb_index(env, mmu_idx, addr);
-            entry = tlb_entry(env, mmu_idx, addr);
-        }
-        tlb_addr = tlb_read_idx(entry, access_type);
-        tlb_addr &= ~TLB_INVALID_MASK;
-    }
-
-    /* Handle anything that isn't just a straight memory access.  */
-    if (unlikely(tlb_addr & ~TARGET_PAGE_MASK)) {
-        CPUTLBEntryFull *full;
-        bool need_swap;
-
-        /* For anything that is unaligned, recurse through full_load.  */
-        if ((addr & (size - 1)) != 0) {
-            goto do_unaligned_access;
-        }
-
-        full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
-
-        /* Handle watchpoints.  */
-        if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
-            /* On watchpoint hit, this will longjmp out.  */
-            cpu_check_watchpoint(env_cpu(env), addr, size,
-                                 full->attrs, BP_MEM_READ, retaddr);
-        }
-
-        need_swap = size > 1 && (tlb_addr & TLB_BSWAP);
-
-        /* Handle I/O access.  */
-        if (likely(tlb_addr & TLB_MMIO)) {
-            return io_readx(env, full, mmu_idx, addr, retaddr,
-                            access_type, op ^ (need_swap * MO_BSWAP));
-        }
-
-        haddr = (void *)((uintptr_t)addr + entry->addend);
-
-        /*
-         * Keep these two load_memop separate to ensure that the compiler
-         * is able to fold the entire function to a single instruction.
-         * There is a build-time assert inside to remind you of this.  ;-)
-         */
-        if (unlikely(need_swap)) {
-            return load_memop(haddr, op ^ MO_BSWAP);
-        }
-        return load_memop(haddr, op);
-    }
-
-    /* Handle slow unaligned access (it spans two pages or IO).  */
-    if (size > 1
-        && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
-                    >= TARGET_PAGE_SIZE)) {
-        target_ulong addr1, addr2;
-        uint64_t r1, r2;
-        unsigned shift;
-    do_unaligned_access:
-        addr1 = addr & ~((target_ulong)size - 1);
-        addr2 = addr1 + size;
-        r1 = full_load(env, addr1, oi, retaddr);
-        r2 = full_load(env, addr2, oi, retaddr);
-        shift = (addr & (size - 1)) * 8;
-
-        if (memop_big_endian(op)) {
-            /* Big-endian combine.  */
-            res = (r1 << shift) | (r2 >> ((size * 8) - shift));
-        } else {
-            /* Little-endian combine.  */
-            res = (r1 >> shift) | (r2 << ((size * 8) - shift));
-        }
-        return res & MAKE_64BIT_MASK(0, size * 8);
-    }
-
-    haddr = (void *)((uintptr_t)addr + entry->addend);
-    return load_memop(haddr, op);
-}
-
 /*
  * For the benefit of TCG generated code, we want to avoid the
  * complication of ABI-specific return type promotion and always
@@ -2002,90 +2067,250 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
  * We don't bother with this widened value for SOFTMMU_CODE_ACCESS.
  */
 
-static uint64_t full_ldub_mmu(CPUArchState *env, target_ulong addr,
-                              MemOpIdx oi, uintptr_t retaddr)
+/**
+ * do_ld_mmio_beN:
+ * @env: cpu context
+ * @p: translation parameters
+ * @ret_be: accumulated data
+ * @mmu_idx: virtual address context
+ * @ra: return address into tcg generated code, or 0
+ *
+ * Load @p->size bytes from @p->addr, which is memory-mapped i/o.
+ * The bytes are concatenated with in big-endian order with @ret_be.
+ */
+static uint64_t do_ld_mmio_beN(CPUArchState *env, MMULookupPageData *p,
+                               uint64_t ret_be, int mmu_idx,
+                               MMUAccessType type, uintptr_t ra)
 {
-    validate_memop(oi, MO_UB);
-    return load_helper(env, addr, oi, retaddr, MO_UB, MMU_DATA_LOAD,
-                       full_ldub_mmu);
+    CPUTLBEntryFull *full = p->full;
+    target_ulong addr = p->addr;
+    int i, size = p->size;
+
+    QEMU_IOTHREAD_LOCK_GUARD();
+    for (i = 0; i < size; i++) {
+        uint8_t x = io_readx(env, full, mmu_idx, addr + i, ra, type, MO_UB);
+        ret_be = (ret_be << 8) | x;
+    }
+    return ret_be;
+}
+
+/**
+ * do_ld_bytes_beN
+ * @p: translation parameters
+ * @ret_be: accumulated data
+ *
+ * Load @p->size bytes from @p->haddr, which is RAM.
+ * The bytes to concatenated in big-endian order with @ret_be.
+ */
+static uint64_t do_ld_bytes_beN(MMULookupPageData *p, uint64_t ret_be)
+{
+    uint8_t *haddr = p->haddr;
+    int i, size = p->size;
+
+    for (i = 0; i < size; i++) {
+        ret_be = (ret_be << 8) | haddr[i];
+    }
+    return ret_be;
+}
+
+/*
+ * Wrapper for the above.
+ */
+static uint64_t do_ld_beN(CPUArchState *env, MMULookupPageData *p,
+                          uint64_t ret_be, int mmu_idx,
+                          MMUAccessType type, uintptr_t ra)
+{
+    if (unlikely(p->flags & TLB_MMIO)) {
+        return do_ld_mmio_beN(env, p, ret_be, mmu_idx, type, ra);
+    } else {
+        return do_ld_bytes_beN(p, ret_be);
+    }
+}
+
+static uint8_t do_ld_1(CPUArchState *env, MMULookupPageData *p, int mmu_idx,
+                       MMUAccessType type, uintptr_t ra)
+{
+    if (unlikely(p->flags & TLB_MMIO)) {
+        return io_readx(env, p->full, mmu_idx, p->addr, ra, type, MO_UB);
+    } else {
+        return *(uint8_t *)p->haddr;
+    }
+}
+
+static uint16_t do_ld_2(CPUArchState *env, MMULookupPageData *p, int mmu_idx,
+                        MMUAccessType type, MemOp memop, uintptr_t ra)
+{
+    uint64_t ret;
+
+    if (unlikely(p->flags & TLB_MMIO)) {
+        return io_readx(env, p->full, mmu_idx, p->addr, ra, type, memop);
+    }
+
+    /* Perform the load host endian, then swap if necessary. */
+    ret = load_memop(p->haddr, MO_UW);
+    if (memop & MO_BSWAP) {
+        ret = bswap16(ret);
+    }
+    return ret;
+}
+
+static uint32_t do_ld_4(CPUArchState *env, MMULookupPageData *p, int mmu_idx,
+                        MMUAccessType type, MemOp memop, uintptr_t ra)
+{
+    uint32_t ret;
+
+    if (unlikely(p->flags & TLB_MMIO)) {
+        return io_readx(env, p->full, mmu_idx, p->addr, ra, type, memop);
+    }
+
+    /* Perform the load host endian. */
+    ret = load_memop(p->haddr, MO_UL);
+    if (memop & MO_BSWAP) {
+        ret = bswap32(ret);
+    }
+    return ret;
+}
+
+static uint64_t do_ld_8(CPUArchState *env, MMULookupPageData *p, int mmu_idx,
+                        MMUAccessType type, MemOp memop, uintptr_t ra)
+{
+    uint64_t ret;
+
+    if (unlikely(p->flags & TLB_MMIO)) {
+        return io_readx(env, p->full, mmu_idx, p->addr, ra, type, memop);
+    }
+
+    /* Perform the load host endian. */
+    ret = load_memop(p->haddr, MO_UQ);
+    if (memop & MO_BSWAP) {
+        ret = bswap64(ret);
+    }
+    return ret;
+}
+
+static uint8_t do_ld1_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
+                          uintptr_t ra, MMUAccessType access_type)
+{
+    MMULookupLocals l;
+    bool crosspage;
+
+    crosspage = mmu_lookup(env, addr, oi, ra, access_type, &l);
+    tcg_debug_assert(!crosspage);
+
+    return do_ld_1(env, &l.page[0], l.mmu_idx, access_type, ra);
 }
 
 tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
                                      MemOpIdx oi, uintptr_t retaddr)
 {
-    return full_ldub_mmu(env, addr, oi, retaddr);
+    validate_memop(oi, MO_UB);
+    return do_ld1_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
-static uint64_t full_le_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                 MemOpIdx oi, uintptr_t retaddr)
+static uint16_t do_ld2_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
+                           uintptr_t ra, MMUAccessType access_type)
 {
-    validate_memop(oi, MO_LEUW);
-    return load_helper(env, addr, oi, retaddr, MO_LEUW, MMU_DATA_LOAD,
-                       full_le_lduw_mmu);
+    MMULookupLocals l;
+    bool crosspage;
+    uint16_t ret;
+    uint8_t a, b;
+
+    crosspage = mmu_lookup(env, addr, oi, ra, access_type, &l);
+    if (likely(!crosspage)) {
+        return do_ld_2(env, &l.page[0], l.mmu_idx, access_type, l.memop, ra);
+    }
+
+    a = do_ld_1(env, &l.page[0], l.mmu_idx, access_type, ra);
+    b = do_ld_1(env, &l.page[1], l.mmu_idx, access_type, ra);
+
+    if ((l.memop & MO_BSWAP) == MO_LE) {
+        ret = a | (b << 8);
+    } else {
+        ret = b | (a << 8);
+    }
+    return ret;
 }
 
 tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
                                     MemOpIdx oi, uintptr_t retaddr)
 {
-    return full_le_lduw_mmu(env, addr, oi, retaddr);
-}
-
-static uint64_t full_be_lduw_mmu(CPUArchState *env, target_ulong addr,
-                                 MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUW);
-    return load_helper(env, addr, oi, retaddr, MO_BEUW, MMU_DATA_LOAD,
-                       full_be_lduw_mmu);
+    validate_memop(oi, MO_LEUW);
+    return do_ld2_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
 tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
                                     MemOpIdx oi, uintptr_t retaddr)
 {
-    return full_be_lduw_mmu(env, addr, oi, retaddr);
+    validate_memop(oi, MO_BEUW);
+    return do_ld2_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
-static uint64_t full_le_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                 MemOpIdx oi, uintptr_t retaddr)
+static uint32_t do_ld4_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
+                           uintptr_t ra, MMUAccessType access_type)
 {
-    validate_memop(oi, MO_LEUL);
-    return load_helper(env, addr, oi, retaddr, MO_LEUL, MMU_DATA_LOAD,
-                       full_le_ldul_mmu);
+    MMULookupLocals l;
+    bool crosspage;
+    uint32_t ret;
+
+    crosspage = mmu_lookup(env, addr, oi, ra, access_type, &l);
+    if (likely(!crosspage)) {
+        return do_ld_4(env, &l.page[0], l.mmu_idx, access_type, l.memop, ra);
+    }
+
+    ret = do_ld_beN(env, &l.page[0], 0, l.mmu_idx, access_type, ra);
+    ret = do_ld_beN(env, &l.page[1], ret, l.mmu_idx, access_type, ra);
+    if ((l.memop & MO_BSWAP) == MO_LE) {
+        ret = bswap32(ret);
+    }
+    return ret;
 }
 
 tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
                                     MemOpIdx oi, uintptr_t retaddr)
 {
-    return full_le_ldul_mmu(env, addr, oi, retaddr);
-}
-
-static uint64_t full_be_ldul_mmu(CPUArchState *env, target_ulong addr,
-                                 MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUL);
-    return load_helper(env, addr, oi, retaddr, MO_BEUL, MMU_DATA_LOAD,
-                       full_be_ldul_mmu);
+    validate_memop(oi, MO_LEUL);
+    return do_ld4_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
 tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
                                     MemOpIdx oi, uintptr_t retaddr)
 {
-    return full_be_ldul_mmu(env, addr, oi, retaddr);
+    validate_memop(oi, MO_BEUL);
+    return do_ld4_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
+}
+
+static uint64_t do_ld8_mmu(CPUArchState *env, target_ulong addr, MemOpIdx oi,
+                           uintptr_t ra, MMUAccessType access_type)
+{
+    MMULookupLocals l;
+    bool crosspage;
+    uint64_t ret;
+
+    crosspage = mmu_lookup(env, addr, oi, ra, access_type, &l);
+    if (likely(!crosspage)) {
+        return do_ld_8(env, &l.page[0], l.mmu_idx, access_type, l.memop, ra);
+    }
+
+    ret = do_ld_beN(env, &l.page[0], 0, l.mmu_idx, access_type, ra);
+    ret = do_ld_beN(env, &l.page[1], ret, l.mmu_idx, access_type, ra);
+    if ((l.memop & MO_BSWAP) == MO_LE) {
+        ret = bswap64(ret);
+    }
+    return ret;
 }
 
 uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_LEUQ);
-    return load_helper(env, addr, oi, retaddr, MO_LEUQ, MMU_DATA_LOAD,
-                       helper_le_ldq_mmu);
+    return do_ld8_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
 uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_BEUQ);
-    return load_helper(env, addr, oi, retaddr, MO_BEUQ, MMU_DATA_LOAD,
-                       helper_be_ldq_mmu);
+    return do_ld8_mmu(env, addr, oi, retaddr, MMU_DATA_LOAD);
 }
 
 /*
@@ -2128,56 +2353,85 @@ tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
  * Load helpers for cpu_ldst.h.
  */
 
-static inline uint64_t cpu_load_helper(CPUArchState *env, abi_ptr addr,
-                                       MemOpIdx oi, uintptr_t retaddr,
-                                       FullLoadHelper *full_load)
+static void plugin_load_cb(CPUArchState *env, abi_ptr addr, MemOpIdx oi)
 {
-    uint64_t ret;
-
-    ret = full_load(env, addr, oi, retaddr);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
-    return ret;
 }
 
 uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr, MemOpIdx oi, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, oi, ra, full_ldub_mmu);
+    uint8_t ret;
+
+    validate_memop(oi, MO_UB);
+    ret = do_ld1_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
+    plugin_load_cb(env, addr, oi);
+    return ret;
 }
 
 uint16_t cpu_ldw_be_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, oi, ra, full_be_lduw_mmu);
+    uint16_t ret;
+
+    validate_memop(oi, MO_BEUW);
+    ret = do_ld2_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
+    plugin_load_cb(env, addr, oi);
+    return ret;
 }
 
 uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, oi, ra, full_be_ldul_mmu);
+    uint32_t ret;
+
+    validate_memop(oi, MO_BEUL);
+    ret = do_ld4_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
+    plugin_load_cb(env, addr, oi);
+    return ret;
 }
 
 uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, oi, ra, helper_be_ldq_mmu);
+    uint64_t ret;
+
+    validate_memop(oi, MO_BEUQ);
+    ret = do_ld8_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
+    plugin_load_cb(env, addr, oi);
+    return ret;
 }
 
 uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, oi, ra, full_le_lduw_mmu);
+    uint16_t ret;
+
+    validate_memop(oi, MO_LEUW);
+    ret = do_ld2_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
+    plugin_load_cb(env, addr, oi);
+    return ret;
 }
 
 uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, oi, ra, full_le_ldul_mmu);
+    uint32_t ret;
+
+    validate_memop(oi, MO_LEUL);
+    ret = do_ld4_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
+    plugin_load_cb(env, addr, oi);
+    return ret;
 }
 
 uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, oi, ra, helper_le_ldq_mmu);
+    uint64_t ret;
+
+    validate_memop(oi, MO_LEUQ);
+    ret = do_ld8_mmu(env, addr, oi, ra, MMU_DATA_LOAD);
+    plugin_load_cb(env, addr, oi);
+    return ret;
 }
 
 Int128 cpu_ld16_be_mmu(CPUArchState *env, abi_ptr addr,
@@ -2679,54 +2933,26 @@ void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
 
 /* Code access functions.  */
 
-static uint64_t full_ldub_code(CPUArchState *env, target_ulong addr,
-                               MemOpIdx oi, uintptr_t retaddr)
-{
-    return load_helper(env, addr, oi, retaddr, MO_8,
-                       MMU_INST_FETCH, full_ldub_code);
-}
-
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr)
 {
     MemOpIdx oi = make_memop_idx(MO_UB, cpu_mmu_index(env, true));
-    return full_ldub_code(env, addr, oi, 0);
-}
-
-static uint64_t full_lduw_code(CPUArchState *env, target_ulong addr,
-                               MemOpIdx oi, uintptr_t retaddr)
-{
-    return load_helper(env, addr, oi, retaddr, MO_TEUW,
-                       MMU_INST_FETCH, full_lduw_code);
+    return do_ld1_mmu(env, addr, oi, 0, MMU_INST_FETCH);
 }
 
 uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr)
 {
     MemOpIdx oi = make_memop_idx(MO_TEUW, cpu_mmu_index(env, true));
-    return full_lduw_code(env, addr, oi, 0);
-}
-
-static uint64_t full_ldl_code(CPUArchState *env, target_ulong addr,
-                              MemOpIdx oi, uintptr_t retaddr)
-{
-    return load_helper(env, addr, oi, retaddr, MO_TEUL,
-                       MMU_INST_FETCH, full_ldl_code);
+    return do_ld2_mmu(env, addr, oi, 0, MMU_INST_FETCH);
 }
 
 uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr)
 {
     MemOpIdx oi = make_memop_idx(MO_TEUL, cpu_mmu_index(env, true));
-    return full_ldl_code(env, addr, oi, 0);
-}
-
-static uint64_t full_ldq_code(CPUArchState *env, target_ulong addr,
-                              MemOpIdx oi, uintptr_t retaddr)
-{
-    return load_helper(env, addr, oi, retaddr, MO_TEUQ,
-                       MMU_INST_FETCH, full_ldq_code);
+    return do_ld4_mmu(env, addr, oi, 0, MMU_INST_FETCH);
 }
 
 uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr addr)
 {
     MemOpIdx oi = make_memop_idx(MO_TEUQ, cpu_mmu_index(env, true));
-    return full_ldq_code(env, addr, oi, 0);
+    return do_ld8_mmu(env, addr, oi, 0, MMU_INST_FETCH);
 }
-- 
2.34.1


