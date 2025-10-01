Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6CECCA470
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:18:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3yRz-0003fL-6y; Wed, 01 Oct 2025 11:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yRh-0002dA-P3
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:08:46 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQ6-0000oW-Nh
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:08:44 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e5b7dfeb0so11133325e9.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331218; x=1759936018; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Cha6BobeeEvO84twHa/r09MXWbfgCJBUQ9S+PNpAf0=;
 b=qJs7IdgzTa0OJrelUSpWJtIPycjtWUcTYM6pRjbu+j7PI6DsBd3hWqFgPghlEgzWie
 SLlDazUXQMaorGY6pb6cOa+qnzQdLMqFKU0a9/uaa5NeuL/XOIzLdj+GHYVrcbw6YYrK
 bfsTYbKMA02rtYyBqESfLEtWBrGskColkBVJplP6q6zi2w/PAbTuioVgJBNkpw3RuPHo
 KrT6pqFN4Y9LLZzac969mPL6D+9CEoCGM/KXRdb7WDboOstHrOKKwHlSmSap+iDLGQd9
 6WkfMhGEkn3dJxfiV0GGnMM6IXrAPjW/FYIXzc+THNgd0ytuMnP7li94dVeJ+WNHbBO7
 VJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331218; x=1759936018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Cha6BobeeEvO84twHa/r09MXWbfgCJBUQ9S+PNpAf0=;
 b=hsTalXGPhIT/5bnpJ3u/Sw3Ba9pLJvh213BoKs3c4wd5SL55nqWGZ+X3aX/DlZbg25
 hTK97lR5F+HxxzKdvCgJR5ThAozpUtVel8OGh+h3VHSxJYJpZvfdd4Bqqoj1XOmhSXSM
 NBw2JdCTgHtVs3N4aaCQqa1yKfdxSJxuaOMq2/cHp6cEvTduhc7//paIIKdM5UQiBaOh
 gsXUNbykXy2TIh9fzAeABUgsx4+1eVmfWGAEECeKwHVNtvYgTbUGQB2SaLNyATVueFMi
 g1SAZDtciHEW/L2AhTVmQlPcj+I/w3dFAl1iZ6MJsKm//+K7k3PQ9uiUZ3D8FuNDuVsk
 kNSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTtvAoWqOZT+RDTLAz8F9i3x5vD7ZjgjK2XSemYkGvl9cK3dR88/8vG9kfHU93Zcn1Sn/HKI5HaYc8@nongnu.org
X-Gm-Message-State: AOJu0YxeSlu6lkZ77HSox2AqgSycefxs2QoZjKfEa0sj5E2anmRg02dk
 l3yIxAUeSUIv0bfh8prlI660WB4nqCwvJDgRFo6I03aaO6N3/6EwcB3ib846QENhiNM=
X-Gm-Gg: ASbGncs2X8SpFffhAY9jYZblkUquE3nEYpmUvCEh0wvTMGS6iOmo81Q0qKLurelItZD
 MhgRhW84bW/T2rLfEoQtpV1gWodGRY3qRGTogXjYq5SBYEiYC5kM0wJ67cFnz3rluIui/aWXIoc
 xrp74gZQnlaJH1pqibe8M1/06Kpa7pTbZ8tkjO3jTdteFHxd70XKiBZjwVXESAJRKf3+lVdhG1C
 15KVqE5F/alY5E2kqqMRK5ICanLnxaS96wFwx7IYLBb2Dg9+Pi2oK31IaK40Bl93gLOwRHRuoem
 gkKwMZbuJNByZCzlagk2W8l9Uq5cg3PRa9wBMCHZa6EjMo683bVgK9P1gQ4BA2U9+vd5tF2nOoJ
 O2tdzbxfW+8fC410ykWhe3jdKZWZ1Gv4xcp5gPCANiIzrbPCeSJXlEbCr69VjekMCTOd2b9FRLM
 C7KFKGB7bZLOG457hGlR5N
X-Google-Smtp-Source: AGHT+IGyX6YG9K3D8lnZdA71B4doqPBCrOtsRmBp+8y4mgQ4gGP996AMbZIBt6ekeeChINDFG7LGcA==
X-Received: by 2002:a05:600c:a088:b0:45c:b53f:ad9 with SMTP id
 5b1f17b1804b1-46e612e3f62mr31048985e9.33.1759331218357; 
 Wed, 01 Oct 2025 08:06:58 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619a6fc8sm42919905e9.13.2025.10.01.08.06.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:06:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>
