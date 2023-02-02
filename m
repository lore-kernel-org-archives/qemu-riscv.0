Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNa1k-0001ZW-7W
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 08:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNa1d-0001Wi-Dk
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:53:17 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNa1Z-0007Xr-T1
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:53:17 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1442977d77dso2500076fac.6
 for <qemu-riscv@nongnu.org>; Thu, 02 Feb 2023 05:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hyw0kbB3HyL6dvLAEEgzaKLD1f2gu7L09y3BM2ynCAM=;
 b=D2OYufoXYLsqriW1X7f5mM/tmCYUdNYe7FM6BcuuHZH5bIAHrJmiDDd4Or8TYToTHy
 aawmRCLQHuqmBfBld0i3Dhbrc59+eS4nzFo1dN1BAADGkegzCPeKwjm1V2FVzBzoW7kE
 dXUfDKC9T9cHAaWC5u3rxTvbA1E0+GAhd+U8yyFLaSL+XW16im/lGHML5JC5J32e1ccI
 wqdXVgaDEmEmg5U2rMqXGf4B6h0Ru+L6Q8UT2y8TdlRPkTPNHmRxNjz4H6nySUCEYxTX
 PwenubWkEzUStTINoORux+l+B8aiRxd8JV4vQC7Z/EmqSckJi1C33+IGQCZglWNIXLs7
 QkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hyw0kbB3HyL6dvLAEEgzaKLD1f2gu7L09y3BM2ynCAM=;
 b=Wur8Q75eof1U6N1K6S37hXuvZ8CeQAsgYh4KlJj2Up5ZuieOUF/egm8dcWkhTDOBmz
 K55yCz2sjNv+Hp0yP8FP7Rd7DlD0AIENRxhOqAtLFyoQJ7Ap8RPePDs8IzU4dveqmnNc
 UXUMgoIlxAsyZfqt7WlqrLYFg0G0fEgGHbWSDPu00nSs2i4mRJBECN8FkM9Q8aQVJ5JY
 eifvJpAnpqWXc5NTojXza5B+k2GS3iQBrhO3WAylJv8zhB2Ie1dY2wtIzBcdNjeevG1M
 1ffu/vxUzO0D6Gnjsotljb2Qn/f6C37I3EU/7Y8gTgu+y8cMZZ9Ecv+/r46+4+GYUnjB
 P8rw==
X-Gm-Message-State: AO0yUKUsvB4t6Pv58dgdTqmtjPxOcP0Ucjt2tL4SFATN9WjdcUxejAlI
 7aJjazac95NskI1ysWhzYRkKkCVh7u5yLAorEkY=
X-Google-Smtp-Source: AK7set8JUZry+QKvdXZ/CCoVP51sWXOMJKP4Z1uaD8UomAmb9IbX2ZS1/ffYikSQq99a3HZaeVorKg==
X-Received: by 2002:a05:6870:9129:b0:169:b676:d643 with SMTP id
 o41-20020a056870912900b00169b676d643mr2930832oae.59.1675345990097; 
 Thu, 02 Feb 2023 05:53:10 -0800 (PST)
Received: from grind.. ([177.102.69.207]) by smtp.gmail.com with ESMTPSA id
 45-20020a9d0330000000b00684e55f4541sm6547416otv.70.2023.02.02.05.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:53:09 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v10 2/3] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Date: Thu,  2 Feb 2023 10:52:56 -0300
Message-Id: <20230202135257.1657482-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202135257.1657482-1-dbarboza@ventanamicro.com>
References: <20230202135257.1657482-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
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
X-List-Received-Date: Thu, 02 Feb 2023 13:53:17 -0000

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
 hw/riscv/boot.c            | 21 ++++++++++++++++++---
 hw/riscv/microchip_pfsoc.c | 11 +----------
 hw/riscv/opentitan.c       |  3 ++-
 hw/riscv/sifive_e.c        |  3 ++-
 hw/riscv/sifive_u.c        | 11 +----------
 hw/riscv/spike.c           | 11 +----------
 hw/riscv/virt.c            | 11 +----------
 include/hw/riscv/boot.h    |  1 +
 8 files changed, 27 insertions(+), 45 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 5ec6d32165..1e32ce1e10 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -176,10 +176,12 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel(MachineState *machine,
                                RISCVHartArrayState *harts,
                                target_ulong kernel_start_addr,
+                               bool load_initrd,
                                symbol_fn_t sym_cb)
 {
     const char *kernel_filename = machine->kernel_filename;
     uint64_t kernel_load_base, kernel_entry, kernel_low;
+    void *fdt = machine->fdt;
 
     g_assert(kernel_filename != NULL);
 
@@ -199,21 +201,34 @@ target_ulong riscv_load_kernel(MachineState *machine,
             kernel_entry = kernel_low;
         }
 
-        return kernel_entry;
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
index 712625d2a4..e81bbd12df 100644
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
         fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 7fe4fb5628..b06944d382 100644
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
index 71be442a50..ad3bb35b34 100644
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
index 1fa91167ab..a584d5b3a2 100644
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
index d0531cc641..2f2c82e8df 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1278,16 +1278,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
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
index 6295316afb..ea1de8b020 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,6 +46,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel(MachineState *machine,
                                RISCVHartArrayState *harts,
                                target_ulong firmware_end_addr,
+                               bool load_initrd,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
-- 
2.39.1


