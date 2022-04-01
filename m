Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1naGsg-0007VZ-4Q
	for mharc-qemu-riscv@gnu.org; Fri, 01 Apr 2022 08:59:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naGsf-0007Sc-1U
 for qemu-riscv@nongnu.org; Fri, 01 Apr 2022 08:59:57 -0400
Received: from [2607:f8b0:4864:20::229] (port=39699
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naGsd-00037i-7f
 for qemu-riscv@nongnu.org; Fri, 01 Apr 2022 08:59:56 -0400
Received: by mail-oi1-x229.google.com with SMTP id j83so2725468oih.6
 for <qemu-riscv@nongnu.org>; Fri, 01 Apr 2022 05:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=remv68tyTQNbr4dsFhIspC7nRXHKrJg5z69/YnKTiFc=;
 b=kRVYuJIs+8mWT6jCkkkDH+qRo2vQYrYAmaOEacIkKWEAT0G7DpBxA6U/nCPYq5TYmL
 dP5vwQFNQ6cHeD3wmDwsOyzXxkPwLHCKoHz2cNBeVm0aIzXYDyYB9qeqGw7qmCPVJBGT
 xLI62D4Q8k1nCkpaX/4GGa3nVudKq4QNE5uje2AJhzAEdKd/YgbjLnVNFN1qv4rKL7s7
 lUyxu5INQ0zwVsqlAhP12LYzfL+fBk0NDULmeg0PLMioFzMcMiP76p91yvvCkxaw/x6m
 B11tIkAsjgj/UshtmdJce36o/c7RIx9pbaEXs+p+ezh8AdRLjCqH53JVUlmMKbTNtzFO
 Rkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=remv68tyTQNbr4dsFhIspC7nRXHKrJg5z69/YnKTiFc=;
 b=MWc5770iIh2e6Sh+Yggb+Ls2RLjBrz+XWHvUSYwIf6Olt8C8RgBXjHuJqshaTEpZN/
 shJL8cQ8tIiWrsVIc5REmSVc8hChNfVS5WacfzlAZHgMtrToKlLQ4PGiDissOl7b8B42
 1tLzHPkffxJNpWFqe+FEJsK28gae0+fLcuy3KhL/eqOTCsn7hTtoDoWe6C9pBz9GuZjs
 rlKnc9NfVdoTwM9QBQMLOpv144/a1biTaKVH3kI5mH3+6JEoKbEH0kwTJH56szRmsW6b
 hT6UKC+gER8UWJpWX4kmzL9BAgFqthNGCGFNX6rb4qpwQAjsetTc1CE7VMRpdazb9X0Z
 WwfA==
X-Gm-Message-State: AOAM533ErTKQMyNZSNVv1DuK/Gf7J2aXwetMMie1M2x//5/GgdwyqdMl
 tCk3f2oEoU8mKqrRiOVEcC+XKA==
X-Google-Smtp-Source: ABdhPJwnQp/Fajbrf8K7FM2oVslwCFZ9NDK2kAT+/nsoW0Pu53RUrYYZZ4h2WncuLA4wTw+mOvP6yA==
X-Received: by 2002:a54:4092:0:b0:2d9:4715:dadf with SMTP id
 i18-20020a544092000000b002d94715dadfmr4563019oii.151.1648817994085; 
 Fri, 01 Apr 2022 05:59:54 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 h6-20020a9d7986000000b005ce0d5433cdsm1066665otm.15.2022.04.01.05.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 05:59:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, palmer@dabbelt.com,
 bin.meng@windriver.com
Subject: [PATCH 2/2] target/riscv: Mark amo insns during translation
Date: Fri,  1 Apr 2022 06:59:48 -0600
Message-Id: <20220401125948.79292-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401125948.79292-1-richard.henderson@linaro.org>
References: <20220401125948.79292-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 01 Apr 2022 12:59:57 -0000

Atomic memory operations perform both reads and writes as part
of their implementation, but always raise write faults.

Use TARGET_INSN_START_EXTRA_WORDS to mark amo insns in the
opcode stream, and force the access type to write at the
point of raising the exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h                      | 15 ++++++
 target/riscv/cpu.c                      |  3 ++
 target/riscv/cpu_helper.c               | 62 +++++++++++++++++--------
 target/riscv/translate.c                |  9 ++++
 target/riscv/insn_trans/trans_rva.c.inc | 11 ++++-
 5 files changed, 79 insertions(+), 21 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c069fe85fa..3de4da3fa1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -290,6 +290,13 @@ struct CPUArchState {
     /* True if in debugger mode.  */
     bool debugger;
 
+    /*
+     * True if unwinding through an amo insn.  Used to transform a
+     * read fault into a store_amo fault; only valid immediately
+     * after cpu_restore_state().
+     */
+    bool unwind_amo;
+
     /*
      * CSRs for PointerMasking extension
      */
@@ -517,6 +524,14 @@ FIELD(TB_FLAGS, XL, 20, 2)
 FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
 FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
 
+#ifndef CONFIG_USER_ONLY
+/*
+ * RISC-V-specific extra insn start words:
+ * 1: True if the instruction is AMO, false otherwise.
+ */
+#define TARGET_INSN_START_EXTRA_WORDS 1
+#endif
+
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
 #else
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..3818d5ba80 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -396,6 +396,9 @@ void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
     } else {
         env->pc = data[0];
     }
+#ifndef CONFIG_USER_ONLY
+    env->unwind_amo = data[1];
+#endif
 }
 
 static void riscv_cpu_reset(DeviceState *dev)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 126251d5da..b5bbe6fc39 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1139,26 +1139,11 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
 
