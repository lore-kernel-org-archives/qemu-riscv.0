Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4fxd-0007mJ-Bf
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 05:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1p4fxa-0007la-1u
 for qemu-riscv@nongnu.org; Mon, 12 Dec 2022 05:22:58 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1p4fxW-00004y-Ri
 for qemu-riscv@nongnu.org; Mon, 12 Dec 2022 05:22:57 -0500
Received: by mail-wm1-x32d.google.com with SMTP id ay40so4867473wmb.2
 for <qemu-riscv@nongnu.org>; Mon, 12 Dec 2022 02:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dUePLyZCetOvaMUENdEw64iqp8PbvVKsqDgpmgFR0AY=;
 b=l4wjqD4PHv+nzG50c4OAK3Aq3TzFMdnWr8m+wBhdbfL3L+GWLXhqx1nNTSSTS9heJ2
 vmp1X6ebE2sTj8ryvvjcXIyI63FyBiBZELtvFo0uSz3KPGb4IrmL06PvJW690jA0DluH
 QGzv00i8yPc+kzLfbNEh7NkFKapyO7ls731wusA59I1fFKb/NpcRXn/tzYMZEqTjAjez
 PwH9LZv38VgN9UQl7y02+z6ECjukDnKXdfCRTC1UKyqFyGmUTaKw/HblvYshrX+Qg4P0
 LG5NRVTIu3/0NsB2Q6TjwcZR+SH56iaWczhOMfbyGejy3w85rSpAlLGJn24+vqxDkbAt
 M3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dUePLyZCetOvaMUENdEw64iqp8PbvVKsqDgpmgFR0AY=;
 b=rZaerw6xzIg1hnfskHS+zTlBnJ57/tlSjwQsHK+HxFlkWpvtoExmzqqWbTFWEACsTT
 7dWKUFfQ2G1Nxnxmn+wv1uYVyvZoOqvgyT88+5b6CmqvI1565pK4pPAj32Tv1isep57A
 lAPPsIpVbGT7DXFIRR+h+BDcR2tGazl0JLdeofZtsFIFUUDqJ/X24DMR2lkZZ8vu4aPa
 xOx0rEUYY8fCcr4YTI6/GDT7dc9wo1O0mOcqURfxjapZSkZyjB8GWKNPM+aRJ58oO0xR
 CzOWFYnM3eT8+kgMGqqfshWKHr3tUz7ebN7K2lEubYkSq3zD4ulck2R4t3qizc3qUv3j
 aMlg==
X-Gm-Message-State: ANoB5pmrA6sCaK3WrM+9upMtO83dZ++IU7ow3hwfkJ0CgGzfQZeQ2ssX
 wCI0AqUstN+wfVBH8Wvi4zvmZQ==
X-Google-Smtp-Source: AA0mqf72DGwWbaYbIDeT/c/OIllN1u/xMzJORqqPbCyqEy/kVXZKqm0ckvoV4ZZkPD1NzSe6IBnz9A==
X-Received: by 2002:a05:600c:3b15:b0:3d0:d177:cac1 with SMTP id
 m21-20020a05600c3b1500b003d0d177cac1mr11869044wms.36.1670840571434; 
 Mon, 12 Dec 2022 02:22:51 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-gre-1-201-46.w90-112.abo.wanadoo.fr. [90.112.163.46])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a05600c351600b003d21759db42sm9113926wmq.5.2022.12.12.02.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 02:22:51 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Ludovic Henry <ludovic@rivosinc.com>
Subject: [PATCH v4] riscv: Allow user to set the satp mode
Date: Mon, 12 Dec 2022 11:22:50 +0100
Message-Id: <20221212102250.3365948-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Mon, 12 Dec 2022 10:22:58 -0000

RISC-V specifies multiple sizes for addressable memory and Linux probes for
the machine's support at startup via the satp CSR register (done in
csr.c:validate_vm).

As per the specification, sv64 must support sv57, which in turn must
support sv48...etc. So we can restrict machine support by simply setting the
"highest" supported mode and the bare mode is always supported.

