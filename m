Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhAOE-0000OW-Kc
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 09:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAO9-0000HA-Fo
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 09:28:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhANy-0004ji-Ln
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 09:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r07bWtDVrKz4vwtsS9D/h/5tA6TdMK+iT15WBiMP6WA=;
 b=NJMPReiwnMTDydzWLsMsLAzhMIaJy9emlNajRUMs/ZZqg7JeF7648HRHwFJWgNTAXpoL7Q
 E135cHj9Nw1qBFQ0Xt9D833xXBvLi7N1GMoVnY4Nv8KGTaBInqPCcj2b+UtVp84d4oAXbX
 R/uJa0N3D9RVMsMsvVojwR0G+wu2l0M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-75gyFR7GOhWZxeobemIPVg-1; Wed, 20 Apr 2022 09:28:42 -0400
X-MC-Unique: 75gyFR7GOhWZxeobemIPVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0D91805F67;
 Wed, 20 Apr 2022 13:28:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D51FF2024CC2;
 Wed, 20 Apr 2022 13:28:09 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-block@nongnu.org (open list:Block layer core),
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH 19/41] compiler.h: replace QEMU_NORETURN with G_NORETURN
Date: Wed, 20 Apr 2022 17:26:02 +0400
Message-Id: <20220420132624.2439741-20-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 20 Apr 2022 13:28:58 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

G_NORETURN was introduced in glib 2.68, fallback to G_GNUC_NORETURN in
glib-compat.

Note that this attribute must be placed before the function declaration
(bringing a bit of consistency in qemu codebase usage).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 accel/tcg/internal.h                 |  3 +--
 include/exec/exec-all.h              | 20 +++++++++---------
 include/exec/helper-head.h           |  2 +-
 include/glib-compat.h                |  4 ++++
 include/hw/core/cpu.h                |  2 +-
 include/hw/core/tcg-cpu-ops.h        |  6 +++---
 include/hw/hw.h                      |  2 +-
 include/qemu/compiler.h              |  2 --
 include/qemu/osdep.h                 |  3 ++-
 include/qemu/thread.h                |  2 +-
 include/tcg/tcg-ldst.h               |  4 ++--
 include/tcg/tcg.h                    |  2 +-
 linux-user/user-internals.h          |  2 +-
 scripts/cocci-macro-file.h           |  2 +-
 target/alpha/cpu.h                   | 10 ++++-----
 target/arm/internals.h               | 12 +++++------
 target/hppa/cpu.h                    |  2 +-
 target/i386/tcg/helper-tcg.h         | 24 ++++++++++-----------
 target/microblaze/cpu.h              |  6 +++---
 target/mips/tcg/tcg-internal.h       | 17 ++++++++-------
 target/nios2/cpu.h                   |  6 +++---
 target/openrisc/exception.h          |  2 +-
 target/ppc/cpu.h                     | 14 ++++++-------
 target/ppc/internal.h                |  6 +++---
 target/riscv/cpu.h                   | 10 ++++-----
 target/s390x/s390x-internal.h        |  6 +++---
 target/s390x/tcg/tcg_s390x.h         | 12 +++++------
 target/sh4/cpu.h                     |  6 +++---
 target/sparc/cpu.h                   | 10 ++++-----
 target/xtensa/cpu.h                  |  6 +++---
 accel/stubs/tcg-stub.c               |  4 ++--
 bsd-user/signal.c                    |  3 ++-
 hw/misc/mips_itu.c                   |  3 ++-
 linux-user/signal.c                  |  3 ++-
 monitor/hmp.c                        |  4 ++--
 qemu-img.c                           | 12 +++++++----
 target/alpha/helper.c                | 10 ++++-----
 target/arm/pauth_helper.c            |  4 ++--
 target/arm/tlb_helper.c              |  7 ++++---
 target/hexagon/op_helper.c           |  9 ++++----
 target/hppa/cpu.c                    |  8 +++----
 target/hppa/op_helper.c              |  4 ++--
 target/i386/tcg/bpt_helper.c         |  2 +-
 target/i386/tcg/excp_helper.c        | 31 ++++++++++++++--------------
 target/i386/tcg/misc_helper.c        |  6 +++---
 target/i386/tcg/sysemu/misc_helper.c |  7 ++++---
 target/openrisc/exception.c          |  2 +-
 target/openrisc/exception_helper.c   |  3 ++-
 target/riscv/op_helper.c             |  4 ++--
 target/rx/op_helper.c                | 22 +++++++++++---------
 target/s390x/tcg/excp_helper.c       | 22 +++++++++++---------
 target/sh4/op_helper.c               |  5 +++--
 target/sparc/mmu_helper.c            |  8 +++----
 target/tricore/op_helper.c           |  6 +++---
 tcg/tcg.c                            |  3 ++-
 tests/fp/fp-bench.c                  |  3 ++-
 tests/fp/fp-test.c                   |  3 ++-
 scripts/checkpatch.pl                |  2 +-
 58 files changed, 214 insertions(+), 191 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 881bc1ede0b1..3092bfa96430 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -14,8 +14,7 @@
 TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,
                               target_ulong cs_base, uint32_t flags,
                               int cflags);
-
-void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
+G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 void page_init(void);
 void tb_htable_init(void);
 
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d2cb0981f405..311e5fb422a3 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -58,10 +58,10 @@ void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
  */
 bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
 
-void QEMU_NORETURN cpu_loop_exit_noexc(CPUState *cpu);
-void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
-void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
-void QEMU_NORETURN cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);
+G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);
+G_NORETURN void cpu_loop_exit(CPUState *cpu);
+G_NORETURN void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
+G_NORETURN void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);
 
 /**
  * cpu_loop_exit_requested:
@@ -669,9 +669,9 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
  * Use the TCGCPUOps hook to record cpu state, do guest operating system
  * specific things to raise SIGSEGV, and jump to the main cpu loop.
  */
-void QEMU_NORETURN cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
-                                         MMUAccessType access_type,
-                                         bool maperr, uintptr_t ra);
+G_NORETURN void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
+                                      MMUAccessType access_type,
+                                      bool maperr, uintptr_t ra);
 
 /**
  * cpu_loop_exit_sigbus:
@@ -683,9 +683,9 @@ void QEMU_NORETURN cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
  * Use the TCGCPUOps hook to record cpu state, do guest operating system
  * specific things to raise SIGBUS, and jump to the main cpu loop.
  */
