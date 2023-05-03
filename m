Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6aW-00070g-1h
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zu-000537-SO
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:10 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zp-0005Zv-Jb
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:06 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so29501285e9.2
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097620; x=1685689620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=49Ms4D16ycHgwsQWZQ2j9+EkvnxBb28/636UnUq9PB4=;
 b=OrVEPPKB74a9wJDqniLZZB0x/1kLJcLT7a4Zrm9g9GSq+6X8J3FZOKWTG96HwiBwGp
 v28NABEl63R95fJqa5FGFlbP5K1iFdDmw21dcBu02ehH8fL8xka5mVrGI9ePYsvrYKba
 Mf/Z+e6Q1/uzQEc6LcgbgWgPWKfbr9uv0XcH956AAjTwQce/CZoqqZNaLjvVB+80BNNK
 GRfwkrsVr6AKyj+/44DcOWRMbi7pY4GrE45UZGb1hMl8hAevGDCl7oXxdLSKF9UMKv2F
 6vw67FBxrY3z/rYuOgNY772GdiQi3Y09pI+iyL/rBBl5+9JbkbZ/dkdepbEHSycaZpDf
 vR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097620; x=1685689620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=49Ms4D16ycHgwsQWZQ2j9+EkvnxBb28/636UnUq9PB4=;
 b=MVvdP8cTL29ze2T2pNZ5eO6LwbEe7kl+btw2e9Oswp6L7s0GUz+MOTIaaFbEdurxbv
 MFZjkbHKGMum7iVdLX4Dab1bv3w1Ahzw3ownhoI0mD72y/RTYee3PfVPKKgu6JA3AlKS
 laFh57ubpYBRh3nMurt9AB9QiHV23tLebTdk45evK/ORAQaN0Q0+sRWio+gMa3l3LKYp
 yPWEi4fA3QXBXtEUjiPmC7VH2SInDwVJoOMhNh+bpXEia585ZxLq8K0bsPAX49RM14ov
 y/KgUwctD3kGKrIIpTVPGHSZsSwsx9AGca7ZPKrk2RaYiQMjwacwXnL+3Y7RD8u4xBVs
 YUgg==
X-Gm-Message-State: AC+VfDwR4zxG+k0Zd7BBZvC3e/JcdCERA3hPK0ScuDaxPlfQtSvH50in
 cp0t+W99k5lZSJ9Dr2MnN/fE4A==
X-Google-Smtp-Source: ACHHUZ6SW1kk+jmSkaS2UoRTVEr72qC2mwboO/uTMOU8+XvfPr/mCT59R/xVPhbN55NpwHMc12gMDA==
X-Received: by 2002:adf:e342:0:b0:306:4125:5f61 with SMTP id
 n2-20020adfe342000000b0030641255f61mr805988wrj.44.1683097620058; 
 Wed, 03 May 2023 00:07:00 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:06:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 03/57] accel/tcg: Introduce tlb_read_idx
Date: Wed,  3 May 2023 08:06:02 +0100
Message-Id: <20230503070656.1746170-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 03 May 2023 07:07:15 -0000

Instead of playing with offsetof in various places, use
MMUAccessType to index an array.  This is easily defined
instead of the previous dummy padding array in the union.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h |   7 ++-
 include/exec/cpu_ldst.h |  26 ++++++++--
 accel/tcg/cputlb.c      | 104 +++++++++++++---------------------------
 3 files changed, 59 insertions(+), 78 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index e1c498ef4b..a6e0cf1812 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -111,8 +111,11 @@ typedef struct CPUTLBEntry {
                use the corresponding iotlb value.  */
             uintptr_t addend;
         };
-        /* padding to get a power of two size */
-        uint8_t dummy[1 << CPU_TLB_ENTRY_BITS];
+        /*
+         * Padding to get a power of two size, as well as index
+         * access to addr_{read,write,code}.
+         */
+        target_ulong addr_idx[(1 << CPU_TLB_ENTRY_BITS) / TARGET_LONG_SIZE];
     };
 } CPUTLBEntry;
 
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index c141f0394f..7c867c94c3 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -360,13 +360,29 @@ static inline void clear_helper_retaddr(void)
 /* Needed for TCG_OVERSIZED_GUEST */
 #include "tcg/tcg.h"
 
