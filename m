Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F55C44506
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:00:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIEx-0001T0-5r; Fri, 10 Jul 2026 16:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEv-0001Q9-0W
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:29 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEk-0000hj-D6
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:28 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8485ef63b68so1226346b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716857; x=1784321657; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=k40Ct/scLRA6POY4s+1/g3ylMfrjfxUVUANTHep1r88=;
 b=FBeOsRyLde+iffSRs1nbHx263W5LfQKpNFzTdO+EoG6D5zDH0rLgK6WHdUpaXmG9xN
 ZB4yy3qwYA+Lt+1iPQLXdKx+jJT8LMP7mob3imLKSmx4+v8t0AQuwBIebHuiwI3tNtZL
 pqwtz+P5Voeb/bMhy1uIv8Ijfk5/FAWJXJ6tHYcqIwB1Yd0jltfehRgztjV0W8TYKs4n
 SbZZnBH8WeEraOkuAWU+YUZzwHM8GHnCbSbx0x/YL03reyCq1nzrVjvB6v0s202EV8o4
 ZFQb5Tu6A4YsjUHtRQADicZeEueaSqjAOAn9tLjXVc/mGVXYKUBa79HkqD0zy6VhSaWg
 1y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716857; x=1784321657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=k40Ct/scLRA6POY4s+1/g3ylMfrjfxUVUANTHep1r88=;
 b=IZkfNKJm19qMLMajTXWjtnlmMCMhAZGeQ/HmJxImwerkg5yHURz28i/lfWNIe2nKjN
 bZ5OljIaa3Tr0HIs8C+NCsnNHF0m3MM+V5BfEkJjmheHtQKxoIJt0YZs4gnNOprnqiyB
 cArV65cqIJuO2SUFWKGp7mI/pFVZydiUBEunog+vh/UpapN9IBVTOr0M3Dkpvy24f+7H
 1Ncu1mOPZsm3TW/b73qOr6nqEk2iQeZv8ePyEK2ML9QA64o1qoWzjizARIsNwdF8F+Ri
 0T+ZmPNwHEkYmH0UMrSKvSr6+f7lJ2M8Fz2oSRwbcqCj42w+dt6Ee/xYma2Ox8m2I1WV
 KZjA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp/qVaK2HsnxjoLbPZpkrTLrRdHQfr7+LI+8C5i9nfkpvdRmQAHTKYswGCSyno3QNXNfXy7Mg3t2eP/@nongnu.org
X-Gm-Message-State: AOJu0YyvzauwUmnZ+zQhIa5RYRFtE15AX2t2DdJCMhT4Htykg6of4j+t
 2LiceDB8k5GcpHJ0/7y2n96G/TXjbyUSdRVZth5bzuN1baeCLST3y1eY48s187dJiLQ=
X-Gm-Gg: AfdE7cku6+EatVZYwW/Jwqv8sz8gAN0kIWI25ZYy4lQXgDx0dTgopbpbCLoQPk+0fKy
 XepCrykaB0peIHFBuzobx+NtvTei6toTNf+b1zUuvDyDVEprVYX4DWf8ctcKaVuPHM+ikAtGfq+
 nbiy38kFeOX0bxBC8H8AR5S17Eg8xcwCfRFnjnEk0WkVi/jqCmwbfJuuh1hfEbpthOP0MTLJb/i
 C/F4Y1EMlau4N99hLCP+GmC9fprlbdAB4suLCFLWqo4+2oZk4cTujYfdm3wnYXI3oxuftVgPWrE
 zAfBirWgbtb7TK0A81rIxirAn/Z7gOaDsriG2Sze5dPd++884OBXwpnOTJ6LXlaLMv16mAJ3m7y
 Fo3OCBYq8zAVAMffxcKZCXPqMxLIxWhUNHHxIWI8YGYoHYUygiDZ3Zm4z2zAPRgtOGwVxgP6/Ct
 PZemHbbZzXZJuK/lN+iw==
X-Received: by 2002:a05:6a00:c84:b0:847:7ece:3426 with SMTP id
 d2e1a72fcca58-8488979782emr487915b3a.58.1783716856628; 
 Fri, 10 Jul 2026 13:54:16 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 12/51] target/riscv: Use bp argument in
 riscv_cpu_debug_check_breakpoint
Date: Fri, 10 Jul 2026 13:53:22 -0700
Message-ID: <20260710205401.836304-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Use the ID of the breakpoint instead of a loop over all.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/debug.c | 44 ++++++--------------------------------------
 1 file changed, 6 insertions(+), 38 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 5c378dd2e8..511a69c28d 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -941,48 +941,16 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
     }
 }
 
-bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *ignore)
+bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    CPUBreakpoint *bp;
-    target_ulong ctrl;
-    target_ulong pc;
-    int trigger_type;
-    int i;
+    int i = bp->id;
+    trigger_type_t trigger_type = get_trigger_type(env, i);
 
-    QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-        for (i = 0; i < env->num_triggers; i++) {
-            trigger_type = get_trigger_type(env, i);
-
-            if (!trigger_common_match(env, trigger_type, i)) {
-                continue;
-            }
-
-            switch (trigger_type) {
-            case TRIGGER_TYPE_AD_MATCH:
-                ctrl = env->tdata1[i];
-                pc = env->tdata2[i];
-
-                if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
-                    env->badaddr = pc;
-                    return true;
-                }
-                break;
-            case TRIGGER_TYPE_AD_MATCH6:
-                ctrl = env->tdata1[i];
-                pc = env->tdata2[i];
-
-                if ((ctrl & TYPE6_EXEC) && (bp->pc == pc)) {
-                    env->badaddr = pc;
-                    return true;
-                }
-                break;
-            default:
-                /* other trigger types are not supported or irrelevant */
-                break;
-            }
-        }
+    if (trigger_common_match(env, trigger_type, i)) {
+        env->badaddr = env->tdata2[i];
+        return true;
     }
 
     return false;
-- 
2.43.0


