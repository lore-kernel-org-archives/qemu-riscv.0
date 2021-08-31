Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2j4-0007vv-7U
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2j0-0007pT-Qr
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:18:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2iw-0006e3-7V
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:18:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DlnfQx6rLK4ZENJCeIGcgssSnyAh0WjzHulYEeHbTzE=;
 b=AohpvXWwkQt4unGxEIKh52P6qTOXYDWsOecYttMvksDbOiqQw5mx1+4xAKRON8H7STVdDs
 8aICRLsE/WT8AxrRwHyfzCZUJfMo0ZNRq2rlBmgqLeBD96OJXiNWGaCsnKlcyh8sSNg/xr
 G7emu8hWBO3/HOo3eV11wkO0eZegob4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-ZrhI2ExNPsaoKib384-OFg-1; Tue, 31 Aug 2021 08:18:40 -0400
X-MC-Unique: ZrhI2ExNPsaoKib384-OFg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62A2293920;
 Tue, 31 Aug 2021 12:18:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64FFD60843;
 Tue, 31 Aug 2021 12:18:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A380818009DE; Tue, 31 Aug 2021 14:15:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 20/29] tcg_funcs: Add cpu_restore_state to TCGModuleOps
Date: Tue, 31 Aug 2021 14:15:36 +0200
Message-Id: <20210831121545.2874233-21-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Aug 2021 12:18:48 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/exec/exec-all.h             | 2 +-
 include/tcg/tcg-module.h            | 1 +
 accel/tcg/cpu-exec-common.c         | 2 +-
 accel/tcg/tcg-module.c              | 6 ++++++
 accel/tcg/translate-all.c           | 3 ++-
 softmmu/physmem.c                   | 2 +-
 target/alpha/helper.c               | 2 +-
 target/alpha/mem_helper.c           | 2 +-
 target/arm/op_helper.c              | 2 +-
 target/arm/tlb_helper.c             | 8 ++++----
 target/cris/helper.c                | 2 +-
 target/i386/helper.c                | 2 +-
 target/i386/tcg/sysemu/svm_helper.c | 2 +-
 target/m68k/op_helper.c             | 6 +++---
 target/microblaze/helper.c          | 2 +-
 target/openrisc/sys_helper.c        | 8 ++++----
 target/ppc/excp_helper.c            | 2 +-
 target/s390x/tcg/excp_helper.c      | 2 +-
 target/tricore/op_helper.c          | 2 +-
 target/xtensa/helper.c              | 6 +++---
 20 files changed, 36 insertions(+), 28 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index c27e911b65f9..546db9416f43 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -60,7 +60,7 @@ void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
  * code. If the searched_pc is not in translated code no state is
  * restored and the function returns false.
  */
-bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
+// FIXME: docs
 
 void QEMU_NORETURN cpu_loop_exit_noexc(CPUState *cpu);
 void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index 645e8eb39e71..01205ad8fd34 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -16,6 +16,7 @@ struct TCGModuleOps {
     void (*tb_flush)(CPUState *cpu);
     void (*tb_invalidate_phys_range)(tb_page_addr_t start, tb_page_addr_t end);
     void (*tb_check_watchpoint)(CPUState *cpu, uintptr_t retaddr);
+    bool (*cpu_restore_state)(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index 777ad00befc8..e3c34a51ff6a 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -71,7 +71,7 @@ void cpu_loop_exit(CPUState *cpu)
 void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
 {
     if (pc) {
-        cpu_restore_state(cpu, pc, true);
+        tcg.cpu_restore_state(cpu, pc, true);
     }
     cpu_loop_exit(cpu);
 }
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index ea0c2a160a97..61ad3a648767 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -33,6 +33,11 @@ static void tb_check_watchpoint_stub(CPUState *cpu, uintptr_t retaddr)
 {
 }
 
+static bool cpu_restore_state_stub(CPUState *cpu, uintptr_t searched_pc, bool will_exit)
+{
+    return false;
+}
+
 struct TCGModuleOps tcg = {
     .tlb_flush = update_cpu_stub,
     .tlb_flush_page = tlb_flush_page_stub,
@@ -45,4 +50,5 @@ struct TCGModuleOps tcg = {
     .tb_flush = update_cpu_stub,
     .tb_invalidate_phys_range = tb_invalidate_phys_range_stub,
     .tb_check_watchpoint = tb_check_watchpoint_stub,
+    .cpu_restore_state = cpu_restore_state_stub,
 };
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 57129bbeb791..836ac0565e01 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -378,7 +378,7 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
     return 0;
 }
 
-bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
+static bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
 {
     /*
      * The host_pc has to be in the rx region of the code buffer.
@@ -2440,6 +2440,7 @@ static void tcg_module_ops_tb(void)
     tcg.tb_flush = tb_flush;
     tcg.tb_invalidate_phys_range = tb_invalidate_phys_range;
     tcg.tb_check_watchpoint = tb_check_watchpoint;
+    tcg.cpu_restore_state = cpu_restore_state;
 }
 
 type_init(tcg_module_ops_tb);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 634500fd3b7b..76b6e16d9466 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -947,7 +947,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                     cpu->cflags_next_tb = 1 | curr_cflags(cpu);
                     mmap_unlock();
                     if (ra) {
-                        cpu_restore_state(cpu, ra, true);
+                        tcg.cpu_restore_state(cpu, ra, true);
                     }
                     cpu_loop_exit_noexc(cpu);
                 }
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 4f56fe4d2317..5694c3428296 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -504,7 +504,7 @@ void QEMU_NORETURN dynamic_excp(CPUAlphaState *env, uintptr_t retaddr,
     cs->exception_index = excp;
     env->error_code = error;
     if (retaddr) {
-        cpu_restore_state(cs, retaddr, true);
+        tcg.cpu_restore_state(cs, retaddr, true);
         /* Floating-point exceptions (our only users) point to the next PC.  */
         env->pc += 4;
     }
diff --git a/target/alpha/mem_helper.c b/target/alpha/mem_helper.c
index 75e72bc3370f..b4d208cff8f9 100644
--- a/target/alpha/mem_helper.c
+++ b/target/alpha/mem_helper.c
@@ -34,7 +34,7 @@ void alpha_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     uint64_t pc;
     uint32_t insn;
 
-    cpu_restore_state(cs, retaddr, true);
+    tcg.cpu_restore_state(cs, retaddr, true);
 
     pc = env->pc;
     insn = cpu_ldl_code(env, pc);
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 70b42b55fd0c..d309f32a755e 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -62,7 +62,7 @@ void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
      * we must restore CPU state here before setting the syndrome
      * the caller passed us, and cannot use cpu_loop_exit_restore().
      */
-    cpu_restore_state(cs, ra, true);
+    tcg.cpu_restore_state(cs, ra, true);
     raise_exception(env, excp, syndrome, target_el);
 }
 
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 3107f9823eff..22c9c8c01d2f 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -117,7 +117,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     ARMMMUFaultInfo fi = {};
 
     /* now we have a real cpu fault */
-    cpu_restore_state(cs, retaddr, true);
+    tcg.cpu_restore_state(cs, retaddr, true);
 
     fi.type = ARMFault_Alignment;
     arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
@@ -140,7 +140,7 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     ARMMMUFaultInfo fi = {};
 
     /* now we have a real cpu fault */
-    cpu_restore_state(cs, retaddr, true);
+    tcg.cpu_restore_state(cs, retaddr, true);
 
     fi.ea = arm_extabort_type(response);
     fi.type = ARMFault_SyncExternal;
@@ -166,7 +166,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     fi.level = 3;
 
     /* now we have a real cpu fault */
-    cpu_restore_state(cs, retaddr, true);
+    tcg.cpu_restore_state(cs, retaddr, true);
     arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
 #else
     hwaddr phys_addr;
@@ -207,7 +207,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         return false;
     } else {
         /* now we have a real cpu fault */
-        cpu_restore_state(cs, retaddr, true);
+        tcg.cpu_restore_state(cs, retaddr, true);
         arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
     }
 #endif
