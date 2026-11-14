Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDED606A323
	for <qemu-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 22:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JlzrGiGj
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xSLme-0005bG-D3; Sat, 14 Nov 2026 16:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1xSLmX-0005ah-DM
 for qemu-riscv@nongnu.org; Sat, 14 Nov 2026 16:59:33 -0500
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1xSLmT-0007lF-NR
 for qemu-riscv@nongnu.org; Sat, 14 Nov 2026 16:59:33 -0500
Received: by mail-dy1-x1330.google.com with SMTP id
 5a478bee46e88-3791619605cso4454247eec.0
 for <qemu-riscv@nongnu.org>; Sat, 14 Nov 2026 13:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794693567; x=1795298367; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Rc4sD1xe+oEGZ5vwNX9YVw3BpxsRRsCraCvcvi1Qals=;
 b=JlzrGiGjY848RZZ9TXCfIHL5ZLXRdO/wweBuzC/uV/GQUd6kykwE7+nm4TOBS/xR9r
 M7IE2LmXv0oNaxHEN25+CB6BLldbM90lF250zRlPM4UkoDVTADk++rPGBplRTfmwdACF
 RPnyobl+jvyVBLN06DGZaYY9WM1W8BXbzq3FgRv6s5yBlfCvc+phfUcThMoE30RAnBjS
 X7iyVvFPC0DNmUCdUQ3SXxH4JbCIIhRhaMC2gLapMBnwaXWLV1eteFXI5+C1Bay78kSv
 x6/Weq5ChdKxYEDmRd3uaHHOdeSubYIPnknLnmoc3kELSyPSd+/wzwivwxfhLaQdZO3W
 PQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794693567; x=1795298367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Rc4sD1xe+oEGZ5vwNX9YVw3BpxsRRsCraCvcvi1Qals=;
 b=sjHyjkNDLiwVJHCikFPiQhNC8xtA7gxnBKouKjqzAnIiC+xD1q/U+a08z7pRJG1OqP
 lK3m3ImAM7X9cHHHC3r3LUqW3DwJxVNZXPEw1vOodRmTDRU7T6YRK6t5FZs5Dfq8r5ub
 RU/PqUw6hOtaoLB9dUBwAzUdihWajfVORphQpYcP29iAowftNX4tYRItVqfA4oR+VnaW
 MIM3zT/JDozLChe9qYAfIbtzpf0PULnLFAx0cR6dQVIqL2uW4khIq2dZoQX/XkwJLcId
 HFteNoqBPbcu34LVKrXiLmf8z8UJdJONmGP4F1Ip5OFGDPLi/7d1YMSzM44+E8DKVgjb
 ofJQ==
X-Gm-Message-State: APuU4Z9mF608WHcvabkpaqxJJt8TQRCMKnaQCBYv0SL+dIuuKJPVSkse
 c2XGh8Cy5cF1snEOlwcBLu9Dbbb4NvLFIvc13wIkktTHdmK/A/dM6nFtMuaKelxqLkY=
X-Gm-Gg: AYBFou1anRXfeOT9gVM3IzkDaz/ceKTF1D1eoWCLca6qkVm9EVfRwTLgfkGgqt+bkxF
 k8Rlg4mL9gwnHx04ZyYvTNtuK+cP2zIk9Ce/rWXo5chiO5ceAFbgw1d+nklLNTJLPx1shpAy3r3
 xk4+wEKE5iWX+geZvqIlXQGtMTyZc6BQw/h4B/M0ssuX/cAlfiQVwaBo1KYnLT3cimuN2cfzo2k
 SO9sAWZX+3xH6NliYnCsSB05NC5ySptWEyNPM7UQ057e6MQYkns7r0YDO8/JZTXjMe2L+0I0ISN
 M7nvQX0qM+SuSnAkrCZ9C/X/3dFd4fHIYTC54YmnsyPujm2DjO12v93mA5lSLY0BSdYF6jR0H6t
 g3JUFdvKSHYLtBBYF10++V9xKU48+Z2okSOJLiyFyRWA6/5oKX9eSbY6Svnc/831qBYDD4f5Iex
 bUVc/z7E90Su+d/sOF9sVj9bBWfcE6wIUPhj9qVMmJnnfhqWX7F0YZQXT2YZufWwQWerdtIELkK
 9kk5Eo2N2udTqHh6B8didjLWqjChCrldO7A8IBxqV17wAoekvWCB9tpCqs9BpajGfg6l0yHbP1c
 +i0rJjURlFGD56dyXWcMklvGWZ1nNATGEw0nHIiu
X-Received: by 2002:a05:701b:2706:b0:1b5:1005:682b with SMTP id
 a92af1059eb24-1b510056b26mr3932437c88.7.1794693566463; 
 Sat, 14 Nov 2026 13:59:26 -0800 (PST)
