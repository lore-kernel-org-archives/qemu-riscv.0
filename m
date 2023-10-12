Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DF8CDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 16:46:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqypJ-0000R8-UV; Thu, 12 Oct 2023 12:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qqypI-0000PC-IC
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 12:46:20 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qqypG-0004Zk-Jy
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 12:46:20 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-57b74782be6so628180eaf.2
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 09:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697129177; x=1697733977; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lUXiNN+/Ze1ioMLpQ4WH4bCrM1VntWMfSoTQsDB1p6s=;
 b=l2FIYx25VL7aorz/ZhdnZ5XuYF7cd7RfXJbPM/N0T7yhLx1jbhbZc7isl4xSSwMJgw
 V3vwGH6+DQ9sERLS51NIziFa81Ti6eWArcLzS4R19njitkJQN8iyl+vbLJs7/dxXiyd0
 TVDCPxeSXzrwU0MtWb0cl9JfIAlfYkgWYdPaPO1c+YVMHq3PRkwWSiNhe3XJ+CwI7DoL
 lxz561LX91Zr5Dgo+wX3SPF+1ftdex9xHLOsBrzCoyGfWjY7n6USmaHG2aidRgo5d4PF
 dZ7wxQnTDr90TdYdcI8nACiOlAbS0QYdR7mPa2bhkMo9G2T3GSoIIOonp/49zSRN9BNS
 WZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697129177; x=1697733977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lUXiNN+/Ze1ioMLpQ4WH4bCrM1VntWMfSoTQsDB1p6s=;
 b=CyqEWW3t7ulRikXPAEZ1bnPZPrfy1bmRQTLbRG65TzTTAgPbesiG63T03TyTNL54C1
 mGPl9rPAUPGmmDPEr6IgOuWiIhguQoFYplM8Rg6fv7imnhvNCZR9tl/6tdSNoQ4uYRT2
 mN2H5xW7IOiHra1T5olbAcTI/6TkD5+72TLIJpLOBCrbyoDiKCOLDPvzQfBbgRNJLDlb
 LhENMUyX32LN2CcmKi/keu69sE5Pt/HW5/qaAZic4L8L7YI6ahWnLrCJ+2gQh7JBkDuC
 cgbLMiLmBG+Ta3KqmwAtZaRW25S/l1tnXr6RDNw6DNXkY96SbcNdFIxU2/zHtUT35ble
 0p7A==
X-Gm-Message-State: AOJu0YzmtITuQGkXp7bVR+nu2oJQpijVjGsAfIJ7HV1H5yEi2t3i8b7I
 N4bep8EQve28L9U3q13hSiNP5Q==
X-Google-Smtp-Source: AGHT+IEFX4KckEfqpYaCtTAcGmwsxfitJm/cZ4PzIYuDsEcEGtHaQOF4lGBCQexLxQjmAzxK2ji2UQ==
X-Received: by 2002:a05:6358:98a0:b0:143:3a49:e30d with SMTP id
 q32-20020a05635898a000b001433a49e30dmr29436247rwa.12.1697129177320; 
 Thu, 12 Oct 2023 09:46:17 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.42.196])
 by smtp.gmail.com with ESMTPSA id
 g5-20020aa78185000000b0068feb378b89sm12416805pfi.171.2023.10.12.09.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 09:46:16 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/4] target/riscv: rename ext_icsr to ext_zicsr
Date: Thu, 12 Oct 2023 13:46:02 -0300
Message-ID: <20231012164604.398496-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012164604.398496-1-dbarboza@ventanamicro.com>
References: <20231012164604.398496-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc36.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Add a leading 'z' to improve grepping. When one wants to search for uses
of zicsr they're more likely to do 'grep -i zicsr' than 'grep -i icsr'.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            |  2 +-
 target/riscv/cpu.c         | 22 +++++++++++-----------
 target/riscv/cpu_cfg.h     |  2 +-
 target/riscv/csr.c         |  2 +-
 target/riscv/gdbstub.c     |  2 +-
 target/riscv/tcg/tcg-cpu.c | 14 +++++++-------
 6 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 52bf8e67de..0ffca05189 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -414,7 +414,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
         reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
     }
 
-    if (!harts->harts[0].cfg.ext_icsr) {
+    if (!harts->harts[0].cfg.ext_zicsr) {
         /*
          * The Zicsr extension has been disabled, so let's ensure we don't
          * run the CSR instruction. Let's fill the address with a non
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index caf42ce68d..fdbbafe7b3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -79,7 +79,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
     ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
     ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
-    ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
+    ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_zicsr),
     ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_zifencei),
     ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
     ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
@@ -383,7 +383,7 @@ static void riscv_any_cpu_init(Object *obj)
 
     /* inherited from parent obj via riscv_cpu_init() */
     cpu->cfg.ext_zifencei = true;
-    cpu->cfg.ext_icsr = true;
+    cpu->cfg.ext_zicsr = true;
     cpu->cfg.mmu = true;
     cpu->cfg.pmp = true;
 }
@@ -431,7 +431,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
 
     /* inherited from parent obj via riscv_cpu_init() */
     cpu->cfg.ext_zifencei = true;
-    cpu->cfg.ext_icsr = true;
+    cpu->cfg.ext_zicsr = true;
     cpu->cfg.mmu = true;
     cpu->cfg.pmp = true;
 }
@@ -449,7 +449,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
 
     /* inherited from parent obj via riscv_cpu_init() */
     cpu->cfg.ext_zifencei = true;
