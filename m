Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNnd1-0006Xn-JI
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 23:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1pNnd0-0006XY-6R
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 23:24:46 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1pNncy-0007gE-9f
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 23:24:45 -0500
Received: by mail-pg1-x534.google.com with SMTP id v3so2860878pgh.4
 for <qemu-riscv@nongnu.org>; Thu, 02 Feb 2023 20:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XH6bWLGie/nB6oW9RlM0zMwRYQDhnyHZ3cNWbPyp8eM=;
 b=nuCSUoiKFErlvWerlE+q0d2Lb9A+lpDwVmIVizQKNGGonBHf8tzt3mjS9Ltm114msD
 5LoQecrGK0O1fMW47KQzd0bFPBo4p2kj8EO7HXTYsJMpe2pUOtSa5UN9yMbj36PN12lo
 /9/NqENih47+OaZNE+vZlD231X896jzTBf/miJ91larTCtZo/UQP6jeVeNhacgClyQ4R
 4MgIy9y6se7fK5vpSUjxdn6RufXLpQJbFDL6Yelb/AZt3Pu00afChlnXj6ESVBkbmK1Z
 96/C+tfpZ4FF5F9i9qP4Tq7dUHPa1b65vppb3/cWuCBOdsSjrwohJ2xwKUdF4h48fGo5
 Zo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XH6bWLGie/nB6oW9RlM0zMwRYQDhnyHZ3cNWbPyp8eM=;
 b=lw8D/jjr94tr4/m7MeTAMlpyqcKgreSy4JIoAjT1WlKoGao9QDLHxAEInxiyuCIVdf
 5b6VTyJ560Ufa6kWmhiXOglx5SUlEVThJG6y1rZ3SSU+pwVNm1xgjRqrDN0xLoM+tgHg
 HhyxXwa70c/sxu6rwOjXD/3qOj4T8f7BrVnWInEQCk5pv58eF2uW/onP0lXVWj4B/Kpm
 K/ejtGqzdO3UmAqVf/1/u/vuqpW5YqEhbcNCOCwt0vFhPRZtmYdJJO6UvK27B4HSvpfv
 cWGvdwj6lHQ/0LAaHzdadNzXJ1fbjSeDiinVRPyNlqg4gkxeJ1/vbTi5u71PnTjcv2al
 TSfQ==
X-Gm-Message-State: AO0yUKXP8qI1Y+4/TtTB8QCnS/HcxHBwqagWymXNOpR7K2BQtm4xzJzz
 l4AMAXR8D4ymfyGuM1RkrsOYW/gBgVhR1oQ9GyonWQ==
X-Google-Smtp-Source: AK7set9WTZHiqpIxXNvNIe+HKnWIa1jdIQi10pqaSGQTxVuSztJEqnU3Q9DiV916EqsvdG52qY7uGQ==
X-Received: by 2002:a05:6a00:882:b0:593:c4fd:f3a5 with SMTP id
 q2-20020a056a00088200b00593c4fdf3a5mr7703176pfj.0.1675398281885; 
 Thu, 02 Feb 2023 20:24:41 -0800 (PST)
Received: from gram.dc1.ventanamicro.com
 ([2405:201:d019:c0a2:d1bb:4458:2b1b:e0d9])
 by smtp.gmail.com with ESMTPSA id
 g28-20020aa796bc000000b005895f9657ebsm533114pfk.70.2023.02.02.20.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 20:24:41 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: qemu-riscv@nongnu.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH] target/riscv: Convert epmp from feature to ratified smepmp
 extension
Date: Fri,  3 Feb 2023 09:54:34 +0530
Message-Id: <20230203042434.67293-1-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 04:24:46 -0000

Smepmp is a ratified extension. This patch converts the existing epmp
support as a feature to an extension. With this, "smepmp" string will
be concatenated to riscv,isa in generated FDT.

Since the official name of the extension is Smepmp, the references
to epmp have also been changed to smepmp.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 target/riscv/cpu.c | 16 ++++++----------
 target/riscv/cpu.h |  3 +--
 target/riscv/csr.c |  8 +++++---
 target/riscv/pmp.c | 13 +++++++++----
 4 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 14a7027095..d9bba04226 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -103,6 +103,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(smepmp, true, PRIV_VERSION_1_12_0, ext_smepmp),
     ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