Received: from localhost.localdomain ([117.250.161.222])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b50316e195sm21930568c88.8.2026.11.14.13.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2026 13:59:25 -0800 (PST)
From: Abhigyan Kumar <314abh@gmail.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Abhigyan Kumar <314abh@gmail.com>
Subject: [PATCH] target/riscv: make Zicfiss CBO checks independent of TLB state
Date: Sun, 15 Nov 2026 03:29:08 +0530
Message-ID: <20261114215908.260568-1-314abh@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1330;
 envelope-from=314abh@gmail.com; helo=mail-dy1-x1330.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_STARTS_WITH_NUMS,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Zicfiss extension requires CBO.CLEAN/FLUSH/INVAL on a shadow stack
page to raise a store/AMO access fault. Citing section 15.1.2.3 ("Shadow
Stack Memory Protection") of the RISC-V spec:

    "Memory mapped as an SS page cannot be written to by instructions
    other than SSAMOSWAP.W/D, SSPUSH, and C.SSPUSH. Attempts will raise
    a store/AMO access-fault exception. Access to a SS page using
    cache-block operation (CBO.*) instructions is not permitted. Such
    accesses will raise a store/AMO access-fault exception. Implicit
    accesses, including instruction fetches to an SS page, are not
    permitted. Such accesses will raise an access-fault exception
    appropriate to the access type. However, the shadow stack is
    readable by all instructions that only load from memory."

Currently, CBO.* instructions quietly return when operated on a shadow
stack page. check_zicomb_access probes pages for read with non-fault
set. Then, get_physical_address reports a shadow stack page as
unreadable when called from a probing tlb_fill. But it only works when
probe reaches tlb_fill. After a usual load, probe hits TLB and reports
the page as readable. Hence, causing CBOs to quietly return.

This commit introduces CPUTLBEntryFull.extra.riscv.sstack as
a marker for shadow stack pages inside TLB entries. When riscv.sstack is
set, check_zicbom_access falls through it to probe_write.

With this commit, the now-redundant special case in get_physical_address
for probe is removed. is_probe in a call to get_physical_address is
replaced with is_sstack_page. As a side effect non-fault probes of
shadow stack pages no longer see them as unreadable, matching what a
usual load does.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4789
Fixes: 669b4867495c ("target/riscv: mmu changes for zicfiss shadow stack protection")
Signed-off-by: Abhigyan Kumar <314abh@gmail.com>
---
 include/hw/core/cpu.h         |  5 ++++
 target/riscv/tcg/cpu_helper.c | 49 +++++++++++++++++++++++++----------
 target/riscv/tcg/op_helper.c  | 16 ++++++++++++
 3 files changed, 57 insertions(+), 13 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 5b7c330047..71666a5497 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -277,6 +277,11 @@ struct CPUTLBEntryFull {
             uint8_t shareability;
             bool guarded;
         } arm;
+
+        struct {
+            /* Zicfiss shadow stack page. */
+            bool sstack;
+        } riscv;
     } extra;
 };
 
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 58e98e975c..d1b902fea2 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -1096,7 +1096,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
                                 hwaddr *fault_pte_addr,
                                 int access_type, int mmu_idx,
                                 bool first_stage, bool two_stage,
