Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEA7C44500
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:40:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEds-0008Ij-O2; Sun, 05 Jul 2026 00:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcM-00057U-8m
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:11 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEc2-0004Hn-6q
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:09 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-ca12086c06eso1129603a12.0
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226268; x=1783831068; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/XLZ7YKA7/g2kmg2T8PCV+riLxmZ783WmnVxd6hC718=;
 b=YEcYqncrhifIlE2aTE1pm8Y5fkU90r+q9tPu1AUHClIZgs9p2/M0QgnV3GejKWk8x5
 axp43GonA7+ALIsRhUGImtDOHPjNK9yjNDJwjbYIebGArHzaniSOGx5MWtg1ZJ6sdapi
 dz39kZyo05X8spFpwaSeCWw/TLdw+6QCAeGp4Y8bcc2hSwhsrWZjgg/mz827rUC0I4xF
 vOAYDzBw3osbbCDEmGM8vHhk0mzmo0pUf+mYsVB0pKFWW6dt1PZLWyPh1+17LjxFFyBK
 mR+Jl6JyLJzHJRE5S1au79mmeTiDxyRPEnrLxQ8Z89C6O1KUvFsuxRhYhSYiizDYMHuW
 1iWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226268; x=1783831068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/XLZ7YKA7/g2kmg2T8PCV+riLxmZ783WmnVxd6hC718=;
 b=syz81OQtvsRU2ITuh9vKyM7N8Fe6WJ1urxGn5uDJS9wNMQ6HB5RYZ8OGCyR0TLBGz2
 +7AnhvAUw+nwE0Tn4m3ZGFD9luYJq8erPV2BvzGpEk5HI6Vg1srJPwxbIY0oJhEE27uZ
 yw6LBYnIKYrECzsyuX25xKNzv+7Gd0nrY0fHRiQsWorNGOK3K6BYM7iOgZPSVwBfIHF6
 rYxFqaKmd8tpZGkW9+mFGK5B8xSxr+9p+gtBvohAQ3RP5lX/uVeu+/1z+HfJB4BDh5Lo
 dPNlf3PIYZO5KxlVAv/7xho2+LF9gr1fzfuEnfy/RmCNKNyLrIK2JUXYeNc9W8LYyVkT
 XThg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqPK/lCAuKCGixghyQjGcizY5vnX+kU70cZkt7dK1EHKhWmbfV/qYVtRKH5hTVuwzBRCDFyiGL3byx3@nongnu.org
X-Gm-Message-State: AOJu0YzVWW/kgo9eR4AXImhL2TzDIRr2/vr7/tNjq1cwegaCM82aNm9E
 zhX4ONHSbjCjVLu75jSL+ct1IWeVBdttHVR6abbpNNeCxs7J/ZNlpQxJ9PCN6K69UbY=
X-Gm-Gg: AfdE7cmWGp6bBeoNJY50q9NB2RGKZc5Rff/ylIsbH2/EbGuqNcHSWM8GdNfXgcmPz/y
 mwVe7lJTAYE6/ec6eFt9lOgUgTJOn9UDCZMZ2RLl47Y6ESXd2b/UARUkgDEZCUERhy6Gb6ueM53
 jeZubm4+99Ha3p2c08PKgSA2jk6RnpyU0blYgU+Vjc4m4wD+7lXlMRwD0aYoIaZhE6BkWQ77SEF
 72CuxanfaNzlMdJiN713f2UB9bztAZVjE06xXWPunCkSSQv7H5vAZtlw/j9+4m9iRPFnTkgfSiI
 t14zLFaDAfF9fhH1SDc2Z1qhB9enxbkLksNpEQC1vIoUu7KeuyywXcWyaiQw/jr1zP61FCkCwXw
 QGurb7MGdmgOXu3FPJvv5xnpe9xcqczPG0D43T++GhB2z1ApLGRy0rjumjSwEZCqRxQv6S+gcb2
 I3SMZDySkcqsDwWVWtBix2dCWbquqjZVchijjLk+HQ4epB6bAQ/9Q6Inbdag==
