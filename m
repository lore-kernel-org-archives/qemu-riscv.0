Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIwn-0006sh-5F
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 17:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwl-0006lQ-8E
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:43 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwi-0006rw-2P
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:42 -0500
Received: by mail-pl1-x62b.google.com with SMTP id i5so12106378pla.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 14:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140278;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wZX1Gf/M9wzc6uXPUobkwnWxwrZxb7bq0aPefOtNe3g=;
 b=oCOieO4WqHK+l/d+jry7hlPY98QWh0A+sMA0eBOkDXQ31iGFOLRzmR0JIa75FDjeM0
 bdlOBJc7tYd9HJv26XJ2R1ZM32/8p1ZhuzGz+2THEHCYTqAH6tifmqXExijcoqGzw6zY
 h5+49MxqVQLEldYcvvslfXD+JZIjPgdrHRqu4iJFAQy14Phg0cWYbKM1Ims8mPI8YONh
 9gwyl8FyIDlNf4mYLj16tmdNAVTg3FkZs8D0ZSsqY6pvgEr0e67OPQP8bvIa2Y+3NxwG
 mudi30eT4FFLQ8wLPySraWNKqK5f3yWRGUHTKyXqgCCnmYpaMB3SHOE0FiN100jWqf2T
 InRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140278;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wZX1Gf/M9wzc6uXPUobkwnWxwrZxb7bq0aPefOtNe3g=;
 b=Smrew5b+rA1uRD/996clxlxFX6wcCc9ZbLZY1M9SpyxBV+PPHyUXmM9dF0H/DNJdHf
 6fkQtZxl2U5+K63UXJ/r5KP0sHkx68MS0ssqD86egO7Jb4NyPhw3yV5gaCLdSXxVCOgM
 KKWxBU7EmO2jwN4HbwAMqfjRqtptuR8nIfhScLlSneLD3on2YfWlznT0pABnv9tfmxFN
 SJepklrwl4IcJ7lFCoVKZfphlokqsJmQ3sZuDG3JG0KIPW0RvqrblR8DrDtsYRG5Gd36
 juICQS7cCBwITjpG29zBoVXCYZNptxfG0K7CfKUVC23F+B/STLgscQyT3psbs19qhCoJ
 7Yqw==
X-Gm-Message-State: AO0yUKX6O6ecjH6fKldKFmhxvxytNnr0eSPNoZKSnTDhddoybJcYfExY
 xDspX8acxU2mAovwtlrz4koCDuqbKbWRQS2CiJk=
X-Google-Smtp-Source: AK7set+E9e7FP73uNPc0I5vddYBl5c+BM91+Hn8G99OegzE63wUFQfrV/H2AHpvxQE9S/fZyS83p1w==
X-Received: by 2002:a17:902:f80f:b0:19c:df17:b724 with SMTP id
 ix15-20020a170902f80f00b0019cdf17b724mr10775327plb.58.1678140278332; 
 Mon, 06 Mar 2023 14:04:38 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 ko4-20020a17090307c400b00186b7443082sm7167201plb.195.2023.03.06.14.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:38 -0800 (PST)
Subject: [PULL 12/22] riscv: Allow user to set the satp mode
Date: Mon,  6 Mar 2023 14:02:49 -0800
Message-Id: <20230306220259.7748-13-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Ludovic Henry <ludovic@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, 
 Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 22:04:43 -0000

From: Alexandre Ghiti <alexghiti@rivosinc.com>

RISC-V specifies multiple sizes for addressable memory and Linux probes for
the machine's support at startup via the satp CSR register (done in
csr.c:validate_vm).

As per the specification, sv64 must support sv57, which in turn must
support sv48...etc. So we can restrict machine support by simply setting the
"highest" supported mode and the bare mode is always supported.

You can set the satp mode using the new properties "sv32", "sv39", "sv48",
"sv57" and "sv64" as follows:
-cpu rv64,sv57=on  # Linux will boot using sv57 scheme
-cpu rv64,sv39=on  # Linux will boot using sv39 scheme
-cpu rv64,sv57=off # Linux will boot using sv48 scheme
-cpu rv64          # Linux will boot using sv57 scheme by default

We take the highest level set by the user:
-cpu rv64,sv48=on,sv57=on # Linux will boot using sv57 scheme

We make sure that invalid configurations are rejected:
-cpu rv64,sv39=off,sv48=on # sv39 must be supported if higher modes are
                           # enabled

We accept "redundant" configurations:
-cpu rv64,sv48=on,sv57=off # Linux will boot using sv48 scheme

And contradictory configurations:
-cpu rv64,sv48=on,sv48=off # Linux will boot using sv39 scheme

