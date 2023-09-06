Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C920AEB8FA5
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 09:19:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qdoeu-0002qs-Iq; Wed, 06 Sep 2023 05:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdoen-0002jK-CC
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 05:17:06 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdoek-0005cD-F3
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 05:17:04 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6bcac140aaaso2690219a34.2
 for <qemu-riscv@nongnu.org>; Wed, 06 Sep 2023 02:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693991821; x=1694596621; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gdwtg7k7ecWU2m8jdUTwhHMZ9nILSouycHYrm1CtkOY=;
 b=KezWpziCBtU+Vzr5QiT1QobJgh0tPtKKiKaBJdMEXYvWQkOJuY7bS9pioB7QyX7gWH
 MsH0Hm3Kgf0IxzbPGQnwUgQ4VXzxDtWg7VLBOoH51y3SLlCptOOslzMEZrKtSkkYis8k
 TzI6D6Tc80Oyo43RL0VdEoii5+LKWEtzSB32uBEtgQRbmZBMcHD4zjNqk/5zEPNzVt9F
 wl53P2+D51qsSRyOtrOfVmpVuxARJwLwHj21RUK/i9s22/tkWFKrqJzTRwjIO0bUR5vf
 J8TQ049IBZ/7hBRVf+IEpfVYA/LJQSdMTB6qSQ98dVYI0hEShNBvXhkogXUKapDerboB
 1sVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693991821; x=1694596621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gdwtg7k7ecWU2m8jdUTwhHMZ9nILSouycHYrm1CtkOY=;
 b=iXTIdW938J4qbcLfIW8xfSskKl3VEGr15pWVKYg5+oT/qipDE2aCJNu87SZMXmCqmB
 c0KdohgnqV+LlXvMErGJehq1JNzh5cWnJHEzYhUkLaDRVD7DUf+4FznJrvbt405AVliO
 8ynLNYdRKX/F+6+PP4Fl1r3Wq+r0dtkrN365wKI5xBEm6Yc3fI9w9NsquCFt+8BJ94/t
 UPBExcuN0ZreypUm7pRK3WivggmrZLxkaoBuDlweEM9ezG2uHEvKfiV8tCUDfhwrIbDK
 GS6/2L0d3nen1aOB34CloAdR1meVPLV431EoFe197vx+IV76UccalRAqorUxbATiQ19v
 z/Xw==
X-Gm-Message-State: AOJu0Yyrun68MvAh850pQA6z1KU3Mf1KQAcQzUQElOCQ8OTGXhv85r8r
 hMivaDESf1kw/dKQu2BMhb1/IIl/9Q+jKgagvLk=
X-Google-Smtp-Source: AGHT+IHqImpK4V4DyJlOmjfP/WW4FXwtC1Rg0Bu9NdyBjtVS1EVOkskTluAams8ty+8qyKooV0u50g==
X-Received: by 2002:a9d:7f85:0:b0:6aa:ecb5:f186 with SMTP id
 t5-20020a9d7f85000000b006aaecb5f186mr18429811otp.7.1693991821423; 
 Wed, 06 Sep 2023 02:17:01 -0700 (PDT)
Received: from grind.. ([177.94.15.194]) by smtp.gmail.com with ESMTPSA id
 n21-20020a9d6f15000000b006b75242d6c3sm6229228otq.38.2023.09.06.02.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 02:17:01 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 02/19] target/riscv: move riscv_cpu_realize_tcg() to
 TCG::cpu_realizefn()
Date: Wed,  6 Sep 2023 06:16:29 -0300
Message-ID: <20230906091647.1667171-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x336.google.com
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

riscv_cpu_realize_tcg() was added to allow TCG cpus to have a different
realize() path during the common riscv_cpu_realize(), making it a good
choice to start moving TCG exclusive code to tcg-cpu.c.

Rename it to tcg_cpu_realizefn() and assign it as a implementation of
accel::cpu_realizefn(). tcg_cpu_realizefn() will then be called during
riscv_cpu_realize() via cpu_exec_realizefn(). We'll use a similar
approach with KVM in the near future.

riscv_cpu_validate_set_extensions() is too big and with too many
dependencies to be moved in this same patch. We'll do that next.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c         | 128 -----------------------------------
 target/riscv/tcg/tcg-cpu.c | 132 +++++++++++++++++++++++++++++++++++++
 2 files changed, 132 insertions(+), 128 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2c6972fa0d..59785f5d9a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -23,9 +23,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "cpu_vendorid.h"
-#include "pmu.h"
 #include "internals.h"
-#include "time_helper.h"
 #include "exec/exec-all.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
@@ -1064,29 +1062,6 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
     }
 }
 
-static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
-{
-    CPURISCVState *env = &cpu->env;
-    int priv_version = -1;
-
-    if (cpu->cfg.priv_spec) {
-        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
-            priv_version = PRIV_VERSION_1_12_0;
-        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
-            priv_version = PRIV_VERSION_1_11_0;
-        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
-            priv_version = PRIV_VERSION_1_10_0;
-        } else {
-            error_setg(errp,
-                       "Unsupported privilege spec version '%s'",
-                       cpu->cfg.priv_spec);
-            return;
-        }
-
-        env->priv_ver = priv_version;
-    }
-}
-
 static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
 {
     CPURISCVState *env = &cpu->env;
@@ -1111,33 +1086,6 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     }
 }
 
