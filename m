Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B144C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:03:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIIE-0000Ot-O4; Fri, 10 Jul 2026 16:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIIC-0000FF-3d
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:57:52 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiII6-0001r3-R0
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:57:51 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-381018b9375so1737996a91.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783717065; x=1784321865; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9Z8VyrlNOS3AtUzlV7fFAEANc3KY/TwCjUicBVUQopA=;
 b=NCElr68YS9piSHtJUMjfvpqYzpoHGLcEBEJLrndO+kjGtoPbbclWiPUxqUwYl04lFw
 pptH5MGygnufRYYyuZOrPYQuWNA+uDuOVQrjWRWbcatrOUg0gQj1iljOvWDAcV+yiOJQ
 g8pxlbQXCtAfimrWOJXCJX7SMMfGPc2BSJMqRjpe/s8vsaldXMF8+6BkF5amg4ipeITu
 gAmR1GHTX7Cn3EQpmaqMCZ0WG1jXMdT7gRwyAPs+5jGpv3nu89V9eSjEEiT43IyHYU4V
 aMM/1ZRbqPIDlFalf28tNDhtgTf0k8gb1/Bu7TLHxdEA+EIZrLNncKF/iiD6yJXjVr1P
 4V/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783717065; x=1784321865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9Z8VyrlNOS3AtUzlV7fFAEANc3KY/TwCjUicBVUQopA=;
 b=jb2GHCwmbTS3DjHe8w5DVTFRwmQaRu9+GDRE2S87kZZ/5AOH3X2FA6GJAFHVb37HYp
 Pne89oZJYBcdfPZBIMTv6QW54CnPqzapwgqE5+T2LETCI3dO5RTfY6ZxdLk26Wu6HorN
 GanhDJkF9vsm1Zh05w3PUouJ7MTvw29IJq7t9iDluM5p+fryZZNNRuMyn7PhN2HPe4Z1
 bwe8Oz7805A3WPTwsggxOaFJ6R3HLHGY066Vq8C9PVOnHgbG6QEY3CgjIjdE5Pk58y9S
 99/bFCmUOc04JZXJ+4Flx+E4PhUMFVSYS582CzSMlcxQsZnUkQbaFJ0p5+jaQpeEoIxh
 55GQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrdqq7iKMUMYLKnA4YWaGFUJb0fmOW5JehZRlyMDrUuCa60R14LMqR+brfImVIyn+KIRNiPdR7kOq8p@nongnu.org
X-Gm-Message-State: AOJu0YwH7ob8aN5n+305/5RunaMghNStkgQfCO+AxL4FVKXenIVLAKmn
 xawS/jrZi2TDw61C9z5xtC8g0XFbCOxP+r4wO4QzA6HmnkOzwte1Rh1ZOSJWJx2C8l4=
X-Gm-Gg: AfdE7ckR2B1Kaa6pE5bOymjl/fyLFUkkp+1WJE/ETW0Jrz7ZUdMs/GeWF+K0IRQ57aS
 MSOOuvrpsrGmVRl/nJAvonIsX3a57rlDr9MI3ewoaNyKIWhhykbtL4jylOVntZDfyVzc7Mg2LUU
 NFwYY+gaJ21YCHKcgmPEScVgQRY5YR/JOfZaVVZFK4zOB4hnbWo0eH3TCK+dRJOZ0BXWh72Ee5i
 ISMsm5ysUJPMkOSSY3AMXyFXN6jYGd1gMA2Qk8jHF7IsKQbd2W6Q1m2GYHqAu3sQrATUZ4eiOwK
 Dvx3Rv6JdSKf9u42cKA0V71tW6vWmywewXIPP5lB3WH+fDWjZVdfcuLkjGGzh1sX+s7aqGd86b9
 ERgoZwlLi/NnbMeIVZaoV+nuOakjU480Zfozj11EdRFe5clQb/JwgXb1fJuhF2szVspY3qYoNF8
 L3b3m+8rEawamsq0bJOg==
X-Received: by 2002:a17:90b:2750:b0:387:df8f:1405 with SMTP id
 98e67ed59e1d1-38dc77badd3mr469550a91.38.1783717065021; 
 Fri, 10 Jul 2026 13:57:45 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38a58792cdasm3256221a91.16.2026.07.10.13.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:57:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 40/51] target/xtensa: Simplify xtensa_cpu_debug_excp_handler
Date: Fri, 10 Jul 2026 13:53:50 -0700
Message-ID: <20260710205401.836304-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

No longer need to check BP_CPU.
Use hit->id instead of a search over ndbreak.
Unify the raising of the exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/helper.c | 41 ++++++++++-------------------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index 7643e97b2c..f66d0bff04 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -207,47 +207,26 @@ void xtensa_register_core(XtensaConfigList *node)
 }
 
 #ifndef CONFIG_USER_ONLY
-static uint32_t check_hw_breakpoints(CPUXtensaState *env)
-{
-    unsigned i;
-
-    for (i = 0; i < env->config->ndbreak; ++i) {
-        if (env->cpu_watchpoint[i] &&
-                env->cpu_watchpoint[i]->flags & BP_WATCHPOINT_HIT) {
-            return DEBUGCAUSE_DB | (i << DEBUGCAUSE_DBNUM_SHIFT);
-        }
-    }
-    return 0;
-}
-
 void xtensa_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
 {
     CPUXtensaState *env = cpu_env(cs);
+    uint32_t cause;
 
-    if (cs->watchpoint_hit) {
-        if (cs->watchpoint_hit->flags & BP_CPU) {
-            uint32_t cause;
-
-            cs->watchpoint_hit = NULL;
-            cause = check_hw_breakpoints(env);
-            if (cause) {
-                debug_exception_env(env, cause);
-            }
-            cpu_loop_exit_noexc(cs);
-        }
+    if (hit->flags & BP_MEM_ACCESS) {
+        /* watchpoint */
+        cause = DEBUGCAUSE_DB | (hit->id << DEBUGCAUSE_DBNUM_SHIFT);
     } else {
-        if (cpu_breakpoint_test(cs, env->pc, BP_GDB)
-            || !cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
-            return;
-        }
+        /* breakpoint */
         if (env->sregs[ICOUNT] == 0xffffffff &&
             xtensa_get_cintlevel(env) < env->sregs[ICOUNTLEVEL]) {
-            debug_exception_env(env, DEBUGCAUSE_IC);
+            cause = DEBUGCAUSE_IC;
         } else {
-            debug_exception_env(env, DEBUGCAUSE_IB);
+            cause = DEBUGCAUSE_IB;
         }
-        cpu_loop_exit_noexc(cs);
     }
+
+    debug_exception_env(env, cause);
+    cpu_loop_exit_noexc(cs);
 }
 
 void xtensa_cpu_do_unaligned_access(CPUState *cs,
-- 
2.43.0


