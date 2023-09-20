Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88613CE79AA
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 11:22:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qivGe-0005qn-Il; Wed, 20 Sep 2023 07:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qivGd-0005os-SJ
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 07:21:15 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qivGb-0002Ff-Mn
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 07:21:15 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6c46b7c04c0so601310a34.1
 for <qemu-riscv@nongnu.org>; Wed, 20 Sep 2023 04:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695208872; x=1695813672; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TDUcGph4CZ8HDjwOAIL5zgaK26mCNRaSbKQqrKCL4Kw=;
 b=DKPp746UQcx6cymDyZBbAzyhB5cXbU1QKfPGFWWAJqJY+GkicXD5K5ImosPPVp3MFg
 nyy9dE4QyFNPMAiVlz02BavG9SsHXVZ52PakI9zgVdjqbxW92/9+xUO2OyrZVhqpaT0s
 UsejzIJN994j7/znq/InoqAQR/4/rdvAT7Iij+rieerRX92y43xf0MoOioWyhP2kP7ph
 ADnvjHxfmPlCDg1fZp9cbENGnG+NwN5PZ+tWB+onbPexYWFSnU43R+fdsJJcj2NyJVun
 yHl3YqEMfUuOdbL2Cva7CdAhxIlAKLmPNL+jTeLlp+wzjnt+qY+bWc+MaIU/FlmeebSU
 8y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695208872; x=1695813672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TDUcGph4CZ8HDjwOAIL5zgaK26mCNRaSbKQqrKCL4Kw=;
 b=IKFgVqsQuaV57tvdI7jKvSt9Tm1LSdOTdsz6NzZ6gCjWFDOsDDbCCQnwzDripthx5P
 9A4OkwKIrmXlDcyPxOgfKeycn7/trx3EzCdbrjORKXJmiGxKIUBin4vB6b4H82MSSyP4
 bZI56SRQ96shhKkrciVDFeDctIpEjR5pBDSrra+aJARPod+ykUqqiwA7B5Y60WlJ1nuu
 gpslvc1stwWIATkrmK++TSNoMJ7Ty1VZVx3axoxryHzti9jgV0KspL+PjUDPK86e/mSY
 iMqL+tYXAE9Jgo8eVpfkl3JC4TIMW+R6paY3Rginz94hWnMPWKr34Cmkuw2dL37wr0ti
 Rylg==
X-Gm-Message-State: AOJu0Yx40bWLWz2/oGcePwT71wRcjGPjXTjdJkStjGmuCAT/5oBa5IAN
 7LeO+xGnesFYoEXQie6WHWSaSg==
X-Google-Smtp-Source: AGHT+IHYH2VtI1x766/TL5qL8sbWEMMp12O/8Tr/uP1vfglsWrGdFgvX4wyd/0Q5EAvrZll3DYxM+Q==
X-Received: by 2002:a9d:6b14:0:b0:6b9:4d79:e08a with SMTP id
 g20-20020a9d6b14000000b006b94d79e08amr2319905otp.32.1695208872658; 
 Wed, 20 Sep 2023 04:21:12 -0700 (PDT)
Received: from grind.. ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a9d7c84000000b006b45be2fdc2sm5863955otn.65.2023.09.20.04.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 04:21:12 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 philmd@linaro.org, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 14/19] target/riscv/cpu.c: export set_misa()
Date: Wed, 20 Sep 2023 08:20:15 -0300
Message-ID: <20230920112020.651006-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920112020.651006-1-dbarboza@ventanamicro.com>
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
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

We'll move riscv_init_max_cpu_extensions() to tcg-cpu.c in the next
patch and set_misa() needs to be usable from there.

Rename it to riscv_cpu_set_misa() and make it public.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 34 ++++++++++++++++++----------------
 target/riscv/cpu.h |  1 +
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 665c21af6a..cf191d576e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -294,7 +294,7 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
     }
 }
 
-static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
+void riscv_cpu_set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
 {
     env->misa_mxl_max = env->misa_mxl = mxl;
     env->misa_ext_mask = env->misa_ext = ext;
@@ -399,9 +399,9 @@ static void riscv_any_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
     CPURISCVState *env = &cpu->env;
 #if defined(TARGET_RISCV32)
-    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    riscv_cpu_set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #elif defined(TARGET_RISCV64)
-    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    riscv_cpu_set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
 
 #ifndef CONFIG_USER_ONLY
@@ -428,7 +428,7 @@ static void riscv_max_cpu_init(Object *obj)
 #ifdef TARGET_RISCV32
     mlx = MXL_RV32;
 #endif
-    set_misa(env, mlx, 0);
+    riscv_cpu_set_misa(env, mlx, 0);
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), mlx == MXL_RV32 ?
@@ -441,7 +441,7 @@ static void rv64_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
-    set_misa(env, MXL_RV64, 0);
+    riscv_cpu_set_misa(env, MXL_RV64, 0);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -453,7 +453,8 @@ static void rv64_sifive_u_cpu_init(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
     CPURISCVState *env = &cpu->env;
-    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    riscv_cpu_set_misa(env, MXL_RV64,
+                       RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
@@ -471,7 +472,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
+    riscv_cpu_set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -488,7 +489,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU);
+    riscv_cpu_set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU);
     env->priv_ver = PRIV_VERSION_1_11_0;
 
     cpu->cfg.ext_zfa = true;
@@ -519,7 +520,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU | RVH);
+    riscv_cpu_set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU | RVH);
     env->priv_ver = PRIV_VERSION_1_12_0;
 
     /* Enable ISA extensions */
@@ -564,7 +565,7 @@ static void rv128_base_cpu_init(Object *obj)
     }
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
-    set_misa(env, MXL_RV128, 0);
+    riscv_cpu_set_misa(env, MXL_RV128, 0);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -576,7 +577,7 @@ static void rv32_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
-    set_misa(env, MXL_RV32, 0);
+    riscv_cpu_set_misa(env, MXL_RV32, 0);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -588,7 +589,8 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
     CPURISCVState *env = &cpu->env;
-    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    riscv_cpu_set_misa(env, MXL_RV32,
+                       RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
@@ -606,7 +608,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
+    riscv_cpu_set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -623,7 +625,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
+    riscv_cpu_set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
     env->priv_ver = PRIV_VERSION_1_11_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -641,7 +643,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
+    riscv_cpu_set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -1618,7 +1620,7 @@ static void riscv_init_max_cpu_extensions(Object *obj)
     const RISCVCPUMultiExtConfig *prop;
 
     /* Enable RVG, RVJ and RVV that are disabled by default */
-    set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
+    riscv_cpu_set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
 
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
         isa_ext_update_enabled(cpu, prop->offset, true);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7235eafc1a..9ec0805596 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -713,6 +713,7 @@ void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en);
 bool cpu_cfg_ext_is_user_set(uint32_t ext_offset);
 bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset);
 int cpu_cfg_ext_get_min_version(uint32_t ext_offset);
+void riscv_cpu_set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext);
 void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu);
 
 typedef struct RISCVCPUMultiExtConfig {
-- 
2.41.0


