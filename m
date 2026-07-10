Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90052C44507
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:02:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIHH-0005K0-Ap; Fri, 10 Jul 2026 16:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFQ-00024H-87
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:55:03 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIF9-0000uu-V9
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:59 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-84536ecfc5bso1562139b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716872; x=1784321672; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fJfbDIS/fYFApYI9j0z0r2WuLwyv5LpJL3k4ywDcnyc=;
 b=SeHFvCoXjE7Jg1AehseZZU+EqahgL0momPEmMUmADwADeFg6rqb/q6gzQB1Q7VNKV6
 xWZInx24FKUz1aIsJ/3qXqo9nzqGboRJ6XPJpeweiQNwf17hTJ1fXqIZFvUdbmAmD0hU
 WEQEsKsNXezC4U9tAYOMlB63HXQDqkvtXjRZrQ9iNP/oU2lFnfp6S+Eow1ER8nzYzcbl
 MMMRmIFSLWayxyDBs9IT+uaJGWgZ1igCw4LS3zx3svRJQQrI2VcGzj0468mTnoRR4nEZ
 Co/UYfj9rr/eez1MckLhhGbEfQ7Eeo88A2RPjb/U5o9Ml1MTj0esgW58yvazOSE6e4aQ
 7dTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716872; x=1784321672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fJfbDIS/fYFApYI9j0z0r2WuLwyv5LpJL3k4ywDcnyc=;
 b=DIfkRDi0qXmWK/1s+0Dv14Yl4FBIP8Eao4qe+kU/9zj4OcPqC3W6HpvZbu9v1GGEHZ
 jF9M/sm+Km6QG6rmyJ89TaSiiXiikg9mskpTNrWR38VAnN0jqBddTJS1n+odndZSH6/a
 vntKQVsebh3GKPpowrsJhMTfIm2ALqyD5NOnLygKDMSghKm0m4L/wNmYrI8jdi1sJ9c9
 9sZaL6IbelAG09HSVfUsHv4Xh265Zvfo9tEVqoRUojgCdnjAkwHKAhC3KBTg2PkTLEgM
 Z77th1KWyakXqA8P1cJAbykrin2iW20pK/Qn66ZoobSTAZFDF1uXJY13k2knc8QVLnG6
 yocA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrB+jZyrUBrUqA4BHsrXalY2ragV+bARAnWZi8/u7tuvySaMuvq52wchX+rj0TYyvsmQtvTYqmShdD4@nongnu.org
X-Gm-Message-State: AOJu0Yw7krBarCpEsYhwM/Hva02GHbEZKuTCLgaw9K3H90UDSa6duqOx
 uRvf9E2bH6QrJNRTEnhixe4+V7oMgI6YoCPCynD3fpoMwWBAqF2WFBiLRNsZg6mxsBM=
X-Gm-Gg: AfdE7cmp2bPB2hZU8EgGOXZbHaqTA1PanDq/5B3DtzghOT2uGz+WLb6RyqtpkK1C16D
 FERIOrTqkMdwPjA0gJfMMMSAC6CCqI4CgtWiPxjWDhiomOEdexrWQ/EqJcZM9Q12wcMsps8F/s/
 WLfOWjtllu7DgAGD+2OaRWxhTTx/fbgoKP8gaPJwXkeeu8qtNT5rTP1fJp0qnZ2IKlB4HIZkkQo
 nxVyvaCq/5RjSsj8oLnTaSYHutws75xsa542ijALeXGrrIJvGABhggibYNtEQh0CpNEMD34OlyV
 m4uY7aodqci2L8T/shvxDcjqe/NwONuaKmQbgJwrDQfPJ0TCg5I2PnjdQrd/9oSjOypgIs/T0Xi
 TBROd6KlRQd0BfemmBNYfv1jP3tQFAq9qdNpBgysHYZm8sBez/TyUrsf1qwXFihGYUSoXBUBvKk
 6juzZ8oW2XtAeSUVSHSgWrCLZceIMX
X-Received: by 2002:a05:6a00:18a0:b0:848:6720:6fec with SMTP id
 d2e1a72fcca58-8488965c1fbmr568684b3a.28.1783716872552; 
 Fri, 10 Jul 2026 13:54:32 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 27/51] accel/tcg: Pass breakpoint hit to debug_excp_handler
Date: Fri, 10 Jul 2026 13:53:37 -0700
Message-ID: <20260710205401.836304-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Record the CPUBreakpoint in check_for_breakpoints_slow,
into a new CPUState field, so that the as-yet unconverted
target debug_excp_handler functions won't see it.

Only call debug_excp_handler for BP_CPU, and clear the
CPUState fields after the call.  This will allow these
actions to be dropped from the target hook.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h |  1 +
 accel/tcg/cpu-exec.c  | 32 +++++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 3986e43f84..1a42940d92 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -526,6 +526,7 @@ struct CPUState {
     /* ice debug support */
     IntervalTreeRoot breakpoints;
     IntervalTreeRoot watchpoints;
+    CPUBreakpoint *breakpoint_hit;
     CPUBreakpoint *watchpoint_hit;
 
     void *opaque;
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 3205f365e5..a4eb1f1c31 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -363,6 +363,10 @@ static bool check_for_breakpoints_slow(CPUState *cpu, vaddr pc,
     return false;
 
  found:
+    bp->hitaddr = pc;
+    bp->hitlast = pc;
+    bp->hitattrs = MEMTXATTRS_UNSPECIFIED;
+    cpu->breakpoint_hit = bp;
     cpu->exception_index = EXCP_DEBUG;
     return true;
 }
@@ -681,19 +685,29 @@ static inline bool cpu_handle_halt(CPUState *cpu)
 
 static inline void cpu_handle_debug_exception(CPUState *cpu)
 {
-    const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
-    IntervalTreeNode *n;
+    CPUBreakpoint *hit = cpu->watchpoint_hit;
 
-    for (n = interval_tree_iter_first(&cpu->watchpoints, 0, -1); n;
-         n = interval_tree_iter_next(n, 0, -1)) {
-        CPUBreakpoint *wp = container_of(n, CPUBreakpoint, itree);
-        if (wp != cpu->watchpoint_hit) {
-            wp->flags &= ~BP_WATCHPOINT_HIT;
+    if (hit) {
+        IntervalTreeNode *n;
+
+        for (n = interval_tree_iter_first(&cpu->watchpoints, 0, -1); n;
+             n = interval_tree_iter_next(n, 0, -1)) {
+            CPUBreakpoint *wp = container_of(n, CPUBreakpoint, itree);
+            if (wp != hit) {
+                wp->flags &= ~BP_WATCHPOINT_HIT;
+            }
+        }
+    } else {
+        hit = cpu->breakpoint_hit;
+        if (!hit) {
+            return;
         }
     }
 
-    if (tcg_ops->debug_excp_handler) {
-        tcg_ops->debug_excp_handler(cpu, cpu->watchpoint_hit);
+    if (hit->flags & BP_CPU) {
+        cpu->cc->tcg_ops->debug_excp_handler(cpu, hit);
+        cpu->watchpoint_hit = NULL;
+        cpu->breakpoint_hit = NULL;
     }
 }
 
-- 
2.43.0


