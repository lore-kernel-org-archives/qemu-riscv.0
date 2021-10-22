Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdz8j-000895-Rs
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 14:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8g-00080P-0S; Fri, 22 Oct 2021 14:19:34 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8X-0004pn-Og; Fri, 22 Oct 2021 14:19:33 -0400
Received: by mail-ed1-x532.google.com with SMTP id e19so6225989edy.0;
 Fri, 22 Oct 2021 11:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cAmldUoEpPcC4HenWOihfDWUBavqSyPrf2Sp13AoIAQ=;
 b=Pz2P9lVl9CPYADISV3WMWsrJrYxvUFmmP/6tHvtpYGeaVD5dUFexJgjQshFGYts5SC
 B01P3sn8zmDVASsWS3vXI7Fl+bkr4vO6P+Jhk4cd3cFp7QtFCzxR6bjI1eiVTk8wA7u0
 VnCY0/tphlUkb8apmwqn0mkGbnM5oDpAySuP71djV4axSTtevClz+iABHqJ8m3q5+7fw
 RuogiOcocyQQF2Zspd97L2EvWAPk0qca3g1lPTcskKBAslfQQpv/2b6Ur+J8mUf0am/s
 gq7/sTPcJUphFGwrpPfoJsyBKkTJ/ZEiau4pKIOME3GIVrXvlRHd9b/YIjnqjO6DyOtj
 SxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cAmldUoEpPcC4HenWOihfDWUBavqSyPrf2Sp13AoIAQ=;
 b=NOEBw5X7B4LAFQ3QEQPmvGNH50zPAXfOuMNEsgcmfGQh5nr595fHiIybjteCTEeHZK
 lc2s/Wtjaj5W6wc2LStCVc3iXFPVaRYsWVyGguMaBuCoh9cqZvZCqRlrCbsRu/4f5YbC
 da8IqLkrgTNFvecuG8s6yNRo4GwUhKCT7SgPNwafa4PRy2vcWZlhH2zSffc4AnJyZVnp
 ZijT7QiWIF77Zi/gSgbcWaytCx0S97Tx5X93P+/zU5GK6exRnPVtws0gqCuNGsK1HQJv
 tZfXDUD/20g2Cn7LSJJ8vVXoYtLWNs2yLiolasGe8QGqjh3tK50oS/WRvesOgUGuvGN0
 sULQ==
X-Gm-Message-State: AOAM531jdHkYclxggnUJum0G6jo/N7ngEPTDDHbBByke7NqRNe8z364N
 6J9xNZR/m3doQMqgjYwtFDM=
X-Google-Smtp-Source: ABdhPJz/5bCGSJcXcAOGc6kPq6J6pDR0TW8/nsBm7T8qDip4pPP5WdMoBNdGFTxf1aF9trW+hifF0A==
X-Received: by 2002:a17:907:3e8a:: with SMTP id
 hs10mr1346719ejc.497.1634926763801; 
 Fri, 22 Oct 2021 11:19:23 -0700 (PDT)
Received: from neptune.lab ([46.39.229.76])
 by smtp.googlemail.com with ESMTPSA id p22sm4233079ejl.90.2021.10.22.11.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 11:19:23 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v16 3/8] [RISCV_PM] Support CSRs required for RISC-V PM
 extension except for the h-mode
