Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E749C43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:41:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEds-0008FE-3b; Sun, 05 Jul 2026 00:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcU-0005Fj-2C
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:18 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEc8-0004P0-Mq
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:17 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2caed617615so12732775ad.3
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226275; x=1783831075; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aii0dYUlzhh0daweMydBIrcsyG896sPYULsiw+pFWxo=;
 b=WOsf7BRMRpviamxd1MF4I06kPwLbZ0QrQIvnf7ySwHZzDzk0NSZO/4JLoMF0c0JU9X
 GBcRLmwfDvmDFQc3nAzDdt7q97vbAXTRLs3Eq7+L+z8d/4mm7sy+NRcoPZ09zZnWQiMM
 yE9wI3Y7HYvJH2bmeWoMF6P3jzL08L5JAc03sZU+Cr71VjfuPJTFcaLYWJbRlELmKNlH
 GW8bZSEBxrDXk28X+SZfNQltyKZElv9eMUbzyZC3x4gvbncXEeIqcpSeBOmPpbJ9MA/h
 eHrVVlrbaxzbk33ZwNFE13nlnM1vJf/jcfeZaZQ2iuBvaaLN64hORMvtlJJOfQ2AgFIw
 xPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226275; x=1783831075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aii0dYUlzhh0daweMydBIrcsyG896sPYULsiw+pFWxo=;
 b=icczinA4OX16F8gX9Pob5i8uL+PJbwcUMmrIzznszuYImf7mtMc+8WHHyP4MOjvutd
 1nX2hbzVOwm6zY0tGaNgHnk54XClcdZDDCB4+ZhOKktlq3euIM8hL0BmGr630RkXRIg5
 9mgviDmGM0ymtTyouNGmlKbU0+eiXcJRexIqu7sSCWKNfxfr8/IlVhoKA5N50VrKhL4i
 xFXpr82z0G6B2K+08VZO84eb83rNK8XGFaYO91YPGAg1sBUv4n3uZv8hQor2Nlorn+RD
 ABK82dk/jQ/PUzmW2NgraKRTD1wZf6AopvpPBWIkcgd8BWrNWQdrmJGtBdrkc1IaifTH
 nCeA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqozhCvwFzEblVnzt9m+H5MeJb94N1OCgxvlGxrWuW5lduZFrKY4OvOVADqMi085rOEGK8I4JaQxPv9@nongnu.org
X-Gm-Message-State: AOJu0YxxLFkYSHLhJ3GhMVUp7IZlEY6qmPRsbTGBxXvQb5LJk1CIf+zB
 2hhuOafFwLOFh1EJJIYJh1UD/kQjT+ozMpfbNjdBDHrKTZRmKDUzZLyIldhS+uyDLhE0+z1ojPy
 /+8D5
X-Gm-Gg: AfdE7ckMtjSdQeDp68NluBZaVnHGNnNcRDbyFnjU2mgcYYdBxVTrG+V3wUgnehbjBWt
 ho5plhiertnjl6NIlaSOIlQZA5SM9ayPzhC4F0bZbC9yR7UA2Ph3R/KcK5AJNHVWMBlCogfoI4k
 EIFfkyZrNdkWMoBKv1/pxn0M4G9WWOF46Cawe9Za66f877jT4eKmEFZehlMluomx3LGGIr+dzK5
 7jZZRTMkzZU8i5SWYKqtsjV0NTGFdlWDUorJA0ACfW14mDEhQwvBGMxzYGLcNP00UeccgOgJGDB
 6BkOPrAQmOBLIh+4cK8T8YN7Ei5dfqt50Ns/nzQXZTOVkyubMxk+xxT4I8cIFXpkpqb4i6pIMle
 GP79G4LQzGcZFKm/xuYAiIHpgkbdrxcqRAoVcpYy0P6HKPXHIisVBtV9dqHXOVv6seB5UqKRntb
 kmLd2fv+EA+E/qxo9VYzVO8gqXaG+ftLiNBu+vH16uqlfAjGw9wfmmvFjQaw==
X-Received: by 2002:a17:902:ce12:b0:2ca:6d87:e684 with SMTP id
 d9443c01a7336-2cbb9ec3218mr50101035ad.32.1783226275000; 
 Sat, 04 Jul 2026 21:37:55 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 33/46] target/i386: Pass wp_hit to check_hw_breakpoints
Date: Sat,  4 Jul 2026 21:37:12 -0700
Message-ID: <20260705043725.1373137-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Since force_dr6_update is set exclusively for breakpoints,
replace force_dr6_update with wp_hit == NULL.

