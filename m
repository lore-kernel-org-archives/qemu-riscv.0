Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE1AC43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:08:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welGC-000650-GA; Tue, 30 Jun 2026 23:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFy-0005j1-I2
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:04:58 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFu-0002qh-MA
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:04:57 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2c9bd2f8bf7so9976435ad.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875093; x=1783479893; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yrBKBJVchBCsnuGqTnML8QX4SdgBpucyvwuWE2i/qQ0=;
 b=cyaJ/+Iv2N/zzmGwL5ThDoNg97mEktKcrnG80lU+hMuMbMo+5rP4eOG707s1kAIpUx
 TpXVYfnZINCok9kiNJ6C+QPPg70qFz81+bWseR9GkckqFWYqD1Aqi8cMiKUO0oeAB7Qw
 juES6IVDi7kdbKB0/X/NyMl4u/ngK742VZOkfylZGiNm5IwiYV8jRHHtr0Wc32kwOINf
 JVPa/AA4gZxo6bl/i08v1qiugixT9RFJRlpLekMZjPwaj20V+GroAIbNoiUb/WAXMDUf
 ths8JYYGvTy5hCjcJmd6D4Qil+9+bE0DOcPDHEI6F0MMFDlaLX/bWGZKJRrJu56WWtmd
 lK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875093; x=1783479893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yrBKBJVchBCsnuGqTnML8QX4SdgBpucyvwuWE2i/qQ0=;
 b=aqcKsQfriX8jX2waIcStfR9fYKjHKeKhzUsqVOayFNf5tXTCSrvsU5LCp9O6FitFIf
 aOAgI4bgznIyzI0fpQFQhAQAFg/ly+2jvMxwWsM2TlaiNxPJMKofb/+1OJGBKbl7Bxop
 1glmsIFlhytjQ+gjjT7TNGfmihMVhqy7ZZmqSv+FN+o1ilOjx6qwTj0pxiVb3PMVG4Du
 6Fpkn9iF11fKBElyp3tF+rtj+d7Vx9HAwXixyMqWYmC6UH8RD2/oJoAUoFuRavmj+he+
 w9bJA3VrvAEggehDp80PrcN0P2ezqJgqJcpCkbWyRtxJFwT7IM5+J3tkrpJj76JCWV9j
 BxUg==
X-Forwarded-Encrypted: i=1;
 AHgh+RopKtZcwqhGmHzJLcQJd3qVaqWpINsP+s57m4FY8hRiuPpwV2GxXSYFnBBtpv9jWM3RoNxE35eh6sBT@nongnu.org
X-Gm-Message-State: AOJu0YzLLy08dYeHCTOZiydM58g9tAxhS+8EfL4u788EyDHZcprXw47s
 I9TvNRIOoFmGm0XW8LRxP86jPh363L+TAUoRt5ZR+lEaxz3kI6tVyyQ9CmdHE1AWgQk=
X-Gm-Gg: AfdE7cnrzq6b2seQrwjK+EeLF5O9hdmYDPXqBCryG55uVDmZB4RkB3TzbtRf3RTaqQc
 8QUysxVscVEjFcTO7VlbVUg0vmBKAqaYPIbGK1tsDlJGJF7Zf5Xnpr5uR06LQYCzhS+dofvPtkd
 h60zv1QMPpgiTnP8UxtXDt8mvo8T0BqhjDBjQd3LTzrmqrvCf8zuBzSza76LhCmyNjO+7KULBL3
 cse78osN/PvfqS57OXP6Z8smu5W06mSuCuFsIxS/P9w03E5d4P0c+pAKCEz54NRnI8m1cd5U7dt
 a8BJX46QYYX31Ski+XxyRo1vKHbo3i3ZfWZP0eGDI4R0WRehwyGu/HybH/Njbznj/d+RSQqJoYN
 YWjQktEpJrXoLclWwovTCjZLH5RLM9l7SulPxOrx7LbYjVsnOjt1y6oDdsdqjFzScd+CepvITO3
 bqWvGEmo5Hdjn6IDOhLPnnq6VNVCftj9FubMfHyIngImNtJpX5ORyRz442WkL3
X-Received: by 2002:a17:902:d2c9:b0:2c9:b017:8bf5 with SMTP id
 d9443c01a7336-2ca44a05333mr34401565ad.21.1782875093157; 
 Tue, 30 Jun 2026 20:04:53 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 10/17] target/arm: Set ID for watchpoints and breakpoints
Date: Tue, 30 Jun 2026 20:04:36 -0700
Message-ID: <20260701030443.1382447-11-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index 51d6748427..8bcce4a1b0 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -538,7 +538,7 @@ void hw_watchpoint_update(ARMCPU *cpu, int n)
     vaddr wvr = env->cp15.dbgwvr[n];
     uint64_t wcr = env->cp15.dbgwcr[n];
     int mask;
-    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
+    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS | (n << BP_CPU_ID_SHIFT);
 
     if (env->cpu_watchpoint[n]) {
         cpu_watchpoint_remove_by_ref(CPU(cpu), env->cpu_watchpoint[n]);
@@ -644,7 +644,7 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
     uint64_t bcr = env->cp15.dbgbcr[n];
     vaddr addr;
     int bt;
-    int flags = BP_CPU;
+    int flags = BP_CPU | (n << BP_CPU_ID_SHIFT);
 
     if (env->cpu_breakpoint[n]) {
         cpu_breakpoint_remove_by_ref(CPU(cpu), env->cpu_breakpoint[n]);
-- 
2.43.0


