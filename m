Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2iK-0006E8-38
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2iE-0006AG-Rg
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:17:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2iC-0006Av-4Z
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEVn3MubDcXSDC4bhzn6yl2MS+ELh+ql7Nha2IQz6ks=;
 b=ihkoXakAEh4CvWA6jyEwfopj5sxT5TXAPwZ0xplGUtMPXJouRdeHuz3eqdN4V3dzyAlt+4
 6ZJTGQ9lY15xNiR39nQNQWRbcxVN9NzBbAoW/gWBM68F4QqGAsOd2opDLdd/gN+WOOdPme
 IlWOAB23uE/WEQbl/mpkkLSLVatPT6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-eUvZnfpuNuWlnb5UWdblpQ-1; Tue, 31 Aug 2021 08:17:54 -0400
X-MC-Unique: eUvZnfpuNuWlnb5UWdblpQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 673F3106F6EC;
 Tue, 31 Aug 2021 12:17:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B33B5D6D5;
 Tue, 31 Aug 2021 12:17:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2AB2B18009D5; Tue, 31 Aug 2021 14:15:46 +0200 (CEST)
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
Subject: [PATCH 15/29] tcg_funcs: Add tb_flush to TCGModuleOps
Date: Tue, 31 Aug 2021 14:15:31 +0200
Message-Id: <20210831121545.2874233-16-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 31 Aug 2021 12:17:59 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/exec/exec-all.h   | 1 -
 include/tcg/tcg-module.h  | 1 +
 accel/stubs/tcg-stub.c    | 4 ----
 accel/tcg/tcg-module.c    | 1 +
 accel/tcg/translate-all.c | 9 ++++++++-
 cpu.c                     | 2 +-
 gdbstub.c                 | 4 ++--
 hw/ppc/spapr_hcall.c      | 2 +-
 linux-user/mmap.c         | 2 +-
 linux-user/syscall.c      | 4 ++--
 plugins/core.c            | 2 +-
 plugins/loader.c          | 2 +-
 target/alpha/sys_helper.c | 2 +-
 target/riscv/csr.c        | 2 +-
 14 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 27fc489c57b5..7dc6f498a7e4 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -572,7 +572,6 @@ void tb_invalidate_phys_range(target_ulong start, target_ulong end);
 #else
 void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
 #endif
-void tb_flush(CPUState *cpu);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
 TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
                                    target_ulong cs_base, uint32_t flags,
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index 5dd4deb9ed57..003581b0718c 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -13,6 +13,7 @@ struct TCGModuleOps {
 #endif
     void (*tcg_exec_unrealizefn)(CPUState *cpu);
     void (*tcg_exec_realizefn)(CPUState *cpu, Error **errp);
+    void (*tb_flush)(CPUState *cpu);
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index d8162673ae8d..e7651d035f28 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -13,10 +13,6 @@
 #include "qemu/osdep.h"
 #include "exec/exec-all.h"
 
-void tb_flush(CPUState *cpu)
-{
-}
-
 void tlb_set_dirty(CPUState *cpu, target_ulong vaddr)
 {
 }
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index 36c1df564f31..7600951fd20b 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -34,4 +34,5 @@ struct TCGModuleOps tcg = {
 #endif
     .tcg_exec_realizefn = tcg_exec_realizefn_stub,
     .tcg_exec_unrealizefn = update_cpu_stub,
+    .tb_flush = update_cpu_stub,
 };
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index c7547cd923b4..1d258e89fc81 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1003,7 +1003,7 @@ done:
     }
 }
 
-void tb_flush(CPUState *cpu)
+static void tb_flush(CPUState *cpu)
 {
     if (tcg_enabled()) {
         unsigned tb_flush_count = qatomic_mb_read(&tb_ctx.tb_flush_count);
@@ -2463,3 +2463,10 @@ int page_unprotect(target_ulong address, uintptr_t pc)
     return 0;
 }
 #endif /* CONFIG_USER_ONLY */
+
+static void tcg_module_ops_tb(void)
+{
+    tcg.tb_flush = tb_flush;
+}
+
+type_init(tcg_module_ops_tb);
diff --git a/cpu.c b/cpu.c
index d1c9f68a26e7..ce96b3591a9c 100644
--- a/cpu.c
+++ b/cpu.c
@@ -58,7 +58,7 @@ static int cpu_common_post_load(void *opaque, int version_id)
      * memory we've translated code from. So we must flush all TBs,
      * which will now be stale.
      */
-    tb_flush(cpu);
+    tcg.tb_flush(cpu);
 
     return 0;
 }
