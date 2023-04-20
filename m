Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppQTs-0008C0-VV
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 05:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTr-0008BU-NP
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 05:21:31 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTo-00074C-Vu
 for qemu-riscv@nongnu.org; Thu, 20 Apr 2023 05:21:31 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-187af4a5437so512704fac.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Apr 2023 02:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681982488; x=1684574488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rK27VF7IXIJVvE3mxsvsrezgeR9Iu38bO+ZueEaDnDg=;
 b=S11iCXHUPk3GfPy9sln4FEFILDsrFBFYXLPHHiyUBp5wTBvxbjXKBjjkm7oxdgPD2X
 sY9razgg70fGyJO+2aaI1E0J1g9lWnWkmcjXHf7vFdXrNqcBSQcGUmN6C2d2pfmqNi5e
 /1y81xnTrT4etTkaikSxpKOl2Us9tdK0ENh94/emuLQw/eVXojg2CG5LhVoun763g6eE
 Bbe4CO5v5iCde5ycPiuAwdXFWyhLyojiwP/jcynSYamqJ6pNJUTjUmrV/HXVtIoCzS/R
 ArpPIkHycIqRWz3yGx1a+XJ+mzq+u3n/fmWo/nugmzZnvRWcWmvQghLC+rFXzXOJbRrv
 jiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982488; x=1684574488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rK27VF7IXIJVvE3mxsvsrezgeR9Iu38bO+ZueEaDnDg=;
 b=RnF9vMzNZw1qhllBmxkRGNizrUKg0WeP8KtXOCfqKq4ospRVBh5RFCzfQbaPGI5rG/
 YfxI2BC0iFrJPOoBESALXU5HJ//YgRKg/HMj6HCO+Ve4kyVwa3+vuIXWu79hjn/139Gw
 a8MCjiCZb5YjCFPypmJ1CQkoVf6o4Enu8WMJPXsVq/u2fKg830f2lXW0m3Slu85T2n9y
 gblGM1GeIDsX/yNVHXZKpPHf1jhQeuemHKoh/TcLSmh6h+D8EA+iHZKCzrw9D82QVN9v
 NV0mREnfGcunAznDyVWtVsFgcy7crIKAvT1zf8hzaMTYNnxJ4yTOnrIUQo+2yBmu8lz3
 vOjg==
X-Gm-Message-State: AAQBX9ce9s+2A/ohqSLbO6nOn9gSwxnKYomwsnAioGagm1fO1bN91TYs
 R20r5ogF/5GgUDsZafaR/9PXrg==
X-Google-Smtp-Source: AKy350agkEtdCQMsiS2a7lqAOlb4amw/iGGcaTevbuQfZRGl7Q0t4PF6Jplp8uu1OjI9v57zQp/zow==
X-Received: by 2002:a05:6870:c694:b0:187:bacd:2937 with SMTP id
 cv20-20020a056870c69400b00187bacd2937mr724654oab.51.1681982487888; 
 Thu, 20 Apr 2023 02:21:27 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a056870e74100b0017280f7d653sm529668oak.35.2023.04.20.02.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 02:21:27 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v7 07/12] target/riscv/cpu.c: add priv_spec
 validate/disable_exts helpers
Date: Thu, 20 Apr 2023 06:20:55 -0300
Message-Id: <20230420092100.177464-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420092100.177464-1-dbarboza@ventanamicro.com>
References: <20230420092100.177464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
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
X-List-Received-Date: Thu, 20 Apr 2023 09:21:31 -0000

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
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 91 ++++++++++++++++++++++++++++------------------
 1 file changed, 56 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9bb0e6b180..c928925544 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -827,6 +827,52 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
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
  * cpu->cfg accordingly.
@@ -1045,6 +1091,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zksed = true;
         cpu->cfg.ext_zksh = true;
     }
+
+    /*
+     * Disable isa extensions based on priv spec after we
+     * validated and set everything we need.
+     */
+    riscv_cpu_disable_priv_spec_isa_exts(cpu);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -1144,7 +1196,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     CPUClass *cc = CPU_CLASS(mcc);
-    int i, priv_version = -1;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -1153,23 +1204,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
+    riscv_cpu_validate_priv_spec(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
     }
 
     riscv_cpu_validate_misa_priv(env, &local_err);
@@ -1178,23 +1216,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
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
-    }
-
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
-- 
2.40.0


