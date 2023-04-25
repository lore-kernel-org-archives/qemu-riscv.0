Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOOp-0008Ey-Cq
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOOo-0008EP-3q
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:32:26 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOOj-000495-NV
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:32:25 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4ecb137af7eso6384321e87.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451140; x=1685043140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wScQAbeOAdmPNfU1WObG2sqGKO5LVrW4aaS/W72yioE=;
 b=Iwh8eDGHSeaqEaM2QjjVW9M2fwYX0rjrHpHVCT+mHRljb1TXHfMunDimC18xlA0OpN
 xPUSGvu1IqsaCF5TKskjDzgxTD0cbmmgeGVeN2Vovuptk+8K+XSP/zGGQNzwPM5I/10f
 DU7yF1ClozPu9CfXx4Bz3B0OvYG6DeabIgQhUCI9BuHcX42Zmu49OIHd8cURT2z1Rhpg
 yi5hUQvnyqRPIodROiR6tklQq+HqmTCnH+bu3p+2gawk2DxNmwqqH3tR1As4Bzjy1Dte
 l8s96L4xfwhhBvvPO+Z9QP8gX91QP0eXVUEVBD3ef/JlKatElWZunkJGE9k7VoSBWtLJ
 h+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451140; x=1685043140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wScQAbeOAdmPNfU1WObG2sqGKO5LVrW4aaS/W72yioE=;
 b=a5FRplUeKIvZdCIB5KZBWBY+H39hXRcyR0YivmQXRNwxJ3MCWgduIKkO3aJJJSmxs2
 tJldhSMb0wctX1YyABAJDMkV/rRSO4xPFgKREdcHRXd7+tvuHygx5Tf8D7gY/dwQ2AKD
 Y9/xJgxcRv8p5xQ/EkQflD7ARs7a2etgljvsZYxmEGB3PJznRMgIcayb7GOvYjlNp1RH
 aKEbwPuTSRPOJgE8auW+mauERB+CMcoBZIUTFbmdavzSAa1GlIL6coViBnU78iDpoDdd
 UMWxt5REgw/YHyGOR2kej26oRxML1U5Ay5/1Ej3am8hETNGkWVbmEaDeXqnvI9RSzLBv
 HyRA==
X-Gm-Message-State: AAQBX9c95hT/7QEo5QFoVJVyRIrmRL9H/ORAZa3IT7/q4jCYikxM8SJG
 7Ge5KyqpuDcTc+GVdviUds9Stw==
X-Google-Smtp-Source: AKy350ZE/bQoqtjysH4z81hnVfvvO1YpxULAystRMAYk4hVa9kXzll7VU+5AMW99ydQ7jx1uznf2tQ==
X-Received: by 2002:a2e:b17c:0:b0:2a7:6a49:5d76 with SMTP id
 a28-20020a2eb17c000000b002a76a495d76mr3912486ljm.33.1682451139861; 
 Tue, 25 Apr 2023 12:32:19 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:32:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 03/57] accel/tcg: Introduce tlb_read_idx
Date: Tue, 25 Apr 2023 20:30:52 +0100
Message-Id: <20230425193146.2106111-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 19:32:26 -0000

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
index 09b55cc0ee..fad6efc0ad 100644
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
index 665c41fc12..e68cf422c5 100644
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
 
@@ -1797,7 +1758,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     if (prot & PAGE_WRITE) {
         tlb_addr = tlb_addr_write(tlbe);
         if (!tlb_hit(tlb_addr, addr)) {
-            if (!VICTIM_TLB_HIT(addr_write, addr)) {
+            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
+                                addr & TARGET_PAGE_MASK)) {
                 tlb_fill(env_cpu(env), addr, size,
                          MMU_DATA_STORE, mmu_idx, retaddr);
                 index = tlb_index(env, mmu_idx, addr);
@@ -1830,7 +1792,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     } else /* if (prot & PAGE_READ) */ {
         tlb_addr = tlbe->addr_read;
         if (!tlb_hit(tlb_addr, addr)) {
-            if (!VICTIM_TLB_HIT(addr_write, addr)) {
+            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_LOAD,
+                                addr & TARGET_PAGE_MASK)) {
                 tlb_fill(env_cpu(env), addr, size,
                          MMU_DATA_LOAD, mmu_idx, retaddr);
                 index = tlb_index(env, mmu_idx, addr);
@@ -1924,13 +1887,9 @@ load_memop(const void *haddr, MemOp op)
 
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
@@ -1950,18 +1909,18 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
 
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
 
@@ -2047,7 +2006,8 @@ static uint64_t full_ldub_mmu(CPUArchState *env, target_ulong addr,
                               MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_UB);
-    return load_helper(env, addr, oi, retaddr, MO_UB, false, full_ldub_mmu);
+    return load_helper(env, addr, oi, retaddr, MO_UB, MMU_DATA_LOAD,
+                       full_ldub_mmu);
 }
 
 tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
@@ -2060,7 +2020,7 @@ static uint64_t full_le_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_LEUW);
-    return load_helper(env, addr, oi, retaddr, MO_LEUW, false,
+    return load_helper(env, addr, oi, retaddr, MO_LEUW, MMU_DATA_LOAD,
                        full_le_lduw_mmu);
 }
 
@@ -2074,7 +2034,7 @@ static uint64_t full_be_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_BEUW);
-    return load_helper(env, addr, oi, retaddr, MO_BEUW, false,
+    return load_helper(env, addr, oi, retaddr, MO_BEUW, MMU_DATA_LOAD,
                        full_be_lduw_mmu);
 }
 
