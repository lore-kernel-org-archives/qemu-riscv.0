Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQ0Ly-0000uE-NA
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 01:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Lx-0000tb-Bn
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:24:17 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Lv-0007wU-0o
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:24:17 -0500
Received: by mail-pg1-x533.google.com with SMTP id a23so908258pga.13
 for <qemu-riscv@nongnu.org>; Wed, 08 Feb 2023 22:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OjYZ/J+fuGuBPvfefUWdX1uo98embzdFhANJFdid3iE=;
 b=D1m2PIZdQFxaK4YL89yJbVRbRoXJlZb+A71KZo1rm32oTXp5QK0nC/VC2EBMp3b2UD
 b1dhdYZaOIIeGPghyxnCpYDw+mW7V7xTt6bnmnapOz8QkCVPgNFfJRkc/Z6TT5BnHx6Y
 sXBTtG7BTpY62q4BCPmKcqe6TYsIspxn7iGlC4oGGn3c2SUOXpmkIVM9eZSHcLvKyLec
 7IcIU0mqoyTBBYctjitsPYlx/VwhUvyat40GnMkNjZWw/GqpFGrrf33bp8PbKPxggunE
 zGFEAnQyAwX5Ey3VZDZVPD02Cf5Ofa4FWlp7dFxioKyPZXroLbFKC3WA/DwQr2u/YLSi
 bdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OjYZ/J+fuGuBPvfefUWdX1uo98embzdFhANJFdid3iE=;
 b=MXV+NxvAeP/4kJghVQXiQ4wIa75yJa25zpK2Su4a7mjKnnBeOqghEJ5vaSYdR58PJi
 XNcCa4DNp94HwtnzFyylT1dnqlX4iyZRXA21Brf01E0AK0pVxDNKaydJNwRfjqATPSUc
 UuweLpVJ6XA8pUotAQx3GJ1FYkD2LyS+w1lFwirfkOGQCK63D8tLvvSsncL4Yn3ksZQt
 SMYbfLIz60sSRneIo/FVATCYlYwM2iDxXASRVRnyNS2znLixchKvLJ9xycy3ysCVUFKp
 hkMWQGQ9RSKZuKDWKVqK/EZ7ZsmOVwAZAt5+Myf8teksBzkA9JRDqEEHkuaY+VIIYObR
 nkcw==
X-Gm-Message-State: AO0yUKVSEDNPVtJfOeNo5NG626BlqvNudhncjBx5zPYjeRrIZOVf1ZvJ
 7TTIvCkpi7j+VUUyqdnbMgGgtg==
X-Google-Smtp-Source: AK7set8M+6oK86xHcbT+lPZin/xaEJYr7J6xRHwKPQwVG32h7agvsvlmihBwYzB+2m1NmjoKsXloiQ==
X-Received: by 2002:a62:1d44:0:b0:5a8:4c9d:6237 with SMTP id
 d65-20020a621d44000000b005a84c9d6237mr2937462pfd.21.1675923853549; 
 Wed, 08 Feb 2023 22:24:13 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7800e000000b00571cdbd0771sm521919pfi.102.2023.02.08.22.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:24:13 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v1 RFC Zisslpcfi 3/9] target/riscv: implements CSRs and new
 bits in existing CSRs in zisslpcfi
Date: Wed,  8 Feb 2023 22:23:58 -0800
Message-Id: <20230209062404.3582018-4-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209062404.3582018-1-debug@rivosinc.com>
References: <20230209062404.3582018-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Thu, 09 Feb 2023 06:24:17 -0000

CSR_SSP and CSR_LPLR are new CSR additions to cpu/hart. This patch allows
access to these CSRs. A predicate routine handles access to these CSR as
per specification.

This patch also implments new bit definitions in menvcfg/henvcfg/mstatus/
sstatus CSRs to master enabled cfi and enable forward cfi in S and M mode.
mstatus CSR holds forward and backward cfi enabling for U mode.

There is no enabling bit for backward cfi in S and M mode. It is always
enabled if extension is implemented by CPU.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Kip Walker  <kip@rivosinc.com>
---
 target/riscv/csr.c | 137 ++++++++++++++++++++++++++++++++++++++++++++-
 target/riscv/pmp.c |   9 +++
 2 files changed, 145 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0db2c233e5..24e208ebed 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -163,6 +163,50 @@ static RISCVException ctr32(CPURISCVState *env, int csrno)
     return ctr(env, csrno);
 }
 
