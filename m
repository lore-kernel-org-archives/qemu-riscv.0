Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23144C001B3
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 18:35:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGOLs-0007sh-UE; Mon, 03 Jul 2023 14:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOLr-0007s1-RR
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:43 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOLp-0000KR-Rb
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:43 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fbc244d39dso61081235e9.3
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 11:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688409160; x=1691001160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HaANU2OE+dOsUg4Qmvd15nGlRm3AOspQfp2v6+k0l68=;
 b=dBhqYCuSIEzANCxUAXby9VlxIR34zpNZ8YeMQorO4zF0KBBs1HfJOrAJvxcOjfT/Pw
 O2I8wq7ETsewUBimRDYGCRNrcjNChzFO+55y5HsykqOCmbchimowB0hbVw0mDB17UITh
 nfHY3nXQGzjWC7mNL7ggw52QTzK1VHxhAkWP65EBSp3HcZugl+ylTpW3cikJxJXjEeAf
 Zc5MOrxdgESwox5ntYodT32TU5B9x8KUmj7jp5SGHLIw+QP/CWbMaDBBmiFim2U3jKzh
 vMBkWHLLuwh/JmHz9lH264kXTzro4/g2eOwdyx+v0rmmUYszHUZrGesA9sVipiWatMhY
 e7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688409160; x=1691001160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HaANU2OE+dOsUg4Qmvd15nGlRm3AOspQfp2v6+k0l68=;
 b=XzuTqRnIwf0jPOl+cWAZjZfIcQ10w528e53sa+/uK21y857djNoKVCnriTDTjU5qnB
 7bxZJnNb2819afAkBl/ZHbYUNk9FvSoI3u5nGg4f4n1d+sH536LzcBNntmslEfcmW42g
 48RyyJgR9QKUGOi7q22T1Jks+4l0qJea+6HrGqEKkC5fnfw3fJEIG74rGKE81OqWV9u1
 4Q4deI++GeKnlT+CbjnC11XLqTU3+tytFsWZxzAcCcxBr5AUIE+QGSAy3cKUwpY05YS2
 6cHk9pJ3h8sl0ZAmhv4wlWE2xglNcKZkrWCwarnRBSVu+CCMVWwTEp8uvK+FXvDrS2Rs
 Swcg==
X-Gm-Message-State: AC+VfDwLioWbc+Dhwnn9+m/QcrMt8KDpRYUO6ROKSHlTzaOeHg69DvCs
 AO5zkcvdAIkZ6KnTIbwbZLuZAA==
X-Google-Smtp-Source: ACHHUZ461NN5mRHTbffGl+xf2Uo0+6rvuiaU6Ezwkrcd60e6xF8WSn7HX4bWp04sDxtrhLUWfvRy7Q==
X-Received: by 2002:a1c:7405:0:b0:3fa:935e:e185 with SMTP id
 p5-20020a1c7405000000b003fa935ee185mr14601140wmc.22.1688409160319; 
 Mon, 03 Jul 2023 11:32:40 -0700 (PDT)
Received: from localhost.localdomain ([176.176.178.91])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a1c7c05000000b003fbcf032c55sm7858298wmc.7.2023.07.03.11.32.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Jul 2023 11:32:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 08/16] target/riscv: Move TCG-specific
 cpu_get_tb_cpu_state() to tcg/cpu.c
Date: Mon,  3 Jul 2023 20:31:37 +0200
Message-Id: <20230703183145.24779-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230703183145.24779-1-philmd@linaro.org>
References: <20230703183145.24779-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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


