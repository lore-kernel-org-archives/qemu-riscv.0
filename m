Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phDEr-00088H-GH
	for mharc-qemu-riscv@gnu.org; Tue, 28 Mar 2023 13:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phDEq-000884-0y
 for qemu-riscv@nongnu.org; Tue, 28 Mar 2023 13:36:04 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phDEo-0005MC-C2
 for qemu-riscv@nongnu.org; Tue, 28 Mar 2023 13:36:03 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-17786581fe1so13493791fac.10
 for <qemu-riscv@nongnu.org>; Tue, 28 Mar 2023 10:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680024961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nG8maGkUaqGATRWGqElr61HEeYmxQ4huBBDCKZeHzyk=;
 b=gPunUNSQCq4pi6QfzXcwZSrGengR/72lTs1K4d4nm3zXTzev+5oXOsTBnTCq9Bbnx2
 fBlGQLk0UzCkkJh7bQYvc59+fZP0k+YkXrsZq8u6pWdf+tN50LIKIe99AlVEj2uMoL37
 HI2+1Lw8QZ/tnIYCZVuQkqz8xuTKyU6vU3qfN7MPT5iwLEJFRg1UuxMA8DaSX9kGXhxP
 3QAdHoJTyC04oPX9Ms3qkWDVoGYTjLqbfv5+eW2UhxSOjrSb8R6Jur6oBd0MpdHxzUg0
 7HTsG9z1GdZ1nfuxX39sKs4baxRqo1TIKqBliqdvC6c6+RmxTeP85Hvq8coo+Ew39qS8
 Lunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680024961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nG8maGkUaqGATRWGqElr61HEeYmxQ4huBBDCKZeHzyk=;
 b=AkO6Jaam62ghtRp8SnlIgV6hAKoS3CWs3RDB4Tmtg4sL1KkMnZndh1/n6aq8pdGs+2
 7FFYcKOWSKPYinQCr9eNO/j2p5u4HgbiVeAB61eJgat1f9U+Ir4N0HOu+WncALxJaAmP
 uVfUJRnLLPErJrDyd388oceZ1cNirQ0e1ipDh+pisuSTfLpObkpwYdK8VzzPwNgoixlu
 Buzw8c1od2Y1bVm7zelMuwe6Ma0j3VzrtCfAq5g7Fr31GdRie9UELaZlyAYLxpQEQ+BH
 +iXds3U6HF1NTJzyQCh1TsefshU/UPwsM4iDUHA/bBs7eZPYD/WLE4DIjRH9qqCS50AY
 fWDA==
X-Gm-Message-State: AO0yUKW9WOulE+gC6nUXfa1MrwED+o3bz+MdHuClF4f+TCT0n7o+bzkK
 x6QLyfUS/YpoISyNTMSjpw0mDg==
X-Google-Smtp-Source: AK7set8fbtrpGavhHRzEzOuRJCle53ntABuZjbHmkTYcIgejKAIjeLOXgQ3N4izVG8Jt81sCORi8ig==
X-Received: by 2002:a05:6870:ec86:b0:17a:b060:7b0c with SMTP id
 eo6-20020a056870ec8600b0017ab0607b0cmr10356313oab.41.1680024961677; 
 Tue, 28 Mar 2023 10:36:01 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m2-20020a9d6442000000b0069f0a85fa36sm11635654otl.57.2023.03.28.10.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 10:36:01 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 3/9] target/riscv/cpu.c: remove set_priv_version()
Date: Tue, 28 Mar 2023 14:35:37 -0300
Message-Id: <20230328173543.431342-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328173543.431342-1-dbarboza@ventanamicro.com>
References: <20230328173543.431342-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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
X-List-Received-Date: Tue, 28 Mar 2023 17:36:04 -0000

The setter is doing nothing special. Just set env->priv_ver directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f59e52ae4d..b40d76fcb9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -241,11 +241,6 @@ static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
     env->misa_ext_mask = env->misa_ext = ext;
 }
 
-static void set_priv_version(CPURISCVState *env, int priv_ver)
-{
-    env->priv_ver = priv_ver;
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint8_t satp_mode_from_str(const char *satp_mode_str)
 {
@@ -344,7 +339,7 @@ static void riscv_any_cpu_init(Object *obj)
                                     VM_1_10_SV32 : VM_1_10_SV57);
 #endif
 
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 }
 
 #if defined(TARGET_RISCV64)
@@ -355,7 +350,7 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -365,7 +360,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
 #endif
@@ -377,7 +372,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -390,7 +385,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU);
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    env->priv_ver = PRIV_VERSION_1_11_0;
 
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
@@ -424,7 +419,7 @@ static void rv128_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV128, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -437,7 +432,7 @@ static void rv32_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
@@ -447,7 +442,7 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
@@ -459,7 +454,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -472,7 +467,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    env->priv_ver = PRIV_VERSION_1_11_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -486,7 +481,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -1114,7 +1109,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (priv_version >= PRIV_VERSION_1_10_0) {
-        set_priv_version(env, priv_version);
+        env->priv_ver = priv_version;
     }
 
     riscv_cpu_validate_misa_priv(env, &local_err);
-- 
2.39.2


