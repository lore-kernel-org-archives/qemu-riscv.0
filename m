Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7qh-0005MF-Jv
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qf-0005Lk-W5
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:06 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qe-0002fW-A1
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:05 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 m25-20020a05683026d900b006941a2838caso8735355otu.7
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y4yZ3wAir0o7gPbOYm0TNhTOmu7uQyMFvLvYKMxOY/Q=;
 b=QQqJjv3bB0AT64UkXTDXC6oJ2s2T+/YMGmE3iL7ZkYjTIkDPeT+Jr0Wz4/PHCyGdXg
 1CpKr34pJMDGoi6LrBGF480rFe6+TRnePWC9xDfLN+foCzd2TmeStOFzaauQLZf9HRqv
 8eOTFSKscLAc1nPnfxD93A0tPsEcISg1Lnj1UBSKkuhYwJC85NPklggL8MMSVrdSOMT5
 FPG/ai9R6TD4AWnayBCZzVFfO2MyYcYuVQ/Q6YPUoin1xAm7IqrMXbya1I4fSghJevJm
 9L9lnOCk3qjWQF1mb6TgFiFWij/eNfSMMM6F5F3pH5trJKappiptdiQUouSirTHQIIT7
 OvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4yZ3wAir0o7gPbOYm0TNhTOmu7uQyMFvLvYKMxOY/Q=;
 b=t0kA0qq6NNQW2KNBBDRp0fUhEYhifAlaKgftCf6Szss+QoD0yYbXAp0r/OteLoVUSz
 zrXy/TaLyQutbduVGi8+dJLCq8ji+yRt3DHPjwNwDtaThAa57oVoAE4trxrc7wYjuP2P
 cA9/MPxaR+qRny8LfkElRTLTm13/IQgWkRJrzomKF7mQR5NZvu6sl9tAQelgDNogCIrD
 VvP73JFBjmnXOP2m8J8okL6bOz5XIuciYcWcLhAOZw68jSVE9sPJoQ95mi0XSjqlfINZ
 Zb5gxyt0G90xjhWrjTMA/9VrUmWkhEC7nwci1YZDfyGITAYW6acmUgnqEgFypsgYDSRS
 K5fA==
X-Gm-Message-State: AO0yUKWJEGZ1Mbrr7duq5p2T7Jh4FqaYLJgh7ICNEpURbUAKW/bBU7D9
 trHFPsr+FwT66bQFK7kL1cC1/h+HzTb/yaSoutw=
X-Google-Smtp-Source: AK7set8Pes9JnGSAlgi8N4NBz/XBFxz3OQffhipcjLqEASgYAOMhc2ORgLGTNHvhnw3QrQmtvpuZJw==
X-Received: by 2002:a05:6830:71b:b0:694:88fa:b82f with SMTP id
 y27-20020a056830071b00b0069488fab82fmr12624360ots.27.1678812603086; 
 Tue, 14 Mar 2023 09:50:03 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:02 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 03/26] target/riscv/cpu.c: remove set_priv_version()
Date: Tue, 14 Mar 2023 13:49:25 -0300
Message-Id: <20230314164948.539135-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x329.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:50:06 -0000

The setter is doing nothing special. Just set env->priv_ver directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2752efe1eb..18032dfd4e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -240,11 +240,6 @@ static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
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
@@ -343,7 +338,7 @@ static void riscv_any_cpu_init(Object *obj)
                                     VM_1_10_SV32 : VM_1_10_SV57);
 #endif
 
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
     register_cpu_props(obj);
 }
 
@@ -355,7 +350,7 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -366,7 +361,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
 #endif
@@ -379,7 +374,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -392,7 +387,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    env->priv_ver = PRIV_VERSION_1_11_0;
 
     cpu->cfg.ext_g = true;
     cpu->cfg.ext_c = true;
@@ -431,7 +426,7 @@ static void rv128_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV128, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -444,7 +439,7 @@ static void rv32_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
@@ -454,8 +449,9 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
@@ -468,7 +464,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -482,7 +478,7 @@ static void rv32_ibex_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    env->priv_ver = PRIV_VERSION_1_11_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -497,7 +493,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -1160,7 +1156,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (priv_version >= PRIV_VERSION_1_10_0) {
-        set_priv_version(env, priv_version);
+        env->priv_ver = priv_version;
     }
 
     /* Force disable extensions if priv spec version does not match */
-- 
2.39.2


