Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB77EB8FAD
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 09:23:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qdogo-0006u8-Uz; Wed, 06 Sep 2023 05:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdoft-0004Qi-3V
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 05:18:15 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdofY-0005qk-5q
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 05:18:08 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1c504386370so2644919fac.1
 for <qemu-riscv@nongnu.org>; Wed, 06 Sep 2023 02:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693991871; x=1694596671; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pI0z5n6k8JFj82RwRV6OxDxoS9H9TghdD+8PMG0vQAU=;
 b=L0V+udIgMx16g7DOJGPMtYGuoJuUQM+t9K5Xdfg4Va3sr8kI0NeKLsnReql5dc6Poq
 Tst0939wzfP8iq7QO3UQKnshoGOFOmhEufAbuziptuAsIZ/+fb/te3y7R0O3vZvq2s/D
 vy0Uxi52kemTSLc2Y9yVaPhqpJURbXjQhrdMPbgH3Qe28dtzOR3SZMX0ZkYSGyITvzac
 wIkS8UWccKWdDi9HV4Cp1woKWcz10hs+BsECxUruRkrnJcBVzWSxUhDqdw60r6LRJ68Z
 LlshyAdkePXj+25/lE+YtXmegB865UJjQJlAPl9JSkGAodcgM1LUwDhxeaEkvCwkDoqq
 mLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693991871; x=1694596671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pI0z5n6k8JFj82RwRV6OxDxoS9H9TghdD+8PMG0vQAU=;
 b=NzpKvJJ2Yy8qIxACSEHtPVKenhHYzLMD+s6pWvyyF7ARdl8le/VL/ES12IO8+HlCYp
 VhUd7dM3kLHwQO/uTLmcwIm6qkas7yGjOG3q3QaTslyGQ0j4HWpwuJSDMVLHDeP5KZLy
 6596jFluQ5ij72mBm5XqP7r7Z6wo+05jUdUXIrfxz1N3+rVXfwFmfVqd2BbCfTMldzwF
 4Klt8xn5e70Wx+jpirzBfrxL8tpLKGyVw07wptInIzyW1JEmhjVVblG4OuC26y78bRgh
 hmp5ah/T5Sbm8mKFbFLwIJaK43sIidaQI0KX+rfStad1W9sY8SbgZNEDoEBaC7+WCDd3
 +1bw==
X-Gm-Message-State: AOJu0Ywc/0CoqgW9ZntwqPdx3SBTNDkCuOqLE3QCSGDnZ6GMam7KwP32
 6b7QyuwYYb8a45Yk1oghDepSuQ==
X-Google-Smtp-Source: AGHT+IGABposOUxTcoNCwde/XVmcFHZovcyWEmjj0xMfjxDoAkQlwSXBpIOFRAd76Zt2tWWR534F/Q==
X-Received: by 2002:a05:6870:d05:b0:1d5:15cc:cb67 with SMTP id
 mk5-20020a0568700d0500b001d515cccb67mr3248362oab.49.1693991870951; 
 Wed, 06 Sep 2023 02:17:50 -0700 (PDT)
Received: from grind.. ([177.94.15.194]) by smtp.gmail.com with ESMTPSA id
 n21-20020a9d6f15000000b006b75242d6c3sm6229228otq.38.2023.09.06.02.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 02:17:50 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 17/19] target/riscv/tcg: move
 riscv_cpu_add_misa_properties() to tcg-cpu.c
Date: Wed,  6 Sep 2023 06:16:44 -0300
Message-ID: <20230906091647.1667171-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

All code related to MISA TCG properties is also moved.

At this point, all TCG properties handling is done in tcg-cpu.c, all KVM
properties handling is done in kvm-cpu.c.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c         | 90 --------------------------------------
 target/riscv/cpu.h         |  1 -
 target/riscv/tcg/tcg-cpu.c | 90 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+), 91 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4875feded7..46263e55d5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1211,47 +1211,6 @@ static void riscv_cpu_init(Object *obj)
 #endif /* CONFIG_USER_ONLY */
 }
 
-typedef struct RISCVCPUMisaExtConfig {
-    target_ulong misa_bit;
-    bool enabled;
-} RISCVCPUMisaExtConfig;
-
-static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
-                                 void *opaque, Error **errp)
-{
-    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
-    target_ulong misa_bit = misa_ext_cfg->misa_bit;
-    RISCVCPU *cpu = RISCV_CPU(obj);
-    CPURISCVState *env = &cpu->env;
-    bool value;
-
-    if (!visit_type_bool(v, name, &value, errp)) {
-        return;
-    }
-
-    if (value) {
-        env->misa_ext |= misa_bit;
-        env->misa_ext_mask |= misa_bit;
-    } else {
-        env->misa_ext &= ~misa_bit;
-        env->misa_ext_mask &= ~misa_bit;
-    }
-}
-
-static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
-                                 void *opaque, Error **errp)
-{
-    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
-    target_ulong misa_bit = misa_ext_cfg->misa_bit;
-    RISCVCPU *cpu = RISCV_CPU(obj);
-    CPURISCVState *env = &cpu->env;
-    bool value;
-
-    value = env->misa_ext & misa_bit;
-
-    visit_type_bool(v, name, &value, errp);
-}
-
 typedef struct misa_ext_info {
     const char *name;
     const char *description;
@@ -1312,55 +1271,6 @@ const char *riscv_get_misa_ext_description(uint32_t bit)
     return val;
 }
 