-void QEMU_NORETURN cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
-                                        MMUAccessType access_type,
-                                        uintptr_t ra);
+G_NORETURN void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
+                                     MMUAccessType access_type,
+                                     uintptr_t ra);
 
 #else
 static inline void mmap_lock(void) {}
diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index 734af067fee6..e242fed46e0c 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -46,7 +46,7 @@
 #define dh_ctype_ptr void *
 #define dh_ctype_cptr const void *
 #define dh_ctype_void void
-#define dh_ctype_noreturn void QEMU_NORETURN
+#define dh_ctype_noreturn G_NORETURN void
 #define dh_ctype(t) dh_ctype_##t
 
 #ifdef NEED_CPU_H
diff --git a/include/glib-compat.h b/include/glib-compat.h
index 3113a7d2af84..43a562974d80 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -147,4 +147,8 @@ qemu_g_test_slow(void)
 
 #pragma GCC diagnostic pop
 
+#ifndef G_NORETURN
+#define G_NORETURN G_GNUC_NORETURN
+#endif
+
 #endif
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 466bed604727..996f94059f7c 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1015,7 +1015,7 @@ int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
  */
 AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx);
 
-void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
+G_NORETURN void cpu_abort(CPUState *cpu, const char *fmt, ...)
     G_GNUC_PRINTF(2, 3);
 
 /* $(top_srcdir)/cpu.c */
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index e13898553aff..fbe6b76764cf 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -78,9 +78,9 @@ struct TCGCPUOps {
      * @do_unaligned_access: Callback for unaligned access handling
      * The callback must exit via raising an exception.
      */
-    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
-                                MMUAccessType access_type,
-                                int mmu_idx, uintptr_t retaddr) QEMU_NORETURN;
+    G_NORETURN void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
+                                           MMUAccessType access_type,
+                                           int mmu_idx, uintptr_t retaddr);
 
     /**
      * @adjust_watchpoint_address: hack for cpu_check_watchpoint used by ARM
diff --git a/include/hw/hw.h b/include/hw/hw.h
index 34377f5309d3..045c1c8b09b3 100644
--- a/include/hw/hw.h
+++ b/include/hw/hw.h
@@ -5,6 +5,6 @@
 #error Cannot include hw/hw.h from user emulation
 #endif
 
-void QEMU_NORETURN hw_error(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
+G_NORETURN void hw_error(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
 
 #endif
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index c13bc8b58652..f12c0fb581ec 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -22,8 +22,6 @@
 #define QEMU_EXTERN_C extern
 #endif
 
-#define QEMU_NORETURN __attribute__ ((__noreturn__))
-
 #if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
 # define QEMU_PACKED __attribute__((gcc_struct, packed))
 #else
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 848916f5165c..14b6b65a5fa9 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -177,7 +177,8 @@ extern "C" {
  * supports QEMU_ERROR, this will be reported at compile time; otherwise
  * this will be reported at link time due to the missing symbol.
  */
-extern void QEMU_NORETURN QEMU_ERROR("code path is reachable")
+extern G_NORETURN
+void QEMU_ERROR("code path is reachable")
     qemu_build_not_reached_always(void);
 #if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
 #define qemu_build_not_reached()  qemu_build_not_reached_always()
diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 460568d67d53..af19f2b3fc7d 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -188,7 +188,7 @@ void qemu_thread_create(QemuThread *thread, const char *name,
 void *qemu_thread_join(QemuThread *thread);
 void qemu_thread_get_self(QemuThread *thread);
 bool qemu_thread_is_self(QemuThread *thread);
-void qemu_thread_exit(void *retval) QEMU_NORETURN;
+G_NORETURN void qemu_thread_exit(void *retval);
 void qemu_thread_naming(bool enable);
 
 struct Notifier;
diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index bf40942de4ab..121a156933a5 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -72,8 +72,8 @@ void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
 
 #else
 
-void QEMU_NORETURN helper_unaligned_ld(CPUArchState *env, target_ulong addr);
-void QEMU_NORETURN helper_unaligned_st(CPUArchState *env, target_ulong addr);
+G_NORETURN void helper_unaligned_ld(CPUArchState *env, target_ulong addr);
+G_NORETURN void helper_unaligned_st(CPUArchState *env, target_ulong addr);
 
 #endif /* CONFIG_SOFTMMU */
 #endif /* TCG_LDST_H */
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 73869fd9d04f..688d1fb46077 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -398,7 +398,7 @@ typedef TCGv_ptr TCGv_env;
 #define TCG_CALL_NO_WRITE_GLOBALS   0x0002
 /* Helper can be safely suppressed if the return value is not used. */
 #define TCG_CALL_NO_SIDE_EFFECTS    0x0004
-/* Helper is QEMU_NORETURN.  */
+/* Helper is G_NORETURN.  */
 #define TCG_CALL_NO_RETURN          0x0008
 
 /* convenience version of most used call flags */
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 2a80bc83ae8f..ddc260e465dc 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -64,7 +64,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
                     abi_long arg5, abi_long arg6, abi_long arg7,
                     abi_long arg8);
 extern __thread CPUState *thread_cpu;
-void QEMU_NORETURN cpu_loop(CPUArchState *env);
+G_NORETURN void cpu_loop(CPUArchState *env);
 const char *target_strerror(int err);
 int get_osversion(void);
 void init_qemu_uname_release(void);
diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
index 3d1e9b50919a..d247a5086e91 100644
--- a/scripts/cocci-macro-file.h
+++ b/scripts/cocci-macro-file.h
@@ -19,7 +19,7 @@
  */
 
 /* From qemu/compiler.h */
-#define QEMU_NORETURN __attribute__ ((__noreturn__))
+#define G_NORETURN __attribute__ ((__noreturn__))
 #define G_GNUC_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
 #define G_GNUC_NULL_TERMINATED __attribute__((sentinel))
 
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 994a018b910d..d0abc949a8d0 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -434,8 +434,8 @@ void alpha_translate_init(void);
 #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
 
 void alpha_cpu_list(void);
-void QEMU_NORETURN dynamic_excp(CPUAlphaState *, uintptr_t, int, int);
-void QEMU_NORETURN arith_excp(CPUAlphaState *, uintptr_t, int, uint64_t);
+G_NORETURN void dynamic_excp(CPUAlphaState *, uintptr_t, int, int);
+G_NORETURN void arith_excp(CPUAlphaState *, uintptr_t, int, uint64_t);
 
 uint64_t cpu_alpha_load_fpcr (CPUAlphaState *env);
 void cpu_alpha_store_fpcr (CPUAlphaState *env, uint64_t val);
