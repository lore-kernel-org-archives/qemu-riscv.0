Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAWZa-00050V-Ho
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 08:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZR-0004t8-QG
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:34:15 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZP-0000IG-Vi
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:34:13 -0500
Received: by mail-oi1-x233.google.com with SMTP id n8so8056003oih.0
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 05:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0c8v4Kzp6n3Errv259XkpaJdjC4fJUPdPSAlyN0HvCw=;
 b=cCq6zkOGRpS+JsKCBNo7X1DEtTy4ZZhnkt+3PkHqqsLcNljC1K8kP3Px51QIHINJ+f
 rAfvU/blQ0QwGvotpehO9IBmQBOEV0n6xfKG0Ail03SGmou8AT5jHow8Uf20Xx/Pqkv5
 d+t2VIl7aRG3rvAWjTfohxJ6smSexW643HgMe4LhwZlsMiRdt8cngM0zfKGWlz6Jk4Bv
 clV5R4FBts1207KO/cOwupeufV+BnDOAbqkTL+ynFoJWIWdbQVqmoIjgaHFVy6vUYj9n
 crMa0w0FEhKxbJlHRF6RK/y50gKd8cCSJ2YqEgJJBknWFsp00eET5vKkMC/iC2/GFGbi
 KZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0c8v4Kzp6n3Errv259XkpaJdjC4fJUPdPSAlyN0HvCw=;
 b=iuzFQlv5lM3MVw3yGJLV1zPFrwIMWVTbBt50pGh1rsyjuFt2/5Cn2N0AYGS/2FrPai
 p3cbly6hQ6o0LJ6ehH/udsGG1iMzM2JfKk+bdMw4Y1oHqfUnwjCylwzhneuw4OojSXQ+
 Nc7e0U3FtMibDrVDTJ7h7K9dZB/cYtP7KqPO6780wR1/9MjL/sGX+M9wx8iJargv2j12
 kjFULY4BixWtF+MHcavtDP6VQvJTWfhoDuArwu2g7Hk8XfN6+z6o15DD9crQiTqepgBI
 sJB4etsoCmUn6wUMpB9Wq6QPVixzndwNU5YPWBPjATyXbes57YGW/3dPiiV0UY5/TTxt
 ACZQ==
X-Gm-Message-State: AFqh2ko8q9JUb7TOpMlWi3CdV/QwWPp1QFT8pbeMlJMBZKhPPRZJ0EEy
 ElY78KsnkkiB+xF0qvWxrHV0uQ==
X-Google-Smtp-Source: AMrXdXuAimBhANkHmed6YrUBZGAGNyLjzm5M3uSZBmH9blCDPwqeqfrkUJs6ECRgKZffiSwnGUciPQ==
X-Received: by 2002:a54:458a:0:b0:35e:85a8:2dc7 with SMTP id
 z10-20020a54458a000000b0035e85a82dc7mr11067751oib.26.1672234450925; 
 Wed, 28 Dec 2022 05:34:10 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 bl22-20020a056808309600b0035e7d07bf9dsm6991626oib.16.2022.12.28.05.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 05:34:10 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 09/10] hw/riscv/boot.c: introduce
 riscv_load_kernel_and_initrd()
Date: Wed, 28 Dec 2022 10:33:35 -0300
Message-Id: <20221228133336.197467-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228133336.197467-1-dbarboza@ventanamicro.com>
References: <20221228133336.197467-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 28 Dec 2022 13:34:16 -0000

The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
the same steps when '-kernel' is used:

- execute load_kernel()
- load init_rd()
- write kernel_cmdline in the fdt

Let's fold everything inside riscv_load_kernel() to avoid code
repetition. Every other board that uses riscv_load_kernel() will have
this same behavior, including boards that doesn't have a valid FDT, so
we need to take care to not do FDT operations without checking it first.

