Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BC5C43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:44:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEfJ-0003vR-Rx; Sun, 05 Jul 2026 00:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfH-0003nd-81
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:41:11 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfD-0006OO-Vk
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:41:10 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-846970f0acaso1755710b3a.3
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226466; x=1783831266; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Z8VyrlNOS3AtUzlV7fFAEANc3KY/TwCjUicBVUQopA=;
 b=ppNF5PuNpbI8QeSD5r/vRERadsbJnmQ++YpSiaeFHTizbfigZHQqXX8Hd58KeWME/Y
 xOSshh9Vx6GktctbktWSbk8Nra8NvqHRqZwVQdOzwN8gLwoXnGQWMy8hE0Qf5CIPyOHB
 dZrzsCAVabaYYmqMxW8KmdXjYK07X4X9OKiEu9NqPMiCByWSz8Q7F86cE+O3y/XKX6zY
 SQXQk98XZms5UaSIF9qZaDTjLs8F12vPKkAPnNsPOMziO2e0SZRLcMP703IfiAzHWvII
 zJynTZN1R6a7i+hgod6z1ZBIyg0YjkTJh9NX3YWMlQOt3l5BB/Fnu3iv4/vnGeAO3kW8
 A0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226466; x=1783831266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9Z8VyrlNOS3AtUzlV7fFAEANc3KY/TwCjUicBVUQopA=;
 b=SY0V9APlSQHM1Zdt2OtVyY2D0KdLALjlZodQs6Y1jgN2n9m6ODdas/C1JwF04ApjrP
 qd0JKqtZ85gvpXPd0zNkHC25//DSmBa2vogPtNdGd3mpnChnCqVAAq57hS4I8/veMems
 hPfCQnKGv6ft/JrzRCqftcr2cKrFufWpeErXPfx9UcnU7kV1nasEzwS1GvFCpCaR38gL
 Sc2rEVggBFnMcSAQo7Hud4K5nD2T+i9f12wEKHAn8/3uwU6IPwRSBXNfa+B8R+nc2op/
 ffOUM6JGVkYjfnkCKSO8N/0DamAo5W8kfppNpR83H42kLhE8ggwzkZPU7X5bgAThKfwJ
 cvPQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+1aMXhx9/VhdK/C83Ashawj0HMDGDOOcUCxDslAAWhT8s6sry1OHeMYPqiyA5uMp2cLiRi4WxwXhJK@nongnu.org
X-Gm-Message-State: AOJu0Yy9PWq165NcOUtOPfeyf8yIGW7WsS7EFYjTnNPwRyc+YhNXmdzq
 4/NzRVR3eYni3bjGVs6qRi9owS0dekVeJ7DS8+Vp3k4qDkXv9Cyp0DwYmSKPaDmQYL4=
X-Gm-Gg: AfdE7cmBkfnmxzLlruBklT5qf/+oyS2YgAEjZAYeJ3rvHR2vnsLgTA8j/LmWvyZ45iX
 gVTGARH8DonE6Mj8qXypd5Rn++O8IQYby4iX62ftSMnQag/jxNsq/9dri1YSgxZvFMJdlr0vpar
 kX6lzkLpn+GhVEDWhyW8jW9fGCmS80tMf94qQr59vO4ACaS5IIEBxpqCtmuycG4Q/Sw9q1wVSYA
 XCsPx+y+bdWxygj96/vTX0Yj1xZdUwyVcbngu7I3ceYiD2iakLnSdUgjUIXYhMP4nPRrnq+jAqI
 nhP/c61dMWatdEiVA0Wd35YilaJaV3bAMoZ1q2Txc+CdiDzJ6bNG4kO9/m4Uovq/77Qpb3uCa/3
 H26dwNb1416AigGkIYJrHIQGQRBuxAJaBZTIa4iWQBG6PqfSfbvBoUVrG6+34Nsm8e5InxeCzON
 tLHftTQLPHhPTBpgq/ekGGapLMOFjJH39nWNOK2ZPBixwyyOk=
X-Received: by 2002:a05:6a00:2d99:b0:847:871a:94ca with SMTP id
 d2e1a72fcca58-847f6f3d63cmr4784193b3a.41.1783226466338; 
 Sat, 04 Jul 2026 21:41:06 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6952a0dsm1952615b3a.0.2026.07.04.21.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:41:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 44/46] target/xtensa: Simplify xtensa_cpu_debug_excp_handler
Date: Sat,  4 Jul 2026 21:37:23 -0700
Message-ID: <20260705043725.1373137-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
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


