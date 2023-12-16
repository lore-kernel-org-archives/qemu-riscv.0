Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA17C46CD3
	for <qemu-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 13:53:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rEV5I-0001CC-UD; Sat, 16 Dec 2023 08:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rEV5E-00017M-K2; Sat, 16 Dec 2023 08:52:00 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rEV59-0001Dd-RZ; Sat, 16 Dec 2023 08:52:00 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a1e2ded3d9fso183882466b.0; 
 Sat, 16 Dec 2023 05:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702734711; x=1703339511; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FwU2j/Fkn6+iNb2KVnrbflh02JWle+UT8rc6ujs9EYI=;
 b=giRMeOQp86R2kbyFqaio2uPGwun+eHQgEeEybCzZf9ji+FV15pxnS4b6RCrcZkec0N
 i3uKLAqHNQ7M4KpGCe/dt12Cjs7OrFu3xyqF112irL0dSb2xP1HuuYO+rI7eLerHqrzx
 CGMfBoGrr8XTr0praccqtXRvzlxFuLA4lpieyZO68wk9oNtwytZOwmpoKaLEasLJatNk
 xq5eRV/4CCez7somesSE22cjlwT8OUjKX3HmUiYwECXZqLsU+iTbiGXP+zTxHmB7npgF
 gMUiuSyREYeXErqMJrj61thPIG5nA76mEbjL5Sg4efhNLhWstYHTJ2LDtYkiEOq0w2xo
 LoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702734711; x=1703339511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FwU2j/Fkn6+iNb2KVnrbflh02JWle+UT8rc6ujs9EYI=;
 b=wbv5Dxt7mO+pVwpNw5Rdb676tDS09ZTG18J6D/nxZAgjJ+Jtf0AhgCPlkiX41j7RU7
 qAnC6pwDvMynV+HAL21tziHWBiZzVPtdR8Fr3plPBpiRB7e60qTEfYL3/9BZB9BnhgZd
 kKYGhE5/cD5UnbTKIKurntMBZHp72gvsKVYz27aVjUMOClWC1PdbbXYQCk9f8L+kTgsl
 DNHtdb1Eo8hTP6LwIJr9wgBHYrCpbPef7c6wjzx+VqfJMNBbVnNF1taYzM4GOAPUrBlW
 kV3TBG3cT1FBBWT3ufh5xb9zoLQORUfxYj+myUFyL8q3jvqj7jykISnVIVCRYett3ppm
 Bd4Q==
X-Gm-Message-State: AOJu0YwqD0DSz4R/eFdABkl46t1gEdz0wHiPxYtUYGLdEc43kbX4tau2
 FZJbL74g8/MBrHwfL9XlZwPUlDaDgzkyhQ==
X-Google-Smtp-Source: AGHT+IHYKjDl05aFhxBxRDzru90qIO955+Zm6jq7hqfg1IGWH2mLhrw9RXBYk2quPvg3X2d3m1zJRw==
X-Received: by 2002:a17:906:100d:b0:a1f:8b0a:f09f with SMTP id
 13-20020a170906100d00b00a1f8b0af09fmr6156132ejm.93.1702734710734; 
 Sat, 16 Dec 2023 05:51:50 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 vw12-20020a170907a70c00b00a1c904675cfsm11819595ejc.29.2023.12.16.05.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 05:51:49 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: zhiwei_liu@linux.alibaba.com, baturo.alexey@gmail.com,
 richard.henderson@linaro.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 1/6] target/riscv: Remove obsolete pointer masking
 extension code.
Date: Sat, 16 Dec 2023 13:51:31 +0000
Message-Id: <20231216135136.1597456-2-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231216135136.1597456-1-me@deliversmonkey.space>
References: <20231216135136.1597456-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Alexey Baturo <baturo.alexey@gmail.com>