@@ -2088,7 +2048,7 @@ static uint64_t full_le_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_LEUL);
-    return load_helper(env, addr, oi, retaddr, MO_LEUL, false,
+    return load_helper(env, addr, oi, retaddr, MO_LEUL, MMU_DATA_LOAD,
                        full_le_ldul_mmu);
 }
 
@@ -2102,7 +2062,7 @@ static uint64_t full_be_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_BEUL);
-    return load_helper(env, addr, oi, retaddr, MO_BEUL, false,
+    return load_helper(env, addr, oi, retaddr, MO_BEUL, MMU_DATA_LOAD,
                        full_be_ldul_mmu);
 }
 
@@ -2116,7 +2076,7 @@ uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_LEUQ);
-    return load_helper(env, addr, oi, retaddr, MO_LEUQ, false,
+    return load_helper(env, addr, oi, retaddr, MO_LEUQ, MMU_DATA_LOAD,
                        helper_le_ldq_mmu);
 }
 
@@ -2124,7 +2084,7 @@ uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
                            MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_BEUQ);
-    return load_helper(env, addr, oi, retaddr, MO_BEUQ, false,
+    return load_helper(env, addr, oi, retaddr, MO_BEUQ, MMU_DATA_LOAD,
                        helper_be_ldq_mmu);
 }
 
@@ -2320,7 +2280,6 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
                        uintptr_t retaddr, size_t size, uintptr_t mmu_idx,
                        bool big_endian)
 {
-    const size_t tlb_off = offsetof(CPUTLBEntry, addr_write);
     uintptr_t index, index2;
     CPUTLBEntry *entry, *entry2;
     target_ulong page1, page2, tlb_addr, tlb_addr2;
@@ -2342,7 +2301,7 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
 
     tlb_addr2 = tlb_addr_write(entry2);
     if (page1 != page2 && !tlb_hit_page(tlb_addr2, page2)) {
-        if (!victim_tlb_hit(env, mmu_idx, index2, tlb_off, page2)) {
+        if (!victim_tlb_hit(env, mmu_idx, index2, MMU_DATA_STORE, page2)) {
             tlb_fill(env_cpu(env), page2, size2, MMU_DATA_STORE,
                      mmu_idx, retaddr);
             index2 = tlb_index(env, mmu_idx, page2);
@@ -2395,7 +2354,6 @@ static inline void QEMU_ALWAYS_INLINE
 store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
              MemOpIdx oi, uintptr_t retaddr, MemOp op)
 {
-    const size_t tlb_off = offsetof(CPUTLBEntry, addr_write);
     const unsigned a_bits = get_alignment_bits(get_memop(oi));
     const size_t size = memop_size(op);
     uintptr_t mmu_idx = get_mmuidx(oi);
@@ -2418,7 +2376,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
 
     /* If the TLB entry is for a different page, reload and try again.  */
     if (!tlb_hit(tlb_addr, addr)) {
-        if (!victim_tlb_hit(env, mmu_idx, index, tlb_off,
+        if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
             addr & TARGET_PAGE_MASK)) {
             tlb_fill(env_cpu(env), addr, size, MMU_DATA_STORE,
                      mmu_idx, retaddr);
@@ -2724,7 +2682,8 @@ void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
 static uint64_t full_ldub_code(CPUArchState *env, target_ulong addr,
                                MemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_8, true, full_ldub_code);
+    return load_helper(env, addr, oi, retaddr, MO_8,
+                       MMU_INST_FETCH, full_ldub_code);
 }
 
 uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr)
@@ -2736,7 +2695,8 @@ uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr addr)
 static uint64_t full_lduw_code(CPUArchState *env, target_ulong addr,
                                MemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_TEUW, true, full_lduw_code);
+    return load_helper(env, addr, oi, retaddr, MO_TEUW,
+                       MMU_INST_FETCH, full_lduw_code);
 }
 
 uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr)
@@ -2748,7 +2708,8 @@ uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr addr)
 static uint64_t full_ldl_code(CPUArchState *env, target_ulong addr,
                               MemOpIdx oi, uintptr_t retaddr)
 {
-    return load_helper(env, addr, oi, retaddr, MO_TEUL, true, full_ldl_code);
+    return load_helper(env, addr, oi, retaddr, MO_TEUL,
+                       MMU_INST_FETCH, full_ldl_code);
 }
 
 uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr)
@@ -2760,7 +2721,8 @@ uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr addr)
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


