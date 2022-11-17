Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovZKw-00055k-N6
	for mharc-qemu-riscv@gnu.org; Thu, 17 Nov 2022 02:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1ovZKm-000531-Ek
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 02:29:17 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1ovZKf-00063K-Vg
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 02:29:14 -0500
Received: by mail-wr1-x42d.google.com with SMTP id g12so2162178wrs.10
 for <qemu-riscv@nongnu.org>; Wed, 16 Nov 2022 23:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tUo/HWJ9DTBOSNb6YtT6Nn4j7jMqb3um6nY4jQGK85k=;
 b=SWhaER9lC1qGfL3nViTlHYje7/39CwbSg98IDqKUR9DOPt4xS7IR0IdhefBOfby/BY
 ON30eABjOgcAEnwr/bIP3OfBTq9sx6Ks9q/luOH0OX66Es4sIvPOf//jANYdFcS/+8Mx
 GyR15Y8qYJ0Iem7SgWAtQPUMUYJplfbJa+7Gqlqrg+BTquUjMKBF/vOp8uNMa0/+KudZ
 QcsZUHeS5ioCOWyCzDlyYDKIyYM3vd8jl2gVVHghX6zgsFLUdmqDmPl1kJhvbs81XL5P
 Z88+qNZaFg74z96xByKFIJJNo0SOIHT8qUCvwsV91WeFucBUTgu44TEdZP1VPSDsqLja
 xMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tUo/HWJ9DTBOSNb6YtT6Nn4j7jMqb3um6nY4jQGK85k=;
 b=C5e0uN4/KTtL84bTm0B82k3IvIq1vDYwa5IDO6zUIMxU7YhqVWgnaEfvdJAOzCuCMl
 MjTtGdSc/Hk+2UIerhZR4hBj8gL86IQr5ucZS6SL9WyDvkWYS/ir6YL+mTZHa3/qhEBv
 HlRMwBQiJKxJvTSW+C4ncbVACvYCFwftnRlutDByfXnTVgbEDAHBd9nX3QYCJMRtKwAp
 qGYKhODx0cC/uF1FolUquWka4jq74Czp9s0gk3XKm+PEel9S+K7j6HIpt4WRXShKK7H9
 lc/PHQxMyawU1zUG3CU/JcncPocBNYQSNFBp0UNzIehXk9fwQ39WB/IyNHzQA1VUqMJI
 gMtQ==
X-Gm-Message-State: ANoB5pm6ucFZPC22uu2Edg7ka2zf7ADdiBpkNxadM87at/9hdWIQs4ZT
 WzGnhOdQQKHchgS7EGfgkpqvPA==
X-Google-Smtp-Source: AA0mqf6U2NvdyYCS3S4/TVkL77Hr1kFBjkTzcYicRp84NALtAXIYewlNs5KFCOnndgKvsqnOb07F5Q==
X-Received: by 2002:a5d:6642:0:b0:236:6a28:eeda with SMTP id
 f2-20020a5d6642000000b002366a28eedamr604611wrw.315.1668670128667; 
 Wed, 16 Nov 2022 23:28:48 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-gre-1-201-46.w90-112.abo.wanadoo.fr. [90.112.163.46])
 by smtp.gmail.com with ESMTPSA id
 r4-20020adfce84000000b0023691d62cffsm134085wrn.70.2022.11.16.23.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 23:28:48 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Ludovic Henry <git@ludovic.dev>
Subject: [PATCH] riscv: Add RISCVCPUConfig.satp_mode to set sv48, sv57, etc.
Date: Thu, 17 Nov 2022 08:28:41 +0100
Message-Id: <20221117072841.240839-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Thu, 17 Nov 2022 07:29:23 -0000

RISC-V specifies multiple sizes for addressable memory and Linux probes for
the machine's support at startup via the satp CSR register (done in
csr.c:validate_vm).

