Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8954C43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:49:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEdv-0008SK-JT; Sun, 05 Jul 2026 00:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcT-0005FG-Hl
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:17 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEc7-0004NG-KT
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:17 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2cad225673bso15465135ad.3
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226274; x=1783831074; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mes9xDUQ0Ck2g/+WTnUtzsbUXNthtYb/ogAdhSHGYlY=;
 b=RRqaEcfxaiRmjYVBkmGKhQJuCxjQtQQtWZTgqI5vcn6nZae0SmFcOxaxGQehREDzuP
 DOiXOTedxpkYZIu4l2CVSkiy0e7aFrcB3pb6JPoPH0xpyyxqtMhsQR+LlJNso/d7qenG
 PHfe1YQ9IYL5R+xp8klfaQaGjBrGoNmkvWuqHWkUEl3LeBYZTgxJmpvc0TgOhmAPDGM7
 M6gyFxqh7kphZcevXZgAnGzzs+pZ2xj8ypY7hSfV3/md2e8xsYGNk8owtO9nnkQkjRQt
 lOsbN2Vcmc9J7WEncn1iLyAmwdPCBHrLIQgGk0I7Souir8NSf1ji+rAKNhmV8MmT9bKU
 ZHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226274; x=1783831074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mes9xDUQ0Ck2g/+WTnUtzsbUXNthtYb/ogAdhSHGYlY=;
 b=a+mhWc9c4avDaEBj8gKz6GAR1ExAg+aFSPgdXvNFSgb1zVVHttOHuNG7RiOqnmPZC+
 tn1vKRT+wstpqgBtdtbIOmvD+73pYQNE+tktogguQaT6yHr2iNwf0SXa273H9NYpMp1z
 XaMebsxKeQvIsvaxo6VllCVD1k0aixtM29CoyTvHvWhAOm6q/vTbsOqR77xMuiaH9jsU
 lt406+DxETnIeOS0W7hI6X5XYKIrcRYHNwA5z9GNplyAbSSBa/lmKui3wwOgtz4DOdB9
 34P8LlygEkDmPF1YsshzCsktzcfPtMm9/QIhFyR2H92IEBsiHHp8HCVkirGHLw2Zn72R
 cVSQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrZeEXXpVBGgQtUK66dlrsazzglLeFXPdujRpTAZ+OK3jUnWhKlqK4ml0MaYQl3m/g5LVZOOXpxFdh4@nongnu.org
X-Gm-Message-State: AOJu0YyNd0pih1oNG2VoKM4eYkXYr0VO0QTEosXYq9Q6JmTXz8OinsbK
 /bmMv1WohzUqOylOAq8zvwBYQQFGOkSmfWeWcTfybFiQPUnwfQc0/7Ah1o5MjITRy1E=
X-Gm-Gg: AfdE7cnkOtWWJaGBXMtb7g2BFU0O1eIPqA4SwjsIRmu4Th6Sika1h0uSgDFc5Bq+t8Z
 UZds+SjPmI1hzVZiqxZOnKUzfrOmpg3r0bBLEGwReDbXR9Z11yK7IEAW45cD7094LJs6kBQAn2U
 n/xakM/IOPj0mZlmzpAQkpcs1OUFaO19YL3Bby4ydHPEfovbIlbkGgPo3omW93P9np18PGU5uuG
 d3rVRbyA1Oj5+gQmL5xwQLC0X/CGGEwyEd6XHoVJ7T4SBlOV4Au8DsyKI1Qq7eQPSQ7EUmcUgei
 T7a+ty6hR57JamA4W0jC3trm1aDNrorDup2saOBOmCgfywyiOJg/RnFqGK4WRWyrZeqGG3z6LDc
 AgeEvAerl9VJwGe3JK1wtWx0YAEIFMHe1UwMF0uhV7qISthODXTNVwLqthM6jmHZPTpAAcenH+Y
 TXm7R/nMX8+n5Nr1pczzoAOlFUWPwYJhxL/Sfj6xdumyNoAcY=
X-Received: by 2002:a17:903:b8f:b0:2c9:97a9:2097 with SMTP id
 d9443c01a7336-2cbb9efe254mr56878805ad.43.1783226274109; 
 Sat, 04 Jul 2026 21:37:54 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 32/46] target/arm: Use CPUBreakpoint arg in
 arm_debug_excp_handler
Date: Sat,  4 Jul 2026 21:37:11 -0700
Message-ID: <20260705043725.1373137-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

We no longer need to search for a matched breakpoint,
test for BP_CPU, or clear watchpoint_hit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/debug.c | 35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index fe8513a5de..d705f7aef2 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -422,42 +422,27 @@ void arm_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
      */
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    CPUBreakpoint *wp_hit = cs->watchpoint_hit;
+    uint32_t excp, syndrome;
 
-    if (wp_hit) {
-        if (wp_hit->flags & BP_CPU) {
-            bool wnr = (wp_hit->flags & BP_WATCHPOINT_HIT_WRITE) != 0;
+    if (hit->flags & BP_MEM_ACCESS) {
+        bool wnr = hit->flags & BP_WATCHPOINT_HIT_WRITE;
+        syndrome = syn_watchpoint(0, 0, wnr);
+        excp = EXCP_DATA_ABORT;
 
-            cs->watchpoint_hit = NULL;
-
-            env->exception.fsr = arm_debug_exception_fsr(env);
-            env->exception.vaddress = wp_hit->hitaddr;
-            raise_exception_debug(env, EXCP_DATA_ABORT,
-                                  syn_watchpoint(0, 0, wnr));
-        }
+        env->exception.vaddress = hit->hitaddr;
     } else {
-        uint64_t pc = is_a64(env) ? env->pc : env->regs[15];
+        syndrome = syn_breakpoint(0);
+        excp = EXCP_PREFETCH_ABORT;
 
-        /*
-         * (1) GDB breakpoints should be handled first.
-         * (2) Do not raise a CPU exception if no CPU breakpoint has fired,
-         * since singlestep is also done by generating a debug internal
-         * exception.
-         */
-        if (cpu_breakpoint_test(cs, pc, BP_GDB)
-            || !cpu_breakpoint_test(cs, pc, BP_CPU)) {
-            return;
-        }
-
-        env->exception.fsr = arm_debug_exception_fsr(env);
         /*
          * FAR is UNKNOWN: clear vaddress to avoid potentially exposing
          * values to the guest that it shouldn't be able to see at its
          * exception/security level.
          */
         env->exception.vaddress = 0;
-        raise_exception_debug(env, EXCP_PREFETCH_ABORT, syn_breakpoint(0));
     }
+    env->exception.fsr = arm_debug_exception_fsr(env);
+    raise_exception_debug(env, excp, syndrome);
 }
 
 /*
-- 
2.43.0


