Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2469FC43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:47:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEef-0001RZ-Tt; Sun, 05 Jul 2026 00:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcd-0005RO-VC
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:28 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcN-0004XC-Ly
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:27 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2cad225673bso15465505ad.3
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226280; x=1783831080; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zEoEbldckN16OhTsR6Zaa+zbm5X/cyDm4W7LiW18RHY=;
 b=VPEstlgkTS8voriYzOBdFJd/hJRHkMe8kIs6gxkbY7TA2KEpEI7R0OsLhvSZ0izB+/
 eZQbpMgKvImcadSY984sQrWl5AZ+7PrLQHpUl2sdtnVz9JX0GO6O10HFQLqs6eX0IApx
 PhNf24XwXm8uKdrl0ZGcVpWdYzhnnWht1G/xiWMU1DhlG9GJElSYDpPUxP3RNg7wYPHR
 uKMO4eSz7ea/QNl+O4g2d5g2y1n9g1VMP7orOJ1b++VqAWGOiJpGdV57V8jB5ZpAteFq
 hXmxEP9c/HWzRsYcdUi76Gc9Gpj52Aktcb5sYat9wi7Cx+12i7rl6cjjTpmdqpRjUROC
 yvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226280; x=1783831080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zEoEbldckN16OhTsR6Zaa+zbm5X/cyDm4W7LiW18RHY=;
 b=b9eeP74KmiZU+MTcmOrACS8uVOjoiOh5MN7ER09sGgRJ3Tl6ai5LfBV3EjKW5YFcMv
 KVT7b+CI9ZJ3kxBX0zqFg5qY9d+kMOmR+hD04wNXyW2Jp7F1yFgAyoyrZJQFwgd4Ow8D
 Xbnaq0I/JZrc/PLPeWsELWs/Po/8KmurpU5y64NNy/PLowho1eKXO/wMZ8hgkC9dFYR1
 sc3s+TV7qGeGa9gmFHIe2PJ0c0CNjHK3JNemfhQIqOS9/B10NSOz6/5sEqjOgLknX+dG
 jUmGtLwL9NitTuIHnzQWSelLBIJjZToxfKNHyxUwEI8IzUDvlPUiEk/P1kkbWL+lD379
 lXxw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpaNWPBFCEwJEOZuWgi45Q36h0lfDkxtOm+U4BoBgpeS1ZrVDB9iMHaADOVCYHv5PfCOlSHCJDPlg+v@nongnu.org
X-Gm-Message-State: AOJu0Yx0NUGy2uXgpOvXeDYitaJ+TXI4Fh786NKb/yKONNiwOLXtS3Sm
 kRBChYvj8WsEeqDJE2oEOL1bXWqK4G+EnOzO7d2BzfToBy18nratbciz4K+BX3MkMW2Devx3pls
 6PcHN
X-Gm-Gg: AfdE7clWO6UEZGKWaWwdusrcQ50AN5dQd9lype4T02Lpvm7aPntHzwYAJI5nHMHFoCc
 AUHDP7KeX/fHiZd+LVI5g8yLoBF2qO1gqEjzVyEGNYdQwf4OYx6pPWeXuIXZrxwtsOTiQE+pYFF
 i3rclu585w2ePaQMfYUToSg9bL8AhI1xENCc0112F4wHKMO6335EGsakGrD6j1Ip7S71UYqVNyt
 eG4lI83Guf3XSpLLARl96AiqFYZFrT7qNsVXNsVf9vtniZLJRKITMn5ceCaG+Jj5rTqq0ka9TCH
 Q7i3YIRyCOv6InyoGHUgYkZne+BjfsXw+24RlkQBDx9FElT2ebsiKDjCcPPjhEvBI0/5hF6CbCx
 mbYJzXWYTgr8EBgJzCzdM/i4LZzglcm4CjRuZ69Mo9VrVSoCxF18KQQ/ZnUehXp5cwLoIACd9kw
 Dfl/21FbPRR7S6vwkxvXEQ7wiFTANwOFAE+EtA9okarM+mBpw=
X-Received: by 2002:a17:903:b8f:b0:2c9:97a9:2098 with SMTP id
 d9443c01a7336-2cbb9f008dcmr55689425ad.44.1783226280287; 
 Sat, 04 Jul 2026 21:38:00 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 39/46] target/riscv: Simplify riscv_cpu_debug_excp_handler
Date: Sat,  4 Jul 2026 21:37:18 -0700
Message-ID: <20260705043725.1373137-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

We no longer need to test for BP_CPU.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/debug.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index a8429778f6..994a77fd31 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -919,15 +919,7 @@ void riscv_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
 
-    if (cs->watchpoint_hit) {
-        if (cs->watchpoint_hit->flags & BP_CPU) {
-            do_trigger_action(env, DBG_ACTION_BP);
-        }
-    } else {
-        if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
-            do_trigger_action(env, DBG_ACTION_BP);
-        }
-    }
+    do_trigger_action(env, DBG_ACTION_BP);
 }
 
 bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
-- 
2.43.0


