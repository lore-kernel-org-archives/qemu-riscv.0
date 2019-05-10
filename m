Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hPAfm-00086Y-5M
	for mharc-qemu-riscv@gnu.org; Fri, 10 May 2019 14:55:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hPAfZ-0007wJ-KB
	for qemu-riscv@nongnu.org; Fri, 10 May 2019 14:55:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hPAfR-0005tU-0G
	for qemu-riscv@nongnu.org; Fri, 10 May 2019 14:54:57 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hPAfQ-0005rR-N5
	for qemu-riscv@nongnu.org; Fri, 10 May 2019 14:54:48 -0400
Received: by mail-pf1-x441.google.com with SMTP id v80so3700788pfa.3
	for <qemu-riscv@nongnu.org>; Fri, 10 May 2019 11:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2nv1Fz6coVTYizv8OMxkCDga0OEiAnrikMT8xHCBMUM=;
	b=XgBIQLVJzunHW2aEjGIPsFY0aDf7tUEK+y/juLg1z7y3bxWJonO47Y3iA2Mqz0roev
	IoLEp3BQ5hfdE0BNswP1g+XKkzwIffhlo2oXcxmxc8xCfVoIFZhNR1LDyLC5ztXAV1GL
	ssi59GoxXntsSiPclIP9rGcBblfo55S4rkk9VuDM0GXwuq5VFqSq5fEbAZizCzN5XcZs
	pFku/IYqEF2HIhcwJL8yc1X8+jQt99yNxMAPSRDtUGVL7SbD5MC6/wCsyk0t7s/P2cic
	9K7kuw372YZcVu9kxrusBmYxrjpQHgVNO1EGUOLZCuOf8oilR3gjvmbQQwuhta8bBJ5m
	w/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2nv1Fz6coVTYizv8OMxkCDga0OEiAnrikMT8xHCBMUM=;
	b=Sl1yPrjrYEDgiwx1mZo3N0CnS8IEel3LIUpbCNNkSikBSc4XMDj3eU1xavJaMNVRRg
	IFNpYHmblEeiby9n5GmSWetulPZC9lkqD9ajjQ9kACBwMvh/eKTeHJoHy250VzSPuyua
	MihtOCbVL0bjtBlUwrZditWdmcCJZ0qawOA70DuTn9Jd/HBO0snZAt/95IDXnE/gkt4X
	bzMAPA9oG8RvzOyJbJ5AY+nSwr3UXRFXmTfVxMYewsRoNbYe0gULfoDITbY27MOz3dUH
	g61wAgRLr1OVQgjcTIRGJYjKik5L2II5p/YU5Rwf6P8Yw+fxWsvOjujDxLdpszXHFtnE
	E5/Q==
X-Gm-Message-State: APjAAAVn9U36fLkama81hX+k+YthYupd/3SWCjz06r7HGmR4ksVTctyL
	lYz7hOhxiqd1DgOWupbekEOKpA==
X-Google-Smtp-Source: APXvYqwxcyMpnDolABzz6ZvYP6GnCABGM65hutMFyw577lxqf11TSZkAWDcG2Q806aiORp11au2UYQ==
X-Received: by 2002:aa7:9afc:: with SMTP id y28mr16719834pfp.101.1557514487752;
	Fri, 10 May 2019 11:54:47 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	q20sm12733146pfi.166.2019.05.10.11.54.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 11:54:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-riscv@nongnu.org,
	Palmer Dabbelt <palmer@sifive.com>
Date: Fri, 10 May 2019 11:54:36 -0700
Message-Id: <20190510185438.29533-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510185438.29533-1-richard.henderson@linaro.org>
References: <20190510185438.29533-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-riscv] [PULL v2 17/27] target/riscv: Convert to
 CPUClass::tlb_fill
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2019 18:55:09 -0000

Note that env->pc is removed from the qemu_log as that value is garbage.
The PC isn't recovered until cpu_restore_state, called from
cpu_loop_exit_restore, called from riscv_raise_exception.

Cc: qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h        |  5 +++--
 target/riscv/cpu.c        |  5 ++---
 target/riscv/cpu_helper.c | 46 ++++++++++++++++++---------------------
 3 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7d9f48973f..c17184f4e4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -261,8 +261,9 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                     MMUAccessType access_type, int mmu_idx,
                                     uintptr_t retaddr);
