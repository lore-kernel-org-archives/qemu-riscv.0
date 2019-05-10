Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hP7Jm-0007lz-Ht
	for mharc-qemu-riscv@gnu.org; Fri, 10 May 2019 11:20:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hP7Ji-0007fz-F6
	for qemu-riscv@nongnu.org; Fri, 10 May 2019 11:20:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hP7Jh-000078-2m
	for qemu-riscv@nongnu.org; Fri, 10 May 2019 11:20:10 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:35821)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hP7Jg-000068-Qz
	for qemu-riscv@nongnu.org; Fri, 10 May 2019 11:20:08 -0400
Received: by mail-pf1-x442.google.com with SMTP id t87so3416433pfa.2
	for <qemu-riscv@nongnu.org>; Fri, 10 May 2019 08:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jFiOLbzDz1sji7rdhiIl1UIG07vaIVhoy6dgsMAsHtw=;
	b=xQ8t++6s8P84yjah1oodF4aP0tHt5TjP7r8j93p4dJPG7lprWwoEYapKJl0F3qFqpP
	3QzK6CgZuYbhlNVv5SBTc1t6YJPbLHi+U3vniKmvLnIpeAZDwO18DqZI/vNW2ctlqfPs
	tbIqHtj9MUSkfK2KcnVGajsMx/SNhEl3QtL0lAfzOJiTV6pY+Jx944Flm82eSWQy1inO
	Z6MeKesS5KC1sr0+tIk6VX/V7f/JGTK2QFBuonjkpl5iD0SA37iqqahMSYTnATCVNdul
	63OBQAaiQ5kYsGJdacgG/xKIy6wmbk5QZoeTt4FFNU5+CTY/Dyj84AjIys3D1fWqD74+
	V1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jFiOLbzDz1sji7rdhiIl1UIG07vaIVhoy6dgsMAsHtw=;
	b=m0F847UWGhXMp/vZinzQEXOoIQMi4nXkqV8qh3ZCnCBrRy8kHSSasMJsIOttlGntD+
	Q2PO3bLsCAx/tDKmwx78j2+kWIBCLhcSxSgBze+n6xrMLwty0GAoQEBSoHbhBrEsVKp+
	4lXOkCEWadNY0r7mgGl6e6LyoGBWrTzKIom3HI9ITfbl0J7Wya4r/M0TksyCrok7xnk+
	fJkJYAjil0mbWID9cgw9Y243F4Et26r/mXP6Ni0N3nurpeIsI3ioepgvW5DY0G8jjuaG
	Y+BpnmP6e4zICa/Iok7lMxLj7YTh4q3OapwO3o4IIfFkEEDbjdwywvxv4M9w8YxBFh8l
	YylQ==
X-Gm-Message-State: APjAAAXz+jexV3z5EujHAYFMY1jQ7giqYyNuTKk1dlNx8al3tPnhvcOd
	TD43tCBVv2cQGSxZCDO/hkYdkADlOWg=
X-Google-Smtp-Source: APXvYqwNtMn1Y1OzJ2nJNw4MNC2dIGvmgQNrZ7eHKVtuIfhczJaJG5t3ide5XsIiLAnCj/uPaUNkrQ==
X-Received: by 2002:a62:570a:: with SMTP id l10mr14798979pfb.151.1557501607961;
	Fri, 10 May 2019 08:20:07 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231])
	by smtp.gmail.com with ESMTPSA id 19sm5920517pgz.24.2019.05.10.08.20.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 08:20:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-riscv@nongnu.org,
	Palmer Dabbelt <palmer@sifive.com>
Date: Fri, 10 May 2019 08:19:34 -0700
Message-Id: <20190510151944.22981-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510151944.22981-1-richard.henderson@linaro.org>
References: <20190510151944.22981-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-riscv] [PULL 17/27] target/riscv: Convert to
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
X-List-Received-Date: Fri, 10 May 2019 15:20:12 -0000

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
index 1bcf4eaeb8..34a54ef2ed 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -355,9 +355,8 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 #endif
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
-#ifdef CONFIG_USER_ONLY
-    cc->handle_mmu_fault = riscv_cpu_handle_mmu_fault;
-#else
+    cc->tlb_fill = riscv_cpu_tlb_fill;
+#ifndef CONFIG_USER_ONLY
     cc->do_unaligned_access = riscv_cpu_do_unaligned_access;
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
 #endif
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


