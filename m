Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHOco-0008Tq-5s
	for mharc-qemu-riscv@gnu.org; Mon, 16 Jan 2023 07:30:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHOcj-0008Po-50
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 07:30:01 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHOcg-0003H8-Nd
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 07:30:00 -0500
Received: by mail-oi1-x22f.google.com with SMTP id n8so23246037oih.0
 for <qemu-riscv@nongnu.org>; Mon, 16 Jan 2023 04:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RmlaSf4agWGz7+gWU7Vna+xOkpByetLr1UplEidZSlY=;
 b=ncuTX8Jhn+wW3IUD+9wGSMQMdtl4tJSwvCdS9K4NNNZVA0yUPR4U2WAHbavcWbzQaz
 ghVbLHJ/0d+IvzLx6lq/Vqw4pS3kfcJfxHylyz2y42i7KiACluqVnwOfsGQManF/1Q7N
 buLYh/mkUrgYzohD8rbFUmifLrm1RcqFl8j/G+OWFyAk0ltS2HDxjnHEkmRKWjIcadYl
 35quM0sK0YTyDAgOASnxiRg237Yd8U8muU9Uto2h5xFTN0L563LeoC1zIRsZ1zW3WvVp
 C1+bkIMYmFQHu1CI6QMLO8PkuUKcnOdpAnulINgN5iPolpjQG1xrr5lcEMY1pER9AxbI
 6HAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RmlaSf4agWGz7+gWU7Vna+xOkpByetLr1UplEidZSlY=;
 b=JLYJhRJFkBOsdQ6jcrsZVn2cq+nkq7Li54FItIaGQkYDAfiSavMTaGLeC4LLiIzFwe
 fEygPl3ZEpbc5WXude6iP+GZMs3p8ZO5KrXA8Jy58M1uGuLz/kD586VzpRPMoJJmx6yt
 vKQiTY4VTNLc+6p3w64z/TFrRRWlWhWN3gxR449frc73ot4tl5Xgf++GkVfOpWiC9kKs
 aDZnPHD6Bwj2ZXV6pxDPjo5rgpo+KcJANoSyd0JXPDkVY1tDH5ofNW6aeVCXlIUlPgGd
 XTfOSh46vLIehqiTt9FbmO/vbURaxGjtDheUtwcCJ4sF6K9pNBv3HunSVWTSIOcpA3XL
 LZ/g==
X-Gm-Message-State: AFqh2krwshLv+2WEqq72ALiQqs2BhWI/zRxxLrC7JiNaTgHFHKFADJiv
 0CrBrHCCHjouvODFj+5EwetV6z3ZFiSi0OZybUY=
X-Google-Smtp-Source: AMrXdXsT8K0WhEgNbu90eYblQ6J3JRsS/N51z0C1f/Y/sN97zIqDE1ZYhWnIvVNrkbEl6hxwrvhn4Q==
X-Received: by 2002:aca:e155:0:b0:364:ebef:819b with SMTP id
 y82-20020acae155000000b00364ebef819bmr2280124oig.28.1673872197323; 
 Mon, 16 Jan 2023 04:29:57 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 g21-20020a0568080dd500b00360f68d509csm12814540oic.49.2023.01.16.04.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 04:29:56 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v8 1/3] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Date: Mon, 16 Jan 2023 09:29:46 -0300
Message-Id: <20230116122948.757515-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116122948.757515-1-dbarboza@ventanamicro.com>
References: <20230116122948.757515-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 12:30:03 -0000

The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
the same steps when '-kernel' is used:

- execute load_kernel()
- load init_rd()
- write kernel_cmdline

Let's fold everything inside riscv_load_kernel() to avoid code
repetition. To not change the behavior of boards that aren't calling
riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
allow these boards to opt out from initrd loading.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 22 +++++++++++++++++++---
 hw/riscv/microchip_pfsoc.c | 12 ++----------
 hw/riscv/opentitan.c       |  2 +-
 hw/riscv/sifive_e.c        |  3 ++-
 hw/riscv/sifive_u.c        | 12 ++----------
 hw/riscv/spike.c           | 11 +----------
 hw/riscv/virt.c            | 12 ++----------
 include/hw/riscv/boot.h    |  1 +
 8 files changed, 30 insertions(+), 45 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 2594276223..4888d5c1e0 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -175,10 +175,12 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 
 target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong kernel_start_addr,
+                               bool load_initrd,
                                symbol_fn_t sym_cb)
 {
     const char *kernel_filename = machine->kernel_filename;
     uint64_t kernel_load_base, kernel_entry;
+    void *fdt = machine->fdt;
 
     g_assert(kernel_filename != NULL);
 
@@ -192,21 +194,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
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
+    if (load_initrd && machine->initrd_filename) {
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
index 82ae5e7023..c45023a2b1 100644
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
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
+                                         true, NULL);
 
         /* Compute the fdt load address in dram */
         fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 64d5d435b9..f6fd9725a5 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -101,7 +101,7 @@ static void opentitan_board_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
+        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, false, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 3e3f4b0088..6835d1c807 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *machine)
                           memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL);
+        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base,
+                          false, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 2fb6ee231f..ccad386920 100644
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
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
+                                         true, NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index badc11ec43..91bf194ec1 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -306,16 +306,7 @@ static void spike_board_init(MachineState *machine)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
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
+                                         true, htif_symbol_callback);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index e6d4f06e8d..e374b58f89 100644
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
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
+                                         true, NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index f94653a09b..c3de897371 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -45,6 +45,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
                                  symbol_fn_t sym_cb);
 target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
+                               bool load_initrd,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
-- 
2.39.0


