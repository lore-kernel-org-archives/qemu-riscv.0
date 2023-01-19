Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIcbA-0006Hc-Ib
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 16:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIcb3-0006Fr-H4
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 16:37:25 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIcb0-0001oE-HP
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 16:37:21 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-15bb8ec196aso4162639fac.3
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 13:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eBWqTxhea3R6yi0puSYiInuCz6+T6PE/Cqolf5PLF8A=;
 b=HS6SvkUlRl52/RHSrcQMWB5v+JD6bQA7YCMEs74/QSKTSblBjt5SRg6rK+mmg9G3S3
 V+SNebCLoNjm3ddnZ3PMwVRLQBmSFNhgmDKeh2HEKIvFGbkvzrcbRn7I6iVVhDQaIVCz
 E+MhHm3lsrWHB4rabWKzDTWJZ1LY/NKSfz9NJhZaikLv/hJYfAd5eA4qJOPCEinnmdy9
 UTdg/foOkIyAhRM8gHCSuvQWkrTsLAOKAyXBJijVOGdIq9W2c1xNrZppcHgsvNRSamzE
 SEpqIcOE07HwBZu0ybtsHy6ryGu0jUCXsflaiWYPrRA3TZEg1fY4RiYKn5DZVNM7JvHG
 CNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eBWqTxhea3R6yi0puSYiInuCz6+T6PE/Cqolf5PLF8A=;
 b=rT7Mv0r/WlzFnMxq+pg7gTiKGditC9D4igQ7j6q7tF6mVOLFcno3HRzNgQtzaQIu7J
 Orra5hJXy0HVOTurtATHVVscrBsuWXx0435Cu0Lz2wdR4h2GwCLUN8AqJQ8jfq9YGr1v
 ie4EiiSwABoea16LKWJbb6dBygosOfYsfk5J+UYNAkm4Iy058hpE/8CHINy9XM7EzYdo
 dPXqF2Bt4GhdTq+H0Y2DnBv0p55AnKUDlajwgnUS27N1munt2r97E6JAJD3kPyUSYwbC
 HGiYKxxWqsBpQ/CC19bkj6l9FALGvvaXvx/OXP+I+6wPuy2WWyy3pNfMth/VizK+VWMf
 rhuA==
X-Gm-Message-State: AFqh2kq+HgpauW80z+F85qv2nQclk1NB7H27gR0zycX/rX+NKpLkS5j9
 oanSe16CMC0agL39XWtVVY0ODA==
X-Google-Smtp-Source: AMrXdXvpEG5AXcbWXhF7XYd67lfiJiZxjY1w8gMVRw2ocFdj4iChoIMghgy2ruSjAlEDOHxMnB8tqQ==
X-Received: by 2002:a05:6870:670b:b0:15e:ee5d:8696 with SMTP id
 gb11-20020a056870670b00b0015eee5d8696mr7212513oab.54.1674164236691; 
 Thu, 19 Jan 2023 13:37:16 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 c132-20020aca358a000000b003646062e83bsm13664472oia.29.2023.01.19.13.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 13:37:16 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v9 2/3] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Date: Thu, 19 Jan 2023 18:37:06 -0300
Message-Id: <20230119213707.651533-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119213707.651533-1-dbarboza@ventanamicro.com>
References: <20230119213707.651533-1-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Thu, 19 Jan 2023 21:37:26 -0000

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
 hw/riscv/microchip_pfsoc.c | 11 +----------
 hw/riscv/opentitan.c       |  3 ++-
 hw/riscv/sifive_e.c        |  3 ++-
 hw/riscv/sifive_u.c        | 11 +----------
 hw/riscv/spike.c           | 11 +----------
 hw/riscv/virt.c            | 11 +----------
 include/hw/riscv/boot.h    |  1 +
 8 files changed, 28 insertions(+), 45 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 46fc7adccf..29e0c204d3 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -192,10 +192,12 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
 target_ulong riscv_load_kernel(MachineState *machine,
                                RISCVHartArrayState *harts,
                                target_ulong kernel_start_addr,
+                               bool load_initrd,
                                symbol_fn_t sym_cb)
 {
     const char *kernel_filename = machine->kernel_filename;
     uint64_t kernel_load_base, kernel_entry;
+    void *fdt = machine->fdt;
 
     g_assert(kernel_filename != NULL);
 
@@ -210,21 +212,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
                          translate_kernel_address, harts,
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
index bdefeb3cbb..b7e171b605 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -630,16 +630,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
-                                         kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen",
-                                    "bootargs", machine->kernel_cmdline);
-        }
+                                         kernel_start_addr, true, NULL);
 
         /* Compute the fdt load address in dram */
         fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 2731138c41..3af9bfa52a 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -102,7 +102,8 @@ static void opentitan_board_init(MachineState *machine)
 
     if (machine->kernel_filename) {
         riscv_load_kernel(machine, &s->soc.cpus,
-                          memmap[IBEX_DEV_RAM].base, NULL);
+                          memmap[IBEX_DEV_RAM].base,
+                          false, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 1a7d381514..04939b60c3 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -115,7 +115,8 @@ static void sifive_e_machine_init(MachineState *machine)
 
     if (machine->kernel_filename) {
         riscv_load_kernel(machine, &s->soc.cpus,
-                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
+                          memmap[SIFIVE_E_DEV_DTIM].base,
+                          false, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 83dfe09877..b0b3e6f03a 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -599,16 +599,7 @@ static void sifive_u_machine_init(MachineState *machine)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
-                                         kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
+                                         kernel_start_addr, true, NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 2bcc50d90d..483581e05f 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -307,16 +307,7 @@ static void spike_board_init(MachineState *machine)
 
         kernel_entry = riscv_load_kernel(machine, &s->soc[0],
                                          kernel_start_addr,
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
index ac173a6ed6..48326406fd 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1275,16 +1275,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, &s->soc[0],
-                                         kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
+                                         kernel_start_addr, true, NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 105706bf25..e0eab1e01b 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,6 +46,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel(MachineState *machine,
                                RISCVHartArrayState *harts,
                                target_ulong firmware_end_addr,
+                               bool load_initrd,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
-- 
2.39.0