-    if (access_type == MMU_DATA_STORE) {
-        cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
-    } else if (access_type == MMU_DATA_LOAD) {
-        cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
-    } else {
-        cs->exception_index = RISCV_EXCP_INST_ACCESS_FAULT;
+    cpu_restore_state(cs, retaddr, true);
+    if (env->unwind_amo) {
+        access_type = MMU_DATA_STORE;
     }
 
-    env->badaddr = addr;
-    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
-                            riscv_cpu_two_stage_lookup(mmu_idx);
-    cpu_loop_exit_restore(cs, retaddr);
-}
-
-void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                   MMUAccessType access_type, int mmu_idx,
-                                   uintptr_t retaddr)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
     switch (access_type) {
     case MMU_INST_FETCH:
         cs->exception_index = RISCV_EXCP_INST_ADDR_MIS;
@@ -1172,10 +1157,43 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     default:
         g_assert_not_reached();
     }
+
     env->badaddr = addr;
     env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
-    cpu_loop_exit_restore(cs, retaddr);
+    cpu_loop_exit(cs);
+}
+
+void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                   MMUAccessType access_type, int mmu_idx,
+                                   uintptr_t retaddr)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
+    cpu_restore_state(cs, retaddr, true);
+    if (env->unwind_amo) {
+        access_type = MMU_DATA_STORE;
+    }
+
+    switch (access_type) {
+    case MMU_INST_FETCH:
+        cs->exception_index = RISCV_EXCP_INST_ADDR_MIS;
+        break;
+    case MMU_DATA_LOAD:
+        cs->exception_index = RISCV_EXCP_LOAD_ADDR_MIS;
+        break;
+    case MMU_DATA_STORE:
+        cs->exception_index = RISCV_EXCP_STORE_AMO_ADDR_MIS;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    env->badaddr = addr;
+    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
+                            riscv_cpu_two_stage_lookup(mmu_idx);
+    cpu_loop_exit(cs);
 }
 
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
@@ -1307,11 +1325,15 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else if (probe) {
         return false;
     } else {
+        cpu_restore_state(cs, retaddr, true);
+        if (env->unwind_amo) {
+            access_type = MMU_DATA_STORE;
+        }
         raise_mmu_exception(env, address, access_type, pmp_violation,
                             first_stage_error,
                             riscv_cpu_virt_enabled(env) ||
                                 riscv_cpu_two_stage_lookup(mmu_idx));
-        cpu_loop_exit_restore(cs, retaddr);
+        cpu_loop_exit(cs);
     }
 
     return true;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index fac998a6b5..ae4b0d1524 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -107,6 +107,10 @@ typedef struct DisasContext {
     /* PointerMasking extension */
     bool pm_mask_enabled;
     bool pm_base_enabled;
+#ifndef CONFIG_USER_ONLY
+    /* TCG op of the current insn_start.  */
+    TCGOp *insn_start;
+#endif
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -1105,7 +1109,12 @@ static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
+#ifdef CONFIG_USER_ONLY
     tcg_gen_insn_start(ctx->base.pc_next);
+#else
+    tcg_gen_insn_start(ctx->base.pc_next, 0);
+    ctx->insn_start = tcg_last_op();
+#endif
 }
 
 static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index 45db82c9be..66faa8f1da 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -37,6 +37,13 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
     return true;
 }
 
+static void record_insn_start_amo(DisasContext *ctx)
+{
+#ifndef CONFIG_USER_ONLY
+    tcg_set_insn_start_param(ctx->insn_start, 1, 1);
+#endif
+}
+
 static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
     TCGv dest, src1, src2;
@@ -73,6 +80,7 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
      */
     tcg_gen_movi_tl(load_res, -1);
 
+    record_insn_start_amo(ctx);
     return true;
 }
 
@@ -85,8 +93,9 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
     TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
 
     func(dest, src1, src2, ctx->mem_idx, mop);
-
     gen_set_gpr(ctx, a->rd, dest);
+
+    record_insn_start_amo(ctx);
     return true;
 }
 
-- 
2.25.1


