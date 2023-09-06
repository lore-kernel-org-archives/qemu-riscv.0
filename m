Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127B1EB8FAD
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 09:19:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qdogS-0005Ei-Ee; Wed, 06 Sep 2023 05:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdofh-0004CF-IP
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 05:18:02 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdofR-0005qJ-A7
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 05:17:59 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6beff322a97so2576206a34.3
 for <qemu-riscv@nongnu.org>; Wed, 06 Sep 2023 02:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693991864; x=1694596664; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1QR2Xs+JmPgDNS/3fYGhVtvnBOuhauFZUc4QxGGtjOc=;
 b=g/xVTTLwL1zu0wqHx3r7RKqt4UdIswCCwN3Islf5r9g7DFLVLPq0jZwEdojiD+7xc3
 dcjUHtHljFt/zmow2z317OnWAQG+MhFAJCBYahcR57T6w5bWujT7oRyN3wLQ0Yaj13iY
 46/9VmEBySUTaWViSniCZdP/NWoHjZ+vkQCVSTEDgJWEoccbYNqePqHMNmYzguGp3Ycn
 BWSc55UpKbn9Wbmvm4SJuwVMMph8rhlBdm9xH0nfSmW2Nd0CKLNywAWJfOrEX+f20yi8
 X0UHu9/FEYrx+6X4ykr/i9zCDmuTWUhYPzlNEv/XrbgxVfi7+sdn1YJ5VRGe1/XD/LKZ
 cwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693991864; x=1694596664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1QR2Xs+JmPgDNS/3fYGhVtvnBOuhauFZUc4QxGGtjOc=;
 b=fdIYNgf/rZA4HkAGy0Mn5NcVz1BO3vhrBEXf9u2SfQfYGInkaEumBT5dTZ4qoNSCbI
 /a6x3smZXtc1hLmgQWEJE3XZoJgHc5mo023LunIfQ38PqqqghUxc810QA6DJ7GOA2l6U
 uwtF3oZsi1TiqmcyScvWzq8MtOd6uQoffId4eShaBh74vHdAkYKepJU5GualocMJBjtZ
 zf8lYaUQ3zh6pTKwFGMFDNnNAmQl1luYYNKau+CR9AJVpglMN6ZRASOHEY52c6GzrgGO
 aM9zhp8x5yX61dljtPCASbkvc8D4wFLMakuWlMLYv+/ZbLvDJVsB8MPNekrg59f9YDca
 3fZg==
X-Gm-Message-State: AOJu0YwcZrzCJYisCEOk7Z6ZmIDT2cnoTOZMg+LnFt5scxr0mNKSgjhK
 u28G3BuCeUhlgkQ2jaHDJU9w4Q==
X-Google-Smtp-Source: AGHT+IElL30IODn4eQip67JQF2Ebb2g67cB09ffNj8/7fvNorNFCuPB5Rxvf/U4UW/JriBjTjd8eUg==
X-Received: by 2002:a05:6830:1147:b0:6b0:c67c:96f3 with SMTP id
 x7-20020a056830114700b006b0c67c96f3mr14623459otq.18.1693991864105; 
 Wed, 06 Sep 2023 02:17:44 -0700 (PDT)
Received: from grind.. ([177.94.15.194]) by smtp.gmail.com with ESMTPSA id
 n21-20020a9d6f15000000b006b75242d6c3sm6229228otq.38.2023.09.06.02.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 02:17:43 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 15/19] target/riscv/tcg: introduce tcg_cpu_instance_init()
Date: Wed,  6 Sep 2023 06:16:42 -0300
Message-ID: <20230906091647.1667171-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
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

tcg_cpu_instance_init() will be the 'cpu_instance_init' impl for the TCG
accelerator. It'll be called from within riscv_cpu_post_init(), via
accel_cpu_instance_init(), similar to what happens with KVM. In fact, to
preserve behavior, the implementation will be similar to what
riscv_cpu_post_init() already does.

