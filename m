Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kyfoM-00052M-Ek
	for mharc-qemu-riscv@gnu.org; Sun, 10 Jan 2021 13:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kyfoH-0004rJ-AC; Sun, 10 Jan 2021 13:51:29 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:33137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kyfoA-0006gK-Js; Sun, 10 Jan 2021 13:51:29 -0500
Received: by mail-lf1-x12b.google.com with SMTP id v67so6438867lfa.0;
 Sun, 10 Jan 2021 10:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7A4giksgK8s1Qlgj/KOxjXxoNsti3jupobOBc29v77w=;
 b=awFPyW7qBa8JVtKoAwOuNCCrXgPlNC4Da74fMxNWWHbZwtKtgtFDhTO/ggIsZRb5b8
 pwnwItxwxDGtXjuLft/YfzDrwlrjOBRFw3RH6cjGrWnv0IJB50/2j5I1mR5xNjGymT5B
 /2FU6B64wMlsMf54XR3QHbJcaVwgCkYlKj2QZnmA4KRzASoxgoa27NESu6PWKgas/d7E
 1W6YYZrANFTGa+uPNc/+96j1C4e1lKtyZ1fsTmojqOR4Cc9pTvHIjUouTgcMrUDN6LUc
 ndr7ar4U+xxiiuBzdJjmfluUgodZZELhB8pC7zAiOV24jBFrydqfhFV5dIcH0qxk2/Ku
 W+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7A4giksgK8s1Qlgj/KOxjXxoNsti3jupobOBc29v77w=;
 b=G1dXq1eJtcAQNDl24CyqgnJgf1nxLVznx0fjOKRhhelOFJEf9IfqiSShT4nUPHuUvK
 JHaPe314MoFxcSjgNpnoDF9M6Hv8ZIcFeRLtRNchOPNLTzLZrSpgNOXDPTAfhuMvXih0
 uRutzz6fAri8n7nDo88/CmnrXNwKFMEslq//AqOn3GYovLYaElKzaQdl0z76oAbsJPP4
 96fDyzIZ6nOnAiH2zJYBohpy7NRi1eFwkfVA3hzUyW9Cju6lhbSh8LcxrKC6PfCP6Rzd
 HBXDsA+tZfmVHuh7Lr0fB/oPYfcb/X9EOQFoji9AjjzSmQJv2rr2hllYk4dFP9jZCnwV
 A7Fg==
X-Gm-Message-State: AOAM530nyTbrOEo8ebprLypv1ZbMHofZJYkTHl7PtF/5gOqy1vpd7Wqd
 26kubf9ypj0Dp4sSZPTEgTk=
X-Google-Smtp-Source: ABdhPJyhp1tgefN0SQHJlJ20o3RvqUoR8Ew8ktb/kBJQlQAZzxQwYFj4ikuDIYx2vojKumgl1juFHg==
X-Received: by 2002:a19:844b:: with SMTP id g72mr5412615lfd.7.1610304680622;
 Sun, 10 Jan 2021 10:51:20 -0800 (PST)
Received: from neptune.lab ([46.39.229.36])
 by smtp.googlemail.com with ESMTPSA id l1sm2795267lfk.201.2021.01.10.10.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 10:51:20 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v7 2/6] [RISCV_PM] Support CSRs required for RISC-V PM
 extension except for the ones required for hypervisor mode
Date: Sun, 10 Jan 2021 21:51:05 +0300
Message-Id: <20210110185109.29841-3-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Jan 2021 18:51:29 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/cpu.c      |   3 +
 target/riscv/cpu.h      |  12 ++
 target/riscv/cpu_bits.h |  66 ++++++++++
 target/riscv/csr.c      | 271 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 352 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8227d7aea9..d50f09b757 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -472,6 +472,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