-                                bool is_debug, bool is_probe)
+                                bool is_debug, bool *is_sstack_page)
 {
     /*
      * NOTE: the env->pc value visible here will not be
@@ -1254,7 +1254,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
             int vbase_ret = get_physical_address(env, &vbase, &vbase_prot,
                                                  base, NULL, MMU_DATA_LOAD,
                                                  MMUIdx_U, false, true,
-                                                 is_debug, false);
+                                                 is_debug, NULL);
 
             if (vbase_ret != TRANSLATE_SUCCESS) {
                 if (fault_pte_addr) {
@@ -1411,6 +1411,9 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         return TRANSLATE_FAIL;
     }
 
+    /* If gets stale after a goto restart. */
+    sstack_page = false;
+
     target_ulong rwx = pte & (PTE_R | PTE_W | PTE_X);
     /* Check for reserved combinations of RWX flags. */
     switch (rwx) {
@@ -1421,10 +1424,10 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         if (cpu_get_bcfien(env) && first_stage) {
             sstack_page = true;
             /*
-             * if ss index, read and write allowed. else if not a probe
-             * then only read allowed
+             * If ss index, read and write allowed, else allow only reads.
+             * Page flagged in TLB for CBOs to be able to tell them apart.
              */
-            rwx = is_sstack_idx ? (PTE_R | PTE_W) : (is_probe ? 0 :  PTE_R);
+            rwx = is_sstack_idx ? (PTE_R | PTE_W) : PTE_R;
             break;
         }
         return TRANSLATE_FAIL;
@@ -1539,7 +1542,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
             int gpa_ret = get_physical_address(env, &gpa_paddr, &gpa_prot,
                                                pte_gpa, NULL, MMU_DATA_STORE,
                                                MMUIdx_U, false, true,
-                                               is_debug, false);
+                                               is_debug, NULL);
             if (gpa_ret != TRANSLATE_SUCCESS) {
                 if (fault_pte_addr) {
                     *fault_pte_addr = pte_gpa >> 2;
@@ -1612,6 +1615,10 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
     *ret_prot = prot;
 
+    if (is_sstack_page) {
+        *is_sstack_page = sstack_page;
+    }
+
     return TRANSLATE_SUCCESS;
 }
 
@@ -1669,13 +1676,13 @@ bool riscv_cpu_translate_for_debug(CPUState *cs, vaddr addr,
     int mmu_idx = riscv_env_mmu_index(&cpu->env, false);
 
     if (get_physical_address(env, &phys_addr, &prot, addr, NULL, 0, mmu_idx,
-                             true, env->virt_enabled, true, false)) {
+                             true, env->virt_enabled, true, NULL)) {
         return false;
     }
 
     if (env->virt_enabled) {
         if (get_physical_address(env, &phys_addr, &prot, phys_addr, NULL,
-                                 0, MMUIdx_U, false, true, true, false)) {
+                                 0, MMUIdx_U, false, true, true, NULL)) {
             return false;
         }
     }
@@ -1779,6 +1786,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     bool first_stage_error = true;
     bool two_stage_lookup = mmuidx_2stage(mmu_idx);
     bool two_stage_indirect_error = false;
+    bool sstack_page = false;
     int ret = TRANSLATE_FAIL;
     privilege_mode_t mode = mmuidx_priv(mmu_idx);
     /* default TLB page size */
@@ -1794,7 +1802,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         /* Two stage lookup */
         ret = get_physical_address(env, &pa, &prot, address,
                                    &env->guest_phys_fault_addr, access_type,
-                                   mmu_idx, true, true, false, probe);
+                                   mmu_idx, true, true, false, &sstack_page);
         /*
          * A G-stage exception may be triggered during two state lookup.
          * And the env->guest_phys_fault_addr has already been set in
@@ -1816,7 +1824,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
             ret = get_physical_address(env, &pa, &prot2, im_address, NULL,
                                        access_type, MMUIdx_U, false, true,
-                                       false, probe);
+                                       false, NULL);
 
             qemu_log_mask(CPU_LOG_MMU,
                           "%s 2nd-stage address=%" VADDR_PRIx
@@ -1854,7 +1862,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false,
-                                   probe);
+                                   &sstack_page);
 
         qemu_log_mask(CPU_LOG_MMU,
                       "%s address=%" VADDR_PRIx " ret %d physical "
@@ -1880,8 +1888,23 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 
     if (ret == TRANSLATE_SUCCESS) {
-        tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
-                     prot, mmu_idx, tlb_size);
+        /*
+         * tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
+         *           prot, mmu_idx, tlb_size);
+         */
+        CPUTLBEntryFull full = {
+            .phys_addr = pa & ~(tlb_size - 1),
+            .attrs = MEMTXATTRS_UNSPECIFIED,
+            .prot = prot,
+            .lg_page_size = ctz64(tlb_size),
+            /*
+             * Allows CBO.* to differentiate between a shadow-ss from a usual,
+             * readable one.
+             */
+            .extra.riscv.sstack = sstack_page,
+        };
+
+        tlb_set_page_full(cs, mmu_idx, address & ~(tlb_size - 1), &full);
         return true;
     } else if (probe) {
         return false;
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index f9c79fe6b9..a289cb1a84 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -224,6 +224,9 @@ void HELPER(cbo_zero)(CPURISCVState *env, target_ulong address)
  * section 2.5.2 of the CMO specification) for Zicbom, raising
  * either store page-fault (non-virtualized) or store guest-page
  * fault (virtualized).
+ *
+ * Zicfiss: CBOs on a shadow stack page always raise a store/AMO access fault
+ * even though loads are allowed.
  */
 static void check_zicbom_access(CPURISCVState *env,
                                 target_ulong address,
@@ -233,6 +236,9 @@ static void check_zicbom_access(CPURISCVState *env,
     int mmu_idx = riscv_env_mmu_index(env, false);
     uint16_t cbomlen = cpu->cfg.cbom_blocksize;
     void *phost;
+#ifndef CONFIG_USER_ONLY
+    CPUTLBEntryFull *full;
+#endif
     int ret;
 
     /* Mask off low-bits to align-down to the cache-block. */
@@ -250,12 +256,22 @@ static void check_zicbom_access(CPURISCVState *env,
      * addresses, whether a cache-block management instruction is
      * permitted to access the cache block is UNSPECIFIED."
      */
+#ifdef CONFIG_USER_ONLY
     ret = probe_access_flags(env, address, cbomlen, MMU_DATA_LOAD,
                              mmu_idx, true, &phost, ra);
     if (ret != TLB_INVALID_MASK) {
         /* Success: readable */
         return;
     }
+#else
+    ret = probe_access_full(env, address, cbomlen, MMU_DATA_LOAD,
+            mmu_idx, true, &phost, &full, ra);
+    /* A shadow stack page is readable but faults after fall through. */
+    if (ret != TLB_INVALID_MASK && !full->extra.riscv.sstack) {
+        /* Success: readable */
+        return;
+    }
+#endif
 
     /*
      * Since not readable, must be writable. On failure, store
-- 
2.56.1


