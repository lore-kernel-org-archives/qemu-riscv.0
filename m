Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zl-0000Lq-0X
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zZ-0008Oo-44
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:17 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zX-00084V-DW
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:16 -0500
Received: by mail-pj1-x102f.google.com with SMTP id x34so1847001pjj.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832934;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HHuyOCh1zMm0s3QvDd4RzkwJUE9fBUpcK5wFEakP9Oo=;
 b=3qheq1kH2eYv2wGqvNGulyD4S30tGIzmK4iac6YR5tyhn141UMGHyQZ1LLH+SfGDPI
 T5wuu3j5jcs7GUPfQlrZFhNs9l8B9fHHlCfEo0EdBMHn6ui3AfCi4CGY6GUSEC528mQ1
 8AvBYNfN3x7CFwL/3W+LyPwKgcTEp+42cWDfTauBhMmwEFX68hc/9ojuMsdJEKYiTx/P
 8DAqlRfs74NnnRJzlvknMtmdod2fZJJF48cC/XxhiORVGL6EtF6b1t/DN6IJLgPbqWDr
 h7lw/VqHibBUTH2m18kUFd26/RDIBLplpuR4LcVXW3OjWT3/fP7bI3fxv2qLKJIjPfe7
 3ATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832934;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HHuyOCh1zMm0s3QvDd4RzkwJUE9fBUpcK5wFEakP9Oo=;
 b=v0rVoSnHByt+fi3XQ8UU6OnYY3p6tI/XZFotWHcPwyIkXl9D0ZvCHAaRTcOaCcs5Iu
 CtmbP4vxDJGuLnBO55hgDeubRlH/hk+k3AlyPDTTuwVqNLuuicjWQxOymWvBEsc3UeKd
 wekLSgaNakKmQqAWub5RSkvUiUOtp0QVrRe5MFtv9ZOXJa0KfmyBaEKUQ6oyZsfG3SiH
 NnqknIC+snfLJ1r2zVfg/DbilPvPoO2agZezUE2Sxoxw1AITDoGfj1lE1f56C5sFLvO0
 LImHk5tJ9lgHNN0DC4qxm375oc5CVCSX6TluPRjCnjrxQ7HcswKvlFO5XVylc2OvjR4t
 fMBw==
X-Gm-Message-State: AO0yUKXlzEmxtE3VywPl5V7fusUzJCtWRDNRZCDfwFNvoCLsN00rg5Bn
 lmjDQOlz+0r6TJ6T0R3Wpz7vo19g+/skQ6Ly
X-Google-Smtp-Source: AK7set/9x7yYM+Gy1hF4pgydKEL1ydN4Kw21W4tfchPbt1LldiG8Ggy45WX0Wl5SXUEa3OkMC3+WqA==
X-Received: by 2002:a17:90a:bc85:b0:237:aade:444 with SMTP id
 x5-20020a17090abc8500b00237aade0444mr819449pjr.42.1677832933952; 
 Fri, 03 Mar 2023 00:42:13 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 kj16-20020a17090306d000b0019a97f180fcsm983364plb.37.2023.03.03.00.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:13 -0800 (PST)
Subject: [PULL 42/59] target/riscv: Group all predicate() routines together
Date: Fri,  3 Mar 2023 00:37:23 -0800
Message-Id: <20230303083740.12817-43-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:18 -0000

From: Bin Meng <bmeng@tinylab.org>

Move sstc()/sstc32() to where all predicate() routines live, and
smstateen_acc_ok() to near {read,write}_xenvcfg().

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <20230228104035.1879882-19-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 177 ++++++++++++++++++++++-----------------------
 1 file changed, 87 insertions(+), 90 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 785f6f4d45..3a7e0217e2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -40,42 +40,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
     csr_ops[csrno & (CSR_TABLE_SIZE - 1)] = *ops;
 }
 
-/* Predicates */
-#if !defined(CONFIG_USER_ONLY)
-static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
-                                       uint64_t bit)
-{
-    bool virt = riscv_cpu_virt_enabled(env);
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
-        return RISCV_EXCP_NONE;
-    }
-
-    if (!(env->mstateen[index] & bit)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    if (virt) {
-        if (!(env->hstateen[index] & bit)) {
-            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-        }
-
-        if (env->priv == PRV_U && !(env->sstateen[index] & bit)) {
-            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-        }
-    }
-
-    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
-        if (!(env->sstateen[index] & bit)) {
-            return RISCV_EXCP_ILLEGAL_INST;
-        }
-    }
-
-    return RISCV_EXCP_NONE;
-}
-#endif
-
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -399,6 +363,60 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException sstc(CPURISCVState *env, int csrno)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    bool hmode_check = false;
+
+    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
+        hmode_check = true;
+    }
+
+    RISCVException ret = hmode_check ? hmode(env, csrno) : smode(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
+    if (env->priv == PRV_M) {
+        return RISCV_EXCP_NONE;
+    }
+
+    /*
+     * No need of separate function for rv32 as menvcfg stores both menvcfg
+     * menvcfgh for RV32.
+     */
+    if (!(get_field(env->mcounteren, COUNTEREN_TM) &&
+          get_field(env->menvcfg, MENVCFG_STCE))) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (riscv_cpu_virt_enabled(env)) {
+        if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
+              get_field(env->henvcfg, HENVCFG_STCE))) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException sstc_32(CPURISCVState *env, int csrno)
+{
+    if (riscv_cpu_mxl(env) != MXL_RV32) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return sstc(env, csrno);
+}
+
 /* Checks if PointerMasking registers could be accessed */
 static RISCVException pointer_masking(CPURISCVState *env, int csrno)
 {
@@ -943,60 +961,6 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException sstc(CPURISCVState *env, int csrno)
-{
-    RISCVCPU *cpu = env_archcpu(env);
-    bool hmode_check = false;
-
-    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
-        hmode_check = true;
-    }
-
-    RISCVException ret = hmode_check ? hmode(env, csrno) : smode(env, csrno);
-    if (ret != RISCV_EXCP_NONE) {
-        return ret;
-    }
-
-    if (env->debugger) {
-        return RISCV_EXCP_NONE;
-    }
-
-    if (env->priv == PRV_M) {
-        return RISCV_EXCP_NONE;
-    }
-
-    /*
-     * No need of separate function for rv32 as menvcfg stores both menvcfg
-     * menvcfgh for RV32.
-     */
-    if (!(get_field(env->mcounteren, COUNTEREN_TM) &&
-          get_field(env->menvcfg, MENVCFG_STCE))) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    if (riscv_cpu_virt_enabled(env)) {
-        if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
-              get_field(env->henvcfg, HENVCFG_STCE))) {
-            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-        }
-    }
-
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException sstc_32(CPURISCVState *env, int csrno)
-{
-    if (riscv_cpu_mxl(env) != MXL_RV32) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
-    return sstc(env, csrno);
-}
-
 static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
                                      target_ulong *val)
 {
@@ -1944,6 +1908,39 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
+                                       uint64_t bit)
+{
+    bool virt = riscv_cpu_virt_enabled(env);
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_NONE;
+    }
+
+    if (!(env->mstateen[index] & bit)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (virt) {
+        if (!(env->hstateen[index] & bit)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+
+        if (env->priv == PRV_U && !(env->sstateen[index] & bit)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+    }
+
+    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
+        if (!(env->sstateen[index] & bit)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
-- 
2.39.2