+        if (cpu->cfg.ext_j) {
+            env->mmte |= PM_EXT_INITIAL;
+        }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d152842e37..37ea7f7802 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -234,6 +234,18 @@ struct CPURISCVState {
 
     /* True if in debugger mode.  */
     bool debugger;
+
+    /*
+     * CSRs for PM
+     * TODO: move these csr to appropriate groups
+     */
+    target_ulong mmte;
+    target_ulong mpmmask;
+    target_ulong mpmbase;
+    target_ulong spmmask;
+    target_ulong spmbase;
+    target_ulong upmmask;
+    target_ulong upmbase;
 #endif
 
     float_status fp_status;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index b41e8836c3..c92d0896aa 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -354,6 +354,21 @@
 #define CSR_MHPMCOUNTER30H  0xb9e
 #define CSR_MHPMCOUNTER31H  0xb9f
 
+/* Custom user register */
+#define CSR_UMTE            0x8c0
+#define CSR_UPMMASK         0x8c1
+#define CSR_UPMBASE         0x8c2
+
+/* Custom machine register */
+#define CSR_MMTE            0x7c0
+#define CSR_MPMMASK         0x7c1
+#define CSR_MPMBASE         0x7c2
+
+/* Custom supervisor register */
+#define CSR_SMTE            0x9c0
+#define CSR_SPMMASK         0x9c1
+#define CSR_SPMBASE         0x9c2
+
 /* Legacy Machine Protection and Translation (priv v1.9.1) */
 #define CSR_MBASE           0x380
 #define CSR_MBOUND          0x381
@@ -590,4 +605,55 @@
 #define MIE_UTIE                           (1 << IRQ_U_TIMER)
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
+
+/* general mte CSR bits*/
+#define PM_ENABLE       0x00000001ULL
+#define PM_CURRENT      0x00000002ULL
+#define PM_XS_MASK      0x00000003ULL
+
+/* PM XS bits values */
+#define PM_EXT_DISABLE  0x00000000ULL
+#define PM_EXT_INITIAL  0x00000001ULL
+#define PM_EXT_CLEAN    0x00000002ULL
+#define PM_EXT_DIRTY    0x00000003ULL
+
+/* offsets for every pair of control bits per each priv level */
+#define XS_OFFSET    0ULL
+#define U_OFFSET     2ULL
+#define S_OFFSET     4ULL
+#define M_OFFSET     6ULL
+
+#define PM_XS_BITS   (PM_XS_MASK << XS_OFFSET)
+#define U_PM_ENABLE  (PM_ENABLE  << U_OFFSET)
+#define U_PM_CURRENT (PM_CURRENT << U_OFFSET)
+#define S_PM_ENABLE  (PM_ENABLE  << S_OFFSET)
+#define S_PM_CURRENT (PM_CURRENT << S_OFFSET)
+#define M_PM_ENABLE  (PM_ENABLE  << M_OFFSET)
+
+/* mmte CSR bits */
+#define MMTE_PM_XS_BITS     PM_XS_BITS
+#define MMTE_U_PM_ENABLE    U_PM_ENABLE
+#define MMTE_U_PM_CURRENT   U_PM_CURRENT
+#define MMTE_S_PM_ENABLE    S_PM_ENABLE
+#define MMTE_S_PM_CURRENT   S_PM_CURRENT
+#define MMTE_M_PM_ENABLE    M_PM_ENABLE
+#define MMTE_MASK           (MMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | \
+                             MMTE_S_PM_ENABLE | MMTE_S_PM_CURRENT | \
+                             MMTE_M_PM_ENABLE | MMTE_PM_XS_BITS)
+
+/* smte CSR bits */
+#define SMTE_PM_XS_BITS     PM_XS_BITS
+#define SMTE_U_PM_ENABLE    U_PM_ENABLE
+#define SMTE_U_PM_CURRENT   U_PM_CURRENT
+#define SMTE_S_PM_ENABLE    S_PM_ENABLE
+#define SMTE_S_PM_CURRENT   S_PM_CURRENT
+#define SMTE_MASK           (SMTE_U_PM_ENABLE | SMTE_U_PM_CURRENT | \
+                             SMTE_S_PM_ENABLE | SMTE_S_PM_CURRENT | \
+                             SMTE_PM_XS_BITS)
+
+/* umte CSR bits */
+#define UMTE_U_PM_ENABLE    U_PM_ENABLE
+#define UMTE_U_PM_CURRENT   U_PM_CURRENT
+#define UMTE_MASK           (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT)
+
 #endif
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 10ab82ed1f..28a3eaf18d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -192,6 +192,11 @@ static int hmode32(CPURISCVState *env, int csrno)
 
 }
 
