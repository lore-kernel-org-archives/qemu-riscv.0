Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31727C43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:45:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEeb-0000vu-Cz; Sun, 05 Jul 2026 00:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcc-0005Oa-LC
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:27 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcK-0004U6-UM
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:26 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2cc84e77e78so1746415ad.2
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226277; x=1783831077; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GnP83ngqbzOCaEyHZuWHVT2DEUxtaEIT/kVQUZ1VwBM=;
 b=dClL0i5RWjVq+7cOca0wARGvOA9Kk5oFOvfmeOYw5cM1R6WGROgthgQUZbFwDnNc6L
 oP8SxrSlQINySR+/d87LXJ+jJR5j7QdnpqbH7W62tP27pC0urNVoJKhzWcgpgfuiIpPH
 /vPMtSybsdASdCNBa5EINsYbalMwR+o++lhYeIIWSFC0zSQy5gLImTxDQfD6YpPkVCmU
 8lY34bctbZIInmpMl3Y87FtvBAv5kFEfvZO1Z1lUUoohPTkn1sysPaYyIRGXWd5KZFq7
 vjVY+lQLDAi7nPMs7GFl6xKKV1EplhFCyTrjIDXJRR1fTxXb8by6IwznQ+h2qLmm2NuT
 cYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226277; x=1783831077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GnP83ngqbzOCaEyHZuWHVT2DEUxtaEIT/kVQUZ1VwBM=;
 b=pnr9sv5ffOq4/toTQ3oSGbbhVE4EKTbkofAeI3e8oWqMyF7ebTfAcBvuGYoEsbYmXi
 XNYl6x3GvubBPpE0LEjeSFt5w/mZhUWQ77Kvf7ers6vr5waSrT2QLQ5iUWdDkjef0AqS
 cS2yAaJW8Q1m5IMoz2c8IhmNdeh1XJ1xTi+sdgKtYQpA4pyTUP+w6Ldm7fb92RAXWnbq
 KFMpbeg2DjjH3KKfeHi33IRhkiEm/BwuXehbtqUIVwBLrLO3E58XGGoKsMLMCGT29mfU
 5dgva8AIYHJmwyxCrll9IL0n/bR/Ui+UjsLm7zDBKJyEvMAKLSwIqFhYXKOrSAJsspA+
 7vJw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqeKfxz8TIEevmoaFSY/GdKQkBkbyecRr+V+frNtpcRteBBUEADz86CnopidpjGdNQ3xI67JlhyZbA9@nongnu.org
X-Gm-Message-State: AOJu0Yw/0UD+6m6x9ROQebjLMIjPbwDUgc8QWctCPfzz3QgLg5JxlX3S
 /BD3HX1qkYDYnooirUN1g4RIHzS6pmQJ3bCFC8AXSnexK3B0LZfEwma4m56Bo1KumNg=
X-Gm-Gg: AfdE7cnCEa6wF9rx/S2ZnvYFKJgICUvk2q92boNlCbW1mxbqmKEqVZx8c+vKXRdY03q
 JpdlPafjkLSrErWpoh4A8fbWRSkt8TTdIJLyAOS0d2DtssnOa7KGvmeaQbD4ZdgwL/cJ4VEEKb6
 r7AVY9TEktfXhkHSKdLVkKhkuRsNz38SIAPtgmy7AJwLjmUskrlJIRQCXlfMev/gFY13ZiReeaq
 eWNw2ddHkz2DDkXsB7Xoibq0sfvfVvbBzXOof/+/6jHZKSxrzByBQDg7pFY+LV7kKgaOEK+pKRV
 aa2TAKfki88BLq2ogfddApC07KFX2LDQo/va75EVqaz7TnSJaWUIihkuyfyLHKrVyHcKXKePkG8
 nNwEuLp3iDUWwKrO+lViNVi1EerQnYsOjqRpdieebKyFmtSJT0+MggI+8OqB9e9ryxH0hVjjgu4
 fGC7emIXFVRPAIZADzB6dIAP6Px9SV4Siry0T+H0Yahiv6dEU=
X-Received: by 2002:a17:903:b8f:b0:2c9:97a8:8c1b with SMTP id
 d9443c01a7336-2cbb9f086e7mr52110315ad.46.1783226277370; 
 Sat, 04 Jul 2026 21:37:57 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 36/46] target/ppc: Simplify ppc_cpu_debug_check_breakpoint
Date: Sat,  4 Jul 2026 21:37:15 -0700
Message-ID: <20260705043725.1373137-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Replace target_ulong with uint64_t, as we're under TARGET_PPC64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/tcg-excp_helper.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/target/ppc/tcg-excp_helper.c b/target/ppc/tcg-excp_helper.c
index 56ca66e7b5..99ffe4a820 100644
--- a/target/ppc/tcg-excp_helper.c
+++ b/target/ppc/tcg-excp_helper.c
@@ -330,23 +330,19 @@ bool ppc_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
 {
 #if defined(TARGET_PPC64)
     CPUPPCState *env = cpu_env(cs);
+    uint64_t priv = env->spr[SPR_CIABR] & PPC_BITMASK(62, 63);
 
-    if (env->insns_flags2 & PPC2_ISA207S) {
-        target_ulong priv;
-
-        priv = env->spr[SPR_CIABR] & PPC_BITMASK(62, 63);
-        switch (priv) {
-        case 0x1: /* problem */
-            return env->msr & ((target_ulong)1 << MSR_PR);
-        case 0x2: /* supervisor */
-            return (!(env->msr & ((target_ulong)1 << MSR_PR)) &&
-                    !(env->msr & ((target_ulong)1 << MSR_HV)));
-        case 0x3: /* hypervisor */
-            return (!(env->msr & ((target_ulong)1 << MSR_PR)) &&
-                     (env->msr & ((target_ulong)1 << MSR_HV)));
-        default:
-            g_assert_not_reached();
-        }
+    switch (priv) {
+    case 0x1: /* problem */
+        return env->msr & (1ull << MSR_PR);
+    case 0x2: /* supervisor */
+        return (!(env->msr & (1ull << MSR_PR)) &&
+                !(env->msr & (1ull << MSR_HV)));
+    case 0x3: /* hypervisor */
+        return (!(env->msr & (1ull << MSR_PR)) &&
+                 (env->msr & (1ull << MSR_HV)));
+    default:
+        g_assert_not_reached();
     }
 #endif
 
-- 
2.43.0


