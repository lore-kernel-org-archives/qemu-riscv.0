Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9330DCE7AB1
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 18:00:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkpqW-0001xf-Uq; Mon, 25 Sep 2023 13:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkpqV-0001qk-G6
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:58:11 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkpqT-0002Hs-3R
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:58:10 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-578a6bb11ecso4494951a12.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 10:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695664687; x=1696269487; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kho0Cg0LudHauk4flCAc4GR46StMyKT+p69RKBrUZjA=;
 b=TuAc9lUw78I8Umh+U+WAPyfh4tTOargMRagftdz3XlqF5QUMZd5SyEA76CLd5E8TSy
 FAKUJolBG5ui3vX83+O6ztZcfnZFIoNMYoz2SJCsGmxIhYxUlp0Kw3ikgRpw9ZKaptJl
 nyrmS1+kSht0ppEpsi0Mz1tdnUOJuK8WF1eJ224Ca7x+WBB8sCiiLtXzJymr/ro8P+Dr
 8J4TNm7SGi9Lx8ONkIJbHJed2Zw89NLo8SNaTYpKVJLIekAwOYBmZd8dXzeBCTWug698
 m8XntON379DDfa3di1bXtZgF91GWoBl29CKrQcU11PLTwR8e0/krwTOR047+kHXZ+X84
 WBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695664687; x=1696269487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kho0Cg0LudHauk4flCAc4GR46StMyKT+p69RKBrUZjA=;
 b=vYBGv3cCd7UPuolcGkQsv+gwEVDFiKnxLZIIWsMhPh4AGjnWE70keetE4G/+AsUWFg
 A8EgyBr2x2OfXRbycNQ2x9zwrxWL1sDYA+t8ZKnkFOp7+IG3VOvoAqQohlQ1z4UtHBER
 QPXbBkwRp4LsMiwGYwkg05dojucLLjKfAqEEEKT/v6k6NS0oS/OV7QplnoaIzRrkERMS
 uygiXwYHY3fu0lDMTtYLz3nGmpaB5jHLGjPNaz+psIzWLYOg7VuS6RLOxb/Lipw+dIA7
 f9bRab0bL7oJHar4a+DrhL+Zz2mswP5id9fwr6Hu1Q9GfVDoMVybj/Oyy042rCNB8C3k
 fxJQ==
X-Gm-Message-State: AOJu0YyZj5YxGNPwGVvBR02wrVGre/uNiRuVKvftH6WSon7Xc8kb4vMG
 klKky0/MC3lfYt8rDr+Ybhualw==
X-Google-Smtp-Source: AGHT+IEzTxiECIFJJgUUVcif2Pdv9fbcVAo+g9k+6dapo42/BMn8UjabhBrAkCr2/Clnk89+aPp4BA==
X-Received: by 2002:a17:90a:728e:b0:274:6503:26d with SMTP id
 e14-20020a17090a728e00b002746503026dmr4901847pjg.33.1695664687605; 
 Mon, 25 Sep 2023 10:58:07 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 i3-20020a17090a65c300b00262ca945cecsm3312722pjs.54.2023.09.25.10.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 10:58:07 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 17/19] target/riscv/tcg: move
 riscv_cpu_add_misa_properties() to tcg-cpu.c
Date: Mon, 25 Sep 2023 14:57:07 -0300
Message-ID: <20230925175709.35696-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925175709.35696-1-dbarboza@ventanamicro.com>
References: <20230925175709.35696-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x532.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
index ac3cf4c035..8065572703 100644
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