Since we're now doing way more than just loading the kernel, rename
riscv_load_kernel() to riscv_load_kernel_and_initrd().

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 27 +++++++++++++++++++++------
 hw/riscv/microchip_pfsoc.c | 12 ++----------
 hw/riscv/opentitan.c       |  2 +-
 hw/riscv/sifive_e.c        |  3 ++-
 hw/riscv/sifive_u.c        | 12 ++----------
 hw/riscv/spike.c           | 14 +++-----------
 hw/riscv/virt.c            | 12 ++----------
 include/hw/riscv/boot.h    |  6 +++---
 8 files changed, 36 insertions(+), 52 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index cd9c989edb..6d1243ad8b 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -171,12 +171,13 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
     exit(1);
 }
 
-target_ulong riscv_load_kernel(MachineState *machine,
-                               target_ulong kernel_start_addr,
-                               symbol_fn_t sym_cb)
+target_ulong riscv_load_kernel_and_initrd(MachineState *machine,
+                                          target_ulong kernel_start_addr,
+                                          symbol_fn_t sym_cb)
 {
     const char *kernel_filename = machine->kernel_filename;
     uint64_t kernel_load_base, kernel_entry;
+    void *fdt = machine->fdt;
 
     /*
      * NB: Use low address not ELF entry point to ensure that the fw_dynamic
@@ -188,21 +189,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
     if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
                          NULL, &kernel_load_base, NULL, NULL, 0,
                          EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
-        return kernel_load_base;
+        kernel_entry = kernel_load_base;
+        goto out;
     }
 
     if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
                        NULL, NULL, NULL) > 0) {
-        return kernel_entry;
+        goto out;
     }
 
     if (load_image_targphys_as(kernel_filename, kernel_start_addr,
                                current_machine->ram_size, NULL) > 0) {
-        return kernel_start_addr;
+        kernel_entry = kernel_start_addr;
+        goto out;
     }
 
     error_report("could not load kernel '%s'", kernel_filename);
     exit(1);
+
+out:
+    if (machine->initrd_filename) {
+        riscv_load_initrd(machine, kernel_entry);
+    }
+
+    if (fdt && machine->kernel_cmdline && *machine->kernel_cmdline) {
+        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
+                                machine->kernel_cmdline);
+    }
+
+    return kernel_entry;
 }
 
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 82ae5e7023..b64631f166 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -629,16 +629,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen",
-                                    "bootargs", machine->kernel_cmdline);
-        }
+        kernel_entry = riscv_load_kernel_and_initrd(machine, kernel_start_addr,
+                                                    NULL);
 
         /* Compute the fdt load address in dram */
         fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 64d5d435b9..0818d9610c 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -101,7 +101,7 @@ static void opentitan_board_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
+        riscv_load_kernel_and_initrd(machine, memmap[IBEX_DEV_RAM].base, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 3e3f4b0088..e22628b623 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *machine)
                           memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL);
+        riscv_load_kernel_and_initrd(machine, memmap[SIFIVE_E_DEV_DTIM].base,
+                                     NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index bac394c959..b6fb715a9f 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -598,16 +598,8 @@ static void sifive_u_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
+        kernel_entry = riscv_load_kernel_and_initrd(machine, kernel_start_addr,
+                                                    NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 0bba5c1640..a23ada8a03 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -302,17 +302,9 @@ static void spike_board_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
-                                         htif_symbol_callback);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
+        kernel_entry = riscv_load_kernel_and_initrd(machine,
+                                                    kernel_start_addr,
+                                                    htif_symbol_callback);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c8e35f861e..eadf057940 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1281,16 +1281,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
+        kernel_entry = riscv_load_kernel_and_initrd(machine, kernel_start_addr,
+                                                    NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index f94653a09b..16b86450d3 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -43,9 +43,9 @@ char *riscv_find_firmware(const char *firmware_filename,
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
-target_ulong riscv_load_kernel(MachineState *machine,
-                               target_ulong firmware_end_addr,
-                               symbol_fn_t sym_cb);
+target_ulong riscv_load_kernel_and_initrd(MachineState *machine,
+                                          target_ulong firmware_end_addr,
+                                          symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
-- 
2.38.1


