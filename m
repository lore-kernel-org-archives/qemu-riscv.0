Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75ED7C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 20:40:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvL8n-0008LX-CT; Sat, 15 Aug 2026 16:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8m-0008KF-Ic
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:38:04 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8c-0008Hm-MT
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:38:04 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-383cb94f742so2543318a91.3
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 13:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826265; x=1787431065; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bmDly23NRAJZVHzXBA8ZcB1bIBMliGfEqbn9ZrSxSas=;
 b=ddPXf+SYwTw8vm0EEs1s7+mtFfaHbSaxXKRouQVrt8XJd7Y/pzO4d6aiWL24nSb6ou
 qoo1PLxJKFG+3Vtb0mAcFB7yB3XOCUX/b2HOLIlQZDnuSClnBpiY6qkKyKn9oOvNvAOi
 YPW5YVcVGxUpg8up/oBS4jnkWJFExbh7T2tVQYw7459s0JDSkF8v1q8SWuiDKG3caxPD
 +jcLnrIi6mOKr1GNEkyLclaLNgp1HcnIWYB8MW+gOygE6oXzXO6MitwRAOHlev9kTK4A
 RWSc2Jd1PVPEeLZxEcUoipIv5MnicYbivIB+yP//JsAUwFGWQg6pAbsj0Zbq7yjj3kxp
 s4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826265; x=1787431065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bmDly23NRAJZVHzXBA8ZcB1bIBMliGfEqbn9ZrSxSas=;
 b=DFG3NDWDlEynVBCRlCQ8lfrRkb03jMOdQUO/mLrNMZUEKT+DLjNjyHbIQTjxLyaMZf
 meXiCZOnEHSQLXu9rSz+blapu13qTiTk37FLjqP+tzDWmCX3QO/keie67gHaloLp5e8I
 Gad8dtaBPp+17+pH6+Ul36O22+GhDwcybQrRh8Er539ETBfTQmco4VMj4WEqLPK78yxE
 HOAt02+2C90oQ0h/4axZk8WdXhsV2knjjuPqjsZXcFX9xpzpk/VskPyhDhSfnp1fDObF
 8l6MrZ31wWufcf6dnOK8oKwTiDpYVfYEKannnOCajQg1hKnXxayDyKGMa9MfnXDiDmNh
 TbAA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrcsKjrErNFiNSWCkTpZYxL1y5TpoPhTjYVzrMGilswogiDt+813yWeln9HCxZ9BLTjei1bqW5PI+GW@nongnu.org
X-Gm-Message-State: AOJu0YzeZ53iEAk4I+aQQUgYzWkW2MmpomzSyXoMYEJJiwJKSbZFzMnR
 6Y4MG9GbK8Pfpm2kHO9z09HWkxQOEZH2ol1d5tNw8QDxmMZ5PdFaIJW27l6LJHt+dLE=
X-Gm-Gg: AR+sD10B211cHjDDA0P5CBhIhwJThFerMtWnqqdlOLxQCVA1IybRubI2ozwb/K9IEHc
 NvllfoBTPC0WvHGvawzLaz6UcUPNs0DdcbbtLQAdyqMgMg6sXJExMYnJ8GJPQO8fNVQ9LPrXrOo
 IFDaTTB+XTWaczwwbQUz5fSwBl11AyFpoXMWgXw2xDpgvjibwGb2yFmlKpmW1H4g1LPaynS0723
 Y/2aKr2gfdfn6RxStZRTdEF8+3yZni0GPB0yowXmpHpbWb8nXklLOwbkjhyj45AbkrvbYU1Rae6
 3vyG/2I0MV4PjEvYWCJ6ZeOE5jYrWOizaK618sCG7GqKr+GW+x0hNvXZh4X5rOnANsy6LSjWSee
 bZ5Jtv8Of5XB816NPVHZpd09rUcnDd7Q54pv1NiIRW4HAWc7QALpj/CC7bETgPWpxwMnoRAHrEg
 mdBKz4czQ4LS8ZXYbPl3kuRG0Y3c+dwsA/bBBD3VNMD17KQ4SfIYwaLxcAF36/f92TH2uyEMSfR
 kekuPDfe5v44LJqatiY
X-Received: by 2002:a17:90b:4ac8:b0:38e:11ba:992c with SMTP id
 98e67ed59e1d1-3933e5d22acmr15120732a91.12.1786826265009; 
 Sat, 15 Aug 2026 13:37:45 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 07/18] accel/tcg: Replace size with first/last in
 probe_access_full
Date: Sat, 15 Aug 2026 13:37:19 -0700
Message-ID: <20260815203730.1468365-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/accel/tcg/probe.h     |  2 +-
 accel/tcg/cputlb.c            | 17 +++++++++++------
 target/arm/tcg/helper-a64.c   |  5 ++++-
 target/arm/tcg/mte_helper.c   | 21 ++++++++++++---------
 target/arm/tcg/sve_helper.c   |  5 ++++-
 target/mips/tcg/ldst_helper.c |  4 ++--
 6 files changed, 34 insertions(+), 20 deletions(-)

