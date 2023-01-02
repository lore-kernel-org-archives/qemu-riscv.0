Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pCJNn-0007W0-9I
	for mharc-qemu-riscv@gnu.org; Mon, 02 Jan 2023 06:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJNb-0007Mn-BI
 for qemu-riscv@nongnu.org; Mon, 02 Jan 2023 06:53:24 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJNX-0002xC-7g
 for qemu-riscv@nongnu.org; Mon, 02 Jan 2023 06:53:22 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-15027746720so18369874fac.13
 for <qemu-riscv@nongnu.org>; Mon, 02 Jan 2023 03:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gYxSVYjQZGu2VngPkKm+KpuQK9qUuKEGr99kdASAZGo=;
 b=HzzlDPWAZCtd+ptGdcbrnLSEixOBhhPKhZlad1l3UIuJgPj2u8GvUzdpMMhYG27Vqn
 aAubH9nhgk/dVs9JqKmzE9F4P1ZkJZ79jvrtAMCoknnRBEzUIG9lik1l1XjQPzpL08Qs
 RvYROz2RgD83Sr6RhvLIXIxaFFHkfYssNr3IlkOIb5vSJ/F4zhUzZyHJmM9e0U81xK8A
 5uXFLSLWIOnUxHHfETv0W+7er2qZX92tAM/a7zHanfgB5gPk9DltvPspHcjlmOFKgXZf
 NGtHwTg6VRVazblMpmZistDqrTmqPW427nhIohxeI+pKqBAhHmw6ZNqwhXy7VW82Ld1Z
 qdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gYxSVYjQZGu2VngPkKm+KpuQK9qUuKEGr99kdASAZGo=;
 b=NX8rWqQeN6z1++bFCZpuDv3zdG2KXxbkqBrcL64/dtLY7++2BPdUZV/1Dc3LrLcAfw
 ndT3F10/Tyrw9RsndZn8z0FUn48QRurS1FOCE6KDc21bC25cK3uP06aOJsbsU786sR//
 1NDDVyjwDSML5B4DbaZC9M5+vfndPnsh746GMUWjOO3oiAdVmkbsOXuHADxXsXECrnfK
 UeoVheBz4gLO5ExkcuwV9olXcBUcDe4535yCpv8x8OknO1LhAadrQMmXPI4r0RvaYNUH
 9kqAO9sY7/j/ge0Nz2P+lAQEyWDh41hrTxB4v7fuyUo57tppmtuaBm+fBwxXCs2Caguw
 NsVw==
X-Gm-Message-State: AFqh2krrB1NPllVrPjLHwU6bL89w6cNtw/cyAOdLfuLFqI4nhWcvcgh/
 SoZLJ1cClyln1Ek9hERkAh9Blw==
X-Google-Smtp-Source: AMrXdXsaJ5xg2+o2gZmwf9CIEkXvFcTZC2QVXwBQOS8NZY5G85E110aK/seAZJXCEEBXoZyzEqf0Aw==
X-Received: by 2002:a05:6870:b624:b0:13b:1f84:b7d7 with SMTP id
 cm36-20020a056870b62400b0013b1f84b7d7mr21388452oab.13.1672660394858; 
 Mon, 02 Jan 2023 03:53:14 -0800 (PST)
Received: from grind.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 l39-20020a05687106a700b0014fb4bdc746sm11354475oao.8.2023.01.02.03.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:53:14 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v5 10/11] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Date: Mon,  2 Jan 2023 08:52:40 -0300
Message-Id: <20230102115241.25733-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102115241.25733-1-dbarboza@ventanamicro.com>
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 02 Jan 2023 11:53:25 -0000

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
index bac394c959..9a75d4aa62 100644
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
index bff9475686..c517885e6e 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -308,16 +308,7 @@ static void spike_board_init(MachineState *machine)
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
index c8e35f861e..a931ed05ab 100644
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


