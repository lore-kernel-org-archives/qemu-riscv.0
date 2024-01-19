Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ABEC47DAF
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:44:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQn9v-0001jR-QG; Fri, 19 Jan 2024 06:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9s-0001gV-Cq
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:35:36 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9p-0007ny-5c
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:35:36 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e5afc18f5so7080985e9.3
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664131; x=1706268931; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JMrQlur1rdNDznxBbxffE0eHdXnWue3lFnhNe5G+YeM=;
 b=oRZli/WQCod48AruckfvcALEqBX1COn+q0g4lucifHW0/bmTH0gqDrtsq8S3qvfYeA
 oLvqpJN/xZP1D7QTWwpXObtVytj6p4J7SCkx6ZJnj96GZTJfoy7L/eitDmtwxR58tANa
 8WMUh4xs/chUleOH+F5scW5V5hPLDefu+1d9lF8Psnpb6XkiQJX7rKYEH9dRkO6dMh2W
 +eGkymz6nVTA0X9CvjHNkVwoIdZPf71AEJHkPQk55ZfUBTOLJcRgv8dFntqOVRO++GPC
 oFP74sNKJp2PzuNvP4dxNke9RMTfUnDZZFejfMYAL7zYg9sOe3EzPOuFUZ7IXflo5N5H
 bSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664131; x=1706268931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JMrQlur1rdNDznxBbxffE0eHdXnWue3lFnhNe5G+YeM=;
 b=EB+vSSWoIU/2YNTm3RZgb0rVLveF1TGwRCnONnSuZMflR5LORcUwJRZ2mRLrg8QQUN
 6VhDx1gaVeeTUZb7+1FSeJ2AyeyryUks8plIEkQQf9lyEEZevgmtFvJkE2ko6fvkQMap
 bZLvdlURYb0khdkN6O5P2EtzAdYCS0NvrJo4bCk3i165PU1z06J83WN7AQCBUhi74+we
 KBHtMHXWPu/k2zHTq31iYBnUp5EUpq//X3k6Kxtj69cN3YIpcFXFhdJZqqYuPqIH/o8l
 4PoxvwgA9jEfm5fXvvz3alWUEwlaB1OxTBC8CC9+820creXvJ/qlTOTZw2pJu1OPDrUU
 a3pg==
X-Gm-Message-State: AOJu0YyYUgyXaTtZ4XAnVDHUSL7wXj3Ft4Ok4FjT2KAKjQBdYL0c9+ya
 x0CGtO1t42URU9tPI2h3qq2iVV7cTq7j+xnKDLvk08mhB78rxsG/fLbV5umiGEw=
X-Google-Smtp-Source: AGHT+IHXwLEr/a6UENRrYaD362ImuRSNy+JwCzoG2DcOb6zwj1LR21EyCD7qzjXtJQaIOZf9zvtMLQ==
X-Received: by 2002:a7b:cc82:0:b0:40e:657c:5c88 with SMTP id
 p2-20020a7bcc82000000b0040e657c5c88mr1414364wma.28.1705664131605; 
 Fri, 19 Jan 2024 03:35:31 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 l34-20020a05600c1d2200b0040e89ade84bsm8335292wms.4.2024.01.19.03.35.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:35:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/36] target/xtensa: use generic instruction breakpoint
 infrastructure
Date: Fri, 19 Jan 2024 12:34:34 +0100
Message-ID: <20240119113507.31951-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Max Filippov <jcmvbkbc@gmail.com>

