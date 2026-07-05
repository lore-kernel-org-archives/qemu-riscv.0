Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40695C43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:50:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEdL-0006rH-M5; Sun, 05 Jul 2026 00:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcA-0004yq-SM
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:37:59 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbv-0004DF-SD
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:37:58 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2ca1479dfe0so21655845ad.1
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226262; x=1783831062; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lg/N8LFKGp5ELLy+c1KbExFW/0dtEAJ/1CeA/sfoCRs=;
 b=WU7BNf08ZfTpHdBPBsBdcQPwEcjETlqwT7rVGw6//lNktny8KZoHKuoVfstlYwdeeW
 k8E9pLkztLunYP7EafrK2W9K29ojXVWqHwomxOI6QEXMDaWbxavcmzRCnOIZZUkWDOHy
 sMezzw7LNTETkZB9VSKyAu8Zw0Kzv/BrrJbSRzGX4JpaDyafubI3nJf8MKTZx2eaCji1
 6Tue4bmBsTDGRxArQHdJn65z/HHJG7Hb1vxGrNb6r5TgOJnh7ZIQKFi7ufGEWYrgLxEu
 Iu8E8GsVwWbPXk3ThgxSSbfyFnngg+lfLBKd7i+w+7V6IBkjt3RbOdp3FEtgw0CFgwWm
 0EoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226262; x=1783831062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Lg/N8LFKGp5ELLy+c1KbExFW/0dtEAJ/1CeA/sfoCRs=;
 b=nnKqxe1AZaJiWfTr59M7aboKxzI0CJcI0sxcRs7z4Nie9O7iE6LLmuDAvGNx1pe4v6
 E8krU9Z9ktXdUDdZqVkBO/29W8fNbVShDi6ZMMjePhMMdbXaumU824ENSVBkEE7jKWe6
 XZeD0bLVKbFG0KIH4GAsMWH/3sFCAyAyqB+cAZx+YvU16m9z156Ow/AdFAj+sRS/n6qq
 ZGBBHKOvcRdDCJ5M3GKg+e0lTXIYJOcAlov1I1NRTBVulvePdOQLleV+Fho5ZmkC8vQA
 RYCCKqsyY0FVxGmTlLduoL83Txs7yXwghuilJ1Z+pu514WWpr+a4Ufc3sx4PFOPHeQbV
 PcCg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rol43K1QTpdOHjaJB/8wX7SM81tAOnEYuBnszyxFtZ1SahL2qC3q0n6vVMgkSyRKpD0nmIK+5AtPIVI@nongnu.org
X-Gm-Message-State: AOJu0YwRdPYoVCgoorJxCy190U6ALWVaheEpLxlu/LXY/52wJoTGvHQa
 NpJ58glfgfy85Cv4fEP11mAU1Vi8z7uv3QsRV+WWVkb5eCb6/22gUjZtqU4JPrMCido=
X-Gm-Gg: AfdE7clUXZzX0PIHBX+J3nbDzjt1pjlveoT4zOhVoVoW4VxG1kelD4GfAqrrlGAVdh0
 xWWMcbO025CtKqHh9bPi++BLvFs+fkWeX88nrR6kaQiI14DTuozo+q3mZPhncgEqofXhMN5lQip
 dULsp2vnW4iyZ6y0K/e602HLBcmOmHNSBxMjk91NGZyTLjxGzQ959VfV+ltGME7tO1uh5UuSyd1
 z6MfBt6VERel70wZ3oeamfSJdc0sdrRlNsjwwX4auN4gyd4hMM0XV8VdTPTzOMCiuxPJ52Hivf0
 n5KYn3koyf3ssPLwtt1qk29H6fCjOzypwVKa32VpITKen/pcATG+5YA896EEC3xQ1DZJCwN6gV4
 aPy4pHa62uh3C5ifj4/DpCZYPAzcCuwId7CHhyGo6g5VJn5DIiu14pB5jiAR8bCqC+Onghqa8Oo
 9pR3rM1WeT3aBcRSm4OxoeoAdix/pQ1YzG2O1BiDTW3FhHJV0=
X-Received: by 2002:a17:903:3202:b0:2ca:d151:382d with SMTP id
 d9443c01a7336-2cbb9e38d1cmr56474895ad.14.1783226262210; 
 Sat, 04 Jul 2026 21:37:42 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 17/46] target/riscv: Use bp argument in
 riscv_cpu_debug_check_watchpoint
Date: Sat,  4 Jul 2026 21:36:56 -0700
Message-ID: <20260705043725.1373137-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Use the ID of the watchpoint instead of a loop over all.

This fixes a bug in which addr was compared against wp->vaddr,
so that we never recognized watchpoints that didn't trigger at
the start of the region.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/debug.c | 55 +++-----------------------------------------
 1 file changed, 3 insertions(+), 52 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 511a69c28d..56ae1e6107 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -960,59 +960,10 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    target_ulong ctrl;
-    target_ulong addr;
-    int trigger_type;
-    BreakpointFlags flags;
-    int i;
+    int i = wp->id;
+    trigger_type_t trigger_type = get_trigger_type(env, i);
 
-    for (i = 0; i < env->num_triggers; i++) {
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


