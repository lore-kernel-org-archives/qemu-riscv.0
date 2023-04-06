Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkTxu-0000tP-O1
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 14:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTxt-0000se-5Z
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:05 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTxr-0000Zz-E4
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:04 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-17786581fe1so43206140fac.10
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 11:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zfsRr9xhp36UswUhHh+RTCS39W4vDYCkTwWBjY7Jfk8=;
 b=hf8QPKi4psUYIb0u0N+TlZJCKPevliqv5IOYYDpNUo59WXOUgiVkbUvcZO3uHxL7kL
 tAVQSx+uu4bot4XUgCJlktGRUu0XXYD8lbaw6dp1EeAXqYyoQdesEV/pB5W3r7tL2G8V
 d4SAOPWiCW0e3fpdHNB8fQGB+GtPuznrUn0QNaNaIu3tGbNUPCd5IIF5GSh9Gpu0k1nZ
 C0LlDAD8hkhBIlRHg+vVGhtvIzjPk1kUJZc97Ghr9ZIHXPIKdFQjZFjFnTIyE4ySJcsO
 sQ3EN5CdmiVo48RLE5jjBc5rMqZrno8+Rezgmv21/7THeSh/lUrEbTeVWMcIiFfq3i2d
 e/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zfsRr9xhp36UswUhHh+RTCS39W4vDYCkTwWBjY7Jfk8=;
 b=Co1rWhH57iLl0vAkIumPTazLSuFn3hkvP3rqEjsq+WYMx1CilVMDvM5Z6yexlKdBhy
 OGUBg3atr+f5H9Ut36tRoKlmaxN2wf5/mnW9y9gu5R0SuAaMxRGciwBH2+Qulc5gYpX9
 PciYK0hoQ48ToDLm4hnOLCh2o2bNkDMl1U+fXr3YbhLo7fS9+dZtO5SXuwXr9jdkK4Qx
 x0Elwe8xmR05L5Xo9FV6OyKekPjD9mBPbFu74JOW/6AvCNz9qK1itY9bmw9cIY0tC6fq
 HIZQOk3QKuWRaQ5Kpc4iLYHRq0GpmHvryTU9t6e3t7BL7qNQoLLFfSDHvEqgLU3/2rd1
 jjCA==
X-Gm-Message-State: AAQBX9c1MT69dE3j+AJVxhOD07zkQal1FDSP9KyrmjZ99QbL9muqDM/o
 j783/vQmNBamtLCG0gNlgAcqCQ==
X-Google-Smtp-Source: AKy350ZzCZ14E5NfaFJ0SI72dL3JIxdxob6wdw+mLUt0Ndjj5vG/QcMr/VujghVWX0ix8v/9FShaCg==
X-Received: by 2002:a05:6870:63a1:b0:17e:99b9:c238 with SMTP id
 t33-20020a05687063a100b0017e99b9c238mr125158oap.18.1680804242226; 
 Thu, 06 Apr 2023 11:04:02 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:01 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 01/20] target/riscv: sync env->misa_ext* with cpu->cfg in
 realize()
Date: Thu,  6 Apr 2023 15:03:32 -0300
Message-Id: <20230406180351.570807-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 18:04:05 -0000

When riscv_cpu_realize() starts we're guaranteed to have cpu->cfg.ext_N
properties updated. The same can't be said about env->misa_ext*, since
the user might enable/disable MISA extensions in the command line, and
env->misa_ext* won't caught these changes. The current solution is to
sync everything at the end of validate_set_extensions(), checking every
cpu->cfg.ext_N value to do a set_misa() in the end.

The last change we're making in the MISA cfg flags are in the G
extension logic, enabling IMAFG if cpu->cfg_ext.g is enabled. Otherwise
we're not making any changes in MISA bits ever since realize() starts.

There's no reason to postpone misa_ext updates until the end of the
validation. Let's do it earlier, during realize(), in a new helper
called riscv_cpu_sync_misa_cfg(). If cpu->cfg.ext_g is enabled, do it
again by updating env->misa_ext* directly.

