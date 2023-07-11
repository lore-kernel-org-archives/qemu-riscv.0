Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35404EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 12:20:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJCHe-0001s7-5L; Tue, 11 Jul 2023 08:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJCHR-0001VX-Cw
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:15:46 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJCHO-0005OC-4x
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:15:45 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3141c3a7547so5779336f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689077740; x=1691669740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HaANU2OE+dOsUg4Qmvd15nGlRm3AOspQfp2v6+k0l68=;
 b=JuHIkB7dbyhCA8xiqVqVsJ0E2jPSxh+Yrp8t4FGJVOKQePKyMOMHmhsZai0teUDnLO
 5+pp6j+yPWTG2/FMSvnxX7x6puSrz+7znAiC7EvVL24p2i9V5SrhXauQmVNuDdaGv0wZ
 mR3yjYjRrjWmMssrXl3jYY5emxSnifVJCqevEb6jLysajxycbeNKLaAXEoeJhogVsp9v
 X4IrXs6sbRPEtbOU90LpgSLh/9x+C2D7XkrYnwfozFwVsNEkBGAOspYwmoQqoC0M1/0N
 96gJh8cAdb4r+1cAbGVhOcv9qKfhaS+rE/DgTOcSCYIaGvIVAxtwpVc/ms0hb2pBNtRK
 3l8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689077740; x=1691669740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HaANU2OE+dOsUg4Qmvd15nGlRm3AOspQfp2v6+k0l68=;
 b=fqGDHn5VoasM8MPUbIkNdXTNKbKihuY5I8PEVU68lzQtBHYsOjtFYXWFMx5OEQWk6j
 CEdsFnbgusrHpKmJIbh+lR0MabRrYMQ8kq5QuPyH/pDaUl0S8qidBDm+WctjJWw4UKBR
 5C3sITuGMWxDRbHVGzECw0DZoHl7LCgKZLQMJ8KU7/OugsUW1XuV89GbbXJZA8suvryU
 H5yQ69XdHNvhyDbVLRVQFgh7H6oYAgnUIIb0JtpezMQlzS8FktCluuo76xWrOm+bxWFn
 Fvh45AS/yFdASjHtmAIOsHXMg8KdGISVrioGltqx++aEqjsGi1rx38huqY4s9vplvfhS
 E/wA==
X-Gm-Message-State: ABy/qLbR/BesO71jGG/WlXGmM5EHawd1Y/W2DKNfs5J0pzgTpa1mIIi4
 5NtDGXUbLBB/ILnBRy1uRuSVkA==
X-Google-Smtp-Source: APBJJlGE0HSeuJO10V9koJHsiqr+wGaycQxUTY+fcEoeDwicpcAj682s1jKIYGZIivs6zqws6ine6A==
X-Received: by 2002:a5d:6e90:0:b0:314:475:bc47 with SMTP id
 k16-20020a5d6e90000000b003140475bc47mr12691389wrz.69.1689077739820; 
 Tue, 11 Jul 2023 05:15:39 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.194.156])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a5d6110000000b003063db8f45bsm2128927wrt.23.2023.07.11.05.15.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Jul 2023 05:15:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 08/16] target/riscv: Move TCG-specific
 cpu_get_tb_cpu_state() to tcg/cpu.c
Date: Tue, 11 Jul 2023 14:14:45 +0200
Message-Id: <20230711121453.59138-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230711121453.59138-1-philmd@linaro.org>
References: <20230711121453.59138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 target/riscv/cpu_helper.c    | 84 -------------------------------
 target/riscv/tcg/cpu.c       | 98 ++++++++++++++++++++++++++++++++++++
 target/riscv/tcg/meson.build |  1 +
 3 files changed, 99 insertions(+), 84 deletions(-)
 create mode 100644 target/riscv/tcg/cpu.c

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 597c47bc56..6f8778c6d3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -64,90 +64,6 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #endif
 }
 
