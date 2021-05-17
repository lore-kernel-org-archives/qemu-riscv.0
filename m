Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liar2-0004bh-Bx
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liaqx-0004SO-4N; Mon, 17 May 2021 06:52:03 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liaqu-0006PH-IO; Mon, 17 May 2021 06:52:02 -0400
Received: by mail-wr1-x431.google.com with SMTP id d11so5866127wrw.8;
 Mon, 17 May 2021 03:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4y6dJ5W0jRFDoCjc5ce7xU1qdLgWVyXVf+o6CYpimiI=;
 b=aw+C6wdMWzjcpiu4fDUBOAlZauufWX6TuW/sg846ikpCQUJGPOKW1YZZs1/MlgcScV
 4ZtXduOr50cxLAfOgfFHne/MvW05sEhbvuZRgmlQvbddj7FwXQPWqQsTqtI/M4EdUnm2
 snC1E6VAMz8q2LlGlrIJB7fiwihs0eXYloynKjktAGhKAHVIQRBlC+3/F/ruTJbQg5OG
 Xk2XHlf+M+POoM1o3PmMo+Ti+jhlf3xJ9Zy/PIeDx/xFmYMPIR7ok1cx5Xa5p4BAj93O
 fDgnqKmL4k0Wz/ylpr8BJApCS8u0Gh6zoigX2Jwa4sAYmguH+MO5vG+pL25nT2WDDic6
 3UMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4y6dJ5W0jRFDoCjc5ce7xU1qdLgWVyXVf+o6CYpimiI=;
 b=R4Bz7yOPU+icUTxZh9P1Rlsu6dYUgAeZX5/F8YuTrimjP9qMzHHzUtiuHZBx1KBNkw
 ZcgsQfydt52CJLqN4IIC+H8CQreNvlVCNuRsYbw4vMWaLOzL45E9Y6GE0S4JuaiJoXWr
 1xE/W4OTd7SVFS+RWzOFPB9+z45oMnnsfjqLuPCEzLjGmD5A8EjoyyB3F/k8AzEbFlu8
 LNx5m6GIsQrnZ1W+ddfTFFns1kPChPWp9PeWfVdrigHUCmix0wkIGnwxgpcPml3rbBdR
 1xBsdatT0qIxvVJhpbpuev58AmUUDmtwWpxcdeFDkKvq1Yv/eQEO/luZH3lViAKEIbpH
 wjqg==
X-Gm-Message-State: AOAM530Mf+DBqXnLJVB9FjHZgWEuapm2aC2p7ydt4QA7xDc/xko9j9gy
 IGcNNmcLgBmhb0cxDY0QKrT9iEUdlwK5iA==
X-Google-Smtp-Source: ABdhPJy2HLFQ9itghdh5t5I8R9nM1Cq5j9WeAFNyq65dzmeZevg1VDJLJ1g5gDIz+E5gf654Ff0+og==
X-Received: by 2002:adf:d081:: with SMTP id y1mr17663319wrh.179.1621248717377; 
 Mon, 17 May 2021 03:51:57 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v10sm19368812wrq.0.2021.05.17.03.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:51:56 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 03/23] cpu: Restrict target cpu_do_unaligned_access()
 handlers to sysemu
Date: Mon, 17 May 2021 12:51:20 +0200
Message-Id: <20210517105140.1062037-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 May 2021 10:52:04 -0000

Commit 8535dd702dd ("cpu: move do_unaligned_access to tcg_ops")
restricted the do_unaligned_access() handler to the sysemu part
of TCGCPUOps, but only restricted the HPPA declaration. Restrict
the other targets.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/alpha/cpu.h             |  7 ++++---
 target/arm/internals.h         |  2 +-
 target/microblaze/cpu.h        |  7 ++++---
 target/mips/tcg/tcg-internal.h |  6 +++---
 target/nios2/cpu.h             |  3 ++-
 target/ppc/internal.h          |  2 ++
 target/riscv/cpu.h             |  6 +++---
 target/s390x/internal.h        |  2 ++
 target/sh4/cpu.h               |  6 +++---
 target/sparc/cpu.h             |  9 +++++----
 target/xtensa/cpu.h            |  6 +++---
 target/arm/tlb_helper.c        |  4 ++--
 target/microblaze/helper.c     | 35 +++++++++++++++++-----------------
 target/ppc/excp_helper.c       |  3 ++-
 target/sparc/ldst_helper.c     |  5 ++---
 15 files changed, 56 insertions(+), 47 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 82df108967b..6541675d9d6 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -274,6 +274,10 @@ struct AlphaCPU {
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_alpha_cpu;
+
+void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
+                                   MMUAccessType access_type,
+                                   int mmu_idx, uintptr_t retaddr);
 #endif
 
 void alpha_cpu_do_interrupt(CPUState *cpu);
