Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691D7C41535
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 12:25:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGeYT-0001aa-Jg; Fri, 22 Dec 2023 07:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeYQ-0001Zc-9x
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:23:02 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeYO-00069s-5u
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:23:02 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6d7750e2265so1141256b3a.3
 for <qemu-riscv@nongnu.org>; Fri, 22 Dec 2023 04:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703247779; x=1703852579; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8l/9hykJG5FQUK8/sY9Emc0HqMF3QSzRWQv9f85u3n8=;
 b=U11Dda4AxJtIPzESoD/4WtlqlfyYPArW/rz05QVy6X9zdfPvzWUuWQRLNnm9mI9khr
 /RHD4LfGeGUbbZAEqb2HwrBoUK9SXNOtrriFO7q2Owgq3VFZn0WId4RzK5r8rWArrt41
 CKPAkgBoffMZJR5AKSIIeTAzfELvv5OyWayp4zkomIreFNda12Y0l31/CE+ZWh+cH9ge
 mu4McojnEvHoyw75SecJx6uYfiYyaN9PowOvX7YnQ3nxJrZ97uZ9l2WtLykEfqmOku11
 +4s/+nP6whl1OfZ6WArLbnkBTPw1oMwM8q24d7L+1rBbG17I4mkM91QC4T4OZM9lFJWa
 5Iow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703247779; x=1703852579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8l/9hykJG5FQUK8/sY9Emc0HqMF3QSzRWQv9f85u3n8=;
 b=V8ZiIUOtwclu+Ylja7insGNiSfNa1KYkuh9mIT7lhVTR1pZuBmcPWKmz+2LE+IOgA4
 BhJdQXXdeVfc//CJfo+yd6041zqXBGWldQ/3J1mo2raZN0ZSSqC9I4jFVjJW5tYZwW8s
 JCY1+/racVAnyPoT9WcxBB3B/dZVSO1wsr4R3uZzhjhHOKVl25i5kv1gMdK5VUR5l5UF
 ABnJ1nl257VdNTdjC+bm1KW01nY+E2Dm8M7RFmCTugMbrbf0jj3P+M1wMm9GLZEiP2Hc
 wI5nc+Bw0DiZLgIRRagEJN3RfBnEDxX7FTiYJN9tg0mxL5YINopVyL/i2UgV/nvvT21b
 EqlQ==
X-Gm-Message-State: AOJu0Yzc4Skd3oFk9GtxCz6v/Nf1yXD1afkHq9+xsq8hvRG8w9unwdWL
 FVU3dmDpu4F6h1t2PSKk9J1MmzIv6eMZQA==
X-Google-Smtp-Source: AGHT+IEcJaf47J/vkrb9RM02h0Nx0IvsUc3trOfd5P+AoRaExmZ1Q7YwW+a9OzEll7pVxhgi44VjtQ==
X-Received: by 2002:a05:6a00:1c85:b0:6d9:6b40:d2f6 with SMTP id
 y5-20020a056a001c8500b006d96b40d2f6mr984903pfw.2.1703247778879; 
 Fri, 22 Dec 2023 04:22:58 -0800 (PST)
Received: from grind.dc1.ventanamicro.com (201-69-66-51.dial-up.telesp.net.br.
 [201.69.66.51]) by smtp.gmail.com with ESMTPSA id
 g14-20020aa7874e000000b006ce7ad8c14esm3274901pfo.164.2023.12.22.04.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 04:22:58 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 06/16] target/riscv: rework 'priv_spec'
Date: Fri, 22 Dec 2023 09:22:25 -0300
Message-ID: <20231222122235.545235-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222122235.545235-1-dbarboza@ventanamicro.com>
References: <20231222122235.545235-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42b.google.com
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
 target/riscv/cpu.c         | 72 +++++++++++++++++++++++++++++++++++++-
 target/riscv/cpu.h         |  3 ++
 target/riscv/cpu_cfg.h     |  1 -
 target/riscv/tcg/tcg-cpu.c | 29 ---------------
 4 files changed, 74 insertions(+), 31 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bdb6466c84..1302d32de3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1560,8 +1560,76 @@ static const PropertyInfo prop_pmp = {
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
@@ -1583,6 +1651,8 @@ static Property riscv_cpu_properties[] = {
     {.name = "mmu", .info = &prop_mmu},
     {.name = "pmp", .info = &prop_pmp},
 
+    {.name = "priv_spec", .info = &prop_priv_spec},
+
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index cfe965e512..e8a691ca63 100644
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


