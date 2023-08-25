Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B958C3DA66
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 13:11:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZWZW-0001xe-1J; Fri, 25 Aug 2023 09:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWZV-0001wn-JN
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:53 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWZS-000746-Oa
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:53 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1c11d53221cso573842fac.2
 for <qemu-riscv@nongnu.org>; Fri, 25 Aug 2023 06:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692968989; x=1693573789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ePqgb9Uq7hDW1YvBFezqPBSn7nsZu+lYbGdT6nIU0xI=;
 b=f3cEfFR0Tq1PNvy+JNjyu7bnCZSLfdgTCVoA7+8x3Gxs0jcA0fPuBRpyf1+NK6wveU
 oPBb1PpWFCgER07HeNN3lTWY0C98bz7d+i5HlK0VOUIjYSFAfJvc59J/dCyHrmi/82Bi
 NkxXhSJTUZFdKAIFbs80bsQamV2dj5CchYEpaKU28++sN1836n0cqRbaucxFAxxfsD8d
 RVFp+TPMG0kUUDjCQ4045IR3zGxI8IiwYFpG8Dp1/wQ7A51+yejllVGDa562NifUNoZO
 10MoPnJ6HvHcb6A384ULmT/obKD3zUrDaRNb4DiWtCTySAWH67BHR3CwgPjHT3xFmwJ1
 a/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692968989; x=1693573789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ePqgb9Uq7hDW1YvBFezqPBSn7nsZu+lYbGdT6nIU0xI=;
 b=RqSsQl2bSYc3T9T1UyKbdCyAKUD1ZNVHViGk3LHyKaql1GFwBCBsom6rUaVTnGlJLV
 WPPluFffdvKU59J0+sHNAZFMUF5hIV2cGC90mFmqLpt5tn2eWaFVx4n3ts84IXzJQM5n
 1Si9l9TrqtGBcASl3yamUkdWpeqBc4J6FAVB/KUrY4GKMWDpkPtanwov+lc0lCKJTrv/
 Prr7el7DCa2G4+e1JEsS3ghUcOWLy9MCe9nPshAlA4TOLUEelMS4s9u/6SVMr6DFHizM
 i/s7lsqTZG5el/h0Bwjkrz53oDDyymtEnUOrPt091XlQUkkAAdkDF69lgXBOxZTGmR8o
 llxw==
X-Gm-Message-State: AOJu0YyJsO0+YFjYeCKd1MXEIKk5IsuK9dogtSDRy37ngTM0SjGFMmzu
 +JJSolYYluBDhZgIp/dZdNMYjA==
X-Google-Smtp-Source: AGHT+IH/sRXY1sQ1hNC5ujw+SDhzfFgB7rVH2lq/P/6DiNzrdcFuZHTJXf/c3IBX+GnMuEmVicGjpg==
X-Received: by 2002:a05:6870:9722:b0:1bb:ba55:3fdd with SMTP id
 n34-20020a056870972200b001bbba553fddmr3566529oaq.7.1692968989679; 
 Fri, 25 Aug 2023 06:09:49 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 ds23-20020a0568705b1700b001c50fb56845sm966189oab.16.2023.08.25.06.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 06:09:49 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 16/20] target/riscv/tcg: move riscv_cpu_add_misa_properties()
 to tcg-cpu.c
Date: Fri, 25 Aug 2023 10:08:49 -0300
Message-ID: <20230825130853.511782-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825130853.511782-1-dbarboza@ventanamicro.com>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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

All code related to MISA TCG properties is also moved.

At this point, all TCG properties handling is done in tcg-cpu.c, all KVM
properties handling is done in kvm-cpu.c.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 89 --------------------------------------
 target/riscv/cpu.h         |  1 -
 target/riscv/tcg/tcg-cpu.c | 84 +++++++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+), 90 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 89b09a7e89..3c9db46837 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1201,49 +1201,6 @@ static void riscv_cpu_init(Object *obj)
 #endif /* CONFIG_USER_ONLY */
 }
 
-typedef struct RISCVCPUMisaExtConfig {
-    const char *name;
-    const char *description;
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
@@ -1304,52 +1261,6 @@ const char *riscv_get_misa_ext_description(uint32_t bit)
     return val;
 }
 
-#define MISA_CFG(_bit, _enabled) \
-    {.misa_bit = _bit, .enabled = _enabled}
-
-static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
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
-void riscv_cpu_add_misa_properties(Object *cpu_obj)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
-        RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
-        int bit = misa_cfg->misa_bit;
-
-        misa_cfg->name = riscv_get_misa_ext_name(bit);
-        misa_cfg->description = riscv_get_misa_ext_description(bit);
-
-        /* Check if KVM already created the property */
-        if (object_property_find(cpu_obj, misa_cfg->name)) {
-            continue;
-        }
-
-        object_property_add(cpu_obj, misa_cfg->name, "bool",
-                            cpu_get_misa_ext_cfg,
-                            cpu_set_misa_ext_cfg,
-                            NULL, (void *)misa_cfg);
-        object_property_set_description(cpu_obj, misa_cfg->name,
-                                        misa_cfg->description);
-        object_property_set_bool(cpu_obj, misa_cfg->name,
-                                 misa_cfg->enabled, NULL);
-    }
-}
-
 #define MULTI_EXT_CFG_BOOL(_name, _prop, _defval) \
     {.name = _name, .offset = CPU_CFG_OFFSET(_prop), \
      .enabled = _defval}
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 74fbb33e09..4269523e24 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -726,7 +726,6 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
 extern Property riscv_cpu_options[];
 
-void riscv_cpu_add_misa_properties(Object *cpu_obj);
 void riscv_add_satp_mode_properties(Object *obj);
 
 /* CSR function table */
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 68ce3cbcb9..8e3f55d3a6 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -574,6 +574,90 @@ static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
     return true;
 }
 
+typedef struct RISCVCPUMisaExtConfig {
+    const char *name;
+    const char *description;
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
+static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
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
+static void riscv_cpu_add_misa_properties(Object *cpu_obj)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
+        RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
+        int bit = misa_cfg->misa_bit;
+
+        misa_cfg->name = riscv_get_misa_ext_name(bit);
+        misa_cfg->description = riscv_get_misa_ext_description(bit);
+
+        object_property_add(cpu_obj, misa_cfg->name, "bool",
+                            cpu_get_misa_ext_cfg,
+                            cpu_set_misa_ext_cfg,
+                            NULL, (void *)misa_cfg);
+        object_property_set_description(cpu_obj, misa_cfg->name,
+                                        misa_cfg->description);
+        object_property_set_bool(cpu_obj, misa_cfg->name,
+                                 misa_cfg->enabled, NULL);
+    }
+}
+
 static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
-- 
2.41.0


