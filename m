Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537C2C43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:43:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEcX-0005Hr-NJ; Sun, 05 Jul 2026 00:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbt-0004ko-8R
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:37:41 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbl-00042L-7e
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:37:40 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2c7cfa17fedso18582935ad.3
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226252; x=1783831052; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/67beO8XTF3m4SA3ioSNOjxwdmfJ7kOkKLq2brE5jyQ=;
 b=DPwWmUsDG+Z6PkJlm5aiaPJYJJHwuoZd2YDLZSMEzlN7/p0Kkz0s4+SPLSmemVtpok
 2COnJkKWHTjOYW7cliyQrIu49GH9UEYRXayuoqm0X1bmcgTenBUmrQI0ScfJwAFuADK2
 uA2wPTXtci25AXWrZClxDO180QAGdDA1iV5q58uMJMdw47oXco3qjM1JyRRrUPlwd1ZM
 igm/zGfDYrRAnbaPJCBjwA5/VCKJ6GRhwJRhSooeZQAyA7Yo4vViox8U46Dfgx3P6nKK
 SUdMpG5r+Hu+ZULkPWTGJ896/GBLDyFJhuWWr3ODRG/c8Nm77p20hDNpJk1vZWTxNBPL
 B5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226252; x=1783831052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/67beO8XTF3m4SA3ioSNOjxwdmfJ7kOkKLq2brE5jyQ=;
 b=MWjSkfuONqkIf+rmOaa2yDDMves+s9XlcQh379HNEWOcdZQRcRDvZ8Aqs8q0vqDO8n
 J9S/M5o1uQKKtq6/W9eOzLU2Ig7znHRsRm2ierskeJr14USaiobQJ67EafGr0efLmLHe
 KJUb9F3ci/HHudqlCyqhVbXO22qG0/KLoB4GWX1tcIU00HKZ7uPqKl5HcjqOS77lbhPE
 Z6fwDl8bz7Vwz3fku3nG6y9EqxBfUQaQ15VrwT7Zn9++DbO1cdx6zTpQgDxCKGwTUB/5
 CfFdIyGrKEy8zu+obyDdqUw7ns3zWD/q9S7M2WDNKr+5UumRnpLmIpvIQuDtiSQnDjrP
 Fu4A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrg373GyPWBKlPLva5u1ZwpFaNcixCLyIeP5P8iVaBGzLHTOTWa11uxKdqZa+AhP8T3rt/CgWysBwDk@nongnu.org
X-Gm-Message-State: AOJu0YySUdAoZro0ir4a2kJYP3OKDqVnex0QUVImM5sT+2klo7CMh9N9
 6NYQBjb93zDmqCN0mpu+qUYKJR0oRmZkQtVHKz3eZvguutFjKWJLZ8QAfGBZ2kP5eEo=
X-Gm-Gg: AfdE7clV8dv86DqyKYL7yKxOdsQQUpnwIDIUqXi/D/PCA6EJF6HIuEZ8CDKHaEGGqNf
 0wjIzEOKknbRx/CY13MKDRuDU3QNa+XXpc/TxYSNt/gB+bk37RANWTViPvHMFuNimBGBMXQX2yG
 bOw5Y4D/6SEBT4mDZcS3JDAUX8pAqLkxpnvdtreFEXXCbRBgUpWYjxYiLpslVUZgIaJMCh5/dVw
 KyuJ2JM/mIL4CPnhbeVMsDvzUBL+VFDjRnF6vN9sASJj5xh2qjUBAd2houMi/a4ccyVtn1ZIDU8
 fUG9LQGwSD5Huyv6tqxo1chPvcQW46WTUQxRhJhoPhj8EZQPNYRGksUEF621IPA9oAK4T+HYrjw
 FdGUwU07Jcss6wRCqqSRPRCXTs5CJkdONUcUnXSi/Woc2yPJ4/Lil5i8I1kMARMAD7vo9rKHj7+
 inKos7GDr8qpC/Wkbq5mxu+Pjr0VcHVOTMcmIH7DRtMfmUM98=
X-Received: by 2002:a17:902:ebca:b0:2c9:aae1:a61a with SMTP id
 d9443c01a7336-2cbb750da9dmr53626865ad.14.1783226251814; 
 Sat, 04 Jul 2026 21:37:31 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 06/46] exec/breakpoint: Move BP declarations from
 hw/core/cpu.h
Date: Sat,  4 Jul 2026 21:36:45 -0700
Message-ID: <20260705043725.1373137-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Move cpu_breakpoint_* declarations to exec/breakpoint.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/breakpoint.h | 7 +++++++
 include/hw/core/cpu.h     | 7 -------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index 0c3cc0c8ff..b06d7ed3c3 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -42,4 +42,11 @@ typedef struct CPUWatchpoint {
     QTAILQ_ENTRY(CPUWatchpoint) entry;
 } CPUWatchpoint;
 
+int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
+                          CPUBreakpoint **breakpoint);
+int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, BreakpointFlags flags);
+void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint);
+void cpu_breakpoint_remove_all(CPUState *cpu, BreakpointFlags mask);
+bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, BreakpointFlags mask);
+
 #endif
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 71ed1f17a4..e05e261883 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1138,13 +1138,6 @@ void qemu_init_vcpu(CPUState *cpu);
  */
 void cpu_single_step(CPUState *cpu, int enabled);
 
-int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
-                          CPUBreakpoint **breakpoint);
-int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, BreakpointFlags flags);
-void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint);
-void cpu_breakpoint_remove_all(CPUState *cpu, BreakpointFlags mask);
-bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, BreakpointFlags mask);
-
 /**
  * cpu_get_address_space:
  * @cpu: CPU to get address space from
-- 
2.43.0