+static RISCVException cfi(CPURISCVState *env, int csrno)
+{
+    /* no cfi extension */
+    if (!env_archcpu(env)->cfg.ext_cfi) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+    /*
+     * CONFIG_USER_MODE always allow access for now. Better for user mode only
+     * functionality
+     */
+#if !defined(CONFIG_USER_ONLY)
+    /* current priv not M */
+    if (env->priv != PRV_M) {
+        /* menvcfg says no CFI */
+        if (!get_field(env->menvcfg, MENVCFG_CFI)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+
+        /* V = 1 and henvcfg says no CFI. raise virtual instr fault */
+        if (riscv_cpu_virt_enabled(env) &&
+            !get_field(env->henvcfg, HENVCFG_CFI)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+
+        /*
+         * LPLR and SSP are not accessible to U mode if disabled via status
+         * CSR
+         */
+        if (env->priv == PRV_U) {
+            if (csrno == CSR_LPLR &&
+                !get_field(env->mstatus, MSTATUS_UFCFIEN)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            if (csrno == CSR_SSP &&
+                !get_field(env->mstatus, MSTATUS_UBCFIEN)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+        }
+    }
+#endif
+
+    return RISCV_EXCP_NONE;
+}
+
 #if !defined(CONFIG_USER_ONLY)
 static RISCVException mctr(CPURISCVState *env, int csrno)
 {
@@ -485,6 +529,32 @@ static RISCVException seed(CPURISCVState *env, int csrno)
 #endif
 }
 
+/* Zisslpcfi CSR_LPLR read/write */
+static int read_lplr(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->lplr;
+    return RISCV_EXCP_NONE;
+}
+
+static int write_lplr(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->lplr = val & (LPLR_UL | LPLR_ML | LPLR_LL);
+    return RISCV_EXCP_NONE;
+}
+
+/* Zisslpcfi CSR_SSP read/write */
+static int read_ssp(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->ssp;
+    return RISCV_EXCP_NONE;
+}
+
+static int write_ssp(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->ssp = val;
+    return RISCV_EXCP_NONE;
+}
+
 /* User Floating-Point CSRs */
 static RISCVException read_fflags(CPURISCVState *env, int csrno,
                                   target_ulong *val)
@@ -1227,7 +1297,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
     /* flush tlb on mstatus fields that affect VM */
     if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
-            MSTATUS_MPRV | MSTATUS_SUM)) {
+            MSTATUS_MPRV | MSTATUS_SUM | MSTATUS_UFCFIEN | MSTATUS_UBCFIEN)) {
         tlb_flush(env_cpu(env));
     }
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
@@ -1250,6 +1320,11 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         }
     }
 
+    /* If cfi extension is available, then apply cfi status mask */
+    if (env_archcpu(env)->cfg.ext_cfi) {
+        mask |= CFISTATUS_M_MASK;
+    }
+
     mstatus = (mstatus & ~mask) | (val & mask);
 
     if (xl > MXL_RV32) {
@@ -1880,9 +1955,17 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENVCFG_CBZE;
+    uint64_t cfi_mask = MENVCFG_CFI | MENVCFG_SFCFIEN;
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= MENVCFG_PBMTE | MENVCFG_STCE;
+        if (env_archcpu(env)->cfg.ext_cfi) {
+            mask |= cfi_mask;
+            /* If any cfi enabling bit changes in menvcfg, flush tlb */
+            if ((val ^ env->menvcfg) & cfi_mask) {
+                tlb_flush(env_cpu(env));
+            }
+        }
     }
     env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
 
@@ -1900,8 +1983,17 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = MENVCFG_PBMTE | MENVCFG_STCE;
+    uint64_t cfi_mask = MENVCFG_CFI | MENVCFG_SFCFIEN;
     uint64_t valh = (uint64_t)val << 32;
 
+    if (env_archcpu(env)->cfg.ext_cfi) {
+            mask |= cfi_mask;
+            /* If any cfi enabling bit changes in menvcfg, flush tlb */
+            if ((val ^ env->menvcfg) & cfi_mask) {
+                tlb_flush(env_cpu(env));
+            }
+    }
+
     env->menvcfg = (env->menvcfg & ~mask) | (valh & mask);
 
     return RISCV_EXCP_NONE;