Subject: [PATCH 17/22] target/ppc: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:22 +0200
Message-ID: <20251001150529.14122-18-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/mmu-hash32.h    | 12 ++++++++----
 target/ppc/excp_helper.c   |  4 ++--
 target/ppc/mmu-book3s-v3.c |  5 +++--
 target/ppc/mmu-hash32.c    |  6 ++++--
 target/ppc/mmu-hash64.c    | 12 ++++++++----
 target/ppc/mmu-radix64.c   | 13 +++++++------
 6 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
index 04c23ea75ed..f49991e8651 100644
--- a/target/ppc/mmu-hash32.h
+++ b/target/ppc/mmu-hash32.h
@@ -74,33 +74,37 @@ static inline hwaddr ppc_hash32_hpt_mask(PowerPCCPU *cpu)
 static inline target_ulong ppc_hash32_load_hpte0(PowerPCCPU *cpu,
                                                  hwaddr pte_offset)
 {
+    AddressSpace *as = cpu_get_address_space(CPU(cpu), 0);
     target_ulong base = ppc_hash32_hpt_base(cpu);
 
-    return ldl_phys(CPU(cpu)->as, base + pte_offset);
+    return ldl_phys(as, base + pte_offset);
 }
 
 static inline target_ulong ppc_hash32_load_hpte1(PowerPCCPU *cpu,
                                                  hwaddr pte_offset)
 {
+    AddressSpace *as = cpu_get_address_space(CPU(cpu), 0);
     target_ulong base = ppc_hash32_hpt_base(cpu);
 
-    return ldl_phys(CPU(cpu)->as, base + pte_offset + HASH_PTE_SIZE_32 / 2);
+    return ldl_phys(as, base + pte_offset + HASH_PTE_SIZE_32 / 2);
 }
 
 static inline void ppc_hash32_store_hpte0(PowerPCCPU *cpu,
                                           hwaddr pte_offset, target_ulong pte0)
 {
+    AddressSpace *as = cpu_get_address_space(CPU(cpu), 0);
     target_ulong base = ppc_hash32_hpt_base(cpu);
 
-    stl_phys(CPU(cpu)->as, base + pte_offset, pte0);
+    stl_phys(as, base + pte_offset, pte0);
 }
 
 static inline void ppc_hash32_store_hpte1(PowerPCCPU *cpu,
                                           hwaddr pte_offset, target_ulong pte1)
 {
+    AddressSpace *as = cpu_get_address_space(CPU(cpu), 0);
     target_ulong base = ppc_hash32_hpt_base(cpu);
 
-    stl_phys(CPU(cpu)->as, base + pte_offset + HASH_PTE_SIZE_32 / 2, pte1);
+    stl_phys(as, base + pte_offset + HASH_PTE_SIZE_32 / 2, pte1);
 }
 
 static inline hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash)
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 1efdc4066eb..6dbcf4dae10 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1012,9 +1012,9 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
         break;
     case POWERPC_EXCP_EXTERNAL:  /* External input                           */
         if (env->mpic_proxy) {
-            CPUState *cs = env_cpu(env);
+            AddressSpace *as = cpu_get_address_space(env_cpu(env), 0);
             /* IACK the IRQ on delivery */
-            env->spr[SPR_BOOKE_EPR] = ldl_phys(cs->as, env->mpic_iack);
+            env->spr[SPR_BOOKE_EPR] = ldl_phys(as, env->mpic_iack);
         }
         break;
     case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