Don't embed ibreak exception generation into TB and don't invalidate TB
on ibreak address change. Add CPUBreakpoint pointers to xtensa
CPUArchState, use cpu_breakpoint_insert/cpu_breakpoint_remove_by_ref to
manage ibreak breakpoints and provide TCGCPUOps::debug_check_breakpoint
callback that recognizes valid instruction breakpoints.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231130171920.3798954-2-jcmvbkbc@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/xtensa/cpu.h        |  4 ++++
 target/xtensa/cpu.c        |  1 +
 target/xtensa/dbg_helper.c | 46 +++++++++++++++++++++++++-------------
 target/xtensa/helper.c     | 12 ++++++++++
 target/xtensa/translate.c  | 17 --------------
 5 files changed, 47 insertions(+), 33 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index d9c49a35fa..4b033ee924 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -229,6 +229,7 @@ enum {
 #define MAX_NCCOMPARE 3
 #define MAX_TLB_WAY_SIZE 8
 #define MAX_NDBREAK 2
+#define MAX_NIBREAK 2
 #define MAX_NMEMORY 4
 #define MAX_MPU_FOREGROUND_SEGMENTS 32
 
@@ -547,6 +548,8 @@ struct CPUArchState {
 
     /* Watchpoints for DBREAK registers */
     struct CPUWatchpoint *cpu_watchpoint[MAX_NDBREAK];
+    /* Breakpoints for IBREAK registers */
+    struct CPUBreakpoint *cpu_breakpoint[MAX_NIBREAK];
 };
 
 /**
@@ -590,6 +593,7 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+bool xtensa_debug_check_breakpoint(CPUState *cs);
 #endif
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 void xtensa_count_regs(const XtensaConfig *config,
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 93e782a6e0..99c0ca130f 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -233,6 +233,7 @@ static const struct TCGCPUOps xtensa_tcg_ops = {
     .do_interrupt = xtensa_cpu_do_interrupt,
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
     .do_unaligned_access = xtensa_cpu_do_unaligned_access,
+    .debug_check_breakpoint = xtensa_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index 3e0c9e8e8b..497dafca71 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -33,27 +33,21 @@
 #include "exec/exec-all.h"
 #include "exec/address-spaces.h"
 
-static void tb_invalidate_virtual_addr(CPUXtensaState *env, uint32_t vaddr)
-{
-    uint32_t paddr;
-    uint32_t page_size;
-    unsigned access;
-    int ret = xtensa_get_physical_addr(env, false, vaddr, 2, 0,
-                                       &paddr, &page_size, &access);
-    if (ret == 0) {
-        tb_invalidate_phys_addr(&address_space_memory, paddr,
-                                MEMTXATTRS_UNSPECIFIED);
-    }
-}
-
 void HELPER(wsr_ibreakenable)(CPUXtensaState *env, uint32_t v)
 {
+    CPUState *cs = env_cpu(env);
     uint32_t change = v ^ env->sregs[IBREAKENABLE];
     unsigned i;
 
     for (i = 0; i < env->config->nibreak; ++i) {
         if (change & (1 << i)) {
-            tb_invalidate_virtual_addr(env, env->sregs[IBREAKA + i]);
+            if (v & (1 << i)) {
+                cpu_breakpoint_insert(cs, env->sregs[IBREAKA + i],
+                                      BP_CPU, &env->cpu_breakpoint[i]);
+            } else {
+                cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[i]);
+                env->cpu_breakpoint[i] = NULL;
+            }
         }
     }
     env->sregs[IBREAKENABLE] = v & ((1 << env->config->nibreak) - 1);
@@ -62,12 +56,32 @@ void HELPER(wsr_ibreakenable)(CPUXtensaState *env, uint32_t v)
 void HELPER(wsr_ibreaka)(CPUXtensaState *env, uint32_t i, uint32_t v)
 {
     if (env->sregs[IBREAKENABLE] & (1 << i) && env->sregs[IBREAKA + i] != v) {
-        tb_invalidate_virtual_addr(env, env->sregs[IBREAKA + i]);
-        tb_invalidate_virtual_addr(env, v);
+        CPUState *cs = env_cpu(env);
+
+        cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[i]);
+        cpu_breakpoint_insert(cs, v, BP_CPU, &env->cpu_breakpoint[i]);
     }
     env->sregs[IBREAKA + i] = v;
 }
 
+bool xtensa_debug_check_breakpoint(CPUState *cs)
+{
+    XtensaCPU *cpu = XTENSA_CPU(cs);
+    CPUXtensaState *env = &cpu->env;
+    unsigned int i;
+
+    if (xtensa_get_cintlevel(env) >= env->config->debug_level) {
+        return false;
+    }
+    for (i = 0; i < env->config->nibreak; ++i) {
+        if (env->sregs[IBREAKENABLE] & (1 << i) &&
+            env->sregs[IBREAKA + i] == env->pc) {
+            return true;
+        }
+    }
+    return false;
+}
+
 static void set_dbreak(CPUXtensaState *env, unsigned i, uint32_t dbreaka,
         uint32_t dbreakc)
 {
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index f6632df646..a9f8907083 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -231,6 +231,18 @@ void xtensa_breakpoint_handler(CPUState *cs)
             }
             cpu_loop_exit_noexc(cs);
         }
+    } else {
+        if (cpu_breakpoint_test(cs, env->pc, BP_GDB)
+            || !cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
+            return;
+        }
+        if (env->sregs[ICOUNT] == 0xffffffff &&
+            xtensa_get_cintlevel(env) < env->sregs[ICOUNTLEVEL]) {
+            debug_exception_env(env, DEBUGCAUSE_IC);
+        } else {
+            debug_exception_env(env, DEBUGCAUSE_IB);
+        }
+        cpu_loop_exit_noexc(cs);
     }
 }
 
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index de89940599..87947236ca 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1123,19 +1123,6 @@ static inline unsigned xtensa_insn_len(CPUXtensaState *env, DisasContext *dc)
     return xtensa_op0_insn_len(dc, b0);
 }
 
-static void gen_ibreak_check(CPUXtensaState *env, DisasContext *dc)
-{
-    unsigned i;
-
-    for (i = 0; i < dc->config->nibreak; ++i) {
-        if ((env->sregs[IBREAKENABLE] & (1 << i)) &&
-                env->sregs[IBREAKA + i] == dc->pc) {
-            gen_debug_exception(dc, DEBUGCAUSE_IB);
-            break;
-        }
-    }
-}
-
 static void xtensa_tr_init_disas_context(DisasContextBase *dcbase,
                                          CPUState *cpu)
 {
@@ -1205,10 +1192,6 @@ static void xtensa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         gen_set_label(label);
     }
 
-    if (dc->debug) {
-        gen_ibreak_check(env, dc);
-    }
-
     disas_xtensa_insn(env, dc);
 
     if (dc->icount) {
-- 
2.41.0


