Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ECAC43602
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:08:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welG3-0005oS-Bz; Tue, 30 Jun 2026 23:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFr-0005fe-8w
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:04:51 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFn-0002n9-WC
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:04:50 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2c9ed0c7fc7so1216425ad.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875086; x=1783479886; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zxQz3A5cSSHlQV/FJFFLwzuhdIbJxyset0vnu8TQPN0=;
 b=boqij1oDtr5aeBat0kEu2rvZrVLcatX3oLPUpOSgxcPhypF0U6tjzq08U4hVtq2zKd
 +Mvhf/W8/7lCKsK2ry8sKVTgEq7/KZA5+pUkPFEJSKuYVgLxTCVgUVVgrKE7cA5Y3exM
 UntB34cFFjnmt2ZoCZv/EFQKj58mv6vsqqYfHe1ONubE3pFfY8+v201OC59yAWFjBAGY
 M0ipMhvuvYHETzZGO3OGwnwd1Yr7DVdNDo/m2oSBGOgJH3LNxWTVqB0A24oiq+NBnkp1
 4TX5lFXlIOhVPBRf2od+fPXpF2cJ1wo4Vkp+t3EFmK67nzIKDE1dsKbmOA2AzBAM582j
 zryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875086; x=1783479886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zxQz3A5cSSHlQV/FJFFLwzuhdIbJxyset0vnu8TQPN0=;
 b=aT2PP65lbXAkShNgNMB85NfxIXGIUZWO3CxXpX//HZ+7FVa+IqiY0nl0Wqm3QALvjE
 f6EK0C3oWl/DERgg5RwmhRswX/n4BqsoI6wRdqhOWFzknVu6w76NTnzSTBmgsPxcaKl0
 i1CTshQs4/kyd+TsBNH99eGIMtXfh3pGJQmAuBSou+7DTEd8fQv9H7V2PYvwfEiHS1Fy
 6/9ymqLiaf1cS4xkQ0NsOwTog9TiRqSoixCs//PbX+GRTaNO7O+3rLMNx6UXFjJ7gvWP
 ttNoavBmt2deS2fDnRgTrloceK8VqEUCrOx+5BLT1tnm84sl+dYFu6fuiDw/BufSMfn7
 uSyQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrgvrZnlTg+eJUbkUby5CmclzF9oVau5wSX37t4Neo5rRKqzLWf6GkwWVYYXQVariZpjlBJYA4vPj8s@nongnu.org
X-Gm-Message-State: AOJu0YxOzVxRu1Q8eJdFoxfI3Evjcm818lmyN4/JDW1YEe2JJ5JFk/0e
 vnd4ZCcDsv/m4quXwMEYTmW47JE9+cZDocsFKCsaV4PKhf5MEGIkpokM4bDmghQFyBk=
X-Gm-Gg: AfdE7clI8tXR3JFTWuChOTiTluItGW6+adCyK8lYm0ZzHjDxBG5bIIWifv3pYuVoS43
 O8hf9uZZoQQ1W+d6R4GPKAloHSFjdvT9dolvW5VaCp+7TISOa17vV8lmkAlwnqg3BOoUzjaZMWP
 NOQOPlmy0oJjhEQB9CROaZHGULsOBLQAss26JYM1fAo2s82MPTHumSyB9dBAKwWWwh+gmgYsui2
 Z9e0RZuPK3liICrKKi74wUeO1zAq500BTPY9ioV5asljFP0r+1AOzQJ3wfyGqgHGHsEyi9HyeQc
 hZYP84OzH2VLArl5tmssavGuSa3StHQRa+0dIkSo681G62M5Rswfc4oCUojcRa5jPK3HSTTUl1i
 B1+hvs924MNnB+sFX5nkDs0np/4/nJ9TiihKf9WpoSt54Zchq1K5Frv5ESrrimK3Om/+i0JDiRZ
 Ql5q/+/vSsE8tr91o4oGCG67h97Py8+l7NTg/lyZ2J3DeDmKRXMw==