diff --git a/include/accel/tcg/probe.h b/include/accel/tcg/probe.h
index 0b788901ba..e3068a79de 100644
--- a/include/accel/tcg/probe.h
+++ b/include/accel/tcg/probe.h
@@ -86,7 +86,7 @@ int probe_access_flags(CPUArchState *env, vaddr addr, int size,
  * This function will return TLB_MMIO in order to force the access
  * to be handled out-of-line if plugins wish to instrument the access.
  */
-int probe_access_full(CPUArchState *env, vaddr addr, int size,
+int probe_access_full(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
                       MMUAccessType access_type, int mmu_idx,
                       bool nonfault, void **phost,
                       CPUTLBEntryFull **pfull, uintptr_t retaddr);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 7f7c208ba1..6299cc73a4 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1412,19 +1412,24 @@ static int probe_access_internal(CPUState *cpu, vaddr addr,
     return flags;
 }
 
-int probe_access_full(CPUArchState *env, vaddr addr, int size,
+int probe_access_full(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
                       MMUAccessType access_type, int mmu_idx,
                       bool nonfault, void **phost, CPUTLBEntryFull **pfull,
                       uintptr_t retaddr)
 {
-    int flags = probe_access_internal(env_cpu(env), addr, size, access_type,
-                                      mmu_idx, nonfault, phost, pfull, retaddr,
-                                      true);
+    int flags;
+
+    assert(first <= addr);
+    assert(addr <= last);
+    assert(((first ^ last) & TARGET_PAGE_MASK) == 0);
+
+    flags = probe_access_internal(env_cpu(env), addr, last - addr + 1,
+                                  access_type, mmu_idx, nonfault,
+                                  phost, pfull, retaddr, true);
 
     /* Handle clean RAM pages.  */
     if (unlikely(flags & TLB_NOTDIRTY)) {
-        int dirtysize = size == 0 ? 1 : size;
-        notdirty_write(env_cpu(env), addr, dirtysize, *pfull, retaddr);
+        notdirty_write(env_cpu(env), first, last - first + 1, *pfull, retaddr);
         flags &= ~TLB_NOTDIRTY;
     }
 
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 05ab9ab6d3..2e0e7cd756 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -1745,7 +1745,10 @@ static bool is_guarded_page(CPUARMState *env, vaddr addr, uintptr_t ra)
     CPUTLBEntryFull *full;
     void *host;
     int mmu_idx = cpu_mmu_index(env_cpu(env), true);
-    int flags = probe_access_full(env, addr, 0, MMU_INST_FETCH, mmu_idx,
+    int flags = probe_access_full(env, addr,
+                                  addr & TARGET_PAGE_MASK,
+                                  addr | ~TARGET_PAGE_MASK,
+                                  MMU_INST_FETCH, mmu_idx,
                                   false, &host, &full, ra);
 
     assert(!(flags & TLB_INVALID_MASK));
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 399bca30c9..f36286d596 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -151,6 +151,7 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
     ret.flags = 0;
 #else
     CPUTLBEntryFull *full;
+    vaddr ptr_last, ptr_page_last;
     hwaddr ptr_paddr, tag_paddr, xlat;
     MemoryRegion *mr;
     ARMASIdx tag_asi;
@@ -162,7 +163,11 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
      * exception for inaccessible pages, and resolves the virtual address
      * into the softmmu tlb.
      */
-    ret.flags = probe_access_full(env, ptr, 0, ptr_access, ptr_mmu_idx,
+    ptr_last = ptr + ptr_size - 1;
+    ptr_page_last = ptr | ~TARGET_PAGE_MASK;
+
+    ret.flags = probe_access_full(env, ptr, ptr, MIN(ptr_last, ptr_page_last),
+                                  ptr_access, ptr_mmu_idx,
                                   atm_kind >= ATM_PROBE_PAGES,
                                   &ret.ptr_mem, &full, ra);
     if (unlikely(ret.flags & TLB_INVALID_MASK)) {
@@ -184,14 +189,12 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
      * tag on the first page.
      * Any page access exception has priority over tag check exception.
      */
-    if (atm_kind == ATM_NORMAL) {
-        int in_page = -(ptr | TARGET_PAGE_MASK);
-        if (unlikely(ptr_size > in_page)) {
-            void *discard_mem;
-            ret.flags |= probe_access_full(env, ptr + in_page, 0, ptr_access,
-                                           ptr_mmu_idx, false,
-                                           &discard_mem, &full, ra);
-        }
+    if (atm_kind == ATM_NORMAL && unlikely(ptr_page_last < ptr_last)) {
+        void *discard_mem;
+        ret.flags |= probe_access_full(env, ptr_page_last + 1,
+                                       ptr_page_last + 1, ptr_last,
+                                       ptr_access, ptr_mmu_idx, false,
+                                       &discard_mem, &full, ra);
     }
 
     switch (pte_attrs) {
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index ac96b18784..4e77a824dd 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -6040,7 +6040,10 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
                                &info->host, retaddr);
 #else
     CPUTLBEntryFull *full;
-    flags = probe_access_full(env, addr, 0, access_type, mmu_idx, nofault,
+    flags = probe_access_full(env, addr,
+                              addr & TARGET_PAGE_MASK,
+                              addr | ~TARGET_PAGE_MASK,
+                              access_type, mmu_idx, nofault,
                               &info->host, &full, retaddr);
 #endif
     info->flags = flags;
diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index 1b25466b49..065570a8f1 100644
--- a/target/mips/tcg/ldst_helper.c
+++ b/target/mips/tcg/ldst_helper.c
@@ -44,8 +44,8 @@ target_ulong helper_##name(CPUMIPSState *env, target_ulong arg,               \
     int flags;                                                                \
                                                                               \
     env->llval = do_cast cpu_##insn##_mmu(env, arg, oi, ra);                  \
-    flags = probe_access_full(env, arg, size, MMU_DATA_LOAD, mem_idx,         \
-                              true, &host_unused, &full, ra);                 \
+    flags = probe_access_full(env, arg, arg, arg + size - 1, MMU_DATA_LOAD,   \
+                              mem_idx, true, &host_unused, &full, ra);        \
     assert(!(flags & TLB_INVALID_MASK));                                      \
     env->CP0_LLAddr = full->phys_addr;                                        \
     env->lladdr = arg;                                                        \
-- 
2.43.0


