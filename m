Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKiZT-0003bW-41
	for mharc-qemu-riscv@gnu.org; Wed, 25 Jan 2023 11:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKiZQ-0003aq-OP
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 11:24:20 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKiZN-0003P2-EF
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 11:24:20 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso1608836wmc.4
 for <qemu-riscv@nongnu.org>; Wed, 25 Jan 2023 08:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6DLFnzWQJKbL1snyDqmDZBp45O0VmPdl1PABcZWitl8=;
 b=L9lzqlgWmlSafdKnGRLfYOpu68CnEyQnWD+o0OYbUnfnjokDHWRu5HTH0VYA1SoXYq
 jnfdKagSQeGcat+ZNh+IKBh1cflfF0C1IDbmbUeXPZZ2h3+72UDIxax4flCIeRP5wfp1
 lvjpQyuB89Xi2H13crqZK6Z2N/IHDpS5dwlURPRsw0w8UOmyI2xfxqsCWHWnvs2YPRY2
 3I2zbjv9Xi2sYesSfqhJdiRlo+y0yrw+u3hGb4+OvML40YGF6KJKkzGaeTlWwlbQAJ8K
 ZvdsMkb3VwBY9fwnv52JE32O4F2hCRmGf2wXc+I3XN1f4Dsxlp3yBVX1ZLzG25lKLuze
 Lc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6DLFnzWQJKbL1snyDqmDZBp45O0VmPdl1PABcZWitl8=;
 b=lmcqRfVpJ6JOeP0PGAPuxU5tAo2h72IOuUWVi6BYdD2/CPiUX3k2HxnP5msRaDVASm
 hjRn3QUkuRuA2SyRExz6z9L9gmptoy4W76sKbNbrvscfEIcHGdYPBuMC1X+FNJlGK78q
 +JxnqDgu4Eu+Kc8tSU+WvGksyXnMrpryiv6WevpKG0cnoOajMOUpxRI5N+bzCwL6JVCR
 zwhllsd1CAWfcQhR6szMuJ3A9o17lDfMw8xOMalr8r7/5Y3Ivyu2lNg44LYjH9Mqw6kf
 sJnk3TQW4UPtZWwRkwbCvziR+zNX9z52ZkbA9k7MuXH7xqli74sUQaFA+mS3DSDTyUMM
 I2zg==
X-Gm-Message-State: AFqh2kpNSpNhQ5b3lI+GxfoTmkTVqUg7tAFildPEIoE44877ak5iJ6lN
 1PV/MrgWM6f9uMtR8GPWDY+Nhw==
X-Google-Smtp-Source: AMrXdXveWDAsfB4IV6jwzmnrjC25P32/FtUnWsnn5DZl4W8+MBNTQjMq7x3B4K6Bc/pfvjCU94g/Fw==
X-Received: by 2002:a05:600c:54d0:b0:3d9:7847:96e2 with SMTP id
 iw16-20020a05600c54d000b003d9784796e2mr32094930wmb.2.1674663855944; 
 Wed, 25 Jan 2023 08:24:15 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr.
 [2.7.42.160]) by smtp.gmail.com with ESMTPSA id
 bi24-20020a05600c3d9800b003d1d5a83b2esm2228191wmb.35.2023.01.25.08.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 08:24:15 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v8 4/5] riscv: Introduce satp mode hw capabilities
Date: Wed, 25 Jan 2023 17:20:09 +0100
Message-Id: <20230125162010.1615787-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230125162010.1615787-1-alexghiti@rivosinc.com>
References: <20230125162010.1615787-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Wed, 25 Jan 2023 16:24:21 -0000

Currently, the max satp mode is set with the only constraint that it must be
implemented in qemu, i.e. set in valid_vm_1_10_[32|64].

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
 target/riscv/cpu.c | 74 +++++++++++++++++++++++++++++++---------------
 target/riscv/cpu.h |  8 +++--
 2 files changed, 56 insertions(+), 26 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 54494a72be..e7e1fb96dc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -292,26 +292,36 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
     g_assert_not_reached();
 }
 
-/* Sets the satp mode to the max supported */
-static void set_satp_mode_default(RISCVCPU *cpu)
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
 
+/* Sets the satp mode to the max supported */
+static void set_satp_mode_default(RISCVCPU *cpu)
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
@@ -354,11 +371,13 @@ static void rv128_base_cpu_init(Object *obj)
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
@@ -369,13 +388,17 @@ static void rv32_base_cpu_init(Object *obj)
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
@@ -386,6 +409,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
 }
 
 static void rv32_ibex_cpu_init(Object *obj)
@@ -396,6 +420,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu = false;
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
     cpu->cfg.epmp = true;
 }
 
@@ -407,6 +432,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
 }
 #endif
 
@@ -698,8 +724,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
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
@@ -713,9 +740,9 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
              */
             for (int i = 1; i < 16; ++i) {
                 if ((cpu->cfg.satp_mode.init & (1 << i)) &&
-                    valid_vm[i]) {
+                    (cpu->cfg.satp_mode.supported & (1 << i))) {
                     for (int j = i - 1; j >= 0; --j) {
-                        if (valid_vm[j]) {
+                        if (cpu->cfg.satp_mode.supported & (1 << j)) {
                             cpu->cfg.satp_mode.map |= (1 << j);
                             break;
                         }
@@ -726,36 +753,35 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
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
+    for (int i = satp_mode_map_max - 1; i >= 0; --i) {
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


