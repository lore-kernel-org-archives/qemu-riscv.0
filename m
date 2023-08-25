Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490B0C7EE2C
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 13:10:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZWZ6-0001eW-IT; Fri, 25 Aug 2023 09:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWYv-0001b8-74
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:17 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWYr-0006vF-MN
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:16 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1a28de15c8aso549163fac.2
 for <qemu-riscv@nongnu.org>; Fri, 25 Aug 2023 06:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692968952; x=1693573752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oggsrpX6WUZrOh83OLz1neTpT4+kY+8nOCcszDP//6I=;
 b=YYmd+myi56geubBafB/cbqfR8aD6KWmHl2LowVE+gQTVVWRy6+dZmRaoVyPq+x1jXw
 8ZA3uEu0Vio44x4cYmAvpdn3uKGGTxA1g9SYXcjLSjWrCfwFBZTsqj6+8Y4mhfH+esa5
 zTaWTQue2/c0ev72FmPAsGFGt6M5IaRN4IP6xEd/PkUDZXVLLAx1FppiPNSL0ryP3tXM
 i3HpyQhrgB9F7uX20LqPOWJQhDOsKxK01lqguWN3gOEhPPhuTHz4+/vGtd0496cfOb0E
 QvfNy5nRi/z/kHb830Hd5LxI09N8LMiwflfN1JtA3lqo0IBb8U6XevoykxYjEqxGRmWn
 Q0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692968952; x=1693573752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oggsrpX6WUZrOh83OLz1neTpT4+kY+8nOCcszDP//6I=;
 b=ShwR+AiKMSIEc8iLKYBCsOoYzIsdE5UAFzpEv09pEMhvftKI+CN7HH7NBk7WPevw4G
 DVa9a+daLlTR5zrJPTiu6ru6sSqBzLJOLG4D4gwZhevXnS7sVnhHsbpBZtyYzeLZt+JX
 xf4NRWk8DWRkrXFceMJAUoYLXrP7WDKrSW4CFb34QY5+z8ymwQM1l5aKaVKwQUHoP1sA
 ckKP19X3Yd7e6E6L5Gx7lD0ufbvz9G7zzG8ioXYNLC0ZsMyIJokjh55XMxjGQ4DB7LTf
 F6MQqsilSwFC53WCjcEUH8q3drVGA0k1e/I5KRhc6HQktynsZifgDvskNMixmXGsSCV9
 2NBA==
X-Gm-Message-State: AOJu0YyvkEEZLg+U8zvozuQERKCsIYZRrQCC5B7QwWV9eo6oYHYkc+1g
 1FUrrjNPpouilQxnwi+ZUeNEyg==
X-Google-Smtp-Source: AGHT+IEqLhVbcYHPxHbg3dbZ3PRauC5WCLCr8LKW4o346/wMc58scOZBhVGg1upUctFeDkl1DV5xtw==
X-Received: by 2002:a05:6870:8289:b0:1bb:5676:a62c with SMTP id
 q9-20020a056870828900b001bb5676a62cmr2916218oae.33.1692968951947; 
 Fri, 25 Aug 2023 06:09:11 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 ds23-20020a0568705b1700b001c50fb56845sm966189oab.16.2023.08.25.06.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 06:09:11 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 04/20] target/riscv: move riscv_tcg_ops to tcg-cpu.c
Date: Fri, 25 Aug 2023 10:08:37 -0300
Message-ID: <20230825130853.511782-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825130853.511782-1-dbarboza@ventanamicro.com>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 target/riscv/cpu.c         | 58 -------------------------------------
 target/riscv/cpu.h         |  4 ---
 target/riscv/tcg/tcg-cpu.c | 59 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 62 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 12cea62ee7..839b83e52a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -839,24 +839,6 @@ static vaddr riscv_cpu_get_pc(CPUState *cs)
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
@@ -872,29 +854,6 @@ static bool riscv_cpu_has_work(CPUState *cs)
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
@@ -1796,23 +1755,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
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
index fb17097bb1..2024c98793 100644
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
+const struct TCGCPUOps riscv_tcg_ops = {
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
-- 
2.41.0


