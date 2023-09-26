Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E018E7E657
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 18:32:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qlCqE-0002tr-IR; Tue, 26 Sep 2023 14:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlCqC-0002tU-Rs
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 14:31:24 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlCqB-0003vr-2I
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 14:31:24 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c1e3a4a06fso66417575ad.3
 for <qemu-riscv@nongnu.org>; Tue, 26 Sep 2023 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695753081; x=1696357881; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aXCHNDVDepsxqJNyAcCCDvKoiDps3kH2QRPqtAc07a0=;
 b=OMheRVuLk7Dgi4ismCXyaSFKhbm0OcPhxQuheJqRfRUffvSAwBI90LYpmNyjs42aEF
 RJbxByDHgD+n/hL6RosDMiy9YDlqCQr/67zSadelSZDOGM1U5WgVXr36xs1RZvrXNIqY
 /f1MX8LqMtlxAxg/r37LwASZtvSHgcmFEHqUQY6G7qyxcjUs+8LPyZd37Q3F115gFZPs
 aIohnXl6y3EYRfoWKbF65actQckq9PHwdoIp/H0ml1ga1KL/DAvgkz9kTUEDgKSGnftA
 pmi+JVr0l3VaMhMPa1nK8MsUoFYlLtFImVjDb6nQK8u45zBugDav209R2HfeClLrIKYf
 sdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695753081; x=1696357881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aXCHNDVDepsxqJNyAcCCDvKoiDps3kH2QRPqtAc07a0=;
 b=QliQ2Fvn71qW9txyqSB3hGEgwtOkB13KAtfU9j2Bo28FFZ3aOw0vRzMrR/vPROtgxC
 rwBleJdrZbfhGl7kaM3bjnsvmwe+HU3FGGOrOf2hgc6mamvng9Hrk04qwTZzxB92a+P2
 0CdG2BNFbjmrFxqabJpiPkuTR5vrLkvXcz5CJlnrmyFBeLXguJWJR31SXU+lrCAYJBYA
 6+TYdcvLO/amRKYITl6kq2ohn6dZHQByHAvfGGRu2n9wXkB7LSreqOX6E1JbdMD7/ljI
 0vz53EzGCF755qMc+5VLLmGHn29tUkZWvxyON6nLPI00l7p9hqFO5fGm3LU6blN/ndqJ
 S5LA==
X-Gm-Message-State: AOJu0YzUNPWudJwGIGk8ws1uPZyu1etEpUY2QouuL9LtoVR7SSfyphkm
 HmVauRYhzw4vM7WodBx5yiW0/A==
X-Google-Smtp-Source: AGHT+IHPse/dx31nmYQOasFDWMBjIHr7iqdtZ9AIO1pYTZ53Eh9hn1H/pwHJMLu53YpM8dSYOx3Daw==
X-Received: by 2002:a17:902:6b44:b0:1c5:bea4:8537 with SMTP id
 g4-20020a1709026b4400b001c5bea48537mr7305828plt.15.1695753081506; 
 Tue, 26 Sep 2023 11:31:21 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 u6-20020a170902b28600b001c61acd5bd2sm4715800plr.112.2023.09.26.11.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 11:31:21 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/2] target/riscv/tcg-cpu.c: add extension properties for all
 cpus
Date: Tue, 26 Sep 2023 15:31:09 -0300
Message-ID: <20230926183109.165878-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230926183109.165878-1-dbarboza@ventanamicro.com>
References: <20230926183109.165878-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
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

At this moment we do not expose extension properties for vendor CPUs
because that would allow users to change them via command line. The
drawback is that if we were to add an API that shows all CPU properties,
e.g. qmp-query-cpu-model-expansion, we won't be able to show extensions
state of vendor CPUs.

We have the required machinery to create extension properties for vendor
CPUs while not allowing users to enable extensions. Disabling existing
extensions is allowed since it can be useful for debugging.

Change the set() callback cpu_set_multi_ext_cfg() to allow enabling
extensions only for generic CPUs. In cpu_add_multi_ext_prop() let's not
set the default values for the properties if we're not dealing with
generic CPUs, otherwise the values set in cpu_init() of vendor CPUs will
be overwritten. And finally, in tcg_cpu_instance_init(), add cpu user
properties for all CPUs.

For the veyron-v1 CPU, we're now able to disable existing extensions
like smstateen:

$ ./build/qemu-system-riscv64 --nographic -M virt \
    -cpu veyron-v1,smstateen=false

But setting extensions that the CPU didn't set during cpu_init(), like
V, is not allowed:

