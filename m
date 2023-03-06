Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIwr-0006zD-CU
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 17:04:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwn-0006ss-5q
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:45 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwj-0006sJ-CP
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:44 -0500
Received: by mail-pj1-x102b.google.com with SMTP id kb15so11315320pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 14:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140279;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RtEMb8lrKhAjSOEsp8LnxthrVZGJCuGv8/ZX06Qg6QU=;
 b=6+5tigqm/giyCuGeyMJS80MN4QLs2SseZdbPFE0UABsibTl5bTek+1gXD4JhS2C5py
 ddCvcShr/40/M/D+NdsetwecqS1EG1sVJnLCycI2MgfD7AIA/Yc1rk0zlp8uiE5X2RH3
 fjtroccJ8kVg2PalNhmQaOBm3TsjZWxVLHgzYi7mcMoqtlbpJVaD28ATftP6PveCx89G
 YKq1/q1q/3dE2MYtojgOPyY8NM4uGEl+g6m8lF1iVjCYMQ8Vs7ERzIUSC1W7JxqrwE2p
 qF1OWXpoyUYOa+jFss6gN96rsHjEnuwCaGfedfTYjVll6bZyoI3AOV8zATOYO6pYWk7d
 5EWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140279;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RtEMb8lrKhAjSOEsp8LnxthrVZGJCuGv8/ZX06Qg6QU=;
 b=Wx/F9fyT/4Tbk39m35NlHacA8jcv1C6GJ174vHWDIkjJbcM1BhYZC2WzbLvUBIM3Yy
 AUYfZw4qFEZVSJv4qw3OcszcgkqQmCLvKIBcaPpnmTedASEX0LbtyxiUFDqZaLdzVLs+
 479ULW1E9twGBFwaFElSB6K2J8nr8L7dZZdAA8oK0Bi/N7xFXrojEu4SQEQZS7ALg/DQ
 ytVZ9s3miKT7ltbNarGloXCrGjph3Et6BjrZlqLAgyszOIMxjg8RBRPgzKwU3FD5zz6f
 BIRwpsewEGTgKrJzHpGDKAQJ+60mgj937HIVNmAGplvHNNcFnzMLavJZUE3w2xE53CAR
 eG4Q==
X-Gm-Message-State: AO0yUKXmcbAS+RPZYHbexKL9Pd4C9QzVm2HlicRp0q5DvmGl6Ey33zs2
 S8qhSx7C1PAIX0CqSY5kTHz4KJttJZmjv2MxPJk=
X-Google-Smtp-Source: AK7set+MxG0LffpEri8Pq/t9wQOnuuYHN8e7SHFhqYaWilaci95ORBigypSY1OTSAOS1GrAYPPUVOg==
X-Received: by 2002:a17:902:d4cd:b0:19e:23c1:4c3d with SMTP id
 o13-20020a170902d4cd00b0019e23c14c3dmr15015152plg.2.1678140279389; 
 Mon, 06 Mar 2023 14:04:39 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 i18-20020a170902eb5200b00198e6257921sm7132420pli.269.2023.03.06.14.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:39 -0800 (PST)
Subject: [PULL 13/22] riscv: Introduce satp mode hw capabilities
Date: Mon,  6 Mar 2023 14:02:50 -0800
Message-Id: <20230306220259.7748-14-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Bin Meng <bmeng@tinylab.org>, 
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 22:04:45 -0000

From: Alexandre Ghiti <alexghiti@rivosinc.com>

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
Message-ID: <20230303131252.892893-5-alexghiti@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 93 ++++++++++++++++++++++++++++++++++------------
 target/riscv/cpu.h |  8 +++-
 2 files changed, 75 insertions(+), 26 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e1e8057836..1e97473af2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -313,17 +313,24 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
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
@@ -334,6 +341,13 @@ static void riscv_any_cpu_init(Object *obj)
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
@@ -347,6 +361,9 @@ static void rv64_base_cpu_init(Object *obj)
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
+#endif
 }
 
 static void rv64_sifive_u_cpu_init(Object *obj)
@@ -355,6 +372,9 @@ static void rv64_sifive_u_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
+#endif
 }
 
 static void rv64_sifive_e_cpu_init(Object *obj)
@@ -366,6 +386,9 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
+#endif
 }
 
 static void rv64_thead_c906_cpu_init(Object *obj)
@@ -395,6 +418,9 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     cpu->cfg.ext_xtheadsync = true;
 
     cpu->cfg.mvendorid = THEAD_VENDOR_ID;
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_SV39);
+#endif
 }
 
 static void rv128_base_cpu_init(Object *obj)
@@ -411,6 +437,9 @@ static void rv128_base_cpu_init(Object *obj)
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
+#endif
 }
 #else
 static void rv32_base_cpu_init(Object *obj)
@@ -421,6 +450,9 @@ static void rv32_base_cpu_init(Object *obj)
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
+#endif
 }
 
 static void rv32_sifive_u_cpu_init(Object *obj)
@@ -429,6 +461,9 @@ static void rv32_sifive_u_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
+#endif
 }
 
 static void rv32_sifive_e_cpu_init(Object *obj)
@@ -440,6 +475,9 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
+#endif
 }
 
 static void rv32_ibex_cpu_init(Object *obj)
@@ -451,6 +489,9 @@ static void rv32_ibex_cpu_init(Object *obj)
     register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu = false;
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
+#endif
     cpu->cfg.epmp = true;
 }
 
@@ -463,6 +504,9 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
+#endif
 }
 #endif
 
@@ -999,8 +1043,9 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
@@ -1013,9 +1058,10 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
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
@@ -1026,37 +1072,36 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
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
index 67ac665ff0..638e47c75a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -404,13 +404,17 @@ struct RISCVCPUClass {
 
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
2.39.2


