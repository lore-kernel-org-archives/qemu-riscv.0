Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C06DC43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:43:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEfG-0003lO-I9; Sun, 05 Jul 2026 00:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfE-0003bu-7T
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:41:08 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfC-0006NM-B7
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:41:07 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-8478fe07f0fso2072322b3a.0
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226465; x=1783831265; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oi77c4t6mTRvDij0KOLon4zdhMhjLviMYDkRz5tIy7Q=;
 b=Dq1lPD3spGmIiYLdk8bMry+DuQEqWSZSXqSDfKDHjHwHm49qihOCKGOXNadu+mIqAv
 AQdixeji5oSCpIYgGYqFY9qHPnZTFUapygPQDuXDq2d5yyXYJyPixMvOqzNdUEOFAuqu
 rqN6d558Kkr7n77gKcxsMJsxi+2u1Nz1wwGJNqfLEz1qshYY5m2xuYoWkbWUYHEAC2JD
 lzLbaDCxfHT+UZ/xIes2V/+0jpN42HaGVTN60g7d6eJJHcwbND3aiWXh4Euz0IPf2CP/
 NuTlOzGZbRfO9MY5FXlK9C8OhdTzOEW+clWKbk8vMUZ8S7iVISlGJvqd5/YX3/ZOc4WC
 i73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226465; x=1783831265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Oi77c4t6mTRvDij0KOLon4zdhMhjLviMYDkRz5tIy7Q=;
 b=N/sw1nzbnzms7RwCxW9uKucQiq4ZJozjSeeQT9xw7ohqZ8Yh/VzE4pgDJTr3GfjR8I
 ClEGjMCxZlf4NrpVTU3MadjfObqY2dINK4vJPq+AmWjJB702ouJQymEKjxhNSMfxKj2J
 E47uOwY9ujYVA9jZjucUhepfKwPm2ytu0vaS0KModNY2Zi9rjYZFrXToNu3qpgICHZTc
 gVJ7qOj4ePOPu7Akx6wUcaaJcE7tXuR1AGi1m9hNz4Z9xYyeCdFFgq5n5rbbiUvSiBfV
 BGWtWlU1VBlUu7MZyL96S3TPZlDnfnxM8z9WwfukSRY9HfZZVBxeWVtxPq81Pu/s+Hnb
 QRDA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoYQ4FGhiceyC+fKExWXhAWKrREgud7GDgzgVk2ZlmvZyqIKpUPTP36H3LVUryZzksXJU+zR/hR/Rbg@nongnu.org
X-Gm-Message-State: AOJu0Ywq7PkZMHUWRj6n9cTVTAbx6XZaCUWGlTzIY/OF0jX6Wl0B0SsA
 uxgg3u1ISONkQPrGyVtb34oj1lVuZpt5ezU7oYZ96JyymRdWZShdLtQoGgf4SYmGOwE=
X-Gm-Gg: AfdE7cnRcqR2A68Uh+e5RaMB5jdxn2quYTJWYZJcsz1TcyoGELUQVBzuDuLk35EQnCa
 fy3aUwlWOVViTemi8QDO5qWmIblUqGWUZuwlnC8Ja4CUY05LpmetdkWCBQIhsQUQMo1iW3u1N7M
 E6UKG5U7w+h0VWtbrVw+xgtPgki3nnKbHgeQpKb4QIza7OHG5g13nzNdOtfViZ0dRo5+1wLQjMe
 VpkOzvqNnFZ+jrMaBPr0jtzJQQ3zA014HCynXeo6hqS4oAkyetoJWqaKxSGCF1uK//eJ1gQZfBb
 EeFMvC0UwMlZV5aJh7JLfQ1yiMjoTc6guaTUfpaUEuJ+lTg3DRYbsXXVtnS1msnOgkLtvpIDikw
 B7aILD1qwmAPKIFN2IyqPnvLc9ybbMClTOXsAFq+0UlSHaER1wlJL2+h4tA2tyUaAhKBJxfjGoB
 B7XbmIoJQq+1DxBJJJUGDb93R1KzRslqezDdOUaA9LyA2Ew3E=
X-Received: by 2002:a05:6a00:4f83:b0:846:bc60:5bf8 with SMTP id
 d2e1a72fcca58-847f6d5b738mr4440975b3a.5.1783226464787; 
 Sat, 04 Jul 2026 21:41:04 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6952a0dsm1952615b3a.0.2026.07.04.21.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:41:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 42/46] target/xtensa: Restrict xtensa_breakpoint_handler to
 system mode
Date: Sat,  4 Jul 2026 21:37:21 -0700
Message-ID: <20260705043725.1373137-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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