You can set the satp mode using the new properties "mbare", "sv32",
"sv39", "sv48", "sv57" and "sv64" as follows:
-cpu rv64,sv57=on # Linux will boot using sv57 scheme
-cpu rv64,sv39=on # Linux will boot using sv39 scheme

We take the highest level set by the user:
-cpu rv64,sv48=on,sv57=on # Linux will boot using sv57 scheme

We make sure that invalid configurations are rejected:
-cpu rv64,sv32=on # Can't enable 32-bit satp mode in 64-bit
-cpu rv64,sv39=off,sv48=on # sv39 must be supported if higher modes are
			   # enabled

We accept "redundant" configurations:
-cpu rv64,sv48=on,sv57=off # sv39 must be supported if higher modes are

In addition, we now correctly set the device-tree entry 'mmu-type' using
those new properties.

Co-Developed-by: Ludovic Henry <ludovic@rivosinc.com>
Signed-off-by: Ludovic Henry <ludovic@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
v4:
- Use custom boolean properties instead of OnOffAuto properties, based
  on ARMVQMap, as suggested by Andrew

v3:
- Free sv_name as pointed by Bin
- Replace satp-mode with boolean properties as suggested by Andrew
- Removed RB from Atish as the patch considerably changed

v2:
- Use error_setg + return as suggested by Alistair
- Add RB from Atish
- Fixed checkpatch issues missed in v1
- Replaced Ludovic email address with the rivos one

 hw/riscv/virt.c    |  20 +++--
 target/riscv/cpu.c | 217 +++++++++++++++++++++++++++++++++++++++++++--
 target/riscv/cpu.h |  25 ++++++
 target/riscv/csr.c |  13 ++-
 4 files changed, 256 insertions(+), 19 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b4..9bb5ba7366 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -228,7 +228,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     int cpu;
     uint32_t cpu_phandle;
     MachineState *mc = MACHINE(s);
-    char *name, *cpu_name, *core_name, *intc_name;
+    uint8_t satp_mode_max;
+    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
 
     for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
         cpu_phandle = (*phandle)++;
@@ -236,14 +237,15 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         cpu_name = g_strdup_printf("/cpus/cpu@%d",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_add_subnode(mc->fdt, cpu_name);
-        if (riscv_feature(&s->soc[socket].harts[cpu].env,
-                          RISCV_FEATURE_MMU)) {
-            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
-                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
-        } else {
-            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
-                                    "riscv,none");
-        }
+
+        satp_mode_max = satp_mode_max_from_map(
+                            s->soc[socket].harts[cpu].cfg.satp_mode.map,
+                            is_32_bit);
+        sv_name = g_strdup_printf("riscv,%s",
+                                  satp_mode_str(satp_mode_max, is_32_bit));
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
+        g_free(sv_name);
+
         name = riscv_isa_string(&s->soc[socket].harts[cpu]);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d14e95c9dc..639231ce2e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -27,6 +27,7 @@
 #include "time_helper.h"
 #include "exec/exec-all.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
 #include "qemu/error-report.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
@@ -199,7 +200,7 @@ static const char * const riscv_intr_names[] = {
     "reserved"
 };
 
-static void register_cpu_props(DeviceState *dev);
+static void register_cpu_props(Object *obj);
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
@@ -237,7 +238,7 @@ static void riscv_any_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
     set_priv_version(env, PRIV_VERSION_1_12_0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
 }
 
 #if defined(TARGET_RISCV64)
@@ -246,7 +247,7 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
@@ -279,7 +280,7 @@ static void rv128_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
@@ -289,7 +290,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
@@ -342,7 +343,7 @@ static void riscv_host_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, 0);
 #endif
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
 }
 #endif
 
@@ -612,6 +613,71 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     }
 }
 
