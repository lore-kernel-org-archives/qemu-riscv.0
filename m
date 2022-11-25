Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyWRE-0001WY-9B
	for mharc-qemu-riscv@gnu.org; Fri, 25 Nov 2022 06:00:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1oyWRB-0001VS-R1
 for qemu-riscv@nongnu.org; Fri, 25 Nov 2022 06:00:06 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1oyWR9-0008MU-I2
 for qemu-riscv@nongnu.org; Fri, 25 Nov 2022 06:00:05 -0500
Received: by mail-wm1-x32c.google.com with SMTP id t1so3162257wmi.4
 for <qemu-riscv@nongnu.org>; Fri, 25 Nov 2022 03:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4SIGgXP3dZ0zTU2WAlL7i0KRq2P4SfZRq8ca6nAZK4o=;
 b=iGLmpANxCH5DoGfUjsQo3kwJQ5BF94ssjTDeMrJFOm3gCsRwj/4PTx17TVYNhGdYXi
 hbc0f2O4h8aUB7DpxqNeGS3b2EZMeJ5mhSzhWDK0MmSGmmFvuJgzdCjNmGp19gcIKBy2
 4Jt8nAwAKz6+ZNw4CgbXE7sfLCIB8/vA1zrBRqnDjg2/KuFs7q/UGSvX29RJ6XhSs91o
 k8TM6w6NNoHhrBvkrZkloWXyFaOMKp3VAkrV/juAPcCpkZ7xtVo8m3r/pSVRxO5akWzv
 c6PZTMhH/juU0k7DTjvq5iXpGCviD8/p9jqxJIyNMgBlbOQYicm93zo4UFkjKaORjrKJ
 jWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4SIGgXP3dZ0zTU2WAlL7i0KRq2P4SfZRq8ca6nAZK4o=;
 b=C0oK0NB2S74ILLHSHhMBjGWBtbTansu+mITeqzsZULfetORr5Ss4vWyF0533uCOWdt
 eo9YFt1glRbu5GN8Swn9yQlKy4Ra9yMa2fxKzbHpI9jJYlQYgN8qTCnTiy/1tK8hhnDv
 Jm/wXi+/taSrLfk5vm5TLHpoux28qYUYQW3rk7qv7y12CozFYp5rDt0VT+BR+klRsuJQ
 ylrNtLYX/daZqpRRBtq7MjbVjUHWCqbEv1DlkQ9VYtbT9kuXBBn9LQ+4cM3ab6dZKHxa
 FUk0EWbN/frP2YjcJfq20+DLZre9theVoR2/u8UOVSfiwaAeeVRK7Bso2Q3pXIRoMLXO
 95fQ==
X-Gm-Message-State: ANoB5pl7tUvcYo668ppeM8ulf5djFGwBOMTvJYki+pN+PZjUw1QtvlHy
 FPPDEFbj163reh9q+zXPEcIEPw==
X-Google-Smtp-Source: AA0mqf7XEv37R2Y0F1U8wrObwwPNukvuSEq3FtqBRXp2XZSRXSlXEVWJdnsxgbSP/UK+S7CU3otreA==
X-Received: by 2002:a05:600c:4f12:b0:3cf:e7bd:303a with SMTP id
 l18-20020a05600c4f1200b003cfe7bd303amr14467302wmq.151.1669374001146; 
 Fri, 25 Nov 2022 03:00:01 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-201-46.w90-112.abo.wanadoo.fr. [90.112.163.46])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c1d0700b003b47ff307e1sm5436850wms.31.2022.11.25.02.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 03:00:00 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Atish Patra <atishp@rivosinc.com>, Ludovic Henry <ludovic@rivosinc.com>
Subject: [PATCH v2] riscv: Add RISCVCPUConfig.satp_mode to set sv48, sv57, etc.
Date: Fri, 25 Nov 2022 11:59:54 +0100
Message-Id: <20221125105954.149267-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Fri, 25 Nov 2022 11:00:06 -0000

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

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Co-Developed-by: Ludovic Henry <ludovic@rivosinc.com>
Signed-off-by: Ludovic Henry <ludovic@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

v2:
- Use error_setg + return as suggested by Alistair
- Add RB from Atish
- Fixed checkpatch issues missed in v1
- Replaced Ludovic email address with the rivos one

 hw/riscv/virt.c    | 15 ++++++---------
 target/riscv/cpu.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h |  3 +++
 target/riscv/csr.c |  8 ++++++--
 4 files changed, 60 insertions(+), 11 deletions(-)

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
index d14e95c9dc..c86dc5058d 100644
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
+            error_setg(errp, "Unknown option for satp_mode: %s",
+                       cpu->cfg.satp_mode_str);
+            return;
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