diff --git a/gdbstub.c b/gdbstub.c
index 5d8e6ae3cd9b..c2c6901b77b6 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2796,7 +2796,7 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
         } else {
             trace_gdbstub_hit_break();
         }
-        tb_flush(cpu);
+        tcg.tb_flush(cpu);
         ret = GDB_SIGNAL_TRAP;
         break;
     case RUN_STATE_PAUSED:
@@ -3135,7 +3135,7 @@ gdb_handlesig(CPUState *cpu, int sig)
 
     /* disable single step if it was enabled */
     cpu_single_step(cpu, 0);
-    tb_flush(cpu);
+    tcg.tb_flush(cpu);
 
     if (sig != 0) {
         snprintf(buf, sizeof(buf), "S%02x", target_signal_to_gdb(sig));
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 0e9a5b2e4053..732e79cca0ad 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -292,7 +292,7 @@ static target_ulong h_page_init(PowerPCCPU *cpu, SpaprMachineState *spapr,
         if (kvm_enabled()) {
             kvmppc_icbi_range(cpu, pdst, len);
         } else {
-            tb_flush(CPU(cpu));
+            tcg.tb_flush(CPU(cpu));
         }
     }
 
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 0e103859fed8..85cb03e176c1 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -461,7 +461,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
         CPUState *cpu = thread_cpu;
         if (!(cpu->tcg_cflags & CF_PARALLEL)) {
             cpu->tcg_cflags |= CF_PARALLEL;
-            tb_flush(cpu);
+            tcg.tb_flush(cpu);
         }
     }
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ccd3892b2df7..6ab3009bc98b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4513,7 +4513,7 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
      */
     if (!(cpu->tcg_cflags & CF_PARALLEL)) {
         cpu->tcg_cflags |= CF_PARALLEL;
-        tb_flush(cpu);
+        tcg.tb_flush(cpu);
     }
 
     if (shmaddr)
@@ -6376,7 +6376,7 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
          */
         if (!(cpu->tcg_cflags & CF_PARALLEL)) {
             cpu->tcg_cflags |= CF_PARALLEL;
-            tb_flush(cpu);
+            tcg.tb_flush(cpu);
         }
 
         /* we create a new CPU instance. */
diff --git a/plugins/core.c b/plugins/core.c
index 6b2490f97328..ee3ad26b354c 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -514,7 +514,7 @@ void qemu_plugin_user_exit(void)
         }
     }
 
-    tb_flush(current_cpu);
+    tcg.tb_flush(current_cpu);
 
     CPU_FOREACH(cpu) {
         qemu_plugin_disable_mem_helpers(cpu);
diff --git a/plugins/loader.c b/plugins/loader.c
index 71b03721dffc..21e94a7509dc 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -364,7 +364,7 @@ static void plugin_flush_destroy(CPUState *cpu, run_on_cpu_data arg)
     struct qemu_plugin_reset_data *data = arg.host_ptr;
 
     g_assert(cpu_in_exclusive_context(cpu));
-    tb_flush(cpu);
+    tcg.tb_flush(cpu);
     plugin_reset_destroy(data);
 }
 
diff --git a/target/alpha/sys_helper.c b/target/alpha/sys_helper.c
index 25f6cb88940d..bad37d35e342 100644
--- a/target/alpha/sys_helper.c
+++ b/target/alpha/sys_helper.c
@@ -55,7 +55,7 @@ void helper_tbis(CPUAlphaState *env, uint64_t p)
 
 void helper_tb_flush(CPUAlphaState *env)
 {
-    tb_flush(env_cpu(env));
+    tcg.tb_flush(env_cpu(env));
 }
 
 void helper_halt(uint64_t restart)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9a4ed18ac597..46603475e57b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -610,7 +610,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
 
     /* flush translation cache */
     if (val != env->misa) {
-        tb_flush(env_cpu(env));
+        tcg.tb_flush(env_cpu(env));
     }
 
     env->misa = val;
-- 
2.31.1