As per the specification, sv64 must support sv57, which in turn must
support sv48...etc. So we can restrict machine support by simply setting the
"highest" supported mode in the satp_mode property. And the bare mode is
always supported.

You can set this new property as follows:
-cpu rv64,satp-mode=sv48 # Linux will boot using sv48 scheme
-cpu rv64,satp-mode=sv39 # Linux will boot using sv39 scheme

In addition, we now correctly set the device-tree entry 'mmu-type' using
this new satp_mode property.

Co-Developed-by: Ludovic Henry <git@ludovic.dev>
Signed-off-by: Ludovic Henry <git@ludovic.dev>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 hw/riscv/virt.c    | 15 ++++++---------
 target/riscv/cpu.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h |  3 +++
 target/riscv/csr.c |  6 ++++--
 4 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b4..77484b5cae 100644
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
@@ -236,14 +236,11 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
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
+
         name = riscv_isa_string(&s->soc[socket].harts[cpu]);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d14e95c9dc..efdb530ad9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -907,6 +907,48 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
      }
 #endif
 
+    /*
+     * Either a cpu sets its supported satp_mode in XXX_cpu_init
+     * or the user sets this value using satp_mode property.
+     */
+    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
+    if (cpu->cfg.satp_mode_str) {
+        if (!g_strcmp0(cpu->cfg.satp_mode_str, "none"))
+            cpu->cfg.satp_mode = VM_1_10_MBARE;
+        else if (!g_strcmp0(cpu->cfg.satp_mode_str, "sv32") && rv32)
+            cpu->cfg.satp_mode = VM_1_10_SV32;
+        else if (!g_strcmp0(cpu->cfg.satp_mode_str, "sv39") && !rv32)
+            cpu->cfg.satp_mode = VM_1_10_SV39;
+        else if (!g_strcmp0(cpu->cfg.satp_mode_str, "sv48") && !rv32)
+            cpu->cfg.satp_mode = VM_1_10_SV48;
+        else if (!g_strcmp0(cpu->cfg.satp_mode_str, "sv57") && !rv32)
+            cpu->cfg.satp_mode = VM_1_10_SV57;
+        else if (!g_strcmp0(cpu->cfg.satp_mode_str, "sv64") && !rv32)
+            cpu->cfg.satp_mode = VM_1_10_SV64;
+        else {
+            error_report("Unknown option for satp_mode: %s",
+                         cpu->cfg.satp_mode_str);
+            exit(EXIT_FAILURE);
+        }
+    } else {
+        /*
+         * If unset by both the user and the cpu, we fallback to sv32 for 32-bit
+         * or sv57 for 64-bit when a MMU is present, and bare otherwise.
+         */
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
     riscv_cpu_register_gdb_regs_for_features(cs);
 
     qemu_init_vcpu(cs);
@@ -1094,6 +1136,9 @@ static Property riscv_cpu_properties[] = {
 
     DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
     DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
+
+    DEFINE_PROP_STRING("satp-mode", RISCVCPU, cfg.satp_mode_str),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3a9e25053f..a6c229470b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -480,6 +480,9 @@ struct RISCVCPUConfig {
     bool debug;
 
     bool short_isa_string;
+
+    uint8_t satp_mode;
+    char *satp_mode_str;
 };
 
 typedef struct RISCVCPUConfig RISCVCPUConfig;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5c9a7ee287..d26b830f1a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1109,10 +1109,12 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
 
 static int validate_vm(CPURISCVState *env, target_ulong vm)
 {
+    vm &= 0xf;
+
     if (riscv_cpu_mxl(env) == MXL_RV32) {
-        return valid_vm_1_10_32[vm & 0xf];
+        return valid_vm_1_10_32[vm] && (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
     } else {
-        return valid_vm_1_10_64[vm & 0xf];
+        return valid_vm_1_10_64[vm] && (vm <= RISCV_CPU(env_cpu(env))->cfg.satp_mode);
     }
 }
 
-- 
2.37.2