X-Received: by 2002:a17:902:ef09:b0:2c9:ae0b:61e3 with SMTP id
 d9443c01a7336-2ca5a52fceemr27719335ad.2.1782875086020; 
 Tue, 30 Jun 2026 20:04:46 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 01/17] accel/tcg: Pass CPUBreakpoint to debug_check_breakpoint
Date: Tue, 30 Jun 2026 20:04:27 -0700
Message-ID: <20260701030443.1382447-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

For 3 of the 4 targets that use this hook, add the argument
and ignore it so far.  For riscv, drop the loop over all
breakpoints and use the new argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/accel/tcg/cpu-ops.h  |  2 +-
 target/arm/internals.h       |  2 +-
 target/ppc/internal.h        |  2 +-
 target/riscv/debug.h         |  2 +-
 target/xtensa/cpu.h          |  2 +-
 accel/tcg/cpu-exec.c         |  2 +-
 target/arm/tcg/debug.c       |  2 +-
 target/i386/tcg/tcg-cpu.c    |  2 +-
 target/ppc/tcg-excp_helper.c |  2 +-
 target/riscv/debug.c         | 55 +++++++++++++++++-------------------
 target/xtensa/dbg_helper.c   |  2 +-
 11 files changed, 36 insertions(+), 39 deletions(-)

diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
index 710da12b82..d2b9079835 100644
--- a/include/accel/tcg/cpu-ops.h
+++ b/include/accel/tcg/cpu-ops.h
@@ -265,7 +265,7 @@ struct TCGCPUOps {
      * @debug_check_breakpoint: return true if the architectural
      * breakpoint whose PC has matched should really fire.
      */
-    bool (*debug_check_breakpoint)(CPUState *cpu);
+    bool (*debug_check_breakpoint)(CPUState *cpu, const CPUBreakpoint *bp);
 
     /**
      * @io_recompile_replay_branch: Callback for cpu_io_recompile.
diff --git a/target/arm/internals.h b/target/arm/internals.h
index fcce3804f3..c78c86a1fc 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -680,7 +680,7 @@ void hw_breakpoint_update(ARMCPU *cpu, int n);
 void hw_breakpoint_update_all(ARMCPU *cpu);
 
 /* Callback function for checking if a breakpoint should trigger. */
-bool arm_debug_check_breakpoint(CPUState *cs);
+bool arm_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp);
 
 /* Callback function for checking if a watchpoint should trigger. */
 bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index a3bb12afd9..f3e694c4cd 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -304,7 +304,7 @@ void ppc_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                    int mmu_idx, MemTxAttrs attrs,
                                    MemTxResult response, uintptr_t retaddr);
 void ppc_cpu_debug_excp_handler(CPUState *cs);
-bool ppc_cpu_debug_check_breakpoint(CPUState *cs);
+bool ppc_cpu_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp);
 bool ppc_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
 
 G_NORETURN void powerpc_checkstop(CPUPPCState *env, const char *reason);
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 55a3ac72e6..91690404df 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -144,7 +144,7 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val);
 target_ulong tinfo_csr_read(CPURISCVState *env);
 
 void riscv_cpu_debug_excp_handler(CPUState *cs);
-bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
+bool riscv_cpu_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp);
 bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
 
 void riscv_trigger_realize(CPURISCVState *env);
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 442e98bd1b..9323f45e4b 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -591,7 +591,7 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
 hwaddr xtensa_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
