Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lcNLC-0000ZO-LJ
	for mharc-qemu-riscv@gnu.org; Fri, 30 Apr 2021 03:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNLA-0000V4-DA; Fri, 30 Apr 2021 03:13:32 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:39579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNL8-0000YT-AE; Fri, 30 Apr 2021 03:13:32 -0400
Received: by mail-ed1-x52d.google.com with SMTP id g14so21725879edy.6;
 Fri, 30 Apr 2021 00:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hr7WBN7LJpivKnR16YvVaYZxrxR4MYRItX8SSH5ptMI=;
 b=EzV7XYbplhxYKxTwPQvpmuvYxjoGg4ivD7/2CoLmw5NVHyrtbwWguOLxaHsHWkdvgT
 ZrUhAnsGa6MmIkXSviO6R01XN0FYD5ZgQOIrmtb8DaZoh6DEO+ZjIt/wpGO4B+2FzImc
 Qy6qdbrKj13gom9d95ngqaZBXjssZnRoItot9e0ke7QS2rEfqtvB2Plt9/Eodc9IB2/v
 HQLpNl1/VsqALPqRafkQF8Pvqo47CKze73jlLGI/3geoEgUbvfJSmmi2UjI0RX0yoyba
 B57igtma4ncBEpOYE3Sb5wlQqL0/y2oXEjLdaWw1yYPqQRb4NUTJeua3nzjYUHeu4f0p
 DaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hr7WBN7LJpivKnR16YvVaYZxrxR4MYRItX8SSH5ptMI=;
 b=JMvTtO17OEzF5XAnq2VNm4G8s6lf0S24ZT6K9gklevobYOELiy04FfDb0Fy56qbQ4A
 yCaQYVqOlGxGoY3OGqQTyDbgFjVlKojnckPnruVX7zanbEiM3quo/AOugIUHrBQU92Zg
 8kUWqTjZZodL2VElufqjdtF8zXm48aQ93LoKwF9lHNc2i6EOKhEo+5oYYYuCWhmiwczf
 R1V05k7uUT+IOeRIYcLdvIjaCw87jeZHit46wtRhRzgMcaLS3LLME0cHr/ujbFIzww2v
 AUukh6IOqcM3xtWxd6z8GI+HcttLQGQPYLulw8w7nO7dIhEFJANY14IWbW50ucszYRNZ
 U0gw==
X-Gm-Message-State: AOAM530IY+aXpeSEXIHmcE7h8cotlJN7HDIOYRoF8N0p824x00ssKO4H
 fuFOfqFag9gWZmIaBf7Tl+y7kzgiBcU=
X-Google-Smtp-Source: ABdhPJwwGRDys/cP8yslOFNS33fu87+8W6QxViyapTHiCW7jyFPEyY1pPuPoSzad38qjJWCw/5Agdw==
X-Received: by 2002:a05:6402:2686:: with SMTP id
 w6mr3943743edd.226.1619766808627; 
 Fri, 30 Apr 2021 00:13:28 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id b19sm574462edd.66.2021.04.30.00.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 00:13:28 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 8/8] hw/riscv: microchip_pfsoc: Support direct kernel boot
Date: Fri, 30 Apr 2021 15:13:02 +0800
Message-Id: <20210430071302.1489082-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430071302.1489082-1-bmeng.cn@gmail.com>
References: <20210430071302.1489082-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Apr 2021 07:13:33 -0000

From: Bin Meng <bin.meng@windriver.com>

At present the Microchip Icicle Kit machine only supports using
'-bios' to load the HSS, and does not support '-kernel' for direct
kernel booting just like other RISC-V machines do. One has to use
U-Boot which is chain-loaded by HSS, to load a kernel for testing.
This is not so convenient.

Adding '-kernel' support together with the existing '-bios', we
follow the following table to select which payload we execute:

  -bios |    -kernel | payload
  ------+------------+--------
      N |          N | HSS
      Y | don't care | HSS
      N |          Y | kernel

This ensures backwards compatibility with how we used to expose
'-bios' to users. When '-kernel' is used for direct boot, '-dtb'
must be present to provide a valid device tree for the board,
as we don't generate device tree.

When direct kernel boot is used, the OpenSBI fw_dynamic BIOS image
is used to boot a payload like U-Boot or OS kernel directly.

Documentation is updated to describe the direct kernel boot. Note
as of today there is still no PolarFire SoC support in the upstream
Linux kernel hence the document does not include instructions for
that. It will be updated in the future.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 docs/system/riscv/microchip-icicle-kit.rst | 30 ++++++--
 hw/riscv/microchip_pfsoc.c                 | 81 +++++++++++++++++++++-
 2 files changed, 103 insertions(+), 8 deletions(-)

diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
index e803131763..54ced661e3 100644
--- a/docs/system/riscv/microchip-icicle-kit.rst
+++ b/docs/system/riscv/microchip-icicle-kit.rst
@@ -31,17 +31,37 @@ Boot options
 
 The ``microchip-icicle-kit`` machine can start using the standard -bios
 functionality for loading its BIOS image, aka Hart Software Services (HSS_).
