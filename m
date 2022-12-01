Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0fzd-0003Lu-8X
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 04:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1p0fzZ-0003Je-LD
 for qemu-riscv@nongnu.org; Thu, 01 Dec 2022 04:36:30 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1p0fzX-0003eI-3u
 for qemu-riscv@nongnu.org; Thu, 01 Dec 2022 04:36:29 -0500
Received: by mail-wm1-x32d.google.com with SMTP id m19so730053wms.5
 for <qemu-riscv@nongnu.org>; Thu, 01 Dec 2022 01:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c9+Ila8yDcQTvcaaypg7yfAItyT8PFPQ5xC6lpX5gxw=;
 b=1yl8p8ZQc15Z1cQM1Ai+OXPv8ad1ZYxurqzvdy7C+n2adEz7xznxhFk5kIerqwtxc7
 ImSLbCWywOByLQpFFqWtFczvIrBaGUTlfm8DknoPb5OrGV+6or1B/NtUOntjlzXpaNcE
 jAA9XzHfe8OPQiJhJYlMXvAEggLPjkC+chNgjqXfkTgtC6ZRB6xquleoj7iZAKVycZ9n
 fvWhNdSWazBaALWIfsN2tHYtUMqxVxEN9pIPDE+dmic8fItRDm1vKYtzMonwdShMfoTM
 mWHJ9VmUhJbTsCbhsiXsSh1wcKEzIB5woPI/xaj5ix4NmOzgXpAZueUbFcrAOUE0plRl
 Q85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c9+Ila8yDcQTvcaaypg7yfAItyT8PFPQ5xC6lpX5gxw=;
 b=IWzPSMeBijMaNOr/ntW7qBaRbFQFDOIN+3Q8e2j3NRlcUWMKMqWYYFBfIVCs0IygQD
 ubzatTvN2BvWWxYFRuYGjoJpiI3sd0LMj1+HE0frAbLvNRKhP6tdkKeu4VBGtGSmjHmW
 6xEXr9qZdQDKAj3CsZOZiAewL/ze+DHZyKwseQGI5yrw7Ke9gu/Gc7MIGhRUg2egT2IS
 XiFQFXmXhPK68KuaPLHttxkMBFK8h6qWoTOv0bOayCYKfXdEH0CfS2SXAY2CGYGK8cM0
 s938PGjewjUSB+Fkp0PWLjLIoxxoY8MhujPgAEUgddcaE6kWUesszL6EQqfPrjMCDI8Q
 SduA==
X-Gm-Message-State: ANoB5pmvdVu/9rrgxwbQkgn6KhI9/ziKHFh+OapFFClUhHbhFE2PMiuF
 +aQxjYpgvnDc7ny/xRaM/VJfog==
X-Google-Smtp-Source: AA0mqf4ZRzUfFg9CTo+p8O1S/FhqSHRY+1EahX+NFqFbfaZpA3OqQcdDiVsYjLhNORttuLm2CuBSBw==
X-Received: by 2002:a05:600c:c8:b0:3cf:b287:7722 with SMTP id
 u8-20020a05600c00c800b003cfb2877722mr47918726wmm.51.1669887384786; 
 Thu, 01 Dec 2022 01:36:24 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-gre-1-201-46.w90-112.abo.wanadoo.fr. [90.112.163.46])
 by smtp.gmail.com with ESMTPSA id
 ay2-20020a05600c1e0200b003cfd0bd8c0asm4829517wmb.30.2022.12.01.01.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 01:36:24 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Ludovic Henry <ludovic@rivosinc.com>
Subject: [PATCH v3] riscv: Allow user to set the satp mode
Date: Thu,  1 Dec 2022 10:36:23 +0100
Message-Id: <20221201093623.1394747-1-alexghiti@rivosinc.com>
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
X-List-Received-Date: Thu, 01 Dec 2022 09:36:32 -0000

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
v3:
- Free sv_name as pointed by Bin
- Replace satp-mode with boolean properties as suggested by Andrew
- Removed RB from Atish as the patch considerably changed

v2:
- Use error_setg + return as suggested by Alistair
- Add RB from Atish
- Fixed checkpatch issues missed in v1
- Replaced Ludovic email address with the rivos one

 hw/riscv/virt.c         |  16 ++--
 target/riscv/cpu.c      | 164 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h      |   8 ++
 target/riscv/cpu_bits.h |   1 +
 target/riscv/csr.c      |   8 +-
 5 files changed, 186 insertions(+), 11 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b4..bb7c739a74 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -228,7 +228,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     int cpu;
     uint32_t cpu_phandle;
     MachineState *mc = MACHINE(s);
-    char *name, *cpu_name, *core_name, *intc_name;
+    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
 
     for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
         cpu_phandle = (*phandle)++;