diff --git a/target/cris/helper.c b/target/cris/helper.c
index 911867f3b482..0b8bfd0efa8f 100644
--- a/target/cris/helper.c
+++ b/target/cris/helper.c
@@ -116,7 +116,7 @@ bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     cs->exception_index = EXCP_BUSFAULT;
     env->fault_vector = res.bf_vec;
     if (retaddr) {
-        if (cpu_restore_state(cs, retaddr, true)) {
+        if (tcg.cpu_restore_state(cs, retaddr, true)) {
             /* Evaluate flags after retranslation. */
             helper_top_evaluate_flags(env);
         }
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 100add713c5d..a059044b84c9 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -500,7 +500,7 @@ void cpu_report_tpr_access(CPUX86State *env, TPRAccess access)
 
         cpu_interrupt(cs, CPU_INTERRUPT_TPR);
     } else if (tcg_enabled()) {
-        cpu_restore_state(cs, cs->mem_io_pc, false);
+        tcg.cpu_restore_state(cs, cs->mem_io_pc, false);
 
         apic_handle_tpr_access_report(cpu->apic_state, env->eip, access);
     }
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 0d549b3d6c3b..74241443aba5 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -630,7 +630,7 @@ void cpu_vmexit(CPUX86State *env, uint32_t exit_code, uint64_t exit_info_1,
 {
     CPUState *cs = env_cpu(env);
 
-    cpu_restore_state(cs, retaddr, true);
+    tcg.cpu_restore_state(cs, retaddr, true);
 
     qemu_log_mask(CPU_LOG_TB_IN_ASM, "vmexit(%08x, %016" PRIx64 ", %016"
                   PRIx64 ", " TARGET_FMT_lx ")!\n",
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index d006d1cb3eaa..54932083dfcb 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -468,7 +468,7 @@ void m68k_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
     M68kCPU *cpu = M68K_CPU(cs);
     CPUM68KState *env = &cpu->env;
 
-    cpu_restore_state(cs, retaddr, true);
+    tcg.cpu_restore_state(cs, retaddr, true);
 
     if (m68k_feature(env, M68K_FEATURE_M68040)) {
         env->mmu.mmusr = 0;
@@ -1076,7 +1076,7 @@ void HELPER(chk)(CPUM68KState *env, int32_t val, int32_t ub)
         CPUState *cs = env_cpu(env);
 
         /* Recover PC and CC_OP for the beginning of the insn.  */
-        cpu_restore_state(cs, GETPC(), true);
+        tcg.cpu_restore_state(cs, GETPC(), true);
 
         /* flags have been modified by gen_flush_flags() */
         env->cc_op = CC_OP_FLAGS;
@@ -1108,7 +1108,7 @@ void HELPER(chk2)(CPUM68KState *env, int32_t val, int32_t lb, int32_t ub)
         CPUState *cs = env_cpu(env);
 
         /* Recover PC and CC_OP for the beginning of the insn.  */
-        cpu_restore_state(cs, GETPC(), true);
+        tcg.cpu_restore_state(cs, GETPC(), true);
 
         /* flags have been modified by gen_flush_flags() */
         env->cc_op = CC_OP_FLAGS;
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index 20dbd673136e..b0652b20c2ec 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -297,7 +297,7 @@ void mb_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     uint32_t esr, iflags;
 
     /* Recover the pc and iflags from the corresponding insn_start.  */
-    cpu_restore_state(cs, retaddr, true);
+    tcg.cpu_restore_state(cs, retaddr, true);
     iflags = cpu->env.iflags;
 
     qemu_log_mask(CPU_LOG_INT,
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index 48674231e743..0208485b8567 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -45,7 +45,7 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
         break;
 
     case TO_SPR(0, 16): /* NPC */
-        cpu_restore_state(cs, GETPC(), true);
+        tcg.cpu_restore_state(cs, GETPC(), true);
         /* ??? Mirror or1ksim in not trashing delayed branch state
            when "jumping" to the current instruction.  */
         if (env->pc != rb) {
@@ -131,7 +131,7 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
     case TO_SPR(8, 0):  /* PMR */
         env->pmr = rb;
         if (env->pmr & PMR_DME || env->pmr & PMR_SME) {
-            cpu_restore_state(cs, GETPC(), true);
+            tcg.cpu_restore_state(cs, GETPC(), true);
             env->pc += 4;
             cs->halted = 1;
             raise_exception(cpu, EXCP_HALTED);
@@ -222,14 +222,14 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
         return env->evbar;
 
     case TO_SPR(0, 16): /* NPC (equals PC) */
-        cpu_restore_state(cs, GETPC(), false);
+        tcg.cpu_restore_state(cs, GETPC(), false);
         return env->pc;
 
     case TO_SPR(0, 17): /* SR */
         return cpu_get_sr(env);
 
     case TO_SPR(0, 18): /* PPC */
-        cpu_restore_state(cs, GETPC(), false);
+        tcg.cpu_restore_state(cs, GETPC(), false);
         return env->ppc;
 
     case TO_SPR(0, 32): /* EPCR */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 7b6ac16eef72..2db29b4d88a0 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1498,7 +1498,7 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     uint32_t insn;
 
     /* Restore state and reload the insn we executed, for filling in DSISR.  */
-    cpu_restore_state(cs, retaddr, true);
+    tcg.cpu_restore_state(cs, retaddr, true);
     insn = cpu_ldl_code(env, env->nip);
 
     cs->exception_index = POWERPC_EXCP_ALIGN;
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index a61917d04fab..08716f7ee6d3 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -38,7 +38,7 @@ void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
 {
     CPUState *cs = env_cpu(env);
 
-    cpu_restore_state(cs, ra, true);
+    tcg.cpu_restore_state(cs, ra, true);
     qemu_log_mask(CPU_LOG_INT, "program interrupt at %#" PRIx64 "\n",
                   env->psw.addr);
     trigger_pgm_exception(env, code);
diff --git a/target/tricore/op_helper.c b/target/tricore/op_helper.c
index 32c2bc169981..a7e57abd9f7c 100644
--- a/target/tricore/op_helper.c
+++ b/target/tricore/op_helper.c
@@ -31,7 +31,7 @@ raise_exception_sync_internal(CPUTriCoreState *env, uint32_t class, int tin,
 {
     CPUState *cs = env_cpu(env);
     /* in case we come from a helper-call we need to restore the PC */
-    cpu_restore_state(cs, pc, true);
+    tcg.cpu_restore_state(cs, pc, true);
 
     /* Tin is loaded into d[15] */
     env->gpr_d[15] = tin;
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index f18ab383fd89..347054520b87 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -272,7 +272,7 @@ void xtensa_cpu_do_unaligned_access(CPUState *cs,
 
     assert(xtensa_option_enabled(env->config,
                                  XTENSA_OPTION_UNALIGNED_EXCEPTION));
-    cpu_restore_state(CPU(cpu), retaddr, true);
+    tcg.cpu_restore_state(CPU(cpu), retaddr, true);
     HELPER(exception_cause_vaddr)(env,
                                   env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
                                   addr);
@@ -303,7 +303,7 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else if (probe) {
         return false;
     } else {
-        cpu_restore_state(cs, retaddr, true);
+        tcg.cpu_restore_state(cs, retaddr, true);
         HELPER(exception_cause_vaddr)(env, env->pc, ret, address);
     }
 }
@@ -316,7 +316,7 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
     XtensaCPU *cpu = XTENSA_CPU(cs);
     CPUXtensaState *env = &cpu->env;
 
-    cpu_restore_state(cs, retaddr, true);
+    tcg.cpu_restore_state(cs, retaddr, true);
     HELPER(exception_cause_vaddr)(env, env->pc,
                                   access_type == MMU_INST_FETCH ?
                                   INSTR_PIF_ADDR_ERROR_CAUSE :
-- 
2.31.1


