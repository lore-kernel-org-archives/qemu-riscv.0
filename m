Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7FCC43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:08:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welGD-00068G-Kj; Tue, 30 Jun 2026 23:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welG5-0005rM-FA
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:05:06 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welG0-0002uj-82
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:05:04 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2c74383c93cso1180935ad.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875099; x=1783479899; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uAgzh+Ryx4YCBocOo9b+q+A4Q5K+v+5tUwjHqkSzxzY=;
 b=IgJUEPSkq/MmUQo3UF9NsHvMgYWGhy/UnQDfLW1fTpP2J1cIYmTeFNqfC4xaGRRxtj
 9YcE4D1UU1IpBQvi5EQ2lk4Dr17P0m/unPvLZ9LnL5ToFgiddgJ6n/zEwPixwyB4E6YT
 BxjOpsClS/VFxyk2wCEV5V5AcKA2yxOY0rV8Wh97Pu3kJG5CaEzsnwFhiVI8qSzdHRoM
 EVp36YIDEkRp6mxZJZAclHtnPRsx4trK5QWVqxsXsAHQZO3qI0aBb18qJBFGPaMF2oab
 w5xW1PJeLdSx3iwESqRTP0wLOTeFXFlybx/Uoc9rUxiIKvrqljlS/UK/NlmreapDvNqt
 Vg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875099; x=1783479899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uAgzh+Ryx4YCBocOo9b+q+A4Q5K+v+5tUwjHqkSzxzY=;
 b=D4DXYjnMFJ/Ed2vo0jMdKB3dDAJO3y9ibxZYnWnybUKBq2CRi7PMBOVT8uaIVPBLYH
 fGYthxfMFysIPmuyBzyv0qx50WuBF79r+idHbSMPDIzYh/U970v/zzFB69sibZ/cchQr
 YUUZCtXCZCrO9CUhAH93uIn4f0RlV4hudGPUbR1/00DEkAMlF0UsJ1dGx6wHCRnkgACj
 i32zygYpungr/ru7zb3qgpGPeCrdQt6dMQ4DQrpL4PbYKKzUu9cknf2zJrdKJgVMlAWv
 WjKCCuK30RfSiSeqH47NLVrnSGUPbmbzFKiIhWczeMW3GtR+lLGNgeShJ4UoG77n3SFM
 jLdw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpd41SEBXsFXkvEVmAT9sA1btDFSt2kFZsnUeIDDWB8JcpVfRiMnW5DI8ORHE/alASvA4pECGGpvBPs@nongnu.org
X-Gm-Message-State: AOJu0Yx6OBw+WJ1OiaHIGdWYXgW/9WFh/G7U8a96OZpxGVEB6iZVuSui
 /l/+kwEC3pahGma++3JiocQgTgUeFgYXV7aMBLIV6krlhn9o+5yPxKrNi9eSZePL2cE=
X-Gm-Gg: AfdE7cmfZadk3PcJei7d/tQ+fKMYY8Hwc9H8LTUBKUeUP+UM/W/eppDNLomwVUnLT1W
 INtxKWR6zJR/HmZqp3qlwF+CQO3bbAY9zRZe8+zrIvCvjT3Kiaaz4BBdcoh4vCb2BIryZX4mXQg
 7WCDxcXpdqvcc6rAuPYQSW7Ey6i+nZh2DvNifOtzrbfj6iJWCjz2iti4iyPPQ0FLxgzP5x9Xi4f
 I3UdliT9ITXh2ENe9XsrQRC5ctragy5KBAbL+zyX0s/0qvWlgwTwFAlcoWoWN+c59x7AuFSR7on
 CMpHATPywdfFim5MONGGWivYykI+lQ/Qe84Ph4wmlk5komwOiDZMPl/yUaP2CVm2tEW+j53ZhqB
 cMjEzlD19ERwPOVXO6Utb1lvzc13uFUOXSvIjqlGusdURcetRTCs4isJ9hGxCCgyLPTFkBcrwy8
 THn4WK7JNL7QI0NAKDmm3c7IHJE+aZpSA9NQfLlbSy256JtNqssQ==