X-Received: by 2002:a17:902:f706:b0:2ca:20b1:3e0a with SMTP id
 d9443c01a7336-2cbb1e31588mr52386385ad.3.1783226268397; 
 Sat, 04 Jul 2026 21:37:48 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 25/46] exec/breakpoint: Return the new wp from
 cpu_watchpoint_insert
Date: Sat,  4 Jul 2026 21:37:04 -0700
Message-ID: <20260705043725.1373137-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

The cpu_watchpoint_insert function cannot fail, so the error
return value isn't actually used.  Instead of returning the
new watchpoint by reference, return it directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/breakpoint.h           |  5 ++---
 accel/tcg/tcg-accel-ops.c           |  9 ++-------
 accel/tcg/user-exec-stub.c          |  7 +++----
 system/watchpoint.c                 | 11 +++--------
 target/arm/tcg/debug.c              |  4 ++--
 target/i386/tcg/system/bpt_helper.c | 20 ++++++++------------
 target/ppc/cpu.c                    |  4 ++--
 target/riscv/debug.c                | 28 +++++++++-------------------
 target/s390x/tcg/debug.c            | 10 +++++-----
 target/xtensa/dbg_helper.c          | 10 +++-------
 10 files changed, 39 insertions(+), 69 deletions(-)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index 90bfe5e237..254762c9b2 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -48,9 +48,8 @@ void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint);
 void cpu_breakpoint_remove_all(CPUState *cpu, BreakpointFlags mask);
 bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, BreakpointFlags mask);
 
-int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
-                          BreakpointFlags flags, unsigned id,
-                          CPUWatchpoint **watchpoint);
+CPUWatchpoint *cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
+                                     BreakpointFlags flags, unsigned id);
 int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
                           vaddr len, BreakpointFlags flags);
 void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint);
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 8954514f24..54717e1946 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -135,7 +135,6 @@ static inline BreakpointFlags xlat_gdb_type(CPUState *cpu, int gdbtype)
 static int tcg_insert_breakpoint(CPUState *cs, int type, vaddr addr, vaddr len)
 {
     CPUState *cpu;
-    int err = 0;
 
     switch (type) {
     case GDB_BREAKPOINT_SW:
@@ -151,13 +150,9 @@ static int tcg_insert_breakpoint(CPUState *cs, int type, vaddr addr, vaddr len)
             return -EINVAL;
         }
         CPU_FOREACH(cpu) {
-            err = cpu_watchpoint_insert(cpu, addr, len,
-                                        xlat_gdb_type(cpu, type), 0, NULL);
-            if (err) {
-                break;
-            }
+            cpu_watchpoint_insert(cpu, addr, len, xlat_gdb_type(cpu, type), 0);
         }
-        return err;
+        return 0;
     default:
         return -ENOSYS;
     }
diff --git a/accel/tcg/user-exec-stub.c b/accel/tcg/user-exec-stub.c
index 42e4861868..bf8b7113b8 100644
--- a/accel/tcg/user-exec-stub.c
+++ b/accel/tcg/user-exec-stub.c
@@ -21,11 +21,10 @@ void cpu_exec_reset_hold(CPUState *cpu)
 {
 }
 
-int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
-                          BreakpointFlags flags, unsigned id,
-                          CPUWatchpoint **watchpoint)
+CPUWatchpoint *cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
+                                     BreakpointFlags flags, unsigned id)
 {
-    return -ENOSYS;
+    g_assert_not_reached();
 }
 
 int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
diff --git a/system/watchpoint.c b/system/watchpoint.c
index 01cf0f61a8..183b194403 100644
--- a/system/watchpoint.c
+++ b/system/watchpoint.c
@@ -24,9 +24,8 @@
 #include "hw/core/cpu.h"
 
 /* Add a watchpoint.  */
-int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
-                          BreakpointFlags flags, unsigned id,
-                          CPUWatchpoint **watchpoint)
+CPUWatchpoint *cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
+                                     BreakpointFlags flags, unsigned id)
 {
     CPUWatchpoint *wp;
     vaddr last = addr + len - 1;
@@ -49,11 +48,7 @@ int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
     } else {
         tlb_flush(cpu);
     }