diff --git a/target/ppc/mmu-book3s-v3.c b/target/ppc/mmu-book3s-v3.c
index 38655563105..fb8dd3df8c4 100644
--- a/target/ppc/mmu-book3s-v3.c
+++ b/target/ppc/mmu-book3s-v3.c
@@ -25,6 +25,7 @@
 
 bool ppc64_v3_get_pate(PowerPCCPU *cpu, target_ulong lpid, ppc_v3_pate_t *entry)
 {
+    AddressSpace *as = cpu_get_address_space(CPU(cpu), 0);
     uint64_t patb = cpu->env.spr[SPR_PTCR] & PTCR_PATB;
     uint64_t pats = cpu->env.spr[SPR_PTCR] & PTCR_PATS;
 
@@ -41,7 +42,7 @@ bool ppc64_v3_get_pate(PowerPCCPU *cpu, target_ulong lpid, ppc_v3_pate_t *entry)
 
     /* Grab entry */
     patb += 16 * lpid;
-    entry->dw0 = ldq_phys(CPU(cpu)->as, patb);
-    entry->dw1 = ldq_phys(CPU(cpu)->as, patb + 8);
+    entry->dw0 = ldq_phys(as, patb);
+    entry->dw1 = ldq_phys(as, patb + 8);
     return true;
 }
diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 8b980a5aa90..957184fd2e9 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -235,20 +235,22 @@ static hwaddr ppc_hash32_pteg_search(PowerPCCPU *cpu, hwaddr pteg_off,
 
 static void ppc_hash32_set_r(PowerPCCPU *cpu, hwaddr pte_offset, uint32_t pte1)
 {
+    AddressSpace *as = cpu_get_address_space(CPU(cpu), 0);
     target_ulong base = ppc_hash32_hpt_base(cpu);
     hwaddr offset = pte_offset + 6;
 
     /* The HW performs a non-atomic byte update */
-    stb_phys(CPU(cpu)->as, base + offset, ((pte1 >> 8) & 0xff) | 0x01);
+    stb_phys(as, base + offset, ((pte1 >> 8) & 0xff) | 0x01);
 }
 
 static void ppc_hash32_set_c(PowerPCCPU *cpu, hwaddr pte_offset, uint64_t pte1)
 {
+    AddressSpace *as = cpu_get_address_space(CPU(cpu), 0);
     target_ulong base = ppc_hash32_hpt_base(cpu);
     hwaddr offset = pte_offset + 7;
 
     /* The HW performs a non-atomic byte update */
-    stb_phys(CPU(cpu)->as, base + offset, (pte1 & 0xff) | 0x80);
+    stb_phys(as, base + offset, (pte1 & 0xff) | 0x80);
 }
 
 static hwaddr ppc_hash32_htab_lookup(PowerPCCPU *cpu,
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index dd337558aa6..52db16ded5b 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -552,6 +552,7 @@ static hwaddr ppc_hash64_hpt_mask(PowerPCCPU *cpu)
 const ppc_hash_pte64_t *ppc_hash64_map_hptes(PowerPCCPU *cpu,
                                              hwaddr ptex, int n)
 {
+    AddressSpace *as = cpu_get_address_space(CPU(cpu), 0);
     hwaddr pte_offset = ptex * HASH_PTE_SIZE_64;
     hwaddr base;
     hwaddr plen = n * HASH_PTE_SIZE_64;
@@ -566,7 +567,7 @@ const ppc_hash_pte64_t *ppc_hash64_map_hptes(PowerPCCPU *cpu,
         return NULL;
     }
 
-    hptes = address_space_map(CPU(cpu)->as, base + pte_offset, &plen, false,
+    hptes = address_space_map(as, base + pte_offset, &plen, false,
                               MEMTXATTRS_UNSPECIFIED);
     if (plen < (n * HASH_PTE_SIZE_64)) {
         hw_error("%s: Unable to map all requested HPTEs\n", __func__);
@@ -577,12 +578,13 @@ const ppc_hash_pte64_t *ppc_hash64_map_hptes(PowerPCCPU *cpu,
 void ppc_hash64_unmap_hptes(PowerPCCPU *cpu, const ppc_hash_pte64_t *hptes,
                             hwaddr ptex, int n)
 {
+    AddressSpace *as = cpu_get_address_space(CPU(cpu), 0);
     if (cpu->vhyp) {
         cpu->vhyp_class->unmap_hptes(cpu->vhyp, hptes, ptex, n);
         return;
     }
 
-    address_space_unmap(CPU(cpu)->as, (void *)hptes, n * HASH_PTE_SIZE_64,
+    address_space_unmap(as, (void *)hptes, n * HASH_PTE_SIZE_64,
                         false, n * HASH_PTE_SIZE_64);
 }
 
@@ -864,6 +866,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, int mmu_idx, uint64_t slb_vsid,
 
 static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
 {
+    AddressSpace *as = cpu_get_address_space(CPU(cpu), 0);
     hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + HPTE64_DW1_R;
 
     if (cpu->vhyp) {
@@ -874,11 +877,12 @@ static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
 
 
     /* The HW performs a non-atomic byte update */
-    stb_phys(CPU(cpu)->as, base + offset, ((pte1 >> 8) & 0xff) | 0x01);
+    stb_phys(as, base + offset, ((pte1 >> 8) & 0xff) | 0x01);
 }
 
 static void ppc_hash64_set_c(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
 {
+    AddressSpace *as = cpu_get_address_space(CPU(cpu), 0);
     hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + HPTE64_DW1_C;
 
     if (cpu->vhyp) {
@@ -888,7 +892,7 @@ static void ppc_hash64_set_c(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
     base = ppc_hash64_hpt_base(cpu);
 
     /* The HW performs a non-atomic byte update */
-    stb_phys(CPU(cpu)->as, base + offset, (pte1 & 0xff) | 0x80);
+    stb_phys(as, base + offset, (pte1 & 0xff) | 0x80);
 }
 
 static target_ulong rmls_limit(PowerPCCPU *cpu)
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 33ac3412901..c381a833ebd 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -431,6 +431,7 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
                                               int mmu_idx, uint64_t lpid,
                                               bool guest_visible)
 {
+    AddressSpace *as = cpu_get_address_space(CPU(cpu), 0);
     MMUAccessType access_type = orig_access_type;
     int fault_cause = 0;
     hwaddr pte_addr;
@@ -451,7 +452,7 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
 
     *h_page_size = PRTBE_R_GET_RTS(pate.dw0);
     /* No valid pte or access denied due to protection */
-    if (ppc_radix64_walk_tree(CPU(cpu)->as, g_raddr, pate.dw0 & PRTBE_R_RPDB,
+    if (ppc_radix64_walk_tree(as, g_raddr, pate.dw0 & PRTBE_R_RPDB,
                               pate.dw0 & PRTBE_R_RPDS, h_raddr, h_page_size,
                               &pte, &fault_cause, &pte_addr) ||
         ppc_radix64_check_prot(cpu, access_type, pte,
@@ -516,7 +517,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
                                             int mmu_idx, uint64_t lpid,
                                             bool guest_visible)
 {
-    CPUState *cs = CPU(cpu);
+    AddressSpace *as = cpu_get_address_space(CPU(cpu), 0);
     CPUPPCState *env = &cpu->env;
     uint64_t offset, size, prtb, prtbe_addr, prtbe0, base_addr, nls, index, pte;
     int fault_cause = 0, h_page_size, h_prot;
@@ -550,7 +551,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
     prtbe_addr = prtb + offset;
 
     if (vhyp_flat_addressing(cpu)) {
-        prtbe0 = ldq_phys(cs->as, prtbe_addr);
+        prtbe0 = ldq_phys(as, prtbe_addr);
     } else {
         /*
          * Process table addresses are subject to partition-scoped
@@ -568,7 +569,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
         if (ret) {
             return ret;
         }
-        prtbe0 = ldq_phys(cs->as, h_raddr);
+        prtbe0 = ldq_phys(as, h_raddr);
     }
 
     /*
@@ -593,7 +594,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
         /*
          * Can treat process table addresses as real addresses
          */
-        ret = ppc_radix64_walk_tree(cs->as, eaddr & R_EADDR_MASK, base_addr,
+        ret = ppc_radix64_walk_tree(as, eaddr & R_EADDR_MASK, base_addr,
                                     nls, g_raddr, g_page_size, &pte,
                                     &fault_cause, &pte_addr);
         if (ret) {
@@ -630,7 +631,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
                 fault_cause |= DSISR_R_BADCONFIG;
                 ret = 1;
             } else {
-                ret = ppc_radix64_next_level(cs->as, eaddr & R_EADDR_MASK,
+                ret = ppc_radix64_next_level(as, eaddr & R_EADDR_MASK,
                                              &h_raddr, &nls, g_page_size,
                                              &pte, &fault_cause);
             }
-- 
2.51.0


