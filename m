Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636DEC43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:41:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEcw-0005wK-OH; Sun, 05 Jul 2026 00:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbz-0004p0-K1
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:37:48 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbp-000463-S2
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:37:47 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2ca64c3ce5fso19727205ad.3
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226256; x=1783831056; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kHfau4YAcmPwUY5i+Nd6cddxSXFTpZS2b7EPY21CGqE=;
 b=y0tHFnZoIPmEoGLxe1cA/4B2WLCbgII+DFCLsoxKrxcCS5kwIiJqGj3fxjAZbVahZh
 Nvza1m3PqZPMgx09BwXhwozjZeAW37IAiksqSBWim5/Dz7BWNELUOHDHvWfJkl0XLtHL
 D4jPiFadRctG0rGVtIyi/0TeCFdxAmGBXPfk00tR3A9EnKs73AmN58v6wfwjG+HOvp73
 9cMoReIgxxS+sACGVoT8fYQ9B6ArvcYEHunYjCnHWdiEA6JoDjHEhwqeWhzHe74gvqA0
 n+yvJ0yX2ejREBanK4irDwbs2ceGdkr81rNXj1H15IOyeCv/+n+sGOQEbexkqKmpSX7j
 2IxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226256; x=1783831056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kHfau4YAcmPwUY5i+Nd6cddxSXFTpZS2b7EPY21CGqE=;
 b=fi8rxcYVgnoZ5JU6JI8INQ8NwyY2ADw7WYzMMwnSTjB4jw6vKUwyzLOCX84FZSK1YK
 2Fc/asMCDiA6NZKzY85HHhVWAmsoregiUGMHN+YIPPYiETVEvcc6TbI9PVj6jw53wtv8
 qgupBU9hgRzUVV3Rs9BwnAguEE/Nq9hZefRjm4d8tJfT/eTBjiJKGvrn58baTcPsuSSU
 xG9n8llmixbFoMLCpTbHI8WRuURtY2vCgq+j5AB0PJ1XcW2+RPXboYXL0/T88C5+hhNT
 TeNkVI7XjE7Tn4MS9YV+qJCjEBztTtwZL5Oc77wIPzWRRrhkU1EnyYrtXDzx3bfsCRmy
 QXhQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqv6+P67boCjvmnMs1wNq0OiDDPKTFVdP/Hv+dSvD6bxVyTlgmAI356z+j7YcPlHi4ZE0/yZEnYuNg6@nongnu.org
X-Gm-Message-State: AOJu0YyeUSTSkgBdTe8F+ZKkMuXPOwygrGOeQzhAzsRJaIGM+i/r9gpO
 lWVETNJPZQPbEz1Vg2PxKXSfowbqM+uXl2M3pN1nSoIUZ6alaCAhWXw0o/zrS5iKTDE=
X-Gm-Gg: AfdE7cnmukz/bcyFaRvtytj2jMyP3qYoS3Bk0Wbg0qRUKNlx+pO6lqrO/RbDUbzyOP4
 ++vSS11paoN7ye+SjIDrnUVlfgtFaRrbagfdtLcV0L/s0ZOqVeqXgRMuqAcnvHnXGeyQyp/kYza
 oY9fcP8DVimLlJUi9uPjQU0FCvYFjKaTJD8N+0b8WBzvqPXPM6c+34svtXS1T09YnNmCPyHGp4o
 9xjl7ILDx5NgKdp4bFan0vNfn+MAs1Zp3z5MuVFn83IT+W4sQxwK5xuACb807SGEtgrrs5QSJQ4
 YwcnxX0Ex49hJC4Lx5B41t0jOmuv9qP9uYWHeVFNZGnSRePnT5MhbXb+5A9SGkVbqlDWCFaqlQp
 D5sH5g/Q4x6fjZFJf8Z0SLri1KVUDGa6h3zgD4pZwhglSlRGUP4tsL7mDFoGKEYjIOTQRqAKRL8
 KYkAIJA5vk7xCkRPOQrtx9pqN3ZFW032OB8PO+L+i06ovSZUzUWMN8yCe42A==
X-Received: by 2002:a17:902:f745:b0:2ca:d874:c6cf with SMTP id
 d9443c01a7336-2cb97e47abbmr51333105ad.4.1783226256309; 
 Sat, 04 Jul 2026 21:37:36 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 10/46] exec/breakpoint: Add CPUBreakpoint.id
Date: Sat,  4 Jul 2026 21:36:49 -0700
Message-ID: <20260705043725.1373137-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Add an identifier for use by targets with BP_CPU.  For all targets
the index of the hardware breakpoint resource is to hand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/breakpoint.h           | 3 ++-
 accel/tcg/tcg-accel-ops.c           | 2 +-
 cpu-common.c                        | 3 ++-
 gdbstub/user.c                      | 2 +-
 linux-user/main.c                   | 2 +-
 target/arm/tcg/debug.c              | 2 +-
 target/i386/tcg/system/bpt_helper.c | 2 +-
 target/ppc/cpu.c                    | 2 +-
 target/riscv/debug.c                | 5 +++--
 target/xtensa/dbg_helper.c          | 4 ++--
 10 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index 1a3391ac09..b22b6dabf2 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -30,6 +30,7 @@ typedef int BreakpointFlags;
 struct CPUBreakpoint {
     vaddr pc;
     BreakpointFlags flags;
+    unsigned id;
     QTAILQ_ENTRY(CPUBreakpoint) entry;
 };
 
