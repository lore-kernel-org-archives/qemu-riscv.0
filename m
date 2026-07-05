Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73782C43602
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:49:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEfI-0003qY-Aw; Sun, 05 Jul 2026 00:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfG-0003kw-5i
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:41:10 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfD-0006Ny-4e
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:41:09 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-845c92bc464so1229411b3a.2
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226466; x=1783831266; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cta3/Q1WePeftyAZ1tIJUWYuQmdzSHeLF7F4WBnHI1o=;
 b=yWAsna9uXGyGV6S2UrZJtHq23Yrgw+vmKPhave+E/b1+A1PoorvMQV5ZwR59I56Jdg
 0npc0W3JRE3FpjmhTGAJQ+90qfhQwjuHLt6Z3ATVRSve8PCB6jB5DyvH3ij8LdQXYPlD
 8DSK9eaTEUb8L9rZY/+nyz/GJP37mf11No83KBYgd8/oco+fP1POlbHyEPIjfRJY9Dts
 Mp1uOLvwFjd1iZ/v4UUPTg8RYTjTrZ6EsYLllRCMEQ0ruBZtF9t6fGs/P90T3Vb5QUj6
 MoyEnAQy0gZld6/TqS7tU7A8MUCobMAj2uUxcCbb3mHxyP02zDG4irSYbkbrb7F0Hd0P
 cPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226466; x=1783831266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cta3/Q1WePeftyAZ1tIJUWYuQmdzSHeLF7F4WBnHI1o=;
 b=hmn7P9VSyoK0bgUxAi65o8ns3+u/EPlWqC9j8zLrgwIlhRdu8XKJ89+fy9ML3H/8vB
 jh1HSj/JBWaKmYOc7HuRVhkAgCAOAwL/Ctc2zDoOkdSQUpcvg6Rr5rx0OHvlJS4qgya/
 q+payW8/7Vm2cjAm65Vh/Rjn6dRrOBeDbnStISO2cZrODI56d0gPYb/3I3GiDAwMRdQS
 K6CiKCK2AfxSAX3Ub6hvj8yMy2UiBRkhDUjKBMXLYQKCBWdibewbLjTcJx/aI9wxtqJc
 Dieyb8MwGDX6L76MPRnFNJ9sJhAqY66AIdFk3GnfdYJu6KDAS0K5kXKBRl621Tn5IPZW
 1zWQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ99PhnRSOrxEGbPkKbvzpxTvJRBiUxOUO5NfMo4yIX+dvrZntfJTZsqfE+VlJ1vwaVIVer5u5iPueCV@nongnu.org
X-Gm-Message-State: AOJu0YyPfRjrSNRu+aMzClKeNhMOwzmYHqKXBQe5YAoIqLYSMAQfmvMM
 S+SYJSBF8S451Q4wHPJEK8rM8UjJyGZBBFoh4eYnJTq/fOy71YAQQ0m8uLPPTj11stM=
X-Gm-Gg: AfdE7cmfcVv0ksVzzFAf2VkrXnUqTqoggcx7XO9WhFDVJU9mTF9+vvviN/EwLIslUnD
 3R4h7z07XJ3WDT83tiWCK66asCFEgSiGbl/1L+8cslukPaPXowJB4oLQyfm7y0szdBwIPR27Ez8
 s6CIA1/HLIRSltAeW9oqXiG7+z2QD6VS25g7LaX9fuzWlb19JpZpViijuPEhalsu4LrnH8cxe2H
 SmLEzCc9+zq082QM+ZQZJs0Y7wZOGaBQcpYEsOTEjiwJjb6Dt8k1ckWmgtMGfn3ESDnV9FvU1W1
 jncMkNwyWDxayWxw5QSsjjo2wbetV10whK6pBFe5WNDeJvn9+lVkBc/dzcqi+IGtpbJ/NSHGRHC
 9QlWJqcmx/mjfDGHgwpVJ1TZkcFlnVv/btoKX+fM0VxcszKRTNVLNfz+8xLPofxZF1iL4+AbkXA
 R/JGIWn/wjJECJgfxeDUXCw/mF+RHMCZxw7J2amhyWDXVKSuc=
X-Received: by 2002:a05:6a00:17a3:b0:847:90a6:4fbd with SMTP id
 d2e1a72fcca58-847f6b5df90mr4957781b3a.0.1783226465612; 
 Sat, 04 Jul 2026 21:41:05 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6952a0dsm1952615b3a.0.2026.07.04.21.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:41:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 43/46] target/xtensa: Rename xtensa_breakpoint_handler
Date: Sat,  4 Jul 2026 21:37:22 -0700
Message-ID: <20260705043725.1373137-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Rename to xtensa_cpu_debug_excp_handler, since it also handles
watchpoints, and that's the name of the tcg_ops cpu hook.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.h    | 2 +-
 target/xtensa/cpu.c    | 2 +-
 target/xtensa/helper.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 119a0b8187..928d300772 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -592,7 +592,7 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       MemTxResult response, uintptr_t retaddr);
 hwaddr xtensa_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
 bool xtensa_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp);
-void xtensa_breakpoint_handler(CPUState *cs, CPUBreakpoint *hit);
+void xtensa_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit);
 #endif
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 void xtensa_count_regs(const XtensaConfig *config,
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index eb6758b694..82b7493ff4 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -330,7 +330,7 @@ static const TCGCPUOps xtensa_tcg_ops = {
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
     .do_unaligned_access = xtensa_cpu_do_unaligned_access,
     .debug_check_breakpoint = xtensa_debug_check_breakpoint,
-    .debug_excp_handler = xtensa_breakpoint_handler,
+    .debug_excp_handler = xtensa_cpu_debug_excp_handler,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index aa012068de..7643e97b2c 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -220,7 +220,7 @@ static uint32_t check_hw_breakpoints(CPUXtensaState *env)
     return 0;
 }
 
-void xtensa_breakpoint_handler(CPUState *cs, CPUBreakpoint *hit)
+void xtensa_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
 {
     CPUXtensaState *env = cpu_env(cs);
 
-- 
2.43.0


