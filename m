Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMqur-0003yH-CN
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 08:43:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMquq-0003xx-2i
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 08:43:16 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMquo-0006Ln-3X
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 08:43:15 -0500
Received: by mail-wr1-x435.google.com with SMTP id t7so5886135wrp.5
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 05:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xr8l2kRHet+WGvZ91sTorq6F44YCzLQrc8tXbbSCvKg=;
 b=MqM5lEinciXBWajqof4C//fBExmr3SFmwkkNcOBJlYx/h7zg04ClJWTq6UNwjluALH
 PlHsvMgJxgaukU0OYOBczfSuRtuOxof6YDyekJbWZ3WehM7hxYC8T439MxcnwP7N4yNw
 oImn4tvyBD1B06M8TuPkjvtqOb3n2YBIlqFAxcZ8wB/RbTVcMzInV4NgDcLPVPg9KU1A
 JCEVt86V4tk6Qw5PsFGp481sAscni/y/UYldOvWGSFOa8iBiAnfDfwQyehfngo22hfJ5
 mROdQiar4du1S0ubPi7e99o5tJ3xFPR46rrXcF+5MJz6DsCboC5FdG87g1pyiHXFT0ez
 BfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xr8l2kRHet+WGvZ91sTorq6F44YCzLQrc8tXbbSCvKg=;
 b=0oMOlNqZp37+d0N//8SSC+rdwBTRsmbxczjZH2i2SbiwabwiCJH2bwsqMpN/KGjKD6
 BcF1Ep65oR3LEVFpRzvP9XFj5+YbasNZw56XiKEUtjSdamD/ohAWgPXzMY6Ln8MQc8EX
 PG/STKrzbyNLd+3B9NIGee8Px+SlNkhnams9BvHrkzXGz6JY1uiY67w2+TEiGvGWceyZ
 e/LsVL7aqzn+81r0sCMDGrJ3hxbWgC0kw0IeMejLWhff7jNfgpbXx7WhmfvrVqoutuDz
 9xQnkN1AL5OMYaZYI/cm19CAsDvs5bT1zccYq3mqW+6nNjEXhUbdlFLe1Y58wpK27TBA
 20XA==
X-Gm-Message-State: AO0yUKW5n61vak9hl/4X2eCemDReYh/aZV2Ph0MZASmFyHSuvtkaup1x
 dyj5ShbjYsduZ0lWDCRWJ+/vtDgiuRqIFQaD
X-Google-Smtp-Source: AK7set/JXsj1d3DPJPO7x3X67IhSmvGgTgh0MkjgpAgXh/TeiSKJGNAPBt08vr42jvGc+iYE2N6N0g==
X-Received: by 2002:a5d:610f:0:b0:2bf:ede3:988a with SMTP id
 v15-20020a5d610f000000b002bfede3988amr6829997wrt.22.1675172592608; 
 Tue, 31 Jan 2023 05:43:12 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a5d4d0e000000b002bde537721dsm14674268wrt.20.2023.01.31.05.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 05:43:12 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v9 4/5] riscv: Introduce satp mode hw capabilities
Date: Tue, 31 Jan 2023 14:39:05 +0100
Message-Id: <20230131133906.1956228-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230131133906.1956228-1-alexghiti@rivosinc.com>
References: <20230131133906.1956228-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 31 Jan 2023 13:43:16 -0000

Currently, the max satp mode is set with the only constraint that it must be
implemented in QEMU, i.e. set in valid_vm_1_10_[32|64].

But we actually need to add another level of constraint: what the hw is
actually capable of, because currently, a linux booting on a sifive-u54
boots in sv57 mode which is incompatible with the cpu's sv39 max
capability.

So add a new bitmap to RISCVSATPMap which contains this capability and
initialize it in every XXX_cpu_init.

Finally:
- valid_vm_1_10_[32|64] constrains which satp mode the CPU can use
- the CPU hw capabilities constrains what the user may select
- the user's selection then constrains what's available to the guest
  OS.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 79 +++++++++++++++++++++++++++++++---------------
 target/riscv/cpu.h |  8 +++--
 2 files changed, 60 insertions(+), 27 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3a7a1746aa..6dd76355ec 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -292,26 +292,36 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
     g_assert_not_reached();
 }
 
-/* Sets the satp mode to the max supported */
-static void set_satp_mode_default_map(RISCVCPU *cpu)
+static void set_satp_mode_max_supported(RISCVCPU *cpu,
+                                        uint8_t satp_mode)
 {
     bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
+    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
 
-    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
-        cpu->cfg.satp_mode.map |=
-                        (1 << satp_mode_from_str(rv32 ? "sv32" : "sv57"));
-    } else {
-        cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str("mbare"));
+    for (int i = 0; i <= satp_mode; ++i) {
+        if (valid_vm[i]) {
+            cpu->cfg.satp_mode.supported |= (1 << i);
+        }
     }
 }
 
