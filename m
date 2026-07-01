Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96579C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:09:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welGA-0005zc-Dn; Tue, 30 Jun 2026 23:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welG3-0005oT-B0
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:05:03 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFz-0002to-9q
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:05:03 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2c821a50615so953945ad.0
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875098; x=1783479898; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8qTIMHwz1Nx+GGcIl7ueTFBZIpYrxFuhh8bdVUncVE=;
 b=zX1db1xGD4b4QfNogYb0R3bZwPbdejJAfjxJ/0tUvtDxzducJmp94nZRPQ9DcpPJuc
 9MBnA2ZqtTB1BiR4XkLxifduVVYQUIj+svk/VbtuKbDpP1PKXxm9QCgcH9pQ0hMOuQYR
 MnokEbglEwEhQMuVMMlvvTHo1N9Qm2EmZTK2zl0LMsACm65ErYx1fKv1BG2wGgI8rgKG
 r4HbhuxVZMUqhBnjR20g7RVnY5ZXb3RHOgmAPtoKnQAtPMdhJhBu5T64cEqG4G0CXzAS
 tz5BUEQDDuKBzvsJD6n3CCNLPUO2gsmvW3YB2qm0aRPg0e6kGNCJLDPPYtiTwgtDINuN
 DHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875098; x=1783479898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M8qTIMHwz1Nx+GGcIl7ueTFBZIpYrxFuhh8bdVUncVE=;
 b=qUqP2d2oFca0/DgjepQuJd9fF3Z3XYclO//kTFFuryoeZOHvU1pwRMhfD0TcwfbMEO
 UPt0VaRg72A1xaPVWnznwSdVo30yFrtQVeVdKrL/0Rg6l3lU7OMbdmm2JE2IFZw438nr
 2m8lnDj0OaImZ7n9OS0q1iKIW/wqlcpqQBBbNZIWJMcVMCg2rLdUb4MLthMp/+/G8vRm
 N3wsPLG0wPh/IHHGK5XucLh/aNuF8TAt6iJ3zV6Hk+iTA/3UswRl+9wJmAHwQoy2QYNA
 Vl4FlMVk6vKAKE0yrLq/fnz3j3DM2Y5Uy6gb9o84Eb6CEGaIKcHfiIadzdDbf55pd636
 YA4Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrIQNog4rxOPVjbW/j0BIcbaajCFHrsdwByGun0GweYqKB6hWrdmej5PSSAnXIesjOQQgsZV+JdEIN/@nongnu.org
X-Gm-Message-State: AOJu0Yyc/xaXHGwlnOBzZk60vumeES2nqbewfAxTXiSwj/NSVH3/8TW5
 ekCHDzLMhBkqjWY10LUgsjsgGdDyzEKf6qT0cAEyH2trrAq1aEV1Nb+un+Gx1g3ob3o=
X-Gm-Gg: AfdE7ckis/0nR0kdEkEWtvsJI62J9ZAspBOYK7VjnQCnvplGvQA9mIUDfZkCnlX612z
 JBjOa6Ed6w4ftLIy9c6A0BOrrheKnB2aHfU7UPN8KYpQlWKdqKqj9joD9icAFfJ9tVGh4qSXvu4
 xm6f0Z/NoBS9FCW+eGpgOJAX1NN7az5UvH6W3EPJBLKfWW/CwyK1cV1jcfpJ2x0cZjcWu8vTFQo
 BoLakH+wQFVH6PnAAjjDMesgeWfIUsBL4DCbIVuBH8iVQqCLiT5i/LgrAwQoDunViMBC1Qvkq5T
 W9j1ww9n7qOY5zYScwH5TcVyTAZQTYBBVYai0JXylxIv1iAQ04naba7LcYu9nufzPPTDKCy+0rd
 JutpT5R0IzYRdx0Nfw84bCU0sQCAM7JbiKd7WoCzgdc5fMFWircSu+dQILDMyfJU3nw5qPq4OEQ
 o373kbrFXdNdtqoYfIPSigw9bN1uVsYqWEawNBWvE6K79z5C8d+w==
X-Received: by 2002:a17:902:e5ca:b0:2c9:bd3b:34f with SMTP id
 d9443c01a7336-2ca2ea1bb17mr48617975ad.35.1782875097700; 
 Tue, 30 Jun 2026 20:04:57 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 16/17] target/xtensa: Use BP_CPU_ID_SHIFT
Date: Tue, 30 Jun 2026 20:04:42 -0700
Message-ID: <20260701030443.1382447-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Set the id when installing the breakpoint, and drop the
loop when checking the breakpoint.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/dbg_helper.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index 160cdd798c..5b957474ea 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -44,7 +44,8 @@ void HELPER(wsr_ibreakenable)(CPUXtensaState *env, uint32_t v)
         if (change & (1 << i)) {
             if (v & (1 << i)) {
                 cpu_breakpoint_insert(cs, env->sregs[IBREAKA + i],
-                                      BP_CPU, &env->cpu_breakpoint[i]);
+                                      BP_CPU | (i << BP_CPU_ID_SHIFT),
+                                      &env->cpu_breakpoint[i]);
             } else {
                 cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[i]);
                 env->cpu_breakpoint[i] = NULL;
@@ -60,7 +61,8 @@ void HELPER(wsr_ibreaka)(CPUXtensaState *env, uint32_t i, uint32_t v)
         CPUState *cs = env_cpu(env);
 
         cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[i]);
-        cpu_breakpoint_insert(cs, v, BP_CPU, &env->cpu_breakpoint[i]);
+        cpu_breakpoint_insert(cs, v, BP_CPU | (i << BP_CPU_ID_SHIFT),
+                              &env->cpu_breakpoint[i]);
     }
     env->sregs[IBREAKA + i] = v;
 }
@@ -68,18 +70,12 @@ void HELPER(wsr_ibreaka)(CPUXtensaState *env, uint32_t i, uint32_t v)
 bool xtensa_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp)
 {
     CPUXtensaState *env = cpu_env(cs);
-    unsigned int i;
+    unsigned int i = bp->flags >> BP_CPU_ID_SHIFT;
 
     if (xtensa_get_cintlevel(env) >= env->config->debug_level) {
         return false;
     }
-    for (i = 0; i < env->config->nibreak; ++i) {
-        if (env->sregs[IBREAKENABLE] & (1 << i) &&
-            env->sregs[IBREAKA + i] == env->pc) {
-            return true;
-        }
-    }
-    return false;
+    return (env->sregs[IBREAKENABLE] >> i) & 1;
 }
 
 static void set_dbreak(CPUXtensaState *env, unsigned i, uint32_t dbreaka,
-- 
2.43.0


