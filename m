Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08910EB8FB5
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 09:23:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qdof0-0003Ai-HM; Wed, 06 Sep 2023 05:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdoev-0002s8-9y
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 05:17:13 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdoes-0005f4-33
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 05:17:13 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6bd0a0a6766so2487130a34.2
 for <qemu-riscv@nongnu.org>; Wed, 06 Sep 2023 02:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693991829; x=1694596629; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/XqMqmkjBuQ7igNtla2QSukBWkpojMJT/hIbQ2/MtA=;
 b=eeHEsQyl9oLS0IrABP1+RkP4KJoZlpL5u4ar8as5rGCzMFQQeZrthjOglYscrWdozE
 yKvJW2EdZhcxn40F7pkCUhDK5YvveDY6i3OgjCnEC7bL1YcUn7NdSSHtqRWdRkWbWNxf
 /hWqcS5qwacdP1cGLW4Miq5LGA4DHwzbTYGGl2tsZvEPEyt19o+zIwMCBkthD9fOyjp2
 JSMClbKxlMTh4ZeewtJhVHnnjd50rNpyZ8KxGbV8Jiq0S7u5UYW4lsLdfFudNGcFMVNd
 6eh9b/X7a27prEVI1jPcJmuFgzudxKSnJXGY1d/GAGLkmD2cwLJpRrIoITIaHhf9CCoW
 6z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693991829; x=1694596629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/XqMqmkjBuQ7igNtla2QSukBWkpojMJT/hIbQ2/MtA=;
 b=IgiDxgR1o4ibNak3nm6WoBhq5eSOuhPnxJk/ziLQxmLSMNJlLHoY8t5Il5Wth/OwLs
 6D1FUgFwaDIzUNjAe6DjVwZ0k8RupzPnuZ5hnzi5EGk1JPTtsmJLVdzGyoJVWy80Tmlc
 qyfVmjqMtqOmdFFwkcoCoQzPFffV0KtNtdLugFmVXZEKO18CnpxYmva6mGLilRuQPpSm
 Cy1MUjZ84tVvpA5QrIu6q+ea8JNTrxXQ5tFEnr+yh60P/qzZpssk6TEYRH/pgjPDeHoZ
 sXkcDWzkLWIw+F0QU4r/8ZiQ8jU2mvo94CNNRT6Ude6d5Ckv98lZBRNFJgWEnjO6VXex
 7+qw==
X-Gm-Message-State: AOJu0Ywq3oz0hZTEfo+remFKht/ilyiPAjtK+sGARki51VyaYU49gSAo
 tvNq/ANWoviEwnjamrpBsMqoaw==
X-Google-Smtp-Source: AGHT+IGau6LiA8T8MXMCbAYg/F8SpUrSMpBRwF6LG34ZEe6yjdO6G0aS3onGa59kyqyYrLyQXC6rsg==
X-Received: by 2002:a05:6830:1350:b0:6b9:14bf:7097 with SMTP id
 r16-20020a056830135000b006b914bf7097mr17213354otq.9.1693991828989; 
 Wed, 06 Sep 2023 02:17:08 -0700 (PDT)
Received: from grind.. ([177.94.15.194]) by smtp.gmail.com with ESMTPSA id
 n21-20020a9d6f15000000b006b75242d6c3sm6229228otq.38.2023.09.06.02.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 02:17:08 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 04/19] target/riscv: move riscv_tcg_ops to tcg-cpu.c
Date: Wed,  6 Sep 2023 06:16:31 -0300
Message-ID: <20230906091647.1667171-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
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

Move the remaining of riscv_tcg_ops now that we have a working realize()
implementation.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c         | 58 ------------------------------------
 target/riscv/cpu.h         |  4 ---
 target/riscv/tcg/tcg-cpu.c | 60 +++++++++++++++++++++++++++++++++++++-
 3 files changed, 59 insertions(+), 63 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e186c026c9..7569955c7e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -838,24 +838,6 @@ static vaddr riscv_cpu_get_pc(CPUState *cs)
     return env->pc;
 }
 
-static void riscv_cpu_synchronize_from_tb(CPUState *cs,
-                                          const TranslationBlock *tb)
-{
-    if (!(tb_cflags(tb) & CF_PCREL)) {
-        RISCVCPU *cpu = RISCV_CPU(cs);
-        CPURISCVState *env = &cpu->env;
-        RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
-
-        tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
-
-        if (xl == MXL_RV32) {
-            env->pc = (int32_t) tb->pc;
-        } else {
-            env->pc = tb->pc;
-        }
-    }
-}
-
 static bool riscv_cpu_has_work(CPUState *cs)
 {
 #ifndef CONFIG_USER_ONLY
@@ -871,29 +853,6 @@ static bool riscv_cpu_has_work(CPUState *cs)
 #endif
 }
 