Co-Developed-by: Ludovic Henry <ludovic@rivosinc.com>
Signed-off-by: Ludovic Henry <ludovic@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-ID: <20230303131252.892893-4-alexghiti@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 214 +++++++++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h |  21 +++++
 target/riscv/csr.c |  12 ++-
 3 files changed, 240 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1c4d8aaa74..e1e8057836 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -28,6 +28,7 @@
 #include "time_helper.h"
 #include "exec/exec-all.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
 #include "qemu/error-report.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
@@ -249,6 +250,82 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
     env->vext_ver = vext_ver;
 }
 
+#ifndef CONFIG_USER_ONLY
+static uint8_t satp_mode_from_str(const char *satp_mode_str)
+{
+    if (!strncmp(satp_mode_str, "mbare", 5)) {
+        return VM_1_10_MBARE;
+    }
+
+    if (!strncmp(satp_mode_str, "sv32", 4)) {
+        return VM_1_10_SV32;
+    }
+
+    if (!strncmp(satp_mode_str, "sv39", 4)) {
+        return VM_1_10_SV39;
+    }
+
+    if (!strncmp(satp_mode_str, "sv48", 4)) {
+        return VM_1_10_SV48;
+    }
+
+    if (!strncmp(satp_mode_str, "sv57", 4)) {
+        return VM_1_10_SV57;
+    }
+
+    if (!strncmp(satp_mode_str, "sv64", 4)) {
+        return VM_1_10_SV64;
+    }
+
+    g_assert_not_reached();
+}
+
+uint8_t satp_mode_max_from_map(uint32_t map)
+{
+    /* map here has at least one bit set, so no problem with clz */
+    return 31 - __builtin_clz(map);
+}
+
+const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
+{
+    if (is_32_bit) {
+        switch (satp_mode) {
+        case VM_1_10_SV32:
+            return "sv32";
+        case VM_1_10_MBARE:
+            return "none";
+        }
+    } else {
+        switch (satp_mode) {
+        case VM_1_10_SV64:
+            return "sv64";
+        case VM_1_10_SV57:
+            return "sv57";
+        case VM_1_10_SV48:
+            return "sv48";
+        case VM_1_10_SV39:
+            return "sv39";
+        case VM_1_10_MBARE:
+            return "none";
+        }
+    }
+
+    g_assert_not_reached();
+}
+
+/* Sets the satp mode to the max supported */
+static void set_satp_mode_default_map(RISCVCPU *cpu)
+{
+    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
+
+    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
+        cpu->cfg.satp_mode.map |= (1 << (rv32 ? VM_1_10_SV32 : VM_1_10_SV57));
+    } else {
+        cpu->cfg.satp_mode.map |= (1 << VM_1_10_MBARE);
+    }
+}
+#endif
+
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -918,6 +995,87 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     set_misa(env, env->misa_mxl, ext);
 }
 
+#ifndef CONFIG_USER_ONLY
+static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
+{
+    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
+    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
+    uint8_t satp_mode_max;
+
+    if (cpu->cfg.satp_mode.map == 0) {
+        if (cpu->cfg.satp_mode.init == 0) {
+            /* If unset by the user, we fallback to the default satp mode. */
+            set_satp_mode_default_map(cpu);
+        } else {
+            /*
+             * Find the lowest level that was disabled and then enable the
+             * first valid level below which can be found in
+             * valid_vm_1_10_32/64.
+             */
+            for (int i = 1; i < 16; ++i) {
+                if ((cpu->cfg.satp_mode.init & (1 << i)) && valid_vm[i]) {
+                    for (int j = i - 1; j >= 0; --j) {
+                        if (valid_vm[j]) {
+                            cpu->cfg.satp_mode.map |= (1 << j);
+                            break;
+                        }
+                    }
+                    break;
+                }
+            }
+        }
+    }
+
+    /* Make sure the configuration asked is supported by qemu */
+    for (int i = 0; i < 16; ++i) {
+        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
+            error_setg(errp, "satp_mode %s is not valid",
+                       satp_mode_str(i, rv32));
+            return;
+        }
+    }
+
+    /*
+     * Make sure the user did not ask for an invalid configuration as per
+     * the specification.
+     */
+    satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
+
+    if (!rv32) {
+        for (int i = satp_mode_max - 1; i >= 0; --i) {
+            if (!(cpu->cfg.satp_mode.map & (1 << i)) &&
+                (cpu->cfg.satp_mode.init & (1 << i)) &&
+                valid_vm[i]) {
+                error_setg(errp, "cannot disable %s satp mode if %s "
+                           "is enabled", satp_mode_str(i, false),
+                           satp_mode_str(satp_mode_max, false));
+                return;
+            }
+        }
+    }
+
+    /* Finally expand the map so that all valid modes are set */
+    for (int i = satp_mode_max - 1; i >= 0; --i) {
+        if (valid_vm[i]) {
+            cpu->cfg.satp_mode.map |= (1 << i);
+        }
+    }
+}
+#endif
+
+static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
+{
+#ifndef CONFIG_USER_ONLY
+    Error *local_err = NULL;
+
+    riscv_cpu_satp_mode_finalize(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+#endif
+}
+
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -1017,6 +1175,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
      }
 #endif
 