$ ./build/qemu-system-riscv64 --nographic -M virt \
    -cpu veyron-v1,v=true
qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.v=true:
  'veyron-v1' CPU does not allow enabling extensions

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 64 +++++++++++++++++++++++++++++---------
 1 file changed, 50 insertions(+), 14 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index f31aa9bcc4..a90ee63b06 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -549,6 +549,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     riscv_cpu_disable_priv_spec_isa_exts(cpu);
 }
 
+static bool riscv_cpu_is_generic(Object *cpu_obj)
+{
+    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
+}
+
 /*
  * We'll get here via the following path:
  *
@@ -632,13 +637,27 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
     target_ulong misa_bit = misa_ext_cfg->misa_bit;
     RISCVCPU *cpu = RISCV_CPU(obj);
     CPURISCVState *env = &cpu->env;
-    bool value;
+    bool generic_cpu = riscv_cpu_is_generic(obj);
+    bool prev_val, value;
 
     if (!visit_type_bool(v, name, &value, errp)) {
         return;
     }
 
+    prev_val = env->misa_ext & misa_bit;
+
+    if (value == prev_val) {
+        return;
+    }
+
     if (value) {
+        if (!generic_cpu) {
+            g_autofree char *cpuname = riscv_cpu_get_name(cpu);
+            error_setg(errp, "'%s' CPU does not allow enabling extensions",
+                       cpuname);
+            return;
+        }
+
         env->misa_ext |= misa_bit;
         env->misa_ext_mask |= misa_bit;
     } else {
@@ -688,6 +707,7 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
  */
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 {
+    bool use_def_vals = riscv_cpu_is_generic(cpu_obj);
     int i;
 
     for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
@@ -706,7 +726,9 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
                             cpu_set_misa_ext_cfg,
                             NULL, (void *)misa_cfg);
         object_property_set_description(cpu_obj, name, desc);
-        object_property_set_bool(cpu_obj, name, misa_cfg->enabled, NULL);
+        if (use_def_vals) {
+            object_property_set_bool(cpu_obj, name, misa_cfg->enabled, NULL);
+        }
     }
 }
 
@@ -714,17 +736,32 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
     const RISCVCPUMultiExtConfig *multi_ext_cfg = opaque;
-    bool value;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    bool generic_cpu = riscv_cpu_is_generic(obj);
+    bool prev_val, value;
 
     if (!visit_type_bool(v, name, &value, errp)) {
         return;
     }
 
-    isa_ext_update_enabled(RISCV_CPU(obj), multi_ext_cfg->offset, value);
-
     g_hash_table_insert(multi_ext_user_opts,
                         GUINT_TO_POINTER(multi_ext_cfg->offset),
                         (gpointer)value);
+
+    prev_val = isa_ext_is_enabled(cpu, multi_ext_cfg->offset);
+
+    if (value == prev_val) {
+        return;
+    }
+
+    if (value && !generic_cpu) {
+        g_autofree char *cpuname = riscv_cpu_get_name(cpu);
+        error_setg(errp, "'%s' CPU does not allow enabling extensions",
+                   cpuname);
+        return;
+    }
+
+    isa_ext_update_enabled(cpu, multi_ext_cfg->offset, value);
 }
 
 static void cpu_get_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
@@ -739,11 +776,17 @@ static void cpu_get_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
 static void cpu_add_multi_ext_prop(Object *cpu_obj,
                                    const RISCVCPUMultiExtConfig *multi_cfg)
 {
+    bool generic_cpu = riscv_cpu_is_generic(cpu_obj);
+
     object_property_add(cpu_obj, multi_cfg->name, "bool",
                         cpu_get_multi_ext_cfg,
                         cpu_set_multi_ext_cfg,
                         NULL, (void *)multi_cfg);
 
+    if (!generic_cpu) {
+        return;
+    }
+
     /*
      * Set def val directly instead of using
      * object_property_set_bool() to save the set()
@@ -828,20 +871,13 @@ static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
     return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) != NULL;
 }
 
-static bool riscv_cpu_has_user_properties(Object *cpu_obj)
-{
-    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
-}
-
 static void tcg_cpu_instance_init(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     Object *obj = OBJECT(cpu);
 
-    if (riscv_cpu_has_user_properties(obj)) {
-        multi_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
-        riscv_cpu_add_user_properties(obj);
-    }
+    multi_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
+    riscv_cpu_add_user_properties(obj);
 
     if (riscv_cpu_has_max_extensions(obj)) {
         riscv_init_max_cpu_extensions(obj);
-- 
2.41.0


