Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660F3C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:02:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIEs-0001K3-Hq; Fri, 10 Jul 2026 16:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEq-0001H9-0n
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:24 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEh-0000fq-H9
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:23 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-84830c774a0so1071222b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716854; x=1784321654; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w7mbi44ms/ED7IuWTQq/DSHUQAsdDGZrhybOFw4BdE8=;
 b=Ku7BUNiKjm3IT0HvBzZtYO66oSesFDeHdf6uXzsv+AHHoj458mpIjq0NjlEVwz3kuK
 1NFDByL8GYnlXkU6CAdDL+VvrGlV8n0OlG7iHpXWRQEnH/NBcooM2QDSk7lU2cwI2D5j
 aIzzddcEb5/Qr1wQ2R8j2cQR/Nb+O8DQqx+tFslBQhInlbUnTkF6BQeHCVLbYeMGxWyC
 8g1s/as//YLxMAY6U5blGMds76wPB7TTJs+N+/1zoHgBvxYUhUEiUjFAkqCDjhfbB2T1
 XIxERueJyP6EOfoZxB0T622pwXDzAfBsi5TiqQyshpGG7/wTs2/rc+F15G8Z7jdG6jtk
 96Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716854; x=1784321654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=w7mbi44ms/ED7IuWTQq/DSHUQAsdDGZrhybOFw4BdE8=;
 b=YR/uBMNt/LPlkW6LC0o3gcRYtbMPvl7bHsl4LEvOfiCpwyPWOeKqQmV9sHhFkHRvCU
 dChYL/ZMoGcxpVwBSkWrbHYVts7ShrC1EG0vMQltME/bjWAwA3m5g9+illVeRf90JqrU
 i7NB4UvTtTGnNsEArYGQ3gZAGdybobscT2YqXZ+lYEtsrtvsueTNKYc6LEhayR3r1dDi
 216DIzY2jldXr6SMEhARSBY9N6qrniEEGvqd8xAwSq+n23zau2ZnagdQf4w0p56al/D+
 tOqJkkpGSL1qqdDHOzpff0c0An++oiQ81OzaHq6EWO2xV6cndBsO6GdXw7kdotOfdB3G
 UBlg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp5cT1/G0c1WDNJl7neqPSO372vRUp72amho7+KQdyRG82kLU0D8eI04M/H/7fzFxWOxt93fx5GNHH0@nongnu.org
X-Gm-Message-State: AOJu0YwZd7bdrAVvU/GCeDsvnLuBtq89cJKV/c4CMmM+kIPPw6iF3ff5
 29Zs34Ebca/DAkU20VqfQH56d5WMvCR9wx/n/tKwKTuxF1SfhnjnwFh/uJfkuH7pLyE=
X-Gm-Gg: AfdE7ck3meeLIRXczaj65IIwjQZPcxi/g3C6VnhEt5FBaC1DDTdm6k79hgpSyXYMCl4
 RULTde6ezxr1/tK7Kajvq499C2+8BAu9u0VDRd2b5lTC+o/iUQl7UBwkgAqGade7pUdpditoGRC
 ZjIHk5RzirUTmAlkewFCG9EqO7ItQUQ3tvCWjX7yIwqG1r7720YRoOeSj5vS+J92N8oBHZeQJeX
 rb6DQvEl1DsNTgX8ZRTFIxiXxhRjjCuFcnZRKy4sHNLUsaFe6Zq2xdqZ8EUt8HoVmx/Whu9SVKE
 IHLXrypYNWVDK0C+FmUtDjXuP3p+1CORyk06W2I9zxuY+lgLoW7nWDBLdHqKal7Okh0mz0k3GKA
 P9E1bEPGSmFeHChNKaAX7R6tG7pe4+cYdsuIQNerqm5PS+CrpELUGneQ4fneJOau9GDCqLUAT7g
 5et1vDuA4BV88VNlA/Ww==
X-Received: by 2002:a05:6a00:4207:b0:848:68cb:5c74 with SMTP id
 d2e1a72fcca58-848898343a8mr470769b3a.60.1783716853081; 
 Fri, 10 Jul 2026 13:54:13 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 09/51] target/arm: Split is_wp out of bp_wp_matches
Date: Fri, 10 Jul 2026 13:53:19 -0700
Message-ID: <20260710205401.836304-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

This function is only called twice, once for each of
breakpoint and watchpoint.  Hoist the separate bp/wp
code into the respective callers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/debug.c | 49 +++++++++++++++++-------------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index 306106b7e8..519a06fbc7 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -252,41 +252,16 @@ static bool linked_bp_matches(ARMCPU *cpu, int lbn)
     return contextidr == (uint32_t)env->cp15.dbgbvr[lbn];
 }
 
-static bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
+static bool bp_wp_matches(ARMCPU *cpu, uint64_t cr, int access_el)
 {
     CPUARMState *env = &cpu->env;
-    uint64_t cr;
     int pac, hmc, ssc, wt, lbn;
     /*
      * Note that for watchpoints the check is against the CPU security
      * state, not the S/NS attribute on the offending data access.
      */
     bool is_secure = arm_is_secure(env);
-    int access_el = arm_current_el(env);
 
-    if (is_wp) {
-        CPUWatchpoint *wp = env->cpu_watchpoint[n];
-
-        if (!wp || !(wp->flags & BP_WATCHPOINT_HIT)) {
-            return false;
-        }
-        cr = env->cp15.dbgwcr[n];
-        if (wp->hitattrs.user) {
-            /*
-             * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
-             * match watchpoints as if they were accesses done at EL0, even if
-             * the CPU is at EL1 or higher.
-             */
-            access_el = 0;
-        }
-    } else {
-        uint64_t pc = is_a64(env) ? env->pc : env->regs[15];
-
-        if (!env->cpu_breakpoint[n] || env->cpu_breakpoint[n]->pc != pc) {
-            return false;
-        }
-        cr = env->cp15.dbgbcr[n];
-    }
     /*
      * The WATCHPOINT_HIT flag guarantees us that the watchpoint is
      * enabled and that the address and access type match; for breakpoints
@@ -390,14 +365,16 @@ bool arm_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
      */
 
     for (n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
-        if (bp_wp_matches(cpu, n, false)) {
+        if (env->cpu_breakpoint[n] &&
+            env->cpu_breakpoint[n]->pc != pc &&
+            bp_wp_matches(cpu, env->cp15.dbgbcr[n], arm_current_el(env))) {
             return true;
         }
     }
     return false;
 }
 
-bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
+bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *ignore)
 {
     /*
      * Called by core code when a CPU watchpoint fires; need to check if this
@@ -417,7 +394,21 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
     }
 
     for (n = 0; n < ARRAY_SIZE(env->cpu_watchpoint); n++) {
-        if (bp_wp_matches(cpu, n, true)) {
+        CPUWatchpoint *wp = env->cpu_watchpoint[n];
+        int access_el;
+
+        if (!wp || !(wp->flags & BP_WATCHPOINT_HIT)) {
+            continue;
+        }
+
+        /*
+         * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
+         * match watchpoints as if they were accesses done at EL0, even if
+         * the CPU is at EL1 or higher.
+         */
+        access_el = (wp->hitattrs.user ? 0 : arm_current_el(env));
+
+        if (bp_wp_matches(cpu, env->cp15.dbgwcr[n], access_el)) {
             return true;
         }
     }
-- 
2.43.0