@@ -236,14 +236,12 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
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
+        sv_name = g_strdup_printf("riscv,%s",
+                                  s->soc[socket].harts[cpu].cfg.satp_mode_str);
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
+        g_free(sv_name);
+
         name = riscv_isa_string(&s->soc[socket].harts[cpu]);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d14e95c9dc..51c06ed057 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -907,6 +907,66 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
      }
 #endif
 
+    /*
+     * Either a cpu sets its supported satp_mode in XXX_cpu_init
+     * or the user sets this value using satp_mode property.
+     */
+    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
+
+    cpu->cfg.satp_mode = VM_1_10_UNDEF;
+
+    if (rv32) {
+        if (cpu->cfg.sv32 == ON_OFF_AUTO_ON) {
+            cpu->cfg.satp_mode_str = g_strdup("sv32");
+            cpu->cfg.satp_mode = VM_1_10_SV32;
+        } else if (cpu->cfg.mbare == ON_OFF_AUTO_ON) {
+            cpu->cfg.satp_mode_str = g_strdup("none");
+            cpu->cfg.satp_mode = VM_1_10_MBARE;
+        }
+    } else {
+        if (cpu->cfg.sv64 == ON_OFF_AUTO_ON) {
+            cpu->cfg.satp_mode_str = g_strdup("sv64");
+            cpu->cfg.satp_mode = VM_1_10_SV64;
+        } else if (cpu->cfg.sv57 == ON_OFF_AUTO_ON) {
+            cpu->cfg.satp_mode_str = g_strdup("sv57");
+            cpu->cfg.satp_mode = VM_1_10_SV57;
+        } else if (cpu->cfg.sv48 == ON_OFF_AUTO_ON) {
+            cpu->cfg.satp_mode_str = g_strdup("sv48");
+            cpu->cfg.satp_mode = VM_1_10_SV48;
+        } else if (cpu->cfg.sv39 == ON_OFF_AUTO_ON) {
+            cpu->cfg.satp_mode_str = g_strdup("sv39");
+            cpu->cfg.satp_mode = VM_1_10_SV39;
+        } else if (cpu->cfg.mbare == ON_OFF_AUTO_ON) {
+            cpu->cfg.satp_mode_str = g_strdup("none");
+            cpu->cfg.satp_mode = VM_1_10_MBARE;
+        }
+    }
+
+    /*
+     * If unset by both the user and the cpu, we fallback to sv32 for 32-bit
+     * or sv57 for 64-bit when a MMU is present, and bare otherwise.
+     */
+    if (cpu->cfg.satp_mode == VM_1_10_UNDEF) {
+        if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
+            if (rv32) {
+                cpu->cfg.satp_mode_str = g_strdup("sv32");
+                cpu->cfg.satp_mode = VM_1_10_SV32;
+            } else {
+                cpu->cfg.satp_mode_str = g_strdup("sv57");
+                cpu->cfg.satp_mode = VM_1_10_SV57;
+            }
+        } else {
+            cpu->cfg.satp_mode_str = g_strdup("none");
+            cpu->cfg.satp_mode = VM_1_10_MBARE;
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
@@ -915,6 +975,102 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     mcc->parent_realize(dev, errp);
 }
 