@@ -282,9 +286,6 @@ void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                   MMUAccessType access_type,
-                                   int mmu_idx, uintptr_t retaddr);
 
 #define cpu_list alpha_cpu_list
 #define cpu_signal_handler cpu_alpha_signal_handler
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3614f6dd988..a31e56602f5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -578,12 +578,12 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
  * tables */
 bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
 
+#if !defined(CONFIG_USER_ONLY)
 /* Raise a data fault alignment exception for the specified virtual address */
 void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
                                  int mmu_idx, uintptr_t retaddr);
 
-#if !defined(CONFIG_USER_ONLY)
 /* arm_cpu_do_transaction_failed: handle a memory system error response
  * (eg "no device/memory present at address") by raising an external abort
  * exception
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index e4bba8a7551..348540c7640 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -357,9 +357,6 @@ struct MicroBlazeCPU {
 
 void mb_cpu_do_interrupt(CPUState *cs);
 bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);
-void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
-                                MMUAccessType access_type,
-                                int mmu_idx, uintptr_t retaddr);
 void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                         MemTxAttrs *attrs);
@@ -420,6 +417,10 @@ static inline void cpu_get_tb_cpu_state(CPUMBState *env, target_ulong *pc,
 }
 
 #if !defined(CONFIG_USER_ONLY)
+
+void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
+                                MMUAccessType access_type,
+                                int mmu_idx, uintptr_t retaddr);
 void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                unsigned size, MMUAccessType access_type,
                                int mmu_idx, MemTxAttrs attrs,
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 81b14eb219e..11d98a717f2 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -23,9 +23,6 @@ bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
-void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                  MMUAccessType access_type,
-                                  int mmu_idx, uintptr_t retaddr);
 
 const char *mips_exception_name(int32_t exception);
 
@@ -57,6 +54,9 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     MMUAccessType access_type,
                                     int mmu_idx, MemTxAttrs attrs,
                                     MemTxResult response, uintptr_t retaddr);
+void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
+                                  MMUAccessType access_type,
+                                  int mmu_idx, uintptr_t retaddr);
 void cpu_mips_tlb_flush(CPUMIPSState *env);
 
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 2ab82fdc713..aa7b5cc9e16 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -197,10 +197,11 @@ int cpu_nios2_signal_handler(int host_signum, void *pinfo, void *puc);
 void dump_mmu(CPUNios2State *env);
 void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+#ifndef CONFIG_USER_ONLY
 void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                    MMUAccessType access_type,
                                    int mmu_idx, uintptr_t retaddr);
-
+#endif
 void do_nios2_semihosting(CPUNios2State *env);
 
 #define CPU_RESOLVING_TYPE TYPE_NIOS2_CPU
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 184ba6d6b3b..40b29bda75f 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -211,10 +211,12 @@ void helper_compute_fprf_float16(CPUPPCState *env, float16 arg);
 void helper_compute_fprf_float32(CPUPPCState *env, float32 arg);
 void helper_compute_fprf_float128(CPUPPCState *env, float128 arg);
 
+#if !defined(CONFIG_USER_ONLY)
 /* Raise a data fault alignment exception for the specified virtual address */
 void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                  MMUAccessType access_type,
                                  int mmu_idx, uintptr_t retaddr);
+#endif
 
 /* translate.c */
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index aa19d8f304e..2dd66401127 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -340,9 +340,6 @@ void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                    MMUAccessType access_type, int mmu_idx,
-                                    uintptr_t retaddr);
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
@@ -354,6 +351,9 @@ void riscv_cpu_list(void);
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
+void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                    MMUAccessType access_type, int mmu_idx,
+                                    uintptr_t retaddr);
 void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      vaddr addr, unsigned size,
                                      MMUAccessType access_type,
diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index 11515bb6173..b65b2a402c3 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -269,9 +269,11 @@ bool s390_cpu_exec_interrupt(CPUState *cpu, int int_req);
 bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
+#if !defined(CONFIG_USER_ONLY)
 void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                    MMUAccessType access_type,
                                    int mmu_idx, uintptr_t retaddr);
