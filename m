Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA6ACDB465
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 06:56:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtMws-0006oU-DZ; Thu, 19 Oct 2023 02:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qtMwq-0006nT-3d
 for qemu-riscv@nongnu.org; Thu, 19 Oct 2023 02:56:00 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qtMwn-0002aO-4y
 for qemu-riscv@nongnu.org; Thu, 19 Oct 2023 02:55:59 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5b837db1b26so823081a12.3
 for <qemu-riscv@nongnu.org>; Wed, 18 Oct 2023 23:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697698553; x=1698303353; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZdOPRXbiSzI4g7kjdZq1XV+7i81shb/E6Lz8nvVHR8c=;
 b=d+J2pUCGauNKUUadZOcq4KJz0hpV+duGt+1s2dALgMtTyLMlCHquOJ+r5fvUYFmqmS
 cwW793DitWgD+/bbmu7/+wNobOtICNc8t8bd4EpYMzFGyuknmo4yAJkMREtpp2otr4uU
 Xfid3HA9gWtEkUGDT2MQfns/hdqpF5KFUZUwF4zXgoRgUWcC0+kgG5UB3UUkVcrSvn0J
 PXo2fZenBC9zf/4K9ONFx9xFEPwdrfyLVvc6zSV6pQhAZtb0hejO46ESPU1OsXdw3E+x
 B75d9zo0j1min33cf2Eo0CxD3+1Orv9Yqn7odp2Qt79nzTbf/uFTSXoiL2xli9+dhnsS
 IbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697698553; x=1698303353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZdOPRXbiSzI4g7kjdZq1XV+7i81shb/E6Lz8nvVHR8c=;
 b=o99Bu9Ve5Cxyw/EyR1FBrmroTQkqeLq6UEyFq0O+njJfdagJEuWMDBdf5zrZBEJmEy
 pjJiqCX6OqsJkmhgp/0LzB7FP1Q+UJnwxrw3nBtF2YCNBFS2qsZj/hNa8a7/o4+lMZnT
 MWI6jdCeXQ4gzGjAKMbzdtQvQSEr8dLmlH1HuOBimcEYZVRJPnYRNZTcqTpfP6ta67gY
 zRi4OhEF41PxluqLmZXGfS0nvkZ/YHRhnJuXj13fljLdZ4O10KNO7IQkt8754kNqRgaL
 q/WTv6XG2GbXZACtyJbsMSZcjqSjmADAFyeAgryypL3MYADMqgMhIkEXoqZTaBjbo3vN
 tkwQ==
X-Gm-Message-State: AOJu0YwnOjrSACOi1+6D4Vfhu/VnYAFc29HEuhLpy0WHWOp2Qy2q6M5P
 cy1Mg5vH8zbLtLUDtPaR/EBXDLHPpgXFh4rhyKB7cIo5
X-Google-Smtp-Source: AGHT+IH2+tvAGGe1fEiHGmNAysK0aPkhuG2EChaxKFC9NZNkgBDchriKUnWi1R2usuASUxykSvPBDw==
X-Received: by 2002:a17:90b:4f8d:b0:27d:2abc:f9c1 with SMTP id
 qe13-20020a17090b4f8d00b0027d2abcf9c1mr1293238pjb.20.1697698553201; 
 Wed, 18 Oct 2023 23:55:53 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com
 ([2401:4900:5302:9b99:4f57:4dc3:993d:4317])
 by smtp.googlemail.com with ESMTPSA id
 em4-20020a17090b014400b0027dafa55306sm882289pjb.40.2023.10.18.23.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 23:55:52 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2] Add epmp to extensions list and rename it to smepmp
Date: Thu, 19 Oct 2023 12:25:46 +0530
Message-Id: <20231019065546.1431579-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Himanshu Chauhan <hchauhan@ventanamicro.com>

Smepmp is a ratified extension which qemu refers to as epmp.
Rename epmp to smepmp and add it to extension list so that
it is added to the isa string.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
Changes in v2:
====
- Rebase on latest riscv-to-apply.next
- Remove ePMP version comment

 target/riscv/cpu.c         |  8 +++-----
 target/riscv/cpu_cfg.h     |  2 +-
 target/riscv/csr.c         |  6 +++---
 target/riscv/pmp.c         | 12 ++++++------
 target/riscv/tcg/tcg-cpu.c |  4 ++--
 5 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2f98ce56e06..dad167833cc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -133,7 +133,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
