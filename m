Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYt5g-0008KQ-6W
	for mharc-qemu-riscv@gnu.org; Mon, 28 Mar 2022 13:23:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nYt5e-0008Es-I4
 for qemu-riscv@nongnu.org; Mon, 28 Mar 2022 13:23:38 -0400
Received: from [2607:f8b0:4864:20::42c] (port=44600
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nYt5c-00033Y-2g
 for qemu-riscv@nongnu.org; Mon, 28 Mar 2022 13:23:38 -0400
Received: by mail-pf1-x42c.google.com with SMTP id w7so10623972pfu.11
 for <qemu-riscv@nongnu.org>; Mon, 28 Mar 2022 10:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qKbYbS6yVnzI3TB0TfHI/CcS8OZcbf69ROzh6fJumgI=;
 b=eDS3PyDQPbGYIJApQgSWDomjbgk5TFh2akUFAVMI8u77deiIUx4YkargsGjALV3MYt
 8/XYXAa6oMzNqpRzCzx6TMQYL96aCrjaxJkObwyPyOdX5QcFCj1Xf9af/VmyVhYe2M24
 QS8Coe1uBhqD95yqT6Ra20u5GgwUjuDYklznl/HryfEkitfUhJMji2sSwCqUNkwVCOlk
 FS5RCT7NhixGDu4kmSbC0NTH9lNHrRq5KK2XQKqB5ggqdJURyTtnLM2bG6nnd/d2PDXr
 C1VtzUXy4q5p4Zq2xk0K6j+ykmg1jkTahmQyPn/GryeuZsBzc/xWDcaUXGxjVzKu76wI
 VYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qKbYbS6yVnzI3TB0TfHI/CcS8OZcbf69ROzh6fJumgI=;
 b=RB2FnKNaFDTE+11II6R/UOR7S+Z8n2sFwUTmybbGBDnVvzjo3QVgofH2kq5bfJ+HGB
 WGnKgxaaI/vgbqC06yT3B8ScxNcz4H9mZFw4/6x86SiV1c/YUrIQk4vULGrPm9pnFOOb
 b/pH1Wkx6mwTU/WUfmc/N4/Q4dEJWnUF6C/GsLOmUkJDxpPaLzol7ZQ4RA3qy4ws7S2c
 djrcoUOFYhPbuI3lmpq0kTSNdV8vis3EMQil3T6n4ut+K9LbM1VMP6Kh7G3kjMDcH1ah
 lWAXOMJw0ucjnbPBA5JBf9tpjI+Cc7CWd9QMDx/gOp5HSCKYRSIIjabqmF2zKwbySYUw
 8B6A==
X-Gm-Message-State: AOAM533A2nOW69cuVj9eJ4APzoawYF9WrqfN2dkk4X5g8XHp7xpc5Ueh
 qgcyaO6pKn3V1ebX68cN2BQspA==
X-Google-Smtp-Source: ABdhPJwqY6PA//m7IFAPS1+UHbL6wybKTek3+Zbf5mKypzUDUt1xT/90mqLPxWcBxkhTv888MI4N5w==
X-Received: by 2002:a65:530b:0:b0:382:b21d:82eb with SMTP id
 m11-20020a65530b000000b00382b21d82ebmr11064236pgq.215.1648488214268; 
 Mon, 28 Mar 2022 10:23:34 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.204.174])
 by smtp.googlemail.com with ESMTPSA id
 132-20020a62168a000000b004f40e8b3133sm17802504pfw.188.2022.03.28.10.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 10:23:33 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v3 2/4] target/riscv: smstateen check for h/senvcfg
Date: Mon, 28 Mar 2022 22:53:17 +0530
Message-Id: <20220328172319.6802-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220328172319.6802-1-mchitale@ventanamicro.com>
References: <20220328172319.6802-1-mchitale@ventanamicro.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 28 Mar 2022 17:23:38 -0000

Accesses to henvcfg, henvcfgh and senvcfg are allowed
only if corresponding bit in mstateen0/hstateen0 is
enabled. Otherwise an illegal instruction trap is
generated.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 82 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 6 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e3dafc37ef..dda254a6c9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -37,6 +37,35 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 }
 
 /* Predicates */
+static RISCVException smstateen_acc_ok(CPURISCVState *env, int mode, int bit)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    bool virt = riscv_cpu_virt_enabled(env);
+
+    if (!cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_NONE;
+    }
+
+    if (!(env->mstateen[0] & (1UL << bit))) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (virt) {
+        if (!(env->hstateen[0] & (1UL << bit))) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+    }
+
+    if (mode == PRV_U) {
+        if (!(env->sstateen[0] & (1UL << bit))) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -1476,6 +1505,13 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
 static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->senvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1484,15 +1520,27 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
+    RISCVException ret;
 
-    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
+    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->henvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1501,6 +1549,12 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= HENVCFG_PBMTE | HENVCFG_STCE;
@@ -1514,6 +1568,13 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
 static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->henvcfg >> 32;
     return RISCV_EXCP_NONE;
 }
@@ -1523,9 +1584,14 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
 {
     uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
     uint64_t valh = (uint64_t)val << 32;
+    RISCVException ret;
 
-    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
+    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
     return RISCV_EXCP_NONE;
 }
 
@@ -1547,7 +1613,8 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
                                      target_ulong new_val)
 {
     uint64_t *reg;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->mstateen[csrno - CSR_MSTATEEN0];
     write_smstateen(env, reg, wr_mask, new_val);
@@ -1568,7 +1635,8 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
 {
     uint64_t *reg;
     uint64_t val;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
     val = (uint64_t)new_val << 32;
@@ -1590,7 +1658,8 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
                                      target_ulong new_val)
 {
     uint64_t *reg;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
     int index = csrno - CSR_HSTATEEN0;
 
     reg = &env->hstateen[index];
@@ -1613,8 +1682,9 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
 {
     uint64_t *reg;
     uint64_t val;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
     int index = csrno - CSR_HSTATEEN0H;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->hstateen[index];
     val = (uint64_t)new_val << 32;
-- 
2.17.1