In this patch we'll move riscv_cpu_add_user_properties() and
riscv_init_max_cpu_extensions() and all their dependencies to tcg-cpu.c.
All multi-extension properties code was moved. The 'multi_ext_user_opts'
hash table was also moved to tcg-cpu.c since it's a TCG only structure,
meaning that we won't have to worry about initializing a TCG hash table
when running a KVM CPU anymore.

riscv_cpu_add_user_properties() will remain in cpu.c for now due to how
much code it requires to be moved at the same time. We'll do that in the
next patch.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c         | 150 -------------------------------------
 target/riscv/cpu.h         |   1 -
 target/riscv/tcg/tcg-cpu.c | 149 ++++++++++++++++++++++++++++++++++++
 3 files changed, 149 insertions(+), 151 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cf191d576e..8616c9e2f5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -162,9 +162,6 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xventanacondops, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
 };
 
-/* Hash that stores user set extensions */
-static GHashTable *multi_ext_user_opts;
-
 bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset)
 {
     bool *ext_enabled = (void *)&cpu->cfg + ext_offset;
@@ -194,12 +191,6 @@ int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
     g_assert_not_reached();
 }
 
-bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
-{
-    return g_hash_table_contains(multi_ext_user_opts,
-                                 GUINT_TO_POINTER(ext_offset));
-}
-
 const char * const riscv_int_regnames[] = {
     "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
     "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
@@ -280,9 +271,6 @@ static const char * const riscv_intr_names[] = {
     "reserved"
 };
 
-static void riscv_cpu_add_user_properties(Object *obj);
-static void riscv_init_max_cpu_extensions(Object *obj);
-
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
     if (async) {
@@ -1206,32 +1194,9 @@ static bool riscv_cpu_is_dynamic(Object *cpu_obj)
     return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
 }
 
-static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
-{
-    return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) != NULL;
-}
-
-static bool riscv_cpu_has_user_properties(Object *cpu_obj)
-{
-    if (kvm_enabled() &&
-        object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_HOST) != NULL) {
-        return true;
-    }
-
-    return riscv_cpu_is_dynamic(cpu_obj);
-}
-
 static void riscv_cpu_post_init(Object *obj)
 {
     accel_cpu_instance_init(CPU(obj));
-
-    if (tcg_enabled() && riscv_cpu_has_user_properties(obj)) {
-        riscv_cpu_add_user_properties(obj);
-    }
-
-    if (riscv_cpu_has_max_extensions(obj)) {
-        riscv_init_max_cpu_extensions(obj);
-    }
 }
 
 static void riscv_cpu_init(Object *obj)
@@ -1244,8 +1209,6 @@ static void riscv_cpu_init(Object *obj)
     qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
 #endif /* CONFIG_USER_ONLY */
