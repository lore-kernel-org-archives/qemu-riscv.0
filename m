Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96401C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:07:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welGB-00060y-2o; Tue, 30 Jun 2026 23:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFz-0005kX-H4
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:05:00 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFv-0002r3-7k
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:04:59 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2c9ed0c7fc7so1216785ad.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875094; x=1783479894; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m9lGyyAHN8LnCXhy7QmMc4S+kFAgGybyfRaIJ4iRcl0=;
 b=zdjq0bt2ZmV3HQrP3VgH6slMX9pLKqlDZ6i+eCxsAINylWvMsPU3+wmdphmQfXez3U
 MB0hFzz7ZCwCnXccUOXv6r93Pi8W8rxsAgYnHxh4e0XP7iu82bobZF2UsWuDuvzFa37G
 bu0JQ6auHu0tO356xsho5POCwccIkPVwXASxggLZMZsnh4Qi/0/QOISK1ykSKs5oxlyf
 T1S9scoUR/UtXYoZqCkhNi0SU87a0HNcz1B5GP5k0c/nvNWLZey4mpw5QvSYvBv+lkos
 2rPSc6homa/bkXvnBjPf82Z+kF/DMDKlwcyVjU15oNT7BMv5kDhzjKVaQ2WD0YKAhnMl
 3leA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875094; x=1783479894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m9lGyyAHN8LnCXhy7QmMc4S+kFAgGybyfRaIJ4iRcl0=;
 b=J10E9/m6zmU+UQCJ3DkdP/0KlxTYMfe2vhVEiLD+Qa/kDc8D1fEHq50d5DKB4YyNLP
 qCEu+PQlSTP6CGVM+5E/Q0vfhnamu04tPVQ4vMb0/MRpRwO9WIJd3IUgAm97GI5iXOZy
 oD44c3zKxZtYrMi3oJ6ZtOHTzoKtwB/hjOqcXYM+0L9OjM77efPHmBA8ghV5Mhe87TqI
 rRnFM/4w0w5wTHOOj00s4ecV1/k3UDJ3a4zrivWjuXO28w170NT2cHZLvUwJqH43st+H
 7M4oLJZhOMTSAUtzZ76gMtFYYybZTQTIMl/49iKVotP+clg/0uns1+jjM/grCwIOy1hN
 fFrQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RojRg2KlhxJdV4k4eNcpYneI2qMgEXL9wq790BaQXKsoODCswLWe/Ml13PDb2NX1aLl3mLSZE8sGsSQ@nongnu.org
X-Gm-Message-State: AOJu0YwduGNwi6EjkAFf5K3HI7wOHym8U7j2ewOkUrWJlJ9Xr2GWs9/1
 nm+ov8FDNYSPL/jZMhlRyETX7twlFPnqPCg3+427AZtCAT5nF7MZZNfssYokxVSBuCg5/Nq/7qj
 vPDjN
X-Gm-Gg: AfdE7cmSmAl08/i/99txb5VMdUAOJ+c1om0eyrOcejXUBkj46/S0qNzSMil8FhhHqAy
 nyLQ/2EQaIBt1zmdUyHn+C4U/QcSsoMDgY0T4XXoZzsOKNM0iBiE9d0hrHSGJdneHB6afFfNDTT
 HE8aqjKIVxntYm3GRTCzKunWJ4kCXEEt7wGiV3p65jZ3IW7mPmOdpBy1BPV2k9DsybPGsLZVp/t
 h2PZHKi/EMUzGnGJWSW5FmRTxCLfVAoXx+ymFeNjzXixQ2PrJXCDg7KHQPS9fkVv4ed9vSWYuRQ
 Y9xGvtSLNv8KVUCJsfuuRfutAeeM/NC8dtmKjjb7++p75ilEm9zoCwbJr1kl33XsRq9i7YBzrHF
 dmJ4J57hJNYw/QK2Q89xSkywKI61j7N6+Zt5OtT52bGOHywz4/q5Bg1nH1k2W65zR6FIFD0MRMA
 IuTr6CeYN8mndmS1udjsz9tc6HVtChObp9TzWJrrvQ4dsvYTPweHXpm8WSfzhR
X-Received: by 2002:a17:902:f712:b0:2c9:aae1:a61a with SMTP id
 d9443c01a7336-2ca5a552530mr31604635ad.14.1782875093810; 
 Tue, 30 Jun 2026 20:04:53 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 11/17] target/arm: Use bp argument in
 arm_debug_check_breakpoint
Date: Tue, 30 Jun 2026 20:04:37 -0700
Message-ID: <20260701030443.1382447-12-richard.henderson@linaro.org>
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

Use the matched breakpoint instead of looping over all.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/debug.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index 8bcce4a1b0..fc63d35d98 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -396,15 +396,8 @@ bool arm_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp)
      * TODO: We would need to look up the page for PC and verify that
      * it is present and executable.
      */
-
-    for (n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
-        if (env->cpu_breakpoint[n] &&
-            env->cpu_breakpoint[n]->pc != pc &&
-            bp_wp_matches(cpu, env->cp15.dbgbcr[n], arm_current_el(env))) {
-            return true;
-        }
-    }
-    return false;
+    n = bp->flags >> BP_CPU_ID_SHIFT;
+    return bp_wp_matches(cpu, env->cp15.dbgbcr[n], arm_current_el(env));
 }
 
 bool arm_debug_check_watchpoint(CPUState *cs, const CPUWatchpoint *wp)
-- 
2.43.0