-bool xtensa_debug_check_breakpoint(CPUState *cs);
+bool xtensa_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp);
 #endif
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 void xtensa_count_regs(const XtensaConfig *config,
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 9c754b0365..66ec656861 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -328,7 +328,7 @@ static bool check_for_breakpoints_slow(CPUState *cpu, vaddr pc,
 #else
                 const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
                 assert(tcg_ops->debug_check_breakpoint);
-                match_bp = tcg_ops->debug_check_breakpoint(cpu);
+                match_bp = tcg_ops->debug_check_breakpoint(cpu, bp);
 #endif
             }
 
diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index 07a52643e7..565af7b985 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -373,7 +373,7 @@ static bool check_watchpoints(ARMCPU *cpu)
     return false;
 }
 
-bool arm_debug_check_breakpoint(CPUState *cs)
+bool arm_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 6f5dc06b3b..ee534f0a15 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -132,7 +132,7 @@ static int x86_cpu_mmu_index(CPUState *cs, bool ifetch)
 }
 
 #ifndef CONFIG_USER_ONLY
-static bool x86_debug_check_breakpoint(CPUState *cs)
+static bool x86_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
diff --git a/target/ppc/tcg-excp_helper.c b/target/ppc/tcg-excp_helper.c
index b04f07a637..7715cae342 100644
--- a/target/ppc/tcg-excp_helper.c
+++ b/target/ppc/tcg-excp_helper.c
@@ -331,7 +331,7 @@ void ppc_cpu_debug_excp_handler(CPUState *cs)
 #endif
 }
 
-bool ppc_cpu_debug_check_breakpoint(CPUState *cs)
+bool ppc_cpu_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp)
 {
 #if defined(TARGET_PPC64)
     CPUPPCState *env = cpu_env(cs);
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 30d39ee5cd..1acec77caa 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -939,47 +939,44 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
     }
 }
 
-bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
+bool riscv_cpu_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    CPUBreakpoint *bp;
     target_ulong ctrl;
     target_ulong pc;
     int trigger_type;
     int i;
 
-    QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-        for (i = 0; i < RV_MAX_TRIGGERS; i++) {
-            trigger_type = get_trigger_type(env, i);
+    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
+        trigger_type = get_trigger_type(env, i);
 
-            if (!trigger_common_match(env, trigger_type, i)) {
-                continue;
+        if (!trigger_common_match(env, trigger_type, i)) {
+            continue;
+        }
+
+        switch (trigger_type) {
+        case TRIGGER_TYPE_AD_MATCH:
+            ctrl = env->tdata1[i];
+            pc = env->tdata2[i];
+
+            if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
+                env->badaddr = pc;
+                return true;
             }
+            break;
+        case TRIGGER_TYPE_AD_MATCH6:
+            ctrl = env->tdata1[i];
+            pc = env->tdata2[i];
 
-            switch (trigger_type) {
-            case TRIGGER_TYPE_AD_MATCH:
-                ctrl = env->tdata1[i];
-                pc = env->tdata2[i];
-
-                if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
-                    env->badaddr = pc;
-                    return true;
-                }
-                break;
-            case TRIGGER_TYPE_AD_MATCH6:
-                ctrl = env->tdata1[i];
-                pc = env->tdata2[i];
-
-                if ((ctrl & TYPE6_EXEC) && (bp->pc == pc)) {
-                    env->badaddr = pc;
-                    return true;
-                }
-                break;
-            default:
-                /* other trigger types are not supported or irrelevant */
-                break;
+            if ((ctrl & TYPE6_EXEC) && (bp->pc == pc)) {
+                env->badaddr = pc;
+                return true;
             }
+            break;
+        default:
+            /* other trigger types are not supported or irrelevant */
+            break;
         }
     }
 
diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index 3b91f7c38a..3d1143ad5e 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -64,7 +64,7 @@ void HELPER(wsr_ibreaka)(CPUXtensaState *env, uint32_t i, uint32_t v)
     env->sregs[IBREAKA + i] = v;
 }
 
-bool xtensa_debug_check_breakpoint(CPUState *cs)
+bool xtensa_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp)
 {
     CPUXtensaState *env = cpu_env(cs);
     unsigned int i;
-- 
2.43.0