@@ -452,9 +452,9 @@ void alpha_cpu_record_sigbus(CPUState *cs, vaddr address,
 bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
-void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                   MMUAccessType access_type, int mmu_idx,
-                                   uintptr_t retaddr) QEMU_NORETURN;
+G_NORETURN void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
+                                              MMUAccessType access_type, int mmu_idx,
+                                              uintptr_t retaddr);
 void alpha_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      vaddr addr, unsigned size,
                                      MMUAccessType access_type,
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 7f696cd36a8c..9556e3b29e49 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -102,13 +102,13 @@ FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-be-1 prefix */
  * and target exception level. This should be called from helper functions,
  * and never returns because we will longjump back up to the CPU main loop.
  */
-void QEMU_NORETURN raise_exception(CPUARMState *env, uint32_t excp,
-                                   uint32_t syndrome, uint32_t target_el);
+G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,
+                                uint32_t syndrome, uint32_t target_el);
 
 /*
  * Similarly, but also use unwinding to restore cpu state.
  */
-void QEMU_NORETURN raise_exception_ra(CPUARMState *env, uint32_t excp,
+G_NORETURN void raise_exception_ra(CPUARMState *env, uint32_t excp,
                                       uint32_t syndrome, uint32_t target_el,
                                       uintptr_t ra);
 
@@ -606,9 +606,9 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
 bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
 
 /* Raise a data fault alignment exception for the specified virtual address */
-void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
-                                 MMUAccessType access_type,
-                                 int mmu_idx, uintptr_t retaddr) QEMU_NORETURN;
+G_NORETURN void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
+                                            MMUAccessType access_type,
+                                            int mmu_idx, uintptr_t retaddr);
 
 /* arm_cpu_do_transaction_failed: handle a memory system error response
  * (eg "no device/memory present at address") by raising an external abort
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index c43b93a68f14..6f3b6beecf40 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -339,6 +339,6 @@ extern const VMStateDescription vmstate_hppa_cpu;
 void hppa_cpu_alarm_timer(void *);
 int hppa_artype_for_page(CPUHPPAState *env, target_ulong vaddr);
 #endif
-void QEMU_NORETURN hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t ra);
+G_NORETURN void hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t ra);
 
 #endif /* HPPA_CPU_H */
diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 0a4401e917f9..34167e2e29ca 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -69,27 +69,27 @@ static inline target_long lshift(target_long x, int n)
 void tcg_x86_init(void);
 
 /* excp_helper.c */
-void QEMU_NORETURN raise_exception(CPUX86State *env, int exception_index);
-void QEMU_NORETURN raise_exception_ra(CPUX86State *env, int exception_index,
-                                      uintptr_t retaddr);
-void QEMU_NORETURN raise_exception_err(CPUX86State *env, int exception_index,
-                                       int error_code);
-void QEMU_NORETURN raise_exception_err_ra(CPUX86State *env, int exception_index,
-                                          int error_code, uintptr_t retaddr);
-void QEMU_NORETURN raise_interrupt(CPUX86State *nenv, int intno, int is_int,
-                                   int error_code, int next_eip_addend);
+G_NORETURN void raise_exception(CPUX86State *env, int exception_index);
+G_NORETURN void raise_exception_ra(CPUX86State *env, int exception_index,
+                                   uintptr_t retaddr);
+G_NORETURN void raise_exception_err(CPUX86State *env, int exception_index,
+                                    int error_code);
+G_NORETURN void raise_exception_err_ra(CPUX86State *env, int exception_index,
+                                       int error_code, uintptr_t retaddr);
+G_NORETURN void raise_interrupt(CPUX86State *nenv, int intno, int is_int,
+                                int error_code, int next_eip_addend);
 
 /* cc_helper.c */
 extern const uint8_t parity_table[256];
 
 /* misc_helper.c */
 void cpu_load_eflags(CPUX86State *env, int eflags, int update_mask);
-void do_pause(CPUX86State *env) QEMU_NORETURN;
+G_NORETURN void do_pause(CPUX86State *env);
 
 /* sysemu/svm_helper.c */
 #ifndef CONFIG_USER_ONLY
-void QEMU_NORETURN cpu_vmexit(CPUX86State *nenv, uint32_t exit_code,
-                              uint64_t exit_info_1, uintptr_t retaddr);
+G_NORETURN void cpu_vmexit(CPUX86State *nenv, uint32_t exit_code,
+                           uint64_t exit_info_1, uintptr_t retaddr);
 void do_vmexit(CPUX86State *env);
 #endif
 
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 67aa88b8db5b..1e84dd8f47bb 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -359,9 +359,9 @@ struct ArchCPU {
 void mb_cpu_do_interrupt(CPUState *cs);
 bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);
 #endif /* !CONFIG_USER_ONLY */
-void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
-                                MMUAccessType access_type,
-                                int mmu_idx, uintptr_t retaddr) QEMU_NORETURN;
+G_NORETURN void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
+                                           MMUAccessType access_type,
+                                           int mmu_idx, uintptr_t retaddr);
 void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                         MemTxAttrs *attrs);
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 466768aec487..993720b00c3f 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -18,18 +18,19 @@
 void mips_tcg_init(void);
 
 void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
-void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                  MMUAccessType access_type, int mmu_idx,
-                                  uintptr_t retaddr) QEMU_NORETURN;
+G_NORETURN void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
+                                             MMUAccessType access_type, int mmu_idx,
+                                             uintptr_t retaddr);
 
 const char *mips_exception_name(int32_t exception);
 
-void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env, uint32_t exception,
-                                          int error_code, uintptr_t pc);
+G_NORETURN void do_raise_exception_err(CPUMIPSState *env, uint32_t exception,
+                                       int error_code, uintptr_t pc);
 
-static inline void QEMU_NORETURN do_raise_exception(CPUMIPSState *env,
-                                                    uint32_t exception,
-                                                    uintptr_t pc)
+static inline G_NORETURN
+void do_raise_exception(CPUMIPSState *env,
+                        uint32_t exception,
+                        uintptr_t pc)
 {
     do_raise_exception_err(env, exception, 0, pc);
 }
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index ca0f3420cd1b..1bab805bb0b6 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -194,9 +194,9 @@ void nios2_cpu_do_interrupt(CPUState *cs);
 void dump_mmu(CPUNios2State *env);
 void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                   MMUAccessType access_type, int mmu_idx,