-int riscv_cpu_handle_mmu_fault(CPUState *cpu, vaddr address, int size,
-                              int rw, int mmu_idx);
+bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                        MMUAccessType access_type, int mmu_idx,
+                        bool probe, uintptr_t retaddr);
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1bcf4eaeb8..b7675707e0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -355,14 +355,13 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 #endif
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
-#ifdef CONFIG_USER_ONLY
-    cc->handle_mmu_fault = riscv_cpu_handle_mmu_fault;
-#else
+#ifndef CONFIG_USER_ONLY
     cc->do_unaligned_access = riscv_cpu_do_unaligned_access;
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
 #endif
 #ifdef CONFIG_TCG
     cc->tcg_initialize = riscv_translate_init;
+    cc->tlb_fill = riscv_cpu_tlb_fill;
 #endif
     /* For now, mark unmigratable: */
     cc->vmsd = &vmstate_riscv_cpu;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b17f169681..2535435260 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -379,53 +379,49 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     riscv_raise_exception(env, cs->exception_index, retaddr);
 }
 
-/* called by qemu's softmmu to fill the qemu tlb */
 void tlb_fill(CPUState *cs, target_ulong addr, int size,
         MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
 {
-    int ret;
-    ret = riscv_cpu_handle_mmu_fault(cs, addr, size, access_type, mmu_idx);
-    if (ret == TRANSLATE_FAIL) {
-        RISCVCPU *cpu = RISCV_CPU(cs);
-        CPURISCVState *env = &cpu->env;
-        riscv_raise_exception(env, cs->exception_index, retaddr);
-    }
+    riscv_cpu_tlb_fill(cs, addr, size, access_type, mmu_idx, false, retaddr);
 }
-
 #endif
 
-int riscv_cpu_handle_mmu_fault(CPUState *cs, vaddr address, int size,
-        int rw, int mmu_idx)
+bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                        MMUAccessType access_type, int mmu_idx,
+                        bool probe, uintptr_t retaddr)
 {
+#ifndef CONFIG_USER_ONLY
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-#if !defined(CONFIG_USER_ONLY)
     hwaddr pa = 0;
     int prot;
-#endif
     int ret = TRANSLATE_FAIL;
 
-    qemu_log_mask(CPU_LOG_MMU,
-            "%s pc " TARGET_FMT_lx " ad %" VADDR_PRIx " rw %d mmu_idx \
-             %d\n", __func__, env->pc, address, rw, mmu_idx);
+    qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
+                  __func__, address, access_type, mmu_idx);
+
+    ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx);
 
-#if !defined(CONFIG_USER_ONLY)
-    ret = get_physical_address(env, &pa, &prot, address, rw, mmu_idx);
     qemu_log_mask(CPU_LOG_MMU,
-            "%s address=%" VADDR_PRIx " ret %d physical " TARGET_FMT_plx
-             " prot %d\n", __func__, address, ret, pa, prot);
+                  "%s address=%" VADDR_PRIx " ret %d physical " TARGET_FMT_plx
+                  " prot %d\n", __func__, address, ret, pa, prot);
+
     if (riscv_feature(env, RISCV_FEATURE_PMP) &&
-        !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << rw)) {
+        !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type)) {
         ret = TRANSLATE_FAIL;
     }
     if (ret == TRANSLATE_SUCCESS) {
         tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
                      prot, mmu_idx, TARGET_PAGE_SIZE);
-    } else if (ret == TRANSLATE_FAIL) {
-        raise_mmu_exception(env, address, rw);
+        return true;
+    } else if (probe) {
+        return false;
+    } else {
+        raise_mmu_exception(env, address, access_type);
+        riscv_raise_exception(env, cs->exception_index, retaddr);
     }
 #else
-    switch (rw) {
+    switch (access_type) {
     case MMU_INST_FETCH:
         cs->exception_index = RISCV_EXCP_INST_PAGE_FAULT;
         break;
@@ -436,8 +432,8 @@ int riscv_cpu_handle_mmu_fault(CPUState *cs, vaddr address, int size,
         cs->exception_index = RISCV_EXCP_STORE_PAGE_FAULT;
         break;
     }
+    cpu_loop_exit_restore(cs, retaddr);
 #endif
-    return ret;
 }
 
 /*
-- 
2.17.1


