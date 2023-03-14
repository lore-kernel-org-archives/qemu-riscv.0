Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7qc-0005K5-R3
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qa-0005JF-QD
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:00 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qY-0002ba-7m
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:00 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 f19-20020a9d5f13000000b00693ce5a2f3eso8741909oti.8
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NyW3QIKPbWEcW/stEjEFae0dbXr8H0CnZzp+jGMhTkc=;
 b=nkVzHaXNH+WPq0G9E8kSvrpNkqRDbEs8Yn2Gg3/9DdTl0pJWrnXZq0XddA1rPwsnzD
 KvtiH6F1cN1SA+WGFQNqYCol+XDJot8rwpFjk9tNzkYJMa8xKHtQdg8EM6lZ6pbdqhcO
 lntKCGdkPTfJaCjyZ0aTMzw5IQCy7axz05+rFhA04tbFs9P9WSrD/9n4MBmCw5Z5s4Sl
 jtGxFFDFqCCbWTrfiM389d0YZ2xAmcSGgy45FEpXtdRHAZApiTXXR7gqwZBEEpfhBxmU
 UJPK3W9KgzSorssBq0co1aIY19r+2Cc8uE35v0+FA2GRLH0vjhbGtnF+H/yff4aaLair
 LbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NyW3QIKPbWEcW/stEjEFae0dbXr8H0CnZzp+jGMhTkc=;
 b=ZdZemfXEayb2aUWVg3+PwrLuIqKw8U2F7pt00/1yuV5aoCBLcOf3yBnAlLnPgNEMRZ
 b1efl8eq8+jPhcwJlMRkHIcaEy+0T8Q5NReubgcE5RoAaojsiZk/bFB5hAAm4eoRLgV8
 JamC+d0Cecp0kqw/pD2LL92n/fjQOiWqoOeKMZGvGljGOWBxACOp6NGdu2/Swi1cIA/S
 yZEAkhm/R9rXrIb+mKbC88HmNNvB7wFMYNkwWC+uW25VHxe5pvfGB2FDuIuk1/MNjstV
 tyctWsSDpAREU82sZFLKOUe5e+wMWgrd42WplzC7PEaVzgBZCqfX13ypJqe/kFA5gLMz
 zfwg==
X-Gm-Message-State: AO0yUKWB6TJPoUnylr8Ykb+ZMYAhTplkukVZ9J7o7t6KLR7XAlX9gSym
 ULlRl86rsoE3IErKIBnLeY0BSw==
X-Google-Smtp-Source: AK7set+buopGjvfnI0LCaYBcusEjiyI3j0uTGcu5FQrBcbpkMR6J6S8VpLBZLR6XzN15qv71LoUxDw==
X-Received: by 2002:a9d:153:0:b0:697:ef66:e7f4 with SMTP id
 77-20020a9d0153000000b00697ef66e7f4mr1169965otu.24.1678812597154; 
 Tue, 14 Mar 2023 09:49:57 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:49:56 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 01/26] target/riscv/cpu.c: add
 riscv_cpu_validate_v()
Date: Tue, 14 Mar 2023 13:49:23 -0300
Message-Id: <20230314164948.539135-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:50:01 -0000

The RVV verification will error out if fails and it's being done at the
end of riscv_cpu_validate_set_extensions(). Let's put it in its own
function and do it earlier.

We'll move it out of riscv_cpu_validate_set_extensions() in the near future,
but for now this is enough to clean the code a bit.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 86 ++++++++++++++++++++++++++--------------------
 1 file changed, 49 insertions(+), 37 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e97473af2..18591aa53a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -802,6 +802,46 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     }
 }
 
+static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
+                                 Error **errp)
+{
+    int vext_version = VEXT_VERSION_1_00_0;
+
+    if (!is_power_of_2(cfg->vlen)) {
+        error_setg(errp, "Vector extension VLEN must be power of 2");
+        return;
+    }
+    if (cfg->vlen > RV_VLEN_MAX || cfg->vlen < 128) {
+        error_setg(errp,
+                   "Vector extension implementation only supports VLEN "
+                   "in the range [128, %d]", RV_VLEN_MAX);
+        return;
+    }
+    if (!is_power_of_2(cfg->elen)) {
+        error_setg(errp, "Vector extension ELEN must be power of 2");
+        return;
+    }
+    if (cfg->elen > 64 || cfg->elen < 8) {
+        error_setg(errp,
+                   "Vector extension implementation only supports ELEN "
+                   "in the range [8, 64]");
+        return;
+    }
+    if (cfg->vext_spec) {
+        if (!g_strcmp0(cfg->vext_spec, "v1.0")) {
+            vext_version = VEXT_VERSION_1_00_0;
+        } else {
+            error_setg(errp, "Unsupported vector spec version '%s'",
+                       cfg->vext_spec);
+            return;
+        }
+    } else {
+        qemu_log("vector version is not specified, "
+                 "use the default value v1.0\n");
+    }
+    set_vext_version(env, vext_version);
+}
+
 /*
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly, doing a set_misa() in the end.
@@ -809,6 +849,7 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
     uint32_t ext = 0;
 
     /* Do some ISA extension error checking */
@@ -939,6 +980,14 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
     }
 
+    if (cpu->cfg.ext_v) {
+        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
@@ -993,44 +1042,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         ext |= RVH;
     }
     if (cpu->cfg.ext_v) {
-        int vext_version = VEXT_VERSION_1_00_0;
         ext |= RVV;
-        if (!is_power_of_2(cpu->cfg.vlen)) {
-            error_setg(errp,
-                       "Vector extension VLEN must be power of 2");
-            return;
-        }
-        if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
-            error_setg(errp,
-                       "Vector extension implementation only supports VLEN "
-                       "in the range [128, %d]", RV_VLEN_MAX);
-            return;
-        }
-        if (!is_power_of_2(cpu->cfg.elen)) {
-            error_setg(errp,
-                       "Vector extension ELEN must be power of 2");
-            return;
-        }
-        if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
-            error_setg(errp,
-                       "Vector extension implementation only supports ELEN "
-                       "in the range [8, 64]");
-            return;
-        }
-        if (cpu->cfg.vext_spec) {
-            if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
-                vext_version = VEXT_VERSION_1_00_0;
-            } else {
-                error_setg(errp,
-                           "Unsupported vector spec version '%s'",
-                           cpu->cfg.vext_spec);
-                return;
-            }
-        } else {
-            qemu_log("vector version is not specified, "
-                     "use the default value v1.0\n");
-        }
-        set_vext_version(env, vext_version);
     }
     if (cpu->cfg.ext_j) {
         ext |= RVJ;
-- 
2.39.2