-    cpu->cfg.ext_icsr = true;
+    cpu->cfg.ext_zicsr = true;
     cpu->cfg.pmp = true;
 }
 
@@ -495,7 +495,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
     /* Enable ISA extensions */
     cpu->cfg.mmu = true;
     cpu->cfg.ext_zifencei = true;
-    cpu->cfg.ext_icsr = true;
+    cpu->cfg.ext_zicsr = true;
     cpu->cfg.pmp = true;
     cpu->cfg.ext_icbom = true;
     cpu->cfg.cbom_blocksize = 64;
@@ -567,7 +567,7 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 
     /* inherited from parent obj via riscv_cpu_init() */
     cpu->cfg.ext_zifencei = true;
-    cpu->cfg.ext_icsr = true;
+    cpu->cfg.ext_zicsr = true;
     cpu->cfg.mmu = true;
     cpu->cfg.pmp = true;
 }
@@ -585,7 +585,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
 
     /* inherited from parent obj via riscv_cpu_init() */
     cpu->cfg.ext_zifencei = true;
-    cpu->cfg.ext_icsr = true;
+    cpu->cfg.ext_zicsr = true;
     cpu->cfg.pmp = true;
 }
 
@@ -603,7 +603,7 @@ static void rv32_ibex_cpu_init(Object *obj)
 
     /* inherited from parent obj via riscv_cpu_init() */
     cpu->cfg.ext_zifencei = true;
-    cpu->cfg.ext_icsr = true;
+    cpu->cfg.ext_zicsr = true;
     cpu->cfg.pmp = true;
 }
 
@@ -620,7 +620,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
 
     /* inherited from parent obj via riscv_cpu_init() */
     cpu->cfg.ext_zifencei = true;
-    cpu->cfg.ext_icsr = true;
+    cpu->cfg.ext_zicsr = true;
     cpu->cfg.pmp = true;
 }
 #endif
@@ -1243,7 +1243,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
-    MULTI_EXT_CFG_BOOL("zicsr", ext_icsr, true),
+    MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
     MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
     MULTI_EXT_CFG_BOOL("zawrs", ext_zawrs, true),
@@ -1348,7 +1348,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
 /* Deprecated entries marked for future removal */
 const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[] = {
     MULTI_EXT_CFG_BOOL("Zifencei", ext_zifencei, true),
-    MULTI_EXT_CFG_BOOL("Zicsr", ext_icsr, true),
+    MULTI_EXT_CFG_BOOL("Zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("Zihintntl", ext_zihintntl, true),
     MULTI_EXT_CFG_BOOL("Zihintpause", ext_zihintpause, true),
     MULTI_EXT_CFG_BOOL("Zawrs", ext_zawrs, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index a3f96eb878..9ea30da7e0 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -62,7 +62,7 @@ struct RISCVCPUConfig {
     bool ext_zksh;
     bool ext_zkt;
     bool ext_zifencei;
-    bool ext_icsr;
+    bool ext_zicsr;
     bool ext_icbom;
     bool ext_icboz;
     bool ext_zicond;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4b4ab56c40..30cc21e979 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3858,7 +3858,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
     int csr_min_priv = csr_ops[csrno].min_priv_ver;
 
     /* ensure the CSR extension is enabled */
-    if (!riscv_cpu_cfg(env)->ext_icsr) {
+    if (!riscv_cpu_cfg(env)->ext_zicsr) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 524bede865..58b3ace0fe 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -342,7 +342,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
         g_assert_not_reached();
     }
 
-    if (cpu->cfg.ext_icsr) {
+    if (cpu->cfg.ext_zicsr) {
         int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
                                  riscv_gen_dynamic_csr_xml(cs, base_reg),
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 9b8f3f54a7..418b040d6d 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -278,10 +278,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         !(riscv_has_ext(env, RVI) && riscv_has_ext(env, RVM) &&
           riscv_has_ext(env, RVA) && riscv_has_ext(env, RVF) &&
           riscv_has_ext(env, RVD) &&
-          cpu->cfg.ext_icsr && cpu->cfg.ext_zifencei)) {
+          cpu->cfg.ext_zicsr && cpu->cfg.ext_zifencei)) {
 
-        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_icsr)) &&
-            !cpu->cfg.ext_icsr) {
+        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zicsr)) &&
+            !cpu->cfg.ext_zicsr) {
             error_setg(errp, "RVG requires Zicsr but user set Zicsr to false");
             return;
         }
@@ -293,7 +293,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
             return;
         }
 
-        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_icsr), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zicsr), true);
         cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zifencei), true);
 
         env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
@@ -329,7 +329,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (riscv_has_ext(env, RVF) && !cpu->cfg.ext_icsr) {
+    if (riscv_has_ext(env, RVF) && !cpu->cfg.ext_zicsr) {
         error_setg(errp, "F extension requires Zicsr");
         return;
     }
@@ -434,7 +434,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     }
 
     if (cpu->cfg.ext_zfinx) {
-        if (!cpu->cfg.ext_icsr) {
+        if (!cpu->cfg.ext_zicsr) {
             error_setg(errp, "Zfinx extension requires Zicsr");
             return;
         }
@@ -494,7 +494,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_zcmt && !cpu->cfg.ext_icsr) {
+    if (cpu->cfg.ext_zcmt && !cpu->cfg.ext_zicsr) {
         error_setg(errp, "Zcmt extension requires Zicsr extension");
         return;
     }
-- 
2.41.0


