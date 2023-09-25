Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E106CE7AB4
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 18:00:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkpps-0000am-EW; Mon, 25 Sep 2023 13:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkppr-0000Zy-9c
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:57:31 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkppp-0002Ag-CP
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:57:31 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-692779f583fso4479649b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 10:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695664648; x=1696269448; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6t/Hek37nvY/jYdRd1VfU2g8rvRGHXE1Y+hGG4OCR6w=;
 b=XfDeeDtiKcQcOiyuvuhb0Z66JNnUo85GPqhZY9ScmTG0Ljy/nvg9ScyCc95EkVp3ct
 E59MbgnlAX1XLKqCE+Irja3icHbCSXObZJudgyDRjIWRlE77NcFLpKx+1V3YN5iV9fLK
 HxoLOMgXv7UElAifbL799qiCdkzBZZtqm/FMuwIvXdPVTQGuArKntJ/7yaaWdUQ2qNAU
 d3EFXIqLqofxZEOp9Klo/SXuSnWywxkyOfJWbxgOZPJY02IgV52hvzWnfr9EBNCL0Hau
 8CRBz0+H9AUh2M4rPs1m7WCgSjLiAgN2sgI4zbGiVYi+Puhzx1g9tUN84odi0aehU2TC
 IwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695664648; x=1696269448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6t/Hek37nvY/jYdRd1VfU2g8rvRGHXE1Y+hGG4OCR6w=;
 b=m3l/6gFttewWiQXszT59sqJYyhBpYvJZ8M/dGDloHKeKYUTAizRq3Ws0n1ShW7Bnfb
 vZENkZLvH9nJGwBUSh5CFhLYOK3nhME89P1+1UNX5MEKBtXQ0tiVFgs6ctIAKsJ1QpgA
 VLd/8oPY2frgxUArHP2fa6+0CGCxnfaImdqbwXuHGCvzSjBkhuX2SMvBCtz7oD/itLu6
 02HVJkNuST/hEKF/XJ+nBmhR2FtT8fXEq2PHv5JFnO2XVfmzhJEORMyKk+qlTDp2DDeL
 b53RvhVJZEIEGruYrQKsuCwCa29cad/lV9k9rx9wDlgMC18oPAJZ3oMHVZ0Cegz5cvij
 w2XQ==
X-Gm-Message-State: AOJu0YySwoQPLciWZBATODUE1JnCaG8beM+nxHJNmJep9fFk4sVMwpCZ
 o1WUnGDNqgBG1PNhPfMGOH1UcA==
X-Google-Smtp-Source: AGHT+IEiopeW2RR/srxuEjbR89rl4eFFXPL/mXhhgTdHD5cdaKuWudBAxWWJ3wam9kCj2JJQxrBWgw==
X-Received: by 2002:a05:6a21:33a7:b0:159:beec:79d4 with SMTP id
 yy39-20020a056a2133a700b00159beec79d4mr6295621pzb.0.1695664648119; 
 Mon, 25 Sep 2023 10:57:28 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 i3-20020a17090a65c300b00262ca945cecsm3312722pjs.54.2023.09.25.10.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 10:57:27 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 04/19] target/riscv: move riscv_tcg_ops to tcg-cpu.c
Date: Mon, 25 Sep 2023 14:56:54 -0300
Message-ID: <20230925175709.35696-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925175709.35696-1-dbarboza@ventanamicro.com>
References: <20230925175709.35696-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42c.google.com
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
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c         | 58 ------------------------------------
 target/riscv/cpu.h         |  4 ---
 target/riscv/tcg/tcg-cpu.c | 60 +++++++++++++++++++++++++++++++++++++-
 3 files changed, 59 insertions(+), 63 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7215a29324..9426b3b9d6 100644
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
@@ -1809,23 +1768,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
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
index 409d198635..b2e558f730 100644
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
index 47c89fd554..7d890823bd 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -28,7 +28,66 @@
 #include "qemu/error-report.h"
 #include "qemu/log.h"
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
@@ -515,7 +574,6 @@ static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
 {
     /*
      * All cpus use the same set of operations.
-     * riscv_tcg_ops is being imported from cpu.c for now.
      */
     cc->tcg_ops = &riscv_tcg_ops;
 }
-- 
2.41.0