-    ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, epmp),
+    ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
@@ -599,12 +599,11 @@ static void rv32_ibex_cpu_init(Object *obj)
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
 #endif
-    cpu->cfg.epmp = true;
-
     /* inherited from parent obj via riscv_cpu_init() */
     cpu->cfg.ext_zifencei = true;
     cpu->cfg.ext_zicsr = true;
     cpu->cfg.pmp = true;
+    cpu->cfg.ext_smepmp = true;
 }
 
 static void rv32_imafcu_nommu_cpu_init(Object *obj)
@@ -1257,6 +1256,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zve64d", ext_zve64d, false),
     MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
 
+    MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
     MULTI_EXT_CFG_BOOL("svadu", ext_svadu, true),
     MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
@@ -1322,8 +1322,6 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
 
 /* These are experimental so mark with 'x-' */
 const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
-    /* ePMP 0.9.3 */
-    MULTI_EXT_CFG_BOOL("x-epmp", epmp, false),
     MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
     MULTI_EXT_CFG_BOOL("x-ssaia", ext_ssaia, false),
 
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 208cac1c7c9..e7ce977189c 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -102,6 +102,7 @@ struct RISCVCPUConfig {
     bool ext_smaia;
     bool ext_ssaia;
     bool ext_sscofpmf;
+    bool ext_smepmp;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
 
@@ -134,7 +135,6 @@ struct RISCVCPUConfig {
     uint16_t cboz_blocksize;
     bool mmu;
     bool pmp;
-    bool epmp;
     bool debug;
     bool misa_w;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a5be1c202c3..f4e0a3962f0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -524,9 +524,9 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static RISCVException epmp(CPURISCVState *env, int csrno)
+static RISCVException smepmp(CPURISCVState *env, int csrno)
 {
-    if (riscv_cpu_cfg(env)->epmp) {
+    if (riscv_cpu_cfg(env)->ext_smepmp) {
         return RISCV_EXCP_NONE;
     }
 
@@ -4762,7 +4762,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
 
     /* Physical Memory Protection */
-    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg,
+    [CSR_MSECCFG]    = { "mseccfg", smepmp, read_mseccfg, write_mseccfg,
                          .min_priv_ver = PRIV_VERSION_1_11_0           },
     [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 5e60c26031b..21d2489e27e 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -91,7 +91,7 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
     if (pmp_index < MAX_RISCV_PMPS) {
         bool locked = true;
 
-        if (riscv_cpu_cfg(env)->epmp) {
+        if (riscv_cpu_cfg(env)->ext_smepmp) {
             /* mseccfg.RLB is set */
             if (MSECCFG_RLB_ISSET(env)) {
                 locked = false;
@@ -340,9 +340,9 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
 
         /*
          * Convert the PMP permissions to match the truth table in the
-         * ePMP spec.
+         * Smepmp spec.
          */
-        const uint8_t epmp_operation =
+        const uint8_t smepmp_operation =
             ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
             ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
             (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
@@ -367,7 +367,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
                  * If mseccfg.MML Bit set, do the enhanced pmp priv check
                  */
                 if (mode == PRV_M) {
-                    switch (epmp_operation) {
+                    switch (smepmp_operation) {
                     case 0:
                     case 1:
                     case 4:
@@ -398,7 +398,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
                         g_assert_not_reached();
                     }
                 } else {
-                    switch (epmp_operation) {
+                    switch (smepmp_operation) {
                     case 0:
                     case 8:
                     case 9:
@@ -574,7 +574,7 @@ void mseccfg_csr_write(CPURISCVState *env, target_ulong val)
         }
     }
 
-    if (riscv_cpu_cfg(env)->epmp) {
+    if (riscv_cpu_cfg(env)->ext_smepmp) {
         /* Sticky bits */
         val |= (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
         if ((val ^ env->mseccfg) & (MSECCFG_MMWP | MSECCFG_MML)) {
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index bbce254ee13..fce58d4375a 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -591,12 +591,12 @@ static bool tcg_cpu_realize(CPUState *cs, Error **errp)
         return false;
     }
 
-    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
+    if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
          * on harts with PMP support
          */
-        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
+        error_setg(errp, "Invalid configuration: Smepmp requires PMP support");
         return false;
     }
 
-- 
2.34.1


