Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQ0M5-0000wj-Im
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 01:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0M4-0000wR-50
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:24:24 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0M1-0007x1-Kr
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:24:23 -0500
Received: by mail-pf1-x435.google.com with SMTP id a5so658671pfv.10
 for <qemu-riscv@nongnu.org>; Wed, 08 Feb 2023 22:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRqJiEOrxr+Lg5i/nVzezfWn+WGoCCcHshuxculEll8=;
 b=cP2N5c3xoSFf8jJxN4Vu9hsVvGEegahPN+9wAkh7gAh5O/p0CJA5XgEd2BbAasmNjF
 4dgsjxUGi3ZqzM9B1IaefC2xLRfYO3gJW7ZwMQUMy3EGyJGXopUDzdC1a3u/lqARF47y
 zmixsJCOdfzE/2+Rqma3pMr02UaPvn1zbDa5ZFd/dUDehFTBEJw2uHTAsqFq0QZrZbOg
 ub7Oqi2dUVWUYPXzs/XIwURrsHO1JSQIusN+A/NYwH4Q9t0I1fUXmW5d7Fzmo1Xf24L8
 bOnaFLn09s6c/dnPDn6DzLUdt8rgy3t0mh5b1SmNJ2E8gykTW9UT9Vtsy23A5Mb18NLL
 73TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRqJiEOrxr+Lg5i/nVzezfWn+WGoCCcHshuxculEll8=;
 b=GxL2BhA8yhCIthRgF0/rWKWKHllmESu2YroEn9QbChyB9Asejy/7JeDAansifmh1gV
 Be51C1gvKdZA/M2XEVCk+AdJDo7/NUlkmtd0aCLhR6WDBPbbVfaGvll20H9rvxplmX//
 b5EKlewauk3aaRNgdIBJwzPLxnyEWrCymdJ73cTYmX/TtwNTwm4OUi/h/XciZvTDuvWA
 /or4ASwrG0rigwCbuasAqrBuJ5O6hlq7JNOWYCMKU2JZIPTezVBP9eQAckGU63wrqlHu
 C7KT8l5Jj3EwEowcBhwcTl3DTZ+PB/i+5xQ4kBst9TbPOMXG+IkRCMU+N7jed/UNzFRZ
 ZaRg==
X-Gm-Message-State: AO0yUKVkKb5Lof7+L4SAwCJZI9hk2m+cAHgNlizPgDxqDPvRf4Bt7bDw
 Xin7h5QBmE4aUdXnlca8/zuX+A==
X-Google-Smtp-Source: AK7set8Qgt/E1nnf1poSgtwsc0U48dP9tdqaBBIuvPQAcC0m6MPirbc4Lp/iEl0h1nLo1/5BSk1GMw==
X-Received: by 2002:aa7:9a1a:0:b0:592:5276:95df with SMTP id
 w26-20020aa79a1a000000b00592527695dfmr2577537pfj.2.1675923860649; 
 Wed, 08 Feb 2023 22:24:20 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7800e000000b00571cdbd0771sm521919pfi.102.2023.02.08.22.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:24:20 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v1 RFC Zisslpcfi 6/9] target/riscv: MMU changes for back cfi's
 shadow stack
Date: Wed,  8 Feb 2023 22:24:01 -0800
Message-Id: <20230209062404.3582018-7-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209062404.3582018-1-debug@rivosinc.com>
References: <20230209062404.3582018-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=debug@rivosinc.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 09 Feb 2023 06:24:24 -0000

zisslpcfi protects returns(back cfi) using shadow stack. If compiled with
enabled compiler, function prologs will have `sspush ra` instruction to
push return address on shadow stack and function epilogs will have
`sspop t0; sschckra` instruction sequences. `sspop t0` will pop the
value from top of the shadow stack in t0. `sschckra` will compare `t0`
and `x1` and if they don't match then hart will raise an illegal
instruction exception.

Shadow stack is read-only memory except stores can be performed via
`sspush` and `ssamoswap` instructions. This requires new PTE encoding for
shadow stack. zisslpcfi uses R=0, W=1, X=0 (an existing reserved encoding
) to encode a shadow stack. If backward cfi is not enabled for current
mode, shadow stack PTE encodings remain reserved. Regular stores to
shadow stack raise AMO/store access fault. Shadow stack loads/stores on
regular memory raise load access/store access fault.