+static inline target_ulong tlb_read_idx(const CPUTLBEntry *entry,
+                                        MMUAccessType access_type)
+{
+    /* Do not rearrange the CPUTLBEntry structure members. */
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_read) !=
+                      MMU_DATA_LOAD * TARGET_LONG_SIZE);
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_write) !=
+                      MMU_DATA_STORE * TARGET_LONG_SIZE);
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_code) !=
+                      MMU_INST_FETCH * TARGET_LONG_SIZE);
+
+    const target_ulong *ptr = &entry->addr_idx[access_type];
+#if TCG_OVERSIZED_GUEST
+    return *ptr;
+#else
+    /* ofs might correspond to .addr_write, so use qatomic_read */
+    return qatomic_read(ptr);
+#endif
+}
+
 static inline target_ulong tlb_addr_write(const CPUTLBEntry *entry)
 {
-#if TCG_OVERSIZED_GUEST
-    return entry->addr_write;
-#else
-    return qatomic_read(&entry->addr_write);
-#endif
+    return tlb_read_idx(entry, MMU_DATA_STORE);
 }
 
 /* Find the TLB index corresponding to the mmu_idx + address pair.  */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 3117886af1..5051244c67 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1441,34 +1441,17 @@ static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
     }
 }
 
-static inline target_ulong tlb_read_ofs(CPUTLBEntry *entry, size_t ofs)
-{
-#if TCG_OVERSIZED_GUEST
-    return *(target_ulong *)((uintptr_t)entry + ofs);
-#else
-    /* ofs might correspond to .addr_write, so use qatomic_read */
-    return qatomic_read((target_ulong *)((uintptr_t)entry + ofs));
-#endif
-}
-
 /* Return true if ADDR is present in the victim tlb, and has been copied
    back to the main tlb.  */
 static bool victim_tlb_hit(CPUArchState *env, size_t mmu_idx, size_t index,
-                           size_t elt_ofs, target_ulong page)
+                           MMUAccessType access_type, target_ulong page)
 {
     size_t vidx;
 
     assert_cpu_is_self(env_cpu(env));
     for (vidx = 0; vidx < CPU_VTLB_SIZE; ++vidx) {
         CPUTLBEntry *vtlb = &env_tlb(env)->d[mmu_idx].vtable[vidx];
-        target_ulong cmp;
-
-        /* elt_ofs might correspond to .addr_write, so use qatomic_read */
-#if TCG_OVERSIZED_GUEST
-        cmp = *(target_ulong *)((uintptr_t)vtlb + elt_ofs);
-#else
-        cmp = qatomic_read((target_ulong *)((uintptr_t)vtlb + elt_ofs));
-#endif
+        target_ulong cmp = tlb_read_idx(vtlb, access_type);
 
         if (cmp == page) {
             /* Found entry in victim tlb, swap tlb and iotlb.  */
@@ -1490,11 +1473,6 @@ static bool victim_tlb_hit(CPUArchState *env, size_t mmu_idx, size_t index,
     return false;
 }
 
-/* Macro to call the above, with local variables from the use context.  */
-#define VICTIM_TLB_HIT(TY, ADDR) \
-  victim_tlb_hit(env, mmu_idx, index, offsetof(CPUTLBEntry, TY), \
-                 (ADDR) & TARGET_PAGE_MASK)
-
 static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
                            CPUTLBEntryFull *full, uintptr_t retaddr)
 {
@@ -1527,29 +1505,12 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
 {
     uintptr_t index = tlb_index(env, mmu_idx, addr);
     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
-    target_ulong tlb_addr, page_addr;
-    size_t elt_ofs;
-    int flags;
+    target_ulong tlb_addr = tlb_read_idx(entry, access_type);
+    target_ulong page_addr = addr & TARGET_PAGE_MASK;
+    int flags = TLB_FLAGS_MASK;
 
-    switch (access_type) {
-    case MMU_DATA_LOAD:
-        elt_ofs = offsetof(CPUTLBEntry, addr_read);
-        break;
-    case MMU_DATA_STORE:
-        elt_ofs = offsetof(CPUTLBEntry, addr_write);
-        break;
-    case MMU_INST_FETCH:
-        elt_ofs = offsetof(CPUTLBEntry, addr_code);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    tlb_addr = tlb_read_ofs(entry, elt_ofs);
-
-    flags = TLB_FLAGS_MASK;
-    page_addr = addr & TARGET_PAGE_MASK;
     if (!tlb_hit_page(tlb_addr, page_addr)) {
-        if (!victim_tlb_hit(env, mmu_idx, index, elt_ofs, page_addr)) {
+        if (!victim_tlb_hit(env, mmu_idx, index, access_type, page_addr)) {
             CPUState *cs = env_cpu(env);
 
             if (!cs->cc->tcg_ops->tlb_fill(cs, addr, fault_size, access_type,
@@ -1571,7 +1532,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
              */
             flags &= ~TLB_INVALID_MASK;
         }
-        tlb_addr = tlb_read_ofs(entry, elt_ofs);
+        tlb_addr = tlb_read_idx(entry, access_type);
     }
     flags &= tlb_addr;
 
@@ -1802,7 +1763,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     if (prot & PAGE_WRITE) {
         tlb_addr = tlb_addr_write(tlbe);
         if (!tlb_hit(tlb_addr, addr)) {
-            if (!VICTIM_TLB_HIT(addr_write, addr)) {
+            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
+                                addr & TARGET_PAGE_MASK)) {
                 tlb_fill(env_cpu(env), addr, size,
                          MMU_DATA_STORE, mmu_idx, retaddr);
                 index = tlb_index(env, mmu_idx, addr);
@@ -1835,7 +1797,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     } else /* if (prot & PAGE_READ) */ {
         tlb_addr = tlbe->addr_read;
         if (!tlb_hit(tlb_addr, addr)) {
-            if (!VICTIM_TLB_HIT(addr_write, addr)) {
+            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_LOAD,
+                                addr & TARGET_PAGE_MASK)) {
                 tlb_fill(env_cpu(env), addr, size,
                          MMU_DATA_LOAD, mmu_idx, retaddr);
                 index = tlb_index(env, mmu_idx, addr);
@@ -1929,13 +1892,9 @@ load_memop(const void *haddr, MemOp op)
 
 static inline uint64_t QEMU_ALWAYS_INLINE
 load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
-            uintptr_t retaddr, MemOp op, bool code_read,
+            uintptr_t retaddr, MemOp op, MMUAccessType access_type,
             FullLoadHelper *full_load)
 {
-    const size_t tlb_off = code_read ?
-        offsetof(CPUTLBEntry, addr_code) : offsetof(CPUTLBEntry, addr_read);
-    const MMUAccessType access_type =
-        code_read ? MMU_INST_FETCH : MMU_DATA_LOAD;
     const unsigned a_bits = get_alignment_bits(get_memop(oi));
     const size_t size = memop_size(op);
     uintptr_t mmu_idx = get_mmuidx(oi);
@@ -1955,18 +1914,18 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
 
     index = tlb_index(env, mmu_idx, addr);
     entry = tlb_entry(env, mmu_idx, addr);
-    tlb_addr = code_read ? entry->addr_code : entry->addr_read;
+    tlb_addr = tlb_read_idx(entry, access_type);
 
     /* If the TLB entry is for a different page, reload and try again.  */
     if (!tlb_hit(tlb_addr, addr)) {
-        if (!victim_tlb_hit(env, mmu_idx, index, tlb_off,
+        if (!victim_tlb_hit(env, mmu_idx, index, access_type,
                             addr & TARGET_PAGE_MASK)) {
             tlb_fill(env_cpu(env), addr, size,
                      access_type, mmu_idx, retaddr);
             index = tlb_index(env, mmu_idx, addr);
             entry = tlb_entry(env, mmu_idx, addr);
         }
-        tlb_addr = code_read ? entry->addr_code : entry->addr_read;
+        tlb_addr = tlb_read_idx(entry, access_type);
         tlb_addr &= ~TLB_INVALID_MASK;
     }
 
@@ -2052,7 +2011,8 @@ static uint64_t full_ldub_mmu(CPUArchState *env, target_ulong addr,
                               MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_UB);
-    return load_helper(env, addr, oi, retaddr, MO_UB, false, full_ldub_mmu);
+    return load_helper(env, addr, oi, retaddr, MO_UB, MMU_DATA_LOAD,
+                       full_ldub_mmu);
 }
 
 tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
@@ -2065,7 +2025,7 @@ static uint64_t full_le_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_LEUW);
-    return load_helper(env, addr, oi, retaddr, MO_LEUW, false,
+    return load_helper(env, addr, oi, retaddr, MO_LEUW, MMU_DATA_LOAD,
                        full_le_lduw_mmu);
 }
 
@@ -2079,7 +2039,7 @@ static uint64_t full_be_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_BEUW);
-    return load_helper(env, addr, oi, retaddr, MO_BEUW, false,
+    return load_helper(env, addr, oi, retaddr, MO_BEUW, MMU_DATA_LOAD,
                        full_be_lduw_mmu);
 }
 
@@ -2093,7 +2053,7 @@ static uint64_t full_le_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_LEUL);
-    return load_helper(env, addr, oi, retaddr, MO_LEUL, false,
+    return load_helper(env, addr, oi, retaddr, MO_LEUL, MMU_DATA_LOAD,
                        full_le_ldul_mmu);
 }
 
@@ -2107,7 +2067,7 @@ static uint64_t full_be_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_BEUL);
-    return load_helper(env, addr, oi, retaddr, MO_BEUL, false,
+    return load_helper(env, addr, oi, retaddr, MO_BEUL, MMU_DATA_LOAD,
                        full_be_ldul_mmu);
 }
 
@@ -2121,7 +2081,7 @@ uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_LEUQ);
-    return load_helper(env, addr, oi, retaddr, MO_LEUQ, false,
+    return load_helper(env, addr, oi, retaddr, MO_LEUQ, MMU_DATA_LOAD,
                        helper_le_ldq_mmu);
 }
 
@@ -2129,7 +2089,7 @@ uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_BEUQ);
-    return load_helper(env, addr, oi, retaddr, MO_BEUQ, false,
+    return load_helper(env, addr, oi, retaddr, MO_BEUQ, MMU_DATA_LOAD,
                        helper_be_ldq_mmu);
 }
 
@@ -2325,7 +2285,6 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
                        uintptr_t retaddr, size_t size, uintptr_t mmu_idx,
                        bool big_endian)
 {
-    const size_t tlb_off = offsetof(CPUTLBEntry, addr_write);
     uintptr_t index, index2;
     CPUTLBEntry *entry, *entry2;
     target_ulong page1, page2, tlb_addr, tlb_addr2;
@@ -2347,7 +2306,7 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
 
     tlb_addr2 = tlb_addr_write(entry2);
     if (page1 != page2 && !tlb_hit_page(tlb_addr2, page2)) {
-        if (!victim_tlb_hit(env, mmu_idx, index2, tlb_off, page2)) {
+        if (!victim_tlb_hit(env, mmu_idx, index2, MMU_DATA_STORE, page2)) {
             tlb_fill(env_cpu(env), page2, size2, MMU_DATA_STORE,
                      mmu_idx, retaddr);
             index2 = tlb_index(env, mmu_idx, page2);
@@ -2400,7 +2359,6 @@ static inline void QEMU_ALWAYS_INLINE
 store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
              MemOpIdx oi, uintptr_t retaddr, MemOp op)
 {
-    const size_t tlb_off = offsetof(CPUTLBEntry, addr_write);
     const unsigned a_bits = get_alignment_bits(get_memop(oi));
     const size_t size = memop_size(op);
     uintptr_t mmu_idx = get_mmuidx(oi);
@@ -2423,7 +2381,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
 
     /* If the TLB entry is for a different page, reload and try again.  */
     if (!tlb_hit(tlb_addr, addr)) {
-        if (!victim_tlb_hit(env, mmu_idx, index, tlb_off,
+        if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
             addr & TARGET_PAGE_MASK)) {
             tlb_fill(env_cpu(env), addr, size, MMU_DATA_STORE,
                      mmu_idx, retaddr);
@@ -2729,7 +2687,8 @@ void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
 static uint64_t full_ldub_code(CPUArchState *env, target_ulong addr,
                                MemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_8, true, full_ldub_code);
+    return load_helper(env, addr, oi, retaddr, MO_8,
+                       MMU_INST_FETCH, full_ldub_code);
 }
 
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr)
@@ -2741,7 +2700,8 @@ uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr)
 static uint64_t full_lduw_code(CPUArchState *env, target_ulong addr,
                                MemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_TEUW, true, full_lduw_code);
+    return load_helper(env, addr, oi, retaddr, MO_TEUW,
+                       MMU_INST_FETCH, full_lduw_code);
 }
 
 uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr)
@@ -2753,7 +2713,8 @@ uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr)
 static uint64_t full_ldl_code(CPUArchState *env, target_ulong addr,
                               MemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_TEUL, true, full_ldl_code);
+    return load_helper(env, addr, oi, retaddr, MO_TEUL,
+                       MMU_INST_FETCH, full_ldl_code);
 }
 
 uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr)
@@ -2765,7 +2726,8 @@ uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr)
 static uint64_t full_ldq_code(CPUArchState *env, target_ulong addr,
                               MemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_TEUQ, true, full_ldq_code);
+    return load_helper(env, addr, oi, retaddr, MO_TEUQ,
+                       MMU_INST_FETCH, full_ldq_code);
 }
 
 uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr addr)
-- 
2.34.1


