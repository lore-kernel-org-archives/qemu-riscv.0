Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E7BC43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:00:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIGb-000417-Hd; Fri, 10 Jul 2026 16:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFR-00026T-Ey
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:55:03 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFA-0000ze-L4
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:55:01 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-8423f236418so1050759b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716881; x=1784321681; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zEoEbldckN16OhTsR6Zaa+zbm5X/cyDm4W7LiW18RHY=;
 b=VYTlhnARxmlw5k8I3xYPU9OMaokf2nMP227KKz4mvQtjTPuaZmxTavwzU/lvsW4Kb1
 9LK0EHeCA9Y92HNseFLkfvsazTlZ2UdzGwH9hzVtG8LByl0AphQ6G1FvzQnGnHXSMX2r
 Lx8ZTkObBNiLhtOYZ5XcbtfxKAEzi8Em+5XQjR+5dJTrvCoR/8YQbmgpnBHphb9JYwlE
 8iiqOWTyKQCulMjVFOy6o+45sB3lyLrS8P1M5zV4w7UL6e9w+hB87XOp0OnB7bUIziKm
 bu5wzCC+oQ/CMoiNlFarSsLLaQXjvjpCHUaDa9zepd16vxVVHLq/n1xPsriOdLDy1L8Q
 q7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716881; x=1784321681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zEoEbldckN16OhTsR6Zaa+zbm5X/cyDm4W7LiW18RHY=;
 b=sdvJrWvjfW/6AmTH+aoL6TjCLHvQV+6UpZaIAaUoQmO3Hn6dt6uwIea4zvjrekGU/X
 3lWEeI43vyvy/wC8MjYU+vW311bl98k98vsZrYM0KxeH5PTevrgAAfVA7n3AvHOUX4DZ
 EKOTrG5NlQWhVMIMqdk1W1G+7mx6oGzAf/p4MoNgkpOj9tWqJFpNOA0oITnzTF+Lgpp8
 Kg/Xnmp5/Nds2rNMKY+yRwnIoXUc7/POV4AeDkRPYV/X7Dv6+ePvUS1okWl03VWe/1ks
 Laai1lM4C1UNqmyBV7HLnjn9pE8fG9AI5QssLvbf2BbLbfey13QgRFujVXVcRkMfkFT/
 Ajew==
X-Forwarded-Encrypted: i=1;
 AHgh+RrAU5CXNQt5ZhfPUjb2+DsrSaQT85JmE1g1bPzzj21F4xW/W8+qjeUdTCJaULA4p1/NpEBInZI9vVBC@nongnu.org
X-Gm-Message-State: AOJu0YyH4uFc4UJKiHKsOIsy7XEfzXq4dSMITJlY4r0S484LD2KCP4xa
 Cwhu99STk/2bIoLOVtt8pWW9u+6b+iYRK8RTpBj/L1hmpeRQ1JC9ZYXzPeViAJAHtGo=
X-Gm-Gg: AfdE7cmLU+jvi+z07I6ClZqMMyyHnEdXu2x5KrPalW5/3lasUuByMwZuYqBgeLUnf3h
 cpf01OOHjAWj5Nrf7YGaH/S0qHj2jnkuYnSjrhPR6C/+edta5UjwcyqI4xKlqv1Zo+mmgdhS33H
 6bK/pBaZePIojNM6MlFXMTMf3OJuAHsjWjAch35HSTjhpJFrod+cvOU6LMhr4W6phKEKYghsmte
 vB/eALDkGalQbM42K36feofEakt21w6zIbmCtXNuozTl/lwRdB6Y+QbGp4r3Ub5txBg3OSovU+y
 n6EYu1AW0jXinlnlheX28GOpcT7K+eJh2mLVDCrjReUvRawhqIfclcnTc32ql/SPgZcRlqHJASH
 rJnrPgr7vj3bH8nXTaGqSn2FFhTwkY2T8UO2pQANF6m08r01UkiGSUw3ywdli/YwGFVQg9S/Y3u
 w2JF0QYcQj84I/8JaCUg==
X-Received: by 2002:a05:6a00:3691:b0:848:5935:2e11 with SMTP id
 d2e1a72fcca58-848896b9a7cmr617803b3a.48.1783716880557; 
 Fri, 10 Jul 2026 13:54:40 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 35/51] target/riscv: Simplify riscv_cpu_debug_excp_handler
Date: Fri, 10 Jul 2026 13:53:45 -0700
Message-ID: <20260710205401.836304-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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