This patch creates a new MMU TLB index for shadow stack and flushes TLB
for shadow stack on privileges changes. This patch doesn't implement
`Smepmp` related enforcement on shadow stack pmp entry. Reason being qemu
doesn't have `Smepmp` implementation yet. `Smepmp` enforcement should come
whenever it is implemented.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Kip Walker  <kip@rivosinc.com>
---
 target/riscv/cpu-param.h  |   1 +
 target/riscv/cpu.c        |   2 +
 target/riscv/cpu.h        |   3 ++
 target/riscv/cpu_helper.c | 107 +++++++++++++++++++++++++++++++-------
 4 files changed, 94 insertions(+), 19 deletions(-)

diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
index ebaf26d26d..a1e379beb7 100644
--- a/target/riscv/cpu-param.h
+++ b/target/riscv/cpu-param.h
@@ -25,6 +25,7 @@
  *  - M mode 0b011
  *  - U mode HLV/HLVX/HSV 0b100
  *  - S mode HLV/HLVX/HSV 0b101
+ *  - BCFI shadow stack   0b110
  *  - M mode HLV/HLVX/HSV 0b111
  */
 #define NB_MMU_MODES 8
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6b4e90eb91..14cfb93288 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -584,6 +584,8 @@ static void riscv_cpu_reset_hold(Object *obj)
     }
     /* mmte is supposed to have pm.current hardwired to 1 */
     env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