@@ -325,7 +326,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu = false;
-    cpu->cfg.epmp = true;
+    cpu->cfg.ext_smepmp = true;
 }
 
 static void rv32_imafcu_nommu_cpu_init(Object *obj)
@@ -884,14 +885,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     if (cpu->cfg.pmp) {
         riscv_set_feature(env, RISCV_FEATURE_PMP);
-
-        /*
-         * Enhanced PMP should only be available
-         * on harts with PMP support
-         */
-        if (cpu->cfg.epmp) {
-            riscv_set_feature(env, RISCV_FEATURE_EPMP);
-        }
+    } else {
+        /* smepmp requires pmp support */
+        cpu->cfg.ext_smepmp = false;
     }
 
     if (cpu->cfg.debug) {
@@ -1051,6 +1047,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("smepmp", RISCVCPU, cfg.ext_smepmp, false),
     DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
@@ -1093,7 +1090,6 @@ static Property riscv_cpu_extensions[] = {
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
-    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
     DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
     DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bcf0826753..30fd29e578 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -87,7 +87,6 @@
 enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
-    RISCV_FEATURE_EPMP,
     RISCV_FEATURE_MISA,
     RISCV_FEATURE_DEBUG
 };
@@ -465,6 +464,7 @@ struct RISCVCPUConfig {
     bool ext_smaia;
     bool ext_ssaia;
     bool ext_sscofpmf;
+    bool ext_smepmp;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
 
@@ -484,7 +484,6 @@ struct RISCVCPUConfig {
     uint16_t elen;
     bool mmu;
     bool pmp;
-    bool epmp;
     bool debug;
 
     bool short_isa_string;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 62e6c4acbd..f70f6d9aad 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -426,9 +426,11 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
-static RISCVException epmp(CPURISCVState *env, int csrno)
+static RISCVException smepmp(CPURISCVState *env, int csrno)
 {
-    if (env->priv == PRV_M && riscv_feature(env, RISCV_FEATURE_EPMP)) {
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (env->priv == PRV_M && cpu->cfg.ext_smepmp) {
         return RISCV_EXCP_NONE;
     }
 
@@ -4259,7 +4261,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
 
     /* Physical Memory Protection */
-    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg,
+    [CSR_MSECCFG]    = { "mseccfg",  smepmp, read_mseccfg, write_mseccfg,
                          .min_priv_ver = PRIV_VERSION_1_11_0           },
     [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index d1126a6066..d85ad07caa 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -58,6 +58,11 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
     return 0;
 }
 
+static inline int smepmp_is_enabled(CPURISCVState *env)
+{
+    return (RISCV_CPU(env_cpu(env))->cfg.ext_smepmp);
+}
+
 /*
  * Count the number of active rules.
  */
@@ -88,7 +93,7 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
     if (pmp_index < MAX_RISCV_PMPS) {
         bool locked = true;
 
-        if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
+        if (smepmp_is_enabled(env)) {
             /* mseccfg.RLB is set */
             if (MSECCFG_RLB_ISSET(env)) {
                 locked = false;
@@ -239,7 +244,7 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
 {
     bool ret;
 
-    if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
+    if (smepmp_is_enabled(env)) {
         if (MSECCFG_MMWP_ISSET(env)) {
             /*
              * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
@@ -265,7 +270,7 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
         }
     }
 
-    if ((!riscv_feature(env, RISCV_FEATURE_PMP)) || (mode == PRV_M)) {
+    if (!smepmp_is_enabled(env) || (mode == PRV_M)) {
         /*
          * Privileged spec v1.10 states if HW doesn't implement any PMP entry
          * or no PMP entry matches an M-Mode access, the access succeeds.
@@ -348,7 +353,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
 
         /*
          * Convert the PMP permissions to match the truth table in the
-         * ePMP spec.
+         * Smepmp spec.
          */
         const uint8_t epmp_operation =
             ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
-- 
2.39.1