-                                   uintptr_t retaddr) QEMU_NORETURN;
+G_NORETURN void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
+                                              MMUAccessType access_type, int mmu_idx,
+                                              uintptr_t retaddr);
 
 void do_nios2_semihosting(CPUNios2State *env);
 
diff --git a/target/openrisc/exception.h b/target/openrisc/exception.h
index 333bf846388d..f62fc314c1f4 100644
--- a/target/openrisc/exception.h
+++ b/target/openrisc/exception.h
@@ -22,6 +22,6 @@
 
 #include "cpu.h"
 
-void QEMU_NORETURN raise_exception(OpenRISCCPU *cpu, uint32_t excp);
+G_NORETURN void raise_exception(OpenRISCCPU *cpu, uint32_t excp);
 
 #endif /* TARGET_OPENRISC_EXCEPTION_H */
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 473436a49eb5..c2b6c987c047 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2492,13 +2492,13 @@ static inline void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
 }
 #endif
 
-void QEMU_NORETURN raise_exception(CPUPPCState *env, uint32_t exception);
-void QEMU_NORETURN raise_exception_ra(CPUPPCState *env, uint32_t exception,
-                                      uintptr_t raddr);
-void QEMU_NORETURN raise_exception_err(CPUPPCState *env, uint32_t exception,
-                                       uint32_t error_code);
-void QEMU_NORETURN raise_exception_err_ra(CPUPPCState *env, uint32_t exception,
-                                          uint32_t error_code, uintptr_t raddr);
+G_NORETURN void raise_exception(CPUPPCState *env, uint32_t exception);
+G_NORETURN void raise_exception_ra(CPUPPCState *env, uint32_t exception,
+                                   uintptr_t raddr);
+G_NORETURN void raise_exception_err(CPUPPCState *env, uint32_t exception,
+                                    uint32_t error_code);
+G_NORETURN void raise_exception_err_ra(CPUPPCState *env, uint32_t exception,
+                                       uint32_t error_code, uintptr_t raddr);
 
 /* PERFM EBB helper*/
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 6aa9484f34a5..8094e0b03371 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -286,9 +286,9 @@ void ppc_cpu_record_sigsegv(CPUState *cs, vaddr addr,
 bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr);
-void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                 MMUAccessType access_type, int mmu_idx,
-                                 uintptr_t retaddr) QEMU_NORETURN;
+G_NORETURN void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                            MMUAccessType access_type, int mmu_idx,
+                                            uintptr_t retaddr);
 #endif
 
 #endif /* PPC_INTERNAL_H */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e1d976bdef06..72f1c9451e93 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -451,9 +451,9 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                    MMUAccessType access_type, int mmu_idx,
-                                    uintptr_t retaddr) QEMU_NORETURN;
+G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                               MMUAccessType access_type, int mmu_idx,
+                                               uintptr_t retaddr);
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
@@ -487,8 +487,8 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
 
 void riscv_translate_init(void);
-void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
-                                         uint32_t exception, uintptr_t pc);
+G_NORETURN void riscv_raise_exception(CPURISCVState *env,
+                                      uint32_t exception, uintptr_t pc);
 
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 6fc8cad2d586..6aba7fd0ca8a 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -280,9 +280,9 @@ void s390_cpu_record_sigbus(CPUState *cs, vaddr address,
 bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
-void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                   MMUAccessType access_type, int mmu_idx,
-                                   uintptr_t retaddr) QEMU_NORETURN;
+G_NORETURN void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                              MMUAccessType access_type, int mmu_idx,
+                                              uintptr_t retaddr);
 #endif
 
 
diff --git a/target/s390x/tcg/tcg_s390x.h b/target/s390x/tcg/tcg_s390x.h
index 2f54ccb02745..78558912f99f 100644
--- a/target/s390x/tcg/tcg_s390x.h
+++ b/target/s390x/tcg/tcg_s390x.h
@@ -14,11 +14,11 @@
 #define TCG_S390X_H
 
 void tcg_s390_tod_updated(CPUState *cs, run_on_cpu_data opaque);
-void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
-                                              uint32_t code, uintptr_t ra);
-void QEMU_NORETURN tcg_s390_data_exception(CPUS390XState *env, uint32_t dxc,
-                                           uintptr_t ra);
-void QEMU_NORETURN tcg_s390_vector_exception(CPUS390XState *env, uint32_t vxc,
-                                             uintptr_t ra);
+G_NORETURN void tcg_s390_program_interrupt(CPUS390XState *env,
+                                           uint32_t code, uintptr_t ra);
+G_NORETURN void tcg_s390_data_exception(CPUS390XState *env, uint32_t dxc,
+                                        uintptr_t ra);
+G_NORETURN void tcg_s390_vector_exception(CPUS390XState *env, uint32_t vxc,
+                                          uintptr_t ra);
 
 #endif /* TCG_S390X_H */
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 14d490ac4705..9f15ef913caa 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -210,9 +210,9 @@ void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                    MMUAccessType access_type, int mmu_idx,
-                                    uintptr_t retaddr) QEMU_NORETURN;
+G_NORETURN void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
+                                               MMUAccessType access_type, int mmu_idx,
+                                               uintptr_t retaddr);
 
 void sh4_translate_init(void);
 void sh4_cpu_list(void);
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index dd9e2f5cdb6a..f80ea2e8cf2a 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -575,11 +575,11 @@ void sparc_cpu_do_interrupt(CPUState *cpu);
 hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                                 MMUAccessType access_type,
-                                                 int mmu_idx,
-                                                 uintptr_t retaddr);
-void cpu_raise_exception_ra(CPUSPARCState *, int, uintptr_t) QEMU_NORETURN;
+G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
+                                              MMUAccessType access_type,
+                                              int mmu_idx,
+                                              uintptr_t retaddr);
+G_NORETURN void cpu_raise_exception_ra(CPUSPARCState *, int, uintptr_t);
 
 #ifndef NO_CPU_IO_DEFS
 /* cpu_init.c */
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 71142ea8f453..d4b8268146cb 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -581,9 +581,9 @@ void xtensa_count_regs(const XtensaConfig *config,
                        unsigned *n_regs, unsigned *n_core_regs);
 int xtensa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                    MMUAccessType access_type, int mmu_idx,
-                                    uintptr_t retaddr) QEMU_NORETURN;
+G_NORETURN void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
+                                               MMUAccessType access_type, int mmu_idx,
+                                               uintptr_t retaddr);
 
 #define cpu_list xtensa_cpu_list
 
diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index d8162673ae8d..ea4a0dd2fbcc 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -28,12 +28,12 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
      g_assert_not_reached();
 }
 
-void QEMU_NORETURN cpu_loop_exit(CPUState *cpu)
+G_NORETURN void cpu_loop_exit(CPUState *cpu)
 {
     g_assert_not_reached();
 }
 
-void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
+G_NORETURN void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
 {
     g_assert_not_reached();
 }
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 8a36b696d82b..58a53863957a 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -347,7 +347,8 @@ static int core_dump_signal(int sig)
 }
 
 /* Abort execution with signal. */
-static void QEMU_NORETURN dump_core_and_abort(int target_sig)
+static G_NORETURN
+void dump_core_and_abort(int target_sig)
 {
     CPUArchState *env = thread_cpu->env_ptr;
     CPUState *cpu = env_cpu(env);
diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index 80683fed318b..badef5c214af 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -189,7 +189,8 @@ static void wake_blocked_threads(ITCStorageCell *c)
     c->blocked_threads = 0;
 }
 
-static void QEMU_NORETURN block_thread_and_exit(ITCStorageCell *c)
+static G_NORETURN
+void block_thread_and_exit(ITCStorageCell *c)
 {
     c->blocked_threads |= 1ULL << current_cpu->cpu_index;
     current_cpu->halted = 1;
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 092e70b80c6f..8d29bfaa6b5c 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -725,7 +725,8 @@ void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
 }
 
 /* abort execution with signal */
