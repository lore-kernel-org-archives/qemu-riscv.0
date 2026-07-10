Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8367AC44506
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 20:57:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIFF-0001n7-8E; Fri, 10 Jul 2026 16:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIF7-0001fm-Pl
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:42 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEq-0000mF-Qj
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:39 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-848479c9bd5so1110687b3a.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716863; x=1784321663; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/tBqTVMfzy4JRXI0rLMBlVN1Jp4ho8+t/VS/+DbUbgg=;
 b=PS3vL+W+BeerTsYsZu+r995dj6qMcTJm7bUxSD3QDiX6QQ/4nP9sv4EYayedaYtl9i
 EtH1YAXVFKWNeEsIAUw/zbp3OdgGrdkBZtg++IGs6N/e5WHoWUd3fYTMGnsSweqYCyHS
 n7pxy8f7BHzS03NY2yJozZ0GOowvWLI10/0okF+2VQHBIXgMNZWNI5+18x7KG9nK8Kd9
 1135iYXaADsB47Ahf7eq4EYCqUtHVCjp46cVolg6+69c9lH7HEzZhM0o/nhXkunRpBZF
 65ehx35nFrq5Wyw9vrNHHHzONshkY6nprwMIrA/PobZ0ZLFu+Vy1ZO3HNgXZOLe2/qmO
 5g0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716863; x=1784321663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/tBqTVMfzy4JRXI0rLMBlVN1Jp4ho8+t/VS/+DbUbgg=;
 b=Xm7lcxXd9un4FtbyfZmcHM1OVET+D0KVGL8GAox8Fuo3Mw10GZ6nGKeu9JsZdONWpN
 WJhS5F9KRR8jHgL4Jv7cJyOPbhV1gX2vCkECpGCIJjD6fgBWwYHAcIDvgfbabMbPOUaS
 3gLqrHxgHW+kMp0+T9MBhVecYL8Sav912+ys+oH5BPhrRtdKbdaTQXFXDmsWVsOWmVQV
 qShXLYxNO9PzuHYbDM8hv5/Ggk3RL5r5N+eXxdPetq23PLs2eIQ1rhv81BoAkdkaHWnu
 xoZoic4Y7mDPdUz6zkhLxWTp9OpImGVj7cJj5YfJzzeEz+o5kJTQ6u6snUDJMaezRKSK
 0i9Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrpANp8bWPS57e9coy0wKxGxAnumMeYTHoMBxxHN6+9gunzprNeFWAMtryuZ87OhxOmGKAnnYYVx5fp@nongnu.org
X-Gm-Message-State: AOJu0Yx3h9RFLYaWc+1BRDvLRo3dLiDHFcTxHxSchI052Cua5cwVNdLG
 iutzMTG7LRjQd2kneDLdH4K5kcyo7VoNbMPyEJHu3hBVC98m+hYqyAry7vA/acFAkNQ=
X-Gm-Gg: AfdE7cllytrGBDl1bMYpjaDabxUD6pDl5v2RegltHORB+ibfrHAJ8aTi+6Za9KLC7jy
 cGK6Lkto0OSPIOjF4GGNyktndEgYXV7XN+QyuREw9QPifEaf+idYhqCnMIBFitqJsAY+j3nvcwE
 Rg70YSYUAo+8JYkEMvVRSFgm93ictPmERbeM252p2vSfMvMSLYalMHx7HDgedR4qwJ9QAX0AgU1
 NATtp8buLKCbUTepeB38XS0gnfSnGMEZCCnv6zE211CQqQBCNcrCqHwrbbEGrQBxphOgYc/hPly
 lDPFXOnAFzzC/0O+oF8iEBM3JMihT1yYMKi8t+tVmV3Qk9H45XKHvXcugIgq/jhR971M6/2e7Bm
 lCcvzCxgdmYpavfZJxg1Q1TfhVjXM36Mp7b0pWNRwptMEUF6nQWUsAbKqNqz2ayJa2zomZD4bP+
 XvXO0lzlwvp2HZ22ZEQA==
X-Received: by 2002:a05:6a00:f8b:b0:845:dedd:89c6 with SMTP id
 d2e1a72fcca58-848896f266cmr521883b3a.18.1783716863331; 
 Fri, 10 Jul 2026 13:54:23 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 19/51] exec/breakpoint: Return the new bp from
 cpu_breakpoint_insert
