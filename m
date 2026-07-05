Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285D1C43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:43:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEfF-0003gW-B6; Sun, 05 Jul 2026 00:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfC-0003QU-4P
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:41:06 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfA-0006Ma-E9
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:41:05 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-845b6d9bf39so1505796b3a.1
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226463; x=1783831263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOV8aDWsylX+EDtzAiDKgexQev8L9FW7a3sm5qjjMIQ=;
 b=avUGdVEwbvgjvlnKg3ADV1XlbnAaTdKPJsdUe63hwqLVfeYjqcp3mTTPzl0SX6Fmtu
 f3BmzBg/MhYeqPWrKiADxUlqrDEB034aZ49Gfd0cE+qozv76+kQ2lUCMfM4vow7PzIvx
 mNAXf0pcWZ1JyUNY3cWiU0ViqmD9jcwwowSQ3oFcQEDQAvx/rDUlliymHHjLMAvwscEi
 cyedorcfkHEeXLPZJ4QoCWAp3nXIZygoAicCbiCamYMx6WFcxlf8IIOsqAsHp+Kgdtu9
 HBBpe1+mmSkY+jTGKlIAkSjHGCO87u1ucQZlL4ham3fE76oPyGoNaYBeIUe8vdkPHn7p
 AM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226463; x=1783831263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zOV8aDWsylX+EDtzAiDKgexQev8L9FW7a3sm5qjjMIQ=;
 b=rbB0FJuX6V+XjtmOkX3rn5pBGlHYNSPrQTk/M8E6foU50qFlLSHsfNFG1TVnQcd88a
 re1vvP8rjupDTkxC4gcWO3nBb83LztSd0FIvxzO1FclNlMCh1Z3r5YZCO/yKmCAGU+2V
 DEhzlUEN5PoKlFwvC1voPfrXWjScu0DvpfziIQFVxSSDai9FEK8yR6NVfRn9ZmUwXPbz
 Cn3TRVvgihAcNVFiVar7ra4HrhMcUMeMCM3QdZ5N57MkMpslxzKQxhR2wXDALPVA+p23
 IEMd7w3eFhTRTDKPN4xvk7jzYr4F06I5+eLxO7m5Mi7kW9zAJabOC9LIpMqW+Tsf9EIM
 QISA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp8DUA38/aI2B22JAz7eirIm5gKwPSobDJ7XoL6tmMr8UxREQ2EUqNde3Zlxsi7ao0mxLMgdIKoDk82@nongnu.org
X-Gm-Message-State: AOJu0YwP6zkRNibq/li8N4SFx1Kvqmt6deS6dJsithf4blXbBJMiakhL
 LeeWITLn2xKg3q2OApGhR6lT8ghMco9fpr0fws1qub0E1cMmiC1mWqrlBICG6vtYSXk=
X-Gm-Gg: AfdE7cluasQEK6uTIdgLXDIramtdTLY2KquNOERYLN5jAOHCwE1wh5asTriZTnEpvG1
 62KnEB8UnQT3g7IDEE5c+FQag6rBXoGCH8Zo/XvyyE1ku+vrIs78+1TpzLcXWswDbtuz9dOKzhf
 PpSLd5HGlKAoslUnXw37vkcq6L7K2VFSmjigO8+vrf3/2+qFKgXY/W4zDpvwydLcgWVzE9HgJcC
 VGSJFJHDCWNglIn+Arr61jXS1eXt2u0/3JYkzF1NXjNf0VFm+mFuAdUHwYycJJJqpg48WI1d4Wt
 RtGh5SKr5Dkby9MJF4teXvIDyTv9GxBQBTFgQ4kcmJTefKZ9D7BN8AIYTtDpNfiKUMzkpIQnWaE
 9pz0gPJh7tPh5pox9XyCiSJTKIDMwk7hEAx//x1Q/uEx6qCuQZTJs9y6dtv5m9+i2AuayOf1E1M
 jibt/4tEcGvb8DPsAwu1tGcROc8bYrB1uLKaNnato5rJAOdaM=
X-Received: by 2002:a05:6a00:94ed:b0:847:8704:1c57 with SMTP id
 d2e1a72fcca58-847f871b1ebmr4284173b3a.31.1783226462959; 
 Sat, 04 Jul 2026 21:41:02 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6952a0dsm1952615b3a.0.2026.07.04.21.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:41:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 41/46] target/riscv: Merge riscv_cpu_debug_check_{break,
 watch}point
Date: Sat,  4 Jul 2026 21:37:20 -0700
Message-ID: <20260705043725.1373137-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

These functions are identical.  Rename to
riscv_cpu_debug_check_bp_wp and install in both target hooks.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/debug.h       |  3 +--
 target/riscv/debug.c       | 12 +-----------
 target/riscv/tcg/tcg-cpu.c |  4 ++--
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 540835f2d0..fbe6898718 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -144,8 +144,7 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val);
 target_ulong tinfo_csr_read(CPURISCVState *env);
 
 void riscv_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit);
-bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp);
-bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUBreakpoint *wp);
+bool riscv_cpu_debug_check_bp_wp(CPUState *cs, CPUBreakpoint *bp);
 
 void riscv_trigger_realize(CPURISCVState *env);
 void riscv_trigger_unrealize(CPURISCVState *env);
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index f4689519d8..803418f390 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -923,7 +923,7 @@ void riscv_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
     do_trigger_action(env, DBG_ACTION_BP);
 }
 
-bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
+bool riscv_cpu_debug_check_bp_wp(CPUState *cs, CPUBreakpoint *bp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
@@ -933,16 +933,6 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
     return trigger_common_match(env, trigger_type, i);
 }
 
-bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUBreakpoint *wp)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    int i = wp->id;
-    trigger_type_t trigger_type = get_trigger_type(env, i);
-
-    return trigger_common_match(env, trigger_type, i);
-}
-
 void riscv_trigger_realize(CPURISCVState *env)
 {
     int i;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index b73e3e9dd4..3701aa6c94 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -292,8 +292,8 @@ const TCGCPUOps riscv_tcg_ops = {
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
     .do_unaligned_access = riscv_cpu_do_unaligned_access,
     .debug_excp_handler = riscv_cpu_debug_excp_handler,
-    .debug_check_breakpoint = riscv_cpu_debug_check_breakpoint,
-    .debug_check_watchpoint = riscv_cpu_debug_check_watchpoint,
+    .debug_check_breakpoint = riscv_cpu_debug_check_bp_wp,
+    .debug_check_watchpoint = riscv_cpu_debug_check_bp_wp,
 #endif /* !CONFIG_USER_ONLY */
 };
 
-- 
2.43.0


