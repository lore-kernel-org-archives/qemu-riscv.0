Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8C0CE79CD
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 11:23:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qivGp-0006jl-UJ; Wed, 20 Sep 2023 07:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qivGn-0006dx-Ut
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 07:21:25 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qivGm-0002HD-1V
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 07:21:25 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6c09f1f4610so3883967a34.0
 for <qemu-riscv@nongnu.org>; Wed, 20 Sep 2023 04:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695208883; x=1695813683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qwxpmKgNT9HC7Ykdf7MYYoEt86HIsFBzpyqPrCOE5ak=;
 b=H07o3yfarDFHPmrtB9JOc5yQrlqlwIA76bXNnuQY66zZes4g+RMbM6SHA2YmzQRvib
 ndnmPB6XZsvCn0SVP/qrms0vP+8890V7vVYJSWuKteeUUfM+4Obc/zCOTqw1LrGDgsOQ
 3MxG8F3AVWAyhmhob7QD581gLuD0FpQIjUbGH+Zw3T+9Lz79qWoMSGo87VLlzc+W9JJv
 Zhx1zLdflkRGg4HqE9APfuTRkT5OzPuHDhjyNQEKxC2AVi5jA0usQ594YrLcC5VDVai0
 AEEiy7EbAmWPElntvM8BWqHoSu3jSVprUrqRkmoqKzQG0o/VUjeEhFF121MWMohrnfvu
 VFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695208883; x=1695813683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qwxpmKgNT9HC7Ykdf7MYYoEt86HIsFBzpyqPrCOE5ak=;
 b=w2hhDNptvzte0+QpJxnl5U53NkltTQGAno3B2GMXOECk8sbIz+h4DZY3ZkBUcr/BTq
 ja3BhxFsJurkheb5MwL+B9uzWYnh/QSD5JWNXd8N64FjXGuD2coZXA7X0kJ/qGXINrHm
 iItp0vp7yXH7h724x5yXUW/GOEdP5wx3DoHsATeWfETc5x/Y5YWAh/mcfnNPwz5K6eX0
 ZNrntRIW4a3mfCi8iRo8uGW3EXQUxBdbPMv0ppa1Z3Vfdod7sbh0HTsijX9nZa156ao4
 m+wbBfTfFmE4MABXwmz8/shsCO+IfFUwCeZX/ppyoa6ccJKYrZRnQzIPHCotGUuQT1iT
 zVwQ==
X-Gm-Message-State: AOJu0YxgJq0xideo1BB4n0+f3gs8iZB5aBgSEF4DzK125nFLpF7uz1ze
 OohbdIvPCwklDDlbbhqrFwlXTw==
X-Google-Smtp-Source: AGHT+IF5RlVWsCtCl7qElTKH3VsXRsz41x+O+fR2iAf2errMhvsqvMkpwHZ+tWoNXb/REObbt5RJ0Q==
X-Received: by 2002:a05:6830:1d5c:b0:6b8:9932:b8ad with SMTP id
 p28-20020a0568301d5c00b006b89932b8admr2128099oth.1.1695208882767; 
 Wed, 20 Sep 2023 04:21:22 -0700 (PDT)
Received: from grind.. ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a9d7c84000000b006b45be2fdc2sm5863955otn.65.2023.09.20.04.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 04:21:22 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 philmd@linaro.org, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 17/19] target/riscv/tcg: move
 riscv_cpu_add_misa_properties() to tcg-cpu.c
Date: Wed, 20 Sep 2023 08:20:18 -0300
Message-ID: <20230920112020.651006-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920112020.651006-1-dbarboza@ventanamicro.com>
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
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
index 01cbcbe119..aba8192c74 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -726,7 +726,6 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
 extern Property riscv_cpu_options[];
 
-void riscv_cpu_add_misa_properties(Object *cpu_obj);
 void riscv_add_satp_mode_properties(Object *obj);
 
 /* CSR function table */
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 5d71ff2cce..c326ab37a2 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -580,6 +580,96 @@ static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
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


