Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5B2C44500
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:49:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEbx-0004mm-0r; Sun, 05 Jul 2026 00:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbq-0004ig-42
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:37:38 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbj-0003yq-8z
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:37:37 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2c6b67d5fa1so18031125ad.2
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226250; x=1783831050; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7F1gvRjgVsXT9ENvQ+iUAk5S2n1vMDcJKaBswrQ8elA=;
 b=VarwjM+Fmsen9q20BoIot5qsK6zelo8BGO3vFzYWfYyjTMqeFjbsqB8MJ+w7zNIXHi
 LbbyY/J9a5un4xI2e1k5EBnl4Mc4eUKPysDmy1PjMIqjbP2EU0aWoZSLkZpw8q0c0RpH
 NpszYF4z3xrGUcKQbcA6n//s6w4hr6bakq+XyZgC5fqVN2G74nD9KWd5HyOCxtGs8fs2
 3CKLI9Nj/4CVitZdQRvD6iN3tigAd21iXG9Ob+orYb01SSdkt0fTcySLdnszy8EsIq2S
 CeIYmESwzuQdYfkMsjPPSYpIh2EF2Bgdyb8kM51a0p3YeBgV5l4+RrBNcj2sWkP9GP3D
 xeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226250; x=1783831050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7F1gvRjgVsXT9ENvQ+iUAk5S2n1vMDcJKaBswrQ8elA=;
 b=pRm2sQFfx8iEKo8ouuDY6Ho7xbdEyMRDSb4AiXaBDCAs1FzCIdEuvfothG2kLTTdfh
 EDOF/65oWnHjunIyM8ydW779S+cUZN3OYWZCM9C4UflxnfItt0qAIDp3IYAR8ZQnq5M2
 EOfvf35MAuE6zOeaQombDpYOTKv0gmWrfXUJEoY4DYo54OOYJuNhCpi8l5Nafz83mZHS
 EBnoHEdNza3Oaw3swmIAb1yExmyLx2u7tJUIvOzx4o03HZcRPjIe4khw4+lHnIhq/d95
 5wTHxLGMKnQ9dwakqHzR0kt6vPcPe2NDeYdXYHYHLkMevqrsP9nxlqf++T3TAnU6yByZ
 M2zQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq7axouO9OhPtNWCd/fjXXg3/XnKkkbGXN4hYbkSdUfe2zAmp4lfvhTCT8TfcpZtfQg6Q7HczwfiSIY@nongnu.org
X-Gm-Message-State: AOJu0YxydWm91giv+94O1UWdOraPHJwXRJKYQlfex7CtS+bWSP8Mn/dD
 Kub/i15svizEFyEBdkE7s0iX2eHrup94KxH9tRNGudWhONgrAwpIriPQAjSnqsovoie6OGOBmpJ
 lTRdY
X-Gm-Gg: AfdE7cn+qJmhViFEaOZ80OVjB4ljSbdVZ4jsIA/qNcWkwf61ZRlodK5Fa6XNkp1A4jR
 RvvTivMx7Rr4JK4NEKSTjX5QW+y4DcnE4sxVRfshKYFsLFekMH45WrMEp5aYOee70lypEGlSKIG
 5P6aqCtSZdHw8DBDpRD8LsyVwQyHbDlO/PfiMjm1iGf7zb+W+Tvbw/dmFOo3vpuqcYBBH6DJ7mM
 Iw35hsKd+ciMyWL+eOU+bZBBqGhemTvyXbtKs8exsC0tDWd1vxoKF1suRHBqkVQEZQzrzuTkipZ
 f6KCjyyf3Dq86mo7gKB/gNEjBZ78MH9QBd/53Uz2Kr1s47PmUrlaBM7OO0rJ8Fy3H/oeJYqHNgT
 0Ll0VMf6SGNN9CCOWflB233dqPkaxBej1xoNKCVHislhjkYh5QJbfNvoeT7gk9ddEO5Tzsfn0yP
 8IW4BkWON+OLv59cbtAi0KQqTH4UQW5sIODYiq4lMaNeaC3js=
X-Received: by 2002:a17:902:d510:b0:2c9:d55d:2d3 with SMTP id
 d9443c01a7336-2cbb9e408b1mr57029315ad.15.1783226249536; 
 Sat, 04 Jul 2026 21:37:29 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 03/46] target/arm: Inline check_watchpoints() in
 arm_debug_check_watchpoint()
Date: Sat,  4 Jul 2026 21:36:42 -0700
Message-ID: <20260705043725.1373137-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

From: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

check_watchpoints() is called once, by arm_debug_check_watchpoint(),
which doesn't do more than this call. Merge both. No logical change
intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20260630220100.1289-25-philmd@oss.qualcomm.com>
---
 target/arm/tcg/debug.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index 11043ecd58..7171501d40 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -351,28 +351,6 @@ static bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
     return true;
 }
 
-static bool check_watchpoints(ARMCPU *cpu)
-{
-    CPUARMState *env = &cpu->env;
-    int n;
-
-    /*
-     * If watchpoints are disabled globally or we can't take debug
-     * exceptions here then watchpoint firings are ignored.
-     */
-    if (extract32(env->cp15.mdscr_el1, 15, 1) == 0
-        || !arm_generate_debug_exceptions(env)) {
-        return false;
-    }
-
-    for (n = 0; n < ARRAY_SIZE(env->cpu_watchpoint); n++) {
-        if (bp_wp_matches(cpu, n, true)) {
-            return true;
-        }
-    }
-    return false;
-}
-
 bool arm_debug_check_breakpoint(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -426,8 +404,24 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
      * is also an architectural watchpoint match.
      */
     ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    int n;
 
-    return check_watchpoints(cpu);
+    /*
+     * If watchpoints are disabled globally or we can't take debug
+     * exceptions here then watchpoint firings are ignored.
+     */
+    if (extract32(env->cp15.mdscr_el1, 15, 1) == 0
+        || !arm_generate_debug_exceptions(env)) {
+        return false;
+    }
+
+    for (n = 0; n < ARRAY_SIZE(env->cpu_watchpoint); n++) {
+        if (bp_wp_matches(cpu, n, true)) {
+            return true;
+        }
+    }
+    return false;
 }
 
 /*
-- 
2.43.0


