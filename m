Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNp9b-0007sk-Tw
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 01:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pNp9a-0007nm-B5
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 01:02:30 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pNp9Y-0004bz-5o
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 01:02:30 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so5276075wmb.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Feb 2023 22:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OoYnfsPGC4YzH0gLFSaqudQhDw8Je9J6sbexhYb7S3E=;
 b=di3RmN6neuRvhFj74Jdh8cNfACX92+hua0JPKZ0GuNHgJMGNw3+p9chwqzGlErnhPS
 tSP8R+4EdTW9/SkSUZKkI292bIRcktYo8E7Fo+VM8Xr/KfBeqD6MQqnblDWBKUCWLSc+
 LlUrau4mtUdWrobTUuckkMiO8NrTGIv7EwjgaejHWbqSoZB/s9aJOWNByzMoGYMgTFaw
 C08qk44dC5F+b/JXMfKwgknlbn1KoJbURCu5ZdySat51dm2uf4sQePQECMdYGxYnPSG+
 lQcSnvdC+oLqZSxMu2EOdGysuDHQxauKpjhEnz59BJbMbgD4HS1HD0clr+c9ED+r4rSq
 aozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OoYnfsPGC4YzH0gLFSaqudQhDw8Je9J6sbexhYb7S3E=;
 b=qymfiLScLfQ2rsfU4h4+CXaryzPOOkKwj0nrLrACewhPhNu46VKQ25ZNdo1q5iWCe3
 s9IVQ7egH6M2s/bp4o8mFr0gfo74d54OLwM3/yXHM1tO7BPxxegq9bwU/RTN3YgEN5lu
 oTXG7dbE34DBxSWoA7dRRAI0D73VsK7O/sdtdmUuq7xwfwHZar2eXmPdLiyiuZnN6ATZ
 nadc15PriD4Ao8zTFmmI9GF+YL9iFlDPAYXNUd92c9OG632HLTIxPbeP3nkb6LAVXdnU
 BN6SscITizGljZky2y2JYIhzznfKF7DLZzLZBrvmDBf8HfPZw5x4v81phy5h16dOdFsF
 mx5Q==
X-Gm-Message-State: AO0yUKWQU9jMXWc7GPbXymECDcGvOIVBXctmlY7v8AEzcY5NBZWkJJJR
 NwW/HLhymUxZAtt2rNesifY6IQ==
X-Google-Smtp-Source: AK7set9sC7O0zw55W4LTKCf5ji2RSXtbHrjIpIPDb3+oq9/V3vxNi1orM/5er9eyBLzufP2TMLZ1wQ==
X-Received: by 2002:a1c:7718:0:b0:3dc:5805:9d75 with SMTP id
 t24-20020a1c7718000000b003dc58059d75mr8653943wmi.18.1675404145750; 
 Thu, 02 Feb 2023 22:02:25 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr.
 [2.7.42.160]) by smtp.gmail.com with ESMTPSA id
 v17-20020a05600c445100b003dc433355aasm1762707wmn.18.2023.02.02.22.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 22:02:25 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v10 4/5] riscv: Introduce satp mode hw capabilities
Date: Fri,  3 Feb 2023 06:58:11 +0100
Message-Id: <20230203055812.257458-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203055812.257458-1-alexghiti@rivosinc.com>
References: <20230203055812.257458-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 06:02:30 -0000

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
---
 target/riscv/cpu.c | 91 +++++++++++++++++++++++++++++++++-------------
 target/riscv/cpu.h |  8 +++-
 2 files changed, 72 insertions(+), 27 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 56057cf87c..7e9924ede9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -293,18 +293,24 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
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
+
+/* Set the satp mode to the max supported */
+static void set_satp_mode_default_map(RISCVCPU *cpu)
+{
+    cpu->cfg.satp_mode.map = cpu->cfg.satp_mode.supported;
+}
 #endif
 
 static void riscv_any_cpu_init(Object *obj)
@@ -315,6 +321,13 @@ static void riscv_any_cpu_init(Object *obj)
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
@@ -328,6 +341,9 @@ static void rv64_base_cpu_init(Object *obj)
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
+#endif
 }
 
 static void rv64_sifive_u_cpu_init(Object *obj)
@@ -335,6 +351,9 @@ static void rv64_sifive_u_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
+#endif
 }
 
 static void rv64_sifive_e_cpu_init(Object *obj)
@@ -345,6 +364,9 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
+#endif
 }
 
 static void rv128_base_cpu_init(Object *obj)
@@ -361,6 +383,9 @@ static void rv128_base_cpu_init(Object *obj)
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
+#endif
 }
 #else
 static void rv32_base_cpu_init(Object *obj)
@@ -371,6 +396,9 @@ static void rv32_base_cpu_init(Object *obj)
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
+#endif
 }
 
 static void rv32_sifive_u_cpu_init(Object *obj)
@@ -378,6 +406,9 @@ static void rv32_sifive_u_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
+#endif
 }
 
 static void rv32_sifive_e_cpu_init(Object *obj)
@@ -388,6 +419,9 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
+#endif
 }
 
 static void rv32_ibex_cpu_init(Object *obj)
@@ -398,6 +432,9 @@ static void rv32_ibex_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu = false;
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
+#endif
     cpu->cfg.epmp = true;
 }
 
@@ -409,6 +446,9 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
+#endif
 }
 #endif
 
@@ -701,8 +741,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
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
@@ -715,9 +756,10 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
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
@@ -728,37 +770,36 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
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
index df6d9e06e4..defc5769b5 100644
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