-HSS loads the second stage bootloader U-Boot from an SD card. It does not
-support direct kernel loading via the -kernel option. One has to load kernel
-from U-Boot.
+HSS loads the second stage bootloader U-Boot from an SD card. Then a kernel
+can be loaded from U-Boot. It also supports direct kernel booting via the
+-kernel option along with the device tree blob via -dtb. When direct kernel
+boot is used, the OpenSBI fw_dynamic BIOS image is used to boot a payload
+like U-Boot or OS kernel directly.
+
+The user provided DTB should have the following requirements:
+
+* The /cpus node should contain at least one subnode for E51 and the number
+  of subnodes should match QEMU's ``-smp`` option
+* The /memory reg size should match QEMU’s selected ram_size via ``-m``
+* Should contain a node for the CLINT device with a compatible string
+  "riscv,clint0"
+
+QEMU follows below truth table to select which payload to execute:
+
+=====  ========== =======
+-bios     -kernel payload
+=====  ========== =======
+    N           N     HSS
+    Y  don't care     HSS
+    N           Y  kernel
+=====  ========== =======
 
 The memory is set to 1537 MiB by default which is the minimum required high
 memory size by HSS. A sanity check on ram size is performed in the machine
 init routine to prompt user to increase the RAM size to > 1537 MiB when less
 than 1537 MiB ram is detected.
 
-Boot the machine
-----------------
+Running HSS
+-----------
 
 HSS 2020.12 release is tested at the time of writing. To build an HSS image
 that can be booted by the ``microchip-icicle-kit`` machine, type the following
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index c4146b7a6b..1919c09f2f 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -53,6 +53,7 @@
 #include "hw/riscv/microchip_pfsoc.h"
 #include "hw/intc/sifive_clint.h"
 #include "hw/intc/sifive_plic.h"
+#include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 
 /*
@@ -462,6 +463,12 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
     MemoryRegion *mem_high = g_new(MemoryRegion, 1);
     MemoryRegion *mem_high_alias = g_new(MemoryRegion, 1);
     uint64_t mem_high_size;
+    hwaddr firmware_load_addr;
+    const char *firmware_name;
+    bool kernel_as_payload = false;
+    target_ulong firmware_end_addr, kernel_start_addr;
+    uint64_t kernel_entry;
+    uint32_t fdt_load_addr;
     DriveInfo *dinfo = drive_get_next(IF_SD);
 
     /* Sanity check on RAM size */
@@ -506,9 +513,6 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                 memmap[MICROCHIP_PFSOC_DRAM_HI_ALIAS].base,
                                 mem_high_alias);
 
-    /* Load the firmware */
-    riscv_find_and_load_firmware(machine, BIOS_FILENAME, RESET_VECTOR, NULL);
-
     /* Attach an SD card */
     if (dinfo) {
         CadenceSDHCIState *sdhci = &(s->soc.sdhci);
@@ -518,6 +522,77 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                 &error_fatal);
         qdev_realize_and_unref(card, sdhci->bus, &error_fatal);
     }
+
+    /*
+     * We follow the following table to select which payload we execute.
+     *
+     *  -bios |    -kernel | payload
+     * -------+------------+--------
+     *      N |          N | HSS
+     *      Y | don't care | HSS
+     *      N |          Y | kernel
+     *
+     * This ensures backwards compatibility with how we used to expose -bios
+     * to users but allows them to run through direct kernel booting as well.
+     *
+     * When -kernel is used for direct boot, -dtb must be present to provide
+     * a valid device tree for the board, as we don't generate device tree.
+     */
+
+    if (machine->kernel_filename && machine->dtb) {
+        int fdt_size;
+        machine->fdt = load_device_tree(machine->dtb, &fdt_size);
+        if (!machine->fdt) {
+            error_report("load_device_tree() failed");
+            exit(1);
+        }
+
+        firmware_name = RISCV64_BIOS_BIN;
+        firmware_load_addr = memmap[MICROCHIP_PFSOC_DRAM_LO].base;
+        kernel_as_payload = true;
+    }
+
+    if (!kernel_as_payload) {
+        firmware_name = BIOS_FILENAME;
+        firmware_load_addr = RESET_VECTOR;
+    }
+
+    /* Load the firmware */
+    firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
+                                                     firmware_load_addr, NULL);
+
+    if (kernel_as_payload) {
+        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
+                                                         firmware_end_addr);
+
+        kernel_entry = riscv_load_kernel(machine->kernel_filename,
+                                         kernel_start_addr, NULL);
+
+        if (machine->initrd_filename) {
+            hwaddr start;
+            hwaddr end = riscv_load_initrd(machine->initrd_filename,
+                                           machine->ram_size, kernel_entry,
+                                           &start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
+                                  "linux,initrd-start", start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
+                                  "linux,initrd-end", end);
+        }
+
+        if (machine->kernel_cmdline) {
+            qemu_fdt_setprop_string(machine->fdt, "/chosen",
+                                    "bootargs", machine->kernel_cmdline);
+        }
+
+        /* Compute the fdt load address in dram */
+        fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
+                                       machine->ram_size, machine->fdt);
+        /* Load the reset vector */
+        riscv_setup_rom_reset_vec(machine, &s->soc.u_cpus, firmware_load_addr,
+                                  memmap[MICROCHIP_PFSOC_ENVM_DATA].base,
+                                  memmap[MICROCHIP_PFSOC_ENVM_DATA].size,
+                                  kernel_entry, fdt_load_addr, machine->fdt);
+    }
 }
 
 static void microchip_icicle_kit_machine_class_init(ObjectClass *oc, void *data)
-- 
2.25.1