-void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
-                          uint64_t *cs_base, uint32_t *pflags)
-{
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    RISCVExtStatus fs, vs;
-    uint32_t flags = 0;
-
-    *pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
-    *cs_base = 0;
-
-    if (cpu->cfg.ext_zve32f) {
-        /*
-         * If env->vl equals to VLMAX, we can use generic vector operation
-         * expanders (GVEC) to accerlate the vector operations.
-         * However, as LMUL could be a fractional number. The maximum
-         * vector size can be operated might be less than 8 bytes,
-         * which is not supported by GVEC. So we set vl_eq_vlmax flag to true
-         * only when maxsz >= 8 bytes.
-         */
-        uint32_t vlmax = vext_get_vlmax(cpu, env->vtype);
-        uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
-        uint32_t maxsz = vlmax << sew;
-        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&
-                           (maxsz >= 8);
-        flags = FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
-        flags = FIELD_DP32(flags, TB_FLAGS, SEW, sew);
-        flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
-                           FIELD_EX64(env->vtype, VTYPE, VLMUL));
-        flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
-        flags = FIELD_DP32(flags, TB_FLAGS, VTA,
-                           FIELD_EX64(env->vtype, VTYPE, VTA));
-        flags = FIELD_DP32(flags, TB_FLAGS, VMA,
-                           FIELD_EX64(env->vtype, VTYPE, VMA));
-        flags = FIELD_DP32(flags, TB_FLAGS, VSTART_EQ_ZERO, env->vstart == 0);
-    } else {
-        flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
-    }
-
-#ifdef CONFIG_USER_ONLY
-    fs = EXT_STATUS_DIRTY;
-    vs = EXT_STATUS_DIRTY;
-#else
-    flags = FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
-
-    flags |= cpu_mmu_index(env, 0);
-    fs = get_field(env->mstatus, MSTATUS_FS);
-    vs = get_field(env->mstatus, MSTATUS_VS);
-
-    if (env->virt_enabled) {
-        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
-        /*
-         * Merge DISABLED and !DIRTY states using MIN.
-         * We will set both fields when dirtying.
-         */
-        fs = MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
-        vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
-    }
-
-    /* With Zfinx, floating point is enabled/disabled by Smstateen. */
-    if (!riscv_has_ext(env, RVF)) {
-        fs = (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) == RISCV_EXCP_NONE)
-             ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
-    }
-
-    if (cpu->cfg.debug && !icount_enabled()) {
-        flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
-    }
-#endif
-
-    flags = FIELD_DP32(flags, TB_FLAGS, FS, fs);
-    flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
-    flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
-    flags = FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
-    if (env->cur_pmmask != 0) {
-        flags = FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
-    }
-    if (env->cur_pmbase != 0) {
-        flags = FIELD_DP32(flags, TB_FLAGS, PM_BASE_ENABLED, 1);
-    }
-
-    *pflags = flags;
-}
-
 void riscv_cpu_update_mask(CPURISCVState *env)
 {
     target_ulong mask = 0, base = 0;
diff --git a/target/riscv/tcg/cpu.c b/target/riscv/tcg/cpu.c
new file mode 100644
index 0000000000..2ae6919b80
--- /dev/null
+++ b/target/riscv/tcg/cpu.c
@@ -0,0 +1,98 @@
+/*
+ * RISC-V CPU helpers (TCG specific)
+ *
+ * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
+ * Copyright (c) 2017-2018 SiFive, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#ifndef CONFIG_USER_ONLY
+#include "sysemu/cpu-timers.h"
+#endif
+
+void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
+                          uint64_t *cs_base, uint32_t *pflags)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVExtStatus fs, vs;
+    uint32_t flags = 0;
+
+    *pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
+    *cs_base = 0;
+
+    if (cpu->cfg.ext_zve32f) {
+        /*
+         * If env->vl equals to VLMAX, we can use generic vector operation
+         * expanders (GVEC) to accerlate the vector operations.
+         * However, as LMUL could be a fractional number. The maximum
+         * vector size can be operated might be less than 8 bytes,
+         * which is not supported by GVEC. So we set vl_eq_vlmax flag to true
+         * only when maxsz >= 8 bytes.
+         */
+        uint32_t vlmax = vext_get_vlmax(cpu, env->vtype);
+        uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
+        uint32_t maxsz = vlmax << sew;
+        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&
+                           (maxsz >= 8);
+        flags = FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
+        flags = FIELD_DP32(flags, TB_FLAGS, SEW, sew);
+        flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
+                           FIELD_EX64(env->vtype, VTYPE, VLMUL));
+        flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
+        flags = FIELD_DP32(flags, TB_FLAGS, VTA,
+                           FIELD_EX64(env->vtype, VTYPE, VTA));
+        flags = FIELD_DP32(flags, TB_FLAGS, VMA,
+                           FIELD_EX64(env->vtype, VTYPE, VMA));
+        flags = FIELD_DP32(flags, TB_FLAGS, VSTART_EQ_ZERO, env->vstart == 0);
+    } else {
+        flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
+    }
+
+#ifdef CONFIG_USER_ONLY
+    fs = EXT_STATUS_DIRTY;
+    vs = EXT_STATUS_DIRTY;
+#else
+    flags = FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
+
+    flags |= cpu_mmu_index(env, 0);
+    fs = get_field(env->mstatus, MSTATUS_FS);
+    vs = get_field(env->mstatus, MSTATUS_VS);
+
+    if (env->virt_enabled) {
+        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
+        /*
+         * Merge DISABLED and !DIRTY states using MIN.
+         * We will set both fields when dirtying.
+         */
+        fs = MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
+        vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
+    }
+
+    /* With Zfinx, floating point is enabled/disabled by Smstateen. */
+    if (!riscv_has_ext(env, RVF)) {
+        fs = (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) == RISCV_EXCP_NONE)
+             ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
+    }
+
+    if (cpu->cfg.debug && !icount_enabled()) {
+        flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
+    }
+#endif
+
+    flags = FIELD_DP32(flags, TB_FLAGS, FS, fs);
+    flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
+    flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
+    flags = FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
+    if (env->cur_pmmask != 0) {
+        flags = FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
+    }
+    if (env->cur_pmbase != 0) {
+        flags = FIELD_DP32(flags, TB_FLAGS, PM_BASE_ENABLED, 1);
+    }
+
+    *pflags = flags;
+}
diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
index 65670493b1..a615aafd9a 100644
--- a/target/riscv/tcg/meson.build
+++ b/target/riscv/tcg/meson.build
@@ -8,6 +8,7 @@ gen = [
 riscv_ss.add(when: 'CONFIG_TCG', if_true: gen)
 
 riscv_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'cpu.c',
   'fpu_helper.c',
   'op_helper.c',
   'vector_helper.c',
-- 
2.38.1