-
-    if (watchpoint) {
-        *watchpoint = wp;
-    }
-    return 0;
+    return wp;
 }
 
 /* Remove a specific watchpoint.  */
diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index 2c73ca1080..e75fd39fb6 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -581,8 +581,8 @@ void hw_watchpoint_update(ARMCPU *cpu, int n)
         wvr += basstart;
     }
 
-    cpu_watchpoint_insert(CPU(cpu), wvr, len, flags, n,
-                          &env->cpu_watchpoint[n]);
+    env->cpu_watchpoint[n] = cpu_watchpoint_insert(CPU(cpu), wvr, len,
+                                                   flags, n);
 }
 
 void hw_watchpoint_update_all(ARMCPU *cpu)
diff --git a/target/i386/tcg/system/bpt_helper.c b/target/i386/tcg/system/bpt_helper.c
index 23f2d05126..c0c63e3e89 100644
--- a/target/i386/tcg/system/bpt_helper.c
+++ b/target/i386/tcg/system/bpt_helper.c
@@ -57,7 +57,6 @@ static int hw_breakpoint_insert(CPUX86State *env, int index)
     CPUState *cs = env_cpu(env);
     target_ulong dr7 = env->dr[7];
     target_ulong drN = env->dr[index];
-    int err = 0;
 
     switch (hw_breakpoint_type(dr7, index)) {
     case DR7_TYPE_BP_INST:
@@ -73,25 +72,22 @@ static int hw_breakpoint_insert(CPUX86State *env, int index)
 
     case DR7_TYPE_DATA_WR:
         if (hw_breakpoint_enabled(dr7, index)) {
-            err = cpu_watchpoint_insert(cs, drN,
-                                        hw_breakpoint_len(dr7, index),
-                                        BP_CPU | BP_MEM_WRITE, index,
-                                        &env->cpu_watchpoint[index]);
+            env->cpu_watchpoint[index] =
+                cpu_watchpoint_insert(cs, drN,
+                                      hw_breakpoint_len(dr7, index),
+                                      BP_CPU | BP_MEM_WRITE, index);
         }
         break;
 
     case DR7_TYPE_DATA_RW:
         if (hw_breakpoint_enabled(dr7, index)) {
-            err = cpu_watchpoint_insert(cs, drN,
-                                        hw_breakpoint_len(dr7, index),
-                                        BP_CPU | BP_MEM_ACCESS, index,
-                                        &env->cpu_watchpoint[index]);
+            env->cpu_watchpoint[index] =
+                cpu_watchpoint_insert(cs, drN,
+                                      hw_breakpoint_len(dr7, index),
+                                      BP_CPU | BP_MEM_ACCESS, index);
         }
         break;
     }
-    if (err) {
-        env->cpu_breakpoint[index] = NULL;
-    }
     return 0;
 }
 
diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index c91e60940a..262cb92dd2 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -169,8 +169,8 @@ void ppc_update_daw(CPUPPCState *env, int rid)
         flags |= BP_MEM_WRITE;
     }
 
-    cpu_watchpoint_insert(cs, deaw, len, flags, rid,
-                          &env->dawr_watchpoint[rid]);
+    env->dawr_watchpoint[rid] =
+        cpu_watchpoint_insert(cs, deaw, len, flags, rid);
 }
 
 void ppc_store_dawr0(CPUPPCState *env, target_ulong val)
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index d6bba24c81..6777f1a905 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -481,7 +481,6 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
     bool enabled = type2_breakpoint_enabled(ctrl);
     CPUState *cs = env_cpu(env);
     BreakpointFlags flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
-    uint32_t size, def_size;
 
     if (!enabled) {
         return;
@@ -499,16 +498,12 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
     }
 
     if (flags & BP_MEM_ACCESS) {
-        size = type2_breakpoint_size(env, ctrl);
-        if (size != 0) {
-            cpu_watchpoint_insert(cs, addr, size, flags, index,
-                                  &env->cpu_watchpoint[index]);
-        } else {
-            def_size = riscv_cpu_mxl(env) == MXL_RV64 ? 8 : 4;
-
-            cpu_watchpoint_insert(cs, addr, def_size, flags, index,
-                                  &env->cpu_watchpoint[index]);
+        uint32_t size = type2_breakpoint_size(env, ctrl);
+        if (size == 0) {
+            size = riscv_cpu_mxl(env) == MXL_RV64 ? 8 : 4;
         }
+        env->cpu_watchpoint[index] =
+            cpu_watchpoint_insert(cs, addr, size, flags, index);
     }
 }
 
