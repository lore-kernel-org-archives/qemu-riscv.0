Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFA2C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:08:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welGD-00068a-S9; Tue, 30 Jun 2026 23:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welG2-0005nV-PB
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:05:02 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFy-0002tI-CC
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:05:02 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2c9abe1c505so1030885ad.2
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875097; x=1783479897; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1zAEykkLSsC6j7cjQi/1RKg/0+TkxhmA7YPc2ShnuVM=;
 b=CG2VhnFmNR4lMkL0aIDo4kriL3iIsH47yEfv26np4XIpu86U7MTbEa4QcmLdQPjJhC
 iuSgNrcX4qi5QnFJMXZl9wlVxeI+XLC1Ffzx0BlCEAQpK8WSSP8Q8a9iZljAOHhYpMz1
 sXahTcZ26iLLmrzSykDV7V0jweUZH0I2D+b2493Vg5umoMeoV8CVHW8AhupErEu28gpO
 OumEYkYcL/XitXZLDyEaSPdR8at1x0Dxvjont1scTWojFag8Zb/K5QvDdkWrd+YUXwqo
 LtOTiE66DB+760mKvIPdoS8aUwxZjyduwHJP8E870PxETgEXtJXvjBSw+0bM5W0FbjGV
 JxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875097; x=1783479897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1zAEykkLSsC6j7cjQi/1RKg/0+TkxhmA7YPc2ShnuVM=;
 b=QL796dQmG7dOqff8q2pfNBaH1cvF3NcrrvNCOzj6JdSnEhLcFLQZBTev97Ccci2IGi
 PmNblDmGG33zXYh3XNePv4PLY+wTdrwciiC19GPpQfxngKGOv/s+UUE3LlooZGLKr9RP
 A71LuPAqsr/BDcBhObXIY3NhjXEFrB+XU0pxArlKrpmsY5Bk6zoDtwlgv+1lQ6XBpKVm
 n6dWznnKduwfksoH4+cB0QbdKMIuUD00jC7ROspBhzed6Uo7nAGwDfkjau0MhOg33JQ1
 OhUb/zz6b7CCkJ8DKdHdL7TcSAeKhB99TmCjfT8wiXqxFgBc7Nc6+DRjME/haZaVUJ0O
 GIiA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrCzfWFl5K7ufVKak525NeKf0qBzVCxutknVcpA1jzFpvBhPXCfgSkMpuNGqPXHSex2VVuEHqhTJr7Q@nongnu.org
X-Gm-Message-State: AOJu0YwfpyIGfqCmpwXYHLpe/7rL/PdlDx1yHZm4FThXZsGnTQKZ82pu
 EXOzTPJZbf9v0te2fn/87hbdR2WAUS3mZLGQ5a8CVJPzUbHilYO+jrv7cWgNCQmpJcCN/9gu/xq
 QMBZ9
X-Gm-Gg: AfdE7ckblOOJJ+OTNc/BrX0kOyE0nlI/unl5ooCW/4g4phsqcRqsPQwWiPHfL6/oHf0
 xk8V0zEVXU2u1NsXTHjcoadgCIRFu+J8WfzuAu3K+x3rLy2H4TjTnh1Dh0aD7OykTrcJoAthYkH
 2UdXvGm4V/OK/S5V4CefZ8LYVaDxYUYjMK1f0JGV+Ji5wRvXQB5GazW33oissvNln6geemdHd7V
 KD1x9EM/YouD8pVKpDp1A2UQ3As1LU2I1sFAF3nlBaQYIVbEnyr0Zqh/9d+fuYou3dJKW047GqD
 yP4tlTyXEqWNTHN3jfvMkYTs57YZSyLDc+sXY/hdVn4BNYCKgkICzbhsFbmC4ID89Zn1So8cUCD
 T68ja2I17cDI2XoYAktxnOAZ53II53NnJVJ3C7gEIMoZAqWETNqAQSUU3j7OQeu2CaWL55BUupB
 JNfC4MgGBMhg+RA4vWjnjpKI0/+f6DnBsYgYhh0OeFCjwkHwrN0g==
X-Received: by 2002:a17:903:3b83:b0:2bd:c925:3a16 with SMTP id
 d9443c01a7336-2ca2d52b188mr56311105ad.2.1782875096903; 
 Tue, 30 Jun 2026 20:04:56 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 15/17] target/riscv: Use bp argument in
 riscv_cpu_debug_check_watchpoint
Date: Tue, 30 Jun 2026 20:04:41 -0700
Message-ID: <20260701030443.1382447-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Use the ID of the watchpoint instead of a loop over all.

This fixes a bug in which addr was compared against wp->vaddr,
so that we never recognized watchpoints that didn't trigger at
the start of the region.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/debug.c | 55 +++-----------------------------------------
 1 file changed, 3 insertions(+), 52 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index f6ffc62f1a..433050bd94 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -973,59 +973,10 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, const CPUWatchpoint *wp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    target_ulong ctrl;
-    target_ulong addr;
-    int trigger_type;
-    int flags;
-    int i;
+    int i = wp->flags >> BP_CPU_ID_SHIFT;
+    trigger_type_t trigger_type = get_trigger_type(env, i);
 
-    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
-        trigger_type = get_trigger_type(env, i);
-
-        if (!trigger_common_match(env, trigger_type, i)) {
-            continue;
-        }
-
-        switch (trigger_type) {
-        case TRIGGER_TYPE_AD_MATCH:
-            ctrl = env->tdata1[i];
-            addr = env->tdata2[i];
-            flags = 0;
-
-            if (ctrl & TYPE2_LOAD) {
-                flags |= BP_MEM_READ;
-            }
-            if (ctrl & TYPE2_STORE) {
-                flags |= BP_MEM_WRITE;
-            }
-
-            if ((wp->flags & flags) && (wp->vaddr == addr)) {
-                return true;
-            }
-            break;
-        case TRIGGER_TYPE_AD_MATCH6:
-            ctrl = env->tdata1[i];
-            addr = env->tdata2[i];
-            flags = 0;
-
-            if (ctrl & TYPE6_LOAD) {
-                flags |= BP_MEM_READ;
-            }
-            if (ctrl & TYPE6_STORE) {
-                flags |= BP_MEM_WRITE;
-            }
-
-            if ((wp->flags & flags) && (wp->vaddr == addr)) {
-                return true;
-            }
-            break;
-        default:
-            /* other trigger types are not supported */
-            break;
-        }
-    }
-
-    return false;
+    return trigger_common_match(env, trigger_type, i);
 }
 
 void riscv_trigger_realize(CPURISCVState *env)
-- 
2.43.0