-#define MISA_CFG(_bit, _enabled) \
-    {.misa_bit = _bit, .enabled = _enabled}
-
-static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
-    MISA_CFG(RVA, true),
-    MISA_CFG(RVC, true),
-    MISA_CFG(RVD, true),
-    MISA_CFG(RVF, true),
-    MISA_CFG(RVI, true),
-    MISA_CFG(RVE, false),
-    MISA_CFG(RVM, true),
-    MISA_CFG(RVS, true),
-    MISA_CFG(RVU, true),
-    MISA_CFG(RVH, true),
-    MISA_CFG(RVJ, false),
-    MISA_CFG(RVV, false),
-    MISA_CFG(RVG, false),
-};
-
-/*
- * We do not support user choice tracking for MISA
- * extensions yet because, so far, we do not silently
- * change MISA bits during realize() (RVG enables MISA
- * bits but the user is warned about it).
- */
-void riscv_cpu_add_misa_properties(Object *cpu_obj)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
-        const RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
-        int bit = misa_cfg->misa_bit;
-        const char *name = riscv_get_misa_ext_name(bit);
-        const char *desc = riscv_get_misa_ext_description(bit);
-
-        /* Check if KVM already created the property */
-        if (object_property_find(cpu_obj, name)) {
-            continue;
-        }
-
-        object_property_add(cpu_obj, name, "bool",
-                            cpu_get_misa_ext_cfg,
-                            cpu_set_misa_ext_cfg,
-                            NULL, (void *)misa_cfg);
-        object_property_set_description(cpu_obj, name, desc);
-        object_property_set_bool(cpu_obj, name, misa_cfg->enabled, NULL);
-    }
-}
-
 #define MULTI_EXT_CFG_BOOL(_name, _prop, _defval) \
     {.name = _name, .offset = CPU_CFG_OFFSET(_prop), \
      .enabled = _defval}
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a7415338d9..c5be917d80 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -726,7 +726,6 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
 extern Property riscv_cpu_options[];
 
-void riscv_cpu_add_misa_properties(Object *cpu_obj);
 void riscv_add_satp_mode_properties(Object *obj);
 
 /* CSR function table */
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index c9804b53f8..c23bc0c2e1 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -578,6 +578,96 @@ static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
     return true;
 }
 
+typedef struct RISCVCPUMisaExtConfig {
+    target_ulong misa_bit;
+    bool enabled;
+} RISCVCPUMisaExtConfig;
+
+static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
+    target_ulong misa_bit = misa_ext_cfg->misa_bit;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
+    bool value;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value) {
+        env->misa_ext |= misa_bit;
+        env->misa_ext_mask |= misa_bit;
+    } else {
+        env->misa_ext &= ~misa_bit;
+        env->misa_ext_mask &= ~misa_bit;
+    }
+}
+
+static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
+    target_ulong misa_bit = misa_ext_cfg->misa_bit;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
+    bool value;
+
+    value = env->misa_ext & misa_bit;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+#define MISA_CFG(_bit, _enabled) \
+    {.misa_bit = _bit, .enabled = _enabled}
+
+static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
+    MISA_CFG(RVA, true),
+    MISA_CFG(RVC, true),
+    MISA_CFG(RVD, true),
+    MISA_CFG(RVF, true),
+    MISA_CFG(RVI, true),
+    MISA_CFG(RVE, false),
+    MISA_CFG(RVM, true),
+    MISA_CFG(RVS, true),
+    MISA_CFG(RVU, true),
+    MISA_CFG(RVH, true),
+    MISA_CFG(RVJ, false),
+    MISA_CFG(RVV, false),
+    MISA_CFG(RVG, false),
+};
+
+/*
+ * We do not support user choice tracking for MISA
+ * extensions yet because, so far, we do not silently
+ * change MISA bits during realize() (RVG enables MISA
+ * bits but the user is warned about it).
+ */
+static void riscv_cpu_add_misa_properties(Object *cpu_obj)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
+        const RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
+        int bit = misa_cfg->misa_bit;
+        const char *name = riscv_get_misa_ext_name(bit);
+        const char *desc = riscv_get_misa_ext_description(bit);
+
+        /* Check if KVM already created the property */
+        if (object_property_find(cpu_obj, name)) {
+            continue;
+        }
+
+        object_property_add(cpu_obj, name, "bool",
+                            cpu_get_misa_ext_cfg,
+                            cpu_set_misa_ext_cfg,
+                            NULL, (void *)misa_cfg);
+        object_property_set_description(cpu_obj, name, desc);
+        object_property_set_bool(cpu_obj, name, misa_cfg->enabled, NULL);
+    }
+}
+
 static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
-- 
2.41.0


