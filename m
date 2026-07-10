Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215E5C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:03:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIIG-0000Ue-IN; Fri, 10 Jul 2026 16:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIIC-0000J5-Lx
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:57:52 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiII7-0001rc-7O
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:57:52 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-383b4a3755fso1392291a91.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783717066; x=1784321866; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YsP83YiTkmrY79bbOPi3SHoXW0ymWPjIg1hBoCFHly8=;
 b=RdvFuxcTnbZ3OJWmJ+PaH7OfNa+Bfvu2HkBTv6hwbjHj3Mq28kQ78MUsORNEjl9a8C
 2EqAeS9hehk/06H3lOR++sledon+jSPK7LVamiIHDXsjIEG7CDHvdIZzzTk9psXlR8Qd
 RnfvRmCyF7ApAL3LudSI+5J8Fb7UDa1jfR2ATMSabkXe6rr56LGtu5hXzPRnd6K8EG2v
 2zUlfKidINd1G0rY32gqNR1P37aYgKlMO51Thuoh0ImzPHG889uyEVBLtW1Y7QwUKWDI
 5h2VX4rPX1rF7kBUbdBT0nqZb+bVnhS+FAK0vJgnYJX7DVVAusuE4Ob4NCmaZusEgUrl
 710A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783717066; x=1784321866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YsP83YiTkmrY79bbOPi3SHoXW0ymWPjIg1hBoCFHly8=;
 b=Ze6IUjjHXgztZfDF3Z6j9QRjI1Zqqmed4lcqfUUB7gd94yBXkWuE/+rMvfs5rTfy/4
 7vmktzWiH6aV0DhzvEB3VIjv/YT2Hfk3xbsWcT5dp+RG+9kFtObL45Ha9fK0IEhspA7b
 fJoBa1LTNGA3wKT7/B9Ke/pH+aYVWM5yECtr8erCp+yWMUoDUq0dIq6zDwXbkX5Ou4w6
 FsCd3V30PX5/+a5eLtiS1KLPZmI9ZqBm6KEkTaDSfv4KNdF0ztz9PmuD83uwkVyHDH+f
 Qv2uufPYSuobSKN5Cp2jaWwQrGelTBMu1Bhz5extn3wV5/wxR7KMeKaEGFv4QiPy3xja
 gu/Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoLxdMoJBAIip1BafSm3bhQUot+5Smg+1LIA+u+TOI71Ie7IxowbOVyQ+wicditG5AXfG4uMRyVWHUo@nongnu.org
X-Gm-Message-State: AOJu0Yzd3Q+jB/csVcE0G6/F1VacaBW+8TBuNjSNCH5SStfaRohd+wkh
 gBjnM4vP09dT5UjWGpHdiNpQ2lgEzI7vechJLbcL2PfPbApGMZD0oFIdv9cDJDuNSVo=
X-Gm-Gg: AfdE7cm2pQ4WqIqbU3g6XAoGPvvWLTKL+75OPQcszAULjKHH2VFU5bwJS9RgZ8IIXjz
 s7ZmYu/LWnX5IoVmZAgOC3vUmlJG8v1lYLvmvbaEk8taJ9ce7tUaabkGV+9eY/ROPQeAeMYHILC
 uPzOzqX2H4lj3kSuDyNLBRpQyVs9CaVmSQk7LR5G/ktf/PJdLcoKqWkFO7EnCIBt/lCEAP6rYsa
 AwveEfU9bDcAROvVkYPY5kqziF9J0nU2lv8//KN2BHOizW6cnzw3lnKP4hzTzYaAn3cuO9Wq4Ae
 EUVcsXDAPElTgjpW2MUNZt5mCG7ieJatSVSGfa6Vw5XUXP7+ilHVPS4FS7IHxnJYstWuL5xE1Xu
 Zh+9JQduEZxMjxjzgp73pPlNtKrVk8LoKye9SulDn3iy4YPHfXLP2LGgvHfuulC4quF/s7wHnWL
 3VRrDuOu/pgPL0zpu0QA==
X-Received: by 2002:a17:90b:33c8:b0:387:e0db:3fb1 with SMTP id
 98e67ed59e1d1-38dc77993c3mr526112a91.42.1783717065807; 
 Fri, 10 Jul 2026 13:57:45 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38a58792cdasm3256221a91.16.2026.07.10.13.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:57:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 41/51] accel/tcg: Clear BP_WATCHPOINT_HIT after use
Date: Fri, 10 Jul 2026 13:53:51 -0700
Message-ID: <20260710205401.836304-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Now that all targets have been converted to use the
debug_excp_handler, and no longer clear watchpoint_hit
themselves, we can clear BP_WATCHPOINT_HIT after the
single usage.  This avoids a loop over all watchpoints.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 23 ++++-------------------
 gdbstub/system.c     |  2 ++
 2 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index a4eb1f1c31..68d434fff4 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -685,27 +685,12 @@ static inline bool cpu_handle_halt(CPUState *cpu)
 
 static inline void cpu_handle_debug_exception(CPUState *cpu)
 {
-    CPUBreakpoint *hit = cpu->watchpoint_hit;
+    CPUBreakpoint *hit = cpu->watchpoint_hit ? : cpu->breakpoint_hit;
 
-    if (hit) {
-        IntervalTreeNode *n;
-
-        for (n = interval_tree_iter_first(&cpu->watchpoints, 0, -1); n;
-             n = interval_tree_iter_next(n, 0, -1)) {
-            CPUBreakpoint *wp = container_of(n, CPUBreakpoint, itree);
-            if (wp != hit) {
-                wp->flags &= ~BP_WATCHPOINT_HIT;
-            }
-        }
-    } else {
-        hit = cpu->breakpoint_hit;
-        if (!hit) {
-            return;
-        }
-    }
-
-    if (hit->flags & BP_CPU) {
+    if (hit && hit->flags & BP_CPU) {
         cpu->cc->tcg_ops->debug_excp_handler(cpu, hit);
+
+        hit->flags &= ~BP_WATCHPOINT_HIT;
         cpu->watchpoint_hit = NULL;
         cpu->breakpoint_hit = NULL;
     }
diff --git a/gdbstub/system.c b/gdbstub/system.c
index b36e957b95..c78fb330c4 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -170,6 +170,8 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
             g_string_printf(buf, "T%02xthread:%s;%swatch:%" VADDR_PRIx ";",
                             GDB_SIGNAL_TRAP, tid->str, type,
                             cpu->watchpoint_hit->hitaddr);
+
+            cpu->watchpoint_hit->flags &= ~BP_WATCHPOINT_HIT;
             cpu->watchpoint_hit = NULL;
             goto send_packet;
         } else {
-- 
2.43.0


