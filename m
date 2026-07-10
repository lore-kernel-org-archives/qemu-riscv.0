Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A329BC44506
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:02:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIGL-0003Lf-AC; Fri, 10 Jul 2026 16:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFK-0001tA-HJ
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:54 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIF4-0000xR-9T
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:54 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-84830c774a0so1071449b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716877; x=1784321677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HlU1WJhs/EKnxRmtpuuBgS8HV9oUIdhQMc6Ge3RayaI=;
 b=HtJpNWkwLoR95fmac8+GtHEMOhehaX/IUQfm65dwLdb4paOnXG3HDGDnu6bOQ85r13
 IJcnumPGGi9PKXTtB2gk/lh8GdRjakdp/ui5KdLtyo1HaEJ2/4d9yP5Kt1ZZFe0B91zl
 aCxxVSyBDR+77xB0XBWEFfHZmHj+Y6V5TcNhk/qXxZaIJ5IkjQnXjYhPZXwgdH71Up5z
 xJUAJp9WjtSuOmxXePCEzBXmE6EV+BqwLN3nV8aawPxqIn0yKWqUXeDLmN7hdw4r6rbS
 DohGBnLHk0tQk9DHHv9JT6a3xRParWg/stt6e8diQXrZpF5s+x1D+xYCcnJ1vq13pwLr
 JWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716877; x=1784321677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HlU1WJhs/EKnxRmtpuuBgS8HV9oUIdhQMc6Ge3RayaI=;
 b=mU4gdyPLxeZ41RcxSz5FVL07YZVcO7b93oWLgKJSLPy96bHZLWDGI84lulcWyqoIWW
 l+Ll6ILJZJny2tFqdeTovIekNFX45l4+yB5/auCrXjFVgxWLW/Gv9EAqUK02Ec5Qp9tL
 I495Qv6JgQO5+an2RxjyT1FfEjLZvCW2kzsLg6TWarcTK+ZXYaS1uETMs/CVsaHqdkrA
 kIWbPicbSLB+OXtf3nP7aTT3TLA8L9pr53QVk/Y1YF7h8+heSTPd6Z8I0BmjLIKPrcHA
 VQ22V7UHFE5hdOMPWFUkSIxbg1fxfGXdngLzqo0UMo3N1Hdcu0wG8P3ieTGQUk40PwM6
 zNUA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq7/F3jnF78Ytr8kHCoGD3YYNp9IPCSCZ9xp2/n2GnSvGSHugkPOkaiqo8myFcN32DapkBgSqhq/5kF@nongnu.org
X-Gm-Message-State: AOJu0YxVvk7cQYR6mTIjG4q1QEn/ckT3DLHD/nM8r3C4zCgnsEjZWwDG
 /uts0+mduPpSYdfdnuKOl6dmsha00bgoYHIETFQ3L0OZ+EzLAK8wmZ2RgftyFdgaz4g=
X-Gm-Gg: AfdE7clJf6o6HJ3aVYOgCwH9+YSFsqsoDkCWp9F6mViEOEHeav8ykaTi+Hu5Mu4p5gF
 WPdk1dehojsafgkNN9oa7c7w2Agxdjq+niQ6ZGoaWELa/hqGVWa/SkfGl6yYybpPV4HCuQ+eJMn
 9vlSYFUg3QouRgW6zWTI2bEg7eLPQkAzCnbUNutua0hrOaLipM81T/vJSP6daQ1EHI343yHlyhC
 UESgvlXeiSUAlM7guwF7DUon3l0lqXN+OktRaJ4KL5fsrDMTSxljrfRIJuCwDVLIaNk/xEGbGoj
 kYYv+88MmEzEcIvcNmCnkLFu6gNJLUx9u9vpuAallTw2a5fdAqYO58TLUoB3JWmmMoY911qKyFu
 Dg3xo/M3GKO+sc7mmwMlaPV0lIJsW1Nb6aBCdWAhZsyV4Y7+8CapHnBgqD+hP2LQ5T4oLq7Pfb0
 TeU+KU1vY1VTa0cBaeQHKyxHCY2c6r
X-Received: by 2002:a05:6a00:1881:b0:846:f517:ba5a with SMTP id
 d2e1a72fcca58-84889716692mr549556b3a.28.1783716876615; 
 Fri, 10 Jul 2026 13:54:36 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 31/51] target/ppc: Use CPUBreakpoint arg in
 breakpoint_handler
Date: Fri, 10 Jul 2026 13:53:41 -0700
Message-ID: <20260710205401.836304-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

We don't need to check PPC_ISA207S, because that's already
done starting with register_book3s_207_dbg_sprs().
We no longer need to check BP_CPU or clear watchpoint_hit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/tcg-excp_helper.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/target/ppc/tcg-excp_helper.c b/target/ppc/tcg-excp_helper.c
index 51358c901f..56ca66e7b5 100644
--- a/target/ppc/tcg-excp_helper.c
+++ b/target/ppc/tcg-excp_helper.c
@@ -314,19 +314,14 @@ void ppc_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
 #if defined(TARGET_PPC64)
     CPUPPCState *env = cpu_env(cs);
 
-    if (env->insns_flags2 & PPC2_ISA207S) {
-        if (cs->watchpoint_hit) {
-            if (cs->watchpoint_hit->flags & BP_CPU) {
-                env->spr[SPR_DAR] = cs->watchpoint_hit->hitaddr;
-                env->spr[SPR_DSISR] = PPC_BIT(41);
-                cs->watchpoint_hit = NULL;
-                raise_exception(env, POWERPC_EXCP_DSI);
-            }
-            cs->watchpoint_hit = NULL;
-        } else if (cpu_breakpoint_test(cs, env->nip, BP_CPU)) {
-            raise_exception_err(env, POWERPC_EXCP_TRACE,
-                                PPC_BIT(33) | PPC_BIT(43));
-        }
+    if (hit->flags & BP_MEM_ACCESS) {
+        /* watchpoint */
+        env->spr[SPR_DAR] = hit->hitaddr;
+        env->spr[SPR_DSISR] = PPC_BIT(41);
+        raise_exception(env, POWERPC_EXCP_DSI);
+    } else {
+        /* breakpoint */
+        raise_exception_err(env, POWERPC_EXCP_TRACE, PPC_BIT(33) | PPC_BIT(43));
     }
 #endif
 }
-- 
2.43.0