+    riscv_cpu_finalize_features(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     riscv_cpu_register_gdb_regs_for_features(cs);
 
     qemu_init_vcpu(cs);
@@ -1026,6 +1190,52 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 }
 
 #ifndef CONFIG_USER_ONLY
+static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    RISCVSATPMap *satp_map = opaque;
+    uint8_t satp = satp_mode_from_str(name);
+    bool value;
+
+    value = satp_map->map & (1 << satp);
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    RISCVSATPMap *satp_map = opaque;
+    uint8_t satp = satp_mode_from_str(name);
+    bool value;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    satp_map->map = deposit32(satp_map->map, satp, 1, value);
+    satp_map->init |= 1 << satp;
+}
+
+static void riscv_add_satp_mode_properties(Object *obj)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
+    if (cpu->env.misa_mxl == MXL_RV32) {
+        object_property_add(obj, "sv32", "bool", cpu_riscv_get_satp,
+                            cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+    } else {
+        object_property_add(obj, "sv39", "bool", cpu_riscv_get_satp,
+                            cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+        object_property_add(obj, "sv48", "bool", cpu_riscv_get_satp,
+                            cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+        object_property_add(obj, "sv57", "bool", cpu_riscv_get_satp,
+                            cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+        object_property_add(obj, "sv64", "bool", cpu_riscv_get_satp,
+                            cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+    }
+}
+
 static void riscv_cpu_set_irq(void *opaque, int irq, int level)
 {
     RISCVCPU *cpu = RISCV_CPU(opaque);
@@ -1246,6 +1456,10 @@ static void register_cpu_props(Object *obj)
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
+
+#ifndef CONFIG_USER_ONLY
+    riscv_add_satp_mode_properties(obj);
+#endif
 }
 
 static Property riscv_cpu_properties[] = {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b5b5425b99..67ac665ff0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -27,6 +27,7 @@
 #include "qom/object.h"
 #include "qemu/int128.h"
 #include "cpu_bits.h"
+#include "qapi/qapi-types-common.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
 
@@ -401,6 +402,17 @@ struct RISCVCPUClass {
     ResettablePhases parent_phases;
 };
 
+/*
+ * map is a 16-bit bitmap: the most significant set bit in map is the maximum
+ * satp mode that is supported.
+ *
+ * init is a 16-bit bitmap used to make sure the user selected a correct
+ * configuration as per the specification.
+ */
+typedef struct {
+    uint16_t map, init;
+} RISCVSATPMap;
+
 struct RISCVCPUConfig {
     bool ext_i;
     bool ext_e;
@@ -497,6 +509,10 @@ struct RISCVCPUConfig {
     bool misa_w;
 
     bool short_isa_string;
+
+#ifndef CONFIG_USER_ONLY
+    RISCVSATPMap satp_mode;
+#endif
 };
 
 typedef struct RISCVCPUConfig RISCVCPUConfig;
@@ -798,9 +814,14 @@ enum riscv_pmu_event_idx {
 /* CSR function table */
 extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
 
+extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];
+
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
 void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
 
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
 
+uint8_t satp_mode_max_from_map(uint32_t map);
+const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
+
 #endif /* RISCV_CPU_H */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d93d481bd6..ab566639e5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1141,12 +1141,12 @@ static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
 
-static const bool valid_vm_1_10_32[16] = {
+const bool valid_vm_1_10_32[16] = {
     [VM_1_10_MBARE] = true,
     [VM_1_10_SV32] = true
 };
 
-static const bool valid_vm_1_10_64[16] = {
+const bool valid_vm_1_10_64[16] = {
     [VM_1_10_MBARE] = true,
     [VM_1_10_SV39] = true,
     [VM_1_10_SV48] = true,
@@ -1232,11 +1232,9 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
 
 static bool validate_vm(CPURISCVState *env, target_ulong vm)
 {
-    if (riscv_cpu_mxl(env) == MXL_RV32) {
-        return valid_vm_1_10_32[vm & 0xf];
-    } else {
-        return valid_vm_1_10_64[vm & 0xf];
-    }
+    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
+
+    return (vm & 0xf) <= satp_mode_max_from_map(cpu->cfg.satp_mode.map);
 }
 
 static RISCVException write_mstatus(CPURISCVState *env, int csrno,
-- 
2.39.2