+#endif
 
 
 /* fpu_helper.c */
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 01c43440822..e41337a101d 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -210,9 +210,6 @@ void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                    MMUAccessType access_type,
-                                    int mmu_idx, uintptr_t retaddr);
 
 void sh4_translate_init(void);
 int cpu_sh4_signal_handler(int host_signum, void *pinfo,
@@ -240,6 +237,9 @@ uint32_t cpu_sh4_read_mmaped_utlb_data(CPUSH4State *s,
                                        hwaddr addr);
 void cpu_sh4_write_mmaped_utlb_data(CPUSH4State *s, hwaddr addr,
                                     uint32_t mem_value);
+void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
+                                    MMUAccessType access_type,
+                                    int mmu_idx, uintptr_t retaddr);
 #endif
 
 int cpu_sh4_is_cached(CPUSH4State * env, target_ulong addr);
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index ff8ae73002a..60ff6306980 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -568,6 +568,11 @@ struct SPARCCPU {
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_sparc_cpu;
+
+void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
+                                                 MMUAccessType access_type,
+                                                 int mmu_idx,
+                                                 uintptr_t retaddr);
 #endif
 
 void sparc_cpu_do_interrupt(CPUState *cpu);
@@ -575,10 +580,6 @@ void sparc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                                 MMUAccessType access_type,
-                                                 int mmu_idx,
-                                                 uintptr_t retaddr);
 void cpu_raise_exception_ra(CPUSPARCState *, int, uintptr_t) QEMU_NORETURN;
 
 #ifndef NO_CPU_IO_DEFS
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index cbe9e5ff230..d08e60c673e 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -575,9 +575,6 @@ void xtensa_count_regs(const XtensaConfig *config,
                        unsigned *n_regs, unsigned *n_core_regs);
 int xtensa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                    MMUAccessType access_type,
-                                    int mmu_idx, uintptr_t retaddr);
 
 #define cpu_signal_handler cpu_xtensa_signal_handler
 #define cpu_list xtensa_cpu_list
@@ -671,6 +668,9 @@ static inline int xtensa_get_cring(const CPUXtensaState *env)
 }
 
 #ifndef CONFIG_USER_ONLY
+void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
+                                    MMUAccessType access_type,
+                                    int mmu_idx, uintptr_t retaddr);
 void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 3107f9823ef..9cd3cbeed51 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -108,6 +108,8 @@ static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
     raise_exception(env, exc, syn, target_el);
 }
 
+#if !defined(CONFIG_USER_ONLY)
+
 /* Raise a data fault alignment exception for the specified virtual address */
 void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
@@ -123,8 +125,6 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
 }
 
-#if !defined(CONFIG_USER_ONLY)
-
 /*
  * arm_cpu_do_transaction_failed: handle a memory system error response
  * (eg "no device/memory present at address") by raising an external abort
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index 20dbd673136..ae9c8e87a5a 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -271,23 +271,6 @@ hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 
     return paddr;
 }
-#endif
-
-bool mb_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
-{
-    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
-    CPUMBState *env = &cpu->env;
-
-    if ((interrupt_request & CPU_INTERRUPT_HARD)
-        && (env->msr & MSR_IE)
-        && !(env->msr & (MSR_EIP | MSR_BIP))
-        && !(env->iflags & (D_FLAG | IMM_FLAG))) {
-        cs->exception_index = EXCP_IRQ;
-        mb_cpu_do_interrupt(cs);
-        return true;
-    }
-    return false;
-}
 
 void mb_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                 MMUAccessType access_type,
@@ -316,3 +299,21 @@ void mb_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     cs->exception_index = EXCP_HW_EXCP;
     cpu_loop_exit(cs);
 }
+
+#endif
+
+bool mb_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+{
+    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
+    CPUMBState *env = &cpu->env;
+
+    if ((interrupt_request & CPU_INTERRUPT_HARD)
+        && (env->msr & MSR_IE)
+        && !(env->msr & (MSR_EIP | MSR_BIP))
+        && !(env->iflags & (D_FLAG | IMM_FLAG))) {
+        cs->exception_index = EXCP_IRQ;
+        mb_cpu_do_interrupt(cs);
+        return true;
+    }
+    return false;
+}
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index f4f15279ebe..013728e0721 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1523,7 +1523,6 @@ void helper_book3s_msgsndp(CPUPPCState *env, target_ulong rb)
     book3s_msgsnd_common(pir, PPC_INTERRUPT_DOORBELL);
 }
 #endif
-#endif
 
 void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
@@ -1540,3 +1539,5 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     env->error_code = insn & 0x03FF0000;
     cpu_loop_exit(cs);
 }
+
+#endif /* !CONFIG_USER_ONLY */
diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 22327d7d725..5097c535797 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -1957,9 +1957,7 @@ void sparc_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     sparc_raise_mmu_fault(cs, physaddr, is_write, is_exec,
                           is_asi, size, retaddr);
 }
-#endif
 
-#if !defined(CONFIG_USER_ONLY)
 void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                                  MMUAccessType access_type,
                                                  int mmu_idx,
@@ -1974,4 +1972,5 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 #endif
     cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
 }
-#endif
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.26.3