Date: Fri, 10 Jul 2026 13:53:29 -0700
Message-ID: <20260710205401.836304-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

The cpu_breakpoint_insert function cannot fail, so the error
return value isn't actually used.  Instead of returning the
new breakpoint by reference, return it directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/breakpoint.h           |  4 ++--
 accel/tcg/tcg-accel-ops.c           |  7 ++-----
 cpu-common.c                        | 11 +++--------
 gdbstub/user.c                      |  8 ++------
 linux-user/main.c                   |  2 +-
 target/arm/tcg/debug.c              |  2 +-
 target/i386/tcg/system/bpt_helper.c |  3 +--
 target/ppc/cpu.c                    |  2 +-
 target/riscv/debug.c                |  5 ++---
 target/xtensa/dbg_helper.c          |  6 +++---
 10 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index e0826a1a2d..95aa4f5933 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -42,8 +42,8 @@ struct CPUWatchpoint {
     unsigned id;
 };
 
-int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
-                          unsigned id, CPUBreakpoint **breakpoint);
+CPUBreakpoint *cpu_breakpoint_insert(CPUState *cpu, vaddr pc,
+                                     BreakpointFlags flags, unsigned id);
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, BreakpointFlags flags);
 void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint);
 void cpu_breakpoint_remove_all(CPUState *cpu, BreakpointFlags mask);
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index afac859b8d..644c5b04a2 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -137,12 +137,9 @@ static int tcg_insert_gdbstub_breakpoint(CPUState *cs, GdbBreakpointType type,
     case GDB_BREAKPOINT_SW:
     case GDB_BREAKPOINT_HW:
         CPU_FOREACH(cpu) {
-            err = cpu_breakpoint_insert(cpu, addr, BP_GDB, 0, NULL);
-            if (err) {
-                break;
-            }
+            cpu_breakpoint_insert(cpu, addr, BP_GDB, 0);
         }
-        return err;
+        return 0;
     case GDB_WATCHPOINT_WRITE:
     case GDB_WATCHPOINT_READ:
     case GDB_WATCHPOINT_ACCESS:
diff --git a/cpu-common.c b/cpu-common.c
index 0287022de4..fcc9bc77a3 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -405,8 +405,8 @@ bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, BreakpointFlags mask)
 }
 
 /* Add a breakpoint.  */
-int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
-                          unsigned id, CPUBreakpoint **breakpoint)
+CPUBreakpoint *cpu_breakpoint_insert(CPUState *cpu, vaddr pc,
+                                     BreakpointFlags flags, unsigned id)
 {
     CPUBreakpoint *bp;
 
@@ -422,13 +422,8 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
     bp->id = id;
 
     interval_tree_insert(&bp->itree, &cpu->breakpoints);
-
-    if (breakpoint) {
-        *breakpoint = bp;
-    }
-
     trace_breakpoint_insert(cpu->cpu_index, pc, flags);
-    return 0;
+    return bp;
 }
 
 /* Remove a specific breakpoint.  */
diff --git a/gdbstub/user.c b/gdbstub/user.c
index ed0e88d169..f58fcf92a5 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -795,18 +795,14 @@ int gdb_breakpoint_insert(CPUState *cs, GdbBreakpointType type,
                           vaddr addr, vaddr len)
 {
     CPUState *cpu;
-    int err = 0;
 
     switch (type) {
     case GDB_BREAKPOINT_SW:
     case GDB_BREAKPOINT_HW:
         CPU_FOREACH(cpu) {
-            err = cpu_breakpoint_insert(cpu, addr, BP_GDB, 0, NULL);
-            if (err) {
-                break;
-            }
+            cpu_breakpoint_insert(cpu, addr, BP_GDB, 0);
         }
-        return err;
+        return 0;
     default:
         /* user-mode doesn't support watchpoints */
         return -ENOSYS;
diff --git a/linux-user/main.c b/linux-user/main.c
index 4372d0b5a6..54d39627f6 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -265,7 +265,7 @@ CPUArchState *cpu_copy(CPUArchState *env)
              n = interval_tree_iter_next(n, 0, -1)) {
             CPUBreakpoint *bp = container_of(n, CPUBreakpoint, itree);
             cpu_breakpoint_insert(new_cpu, bp->itree.start,
-                                  bp->flags, bp->id, NULL);
+                                  bp->flags, bp->id);
         }
     }
 
diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index daad2ac440..2c73ca1080 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -685,7 +685,7 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
         return;
     }
 
-    cpu_breakpoint_insert(CPU(cpu), addr, flags, n, &env->cpu_breakpoint[n]);
+    env->cpu_breakpoint[n] = cpu_breakpoint_insert(CPU(cpu), addr, flags, n);
 }
 
 void hw_breakpoint_update_all(ARMCPU *cpu)
diff --git a/target/i386/tcg/system/bpt_helper.c b/target/i386/tcg/system/bpt_helper.c
index 662ffbacfc..23f2d05126 100644
--- a/target/i386/tcg/system/bpt_helper.c
+++ b/target/i386/tcg/system/bpt_helper.c
@@ -62,8 +62,7 @@ static int hw_breakpoint_insert(CPUX86State *env, int index)
     switch (hw_breakpoint_type(dr7, index)) {
     case DR7_TYPE_BP_INST:
         if (hw_breakpoint_enabled(dr7, index)) {
-            err = cpu_breakpoint_insert(cs, drN, BP_CPU, index,
-                                        &env->cpu_breakpoint[index]);
+            env->cpu_breakpoint[index] = cpu_breakpoint_insert(cs, drN, BP_CPU, index);
         }
         break;
 
diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 581fa6a575..a25c8ae2f1 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -121,7 +121,7 @@ void ppc_update_ciabr(CPUPPCState *env)
     }
 
     if (priv) {
-        cpu_breakpoint_insert(cs, ciea, BP_CPU, 0, &env->ciabr_breakpoint);
+        env->ciabr_breakpoint = cpu_breakpoint_insert(cs, ciea, BP_CPU, 0);
     }
 }
 
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 56ae1e6107..d6bba24c81 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -488,7 +488,7 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
     }
 
     if (ctrl & TYPE2_EXEC) {
-        cpu_breakpoint_insert(cs, addr, flags, 0, &env->cpu_breakpoint[index]);
+        env->cpu_breakpoint[index] = cpu_breakpoint_insert(cs, addr, flags, 0);
     }
 
     if (ctrl & TYPE2_LOAD) {
@@ -613,8 +613,7 @@ static void type6_breakpoint_insert(CPURISCVState *env, target_ulong index)
     }
 
     if (ctrl & TYPE6_EXEC) {
-        cpu_breakpoint_insert(cs, addr, flags, index,
-                              &env->cpu_breakpoint[index]);
+        env->cpu_breakpoint[index] = cpu_breakpoint_insert(cs, addr, flags, index);
     }
 
     if (ctrl & TYPE6_LOAD) {
diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index b08bd03435..9df0c519b3 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -42,8 +42,8 @@ void HELPER(wsr_ibreakenable)(CPUXtensaState *env, uint32_t v)
     for (i = 0; i < env->config->nibreak; ++i) {
         if (change & (1 << i)) {
             if (v & (1 << i)) {
-                cpu_breakpoint_insert(cs, env->sregs[IBREAKA + i],
-                                      BP_CPU, i, &env->cpu_breakpoint[i]);
+                env->cpu_breakpoint[i] =
+                    cpu_breakpoint_insert(cs, env->sregs[IBREAKA + i], BP_CPU, i);
             } else {
                 cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[i]);
                 env->cpu_breakpoint[i] = NULL;
@@ -59,7 +59,7 @@ void HELPER(wsr_ibreaka)(CPUXtensaState *env, uint32_t i, uint32_t v)
         CPUState *cs = env_cpu(env);
 
         cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[i]);
-        cpu_breakpoint_insert(cs, v, BP_CPU, i, &env->cpu_breakpoint[i]);
+        env->cpu_breakpoint[i] = cpu_breakpoint_insert(cs, v, BP_CPU, i);
     }
     env->sregs[IBREAKA + i] = v;
 }
-- 
2.43.0