+#define OFFSET_SATP_MODE_64     16
+
+static uint8_t idx_satp_mode_from_str(const char *satp_mode_str)
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
+        return VM_1_10_SV39 + OFFSET_SATP_MODE_64;
+    }
+
+    if (!strncmp(satp_mode_str, "sv48", 4)) {
+        return VM_1_10_SV48 + OFFSET_SATP_MODE_64;
+    }
+
+    if (!strncmp(satp_mode_str, "sv57", 4)) {
+        return VM_1_10_SV57 + OFFSET_SATP_MODE_64;
+    }
+
+    if (!strncmp(satp_mode_str, "sv64", 4)) {
+        return VM_1_10_SV64 + OFFSET_SATP_MODE_64;
+    }
+
+    /* Will never get there */
+    return -1;
+}
+
+uint8_t satp_mode_max_from_map(uint32_t map, bool is_32_bit)
+{
+    return is_32_bit ?
+        (31 - __builtin_clz(map & 0xFFFF)) : (31 - __builtin_clz(map >> 16));
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
+    return NULL;
+}
+
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -907,6 +973,30 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
      }
 #endif
 
+    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
+
+    /*
+     * If unset by both the user and the cpu, we fallback to sv32 for 32-bit
+     * or sv57 for 64-bit when a MMU is present, and bare otherwise.
+     */
+    if (cpu->cfg.satp_mode.map == 0) {
+        if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
+            if (rv32) {
+                cpu->cfg.satp_mode.map |= (1 << idx_satp_mode_from_str("sv32"));
+            } else {
+                cpu->cfg.satp_mode.map |= (1 << idx_satp_mode_from_str("sv57"));
+            }
+        } else {
+            cpu->cfg.satp_mode.map |= (1 << idx_satp_mode_from_str("mbare"));
+        }
+    }
+
+    riscv_cpu_finalize_features(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     riscv_cpu_register_gdb_regs_for_features(cs);
 
     qemu_init_vcpu(cs);
@@ -915,6 +1005,115 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     mcc->parent_realize(dev, errp);
 }
 