Date: Fri, 22 Oct 2021 21:19:05 +0300
Message-Id: <20211022181910.1999197-4-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
References: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Fri, 22 Oct 2021 18:19:34 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c |   2 +
 target/riscv/cpu.h |  11 ++
 target/riscv/csr.c | 285 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 298 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 788fa0b11c..6b767a4a0b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -367,6 +367,8 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->mcause = 0;
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
+    /* mmte is supposed to have pm.current hardwired to 1 */
+    env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
     cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1cfc6a53a0..b2422e3f99 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -238,6 +238,17 @@ struct CPURISCVState {
 
     /* True if in debugger mode.  */
     bool debugger;
+
+    /*
+     * CSRs for PointerMasking extension
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
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 69e4d65fcd..7dd7bb7fbf 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -192,6 +192,16 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
 
 }
 
+/* Checks if PointerMasking registers could be accessed */
+static RISCVException pointer_masking(CPURISCVState *env, int csrno)
+{
+    /* Check if j-ext is present */
+    if (riscv_has_ext(env, RVJ)) {
+        return RISCV_EXCP_NONE;
+    }
+    return RISCV_EXCP_ILLEGAL_INST;
+}
+
 static RISCVException pmp(CPURISCVState *env, int csrno)
 {
     if (riscv_feature(env, RISCV_FEATURE_PMP)) {
@@ -1425,6 +1435,268 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+/*
+ * Functions to access Pointer Masking feature registers
+ * We have to check if current priv lvl could modify
+ * csr in given mode
+ */
+static bool check_pm_current_disabled(CPURISCVState *env, int csrno)
+{
+    int csr_priv = get_field(csrno, 0x300);
+    int pm_current;
+
+    /*
+     * If priv lvls differ that means we're accessing csr from higher priv lvl,
+     * so allow the access
+     */
+    if (env->priv != csr_priv) {
+        return false;
+    }
+    switch (env->priv) {
+    case PRV_M:
+        pm_current = get_field(env->mmte, M_PM_CURRENT);
+        break;
+    case PRV_S:
+        pm_current = get_field(env->mmte, S_PM_CURRENT);
+        break;
+    case PRV_U:
+        pm_current = get_field(env->mmte, U_PM_CURRENT);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    /* It's same priv lvl, so we allow to modify csr only if pm.current==1 */
+    return !pm_current;
+}
+
+static RISCVException read_mmte(CPURISCVState *env, int csrno,
+                                target_ulong *val)
+{
+    *val = env->mmte & MMTE_MASK;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mmte(CPURISCVState *env, int csrno,
+                                 target_ulong val)
+{
+    uint64_t mstatus;
+    target_ulong wpri_val = val & MMTE_MASK;
+
+    if (val != wpri_val) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "MMTE: WPRI violation written 0x%lx vs expected 0x%lx\n",
+                      val, wpri_val);
+    }
+    /* for machine mode pm.current is hardwired to 1 */
+    wpri_val |= MMTE_M_PM_CURRENT;
+
+    /* hardwiring pm.instruction bit to 0, since it's not supported yet */
+    wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
+    env->mmte = wpri_val | PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus = env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_smte(CPURISCVState *env, int csrno,
+                                target_ulong *val)
+{
+    *val = env->mmte & SMTE_MASK;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_smte(CPURISCVState *env, int csrno,
+                                 target_ulong val)
+{
+    target_ulong wpri_val = val & SMTE_MASK;
+
+    if (val != wpri_val) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SMTE: WPRI violation written 0x%lx vs expected 0x%lx\n",
+                      val, wpri_val);
+    }
+
+    /* if pm.current==0 we can't modify current PM CSRs */
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    wpri_val |= (env->mmte & ~SMTE_MASK);
+    write_mmte(env, csrno, wpri_val);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_umte(CPURISCVState *env, int csrno,
+                                target_ulong *val)
+{
+    *val = env->mmte & UMTE_MASK;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_umte(CPURISCVState *env, int csrno,
+                                 target_ulong val)
+{
+    target_ulong wpri_val = val & UMTE_MASK;
+
+    if (val != wpri_val) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "UMTE: WPRI violation written 0x%lx vs expected 0x%lx\n",
+                      val, wpri_val);
+    }
+
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    wpri_val |= (env->mmte & ~UMTE_MASK);
+    write_mmte(env, csrno, wpri_val);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_mpmmask(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->mpmmask;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    env->mpmmask = val;
+    env->mmte |= PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus = env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_spmmask(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->spmmask;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_spmmask(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    /* if pm.current==0 we can't modify current PM CSRs */
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+    env->spmmask = val;
+    env->mmte |= PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus = env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_upmmask(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->upmmask;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_upmmask(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    /* if pm.current==0 we can't modify current PM CSRs */
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+    env->upmmask = val;
+    env->mmte |= PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus = env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_mpmbase(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->mpmbase;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    env->mpmbase = val;
+    env->mmte |= PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus = env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_spmbase(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->spmbase;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_spmbase(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    /* if pm.current==0 we can't modify current PM CSRs */
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+    env->spmbase = val;
+    env->mmte |= PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus = env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_upmbase(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->upmbase;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_upmbase(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    /* if pm.current==0 we can't modify current PM CSRs */
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+    env->upmbase = val;
+    env->mmte |= PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus = env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
 #endif
 
 /*
@@ -1659,6 +1931,19 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_PMPADDR14] =  { "pmpaddr14", pmp, read_pmpaddr, write_pmpaddr },
     [CSR_PMPADDR15] =  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
 
+    /* User Pointer Masking */
+    [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,    write_umte    },
+    [CSR_UPMMASK] =    { "upmmask", pointer_masking, read_upmmask, write_upmmask },
+    [CSR_UPMBASE] =    { "upmbase", pointer_masking, read_upmbase, write_upmbase },
+    /* Machine Pointer Masking */
+    [CSR_MMTE]    =    { "mmte",    pointer_masking, read_mmte,    write_mmte    },
+    [CSR_MPMMASK] =    { "mpmmask", pointer_masking, read_mpmmask, write_mpmmask },
+    [CSR_MPMBASE] =    { "mpmbase", pointer_masking, read_mpmbase, write_mpmbase },
+    /* Supervisor Pointer Masking */
+    [CSR_SMTE]    =    { "smte",    pointer_masking, read_smte,    write_smte    },
+    [CSR_SPMMASK] =    { "spmmask", pointer_masking, read_spmmask, write_spmmask },
+    [CSR_SPMBASE] =    { "spmbase", pointer_masking, read_spmbase, write_spmbase },
+
     /* Performance Counters */
     [CSR_HPMCOUNTER3]    = { "hpmcounter3",    ctr,    read_zero },
     [CSR_HPMCOUNTER4]    = { "hpmcounter4",    ctr,    read_zero },
-- 
2.30.2