+    /* Initialize ss_priv to current priv. */
+    env->ss_priv = env->priv;
 #endif
     env->xl = riscv_cpu_mxl(env);
     riscv_cpu_update_mask(env);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d14ea4f91d..8803ea6426 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -379,6 +379,7 @@ struct CPUArchState {
     uint64_t sstateen[SMSTATEEN_MAX_COUNT];
     target_ulong senvcfg;
     uint64_t henvcfg;
+    target_ulong ss_priv;
 #endif
     target_ulong cur_pmmask;
     target_ulong cur_pmbase;
@@ -617,6 +618,8 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
 #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
+/* TLB MMU index for shadow stack accesses */
+#define MMU_IDX_SS_ACCESS    6
 
 #include "exec/cpu-all.h"
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index fc188683c9..63377abc2f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -657,7 +657,8 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
 
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
 {
-    return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+    return (mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK) &&
+           (mmu_idx != MMU_IDX_SS_ACCESS);
 }
 
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
@@ -745,6 +746,38 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
      * preemptive context switch. As a result, do both.
      */
     env->load_res = -1;
+
+    if (cpu_get_bcfien(env) && (env->priv != env->ss_priv)) {
+        /*
+         * If backward CFI is enabled in the new privilege state, the
+         * shadow stack TLB needs to be flushed - unless the most recent
+         * use of the SS TLB was for the same privilege mode.
+         */
+        tlb_flush_by_mmuidx(env_cpu(env), 1 << MMU_IDX_SS_ACCESS);
+        /*
+         * Ignoring env->virt here since currently every time it flips,
+         * all TLBs are flushed anyway.
+         */
+        env->ss_priv = env->priv;
+    }
+}
+
+typedef enum {
+    SSTACK_NO,          /* Access is not for a shadow stack instruction */
+    SSTACK_YES,         /* Access is for a shadow stack instruction */
+    SSTACK_DC           /* Don't care about SS attribute in PMP */
+} SStackPmpMode;
+
+static bool legal_sstack_access(int access_type, bool sstack_inst,
+                                bool sstack_attribute)
+{
+    /*
+     * Read/write/execution permissions are checked as usual. Shadow
+     * stack enforcement is just that (1) instruction type must match
+     * the attribute unless (2) a non-SS load to an SS region.
+     */
+    return (sstack_inst == sstack_attribute) ||
+        ((access_type == MMU_DATA_LOAD) && sstack_attribute);
 }
 
 /*
@@ -764,7 +797,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
 static int get_physical_address_pmp(CPURISCVState *env, int *prot,
                                     target_ulong *tlb_size, hwaddr addr,
                                     int size, MMUAccessType access_type,
-                                    int mode)
+                                    int mode, SStackPmpMode sstack)
 {
     pmp_priv_t pmp_priv;
     int pmp_index = -1;
@@ -812,13 +845,16 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
  *               Second stage is used for hypervisor guest translation
  * @two_stage: Are we going to perform two stage translation
  * @is_debug: Is this access from a debugger or the monitor?
+ * @sstack: Is this access for a shadow stack? Passed by reference so
+            it can be forced to SSTACK_DC when the SS check is completed
+            based on a PTE - so the PMP SS attribute will be ignored.
  */
 static int get_physical_address(CPURISCVState *env, hwaddr *physical,
                                 int *prot, target_ulong addr,
                                 target_ulong *fault_pte_addr,
                                 int access_type, int mmu_idx,
                                 bool first_stage, bool two_stage,
-                                bool is_debug)
+                                bool is_debug, SStackPmpMode *sstack)
 {
     /* NOTE: the env->pc value visible here will not be
      * correct, but the value visible to the exception handler
@@ -830,6 +866,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     hwaddr ppn;
     RISCVCPU *cpu = env_archcpu(env);
     int napot_bits = 0;
+    bool is_sstack = (sstack != NULL) && (*sstack == SSTACK_YES);
     target_ulong napot_mask;
 
     /*
@@ -851,6 +888,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         if (get_field(env->mstatus, MSTATUS_MPRV)) {
             mode = get_field(env->mstatus, MSTATUS_MPP);
         }
+    } else if (mmu_idx == MMU_IDX_SS_ACCESS) {
+        mode = env->priv;
     }
 
     if (first_stage == false) {
@@ -966,7 +1005,7 @@ restart:
             int vbase_ret = get_physical_address(env, &vbase, &vbase_prot,
                                                  base, NULL, MMU_DATA_LOAD,
                                                  mmu_idx, false, true,
-                                                 is_debug);
+                                                 is_debug, NULL);
 
             if (vbase_ret != TRANSLATE_SUCCESS) {
                 if (fault_pte_addr) {
@@ -983,7 +1022,7 @@ restart:
         int pmp_prot;
         int pmp_ret = get_physical_address_pmp(env, &pmp_prot, NULL, pte_addr,
                                                sizeof(target_ulong),
-                                               MMU_DATA_LOAD, PRV_S);
+                                               MMU_DATA_LOAD, PRV_S, SSTACK_NO);
         if (pmp_ret != TRANSLATE_SUCCESS) {
             return TRANSLATE_PMP_FAIL;
         }
@@ -1010,6 +1049,18 @@ restart:
             }
         }
 
+        /*
+         * When backward CFI is enabled, the R=0, W=1, X=0 reserved encoding
+         * is used to mark Shadow Stack (SS) pages. If back CFI enabled, allow
+         * normal loads on SS pages, regular stores raise store access fault
+         * and avoid hitting the reserved-encoding case. Only shadow stack
+         * stores are allowed on SS pages. Shadow stack loads and stores on
+         * regular memory (non-SS) raise load and store/AMO access fault.
+         * Second stage translations don't participate in Shadow Stack.
+         */
+        bool sstack_page = (cpu_get_bcfien(env) && first_stage &&
+                            ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W));
+
         if (!(pte & PTE_V)) {
             /* Invalid PTE */
             return TRANSLATE_FAIL;
@@ -1021,7 +1072,7 @@ restart:
                 return TRANSLATE_FAIL;
             }
             base = ppn << PGSHIFT;