Zjpm v0.8 is almost frozen and it's much simplier compared to the existing one:
The newer version doesn't allow to specify custom mask or base for masking.
Instead it allows only certain options for masking top bits.

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/cpu.c           |  10 --
 target/riscv/cpu.h           |  32 +---
 target/riscv/cpu_bits.h      |  82 ---------
 target/riscv/cpu_helper.c    |  52 ------
 target/riscv/csr.c           | 326 -----------------------------------
 target/riscv/machine.c       |   9 -
 target/riscv/translate.c     |  27 +--
 target/riscv/vector_helper.c |   2 +-
 8 files changed, 10 insertions(+), 530 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 83c7c0cf07..1e6571ce99 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -710,13 +710,6 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             CSR_MSCRATCH,
             CSR_SSCRATCH,
             CSR_SATP,
-            CSR_MMTE,
-            CSR_UPMBASE,
-            CSR_UPMMASK,
-            CSR_SPMBASE,
-            CSR_SPMMASK,
-            CSR_MPMBASE,
-            CSR_MPMMASK,
         };
 
         for (i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
@@ -891,8 +884,6 @@ static void riscv_cpu_reset_hold(Object *obj)
         }
         i++;
     }
-    /* mmte is supposed to have pm.current hardwired to 1 */
-    env->mmte |= (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
 
     /*
      * Clear mseccfg and unlock all the PMP entries upon reset.
@@ -906,7 +897,6 @@ static void riscv_cpu_reset_hold(Object *obj)
     pmp_unlock_entries(env);
 #endif
     env->xl = riscv_cpu_mxl(env);
-    riscv_cpu_update_mask(env);
     cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d74b361be6..73f7004936 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -374,18 +374,7 @@ struct CPUArchState {
     /* True if in debugger mode.  */
     bool debugger;
 
-    /*
-     * CSRs for PointerMasking extension
-     */
-    target_ulong mmte;
-    target_ulong mpmmask;
-    target_ulong mpmbase;
-    target_ulong spmmask;
-    target_ulong spmbase;
-    target_ulong upmmask;
-    target_ulong upmbase;
-
-    /* CSRs for execution environment configuration */
+    /* CSRs for execution enviornment configuration */
     uint64_t menvcfg;
     uint64_t mstateen[SMSTATEEN_MAX_COUNT];
     uint64_t hstateen[SMSTATEEN_MAX_COUNT];
@@ -393,8 +382,6 @@ struct CPUArchState {
     target_ulong senvcfg;
     uint64_t henvcfg;
 #endif
-    target_ulong cur_pmmask;
-    target_ulong cur_pmbase;
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
@@ -543,17 +530,14 @@ FIELD(TB_FLAGS, VILL, 14, 1)
 FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
 FIELD(TB_FLAGS, XL, 16, 2)
-/* If PointerMasking should be applied */
-FIELD(TB_FLAGS, PM_MASK_ENABLED, 18, 1)
-FIELD(TB_FLAGS, PM_BASE_ENABLED, 19, 1)
-FIELD(TB_FLAGS, VTA, 20, 1)
-FIELD(TB_FLAGS, VMA, 21, 1)
+FIELD(TB_FLAGS, VTA, 18, 1)
+FIELD(TB_FLAGS, VMA, 19, 1)
 /* Native debug itrigger */
-FIELD(TB_FLAGS, ITRIGGER, 22, 1)
+FIELD(TB_FLAGS, ITRIGGER, 20, 1)
 /* Virtual mode enabled */
-FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
-FIELD(TB_FLAGS, PRIV, 24, 2)
-FIELD(TB_FLAGS, AXL, 26, 2)
+FIELD(TB_FLAGS, VIRT_ENABLED, 21, 1)
+FIELD(TB_FLAGS, PRIV, 22, 2)
+FIELD(TB_FLAGS, AXL, 24, 2)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
@@ -680,8 +664,6 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
                           uint64_t *cs_base, uint32_t *pflags);
 
-void riscv_cpu_update_mask(CPURISCVState *env);
-
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
                            target_ulong new_value, target_ulong write_mask);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index ebd7917d49..3f9415d68d 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -491,37 +491,6 @@
 #define CSR_MHPMCOUNTER30H  0xb9e
 #define CSR_MHPMCOUNTER31H  0xb9f
 