-static void QEMU_NORETURN dump_core_and_abort(int target_sig)
+static G_NORETURN
+void dump_core_and_abort(int target_sig)
 {
     CPUState *cpu = thread_cpu;
     CPUArchState *env = cpu->env_ptr;
diff --git a/monitor/hmp.c b/monitor/hmp.c
index 24fd2e5f34bf..15ca04735cd3 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -308,8 +308,8 @@ void help_cmd(Monitor *mon, const char *name)
 static const char *pch;
 static sigjmp_buf expr_env;
 
-static void G_GNUC_PRINTF(2, 3) QEMU_NORETURN
-expr_error(Monitor *mon, const char *fmt, ...)
+static G_NORETURN G_GNUC_PRINTF(2, 3)
+void expr_error(Monitor *mon, const char *fmt, ...)
 {
     va_list ap;
     va_start(ap, fmt);
diff --git a/qemu-img.c b/qemu-img.c
index a2b1d3653a1e..6077c947002d 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -100,7 +100,8 @@ static void format_print(void *opaque, const char *name)
     printf(" %s", name);
 }
 
-static void QEMU_NORETURN G_GNUC_PRINTF(1, 2) error_exit(const char *fmt, ...)
+static G_NORETURN G_GNUC_PRINTF(1, 2)
+void error_exit(const char *fmt, ...)
 {
     va_list ap;
 
@@ -112,18 +113,21 @@ static void QEMU_NORETURN G_GNUC_PRINTF(1, 2) error_exit(const char *fmt, ...)
     exit(EXIT_FAILURE);
 }
 
-static void QEMU_NORETURN missing_argument(const char *option)
+static G_NORETURN
+void missing_argument(const char *option)
 {
     error_exit("missing argument for option '%s'", option);
 }
 
-static void QEMU_NORETURN unrecognized_option(const char *option)
+static G_NORETURN
+void unrecognized_option(const char *option)
 {
     error_exit("unrecognized option '%s'", option);
 }
 
 /* Please keep in synch with docs/tools/qemu-img.rst */
-static void QEMU_NORETURN help(void)
+static G_NORETURN
+void help(void)
 {
     const char *help_msg =
            QEMU_IMG_VERSION
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index dcaa2d03adb3..a5a389b5a321 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -514,7 +514,7 @@ void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
 /* This should only be called from translate, via gen_excp.
    We expect that ENV->PC has already been updated.  */
-void QEMU_NORETURN helper_excp(CPUAlphaState *env, int excp, int error)
+G_NORETURN void helper_excp(CPUAlphaState *env, int excp, int error)
 {
     CPUState *cs = env_cpu(env);
 
@@ -524,8 +524,8 @@ void QEMU_NORETURN helper_excp(CPUAlphaState *env, int excp, int error)
 }
 
 /* This may be called from any of the helpers to set up EXCEPTION_INDEX.  */
-void QEMU_NORETURN dynamic_excp(CPUAlphaState *env, uintptr_t retaddr,
-                                int excp, int error)
+G_NORETURN void dynamic_excp(CPUAlphaState *env, uintptr_t retaddr,
+                             int excp, int error)
 {
     CPUState *cs = env_cpu(env);
 
@@ -539,8 +539,8 @@ void QEMU_NORETURN dynamic_excp(CPUAlphaState *env, uintptr_t retaddr,
     cpu_loop_exit(cs);
 }
 
-void QEMU_NORETURN arith_excp(CPUAlphaState *env, uintptr_t retaddr,
-                              int exc, uint64_t mask)
+G_NORETURN void arith_excp(CPUAlphaState *env, uintptr_t retaddr,
+                           int exc, uint64_t mask)
 {
     env->trap_arg0 = exc;
     env->trap_arg1 = mask;
diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index 739aa520dddd..d0483bf051ec 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -382,8 +382,8 @@ static uint64_t pauth_strip(CPUARMState *env, uint64_t ptr, bool data)
     return pauth_original_ptr(ptr, param);
 }
 
-static void QEMU_NORETURN pauth_trap(CPUARMState *env, int target_el,
-                                     uintptr_t ra)
+static G_NORETURN
+void pauth_trap(CPUARMState *env, int target_el, uintptr_t ra)
 {
     raise_exception_ra(env, EXCP_UDEF, syn_pactrap(), target_el, ra);
 }
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index b79004e0cca6..6421e16202e5 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -79,9 +79,10 @@ static uint32_t compute_fsr_fsc(CPUARMState *env, ARMMMUFaultInfo *fi,
     return fsr;
 }
 
-static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
-                                            MMUAccessType access_type,
-                                            int mmu_idx, ARMMMUFaultInfo *fi)
+static G_NORETURN
+void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
+                       MMUAccessType access_type,
+                       int mmu_idx, ARMMMUFaultInfo *fi)
 {
     CPUARMState *env = &cpu->env;
     int target_el;
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 63e5ad5d68e2..a5ed819c0451 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -34,9 +34,10 @@
 #define SF_MANTBITS    23
 
 /* Exceptions processing helpers */
-static void QEMU_NORETURN do_raise_exception_err(CPUHexagonState *env,
-                                                 uint32_t exception,
-                                                 uintptr_t pc)
+static G_NORETURN
+void do_raise_exception_err(CPUHexagonState *env,
+                            uint32_t exception,
+                            uintptr_t pc)
 {
     CPUState *cs = env_cpu(env);
     qemu_log_mask(CPU_LOG_INT, "%s: %d\n", __func__, exception);
@@ -44,7 +45,7 @@ static void QEMU_NORETURN do_raise_exception_err(CPUHexagonState *env,
     cpu_loop_exit_restore(cs, pc);
 }
 
-void QEMU_NORETURN HELPER(raise_exception)(CPUHexagonState *env, uint32_t excp)
+G_NORETURN void HELPER(raise_exception)(CPUHexagonState *env, uint32_t excp)
 {
     do_raise_exception_err(env, excp, 0);
 }
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 5f46ba801eef..a6f52caf14a3 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -73,10 +73,10 @@ static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 }
 
 #ifndef CONFIG_USER_ONLY
-static void QEMU_NORETURN
-hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                             MMUAccessType access_type, int mmu_idx,
-                             uintptr_t retaddr)
+static G_NORETURN
+void hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                  MMUAccessType access_type, int mmu_idx,
+                                  uintptr_t retaddr)
 {
     HPPACPU *cpu = HPPA_CPU(cs);
     CPUHPPAState *env = &cpu->env;
diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index 2810361be0b7..cd304f051e57 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -28,7 +28,7 @@
 #include "fpu/softfloat.h"
 #include "trace.h"
 
-void QEMU_NORETURN HELPER(excp)(CPUHPPAState *env, int excp)
+G_NORETURN void HELPER(excp)(CPUHPPAState *env, int excp)
 {
     CPUState *cs = env_cpu(env);
 
@@ -36,7 +36,7 @@ void QEMU_NORETURN HELPER(excp)(CPUHPPAState *env, int excp)
     cpu_loop_exit(cs);
 }
 
-void QEMU_NORETURN hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t ra)
+G_NORETURN void hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t ra)
 {
     CPUState *cs = env_cpu(env);
 
diff --git a/target/i386/tcg/bpt_helper.c b/target/i386/tcg/bpt_helper.c
index b6c1fff16e51..bc34ac27fea7 100644
--- a/target/i386/tcg/bpt_helper.c
+++ b/target/i386/tcg/bpt_helper.c
@@ -22,7 +22,7 @@
 #include "exec/helper-proto.h"
 #include "helper-tcg.h"
 
-void QEMU_NORETURN helper_single_step(CPUX86State *env)
+G_NORETURN void helper_single_step(CPUX86State *env)
 {
 #ifndef CONFIG_USER_ONLY
     check_hw_breakpoints(env, true);
diff --git a/target/i386/tcg/excp_helper.c b/target/i386/tcg/excp_helper.c
index bdae887d0abc..c1ffa1c0ef74 100644
--- a/target/i386/tcg/excp_helper.c
+++ b/target/i386/tcg/excp_helper.c
@@ -25,13 +25,13 @@
 #include "exec/helper-proto.h"
 #include "helper-tcg.h"
 
-void QEMU_NORETURN helper_raise_interrupt(CPUX86State *env, int intno,
+G_NORETURN void helper_raise_interrupt(CPUX86State *env, int intno,
                                           int next_eip_addend)
 {
     raise_interrupt(env, intno, 1, 0, next_eip_addend);
 }
 
-void QEMU_NORETURN helper_raise_exception(CPUX86State *env, int exception_index)
+G_NORETURN void helper_raise_exception(CPUX86State *env, int exception_index)
 {
     raise_exception(env, exception_index);
 }
@@ -87,10 +87,11 @@ static int check_exception(CPUX86State *env, int intno, int *error_code,
  * env->eip value AFTER the interrupt instruction. It is only relevant if
  * is_int is TRUE.
  */
-static void QEMU_NORETURN raise_interrupt2(CPUX86State *env, int intno,
-                                           int is_int, int error_code,
-                                           int next_eip_addend,
-                                           uintptr_t retaddr)
+static G_NORETURN
+void raise_interrupt2(CPUX86State *env, int intno,
+                      int is_int, int error_code,
+                      int next_eip_addend,
+                      uintptr_t retaddr)
 {
     CPUState *cs = env_cpu(env);
 
@@ -111,31 +112,31 @@ static void QEMU_NORETURN raise_interrupt2(CPUX86State *env, int intno,
 
 /* shortcuts to generate exceptions */
 
-void QEMU_NORETURN raise_interrupt(CPUX86State *env, int intno, int is_int,
-                                   int error_code, int next_eip_addend)
+G_NORETURN void raise_interrupt(CPUX86State *env, int intno, int is_int,
+                                int error_code, int next_eip_addend)
 {
     raise_interrupt2(env, intno, is_int, error_code, next_eip_addend, 0);
 }
 
-void QEMU_NORETURN raise_exception_err(CPUX86State *env, int exception_index,
-                                       int error_code)
+G_NORETURN void raise_exception_err(CPUX86State *env, int exception_index,
+                                    int error_code)
 {
     raise_interrupt2(env, exception_index, 0, error_code, 0, 0);
 }
 
-void QEMU_NORETURN raise_exception_err_ra(CPUX86State *env, int exception_index,
-                                          int error_code, uintptr_t retaddr)
+G_NORETURN void raise_exception_err_ra(CPUX86State *env, int exception_index,
+                                       int error_code, uintptr_t retaddr)
 {
     raise_interrupt2(env, exception_index, 0, error_code, 0, retaddr);
 }
 
-void QEMU_NORETURN raise_exception(CPUX86State *env, int exception_index)
+G_NORETURN void raise_exception(CPUX86State *env, int exception_index)
 {
     raise_interrupt2(env, exception_index, 0, 0, 0, 0);
 }
 
-void QEMU_NORETURN raise_exception_ra(CPUX86State *env, int exception_index,
-                                      uintptr_t retaddr)
+G_NORETURN void raise_exception_ra(CPUX86State *env, int exception_index,
+                                   uintptr_t retaddr)
 {
     raise_interrupt2(env, exception_index, 0, 0, 0, retaddr);
 }
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index 24a0eaa3d596..5f7a3061ca59 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -81,7 +81,7 @@ void helper_rdtscp(CPUX86State *env)
     env->regs[R_ECX] = (uint32_t)(env->tsc_aux);
 }
 
-void QEMU_NORETURN helper_rdpmc(CPUX86State *env)
+G_NORETURN void helper_rdpmc(CPUX86State *env)
 {
     if (((env->cr[4] & CR4_PCE_MASK) == 0 ) &&
         ((env->hflags & HF_CPL_MASK) != 0)) {
@@ -94,7 +94,7 @@ void QEMU_NORETURN helper_rdpmc(CPUX86State *env)
     raise_exception_err(env, EXCP06_ILLOP, 0);
 }
 
-void QEMU_NORETURN do_pause(CPUX86State *env)
+G_NORETURN void do_pause(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
 
@@ -103,7 +103,7 @@ void QEMU_NORETURN do_pause(CPUX86State *env)
     cpu_loop_exit(cs);
 }
 
-void QEMU_NORETURN helper_pause(CPUX86State *env, int next_eip_addend)
+G_NORETURN void helper_pause(CPUX86State *env, int next_eip_addend)
 {
     cpu_svm_check_intercept_param(env, SVM_EXIT_PAUSE, 0, GETPC());
     env->eip += next_eip_addend;
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 3715c1e2625b..1328aa656fa8 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -471,7 +471,8 @@ void helper_flush_page(CPUX86State *env, target_ulong addr)
     tlb_flush_page(env_cpu(env), addr);
 }
 
-static void QEMU_NORETURN do_hlt(CPUX86State *env)
+static G_NORETURN
+void do_hlt(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
 
@@ -481,7 +482,7 @@ static void QEMU_NORETURN do_hlt(CPUX86State *env)
     cpu_loop_exit(cs);
 }
 
-void QEMU_NORETURN helper_hlt(CPUX86State *env, int next_eip_addend)
+G_NORETURN void helper_hlt(CPUX86State *env, int next_eip_addend)
 {
     cpu_svm_check_intercept_param(env, SVM_EXIT_HLT, 0, GETPC());
     env->eip += next_eip_addend;
@@ -498,7 +499,7 @@ void helper_monitor(CPUX86State *env, target_ulong ptr)
     cpu_svm_check_intercept_param(env, SVM_EXIT_MONITOR, 0, GETPC());
 }
 
-void QEMU_NORETURN helper_mwait(CPUX86State *env, int next_eip_addend)
+G_NORETURN void helper_mwait(CPUX86State *env, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
 
diff --git a/target/openrisc/exception.c b/target/openrisc/exception.c
index 28c1fce5232a..8699c3dcea42 100644
--- a/target/openrisc/exception.c
+++ b/target/openrisc/exception.c
@@ -22,7 +22,7 @@
 #include "exec/exec-all.h"
 #include "exception.h"
 
-void QEMU_NORETURN raise_exception(OpenRISCCPU *cpu, uint32_t excp)
+G_NORETURN void raise_exception(OpenRISCCPU *cpu, uint32_t excp)
 {
     CPUState *cs = CPU(cpu);
 
diff --git a/target/openrisc/exception_helper.c b/target/openrisc/exception_helper.c
index d02a1cf0aa14..1f5be4bed907 100644
--- a/target/openrisc/exception_helper.c
+++ b/target/openrisc/exception_helper.c
@@ -30,7 +30,8 @@ void HELPER(exception)(CPUOpenRISCState *env, uint32_t excp)
     raise_exception(cpu, excp);
 }
 
-static void QEMU_NORETURN do_range(CPUOpenRISCState *env, uintptr_t pc)
+static G_NORETURN
+void do_range(CPUOpenRISCState *env, uintptr_t pc)
 {
     CPUState *cs = env_cpu(env);
 
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 1a75ba11e68f..df3573688325 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -24,8 +24,8 @@
 #include "exec/helper-proto.h"
 
 /* Exceptions processing helpers */
-void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
-                                          uint32_t exception, uintptr_t pc)
+G_NORETURN void riscv_raise_exception(CPURISCVState *env,
+                                      uint32_t exception, uintptr_t pc)
 {
     CPUState *cs = env_cpu(env);
     cs->exception_index = exception;
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 11f952d34099..76a746300e46 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -24,8 +24,9 @@
 #include "exec/cpu_ldst.h"
 #include "fpu/softfloat.h"
 
-static inline void QEMU_NORETURN raise_exception(CPURXState *env, int index,
-                                                 uintptr_t retaddr);
+static inline G_NORETURN
+void raise_exception(CPURXState *env, int index,
+                     uintptr_t retaddr);
 
 static void _set_psw(CPURXState *env, uint32_t psw, uint32_t rte)
 {
@@ -418,8 +419,9 @@ uint32_t helper_divu(CPURXState *env, uint32_t num, uint32_t den)
 }
 
 /* exception */
-static inline void QEMU_NORETURN raise_exception(CPURXState *env, int index,
-                                                 uintptr_t retaddr)
+static inline G_NORETURN
+void raise_exception(CPURXState *env, int index,
+                     uintptr_t retaddr)
 {
     CPUState *cs = env_cpu(env);
 
@@ -427,22 +429,22 @@ static inline void QEMU_NORETURN raise_exception(CPURXState *env, int index,
     cpu_loop_exit_restore(cs, retaddr);
 }
 
-void QEMU_NORETURN helper_raise_privilege_violation(CPURXState *env)
+G_NORETURN void helper_raise_privilege_violation(CPURXState *env)
 {
     raise_exception(env, 20, GETPC());
 }
 
-void QEMU_NORETURN helper_raise_access_fault(CPURXState *env)
+G_NORETURN void helper_raise_access_fault(CPURXState *env)
 {
     raise_exception(env, 21, GETPC());
 }
 
-void QEMU_NORETURN helper_raise_illegal_instruction(CPURXState *env)
+G_NORETURN void helper_raise_illegal_instruction(CPURXState *env)
 {
     raise_exception(env, 23, GETPC());
 }
 
-void QEMU_NORETURN helper_wait(CPURXState *env)
+G_NORETURN void helper_wait(CPURXState *env)
 {
     CPUState *cs = env_cpu(env);
 
@@ -451,12 +453,12 @@ void QEMU_NORETURN helper_wait(CPURXState *env)
     raise_exception(env, EXCP_HLT, 0);
 }
 
-void QEMU_NORETURN helper_rxint(CPURXState *env, uint32_t vec)
+G_NORETURN void helper_rxint(CPURXState *env, uint32_t vec)
 {
     raise_exception(env, 0x100 + vec, 0);
 }
 
-void QEMU_NORETURN helper_rxbrk(CPURXState *env)
+G_NORETURN void helper_rxbrk(CPURXState *env)
 {
     raise_exception(env, 0x100, 0);
 }
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index be6c966cfa4c..29ccf70df147 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -34,8 +34,8 @@
 #include "hw/boards.h"
 #endif
 
-void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
-                                              uint32_t code, uintptr_t ra)
+G_NORETURN void tcg_s390_program_interrupt(CPUS390XState *env,
+                                           uint32_t code, uintptr_t ra)
 {
     CPUState *cs = env_cpu(env);
 
@@ -46,8 +46,8 @@ void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
     cpu_loop_exit(cs);
 }
 
-void QEMU_NORETURN tcg_s390_data_exception(CPUS390XState *env, uint32_t dxc,
-                                           uintptr_t ra)
+G_NORETURN void tcg_s390_data_exception(CPUS390XState *env, uint32_t dxc,
+                                        uintptr_t ra)
 {
     g_assert(dxc <= 0xff);
 #if !defined(CONFIG_USER_ONLY)
@@ -63,8 +63,8 @@ void QEMU_NORETURN tcg_s390_data_exception(CPUS390XState *env, uint32_t dxc,
     tcg_s390_program_interrupt(env, PGM_DATA, ra);
 }
 
-void QEMU_NORETURN tcg_s390_vector_exception(CPUS390XState *env, uint32_t vxc,
-                                             uintptr_t ra)
+G_NORETURN void tcg_s390_vector_exception(CPUS390XState *env, uint32_t vxc,
+                                          uintptr_t ra)
 {
     g_assert(vxc <= 0xff);
 #if !defined(CONFIG_USER_ONLY)
@@ -88,7 +88,8 @@ void HELPER(data_exception)(CPUS390XState *env, uint32_t dxc)
  * this is only for the atomic operations, for which we want to raise a
  * specification exception.
  */
-static void QEMU_NORETURN do_unaligned_access(CPUState *cs, uintptr_t retaddr)
+static G_NORETURN
+void do_unaligned_access(CPUState *cs, uintptr_t retaddr)
 {
     S390CPU *cpu = S390_CPU(cs);
     CPUS390XState *env = &cpu->env;
@@ -620,9 +621,10 @@ void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     do_unaligned_access(cs, retaddr);
 }
 
-static void QEMU_NORETURN monitor_event(CPUS390XState *env,
-                                        uint64_t monitor_code,
-                                        uint8_t monitor_class, uintptr_t ra)
+static G_NORETURN
+void monitor_event(CPUS390XState *env,
+                   uint64_t monitor_code,
+                   uint8_t monitor_class, uintptr_t ra)
 {
     /* Store the Monitor Code and the Monitor Class Number into the lowcore */
     stq_phys(env_cpu(env)->as,
diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index 752669825f02..a663335c39ae 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -57,8 +57,9 @@ void helper_ldtlb(CPUSH4State *env)
 #endif
 }
 
-static inline void QEMU_NORETURN raise_exception(CPUSH4State *env, int index,
-                                                 uintptr_t retaddr)
+static inline G_NORETURN
+void raise_exception(CPUSH4State *env, int index,
+                     uintptr_t retaddr)
 {
     CPUState *cs = env_cpu(env);
 
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 346a6dfa3537..919448a49401 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -925,10 +925,10 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 }
 
 #ifndef CONFIG_USER_ONLY
-void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                                 MMUAccessType access_type,
-                                                 int mmu_idx,
-                                                 uintptr_t retaddr)
+G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                              MMUAccessType access_type,
+                                              int mmu_idx,
+                                              uintptr_t retaddr)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
diff --git a/target/tricore/op_helper.c b/target/tricore/op_helper.c
index 9476d10d0065..a79c838a92cc 100644
--- a/target/tricore/op_helper.c
+++ b/target/tricore/op_helper.c
@@ -25,9 +25,9 @@
 
 /* Exception helpers */
 
-static void QEMU_NORETURN
-raise_exception_sync_internal(CPUTriCoreState *env, uint32_t class, int tin,
-                              uintptr_t pc, uint32_t fcd_pc)
+static G_NORETURN
+void raise_exception_sync_internal(CPUTriCoreState *env, uint32_t class, int tin,
+                                   uintptr_t pc, uint32_t fcd_pc)
 {
     CPUState *cs = env_cpu(env);
     /* in case we come from a helper-call we need to restore the PC */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index f8542529d030..6196c2ee4124 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -320,7 +320,8 @@ static void set_jmp_reset_offset(TCGContext *s, int which)
 }
 
 /* Signal overflow, starting over with fewer guest insns. */
-static void QEMU_NORETURN tcg_raise_tb_overflow(TCGContext *s)
+static G_NORETURN
+void tcg_raise_tb_overflow(TCGContext *s)
 {
     siglongjmp(s->jmp_trans, -2);
 }
diff --git a/tests/fp/fp-bench.c b/tests/fp/fp-bench.c
index c24baf85350a..8ce0ca1545d1 100644
--- a/tests/fp/fp-bench.c
+++ b/tests/fp/fp-bench.c
@@ -545,7 +545,8 @@ static int round_name_to_mode(const char *name)
     return -1;
 }
 
-static void QEMU_NORETURN die_host_rounding(enum rounding rounding)
+static G_NORETURN
+void die_host_rounding(enum rounding rounding)
 {
     fprintf(stderr, "fatal: '%s' rounding not supported on this host\n",
             round_names[rounding]);
diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 352dd71c44fa..35829ad5f71e 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -921,7 +921,8 @@ static void parse_args(int argc, char *argv[])
     }
 }
 
-static void QEMU_NORETURN run_test(void)
+static G_NORETURN
+void run_test(void)
 {
     unsigned int i;
 
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 910a6c74dff9..4763d02ae78f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -223,7 +223,7 @@ our $Sparse	= qr{
 our $Attribute	= qr{
 			const|
 			volatile|
-			QEMU_NORETURN|
+			G_NORETURN|
 			G_GNUC_WARN_UNUSED_RESULT|
 			G_GNUC_NULL_TERMINATED|
 			QEMU_PACKED|
-- 
2.35.1.693.g805e0a68082a


