Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A3D606A31E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 17:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UoMMeTmy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWGkS-0008FT-9j; Wed, 25 Nov 2026 12:25:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1xWGk3-0007dz-Kt
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 12:25:12 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1xWGk1-0006vu-BM
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 12:25:11 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2f02ee04378so48316435ad.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 09:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795627507; x=1796232307; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8G5G2dBni0JKdh9xrbA4JuHoBL0653720v9pk/wxrJQ=;
 b=UoMMeTmyszgfd8EXSeupq0LLvfo4ZcaLPLe62WF6mZ17MlWCk1l3/zc0kJhMpfJttW
 cNPY1tPWnw8Thyfryn+d1KOba9Y5p17De+Aw2qjztlgQjuko9k8Sk2ZR37ihjOqio8a2
 6vc+IwL/BkJsH28IxBith+AcFDUAhTxQXYzSqBR693+HMCqqkImewwNh4BFH3iuFK5KQ
 nF8KiF/dCZA8fEX9J3T9Ng/CgzJcUVOzlMYXogtNEGvZCpjPmNZbwN3FCQIi+irYIcc2
 Hlwyi4TEW+pVKx9D6t0FtdGOQU5Lg5vNm4ZWzL5wdByHasQkiaU8WEIremQeoggRQwnT
 1CQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795627507; x=1796232307;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8G5G2dBni0JKdh9xrbA4JuHoBL0653720v9pk/wxrJQ=;
 b=2uZi5BjGbfU1/SzSrAtUX5o5MqqhZCs/PpTdqYypo9VabfHP1crJeMFEjbrjp4qBBg
 oIkv6Pi3cEVitdMEpYMNOR14NXVGU1MY+xpdCwiGsDEeKRX3stNyjYJx2CtEDzLWE7eZ
 L0A5Qt7DanKQGWdSbylpGUlnij1St3ry9cyleN9HHoOiSEu21Drex7qqHI11XjNlEdjm
 MndUs7EtNB8PSOviH/E+mAz3qnWh5knAw4WKgS97vc3bxK5pIIudnJqw+3zf/YMjO2Qv
 SekwNMoNdQ+//9BEyDS2/wWSUe8iqpYxajf5iDiw49deLFnwnX57k48Soif8O+Pay0mh
 ldmQ==
X-Gm-Message-State: APuU4Z/bWCUxS7mkZ3kJsx68rNIKX5sdukQcWkMfERJeNOqkLajCcYnD
 Tm5XdyVhbiAuMcqRIinIrCwRAOP53LmcHtGcKqk6eEhvBLRI1Swz7TWcnueOwk1G
X-Gm-Gg: AZFdTZehc64M2ub0w/M7YefpFmRLMpU2u9sopOI3U6iVJ0stL6OHYKWKEDsH/kdXuJo
 FEDdbd0mxPz9JD3Mvl4OXlbDYK4OKIjQ76NhZOn4BVMShYTfrY4JvBzaSKDk5rudsO8S7ot95kZ
 0fSaSbWOdeobXDrvtV+YfA+RHf49CUVi16LrqOcJhcfAg1QrTYgBcF/rSLrC8c22uZ+YRyN/S3c
 LJSM5X4X/DKGTQ562x4G6Yc3DYQhu9JWdnEt0+F9Ox10qhI938LkPqf6SPjhAvpmkV5ArHanPe7
 td+5/J/hanzJ0PzKIWvj1l8FjhlTXa2OgKszVE7LvZgW02wMH4xPIYc2lhVLiukva+jqLEfct2p
 hmrLJgdbSXL7g7K0KiJ12cUulekA4SeAqcnLFof4aiTXXJVh87cILr7GoliZnshSh2rv0JUeV+2
 z0OMStPD9Ks53whxHRdATrBVTZYCrd3gvFyWNsaFR3kruqMUGArMf0V0KynLhndihYPVd2VSobN
 lCzs92YLkpiE0piCW/8xV4a1salIqsgDsTAdze/ycpnNOr0J3OIHoe8qfj4zqOSSlqN1PNH2EB3
 zUfoP/W09R5Z4/fHmEdXJlLWIjQSyt0jLKxjHOhc
X-Received: by 2002:a17:90b:4483:b0:3b0:9deb:d991 with SMTP id
 98e67ed59e1d1-3b41c92cbb8mr17760607a91.35.1795627506799; 
 Wed, 25 Nov 2026 09:25:06 -0800 (PST)
Received: from localhost.localdomain ([117.250.161.222])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b405d96bd3sm31618305a91.12.2026.11.25.09.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 09:25:06 -0800 (PST)
From: abh <314abh@gmail.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Abhigyan Kumar <314abh@gmail.com>
Subject: [PATCH v2] target/riscv: make Zicfiss CBO checks independent of TLB
 state
Date: Wed, 25 Nov 2026 22:54:49 +0530
Message-ID: <20261125172449.76621-1-314abh@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=314abh@gmail.com; helo=mail-pl1-x62c.google.com
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
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Abhigyan Kumar <314abh@gmail.com>

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
v2:
- Rebase on alistair/riscv-to-apply.next (4ac269ea5c).
- Declare fault_addr only for CONFIG_USER_ONLY, fixing the
  -Werror=unused-variable failure in softmmu builds.
---
 include/hw/core/cpu.h         |  5 ++++
 target/riscv/tcg/cpu_helper.c | 49 +++++++++++++++++++++++++----------
 target/riscv/tcg/op_helper.c  | 19 +++++++++++++-
 3 files changed, 59 insertions(+), 14 deletions(-)

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
index 33d6b41ceb..e13e2ec2a3 100644
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
index 52aa545eec..b9ca737fb7 100644
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
@@ -231,8 +234,12 @@ static void check_zicbom_access(CPURISCVState *env,
 {
     uint16_t cbomlen = riscv_cpu_cfg(env)->cbom_blocksize;
     int mmu_idx = riscv_env_mmu_index(env, false);
-    uint64_t fault_addr = address;
     void *phost;
+#ifdef CONFIG_USER_ONLY
+    uint64_t fault_addr = address;
+#else
+    CPUTLBEntryFull *full;
+#endif
     int ret;
 
     /* Mask off low-bits to align-down to the cache-block. */
@@ -250,6 +257,7 @@ static void check_zicbom_access(CPURISCVState *env,
      * addresses, whether a cache-block management instruction is
      * permitted to access the cache block is UNSPECIFIED."
      */
+#ifdef CONFIG_USER_ONLY
     ret = probe_access_flags(env, address, cbomlen, MMU_DATA_LOAD,
                              mmu_idx, true, &phost, ra);
     if (ret & TLB_MMIO) {
@@ -259,6 +267,15 @@ static void check_zicbom_access(CPURISCVState *env,
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