-/*
- * User PointerMasking registers
- * NB: actual CSR numbers might be changed in future
- */
-#define CSR_UMTE            0x4c0
-#define CSR_UPMMASK         0x4c1
-#define CSR_UPMBASE         0x4c2
-
-/*
- * Machine PointerMasking registers
- * NB: actual CSR numbers might be changed in future
- */
-#define CSR_MMTE            0x3c0
-#define CSR_MPMMASK         0x3c1
-#define CSR_MPMBASE         0x3c2
-
-/*
- * Supervisor PointerMaster registers
- * NB: actual CSR numbers might be changed in future
- */
-#define CSR_SMTE            0x1c0
-#define CSR_SPMMASK         0x1c1
-#define CSR_SPMBASE         0x1c2
-
-/*
- * Hypervisor PointerMaster registers
- * NB: actual CSR numbers might be changed in future
- */
-#define CSR_VSMTE           0x2c0
-#define CSR_VSPMMASK        0x2c1
-#define CSR_VSPMBASE        0x2c2
 #define CSR_SCOUNTOVF       0xda0
 
 /* Crypto Extension */
@@ -778,57 +747,6 @@ typedef enum RISCVException {
 #define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
 #define HENVCFGH_STCE                       MENVCFGH_STCE
 
-/* Offsets for every pair of control bits per each priv level */
-#define XS_OFFSET    0ULL
-#define U_OFFSET     2ULL
-#define S_OFFSET     5ULL
-#define M_OFFSET     8ULL
-
-#define PM_XS_BITS   (EXT_STATUS_MASK << XS_OFFSET)
-#define U_PM_ENABLE  (PM_ENABLE  << U_OFFSET)
-#define U_PM_CURRENT (PM_CURRENT << U_OFFSET)
-#define U_PM_INSN    (PM_INSN    << U_OFFSET)
-#define S_PM_ENABLE  (PM_ENABLE  << S_OFFSET)
-#define S_PM_CURRENT (PM_CURRENT << S_OFFSET)
-#define S_PM_INSN    (PM_INSN    << S_OFFSET)
-#define M_PM_ENABLE  (PM_ENABLE  << M_OFFSET)
-#define M_PM_CURRENT (PM_CURRENT << M_OFFSET)
-#define M_PM_INSN    (PM_INSN    << M_OFFSET)
-
-/* mmte CSR bits */
-#define MMTE_PM_XS_BITS     PM_XS_BITS
-#define MMTE_U_PM_ENABLE    U_PM_ENABLE
-#define MMTE_U_PM_CURRENT   U_PM_CURRENT
-#define MMTE_U_PM_INSN      U_PM_INSN
-#define MMTE_S_PM_ENABLE    S_PM_ENABLE
-#define MMTE_S_PM_CURRENT   S_PM_CURRENT
-#define MMTE_S_PM_INSN      S_PM_INSN
-#define MMTE_M_PM_ENABLE    M_PM_ENABLE
-#define MMTE_M_PM_CURRENT   M_PM_CURRENT
-#define MMTE_M_PM_INSN      M_PM_INSN
-#define MMTE_MASK    (MMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | MMTE_U_PM_INSN | \
-                      MMTE_S_PM_ENABLE | MMTE_S_PM_CURRENT | MMTE_S_PM_INSN | \
-                      MMTE_M_PM_ENABLE | MMTE_M_PM_CURRENT | MMTE_M_PM_INSN | \
-                      MMTE_PM_XS_BITS)
-
-/* (v)smte CSR bits */
-#define SMTE_PM_XS_BITS     PM_XS_BITS
-#define SMTE_U_PM_ENABLE    U_PM_ENABLE
-#define SMTE_U_PM_CURRENT   U_PM_CURRENT
-#define SMTE_U_PM_INSN      U_PM_INSN
-#define SMTE_S_PM_ENABLE    S_PM_ENABLE
-#define SMTE_S_PM_CURRENT   S_PM_CURRENT
-#define SMTE_S_PM_INSN      S_PM_INSN
-#define SMTE_MASK    (SMTE_U_PM_ENABLE | SMTE_U_PM_CURRENT | SMTE_U_PM_INSN | \
-                      SMTE_S_PM_ENABLE | SMTE_S_PM_CURRENT | SMTE_S_PM_INSN | \
-                      SMTE_PM_XS_BITS)
-
-/* umte CSR bits */
-#define UMTE_U_PM_ENABLE    U_PM_ENABLE
-#define UMTE_U_PM_CURRENT   U_PM_CURRENT
-#define UMTE_U_PM_INSN      U_PM_INSN
-#define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_INSN)
-
 /* MISELECT, SISELECT, and VSISELECT bits (AIA) */
 #define ISELECT_IPRIO0                     0x30
 #define ISELECT_IPRIO15                    0x3f
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e7e23b34f4..a3d477d226 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -135,61 +135,10 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
     flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
     flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
     flags = FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
