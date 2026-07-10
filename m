Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F049AC44508
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 20:59:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIHK-0005lb-SQ; Fri, 10 Jul 2026 16:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFa-0002NE-3l
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:55:12 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFK-00010V-LC
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:55:09 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8478fe07f0fso1456049b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716881; x=1784321681; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Lp+19HN1hDJRD/nyQTZDKaLa3PwvYZGSdAI5w9aXD2A=;
 b=NRm5vutXosn0qEulf6s2AP8yiv/XvKe89Rh0B2V3gMDw+vAV+qEpzwZqB8udydLASm
 KRITViG9NOfHn6IdT1eUbWd6BVzrupMPzQIgLqeT5VhSjCdsHOKxke/5F1AM55d9mecv
 HfjyOrU5Io242Kf2uxaTkJm1/jiOIfgnSQ1HR1Lig/dzTkEM7053Royqa51opk0AmSDA
 OevP2h+hDK3W4Jn2F5KiGhBeVrjaiCo/alaVALMMCyaA2JeSYOBloGNSNqYjAlzTXpkW
 4LU7wg+uWtpFECG/IpSrfDH/KdZz/2EV8m/IDGRLRkGwsu3eRwcB5/RfCYmAVwuYHcdP
 I9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716881; x=1784321681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Lp+19HN1hDJRD/nyQTZDKaLa3PwvYZGSdAI5w9aXD2A=;
 b=FdJQBc2eLq2Xn97xMyV+hEmWRElf2QKMIo2WbqgW0CeUbo9sVpTAVb0s2Kjn2BTc9u
 8Nj9W9gIv/+qfV6LmdfXBI7JehTdjOkNDYGOoM9P8x42LNby4Pk4czJq6dJS4NzO3HG1
 szNdT+WNtPF8v8erb0zgsUkgZPtu62byVr9dQqB/Y6qVTmvMVgrioxyKeugWpNf/N+0c
 wfQhoVeuFfQFG801zB4t5UR5T6rPPFlbSMlgHvCmduy8QcodgAdzM1zA9lFCbZOAT8w+
 6Klb1fx0GIIjLPXoSwvUYYUaAZUiefZdsO72fSdA6zaiVLHhIkOdvJL8memNS4v+S4x0
 T6WA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq5GOWtG8FVcEZKlyr5ZwF3AZI4QIJstu2pIVclOc32ouWxouWIZd9ULmodAfV9EWnYobTUnTBejkwY@nongnu.org
X-Gm-Message-State: AOJu0Yx4Esu3vgGLsZhw+LnDgHmgi8TxfOm/bLBswLhba7jWGaVBaOl6
 jKb1/bqBOgVwB8epzw5//7lgHfN5Dw0nLoNWcFfniTCAyNvbiDJY/OJafgdZFA9RfJMvtm7jUii
 givo1
X-Gm-Gg: AfdE7ckQWKCnKklHr+TY+txQQWf7Mk/ZJ+n9I5Sk4Z78TAwD5JSTZ/kjfMO7010drm/
 6QPkRw38+5u2rnnwL07BkxZ2o5JuCNDnm3rTEY0ZDFmDen0AORe6N0DG/YqCBSmXaBP9/g3pTe5
 z1FlzJSlK2Sf14yYo8jrHgswM+HvH3+qSvUVjX8yK/6AyX5OBvXrE6oGzr17ekONroWe/PCuCTL
 CA+q6MoohjmAeMrlM8b2pORSO1Iy03QmqCy8qkt9V+w9Js3P7KpGl30ZQuSILdwhq2iFCjTUhHO
 sjEC4Cq3EVa1FXsKaaHdn95I16meT0466UkrSL67yjpc7qTqtKamCh5xRX/jYjIs2xv/g+Hcjkb
 hNgomPS9EMAPhYvcAipxnRmdJucXWnQpQXqwGhumLL2VTFQbjTBm2sZVMSxSHgqSDp6IqCyMnSe
 Qzkxk5vN/GIhzs4V6wqw==
X-Received: by 2002:a05:6a00:1256:b0:847:904c:8452 with SMTP id
 d2e1a72fcca58-8488986fb9emr455784b3a.38.1783716881331; 
 Fri, 10 Jul 2026 13:54:41 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 36/51] target/riscv: Set badaddr in
 riscv_cpu_debug_excp_handler
Date: Fri, 10 Jul 2026 13:53:46 -0700
Message-ID: <20260710205401.836304-37-richard.henderson@linaro.org>
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

Setting badaddr in riscv_cpu_debug_check_breakpoint was a minor
buglet as that function should only be testing if the breakpoint
should trigger.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 4 ----
 target/riscv/debug.c      | 8 ++------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index c318dcd633..f9556c04a5 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -2373,10 +2373,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             break;
         case RISCV_EXCP_BREAKPOINT:
             tval = env->badaddr;
-            if (cs->watchpoint_hit) {
-                tval = cs->watchpoint_hit->hitaddr;
-                cs->watchpoint_hit = NULL;
-            }
             break;
         case RISCV_EXCP_SW_CHECK:
             tval = env->sw_check_code;
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 994a77fd31..f4689519d8 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -919,6 +919,7 @@ void riscv_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
 
+    env->badaddr = hit->hitaddr;
     do_trigger_action(env, DBG_ACTION_BP);
 }
 
@@ -929,12 +930,7 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
     int i = bp->id;
     trigger_type_t trigger_type = get_trigger_type(env, i);
 
-    if (trigger_common_match(env, trigger_type, i)) {
-        env->badaddr = env->tdata2[i];
-        return true;
-    }
-
-    return false;
+    return trigger_common_match(env, trigger_type, i);
 }
 
 bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUBreakpoint *wp)
-- 
2.43.0


