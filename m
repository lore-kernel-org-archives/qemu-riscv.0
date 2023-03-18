Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdcnV-000520-Bq
	for mharc-qemu-riscv@gnu.org; Sat, 18 Mar 2023 16:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnT-00051Z-Lq
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:04:59 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnR-0006tI-Vm
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:04:59 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 103-20020a9d0870000000b0069f000acf40so2304311oty.1
 for <qemu-riscv@nongnu.org>; Sat, 18 Mar 2023 13:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9X/RtTs+28g3ykhi3pLH1l3iYUDqblx0oOtf2WwshWM=;
 b=btFvX3a2ozNIIR9l6QhRXb2vjiga4zfhjgcm+tFrutNWOVuCECpe+rXLOkIK1JXJWU
 MV9cCElahrxKLkIfOB7iQZxAhsBJFR0rGxWjJhXffRsXcHFigWhyUiWHUngIoVCWqJVX
 7G5MLxiw6b/NtBGD4/6kU+PWQfMraBf5ZEzDa/TptuSMSGGdK729lzy/yomFv+sMCxEK
 Wjv/PWrx7lwJu/gDEbx3rqW1DjTM4dqv1p/pfrO+r4waxryjUN+meSdAKS3hmH4tqm+U
 U9XHroVzMGE4gNDB54Qsc9hJETpisQEJbnlT9r1Fr0Yuh7BL5VqpnijQAD+vGLz0VEH8
 DuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9X/RtTs+28g3ykhi3pLH1l3iYUDqblx0oOtf2WwshWM=;
 b=U5OsUEdWiu6pB6jxngDKvO7d07PIak92hd1QVCVGfEjBBh/STyk7rpBwHzlCmnSVBq
 51A7ncrwE11KiXhXoHVTY90TiLfha78D8G4UnvHG+4XV88AlsUJxehcc+Naf6600VPBD
 NPO6+OSvMGehjeXoghFOqkh/j8+kW8Ex89WUsv0NeMvPNZ+0pc5ujTVsjZPswX8X5rYk
 7MQWQyJo0Pw1+0RyK5u+1HiV5OLSEwLgsYFuhInsnTdnRfalYdq4yTL0iw+0SQVWS8wz
 EEeUJuhF4DVTaPm+Tqwbx08NMYQPaQNAouxJZJHrkXu/Q3mosTcIcRdcoWdNQGf02ka0
 nWUg==
X-Gm-Message-State: AO0yUKXKUcBY3Y0lneQllaGc09YufdbKRBTC/s6uN8yByOXJ39cZjzrR
 TLTfPRMMMIZzLNaH/j2RQdyAKw==
X-Google-Smtp-Source: AK7set8zV9pylaTcYQ+zMB3lC1FyXnYk00ONiXzg6u1vl21R1Bdu+qnYEXFL4epR38iIPjt8omts7g==
X-Received: by 2002:a9d:6b19:0:b0:694:3972:dbae with SMTP id
 g25-20020a9d6b19000000b006943972dbaemr1558266otp.2.1679169896838; 
 Sat, 18 Mar 2023 13:04:56 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:04:56 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 05/26] target/riscv/cpu.c: add priv_spec
 validate/disable_exts helpers
Date: Sat, 18 Mar 2023 17:04:15 -0300
Message-Id: <20230318200436.299464-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Sat, 18 Mar 2023 20:04:59 -0000

We're doing env->priv_spec validation and assignment at the start of
riscv_cpu_realize(), which is fine, but then we're doing a force disable
on extensions that aren't compatible with the priv version.

This second step is being done too early. The disabled extensions might be
re-enabled again in riscv_cpu_validate_set_extensions() by accident. A
better place to put this code is at the end of
riscv_cpu_validate_set_extensions() after all the validations are
completed.

Add a new helper, riscv_cpu_disable_priv_spec_isa_exts(), to disable the
extesions after the validation is done. While we're at it, create a
riscv_cpu_validate_priv_spec() helper to host all env->priv_spec related
validation to unclog riscv_cpu_realize a bit.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 91 ++++++++++++++++++++++++++++------------------
 1 file changed, 56 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1ee322001b..17b301967c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -833,6 +833,52 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
     env->vext_ver = vext_version;
 }
 
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
+static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
+{
+    CPURISCVState *env = &cpu->env;
+    int i;
+
+    /* Force disable extensions if priv spec version does not match */
+    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
+        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
+            (env->priv_ver < isa_edata_arr[i].min_version)) {
+            isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
+#ifndef CONFIG_USER_ONLY
+            warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
+                        " because privilege spec version does not match",
+                        isa_edata_arr[i].name, env->mhartid);
+#else
+            warn_report("disabling %s extension because "
+                        "privilege spec version does not match",
+                        isa_edata_arr[i].name);
+#endif
+        }
+    }
+}
+
 /*
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly, doing a set_misa() in the end.
@@ -1002,6 +1048,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zksh = true;
     }
 
+    /*
+     * Disable isa extensions based on priv spec after we
+     * validated and set everything we need.
+     */
+    riscv_cpu_disable_priv_spec_isa_exts(cpu);
+
     if (cpu->cfg.ext_i) {
         ext |= RVI;
     }
@@ -1131,7 +1183,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     CPUClass *cc = CPU_CLASS(mcc);
-    int i, priv_version = -1;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -1140,40 +1191,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
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
-    }
-
-    if (priv_version >= PRIV_VERSION_1_10_0) {
-        env->priv_ver = priv_version;
-    }
-
-    /* Force disable extensions if priv spec version does not match */
-    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
-            (env->priv_ver < isa_edata_arr[i].min_version)) {
-            isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
-#ifndef CONFIG_USER_ONLY
-            warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
-                        " because privilege spec version does not match",
-                        isa_edata_arr[i].name, env->mhartid);
-#else
-            warn_report("disabling %s extension because "
-                        "privilege spec version does not match",
-                        isa_edata_arr[i].name);
-#endif
-        }
+    riscv_cpu_validate_priv_spec(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
     }
 
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
-- 
2.39.2


