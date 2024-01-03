Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33E8C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:43:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL5El-0004jb-9T; Wed, 03 Jan 2024 12:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5Ea-0003Ol-Jz
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:40:52 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5ET-0001dq-PR
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:40:51 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6d9b1589a75so2394389b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704303643; x=1704908443; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j9FLMG9CAE7ALWgiMWmYvxQJdqWs+YAB7ykqY3X8jZI=;
 b=L2FfbnCjHvtzteLwF3W7+NHqTSmgmnK4BJZDTs1xfNyKQ1qiTUEu7Q2wTs8sD1jRVO
 MATmAMxfPb3oyctCZLjxlaj0evXcp1YgdrCKk2Ep/BjAWJy8OlpC/yebB8FJ8WssqJM/
 x1vAyQYRrjIrUNr6tKbq9pNm2rr601lP+DJvcA6Mnb+8ZeVvE5MKe5BjawPXCnfqNHAD
 ITn01yfP+MGg9IIgxseGrwivRztl/yuQ+iqeQdDqRhnnIiyjyUTV7zdPNz35/NiUmQlp
 GJ27ptBgaCHz3H3HJTi5W5xHmwzYzN5HHXAWoZ1glwd7v6giBP8Rj6qXGQFowIT2SwI6
 OimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303643; x=1704908443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j9FLMG9CAE7ALWgiMWmYvxQJdqWs+YAB7ykqY3X8jZI=;
 b=GHrti64bmWesRDs+lrcP3w3X/Flhm6dr5IAInds9jW7SvCvCg/J9zmdtvGVVIdIGw5
 AozUdAF32vwbAN6/sHbgk2usac/Yyf9bSt1hNoqFo0i/Ast357L5Jm4RMvYLjHaHsWqd
 H+c5RUF6WG5Sd1bhDc7SxN224xmjWDMx0sdditG9PTtR34HiqKfGY9HN7H4vNrghrADx
 /QiQKslRoPLkDkbxsp8XaB4obelW5Ubm1AUzqY1Gnjv2F1blTFcLUiscddExDmrgfiZc
 GISWP4F7mhuEJeNwx6A7M5lcn8GgFKnEYAkTD04mjsqgsqFJn49i7Q/XVbkzntY8EGBu
 GKcA==
X-Gm-Message-State: AOJu0YwjpqOEANaE59w9YV3LYnmDr8I7AJ+lo0sw24h0gGpzH1gqe21n
 lfSvRyIGBvU6EOqsRjUXYJnOu1hzS70U+w==
X-Google-Smtp-Source: AGHT+IE8QOnDt6UdRkFSV9AZ3jaRg2kQd0tRzotNMc9EBuov7bu+83h/mM4Qx2nvG0DmTR6imT69IA==
X-Received: by 2002:a05:6a00:13a1:b0:6d9:98ea:e8ad with SMTP id
 t33-20020a056a0013a100b006d998eae8admr10594521pfg.47.1704303643448; 
 Wed, 03 Jan 2024 09:40:43 -0800 (PST)
Received: from grind.. ([189.79.21.107]) by smtp.gmail.com with ESMTPSA id
 v3-20020aa78503000000b006d7f1ae421csm24042050pfn.145.2024.01.03.09.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:40:43 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, vladimir.isaev@syntacore.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 06/16] target/riscv: rework 'priv_spec'
Date: Wed,  3 Jan 2024 14:40:03 -0300
Message-ID: <20240103174013.147279-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103174013.147279-1-dbarboza@ventanamicro.com>
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x436.google.com
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

'priv_spec' and 'vext_spec' are two string options used as a fancy way
of setting integers in the CPU state (cpu->env.priv_ver and
cpu->env.vext_ver). It requires us to deal with string parsing and to
store them in cpu_cfg.

We must support these string options, but we don't need to store them.
We have a precedence for this kind of arrangement in target/ppc/compat.c,
ppc_compat_prop_get|set, getters and setters used for the
'max-cpu-compat' class property of the pseries ppc64 machine. We'll do
the same with both 'priv_spec' and 'vext_spec'.

For 'priv_spec', the validation from riscv_cpu_validate_priv_spec() will
be done by the prop_priv_spec_set() setter, while also preventing it to
be changed for vendor CPUs. Add two helpers that converts env->priv_ver
back and forth to its string representation. These helpers allow us to
get a string and set 'env->priv_ver' and return a string giving the
current env->priv_ver value. In other words, make the cpu->cfg.priv_spec
string obsolete.

Last but not the least, move the reworked 'priv_spec' option to
riscv_cpu_properties[].