X-Received: by 2002:a17:903:2f8b:b0:2c9:b1ed:eb5d with SMTP id
 d9443c01a7336-2ca5a657fa6mr26685565ad.47.1782875098559; 
 Tue, 30 Jun 2026 20:04:58 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 17/17] cpu: Use interval-tree for CPUBreakpoint
Date: Tue, 30 Jun 2026 20:04:43 -0700
Message-ID: <20260701030443.1382447-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Use a balanced binary tree rather than a simple list
for breakpoints.  Using an interval tree makes it easy
to probe for all breakpoints on a virtual page.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/breakpoint.h |  6 ++---
 include/hw/core/cpu.h     |  3 ++-
 accel/tcg/cpu-exec.c      | 48 +++++++++++++++++++--------------------
 cpu-common.c              | 46 +++++++++++++++++++------------------
 hw/core/cpu-common.c      |  1 -
 linux-user/main.c         | 13 +++++++----
 6 files changed, 61 insertions(+), 56 deletions(-)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index 93876f3304..d0b5669fa1 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -8,6 +8,7 @@
 #ifndef EXEC_BREAKPOINT_H
 #define EXEC_BREAKPOINT_H
 
+#include "qemu/interval-tree.h"
 #include "qemu/queue.h"
 #include "exec/vaddr.h"
 #include "exec/memattrs.h"
