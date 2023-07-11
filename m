Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C09FC00528
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 12:20:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJCIx-0003UW-LS; Tue, 11 Jul 2023 08:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJCI1-0002SV-U4
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:16:26 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJCHz-0005WQ-6L
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:16:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3142a9ffa89so6409138f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 05:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689077778; x=1691669778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXRL5F89g/bx9rOgMuCB2lIwE21xlqpM41j48uY4U8o=;
 b=LqOxSWHTDrMxP1hUgjuZsLgKuzZoinz2hOko7f230ADBH/xsf5bZ4jgXRxbQAeTdbq
 3wrBNtQWqM8fRcgBRX8bAYwkAQYsYMGFkUwXn7KnolYmv8nSfw8TY0UGlVar8zUaR2ah
 zjB2G2H/N+jzqxPxJ6USwIBRdxJYkq0xMWFft9atOgUh9DUFmYJtLuto7TM6QHHuXK4b
 Iy+EZNdA3TXNye8VlXCXuoDy3eFrPfICgzl+NBDintZVVs5DZlH9020cGoCkKFQLxqxB
 r84080yDCx92MtsYSPTAzpwQEiCOQs8o/FaFh993TKukU3zuzWClOCReJRNJoC6GJKew
 W7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689077778; x=1691669778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fXRL5F89g/bx9rOgMuCB2lIwE21xlqpM41j48uY4U8o=;
 b=P+UhJ3qMz1pVpNjRMv6eeN+tfwk95WqHBQtfka17E5yb4r9k2D6DIR0MRkk7B/B8Dn
 nAgfbkvQHtsHGhqA4wJH9ZelwEPOGNLqR3xOm/RLJpXOdFZHHDuW0MzC2jzGsk7aLY68
 XZYfrpIX0wKgOyHFcCr1oIddOe4ZAg05nXCxdtMDm24t3uHDlCtw59fF/02FwqMu8CCR
 57U986HLQ7VAL/AcoTOidAQ38f3IXbkWMRcZvFDR42uMGyMqZUu8T4PqinztzOG1EBcB
 rjlbMsR9n+mhJ4eovHMAvtvbI/r/9uqjYwTtKTC0qZl0m2v7JdEzT3XSTJPdY4Q7LCGb
 QCFw==
X-Gm-Message-State: ABy/qLbX9x+gGACWaPdCGVcJ7OxE3GbEYJqC2fUiBbw3aIPXs/L/sOYW
 5+GIaEAHyC44+JiRoI6smBdOELxiGVby5vcEVCc=
X-Google-Smtp-Source: APBJJlHoxHlsY9TUzyqOizpBhe/QIPDyl6kggJbn6BJntlDmkCDfGyKpdIDcb7CbKQ3vzffMvfow4Q==
X-Received: by 2002:a5d:4d0b:0:b0:313:e20c:b8e0 with SMTP id
 z11-20020a5d4d0b000000b00313e20cb8e0mr15656329wrt.23.1689077777843; 
 Tue, 11 Jul 2023 05:16:17 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.194.156])
 by smtp.gmail.com with ESMTPSA id
 s15-20020adff80f000000b00313f9a0c521sm2120349wrp.107.2023.07.11.05.16.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Jul 2023 05:16:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 15/16] target/riscv: Restrict TCG-specific prototype
 declarations
Date: Tue, 11 Jul 2023 14:14:52 +0200
Message-Id: <20230711121453.59138-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230711121453.59138-1-philmd@linaro.org>
References: <20230711121453.59138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.h |  3 +++
 target/riscv/cpu.c | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6d78e59214..d2a9764317 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -479,7 +479,10 @@ RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t bit);
 
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
 
+#ifdef CONFIG_TCG
 void riscv_translate_init(void);
+#endif
+
 G_NORETURN void riscv_raise_exception(CPURISCVState *env,
                                       uint32_t exception, uintptr_t pc);
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 91433f3041..c96819daf7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -38,7 +38,9 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "fpu/softfloat-helpers.h"
+#ifdef CONFIG_TCG
 #include "tcg/tcg.h"
+#endif
 
 /* RISC-V CPU definitions */
 static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
@@ -782,6 +784,7 @@ static vaddr riscv_cpu_get_pc(CPUState *cs)
     return env->pc;
 }
 
+#ifdef CONFIG_TCG
 static void riscv_cpu_synchronize_from_tb(CPUState *cs,
                                           const TranslationBlock *tb)
 {
@@ -799,6 +802,7 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
         }
     }
 }
+#endif
 
 static bool riscv_cpu_has_work(CPUState *cs)
 {
@@ -815,6 +819,7 @@ static bool riscv_cpu_has_work(CPUState *cs)
 #endif
 }
 
+#ifdef CONFIG_TCG
 static void riscv_restore_state_to_opc(CPUState *cs,
                                        const TranslationBlock *tb,
                                        const uint64_t *data)
@@ -837,6 +842,7 @@ static void riscv_restore_state_to_opc(CPUState *cs,
     }
     env->bins = data[1];
 }
+#endif
 
 static void riscv_cpu_reset_hold(Object *obj)
 {
@@ -1991,6 +1997,8 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 };
 #endif
 
+#ifdef CONFIG_TCG
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static const struct TCGCPUOps riscv_tcg_ops = {
@@ -2009,6 +2017,7 @@ static const struct TCGCPUOps riscv_tcg_ops = {
     .debug_check_watchpoint = riscv_cpu_debug_check_watchpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
+#endif /* CONFIG_TCG */
 
 static bool riscv_cpu_is_dynamic(Object *cpu_obj)
 {
@@ -2152,7 +2161,9 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
+#ifdef CONFIG_TCG
     cc->tcg_ops = &riscv_tcg_ops;
+#endif /* CONFIG_TCG */
 
     object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendorid,
                               cpu_set_mvendorid, NULL, NULL);
-- 
2.38.1