-static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
-{
-    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
-    CPUClass *cc = CPU_CLASS(mcc);
-    CPURISCVState *env = &cpu->env;
-
-    /* Validate that MISA_MXL is set properly. */
-    switch (env->misa_mxl_max) {
-#ifdef TARGET_RISCV64
-    case MXL_RV64:
-    case MXL_RV128:
-        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
-        break;
-#endif
-    case MXL_RV32:
-        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    if (env->misa_mxl_max != env->misa_mxl) {
-        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
-        return;
-    }
-}
-
 /*
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly.
@@ -1511,74 +1459,6 @@ static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
 #endif
 }
 
-static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
-{
-    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) {
-        error_setg(errp, "H extension requires priv spec 1.12.0");
-        return;
-    }
-}
-
-static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
-{
-    RISCVCPU *cpu = RISCV_CPU(dev);
-    CPURISCVState *env = &cpu->env;
-    Error *local_err = NULL;
-
-    if (object_dynamic_cast(OBJECT(dev), TYPE_RISCV_CPU_HOST)) {
-        error_setg(errp, "'host' CPU is not compatible with TCG acceleration");
-        return;
-    }
-
-    riscv_cpu_validate_misa_mxl(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    riscv_cpu_validate_priv_spec(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    riscv_cpu_validate_misa_priv(env, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
-        /*
-         * Enhanced PMP should only be available
-         * on harts with PMP support
-         */
-        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
-        return;
-    }
-
-    riscv_cpu_validate_set_extensions(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    CPU(dev)->tcg_cflags |= CF_PCREL;
-
-    if (cpu->cfg.ext_sstc) {
-        riscv_timer_init(cpu);
-    }
-
-    if (cpu->cfg.pmu_num) {
-        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
-            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                          riscv_pmu_timer_cb, cpu);
-        }
-     }
-#endif
-}
-
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -1597,14 +1477,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (tcg_enabled()) {
-        riscv_cpu_realize_tcg(dev, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
-            return;
-        }
-    }
-
     riscv_cpu_finalize_features(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 0326cead0d..84ad6f1daf 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -19,9 +19,140 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "pmu.h"
+#include "time_helper.h"
+#include "qapi/error.h"
 #include "qemu/accel.h"
 #include "hw/core/accel-cpu.h"
 
+
+static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
+{
+    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) {
+        error_setg(errp, "H extension requires priv spec 1.12.0");
+        return;
+    }
+}
+
+static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
+{
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
+    CPUClass *cc = CPU_CLASS(mcc);
+    CPURISCVState *env = &cpu->env;
+
+    /* Validate that MISA_MXL is set properly. */
+    switch (env->misa_mxl_max) {
+#ifdef TARGET_RISCV64
+    case MXL_RV64:
+    case MXL_RV128:
+        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
+        break;
+#endif
+    case MXL_RV32:
+        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (env->misa_mxl_max != env->misa_mxl) {
+        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
+        return;
+    }
+}
+
+static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
+{
+    CPURISCVState *env = &cpu->env;
+    int priv_version = -1;
+
+    if (cpu->cfg.priv_spec) {
+        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
+            priv_version = PRIV_VERSION_1_12_0;
+        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
+            priv_version = PRIV_VERSION_1_11_0;
+        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
+            priv_version = PRIV_VERSION_1_10_0;
+        } else {
+            error_setg(errp,
+                       "Unsupported privilege spec version '%s'",
+                       cpu->cfg.priv_spec);
+            return;
+        }
+
+        env->priv_ver = priv_version;
+    }
+}
+
+/*
+ * We'll get here via the following path:
+ *
+ * riscv_cpu_realize()
+ *   -> cpu_exec_realizefn()
+ *      -> tcg_cpu_realizefn() (via accel_cpu_realizefn())
+ */
+static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
+
+    if (object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
+        error_setg(errp, "'host' CPU is not compatible with TCG acceleration");
+        return false;
+    }
+
+    riscv_cpu_validate_misa_mxl(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return false;
+    }
+
+    riscv_cpu_validate_priv_spec(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return false;
+    }
+
+    riscv_cpu_validate_misa_priv(env, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return false;
+    }
+
+    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
+        /*
+         * Enhanced PMP should only be available
+         * on harts with PMP support
+         */
+        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
+        return false;
+    }
+
+    riscv_cpu_validate_set_extensions(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return false;
+    }
+
+#ifndef CONFIG_USER_ONLY
+    CPU(cs)->tcg_cflags |= CF_PCREL;
+
+    if (cpu->cfg.ext_sstc) {
+        riscv_timer_init(cpu);
+    }
+
+    if (cpu->cfg.pmu_num) {
+        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
+            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                          riscv_pmu_timer_cb, cpu);
+        }
+     }
+#endif
+
+    return true;
+}
+
 static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
 {
     /*
@@ -41,6 +172,7 @@ static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
     acc->cpu_class_init = tcg_cpu_class_init;
+    acc->cpu_realizefn = tcg_cpu_realizefn;
 }
 
 static const TypeInfo tcg_cpu_accel_type_info = {
-- 
2.41.0


