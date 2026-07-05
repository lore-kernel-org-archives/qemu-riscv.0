Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203DAC43602
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:48:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEcQ-00058C-Mt; Sun, 05 Jul 2026 00:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbt-0004kp-Ak
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:37:41 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbk-00041o-RW
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:37:40 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2cacb8416a1so13306305ad.1
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226251; x=1783831051; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aDmvLx7tFb72uym/SedzgMtxN4MKiCwduhbZZrMhn/8=;
 b=rY8iPn6olfLVS01wUWpJKWrHxAjSu4v8XQcW8qmWfWXOKe7Gp+RZqWXyvC2wUc9pjO
 03+IH3Lre8Sm3S5A58mr4YzzKPrhZMdXTXf/WNkjFQXuT3R3LWXX9sAe0W4MUK4JKYNI
 C0M6jdh8PxX7YKwY6LRtefqTX1Lf+Mqt8ifzuO/AfFGJf6g3o0S7SVVb0zmba8rl3V70
 QwNRKKfjXUhTi1xt4PO4ILXN9Y/a1G8H31CbETyiiOi1sfrVtI2o5igfLUIZLilBVITl
 lw8J9ipeJGcJsk2rhu9mze0aqYgUr2Eu7nNGm/FW6OE0H3d4jeJMzPsMpp2cfa0xtOst
 LgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226251; x=1783831051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aDmvLx7tFb72uym/SedzgMtxN4MKiCwduhbZZrMhn/8=;
 b=DyPBpFlITSciS5i273tgs3Rj624EmqwnauBJyOryOCrj5XiaiIdMXqXYYrhoUDg2go
 cPvmUKTmloppV5dLbPGgM4PeMQVKYJmjAuq/zZomGlh3f3oU4RjhUonZPCgUoaQC/H+f
 tZ5OoVC/zKksOP/A7GLZHxOq8XzhEh0EfP22ThNKoDbParuIzKp5Lj6ohr8OeWtfZDpt
 qRbY07yuhkJxX0/XI09bkQT9cE8sKKT1Hf4jLwdfXbBoqwFa5FBzR1DZZhqD1u9PQgNl
 j5puWORMrtErDKuVESw2YpvbFKYBHlbx6GhLDDTsxV//WYHsxgAJkbwDrOf196USaNf8
 9deQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/bMftJoMsrDjEE7zmy0SAeN2+XFleTIoAkD6Rvmc5BvNRZvIoI20rZeYSgigKIGuwA6sVPd6uxvo19@nongnu.org
X-Gm-Message-State: AOJu0Yxkl7ZmwCl6+exdYmnohZlRlwuH9DfY24yJdybsMpo8zoLtqXU6
 3x096rqtRHNr+fhyCdVJQvdtmvfl0P5VAkEjaTy001CpyqTp7I+g90YJr9Xm8LpPVJQ=
X-Gm-Gg: AfdE7clSzP1pZPUIJeEZzPYsSB2Q7L3PBzK2LMREqnA6kKPV3pTJC3hN73oewGTPIHI
 yAj9GnlVZptXAlz5AJ0ZsIjJ/3PlULvhjTLRBFCXpEAtqkqPXnEPExPEKOx4eKnQ9PsS+NZOcDg
 GAbrDPFuLvUCh+51o/Eih/LmYHDIPIXXFdJzcXhPCSRz02sn2bdG712/qmPHFQA63eEnB04WiuQ
 2RNfd0c/ovzUmh11IjE2PqCOXrcsOohVNla621SDOPqRH7XwqLFwOfrmDcJHtBHlwqmaMXl8ic8
 Q3Us/+5V8sIiysLQ3ryys8ra5f1EVNMeuTyAthtz6r8GbmEYSJMh0otkQLmma8fMBowO0KQj/Fz
 P3Yd6N/LyyJsd9uZjJE87SyaCaYvMA6BuLkcmxy1yyILXG3A1ruMJDpbWD2zsCVyPF3RB9m9UAi
 p4wH/5Qh4qI2FPO/j6JbXMatoi+bc2ItFsxxj/xtS7BYZzhQg=
X-Received: by 2002:a17:902:db0b:b0:2bf:27b2:4b80 with SMTP id
 d9443c01a7336-2cbb8de936emr47138855ad.14.1783226251158; 
 Sat, 04 Jul 2026 21:37:31 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 05/46] cpu: Move cpu_breakpoint_test out of line
Date: Sat,  4 Jul 2026 21:36:44 -0700
Message-ID: <20260705043725.1373137-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Move the function to cpu-common.c, with the other breakpoint functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 17 +----------------
 cpu-common.c          | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2c58ea5e4c..71ed1f17a4 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1143,22 +1143,7 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, BreakpointFlags flags);
 void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint);
 void cpu_breakpoint_remove_all(CPUState *cpu, BreakpointFlags mask);
-
-/* Return true if PC matches an installed breakpoint.  */
-static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc,
-                                       BreakpointFlags mask)
-{
-    CPUBreakpoint *bp;
-
-    if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
-        QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-            if (bp->pc == pc && (bp->flags & mask)) {
-                return true;
-            }
-        }
-    }
-    return false;
-}
+bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, BreakpointFlags mask);
 
 /**
  * cpu_get_address_space:
diff --git a/cpu-common.c b/cpu-common.c
index bc77835aea..ba2676cbad 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -388,6 +388,21 @@ void process_queued_cpu_work(CPUState *cpu)
     qemu_cond_broadcast(&qemu_work_cond);
 }
 
+/* Return true if PC matches an installed breakpoint.  */
+bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, BreakpointFlags mask)
+{
+    CPUBreakpoint *bp;
+
+    if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
+        QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+            if (bp->pc == pc && (bp->flags & mask)) {
+                return true;
+            }
+        }
+    }
+    return false;
+}
+
 /* Add a breakpoint.  */
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
                           CPUBreakpoint **breakpoint)
-- 
2.43.0