This is a pre-requisite to allow riscv_cpu_validate_set_extensions() to
use riscv_has_ext() instead of cpu->cfg.ext_N to validate the MISA
extensions, which is our end goal here.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 94 +++++++++++++++++++++++++++-------------------
 1 file changed, 56 insertions(+), 38 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cb68916fce..66de3bb33f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -811,12 +811,11 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 
 /*
  * Check consistency between chosen extensions while setting
- * cpu->cfg accordingly, doing a set_misa() in the end.
+ * cpu->cfg accordingly.
  */
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
-    uint32_t ext = 0;
 
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
@@ -831,6 +830,9 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_d = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
+
+        env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
+        env->misa_ext_mask = env->misa_ext;
     }
 
     if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
@@ -1022,39 +1024,8 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zksh = true;
     }
 
-    if (cpu->cfg.ext_i) {
-        ext |= RVI;
-    }
-    if (cpu->cfg.ext_e) {
-        ext |= RVE;
-    }
-    if (cpu->cfg.ext_m) {
-        ext |= RVM;
-    }
-    if (cpu->cfg.ext_a) {
-        ext |= RVA;
-    }
-    if (cpu->cfg.ext_f) {
-        ext |= RVF;
-    }
-    if (cpu->cfg.ext_d) {
-        ext |= RVD;
-    }
-    if (cpu->cfg.ext_c) {
-        ext |= RVC;
-    }
-    if (cpu->cfg.ext_s) {
-        ext |= RVS;
-    }
-    if (cpu->cfg.ext_u) {
-        ext |= RVU;
-    }
-    if (cpu->cfg.ext_h) {
-        ext |= RVH;
-    }
     if (cpu->cfg.ext_v) {
         int vext_version = VEXT_VERSION_1_00_0;
-        ext |= RVV;
         if (!is_power_of_2(cpu->cfg.vlen)) {
             error_setg(errp,
                        "Vector extension VLEN must be power of 2");
@@ -1092,11 +1063,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
         set_vext_version(env, vext_version);
     }
-    if (cpu->cfg.ext_j) {
-        ext |= RVJ;
-    }
-
-    set_misa(env, env->misa_mxl, ext);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -1181,6 +1147,50 @@ static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
 #endif
 }
 
+static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
+{
+    uint32_t ext = 0;
+
+    if (riscv_cpu_cfg(env)->ext_i) {
+        ext |= RVI;
+    }
+    if (riscv_cpu_cfg(env)->ext_e) {
+        ext |= RVE;
+    }
+    if (riscv_cpu_cfg(env)->ext_m) {
+        ext |= RVM;
+    }
+    if (riscv_cpu_cfg(env)->ext_a) {
+        ext |= RVA;
+    }
+    if (riscv_cpu_cfg(env)->ext_f) {
+        ext |= RVF;
+    }
+    if (riscv_cpu_cfg(env)->ext_d) {
+        ext |= RVD;
+    }
+    if (riscv_cpu_cfg(env)->ext_c) {
+        ext |= RVC;
+    }
+    if (riscv_cpu_cfg(env)->ext_s) {
+        ext |= RVS;
+    }
+    if (riscv_cpu_cfg(env)->ext_u) {
+        ext |= RVU;
+    }
+    if (riscv_cpu_cfg(env)->ext_h) {
+        ext |= RVH;
+    }
+    if (riscv_cpu_cfg(env)->ext_v) {
+        ext |= RVV;
+    }
+    if (riscv_cpu_cfg(env)->ext_j) {
+        ext |= RVJ;
+    }
+
+    env->misa_ext = env->misa_ext_mask = ext;
+}
+
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -1216,6 +1226,14 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_priv_version(env, priv_version);
     }
 
+    /*
+     * We can't be sure of whether we set defaults during cpu_init()
+     * or whether the user enabled/disabled some bits via cpu->cfg
+     * flags. Sync env->misa_ext with cpu->cfg now to allow us to
+     * use just env->misa_ext later.
+     */
+    riscv_cpu_sync_misa_cfg(env);
+
     /* Force disable extensions if priv spec version does not match */
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
         if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
-- 
2.39.2


