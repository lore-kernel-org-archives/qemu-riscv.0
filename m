Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY5I3-0005V6-OA
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 08:17:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pY5I1-0005Q7-Ga
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 08:17:37 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pY5Hz-0000lm-3E
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 08:17:37 -0500
Received: by mail-wm1-x333.google.com with SMTP id c18so1556364wmr.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 05:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677849453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hix5kOeHc8nzizoKp/ztxQ/gjG1xwiuccW2fey9YgT4=;
 b=T6mKxkvvifM4Winl3B1SBznTKiUC/pOTv8D6VIX6QPV495G09/pEBOkXfE1cW9rWzB
 0gwd7irFkJ6QZkNN4pIG2Irv/SvuI7YCAJ20UNzrWeTPfMoJqqjNgHm5MY2FpoWknS41
 IPTNs3ZzAULwxERR9f0U2UNvZoxE0cxaeEasmCFLni96/8V4vDIz2AAubW1brR07eezc
 QRHpDOS/captrIubkl2yBz3xIJYX1wzuFrM4co53K1lRTi6FYfPzb5ZOYcO2TMT3mdXB
 qoTiDMRaz91m+x2ksELxpVsayDIOXmT5eTtKHWDzYh1wTaEcsRU8mV6hULU9tmIFefhY
 zR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677849453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hix5kOeHc8nzizoKp/ztxQ/gjG1xwiuccW2fey9YgT4=;
 b=59EoHdH2IAhmzQu4SdORiH3dv5tG7sKLYvNd5X23nmUgwzsMZEMnP4wEqehinlkiyf
 LpeFW0ctVnYVl0eHf2clwMvXpZmkmasNncqveeP5pikFcRMvYRWGvg1iupnXGdYglmzA
 OXyOuPOHZwmrtRaC2nCFVmptrFkrOZqRjZS9Y5YRDs7xkz6i6sjzRwIpRK10nO/YeoEi
 gJ/SIiDEn/FADr4Xw+oojEnM8gKNimJ0e6t0Ho/eyK+wuN3/VTxj3Wxxk+X8OwTupYhg
 lV+1Vy3GLSZ/dN/UrSogDhl+Es9D4ZWtlIg2/du9LMa9ihukBR6UkP9EuN/tXZ7UgL5V
 nHDQ==
X-Gm-Message-State: AO0yUKWRmrYdGqEKAgZ4rTmHUzgVJW+TpqRqc81GiTJmqrzbDOIDxW81
 j2ypD5LI/xOaA+25OghlVt8Muw==
X-Google-Smtp-Source: AK7set++omav158QL5nAmEni/WHETv++QRxq4Ck4CEZUxJeP8mRTaj7yjGAclruXXHyF0eyh/i4jxA==
X-Received: by 2002:a05:600c:5127:b0:3ea:f01d:2346 with SMTP id
 o39-20020a05600c512700b003eaf01d2346mr1749541wms.15.1677849453625; 
 Fri, 03 Mar 2023 05:17:33 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
 by smtp.gmail.com with ESMTPSA id
 o33-20020a05600c512100b003e209186c07sm7263479wms.19.2023.03.03.05.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 05:17:33 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v11 4/5] riscv: Introduce satp mode hw capabilities
Date: Fri,  3 Mar 2023 14:12:51 +0100
Message-Id: <20230303131252.892893-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303131252.892893-1-alexghiti@rivosinc.com>
References: <20230303131252.892893-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 13:17:37 -0000

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
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 93 ++++++++++++++++++++++++++++++++++------------
 target/riscv/cpu.h |  8 +++-
 2 files changed, 75 insertions(+), 26 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6de2ca0eaa..d4584299db 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -306,17 +306,24 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
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
-        cpu->cfg.satp_mode.map |= (1 << (rv32 ? VM_1_10_SV32 : VM_1_10_SV57));
-    } else {
-        cpu->cfg.satp_mode.map |= (1 << VM_1_10_MBARE);
+    for (int i = 0; i <= satp_mode; ++i) {
+        if (valid_vm[i]) {
+            cpu->cfg.satp_mode.supported |= (1 << i);
+        }
     }
 }
+
+/* Set the satp mode to the max supported */
+static void set_satp_mode_default_map(RISCVCPU *cpu)
+{
+    cpu->cfg.satp_mode.map = cpu->cfg.satp_mode.supported;
+}
 #endif
 
 static void riscv_any_cpu_init(Object *obj)
@@ -327,6 +334,13 @@ static void riscv_any_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
+
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj),
+            riscv_cpu_mxl(&RISCV_CPU(obj)->env) == MXL_RV32 ?
+                                    VM_1_10_SV32 : VM_1_10_SV57);
+#endif
+
     set_priv_version(env, PRIV_VERSION_1_12_0);
     register_cpu_props(obj);
 }
@@ -340,6 +354,9 @@ static void rv64_base_cpu_init(Object *obj)
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
+#endif
 }
 
 static void rv64_sifive_u_cpu_init(Object *obj)
@@ -348,6 +365,9 @@ static void rv64_sifive_u_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
+#endif
 }
 
 static void rv64_sifive_e_cpu_init(Object *obj)
@@ -359,6 +379,9 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
+#endif
 }
 
 static void rv64_thead_c906_cpu_init(Object *obj)
@@ -388,6 +411,9 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     cpu->cfg.ext_xtheadsync = true;
 
     cpu->cfg.mvendorid = THEAD_VENDOR_ID;
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_SV39);
+#endif
 }
 
 static void rv128_base_cpu_init(Object *obj)
@@ -404,6 +430,9 @@ static void rv128_base_cpu_init(Object *obj)
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
+#endif
 }
 #else
 static void rv32_base_cpu_init(Object *obj)
@@ -414,6 +443,9 @@ static void rv32_base_cpu_init(Object *obj)
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
+#endif
 }
 
 static void rv32_sifive_u_cpu_init(Object *obj)
@@ -422,6 +454,9 @@ static void rv32_sifive_u_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
+#endif
 }
 
 static void rv32_sifive_e_cpu_init(Object *obj)
@@ -433,6 +468,9 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
+#endif
 }
 
 static void rv32_ibex_cpu_init(Object *obj)
@@ -444,6 +482,9 @@ static void rv32_ibex_cpu_init(Object *obj)
     register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu = false;
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
+#endif
     cpu->cfg.epmp = true;
 }
 
@@ -456,6 +497,9 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
+#endif
 }
 #endif
 
@@ -951,8 +995,9 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
@@ -965,9 +1010,10 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
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
@@ -978,37 +1024,36 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
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
index 7af91359a5..ad291ee13f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -417,13 +417,17 @@ struct RISCVCPUClass {
 
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


