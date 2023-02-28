Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pX0Jk-0002Bh-0J
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 08:46:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pX0JW-0001bP-MU; Tue, 28 Feb 2023 08:46:49 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pX0It-00037J-Dc; Tue, 28 Feb 2023 08:46:05 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so9618628pja.5; 
 Tue, 28 Feb 2023 05:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=otWsX41iRsIY6OZPoyaUciarsaYd6KuMLFC54xyPvzM=;
 b=qkz+4107rXXKqFOoPazFXAhtJYyvT20rdtVXlIFxL03RIOblkYhsH5ZlkUgodg7ccP
 ygDJR8rIKyd1jqz62MXtOzrjupstQ2M4rwISVL7jIX/pMIFUk4HyGrqSEzdHW0qZfJ2t
 pFXKOLl6n2gqSqQf+YMV5Xri9bcGcxIGReTCQUwDvL38gGWIhsev0XGCRGb53YWQzFCv
 0JARY3BncCyY35BiPdLChZ7g+6LwpBXs2E3MOn1i/5fb+KGQGxhb/46zkHB3PlZrx3Xe
 p0KftybSNbTNH0p1Y4s1X9kAwMF9kZ8mkV7taHkbw+WSiXR8NAbyUIDwXYA0E94P1Wjt
 iLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=otWsX41iRsIY6OZPoyaUciarsaYd6KuMLFC54xyPvzM=;
 b=1MQUAHTCWXbj+5neWlRWH2dj755gqb4m2HZV2LjtB8VjbD3jg4jeOP19W76IkJC6eo
 YBDlvrmGkmVcVPVyNOEi+kx5tfUy3SbXChd401NpmDSUU/qgNEhTNR1ZG2e1kKwYc/TC
 Oafo7TtuvhEPECsShZOzqsAldzEIY30NVm8gmQpSCR58idQNtudwC18J/9WPb4isah5y
 o48F052YoJSXi+Usuod3h1F44193AKeYtoQDNQTRapngXvk7SIM1jVG78IItYuO91U3u
 x2E8GB8+P28L4+ZgIU6NlQ/QmE4qLFATRdinuwz0QE9jG//QqjQzM2iFp+gtinbpyXFE
 RWEA==
X-Gm-Message-State: AO0yUKWnA2CaJ3D40YXlosegMW5OCrxd0piNqllvIt11tmGm3722uG4o
 ZZ8yNXPp1e8BjrezpB3OLNih0bGJu0U=
X-Google-Smtp-Source: AK7set/FIeku3iwn1Y+Qd06xWiJl8ETWH5LWT29l3Arg+AegyZjpoL7sl076vtRw8acJ05fJpeVMUA==
X-Received: by 2002:a17:902:e886:b0:19a:ad2f:2df9 with SMTP id
 w6-20020a170902e88600b0019aad2f2df9mr3473933plg.55.1677591961327; 
 Tue, 28 Feb 2023 05:46:01 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a170902758200b0019b06263bcasm1556896pll.247.2023.02.28.05.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 05:46:00 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 18/18] target/riscv: Group all predicate() routines together
Date: Tue, 28 Feb 2023 21:45:35 +0800
Message-Id: <20230228104035.1879882-19-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228104035.1879882-1-bmeng@tinylab.org>
References: <20230228104035.1879882-13-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 28 Feb 2023 13:46:54 -0000

From: Bin Meng <bmeng@tinylab.org>

Move sstc()/sstc32() to where all predicate() routines live, and
smstateen_acc_ok() to near {read,write}_xenvcfg().

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---

Changes in v2:
- move smstateen_acc_ok() to near {read,write}_xenvcfg()

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
2.25.1