+static int umode(CPURISCVState *env, int csrno)
+{
+    return -!riscv_has_ext(env, RVU);
+}
+
 static int pmp(CPURISCVState *env, int csrno)
 {
     return -!riscv_feature(env, RISCV_FEATURE_PMP);
@@ -1270,6 +1275,257 @@ static int write_pmpaddr(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+/*
+ * Functions to access Pointer Masking feature registers
+ * We have to check if current priv lvl could modify
+ * csr in given mode
+ */
+static int check_pm_current_disabled(CPURISCVState *env, int csrno)
+{
+    int csr_priv = get_field(csrno, 0xC00);
+    /*
+     * If priv lvls differ that means we're accessing csr from higher priv lvl,
+     * so allow the access
+     */
+    if (env->priv != csr_priv) {
+        return 0;
+    }
+    int cur_bit_pos;
+    switch (env->priv) {
+    case PRV_M:
+        /* m-mode is always allowed to modify registers, so allow */
+        return 0;
+    case PRV_S:
+        cur_bit_pos = S_PM_CURRENT;
+        break;
+    case PRV_U:
+        cur_bit_pos = U_PM_CURRENT;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    int pm_current = get_field(env->mmte, cur_bit_pos);
+    /* It's same priv lvl, so we allow to modify csr only if pm_current==1 */
+    return !pm_current;
+}
+
+static int read_mmte(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        *val = 0;
+        return 0;
+    }
+    *val = env->mmte & MMTE_MASK;
+    return 0;
+}
+
+static int write_mmte(CPURISCVState *env, int csrno, target_ulong val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+    target_ulong wpri_val = val & MMTE_MASK;
+    if (val != wpri_val) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "MMTE: WPRI violation written 0x%lx vs expected 0x%lx\n",
+                      val, wpri_val);
+    }
+    env->mmte = val;
+    env->mstatus |= MSTATUS_XS | MSTATUS_SD;
+    env->mmte |= PM_EXT_DIRTY;
+    return 0;
+}
+
+static int read_smte(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        *val = 0;
+        return 0;
+    }
+    *val = env->mmte & SMTE_MASK;
+    return 0;
+}
+
+static int write_smte(CPURISCVState *env, int csrno, target_ulong val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+    target_ulong wpri_val = val & SMTE_MASK;
+    if (val != wpri_val) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SMTE: WPRI violation written 0x%lx vs expected 0x%lx\n",
+                      val, wpri_val);
+    }
+    if (check_pm_current_disabled(env, csrno)) {
+        return 0;
+    }
+    target_ulong new_val = val | (env->mmte & ~SMTE_MASK);
+    write_mmte(env, csrno, new_val);
+    return 0;
+}
+
+static int read_umte(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        *val = 0;
+        return 0;
+    }
+    *val = env->mmte & UMTE_MASK;
+    return 0;
+}
+
+static int write_umte(CPURISCVState *env, int csrno, target_ulong val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+    target_ulong wpri_val = val & UMTE_MASK;
+    if (val != wpri_val) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "UMTE: WPRI violation written 0x%lx vs expected 0x%lx\n",
+                      val, wpri_val);
+    }
+    if (check_pm_current_disabled(env, csrno)) {
+        return 0;
+    }
+    target_ulong new_val = val | (env->mmte & ~UMTE_MASK);
+    write_mmte(env, csrno, new_val);
+    return 0;
+}
+
+static int read_mpmmask(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+    *val = env->mpmmask;
+    return 0;
+}
+
+static int write_mpmmask(CPURISCVState *env, int csrno, target_ulong val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+    env->mpmmask = val;
+    env->mstatus |= MSTATUS_XS | MSTATUS_SD;
+    env->mmte |= PM_EXT_DIRTY;
+    return 0;
+}
+
+static int read_spmmask(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+    *val = env->spmmask;
+    return 0;
+}
+
+static int write_spmmask(CPURISCVState *env, int csrno, target_ulong val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+    if (check_pm_current_disabled(env, csrno)) {
+        return 0;
+    }
+    env->spmmask = val;
+    env->mstatus |= MSTATUS_XS | MSTATUS_SD;
+    env->mmte |= PM_EXT_DIRTY;
+    return 0;
+}
+
+static int read_upmmask(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+    *val = env->upmmask;
+    return 0;
+}
+
+static int write_upmmask(CPURISCVState *env, int csrno, target_ulong val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+    if (check_pm_current_disabled(env, csrno)) {
+        return 0;
+    }
+    env->upmmask = val;
+    env->mstatus |= MSTATUS_XS | MSTATUS_SD;
+    env->mmte |= PM_EXT_DIRTY;
+    return 0;
+}
+
+static int read_mpmbase(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+    *val = env->mpmbase;
+    return 0;
+}
+
+static int write_mpmbase(CPURISCVState *env, int csrno, target_ulong val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+    env->mpmbase = val;
+    env->mstatus |= MSTATUS_XS | MSTATUS_SD;
+    env->mmte |= PM_EXT_DIRTY;
+    return 0;
+}
+
+static int read_spmbase(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+    *val = env->spmbase;
+    return 0;
+}
+
+static int write_spmbase(CPURISCVState *env, int csrno, target_ulong val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+    if (check_pm_current_disabled(env, csrno)) {
+        return 0;
+    }
+    env->spmbase = val;
+    env->mstatus |= MSTATUS_XS | MSTATUS_SD;
+    env->mmte |= PM_EXT_DIRTY;
+    return 0;
+}
+
+static int read_upmbase(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+    *val = env->upmbase;
+    return 0;
+}
+
+static int write_upmbase(CPURISCVState *env, int csrno, target_ulong val)
+{
+    if (!riscv_has_ext(env, RVJ)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+    if (check_pm_current_disabled(env, csrno)) {
+        return 0;
+    }
+    env->upmbase = val;
+    env->mstatus |= MSTATUS_XS | MSTATUS_SD;
+    env->mmte |= PM_EXT_DIRTY;
+    return 0;
+}
+
 #endif
 
 /*
@@ -1481,6 +1737,21 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_PMPCFG0  ... CSR_PMPCFG3]   = { pmp,   read_pmpcfg,  write_pmpcfg   },
     [CSR_PMPADDR0 ... CSR_PMPADDR15] = { pmp,   read_pmpaddr, write_pmpaddr  },
 
+    /* User Pointer Masking */
+    [CSR_UMTE] =                { umode,  read_umte,        write_umte        },
+    [CSR_UPMMASK] =             { umode,  read_upmmask,     write_upmmask     },
+    [CSR_UPMBASE] =             { umode,  read_upmbase,     write_upmbase     },
+
+    /* Machine Pointer Masking */
+    [CSR_MMTE] =                { any,  read_mmte,        write_mmte        },
+    [CSR_MPMMASK] =             { any,  read_mpmmask,     write_mpmmask     },
+    [CSR_MPMBASE] =             { any,  read_mpmbase,     write_mpmbase     },
+
+    /* Supervisor Pointer Masking */
+    [CSR_SMTE] =                { smode, read_smte,        write_smte        },
+    [CSR_SPMMASK] =             { smode, read_spmmask,     write_spmmask     },
+    [CSR_SPMBASE] =             { smode, read_spmbase,     write_spmbase     },
+
     /* Performance Counters */
     [CSR_HPMCOUNTER3   ... CSR_HPMCOUNTER31] =    { ctr,  read_zero          },
     [CSR_MHPMCOUNTER3  ... CSR_MHPMCOUNTER31] =   { any,  read_zero          },
-- 
2.20.1