-        } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
+        } else if (((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) && !sstack_page) {
             /* Reserved leaf PTE flags: PTE_W */
             return TRANSLATE_FAIL;
         } else if ((pte & (PTE_R | PTE_W | PTE_X)) == (PTE_W | PTE_X)) {
@@ -1038,16 +1089,21 @@ restart:
         } else if (ppn & ((1ULL << ptshift) - 1)) {
             /* Misaligned PPN */
             return TRANSLATE_FAIL;
-        } else if (access_type == MMU_DATA_LOAD && !((pte & PTE_R) ||
-                   ((pte & PTE_X) && mxr))) {
+        } else if (access_type == MMU_DATA_LOAD && !(((pte & PTE_R) ||
+                   sstack_page) || ((pte & PTE_X) && mxr))) {
             /* Read access check failed */
             return TRANSLATE_FAIL;
-        } else if (access_type == MMU_DATA_STORE && !(pte & PTE_W)) {
+        } else if ((access_type == MMU_DATA_STORE && !is_sstack) &&
+                   !(pte & PTE_W)) {
             /* Write access check failed */
             return TRANSLATE_FAIL;
         } else if (access_type == MMU_INST_FETCH && !(pte & PTE_X)) {
             /* Fetch access check failed */
             return TRANSLATE_FAIL;
+        } else if (!legal_sstack_access(access_type, is_sstack,
+                                        sstack_page)) {
+            /* Illegal combo of instruction type and page attribute */
+            return TRANSLATE_PMP_FAIL;
         } else {
             /* if necessary, set accessed and dirty bits. */
             target_ulong updated_pte = pte | PTE_A |
@@ -1107,18 +1163,27 @@ restart:
                          ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
 
             /* set permissions on the TLB entry */
-            if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
+            if ((pte & PTE_R) || ((pte & PTE_X) && mxr) || sstack_page) {
                 *prot |= PAGE_READ;
             }
             if ((pte & PTE_X)) {
                 *prot |= PAGE_EXEC;
             }
-            /* add write permission on stores or if the page is already dirty,
-               so that we TLB miss on later writes to update the dirty bit */
+            /*
+             * add write permission on stores or if the page is already dirty,
+             * so that we TLB miss on later writes to update the dirty bit
+             */
             if ((pte & PTE_W) &&
                     (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
                 *prot |= PAGE_WRITE;
             }
+            if (sstack) {
+                /*
+                 * Tell the caller to skip the SS bit in the PMP since we
+                 * resolved the attributes via the page table.
+                 */
+                *sstack = SSTACK_DC;
+            }
             return TRANSLATE_SUCCESS;
         }
     }
@@ -1190,13 +1255,13 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     int mmu_idx = cpu_mmu_index(&cpu->env, false);
 
     if (get_physical_address(env, &phys_addr, &prot, addr, NULL, 0, mmu_idx,
-                             true, riscv_cpu_virt_enabled(env), true)) {
+                             true, riscv_cpu_virt_enabled(env), true, NULL)) {
         return -1;
     }
 
     if (riscv_cpu_virt_enabled(env)) {
         if (get_physical_address(env, &phys_addr, &prot, phys_addr, NULL,
-                                 0, mmu_idx, false, true, true)) {
+                                 0, mmu_idx, false, true, true, NULL)) {
             return -1;
         }
     }
@@ -1291,6 +1356,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     bool two_stage_indirect_error = false;
     int ret = TRANSLATE_FAIL;
     int mode = mmu_idx;
+    bool sstack = (mmu_idx == MMU_IDX_SS_ACCESS);
+    SStackPmpMode ssmode = sstack ? SSTACK_YES : SSTACK_NO;
     /* default TLB page size */
     target_ulong tlb_size = TARGET_PAGE_SIZE;
 
@@ -1318,7 +1385,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         /* Two stage lookup */
         ret = get_physical_address(env, &pa, &prot, address,
                                    &env->guest_phys_fault_addr, access_type,
-                                   mmu_idx, true, true, false);
+                                   mmu_idx, true, true, false, &ssmode);
 
         /*
          * A G-stage exception may be triggered during two state lookup.
@@ -1342,7 +1409,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
             ret = get_physical_address(env, &pa, &prot2, im_address, NULL,
                                        access_type, mmu_idx, false, true,
-                                       false);
+                                       false, NULL);
 
             qemu_log_mask(CPU_LOG_MMU,
                     "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
@@ -1353,7 +1420,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
             if (ret == TRANSLATE_SUCCESS) {
                 ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
-                                               size, access_type, mode);
+                                               size, access_type, mode,
+                                               SSTACK_NO);
 
                 qemu_log_mask(CPU_LOG_MMU,
                               "%s PMP address=" HWADDR_FMT_plx " ret %d prot"
@@ -1377,7 +1445,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else {
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
-                                   access_type, mmu_idx, true, false, false);
+                                   access_type, mmu_idx, true, false,
+                                   false, &ssmode);
 
         qemu_log_mask(CPU_LOG_MMU,
                       "%s address=%" VADDR_PRIx " ret %d physical "
@@ -1386,7 +1455,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
         if (ret == TRANSLATE_SUCCESS) {
             ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
-                                           size, access_type, mode);
+                                           size, access_type, mode, ssmode);
 
             qemu_log_mask(CPU_LOG_MMU,
                           "%s PMP address=" HWADDR_FMT_plx " ret %d prot"
-- 
2.25.1