Use the value of wp_hit to notice which watchpoint is hit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/helper-tcg.h        |  2 +-
 target/i386/tcg/bpt_helper.c        |  2 +-
 target/i386/tcg/system/bpt_helper.c | 32 ++++++++++++-----------------
 3 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 01f4a8bcd0..2227712e2e 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -114,7 +114,7 @@ int exception_has_error_code(int intno);
 void do_smm_enter(X86CPU *cpu);
 
 /* system/bpt_helper.c */
-bool check_hw_breakpoints(CPUX86State *env, bool force_dr6_update);
+bool check_hw_breakpoints(CPUX86State *env, CPUBreakpoint *wp_hit);
 
 /*
  * Do the tasks usually performed by gen_eob().  Callers of this function
diff --git a/target/i386/tcg/bpt_helper.c b/target/i386/tcg/bpt_helper.c
index bc34ac27fe..bcb9869c86 100644
--- a/target/i386/tcg/bpt_helper.c
+++ b/target/i386/tcg/bpt_helper.c
@@ -25,7 +25,7 @@
 G_NORETURN void helper_single_step(CPUX86State *env)
 {
 #ifndef CONFIG_USER_ONLY
-    check_hw_breakpoints(env, true);
+    check_hw_breakpoints(env, NULL);
     env->dr[6] |= DR6_BS;
 #endif
     raise_exception(env, EXCP01_DB);
diff --git a/target/i386/tcg/system/bpt_helper.c b/target/i386/tcg/system/bpt_helper.c
index 8ba5dfcfc1..5dab77b2c4 100644
--- a/target/i386/tcg/system/bpt_helper.c
+++ b/target/i386/tcg/system/bpt_helper.c
@@ -160,34 +160,27 @@ void cpu_x86_update_dr7(CPUX86State *env, uint32_t new_dr7)
     env->hflags = (env->hflags & ~HF_IOBPT_MASK) | iobpt;
 }
 
-bool check_hw_breakpoints(CPUX86State *env, bool force_dr6_update)
+bool check_hw_breakpoints(CPUX86State *env, CPUBreakpoint *wp_hit)
 {
-    target_ulong dr6;
-    int reg;
+    target_ulong dr6 = env->dr[6] & ~0xf;
+    bool force_dr6_update = wp_hit == NULL;
     bool hit_enabled = false;
 
-    dr6 = env->dr[6] & ~0xf;
-    for (reg = 0; reg < DR7_MAX_BP; reg++) {
-        bool bp_match = false;
-        bool wp_match = false;
+    for (int reg = 0; reg < DR7_MAX_BP; reg++) {
+        bool match = false;
 
         switch (hw_breakpoint_type(env->dr[7], reg)) {
         case DR7_TYPE_BP_INST:
-            if (env->dr[reg] == env->eip) {
-                bp_match = true;
-            }
+            match = env->dr[reg] == env->eip;
             break;
         case DR7_TYPE_DATA_WR:
         case DR7_TYPE_DATA_RW:
-            if (env->cpu_watchpoint[reg] &&
-                env->cpu_watchpoint[reg]->flags & BP_WATCHPOINT_HIT) {
-                wp_match = true;
-            }
+            match = wp_hit == env->cpu_watchpoint[reg];
             break;
         case DR7_TYPE_IO_RW:
             break;
         }
-        if (bp_match || wp_match) {
+        if (match) {
             dr6 |= 1 << reg;
             if (hw_breakpoint_enabled(env->dr[7], reg)) {
                 hit_enabled = true;
@@ -207,10 +200,11 @@ void breakpoint_handler(CPUState *cs, CPUBreakpoint *hit)
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
 
-    if (cs->watchpoint_hit) {
-        if (cs->watchpoint_hit->flags & BP_CPU) {
+    hit = cs->watchpoint_hit;
+    if (hit) {
+        if (hit->flags & BP_CPU) {
             cs->watchpoint_hit = NULL;
-            if (check_hw_breakpoints(env, false)) {
+            if (check_hw_breakpoints(env, hit)) {
                 /*
                  * FIXME: #DB should be delayed by one instruction if
                  * INHIBIT_IRQ is set (STI cannot trigger a watchpoint).
@@ -224,7 +218,7 @@ void breakpoint_handler(CPUState *cs, CPUBreakpoint *hit)
         }
     } else {
         if (cpu_breakpoint_test(cs, env->eip, BP_CPU)) {
-            check_hw_breakpoints(env, true);
+            check_hw_breakpoints(env, NULL);
             raise_exception(env, EXCP01_DB);
         }
     }
-- 
2.43.0