-    if (env->cur_pmmask != 0) {
-        flags = FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
-    }
-    if (env->cur_pmbase != 0) {
-        flags = FIELD_DP32(flags, TB_FLAGS, PM_BASE_ENABLED, 1);
-    }
 
     *pflags = flags;
 }
 
-void riscv_cpu_update_mask(CPURISCVState *env)
-{
-    target_ulong mask = 0, base = 0;
-    RISCVMXL xl = env->xl;
-    /*
-     * TODO: Current RVJ spec does not specify
-     * how the extension interacts with XLEN.
-     */
-#ifndef CONFIG_USER_ONLY
-    int mode = cpu_address_mode(env);
-    xl = cpu_get_xl(env, mode);
-    if (riscv_has_ext(env, RVJ)) {
-        switch (mode) {
-        case PRV_M:
-            if (env->mmte & M_PM_ENABLE) {
-                mask = env->mpmmask;
-                base = env->mpmbase;
-            }
-            break;
-        case PRV_S:
-            if (env->mmte & S_PM_ENABLE) {
-                mask = env->spmmask;
-                base = env->spmbase;
-            }
-            break;
-        case PRV_U:
-            if (env->mmte & U_PM_ENABLE) {
-                mask = env->upmmask;
-                base = env->upmbase;
-            }
-            break;
-        default:
-            g_assert_not_reached();
-        }
-    }
-#endif
-    if (xl == MXL_RV32) {
-        env->cur_pmmask = mask & UINT32_MAX;
-        env->cur_pmbase = base & UINT32_MAX;
-    } else {
-        env->cur_pmmask = mask;
-        env->cur_pmbase = base;
-    }
-}
-
 #ifndef CONFIG_USER_ONLY
 
 /*
@@ -721,7 +670,6 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
     /* tlb_flush is unnecessary as mode is contained in mmu_idx */
     env->priv = newpriv;
     env->xl = cpu_recompute_xl(env);
-    riscv_cpu_update_mask(env);
 
     /*
      * Clear the load reservation - otherwise a reservation placed in one
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fde7ce1a53..ea4e1ac6ef 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -483,16 +483,6 @@ static RISCVException hgatp(CPURISCVState *env, int csrno)
     return hmode(env, csrno);
 }
 
-/* Checks if PointerMasking registers could be accessed */
-static RISCVException pointer_masking(CPURISCVState *env, int csrno)
-{
-    /* Check if j-ext is present */
-    if (riscv_has_ext(env, RVJ)) {
-        return RISCV_EXCP_NONE;
-    }
-    return RISCV_EXCP_ILLEGAL_INST;
-}
-
 static int aia_hmode(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_cfg(env)->ext_ssaia) {
@@ -1355,7 +1345,6 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         env->xl = cpu_recompute_xl(env);
     }
 