-
-    multi_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
 }
 
 typedef struct RISCVCPUMisaExtConfig {
@@ -1531,119 +1494,6 @@ Property riscv_cpu_options[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
-                                  void *opaque, Error **errp)
-{
-    const RISCVCPUMultiExtConfig *multi_ext_cfg = opaque;
-    bool value;
-
-    if (!visit_type_bool(v, name, &value, errp)) {
-        return;
-    }
-
-    isa_ext_update_enabled(RISCV_CPU(obj), multi_ext_cfg->offset, value);
-
-    g_hash_table_insert(multi_ext_user_opts,
-                        GUINT_TO_POINTER(multi_ext_cfg->offset),
-                        (gpointer)value);
-}
-
-static void cpu_get_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
-                                  void *opaque, Error **errp)
-{
-    const RISCVCPUMultiExtConfig *multi_ext_cfg = opaque;
-    bool value = isa_ext_is_enabled(RISCV_CPU(obj), multi_ext_cfg->offset);
-
-    visit_type_bool(v, name, &value, errp);
-}
-
-static void cpu_add_multi_ext_prop(Object *cpu_obj,
-                                   const RISCVCPUMultiExtConfig *multi_cfg)
-{
-    object_property_add(cpu_obj, multi_cfg->name, "bool",
-                        cpu_get_multi_ext_cfg,
-                        cpu_set_multi_ext_cfg,
-                        NULL, (void *)multi_cfg);
-
-    /*
-     * Set def val directly instead of using
-     * object_property_set_bool() to save the set()
-     * callback hash for user inputs.
-     */
-    isa_ext_update_enabled(RISCV_CPU(cpu_obj), multi_cfg->offset,
-                           multi_cfg->enabled);
-}
-
-static void riscv_cpu_add_multiext_prop_array(Object *obj,
-                                        const RISCVCPUMultiExtConfig *array)
-{
-    const RISCVCPUMultiExtConfig *prop;
-
-    g_assert(array);
-
-    for (prop = array; prop && prop->name; prop++) {
-        cpu_add_multi_ext_prop(obj, prop);
-    }
-}
-
-/*
- * Add CPU properties with user-facing flags.
- *
- * This will overwrite existing env->misa_ext values with the
- * defaults set via riscv_cpu_add_misa_properties().
- */
-static void riscv_cpu_add_user_properties(Object *obj)
-{
-#ifndef CONFIG_USER_ONLY
-    riscv_add_satp_mode_properties(obj);
-#endif
-
-    riscv_cpu_add_misa_properties(obj);
-
-    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_extensions);
-    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_vendor_exts);
-    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_experimental_exts);
-
-    for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
-        qdev_property_add_static(DEVICE(obj), prop);
-    }
-}
-
-/*
- * The 'max' type CPU will have all possible ratified
- * non-vendor extensions enabled.
- */
-static void riscv_init_max_cpu_extensions(Object *obj)
-{
-    RISCVCPU *cpu = RISCV_CPU(obj);
-    CPURISCVState *env = &cpu->env;
-    const RISCVCPUMultiExtConfig *prop;
-
-    /* Enable RVG, RVJ and RVV that are disabled by default */
-    riscv_cpu_set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
-
-    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
-        isa_ext_update_enabled(cpu, prop->offset, true);
-    }
-
-    /* set vector version */
-    env->vext_ver = VEXT_VERSION_1_00_0;
-
-    /* Zfinx is not compatible with F. Disable it */
-    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zfinx), false);
-    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zdinx), false);
-    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinx), false);
-    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinxmin), false);
-
-    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zce), false);
-    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmp), false);
-    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmt), false);
-
-    if (env->misa_mxl != MXL_RV32) {
-        isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcf), false);
-    }
-}
-
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index cb6372e6e7..a7415338d9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -710,7 +710,6 @@ enum riscv_pmu_event_idx {
 
 /* used by tcg/tcg-cpu.c*/
 void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en);
-bool cpu_cfg_ext_is_user_set(uint32_t ext_offset);
 bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset);
 int cpu_cfg_ext_get_min_version(uint32_t ext_offset);
 void riscv_cpu_set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext);
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 8698ce4765..c9804b53f8 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -23,12 +23,22 @@
 #include "pmu.h"
 #include "time_helper.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
 #include "qemu/accel.h"
 #include "qemu/error-report.h"
 #include "hw/core/accel-cpu.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "tcg/tcg.h"
 
+/* Hash that stores user set extensions */
+static GHashTable *multi_ext_user_opts;
+
+static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
+{
+    return g_hash_table_contains(multi_ext_user_opts,
+                                 GUINT_TO_POINTER(ext_offset));
+}
+
 static void riscv_cpu_synchronize_from_tb(CPUState *cs,
                                           const TranslationBlock *tb)
 {
@@ -568,6 +578,144 @@ static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
     return true;
 }
 
