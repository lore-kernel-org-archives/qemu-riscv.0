Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32472C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:02:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIHM-0005q9-RK; Fri, 10 Jul 2026 16:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFZ-0002Mx-GH
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:55:12 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFK-00011U-Jz
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:55:09 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-8487b7b3fc7so798191b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716883; x=1784321683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Oi77c4t6mTRvDij0KOLon4zdhMhjLviMYDkRz5tIy7Q=;
 b=xMG8b3H/EZ+V7aRc+e50ajp7Hx3dnazQx79ChhbiMrrL4KMw0H/3jRAMLHPJYxRtBy
 3VwlFkyRpmrHIZMlCWJP85wlzn+kuI8iCAhm36Zxjsa7FrDgfvp0H4fKpz14EbD3/NQU
 n9lMeiXHsCX4m9RY/n68MDV7yOriYd/4hfY+kXGQzC9Gdby7xZW3M2PUphsU6hDzARWU
 dsdmfWDQnE9FGI6gQdhvoqNzSYPIpm9rehj+776KsJqguDk16Zw1uDtA6xQs1qr9hwER
 XECmx2xZSuYN7z/8zWVukspJsLcih9rYmp62Xd+JhdLVY8aoJtBkZ7tKbr2HvKpCOO7I
 9ekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716883; x=1784321683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Oi77c4t6mTRvDij0KOLon4zdhMhjLviMYDkRz5tIy7Q=;
 b=oF27NKCSr4BUXeqbIWs756+6+61myZGy/KFaAii5JFBKLsiPDWCxrxaxCLaMAHG/xA
 3X+Zxdt2U5h8GPhf9/IMFioz5XoJfWdjUaXFQP5Crt8x/NjuZCxzVGo2AQJ93oDDmYyh
 s97yYyDvqyQjxPd5dNe1rKY2Dkr05q0K679nBpa8bmWRQ2vpCKXyr6VAqQbSqKCNyT4V
 WwrkjiDE0xO6CRz5uXNB0C2LbjYsewb9sglj7AtWdPJNRN4lE7mw8PQ7lekAfyE46USk
 SPvA7e47S6UM3elYZ+StzdYusJm3NM6CNV0l8/4vAF78O46f5FrNY7LFz37vB7tlZij8
 cS9Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp5jJ9GaQEOHglSYx/cJqrN+yJTFfBDFGtUiYjnDy3CKtVIKi4bemnz9P03Vl9WHrJkJuNQ2I0M0YTJ@nongnu.org
X-Gm-Message-State: AOJu0YwN3vkhPujasPNooFJ1m1K/UlRt9a7tTVpQQ9RRyBbBzVu9tYTL
 49NR3K91w+gnwzPZj067bWAQlP4XXzau06cDbVBlfToGoeTNLQlp5L7AqTGQegLPZ1A=
X-Gm-Gg: AfdE7cmFoIDRDqXpeBTEuVvg77E6eoEERbH+UibhcIxAXloK2HsU0nq0OKiMYGhCYzr
 RigiHwDPWK4Lm5Yj1VypjukNUTQDEjQwDRkgL+biYNOlpCokT1lUXXTBm9ED+zZOG1VwPzDr/Wa
 iALm12GsQLtHoVMjteCFWuxwFijq0tEzSsdb3/noUiZOSs42gAtQNBUFF014KZ+jHubFDTByMCh
 vU/Sbr1+qD2IfkIiH3R48m4ircCJeiNwCZSqCCHggrvKsWImswbCyLyDucOY6zX75r+eXw6p/5c
 VNx9TDK8apcHRPyq31UerBZq8ZqiTR3btCE3+tbLoNcx/pdrBc/UmglRDu4HZF3jSpSV2V4pXH4
 MF75Snk1MLke0gRSxR8F3Eq0WVfGl7W+N6fZUlLR769c1VVlcv7nX0vOlMBFWXLT2g9puSCBxOy
 6H2EkfuUGbAW136iBMPA==
X-Received: by 2002:a05:6a00:94f5:b0:82f:2b0:2809 with SMTP id
 d2e1a72fcca58-84889637281mr545510b3a.1.1783716882973; 
 Fri, 10 Jul 2026 13:54:42 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 38/51] target/xtensa: Restrict xtensa_breakpoint_handler to
 system mode
Date: Fri, 10 Jul 2026 13:53:48 -0700
Message-ID: <20260710205401.836304-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.h    | 2 +-
 target/xtensa/cpu.c    | 2 +-
 target/xtensa/helper.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 663ee23dc4..119a0b8187 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -592,6 +592,7 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       MemTxResult response, uintptr_t retaddr);
 hwaddr xtensa_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
 bool xtensa_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp);
+void xtensa_breakpoint_handler(CPUState *cs, CPUBreakpoint *hit);
 #endif
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 void xtensa_count_regs(const XtensaConfig *config,
@@ -621,7 +622,6 @@ void xtensa_translate_init(void);
 void xtensa_translate_code(CPUState *cs, TranslationBlock *tb,
                            int *max_insns, vaddr pc, void *host_pc);
 void **xtensa_get_regfile_by_name(const char *name, int entries, int bits);
-void xtensa_breakpoint_handler(CPUState *cs, CPUBreakpoint *hit);
 void xtensa_register_core(XtensaConfigList *node);
 void xtensa_sim_open_console(Chardev *chr);
 void check_interrupts(CPUXtensaState *s);
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 2015a4e3d0..eb6758b694 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -316,7 +316,6 @@ static const TCGCPUOps xtensa_tcg_ops = {
 
     .initialize = xtensa_translate_init,
     .translate_code = xtensa_translate_code,
-    .debug_excp_handler = xtensa_breakpoint_handler,
     .get_tb_cpu_state = xtensa_get_tb_cpu_state,
     .restore_state_to_opc = xtensa_restore_state_to_opc,
     .mmu_index = xtensa_cpu_mmu_index,
@@ -331,6 +330,7 @@ static const TCGCPUOps xtensa_tcg_ops = {
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
     .do_unaligned_access = xtensa_cpu_do_unaligned_access,
     .debug_check_breakpoint = xtensa_debug_check_breakpoint,
+    .debug_excp_handler = xtensa_breakpoint_handler,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index 02627ada7c..aa012068de 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -206,6 +206,7 @@ void xtensa_register_core(XtensaConfigList *node)
     g_free((gpointer)type.name);
 }
 
+#ifndef CONFIG_USER_ONLY
 static uint32_t check_hw_breakpoints(CPUXtensaState *env)
 {
     unsigned i;
@@ -249,7 +250,6 @@ void xtensa_breakpoint_handler(CPUState *cs, CPUBreakpoint *hit)
     }
 }
 
-#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_unaligned_access(CPUState *cs,
                                     vaddr addr, MMUAccessType access_type,
                                     int mmu_idx, uintptr_t retaddr)
-- 
2.43.0


