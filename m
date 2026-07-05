Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE74EC43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:50:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEdy-00006N-Bk; Sun, 05 Jul 2026 00:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcZ-0005Lk-4N
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:24 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcG-0004Mx-To
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:22 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2cc7ef7ec27so4504755ad.1
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226273; x=1783831073; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cP494Rw8f0vgO7hsG8GqjbbSorQrWAAshXUTXMQVwCM=;
 b=RoAQjyoiTAQIyAY1GI2sbDqJW8IGrYPJQ/k6+xwMdgSCOo3hOVR/Y56bim/adckbcj
 2FexexQgfACaHOk9AbL6y+KbXRNTZ6rXI2uKbdTphM7xq2xHMoNWS8bOICpIegumicE4
 IV1w1UzquFxyfcfVT5MII/drmPYBS0VGwdbAW9Uqlg0rxi6y3rr5BrcO9srT4/BAR9SU
 vr260SRnyV10QUvd6t3pv4RFlK4NREa4OHDJYVfj/Um15PF8g8Ri+a1PO1eGuBLKtWZ7
 +L0an8K/NrTKXviq3L7IsAYQrRCAKrprcuRPN9IwXt8E1s3XQb+O8cT+25dckDqSY/hz
 kJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226273; x=1783831073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cP494Rw8f0vgO7hsG8GqjbbSorQrWAAshXUTXMQVwCM=;
 b=eoh1SPsLfZDksxHmBm4Wd5yFSahYfP83ll6e7gH8jdS6Cn84lfahPS+mcOHTHFJMdq
 RM/CwJjal2FFifIP66Gxl12894dAXjgmsws4IDUMp2XCPahiowb6MupQzdihcIXkjQ9N
 uiDwnz1fqaLrdg4UU9sIzycSZSjQvmz8VAbxTr7sWCvC/nbLfC73SdqLUWGklrg1ypyq
 iNHOspX3/lnwQTziNgyIPu1bMrbttPpPrlVAsroqro7lF2MnSUWWeJS9tj8Fu9DYvZw9
 oD9NsX+eE9k+IsfpInxiPNmUFUXDSPslt5f7lXvr1IKAalHg7ZWUAkz/qUl2rlOZl86B
 9Dbg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqvVKpqupn6OUuM5HWq3c/MgEDN8lF55qz3HqIcXyO4PxqgZLahThtX2r2/39CZMmnNKi8rPbGrJVrB@nongnu.org
X-Gm-Message-State: AOJu0YwUod1aC1DtpO204+sR8fwcr2eDA+zOmCQPAAPAVGj3dzcHrYhf
 Ta6E9Anx3D+ojzlaybwTaBEsnhp4CEkb9DSJJ1uX1/E6NaNOxikxZbQDLktvkUH3ODc=
X-Gm-Gg: AfdE7cnCCS2KfQqZJGfCTQZH5rxHvprNVq71TYJqVIKni3wuJhrlKcv0qM7gKEy3hlh
 Gw+WGT9E3GuhijW5Vq6RGL3MRGJa6WTw7mvfZz1yIA3aUHTLFJMVAXQPG0425ee2WmLYZPYxmEf
 81Y1++ViuF2vHHq6mdceP653aiFgLU5UFXQP/0i2ZDAS6HV+9jW6ks8z1Nc0VbU1QxVoueejPc9
 pj+sF4N+JAoUkwdIPV/04eNrNYAFySTJxIIRmVmd1xcJuCQKvjy9hSwjT694MT15xSTyhJDtzeo
 9vYLZmdFs+eS1T3EDTmrC7kht9Ff7mgH4gXdWXAjiWv9LMgSwt4EgnSnM960PMKp2IYiRnWYqke
 GjAtuDYZxSaobP8s99d0ygojdwgQzrky8TcrEvfPhfONQFYJVDYSqwFgpOo9kNIYMvtW2qDT00/
 UZhu4fiyTC0NH2Qoqer7gpzut2ucOlb5LNVKmrY8ECpuKMhM8=
X-Received: by 2002:a17:902:e786:b0:2c9:ff83:41fa with SMTP id
 d9443c01a7336-2cbb9ebb50dmr50629105ad.24.1783226273331; 
 Sat, 04 Jul 2026 21:37:53 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 31/46] accel/tcg: Pass breakpoint hit to debug_excp_handler
Date: Sat,  4 Jul 2026 21:37:10 -0700
Message-ID: <20260705043725.1373137-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
index 8d24aaff44..dc1c634258 100644
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
index cca403ad62..bda6dd9e46 100644
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