+static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    RISCVSATPMap *satp_map = opaque;
+    uint8_t idx_satp = idx_satp_mode_from_str(name);
+    bool value;
+
+    value = (satp_map->map & (1 << idx_satp));
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    RISCVSATPMap *satp_map = opaque;
+    uint8_t idx_satp = idx_satp_mode_from_str(name);
+    bool value;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value) {
+        satp_map->map |= 1 << idx_satp;
+    }
+
+    satp_map->init |= 1 << idx_satp;
+}
+
+static void riscv_add_satp_mode_properties(Object *obj)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
+    object_property_add(obj, "mbare", "bool", cpu_riscv_get_satp,
+                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+    object_property_add(obj, "sv32", "bool", cpu_riscv_get_satp,
+                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+    object_property_add(obj, "sv39", "bool", cpu_riscv_get_satp,
+                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+    object_property_add(obj, "sv48", "bool", cpu_riscv_get_satp,
+                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+    object_property_add(obj, "sv57", "bool", cpu_riscv_get_satp,
+                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+    object_property_add(obj, "sv64", "bool", cpu_riscv_get_satp,
+                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+}
+
+#define error_append_or_setg(errp, str, ...) ({             \
+        if (*errp)                                          \
+            error_append_hint(errp, str"\n", ##__VA_ARGS__);\
+        else                                                \
+            error_setg(errp, str, ##__VA_ARGS__);           \
+    })
+
+void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
+{
+    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
+
+    /* Get rid of 32-bit/64-bit incompatibility */
+    if (rv32) {
+        if (cpu->cfg.satp_mode.map >= (1 << OFFSET_SATP_MODE_64))
+            error_append_or_setg(errp, "cannot enable 64-bit satp modes "
+                                 "(sv39/sv48/sv57/sv64) if cpu is in 32-bit "
+                                 "mode");
+    } else {
+        if (cpu->cfg.satp_mode.map & (1 << VM_1_10_SV32))
+            error_append_or_setg(errp, "cannot enable 32-bit satp mode (sv32) "
+                                 "if cpu is in 64-bit mode");
+    }
+
+    /*
+     * Then make sure the user did not ask for an invalid configuration as per
+     * the specification.
+     */
+    if (rv32) {
+        if (cpu->cfg.satp_mode.map & (1 << VM_1_10_SV32)) {
+            if (!(cpu->cfg.satp_mode.map & (1 << VM_1_10_MBARE)) &&
+                 (cpu->cfg.satp_mode.init & (1 << VM_1_10_MBARE)))
+                error_append_or_setg(errp, "cannot disable mbare satp mode if "
+                                     "sv32 is enabled");
+        }
+    } else {
+        uint8_t satp_mode_max;
+
+        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map, false);
+
+        for (int i = satp_mode_max - 1; i >= 0; --i) {
+            if (!(cpu->cfg.satp_mode.map & (1 << (i + OFFSET_SATP_MODE_64))) &&
+                 (cpu->cfg.satp_mode.init & (1 << (i + OFFSET_SATP_MODE_64))))
+                error_append_or_setg(errp, "cannot disable %s satp mode if %s "
+                                     "is enabled",
+                                     satp_mode_str(i, false),
+                                     satp_mode_str(satp_mode_max, false));
+        }
+    }
+}
+
+void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
+{
+    Error *local_err = NULL;
+
+    riscv_cpu_satp_mode_finalize(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 static void riscv_cpu_set_irq(void *opaque, int irq, int level)
 {
@@ -1070,13 +1269,16 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void register_cpu_props(DeviceState *dev)
+static void register_cpu_props(Object *obj)
 {
     Property *prop;
+    DeviceState *dev = DEVICE(obj);
 
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
+
+    riscv_add_satp_mode_properties(obj);
 }
 
 static Property riscv_cpu_properties[] = {
@@ -1094,6 +1296,7 @@ static Property riscv_cpu_properties[] = {
 
     DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
     DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3a9e25053f..1717b33321 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -27,6 +27,7 @@
 #include "qom/object.h"
 #include "qemu/int128.h"
 #include "cpu_bits.h"
+#include "qapi/qapi-types-common.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
 
@@ -407,6 +408,22 @@ struct RISCVCPUClass {
     DeviceReset parent_reset;
 };
 
+/*
+ * map and init are divided into two 16bit bitmaps: the upper one is for rv64
+ * and the lower one is for rv32, this is because the value for sv32 (ie. 1)
+ * may be reused later for another purpose for rv64 (see the specification which
+ * states that it is "reserved for standard use").
+ *
+ * In a 16bit bitmap in map, the most significant set bit is the maximum
+ * satp mode that is supported.
+ *
+ * Both 16bit bitmaps in init are used to make sure the user selected a correct
+ * combination as per the specification.
+ */
+typedef struct {
+    uint32_t map, init;
+} RISCVSATPMap;
+
 struct RISCVCPUConfig {
     bool ext_i;
     bool ext_e;
@@ -480,6 +497,8 @@ struct RISCVCPUConfig {
     bool debug;
 
     bool short_isa_string;
+
+    RISCVSATPMap satp_mode;
 };
 
 typedef struct RISCVCPUConfig RISCVCPUConfig;
@@ -789,4 +808,10 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
 
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
 
+uint8_t satp_mode_max_from_map(uint32_t map, bool is_32_bit);
+const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
+
+void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp);
+void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
+
 #endif /* RISCV_CPU_H */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5c9a7ee287..5c732653b2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1109,10 +1109,17 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
 
 static int validate_vm(CPURISCVState *env, target_ulong vm)
 {
-    if (riscv_cpu_mxl(env) == MXL_RV32) {
-        return valid_vm_1_10_32[vm & 0xf];
+    uint8_t satp_mode_max;
+    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
+    bool is_32_bit = riscv_cpu_mxl(env) == MXL_RV32;
+
+    vm &= 0xf;
+    satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map, is_32_bit);
+
+    if (is_32_bit) {
+        return valid_vm_1_10_32[vm] && (vm <= satp_mode_max);
     } else {
-        return valid_vm_1_10_64[vm & 0xf];
+        return valid_vm_1_10_64[vm] && (vm <= satp_mode_max);
     }
 }
 
-- 
2.37.2