+static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    const RISCVCPUMultiExtConfig *multi_ext_cfg = opaque;
+    bool value;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    isa_ext_update_enabled(RISCV_CPU(obj), multi_ext_cfg->offset, value);
+
+    g_hash_table_insert(multi_ext_user_opts,
+                        GUINT_TO_POINTER(multi_ext_cfg->offset),
+                        (gpointer)value);
+}
+
+static void cpu_get_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    const RISCVCPUMultiExtConfig *multi_ext_cfg = opaque;
+    bool value = isa_ext_is_enabled(RISCV_CPU(obj), multi_ext_cfg->offset);
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void cpu_add_multi_ext_prop(Object *cpu_obj,
+                                   const RISCVCPUMultiExtConfig *multi_cfg)
+{
+    object_property_add(cpu_obj, multi_cfg->name, "bool",
+                        cpu_get_multi_ext_cfg,
+                        cpu_set_multi_ext_cfg,
+                        NULL, (void *)multi_cfg);
+
+    /*
+     * Set def val directly instead of using
+     * object_property_set_bool() to save the set()
+     * callback hash for user inputs.
+     */
+    isa_ext_update_enabled(RISCV_CPU(cpu_obj), multi_cfg->offset,
+                           multi_cfg->enabled);
+}
+
+static void riscv_cpu_add_multiext_prop_array(Object *obj,
+                                        const RISCVCPUMultiExtConfig *array)
+{
+    const RISCVCPUMultiExtConfig *prop;
+
+    g_assert(array);
+
+    for (prop = array; prop && prop->name; prop++) {
+        cpu_add_multi_ext_prop(obj, prop);
+    }
+}
+
+/*
+ * Add CPU properties with user-facing flags.
+ *
+ * This will overwrite existing env->misa_ext values with the
+ * defaults set via riscv_cpu_add_misa_properties().
+ */
+static void riscv_cpu_add_user_properties(Object *obj)
+{
+#ifndef CONFIG_USER_ONLY
+    riscv_add_satp_mode_properties(obj);
+#endif
+
+    riscv_cpu_add_misa_properties(obj);
+
+    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_extensions);
+    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_vendor_exts);
+    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_experimental_exts);
+
+    for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
+        qdev_property_add_static(DEVICE(obj), prop);
+    }
+}
+
+/*
+ * The 'max' type CPU will have all possible ratified
+ * non-vendor extensions enabled.
+ */
+static void riscv_init_max_cpu_extensions(Object *obj)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
+    const RISCVCPUMultiExtConfig *prop;
+
+    /* Enable RVG, RVJ and RVV that are disabled by default */
+    riscv_cpu_set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
+
+    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
+        isa_ext_update_enabled(cpu, prop->offset, true);
+    }
+
+    /* set vector version */
+    env->vext_ver = VEXT_VERSION_1_00_0;
+
+    /* Zfinx is not compatible with F. Disable it */
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zfinx), false);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zdinx), false);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinx), false);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinxmin), false);
+
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zce), false);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmp), false);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmt), false);
+
+    if (env->misa_mxl != MXL_RV32) {
+        isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcf), false);
+    }
+}
+
+static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
+{
+    return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) != NULL;
+}
+
+static bool riscv_cpu_has_user_properties(Object *cpu_obj)
+{
+    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
+}
+
+static void tcg_cpu_instance_init(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    Object *obj = OBJECT(cpu);
+
+    if (riscv_cpu_has_user_properties(obj)) {
+        multi_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
+        riscv_cpu_add_user_properties(obj);
+    }
+
+    if (riscv_cpu_has_max_extensions(obj)) {
+        riscv_init_max_cpu_extensions(obj);
+    }
+}
+
 static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
 {
     /*
@@ -586,6 +734,7 @@ static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
     acc->cpu_class_init = tcg_cpu_class_init;
+    acc->cpu_instance_init = tcg_cpu_instance_init;
     acc->cpu_realizefn = tcg_cpu_realizefn;
 }
 
-- 
2.41.0