-    riscv_cpu_update_mask(env);
     return RISCV_EXCP_NONE;
 }
 
@@ -3900,302 +3889,6 @@ static RISCVException read_tinfo(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-/*
- * Functions to access Pointer Masking feature registers
- * We have to check if current priv lvl could modify
- * csr in given mode
- */
-static bool check_pm_current_disabled(CPURISCVState *env, int csrno)
-{
-    int csr_priv = get_field(csrno, 0x300);
-    int pm_current;
-
-    if (env->debugger) {
-        return false;
-    }
-    /*
-     * If priv lvls differ that means we're accessing csr from higher priv lvl,
-     * so allow the access
-     */
-    if (env->priv != csr_priv) {
-        return false;
-    }
-    switch (env->priv) {
-    case PRV_M:
-        pm_current = get_field(env->mmte, M_PM_CURRENT);
-        break;
-    case PRV_S:
-        pm_current = get_field(env->mmte, S_PM_CURRENT);
-        break;
-    case PRV_U:
-        pm_current = get_field(env->mmte, U_PM_CURRENT);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    /* It's same priv lvl, so we allow to modify csr only if pm.current==1 */
-    return !pm_current;
-}
-
-static RISCVException read_mmte(CPURISCVState *env, int csrno,
-                                target_ulong *val)
-{
-    *val = env->mmte & MMTE_MASK;
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException write_mmte(CPURISCVState *env, int csrno,
-                                 target_ulong val)
-{
-    uint64_t mstatus;
-    target_ulong wpri_val = val & MMTE_MASK;
-
-    if (val != wpri_val) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s"
-                      TARGET_FMT_lx "\n", "MMTE: WPRI violation written 0x",
-                      val, "vs expected 0x", wpri_val);
-    }
-    /* for machine mode pm.current is hardwired to 1 */
-    wpri_val |= MMTE_M_PM_CURRENT;
-
-    /* hardwiring pm.instruction bit to 0, since it's not supported yet */
-    wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
-    env->mmte = wpri_val | EXT_STATUS_DIRTY;
-    riscv_cpu_update_mask(env);
-
-    /* Set XS and SD bits, since PM CSRs are dirty */
-    mstatus = env->mstatus | MSTATUS_XS;
-    write_mstatus(env, csrno, mstatus);
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException read_smte(CPURISCVState *env, int csrno,
-                                target_ulong *val)
-{
-    *val = env->mmte & SMTE_MASK;
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException write_smte(CPURISCVState *env, int csrno,
-                                 target_ulong val)
-{
-    target_ulong wpri_val = val & SMTE_MASK;
-
-    if (val != wpri_val) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s"
-                      TARGET_FMT_lx "\n", "SMTE: WPRI violation written 0x",
-                      val, "vs expected 0x", wpri_val);
-    }
-
-    /* if pm.current==0 we can't modify current PM CSRs */
-    if (check_pm_current_disabled(env, csrno)) {
-        return RISCV_EXCP_NONE;
-    }
-
-    wpri_val |= (env->mmte & ~SMTE_MASK);
-    write_mmte(env, csrno, wpri_val);
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException read_umte(CPURISCVState *env, int csrno,
-                                target_ulong *val)
-{
-    *val = env->mmte & UMTE_MASK;
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException write_umte(CPURISCVState *env, int csrno,
-                                 target_ulong val)
-{
-    target_ulong wpri_val = val & UMTE_MASK;
-
-    if (val != wpri_val) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s"
-                      TARGET_FMT_lx "\n", "UMTE: WPRI violation written 0x",
-                      val, "vs expected 0x", wpri_val);
-    }
-
-    if (check_pm_current_disabled(env, csrno)) {
-        return RISCV_EXCP_NONE;
-    }
-
-    wpri_val |= (env->mmte & ~UMTE_MASK);
-    write_mmte(env, csrno, wpri_val);
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException read_mpmmask(CPURISCVState *env, int csrno,
-                                   target_ulong *val)
-{
-    *val = env->mpmmask;
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
-                                    target_ulong val)
-{
-    uint64_t mstatus;
-
-    env->mpmmask = val;
-    if ((cpu_address_mode(env) == PRV_M) && (env->mmte & M_PM_ENABLE)) {
-        env->cur_pmmask = val;
-    }
-    env->mmte |= EXT_STATUS_DIRTY;
-
-    /* Set XS and SD bits, since PM CSRs are dirty */
-    mstatus = env->mstatus | MSTATUS_XS;
-    write_mstatus(env, csrno, mstatus);
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException read_spmmask(CPURISCVState *env, int csrno,
-                                   target_ulong *val)
-{
-    *val = env->spmmask;
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException write_spmmask(CPURISCVState *env, int csrno,
-                                    target_ulong val)
-{
-    uint64_t mstatus;
-
-    /* if pm.current==0 we can't modify current PM CSRs */
-    if (check_pm_current_disabled(env, csrno)) {
-        return RISCV_EXCP_NONE;
-    }
-    env->spmmask = val;
-    if ((cpu_address_mode(env) == PRV_S) && (env->mmte & S_PM_ENABLE)) {
-        env->cur_pmmask = val;
-        if (cpu_get_xl(env, PRV_S) == MXL_RV32) {
-            env->cur_pmmask &= UINT32_MAX;
-        }
-    }
-    env->mmte |= EXT_STATUS_DIRTY;
-
-    /* Set XS and SD bits, since PM CSRs are dirty */
-    mstatus = env->mstatus | MSTATUS_XS;
-    write_mstatus(env, csrno, mstatus);
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException read_upmmask(CPURISCVState *env, int csrno,
-                                   target_ulong *val)
-{
-    *val = env->upmmask;
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException write_upmmask(CPURISCVState *env, int csrno,
-                                    target_ulong val)
-{
-    uint64_t mstatus;
-
-    /* if pm.current==0 we can't modify current PM CSRs */
-    if (check_pm_current_disabled(env, csrno)) {
-        return RISCV_EXCP_NONE;
-    }
-    env->upmmask = val;
-    if ((cpu_address_mode(env) == PRV_U) && (env->mmte & U_PM_ENABLE)) {
-        env->cur_pmmask = val;
-        if (cpu_get_xl(env, PRV_U) == MXL_RV32) {
-            env->cur_pmmask &= UINT32_MAX;
-        }
-    }
-    env->mmte |= EXT_STATUS_DIRTY;
-
-    /* Set XS and SD bits, since PM CSRs are dirty */
-    mstatus = env->mstatus | MSTATUS_XS;
-    write_mstatus(env, csrno, mstatus);
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException read_mpmbase(CPURISCVState *env, int csrno,
-                                   target_ulong *val)
-{
-    *val = env->mpmbase;
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
-                                    target_ulong val)
-{
-    uint64_t mstatus;
-
-    env->mpmbase = val;
-    if ((cpu_address_mode(env) == PRV_M) && (env->mmte & M_PM_ENABLE)) {
-        env->cur_pmbase = val;
-    }
-    env->mmte |= EXT_STATUS_DIRTY;
-
-    /* Set XS and SD bits, since PM CSRs are dirty */
-    mstatus = env->mstatus | MSTATUS_XS;
-    write_mstatus(env, csrno, mstatus);
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException read_spmbase(CPURISCVState *env, int csrno,
-                                   target_ulong *val)
-{
-    *val = env->spmbase;
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException write_spmbase(CPURISCVState *env, int csrno,
-                                    target_ulong val)
-{
-    uint64_t mstatus;
-
-    /* if pm.current==0 we can't modify current PM CSRs */
-    if (check_pm_current_disabled(env, csrno)) {
-        return RISCV_EXCP_NONE;
-    }
-    env->spmbase = val;
-    if ((cpu_address_mode(env) == PRV_S) && (env->mmte & S_PM_ENABLE)) {
-        env->cur_pmbase = val;
-        if (cpu_get_xl(env, PRV_S) == MXL_RV32) {
-            env->cur_pmbase &= UINT32_MAX;
-        }
-    }
-    env->mmte |= EXT_STATUS_DIRTY;
-
-    /* Set XS and SD bits, since PM CSRs are dirty */
-    mstatus = env->mstatus | MSTATUS_XS;
-    write_mstatus(env, csrno, mstatus);
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException read_upmbase(CPURISCVState *env, int csrno,
-                                   target_ulong *val)
-{
-    *val = env->upmbase;
-    return RISCV_EXCP_NONE;
-}
-
-static RISCVException write_upmbase(CPURISCVState *env, int csrno,
-                                    target_ulong val)
-{
-    uint64_t mstatus;
-
-    /* if pm.current==0 we can't modify current PM CSRs */
-    if (check_pm_current_disabled(env, csrno)) {
-        return RISCV_EXCP_NONE;
-    }
-    env->upmbase = val;
-    if ((cpu_address_mode(env) == PRV_U) && (env->mmte & U_PM_ENABLE)) {
-        env->cur_pmbase = val;
-        if (cpu_get_xl(env, PRV_U) == MXL_RV32) {
-            env->cur_pmbase &= UINT32_MAX;
-        }
-    }
-    env->mmte |= EXT_STATUS_DIRTY;
-
-    /* Set XS and SD bits, since PM CSRs are dirty */
-    mstatus = env->mstatus | MSTATUS_XS;
-    write_mstatus(env, csrno, mstatus);
-    return RISCV_EXCP_NONE;
-}
-
 #endif
 
 /* Crypto Extension */
@@ -4800,25 +4493,6 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_TDATA3]    =  { "tdata3",  debug, read_tdata,   write_tdata   },
     [CSR_TINFO]     =  { "tinfo",   debug, read_tinfo,   write_ignore  },
 
-    /* User Pointer Masking */
-    [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,  write_umte },
-    [CSR_UPMMASK] =    { "upmmask", pointer_masking, read_upmmask,
-                         write_upmmask                                      },
-    [CSR_UPMBASE] =    { "upmbase", pointer_masking, read_upmbase,
-                         write_upmbase                                      },
-    /* Machine Pointer Masking */
-    [CSR_MMTE]    =    { "mmte",    pointer_masking, read_mmte,  write_mmte },
-    [CSR_MPMMASK] =    { "mpmmask", pointer_masking, read_mpmmask,
-                         write_mpmmask                                      },
-    [CSR_MPMBASE] =    { "mpmbase", pointer_masking, read_mpmbase,
-                         write_mpmbase                                      },
-    /* Supervisor Pointer Masking */
-    [CSR_SMTE]    =    { "smte",    pointer_masking, read_smte,  write_smte },
-    [CSR_SPMMASK] =    { "spmmask", pointer_masking, read_spmmask,
-                         write_spmmask                                      },
-    [CSR_SPMBASE] =    { "spmbase", pointer_masking, read_spmbase,
-                         write_spmbase                                      },
-
     /* Performance Counters */
     [CSR_HPMCOUNTER3]    = { "hpmcounter3",    ctr,    read_hpmcounter },
     [CSR_HPMCOUNTER4]    = { "hpmcounter4",    ctr,    read_hpmcounter },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index fdde243e04..860fe56d43 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -164,14 +164,6 @@ static const VMStateDescription vmstate_pointermasking = {
     .minimum_version_id = 1,
     .needed = pointermasking_needed,
     .fields = (VMStateField[]) {
-        VMSTATE_UINTTL(env.mmte, RISCVCPU),
-        VMSTATE_UINTTL(env.mpmmask, RISCVCPU),
-        VMSTATE_UINTTL(env.mpmbase, RISCVCPU),
-        VMSTATE_UINTTL(env.spmmask, RISCVCPU),
-        VMSTATE_UINTTL(env.spmbase, RISCVCPU),
-        VMSTATE_UINTTL(env.upmmask, RISCVCPU),
-        VMSTATE_UINTTL(env.upmbase, RISCVCPU),
-
         VMSTATE_END_OF_LIST()
     }
 };
@@ -267,7 +259,6 @@ static int riscv_cpu_post_load(void *opaque, int version_id)
     CPURISCVState *env = &cpu->env;
 
     env->xl = cpu_recompute_xl(env);
-    riscv_cpu_update_mask(env);
     return 0;
 }
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f0be79bb16..6b4b9a671c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -42,9 +42,6 @@ static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_vl, cpu_vstart;
 static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
 static TCGv load_res;
 static TCGv load_val;
-/* globals for PM CSRs */
-static TCGv pm_mask;
-static TCGv pm_base;
 
 /*
  * If an operation is being performed on less than TARGET_LONG_BITS,
@@ -106,9 +103,6 @@ typedef struct DisasContext {
     bool vl_eq_vlmax;
     CPUState *cs;
     TCGv zero;
-    /* PointerMasking extension */
-    bool pm_mask_enabled;
-    bool pm_base_enabled;
     /* Use icount trigger for native debug */
     bool itrigger;
     /* FRM is known to contain a valid value. */
@@ -582,14 +576,9 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
     TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
 
     tcg_gen_addi_tl(addr, src1, imm);
-    if (ctx->pm_mask_enabled) {
-        tcg_gen_andc_tl(addr, addr, pm_mask);
-    } else if (get_address_xl(ctx) == MXL_RV32) {
+    if (get_address_xl(ctx) == MXL_RV32) {
         tcg_gen_ext32u_tl(addr, addr);
     }
-    if (ctx->pm_base_enabled) {
-        tcg_gen_or_tl(addr, addr, pm_base);
-    }
 
     return addr;
 }
@@ -601,14 +590,9 @@ static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
     TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
 
     tcg_gen_add_tl(addr, src1, offs);
-    if (ctx->pm_mask_enabled) {
-        tcg_gen_andc_tl(addr, addr, pm_mask);
-    } else if (get_xl(ctx) == MXL_RV32) {
+    if (get_xl(ctx) == MXL_RV32) {
         tcg_gen_ext32u_tl(addr, addr);
     }
-    if (ctx->pm_base_enabled) {
-        tcg_gen_or_tl(addr, addr, pm_base);
-    }
     return addr;
 }
 
@@ -1192,8 +1176,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->address_xl = FIELD_EX32(tb_flags, TB_FLAGS, AXL);
     ctx->cs = cs;
-    ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
-    ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
@@ -1325,9 +1307,4 @@ void riscv_translate_init(void)
                              "load_res");
     load_val = tcg_global_mem_new(tcg_env, offsetof(CPURISCVState, load_val),
                              "load_val");
-    /* Assign PM CSRs to tcg globals */
-    pm_mask = tcg_global_mem_new(tcg_env, offsetof(CPURISCVState, cur_pmmask),
-                                 "pmmask");
-    pm_base = tcg_global_mem_new(tcg_env, offsetof(CPURISCVState, cur_pmbase),
-                                 "pmbase");
 }
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index c1c3a4d1ea..8e7a8e80a0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -94,7 +94,7 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint32_t log2_esz)
 
 static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
 {
-    return (addr & ~env->cur_pmmask) | env->cur_pmbase;
+    return addr;
 }
 
 /*
-- 
2.34.1