@@ -43,7 +44,7 @@ struct CPUWatchpoint {
 };
 
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
-                          CPUBreakpoint **breakpoint);
+                          unsigned id, CPUBreakpoint **breakpoint);
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, BreakpointFlags flags);
 void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint);
 void cpu_breakpoint_remove_all(CPUState *cpu, BreakpointFlags mask);
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 5c30a7be88..44bc5faf08 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -141,7 +141,7 @@ static int tcg_insert_breakpoint(CPUState *cs, int type, vaddr addr, vaddr len)
     case GDB_BREAKPOINT_SW:
     case GDB_BREAKPOINT_HW:
         CPU_FOREACH(cpu) {
-            err = cpu_breakpoint_insert(cpu, addr, BP_GDB, NULL);
+            err = cpu_breakpoint_insert(cpu, addr, BP_GDB, 0, NULL);
             if (err) {
                 break;
             }
diff --git a/cpu-common.c b/cpu-common.c
index af64bb1126..9476bb612a 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -406,7 +406,7 @@ bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, BreakpointFlags mask)
 
 /* Add a breakpoint.  */
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
-                          CPUBreakpoint **breakpoint)
+                          unsigned id, CPUBreakpoint **breakpoint)
 {
     CPUBreakpoint *bp;
 
@@ -418,6 +418,7 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
 
     bp->pc = pc;
     bp->flags = flags;
+    bp->id = id;
 
     /* keep all GDB-injected breakpoints in front */
     if (flags & BP_GDB) {
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 05fe18f906..abcb2ec5f0 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -812,7 +812,7 @@ int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len)
     case GDB_BREAKPOINT_SW:
     case GDB_BREAKPOINT_HW:
         CPU_FOREACH(cpu) {
-            err = cpu_breakpoint_insert(cpu, addr, BP_GDB, NULL);
+            err = cpu_breakpoint_insert(cpu, addr, BP_GDB, 0, NULL);
             if (err) {
                 break;
             }
diff --git a/linux-user/main.c b/linux-user/main.c
index c08c73fd80..83b9c88ac4 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -260,7 +260,7 @@ CPUArchState *cpu_copy(CPUArchState *env)
        BP_CPU break/watchpoints are handled correctly on clone. */
     QTAILQ_INIT(&new_cpu->breakpoints);
     QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-        cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
+        cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, 0, NULL);
     }
 
     return new_env;
diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index f245d5b072..73d694ca4f 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -726,7 +726,7 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
         return;
     }
 
-    cpu_breakpoint_insert(CPU(cpu), addr, flags, &env->cpu_breakpoint[n]);
+    cpu_breakpoint_insert(CPU(cpu), addr, flags, n, &env->cpu_breakpoint[n]);
 }
 
 void hw_breakpoint_update_all(ARMCPU *cpu)
diff --git a/target/i386/tcg/system/bpt_helper.c b/target/i386/tcg/system/bpt_helper.c
index 0ba2f01016..d847d77d71 100644
--- a/target/i386/tcg/system/bpt_helper.c
+++ b/target/i386/tcg/system/bpt_helper.c
@@ -62,7 +62,7 @@ static int hw_breakpoint_insert(CPUX86State *env, int index)
     switch (hw_breakpoint_type(dr7, index)) {
     case DR7_TYPE_BP_INST:
         if (hw_breakpoint_enabled(dr7, index)) {
-            err = cpu_breakpoint_insert(cs, drN, BP_CPU,
+            err = cpu_breakpoint_insert(cs, drN, BP_CPU, index,
                                         &env->cpu_breakpoint[index]);
         }
         break;
diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 0306e2f57a..d77b88505f 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -121,7 +121,7 @@ void ppc_update_ciabr(CPUPPCState *env)
     }
 
     if (priv) {
-        cpu_breakpoint_insert(cs, ciea, BP_CPU, &env->ciabr_breakpoint);
+        cpu_breakpoint_insert(cs, ciea, BP_CPU, 0, &env->ciabr_breakpoint);
     }
 }
 
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 67c09b1a53..bf9accf6e8 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -488,7 +488,7 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
     }
 
     if (ctrl & TYPE2_EXEC) {
-        cpu_breakpoint_insert(cs, addr, flags, &env->cpu_breakpoint[index]);
+        cpu_breakpoint_insert(cs, addr, flags, 0, &env->cpu_breakpoint[index]);
     }
 
     if (ctrl & TYPE2_LOAD) {
@@ -613,7 +613,8 @@ static void type6_breakpoint_insert(CPURISCVState *env, target_ulong index)
     }
 
     if (ctrl & TYPE6_EXEC) {
-        cpu_breakpoint_insert(cs, addr, flags, &env->cpu_breakpoint[index]);
+        cpu_breakpoint_insert(cs, addr, flags, index,
+                              &env->cpu_breakpoint[index]);
     }
 
     if (ctrl & TYPE6_LOAD) {
diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index e180096b42..4cf147bbfb 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -43,7 +43,7 @@ void HELPER(wsr_ibreakenable)(CPUXtensaState *env, uint32_t v)
         if (change & (1 << i)) {
             if (v & (1 << i)) {
                 cpu_breakpoint_insert(cs, env->sregs[IBREAKA + i],
-                                      BP_CPU, &env->cpu_breakpoint[i]);
+                                      BP_CPU, i, &env->cpu_breakpoint[i]);
             } else {
                 cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[i]);
                 env->cpu_breakpoint[i] = NULL;
@@ -59,7 +59,7 @@ void HELPER(wsr_ibreaka)(CPUXtensaState *env, uint32_t i, uint32_t v)
         CPUState *cs = env_cpu(env);
 
         cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[i]);
-        cpu_breakpoint_insert(cs, v, BP_CPU, &env->cpu_breakpoint[i]);
+        cpu_breakpoint_insert(cs, v, BP_CPU, i, &env->cpu_breakpoint[i]);
     }
     env->sregs[IBREAKA + i] = v;
 }
-- 
2.43.0