-static void riscv_restore_state_to_opc(CPUState *cs,
-                                       const TranslationBlock *tb,
-                                       const uint64_t *data)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
-    target_ulong pc;
-
-    if (tb_cflags(tb) & CF_PCREL) {
-        pc = (env->pc & TARGET_PAGE_MASK) | data[0];
-    } else {
-        pc = data[0];
-    }
-
-    if (xl == MXL_RV32) {
-        env->pc = (int32_t)pc;
-    } else {
-        env->pc = pc;
-    }
-    env->bins = data[1];
-}
-
 static void riscv_cpu_reset_hold(Object *obj)
 {
 #ifndef CONFIG_USER_ONLY
@@ -1811,23 +1770,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 };
 #endif
 
-const struct TCGCPUOps riscv_tcg_ops = {
-    .initialize = riscv_translate_init,
-    .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
-    .restore_state_to_opc = riscv_restore_state_to_opc,
-
-#ifndef CONFIG_USER_ONLY
-    .tlb_fill = riscv_cpu_tlb_fill,
-    .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
-    .do_interrupt = riscv_cpu_do_interrupt,
-    .do_transaction_failed = riscv_cpu_do_transaction_failed,
-    .do_unaligned_access = riscv_cpu_do_unaligned_access,
-    .debug_excp_handler = riscv_cpu_debug_excp_handler,
-    .debug_check_breakpoint = riscv_cpu_debug_check_breakpoint,
-    .debug_check_watchpoint = riscv_cpu_debug_check_watchpoint,
-#endif /* !CONFIG_USER_ONLY */
-};
-
 static bool riscv_cpu_is_dynamic(Object *cpu_obj)
 {
     return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 721bd0b119..2ac00a0304 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -706,10 +706,6 @@ enum riscv_pmu_event_idx {
     RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS = 0x10021,
 };
 
-/* Export tcg_ops until we move everything to tcg/tcg-cpu.c */
-#include "hw/core/tcg-cpu-ops.h"
-extern const struct TCGCPUOps riscv_tcg_ops;
-
 /* used by tcg/tcg-cpu.c*/
 void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en);
 bool cpu_cfg_ext_is_user_set(uint32_t ext_offset);
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index da18851ed4..8698ce4765 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -26,7 +26,66 @@
 #include "qemu/accel.h"
 #include "qemu/error-report.h"
 #include "hw/core/accel-cpu.h"
+#include "hw/core/tcg-cpu-ops.h"
+#include "tcg/tcg.h"
 
+static void riscv_cpu_synchronize_from_tb(CPUState *cs,
+                                          const TranslationBlock *tb)
+{
+    if (!(tb_cflags(tb) & CF_PCREL)) {
+        RISCVCPU *cpu = RISCV_CPU(cs);
+        CPURISCVState *env = &cpu->env;
+        RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
+
+        tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+
+        if (xl == MXL_RV32) {
+            env->pc = (int32_t) tb->pc;
+        } else {
+            env->pc = tb->pc;
+        }
+    }
+}
+
+static void riscv_restore_state_to_opc(CPUState *cs,
+                                       const TranslationBlock *tb,
+                                       const uint64_t *data)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
+    target_ulong pc;
+
+    if (tb_cflags(tb) & CF_PCREL) {
+        pc = (env->pc & TARGET_PAGE_MASK) | data[0];
+    } else {
+        pc = data[0];
+    }
+
+    if (xl == MXL_RV32) {
+        env->pc = (int32_t)pc;
+    } else {
+        env->pc = pc;
+    }
+    env->bins = data[1];
+}
+
+static const struct TCGCPUOps riscv_tcg_ops = {
+    .initialize = riscv_translate_init,
+    .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
+    .restore_state_to_opc = riscv_restore_state_to_opc,
+
+#ifndef CONFIG_USER_ONLY
+    .tlb_fill = riscv_cpu_tlb_fill,
+    .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
+    .do_interrupt = riscv_cpu_do_interrupt,
+    .do_transaction_failed = riscv_cpu_do_transaction_failed,
+    .do_unaligned_access = riscv_cpu_do_unaligned_access,
+    .debug_excp_handler = riscv_cpu_debug_excp_handler,
+    .debug_check_breakpoint = riscv_cpu_debug_check_breakpoint,
+    .debug_check_watchpoint = riscv_cpu_debug_check_watchpoint,
+#endif /* !CONFIG_USER_ONLY */
+};
 
 static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
                                     bool value)
@@ -513,7 +572,6 @@ static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
 {
     /*
      * All cpus use the same set of operations.
-     * riscv_tcg_ops is being imported from cpu.c for now.
      */
     cc->tcg_ops = &riscv_tcg_ops;
 }
-- 
2.41.0