@@ -1954,6 +2046,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
+    uint64_t cfi_mask = HENVCFG_CFI | HENVCFG_SFCFIEN;
     RISCVException ret;
 
     ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
@@ -1963,6 +2056,18 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= HENVCFG_PBMTE | HENVCFG_STCE;
+        /*
+         * If cfi available and menvcfg.CFI = 1, then apply cfi mask for
+         * henvcfg
+         */
+        if (env_archcpu(env)->cfg.ext_cfi &&
+            get_field(env->menvcfg, MENVCFG_CFI)) {
+            mask |= cfi_mask;
+            /* If any cfi enabling bit changes in henvcfg, flush tlb */
+            if ((val ^ env->henvcfg) & cfi_mask) {
+                tlb_flush(env_cpu(env));
+            }
+        }
     }
 
     env->henvcfg = (env->henvcfg & ~mask) | (val & mask);
@@ -1988,9 +2093,19 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
+    uint64_t cfi_mask = HENVCFG_CFI | HENVCFG_SFCFIEN;
     uint64_t valh = (uint64_t)val << 32;
     RISCVException ret;
 
+    if (env_archcpu(env)->cfg.ext_cfi &&
+        get_field(env->menvcfg, MENVCFG_CFI)) {
+        mask |= cfi_mask;
+        /* If any cfi enabling bit changes in henvcfg, flush tlb */
+        if ((val ^ env->henvcfg) & cfi_mask) {
+            tlb_flush(env_cpu(env));
+        }
+    }
+
     ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
@@ -2270,6 +2385,11 @@ static RISCVException read_sstatus_i128(CPURISCVState *env, int csrno,
         mask |= SSTATUS64_UXL;
     }
 
+    if ((env_archcpu(env)->cfg.ext_cfi) &&
+         get_field(env->menvcfg, MENVCFG_CFI)) {
+        mask |= CFISTATUS_S_MASK;
+    }
+
     *val = int128_make128(sstatus, add_status_sd(MXL_RV128, sstatus));
     return RISCV_EXCP_NONE;
 }
@@ -2281,6 +2401,11 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
     if (env->xl != MXL_RV32 || env->debugger) {
         mask |= SSTATUS64_UXL;
     }
+
+    if ((env_archcpu(env)->cfg.ext_cfi) &&
+         get_field(env->menvcfg, MENVCFG_CFI)) {
+        mask |= CFISTATUS_S_MASK;
+    }
     /* TODO: Use SXL not MXL. */
     *val = add_status_sd(riscv_cpu_mxl(env), env->mstatus & mask);
     return RISCV_EXCP_NONE;
@@ -2296,6 +2421,12 @@ static RISCVException write_sstatus(CPURISCVState *env, int csrno,
             mask |= SSTATUS64_UXL;
         }
     }
+
+    /* If cfi available and menvcfg.CFI = 1, apply CFI mask for sstatus */
+    if ((env_archcpu(env)->cfg.ext_cfi) &&
+         get_field(env->menvcfg, MENVCFG_CFI)) {
+        mask |= CFISTATUS_S_MASK;
+    }
     target_ulong newval = (env->mstatus & ~mask) | (val & mask);
     return write_mstatus(env, CSR_MSTATUS, newval);
 }
@@ -4001,6 +4132,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Crypto Extension */
     [CSR_SEED] = { "seed", seed, NULL, NULL, rmw_seed },
 
+    /* User mode CFI CSR */
+    [CSR_LPLR] = { "lplr", cfi, read_lplr, write_lplr },
+    [CSR_SSP]  = { "ssp", cfi, read_ssp, write_ssp },
+
 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
     [CSR_MCYCLE]    = { "mcycle",    any,   read_hpmcounter,
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index d1126a6066..89745d46cd 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -579,6 +579,15 @@ void mseccfg_csr_write(CPURISCVState *env, target_ulong val)
     /* Sticky bits */
     val |= (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
 
+    /* M-mode forward cfi to be enabled if cfi extension is implemented */
+    if (env_archcpu(env)->cfg.ext_cfi) {
+        val |= (val & MSECCFG_MFCFIEN);
+        /* If forward cfi in mseccfg is being toggled, flush tlb */
+        if ((env->mseccfg ^ val) & MSECCFG_MFCFIEN) {
+                tlb_flush(env_cpu(env));
+        }
+    }
+
     env->mseccfg = val;
 }
 
-- 
2.25.1


