Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pa0GN-00086X-JJ
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 15:19:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GL-00086D-Gq
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:19:49 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GJ-0002Rc-SF
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:19:49 -0500
Received: by mail-oi1-x22a.google.com with SMTP id y184so13116324oiy.8
 for <qemu-riscv@nongnu.org>; Wed, 08 Mar 2023 12:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ULwmOEdWnWF+cKmfjxbMQCB8XtgNhk0EBmqOCSnzuZM=;
 b=Je8SCk1PfRvjJJUVlU4mehUf19+KInBGtK1B43fHHuh7dWaEKIhWPrYn2h4ILh6qyW
 przofU+xjOuXMU3PkPoto9HUuwOnMCP2k4BRSyT4YsM3yFh58iPI+LLMUlIbhA0wq9Ik
 jgQA0+FyodkD8L+Id52BR2dC0pnXYuUlkSYUQKme7zqn8T2tHPmzZ4dWmIMg02cUWJaw
 bFHIglTlbHhduLy7v7Aqj52JtVpW2iw0ZVBaXYF9b0KxQIQuGGs+V3BST+i7j30+1OX2
 eYGMPMTU5FbKDxCAsd/FDKYv3CRlMNWAqH8n1yTrjWsnjKqzkyE9vF3mJe0DVXpfgozf
 ygIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ULwmOEdWnWF+cKmfjxbMQCB8XtgNhk0EBmqOCSnzuZM=;
 b=t3xobw+hf2N3bZsBoYfgJGp9pLMAUn9q4ERB9hrPP4NyleT6pw8x7/2dLzXMuMI/Q1
 e9FhTk/+cGz8Vr9oDZmS0ReyNCUFB0+t7d6sumQIi1qlBIO0efkoaoI0hGa3NjmHGvz+
 n0jOJj2RzA0t3lX5u4R+DWiBMoCXvJBDu7nMoHMP8ThkVMYMxRr5A+8D+COlaTTnq78T
 jBsTYKCTR3U9oIEJp8CxYf4NmdMp8WNopCxPoMhvpP6+ye8gW/vKXd/xxUdewqSx3otd
 wdayE80zIQN9wVcDjMckhLbTuBvBm5IFGaJFE8BaeJ3fQvms46LlyXH7gdvoQRMVvLuv
 32ww==
X-Gm-Message-State: AO0yUKUUyJ3G+AAXEyZmlLUUUpZOd200OoeQOrxpzBv9jZzYPeJCXAb2
 2STbLBcdLDUKZdoHkPiP2SIgJr1ixeIqTaV/9AE=
X-Google-Smtp-Source: AK7set/FwRACjr5Qhkqjmrt0fuqClPdR0IowRC7Uz6NkYIBAIb3SRnDb/LEPshayWbIBwGyr9pcOfw==
X-Received: by 2002:aca:2311:0:b0:383:f4fb:be63 with SMTP id
 e17-20020aca2311000000b00383f4fbbe63mr7817519oie.37.1678306787206; 
 Wed, 08 Mar 2023 12:19:47 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:19:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 05/17] target/riscv/cpu.c: add
 riscv_cpu_validate_priv_spec()
Date: Wed,  8 Mar 2023 17:19:13 -0300
Message-Id: <20230308201925.258223-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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
X-List-Received-Date: Wed, 08 Mar 2023 20:19:49 -0000

Put all the env->priv_spec related validation into a helper to unclog
riscv_cpu_realize a bit.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 81 ++++++++++++++++++++++++++--------------------
 1 file changed, 46 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 62ef11180f..e15f829edc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -833,6 +833,48 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
     env->vext_ver = vext_version;
 }
 
+static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
+{
+    CPURISCVState *env = &cpu->env;
+    int i, priv_version = -1;
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
+    }
+
+    if (priv_version >= PRIV_VERSION_1_10_0) {
+        env->priv_ver = priv_version;
+    }
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
@@ -1130,7 +1172,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     CPUClass *cc = CPU_CLASS(mcc);
-    int i, priv_version = -1;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -1139,40 +1180,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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