@@ -29,9 +30,8 @@
 #define BP_CPU_ID_SHIFT       16
 
 struct CPUBreakpoint {
-    vaddr pc;
-    uint32_t flags; /* BP_* */
-    QTAILQ_ENTRY(CPUBreakpoint) entry;
+    IntervalTreeNode itree;     /* start == last == pc */
+    uint32_t flags;             /* BP_* */
 };
 
 struct CPUWatchpoint {
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index ae8daa1159..b0cc1b8fa7 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -30,6 +30,7 @@
 #include "qapi/qapi-types-machine.h"
 #include "qapi/qapi-types-run-state.h"
 #include "qemu/bitmap.h"
+#include "qemu/interval-tree.h"
 #include "qemu/rcu_queue.h"
 #include "qemu/queue.h"
 #include "qemu/lockcnt.h"
@@ -525,7 +526,7 @@ struct CPUState {
     QTAILQ_ENTRY(CPUState) node;
 
     /* ice debug support */
-    QTAILQ_HEAD(, CPUBreakpoint) breakpoints;
+    IntervalTreeRoot breakpoints;
 
     QTAILQ_HEAD(, CPUWatchpoint) watchpoints;
     CPUWatchpoint *watchpoint_hit;
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 66ec656861..2d94afb9cc 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -296,8 +296,7 @@ static void log_cpu_exec(vaddr pc, CPUState *cpu,
 static bool check_for_breakpoints_slow(CPUState *cpu, vaddr pc,
                                        uint32_t *cflags)
 {
-    CPUBreakpoint *bp;
-    bool match_page = false;
+    IntervalTreeNode *n;
 
     /*
      * Singlestep overrides breakpoints.
@@ -312,32 +311,28 @@ static bool check_for_breakpoints_slow(CPUState *cpu, vaddr pc,
         return false;
     }
 
-    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-        /*
-         * If we have an exact pc match, trigger the breakpoint.
-         * Otherwise, note matches within the page.
-         */
-        if (pc == bp->pc) {
-            bool match_bp = false;
+    /* If we have an exact pc match, trigger the breakpoint. */
+    for (n = interval_tree_iter_first(&cpu->breakpoints, pc, pc);
+         n;
+         n = interval_tree_iter_next(n, pc, pc)) {
+        CPUBreakpoint *bp = container_of(n, CPUBreakpoint, itree);
+        bool match_bp = false;
 
-            if (bp->flags & BP_GDB) {
-                match_bp = true;
-            } else if (bp->flags & BP_CPU) {
+        if (bp->flags & BP_GDB) {
+            match_bp = true;
+        } else if (bp->flags & BP_CPU) {
 #ifdef CONFIG_USER_ONLY
-                g_assert_not_reached();
+            g_assert_not_reached();
 #else
-                const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
-                assert(tcg_ops->debug_check_breakpoint);
-                match_bp = tcg_ops->debug_check_breakpoint(cpu, bp);
+            const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
+            assert(tcg_ops->debug_check_breakpoint);
+            match_bp = tcg_ops->debug_check_breakpoint(cpu, bp);
 #endif
-            }
+        }
 
-            if (match_bp) {
-                cpu->exception_index = EXCP_DEBUG;
-                return true;
-            }
-        } else if (((pc ^ bp->pc) & TARGET_PAGE_MASK) == 0) {
-            match_page = true;
+        if (match_bp) {
+            cpu->exception_index = EXCP_DEBUG;
+            return true;
         }
     }
 
@@ -353,7 +348,10 @@ static bool check_for_breakpoints_slow(CPUState *cpu, vaddr pc,
      * invalidated, nor would any TB need to be invalidated as
      * breakpoints are removed.
      */
-    if (match_page) {
+    n = interval_tree_iter_first(&cpu->breakpoints,
+                                 pc & TARGET_PAGE_MASK,
+                                 pc | ~TARGET_PAGE_MASK);
+    if (n) {
         *cflags = (*cflags & ~CF_COUNT_MASK) | CF_NO_GOTO_TB | CF_BP_PAGE | 1;
     }
     return false;
@@ -362,7 +360,7 @@ static bool check_for_breakpoints_slow(CPUState *cpu, vaddr pc,
 static inline bool check_for_breakpoints(CPUState *cpu, vaddr pc,
                                          uint32_t *cflags)
 {
-    return unlikely(!QTAILQ_EMPTY(&cpu->breakpoints)) &&
+    return unlikely(!interval_tree_is_empty(&cpu->breakpoints)) &&
         check_for_breakpoints_slow(cpu, pc, cflags);
 }
 
diff --git a/cpu-common.c b/cpu-common.c
index 0b54e8a497..7baea8bdd0 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -392,13 +392,13 @@ void process_queued_cpu_work(CPUState *cpu)
 /* Return true if PC matches an installed breakpoint.  */
 bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
 {
-    CPUBreakpoint *bp;
+    IntervalTreeNode *n;
 
-    if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
-        QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-            if (bp->pc == pc && (bp->flags & mask)) {
-                return true;
-            }
+    for (n = interval_tree_iter_first(&cpu->breakpoints, pc, pc); n;
+         n = interval_tree_iter_next(n, pc, pc)) {
+        CPUBreakpoint *bp = container_of(n, CPUBreakpoint, itree);
+        if (bp->flags & mask) {
+            return true;
         }
     }
     return false;
@@ -414,17 +414,13 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, uint32_t flags,
         pc = cpu->cc->gdb_adjust_breakpoint(cpu, pc);
     }
 
-    bp = g_malloc(sizeof(*bp));
+    bp = g_new0(CPUBreakpoint, 1);
 
-    bp->pc = pc;
+    bp->itree.start = pc;
+    bp->itree.last = pc;
     bp->flags = flags;
 
-    /* keep all GDB-injected breakpoints in front */
-    if (flags & BP_GDB) {
-        QTAILQ_INSERT_HEAD(&cpu->breakpoints, bp, entry);
-    } else {
-        QTAILQ_INSERT_TAIL(&cpu->breakpoints, bp, entry);
-    }
+    interval_tree_insert(&bp->itree, &cpu->breakpoints);
 
     if (breakpoint) {
         *breakpoint = bp;
@@ -437,36 +433,42 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, uint32_t flags,
 /* Remove a specific breakpoint.  */
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, uint32_t flags)
 {
-    CPUBreakpoint *bp;
+    IntervalTreeNode *n;
 
     if (cpu->cc->gdb_adjust_breakpoint) {
         pc = cpu->cc->gdb_adjust_breakpoint(cpu, pc);
     }
 
-    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-        if (bp->pc == pc && bp->flags == flags) {
+    for (n = interval_tree_iter_first(&cpu->breakpoints, pc, pc); n;
+         n = interval_tree_iter_next(n, pc, pc)) {
+        CPUBreakpoint *bp = container_of(n, CPUBreakpoint, itree);
+        if (bp->flags == flags) {
             cpu_breakpoint_remove_by_ref(cpu, bp);
             return 0;
         }
     }
+
     return -ENOENT;
 }
 
 /* Remove a specific breakpoint by reference.  */
 void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *bp)
 {
-    QTAILQ_REMOVE(&cpu->breakpoints, bp, entry);
-
-    trace_breakpoint_remove(cpu->cpu_index, bp->pc, bp->flags);
+    interval_tree_remove(&bp->itree, &cpu->breakpoints);
+    trace_breakpoint_remove(cpu->cpu_index, bp->itree.start, bp->flags);
     g_free(bp);
 }
 
 /* Remove all matching breakpoints. */
 void cpu_breakpoint_remove_all(CPUState *cpu, int mask)
 {
-    CPUBreakpoint *bp, *next;
+    IntervalTreeNode *n;
 
-    QTAILQ_FOREACH_SAFE(bp, &cpu->breakpoints, entry, next) {
+    n = interval_tree_iter_first(&cpu->breakpoints, 0, -1);
+    while (n) {
+        CPUBreakpoint *bp = container_of(n, CPUBreakpoint, itree);
+
+        n = interval_tree_iter_next(n, 0, -1);
         if (bp->flags & mask) {
             cpu_breakpoint_remove_by_ref(cpu, bp);
         }
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index e314f916f8..5c2d7ed42c 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -322,7 +322,6 @@ static void cpu_common_initfn(Object *obj)
     qemu_mutex_init(&cpu->work_mutex);
     qemu_lockcnt_init(&cpu->in_ioctl_lock);
     QSIMPLEQ_INIT(&cpu->work_list);
-    QTAILQ_INIT(&cpu->breakpoints);
     QTAILQ_INIT(&cpu->watchpoints);
 
     cpu_exec_initfn(cpu);
diff --git a/linux-user/main.c b/linux-user/main.c
index c08c73fd80..dd7f267d46 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -239,7 +239,6 @@ CPUArchState *cpu_copy(CPUArchState *env)
     CPUState *cpu = env_cpu(env);
     CPUState *new_cpu = cpu_create(cpu_type);
     CPUArchState *new_env = cpu_env(new_cpu);
-    CPUBreakpoint *bp;
 
     /* Reset non arch specific state */
     cpu_reset(new_cpu);
@@ -258,9 +257,15 @@ CPUArchState *cpu_copy(CPUArchState *env)
     /* Clone all break/watchpoints.
        Note: Once we support ptrace with hw-debug register access, make sure
        BP_CPU break/watchpoints are handled correctly on clone. */
-    QTAILQ_INIT(&new_cpu->breakpoints);
-    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-        cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
+    if (!interval_tree_is_empty(&cpu->breakpoints)) {
+        IntervalTreeNode *n;
+
+        memset(&new_cpu->breakpoints, 0, sizeof(new_cpu->breakpoints));
+        for (n = interval_tree_iter_first(&cpu->breakpoints, 0, -1); n;
+             n = interval_tree_iter_next(n, 0, -1)) {
+            CPUBreakpoint *bp = container_of(n, CPUBreakpoint, itree);
+            cpu_breakpoint_insert(new_cpu, bp->itree.start, bp->flags, NULL);
+        }
     }
 
     return new_env;
-- 
2.43.0