@@ -606,7 +601,6 @@ static void type6_breakpoint_insert(CPURISCVState *env, target_ulong index)
     bool enabled = type6_breakpoint_enabled(ctrl);
     CPUState *cs = env_cpu(env);
     BreakpointFlags flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
-    uint32_t size;
 
     if (!enabled) {
         return;
@@ -625,14 +619,10 @@ static void type6_breakpoint_insert(CPURISCVState *env, target_ulong index)
     }
 
     if (flags & BP_MEM_ACCESS) {
-        size = extract32(ctrl, 16, 4);
-        if (size != 0) {
-            cpu_watchpoint_insert(cs, addr, size, flags, index,
-                                  &env->cpu_watchpoint[index]);
-        } else {
-            cpu_watchpoint_insert(cs, addr, 8, flags, index,
-                                  &env->cpu_watchpoint[index]);
-        }
+        uint32_t size = extract32(ctrl, 16, 4) ? : 8;
+
+        env->cpu_watchpoint[index] =
+            cpu_watchpoint_insert(cs, addr, size, flags, index);
     }
 }
 
diff --git a/target/s390x/tcg/debug.c b/target/s390x/tcg/debug.c
index 25968d9a3c..bd30b85ada 100644
--- a/target/s390x/tcg/debug.c
+++ b/target/s390x/tcg/debug.c
@@ -34,18 +34,18 @@ void s390_cpu_recompute_watchpoints(CPUState *cs)
     if (env->cregs[10] == 0 && env->cregs[11] == -1LL) {
         /* We can't create a watchoint spanning the whole memory range, so
            split it in two parts.   */
-        cpu_watchpoint_insert(cs, 0, 1ULL << 63, wp_flags, 0, NULL);
-        cpu_watchpoint_insert(cs, 1ULL << 63, 1ULL << 63, wp_flags, 0, NULL);
+        cpu_watchpoint_insert(cs, 0, 1ULL << 63, wp_flags, 0);
+        cpu_watchpoint_insert(cs, 1ULL << 63, 1ULL << 63, wp_flags, 0);
     } else if (env->cregs[10] > env->cregs[11]) {
         /* The address range loops, create two watchpoints.  */
         cpu_watchpoint_insert(cs, env->cregs[10], -env->cregs[10],
-                              wp_flags, 0, NULL);
-        cpu_watchpoint_insert(cs, 0, env->cregs[11] + 1, wp_flags, 0, NULL);
+                              wp_flags, 0);
+        cpu_watchpoint_insert(cs, 0, env->cregs[11] + 1, wp_flags, 0);
     } else {
         /* Default case, create a single watchpoint.  */
         cpu_watchpoint_insert(cs, env->cregs[10],
                               env->cregs[11] - env->cregs[10] + 1,
-                              wp_flags, 0, NULL);
+                              wp_flags, 0);
     }
 }
 
diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index 9df0c519b3..ae3791ac23 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -97,13 +97,9 @@ static void set_dbreak(CPUXtensaState *env, unsigned i, uint32_t dbreaka,
         /* cut mask after the first zero bit */
         mask = 0xffffffff << (32 - clo32(mask));
     }
-    if (cpu_watchpoint_insert(cs, dbreaka & mask, ~mask + 1,
-                              flags, i, &env->cpu_watchpoint[i])) {
-        env->cpu_watchpoint[i] = NULL;
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "Failed to set data breakpoint at 0x%08x/%d\n",
-                      dbreaka & mask, ~mask + 1);
-    }
+
+    env->cpu_watchpoint[i] =
+        cpu_watchpoint_insert(cs, dbreaka & mask, ~mask + 1, flags, i);
 }
 
 void HELPER(wsr_dbreaka)(CPUXtensaState *env, uint32_t i, uint32_t v)
-- 
2.43.0