+void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
+{
+    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
+
+    /* First, get rid of 32-bit/64-bit incompatibilities */
+    if (rv32) {
+        if (cpu->cfg.sv39 == ON_OFF_AUTO_ON
+                || cpu->cfg.sv48 == ON_OFF_AUTO_ON
+                || cpu->cfg.sv57 == ON_OFF_AUTO_ON
+                || cpu->cfg.sv64 == ON_OFF_AUTO_ON) {
+            error_setg(errp, "cannot enable 64-bit satp modes "
+                       "(sv39/sv48/sv57/sv64)");
+            error_append_hint(errp, "cpu is in 32-bit mode, 64-bit satp modes "
+                              "can't be enabled\n");
+            return;
+        }
+    } else {
+        if (cpu->cfg.sv32 == ON_OFF_AUTO_ON) {
+            error_setg(errp, "cannot enable 32-bit satp mode (sv32)");
+            error_append_hint(errp, "cpu is in 64-bit mode, 32-bit satp mode "
+                              "can't be enabled\n");
+            return;
+        }
+    }
+
+    /*
+     * Then make sure the user did not ask for an invalid configuration as per
+     * the specification.
+     */
+    switch (cpu->cfg.satp_mode) {
+    case VM_1_10_SV32:
+        if (cpu->cfg.mbare == ON_OFF_AUTO_OFF) {
+            error_setg(errp, "cannot disable mbare satp mode");
+            error_append_hint(errp, "mbare satp mode must be enabled if sv32 "
+                              "is enabled\n");
+            return;
+        }
+
+        break;
+    case VM_1_10_SV39:
+        if (cpu->cfg.mbare == ON_OFF_AUTO_OFF) {
+            error_setg(errp, "cannot disable mbare satp mode");
+            error_append_hint(errp, "mbare satp mode must be enabled if sv39 "
+                              "is enabled\n");
+            return;
+        }
+
+        break;
+    case VM_1_10_SV48:
+        if (cpu->cfg.mbare == ON_OFF_AUTO_OFF
+                || cpu->cfg.sv39 == ON_OFF_AUTO_OFF) {
+            error_setg(errp, "cannot disable mbare/sv39 satp modes");
+            error_append_hint(errp, "mbare/sv39 satp modes must be enabled if "
+                              "sv48 is enabled\n");
+            return;
+        }
+
+        break;
+    case VM_1_10_SV57:
+        if (cpu->cfg.mbare == ON_OFF_AUTO_OFF
+                || cpu->cfg.sv39 == ON_OFF_AUTO_OFF
+                || cpu->cfg.sv48 == ON_OFF_AUTO_OFF) {
+            error_setg(errp, "cannot disable mbare/sv39/sv48 satp modes");
+            error_append_hint(errp, "mbare/sv39/sv48 satp modes must be "
+                              "enabled if sv57 is enabled\n");
+            return;
+        }
+
+        break;
+    case VM_1_10_SV64:
+        if (cpu->cfg.mbare == ON_OFF_AUTO_OFF
+                || cpu->cfg.sv39 == ON_OFF_AUTO_OFF
+                || cpu->cfg.sv48 == ON_OFF_AUTO_OFF
+                || cpu->cfg.sv57 == ON_OFF_AUTO_OFF) {
+            error_setg(errp, "cannot disable mbare/sv39/sv48/sv57 satp "
+                       "modes");
+            error_append_hint(errp, "mbare/sv39/sv48/sv57 satp modes must be "
+                              "enabled if sv57 is enabled\n");
+            return;
+        }
+
+        break;
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
@@ -1094,6 +1250,14 @@ static Property riscv_cpu_properties[] = {
 
     DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
     DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
+
+    DEFINE_PROP_ON_OFF_AUTO("mbare", RISCVCPU, cfg.mbare, ON_OFF_AUTO_AUTO),
+    DEFINE_PROP_ON_OFF_AUTO("sv32", RISCVCPU, cfg.sv32, ON_OFF_AUTO_AUTO),
+    DEFINE_PROP_ON_OFF_AUTO("sv39", RISCVCPU, cfg.sv39, ON_OFF_AUTO_AUTO),
+    DEFINE_PROP_ON_OFF_AUTO("sv48", RISCVCPU, cfg.sv48, ON_OFF_AUTO_AUTO),
+    DEFINE_PROP_ON_OFF_AUTO("sv57", RISCVCPU, cfg.sv57, ON_OFF_AUTO_AUTO),
+    DEFINE_PROP_ON_OFF_AUTO("sv64", RISCVCPU, cfg.sv64, ON_OFF_AUTO_AUTO),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3a9e25053f..dcdde1e0b7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -27,6 +27,7 @@
 #include "qom/object.h"
 #include "qemu/int128.h"
 #include "cpu_bits.h"
+#include "qapi/qapi-types-common.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
 
@@ -480,6 +481,10 @@ struct RISCVCPUConfig {
     bool debug;
 
     bool short_isa_string;
+
+    OnOffAuto mbare, sv32, sv39, sv48, sv57, sv64;
+    uint8_t satp_mode;
+    char *satp_mode_str;
 };
 
 typedef struct RISCVCPUConfig RISCVCPUConfig;
@@ -789,4 +794,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
 
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
 
+void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp);
+void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
+
 #endif /* RISCV_CPU_H */
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index d8f5f0abed..3e67a815d5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -590,6 +590,7 @@ typedef enum {
 #define VM_1_10_SV48        9
 #define VM_1_10_SV57        10
 #define VM_1_10_SV64        11
+#define VM_1_10_UNDEF       16
 
 /* Page table entry (PTE) fields */
 #define PTE_V               0x001 /* Valid */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5c9a7ee287..d2aab1627e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1109,10 +1109,14 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
 
 static int validate_vm(CPURISCVState *env, target_ulong vm)
 {
+    vm &= 0xf;
+
     if (riscv_cpu_mxl(env) == MXL_RV32) {
-        return valid_vm_1_10_32[vm & 0xf];
+        return valid_vm_1_10_32[vm] &&
+            (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
     } else {
-        return valid_vm_1_10_64[vm & 0xf];
+        return valid_vm_1_10_64[vm] &&
+            (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
     }
 }
 
-- 
2.37.2