+/* Set the satp mode to the max supported */
+static void set_satp_mode_default_map(RISCVCPU *cpu)
+{
+    cpu->cfg.satp_mode.map = cpu->cfg.satp_mode.supported;
+}
+
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
 #if defined(TARGET_RISCV32)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
 #endif
     set_priv_version(env, PRIV_VERSION_1_12_0);
     register_cpu_props(obj);
@@ -321,18 +331,24 @@ static void riscv_any_cpu_init(Object *obj)
 static void rv64_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
+    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
 }
 
 static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+    set_satp_mode_max_supported(cpu, VM_1_10_SV39);
 }
 
 static void rv64_sifive_e_cpu_init(Object *obj)
@@ -343,6 +359,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
 }
 
 static void rv128_base_cpu_init(Object *obj)
@@ -354,28 +371,36 @@ static void rv128_base_cpu_init(Object *obj)
         exit(EXIT_FAILURE);
     }
     CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
+    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
 }
 #else
 static void rv32_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
+    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
 }
 
 static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
 }
 
 static void rv32_sifive_e_cpu_init(Object *obj)
@@ -386,6 +411,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
 }
 
 static void rv32_ibex_cpu_init(Object *obj)
@@ -396,6 +422,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu = false;
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
     cpu->cfg.epmp = true;
 }
 
@@ -407,6 +434,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
 }
 #endif
 
@@ -698,8 +726,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
 {
     bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
-    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
-    uint8_t satp_mode_max;
+    uint8_t satp_mode_map_max;
+    uint8_t satp_mode_supported_max =
+                        satp_mode_max_from_map(cpu->cfg.satp_mode.supported);
 
     if (cpu->cfg.satp_mode.map == 0) {
         if (cpu->cfg.satp_mode.init == 0) {
@@ -712,9 +741,10 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
              * valid_vm_1_10_32/64.
              */
             for (int i = 1; i < 16; ++i) {
-                if ((cpu->cfg.satp_mode.init & (1 << i)) && valid_vm[i]) {
+                if ((cpu->cfg.satp_mode.init & (1 << i)) &&
+                    (cpu->cfg.satp_mode.supported & (1 << i))) {
                     for (int j = i - 1; j >= 0; --j) {
-                        if (valid_vm[j]) {
+                        if (cpu->cfg.satp_mode.supported & (1 << j)) {
                             cpu->cfg.satp_mode.map |= (1 << j);
                             break;
                         }
@@ -725,37 +755,36 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
         }
     }
 
-    /* Make sure the configuration asked is supported by qemu */
-    for (int i = 0; i < 16; ++i) {
-        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
-            error_setg(errp, "satp_mode %s is not valid",
-                       satp_mode_str(i, rv32));
-            return;
-        }
+    satp_mode_map_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
+
+    /* Make sure the user asked for a supported configuration (HW and qemu) */
+    if (satp_mode_map_max > satp_mode_supported_max) {
+        error_setg(errp, "satp_mode %s is higher than hw max capability %s",
+                   satp_mode_str(satp_mode_map_max, rv32),
+                   satp_mode_str(satp_mode_supported_max, rv32));
+        return;
     }
 
     /*
      * Make sure the user did not ask for an invalid configuration as per
      * the specification.
      */
-    satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
-
     if (!rv32) {
-        for (int i = satp_mode_max - 1; i >= 0; --i) {
+        for (int i = satp_mode_map_max - 1; i >= 0; --i) {
             if (!(cpu->cfg.satp_mode.map & (1 << i)) &&
                 (cpu->cfg.satp_mode.init & (1 << i)) &&
-                valid_vm[i]) {
+                (cpu->cfg.satp_mode.supported & (1 << i))) {
                 error_setg(errp, "cannot disable %s satp mode if %s "
                            "is enabled", satp_mode_str(i, false),
-                           satp_mode_str(satp_mode_max, false));
+                           satp_mode_str(satp_mode_map_max, false));
                 return;
             }
         }
     }
 
     /* Finally expand the map so that all valid modes are set */
-    for (int i = satp_mode_max - 1; i >= 0; --i) {
-        if (valid_vm[i]) {
+    for (int i = satp_mode_map_max - 1; i >= 0; --i) {
+        if (cpu->cfg.satp_mode.supported & (1 << i)) {
             cpu->cfg.satp_mode.map |= (1 << i);
         }
     }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e37177db5c..b591122099 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -416,13 +416,17 @@ struct RISCVCPUClass {
 
 /*
  * map is a 16-bit bitmap: the most significant set bit in map is the maximum
- * satp mode that is supported.
+ * satp mode that is supported. It may be chosen by the user and must respect
+ * what qemu implements (valid_1_10_32/64) and what the hw is capable of
+ * (supported bitmap below).
  *
  * init is a 16-bit bitmap used to make sure the user selected a correct
  * configuration as per the specification.
+ *
+ * supported is a 16-bit bitmap used to reflect the hw capabilities.
  */
 typedef struct {
-    uint16_t map, init;
+    uint16_t map, init, supported;
 } RISCVSATPMap;
 
 struct RISCVCPUConfig {
-- 
2.37.2