After all said and done, we don't need to store the 'priv_spec' string in
the CPU state, and we're now protecting vendor CPUs from priv_ver
changes:

$ ./build/qemu-system-riscv64 -M virt -cpu sifive-e51,priv_spec="v1.12.0"
qemu-system-riscv64: can't apply global sifive-e51-riscv-cpu.priv_spec=v1.12.0:
    CPU 'sifive-e51' does not allow changing the value of 'priv_spec'
Current 'priv_spec' val: v1.10.0
$

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 73 +++++++++++++++++++++++++++++++++++++-
 target/riscv/cpu.h         |  3 ++
 target/riscv/cpu_cfg.h     |  1 -
 target/riscv/tcg/tcg-cpu.c | 29 ---------------
 4 files changed, 75 insertions(+), 31 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 01b3b57cee..657569d8a6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1631,8 +1631,77 @@ static const PropertyInfo prop_pmp = {
     .set = prop_pmp_set,
 };
 
+static int priv_spec_from_str(const char *priv_spec_str)
+{
+    int priv_version = -1;
+
+    if (!g_strcmp0(priv_spec_str, PRIV_VER_1_12_0_STR)) {
+        priv_version = PRIV_VERSION_1_12_0;
+    } else if (!g_strcmp0(priv_spec_str, PRIV_VER_1_11_0_STR)) {
+        priv_version = PRIV_VERSION_1_11_0;
+    } else if (!g_strcmp0(priv_spec_str, PRIV_VER_1_10_0_STR)) {
+        priv_version = PRIV_VERSION_1_10_0;
+    }
+
+    return priv_version;
+}
+
+static const char *priv_spec_to_str(int priv_version)
+{
+    switch (priv_version) {
+    case PRIV_VERSION_1_10_0:
+        return PRIV_VER_1_10_0_STR;
+    case PRIV_VERSION_1_11_0:
+        return PRIV_VER_1_11_0_STR;
+    case PRIV_VERSION_1_12_0:
+        return PRIV_VER_1_12_0_STR;
+    default:
+        return NULL;
+    }
+}
+
+static void prop_priv_spec_set(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    g_autofree char *value = NULL;
+    int priv_version = -1;
+
+    visit_type_str(v, name, &value, errp);
+
+    priv_version = priv_spec_from_str(value);
+    if (priv_version < 0) {
+        error_setg(errp, "Unsupported privilege spec version '%s'", value);
+        return;
+    }
+
+    if (priv_version != cpu->env.priv_ver && riscv_cpu_is_vendor(obj)) {
+        cpu_set_prop_err(cpu, name, errp);
+        error_append_hint(errp, "Current '%s' val: %s\n", name,
+                          object_property_get_str(obj, name, NULL));
+        return;
+    }
+
+    cpu_option_add_user_setting(name, priv_version);
+    cpu->env.priv_ver = priv_version;
+}
+
+static void prop_priv_spec_get(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    const char *value = priv_spec_to_str(cpu->env.priv_ver);
+
+    visit_type_str(v, name, (char **)&value, errp);
+}
+
+static const PropertyInfo prop_priv_spec = {
+    .name = "priv_spec",
+    .get = prop_priv_spec_get,
+    .set = prop_priv_spec_set,
+};
+
 Property riscv_cpu_options[] = {
-    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
 
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
@@ -1653,6 +1722,8 @@ static Property riscv_cpu_properties[] = {
     {.name = "mmu", .info = &prop_mmu},
     {.name = "pmp", .info = &prop_pmp},
 
+    {.name = "priv_spec", .info = &prop_priv_spec},
+
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf69cb9a27..aa3d3372e3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -77,6 +77,9 @@ const char *riscv_get_misa_ext_description(uint32_t bit);
 #define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
 
 /* Privileged specification version */
+#define PRIV_VER_1_10_0_STR "v1.10.0"
+#define PRIV_VER_1_11_0_STR "v1.11.0"
+#define PRIV_VER_1_12_0_STR "v1.12.0"
 enum {
     PRIV_VERSION_1_10_0 = 0,
     PRIV_VERSION_1_11_0,
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index c67a8731d3..2dba1f0007 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -135,7 +135,6 @@ struct RISCVCPUConfig {
     bool ext_XVentanaCondOps;
 
     uint32_t pmu_mask;
-    char *priv_spec;
     char *vext_spec;
     uint16_t vlen;
     uint16_t elen;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index a09300e908..4d67b72d9e 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -175,29 +175,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
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
 static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
                                  Error **errp)
 {
@@ -625,12 +602,6 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
     CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
 
-    riscv_cpu_validate_priv_spec(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
     riscv_cpu_validate_misa_priv(env, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.43.0


