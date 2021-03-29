Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lQvNj-0006B1-GO
	for mharc-qemu-riscv@gnu.org; Mon, 29 Mar 2021 13:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNi-00068j-E7; Mon, 29 Mar 2021 13:08:50 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:34588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNd-0004W3-FG; Mon, 29 Mar 2021 13:08:50 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id g8so6809993qvx.1;
 Mon, 29 Mar 2021 10:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hDH5WQTFX9jEpHPioCKl/b7JzkjPBXsyHzkmCwrz99E=;
 b=tPFlauqUKVl4mdqaJPyF/l6u/zcTNQgkM8tdqzd3RzsYG8TaflNCLFnHXjJMbN5W1S
 Cmt+iKc5UO6CMvaMDnEbDY5BRuZyCcfRSExu+2nqwtPFYWHAkbsdSMbXfUYZWDaAKRml
 XUIO8Is/KJ6DKjsYoISnfmlnOryOqAlzcLOA4Plvyt81/Dc7+f+wJ6MalF/Orx5QlzUC
 KqYEzIdkCJ6SvAMUutI7P6WaVVjBhQoFDIVCVZra4yElYmwSB2K26QB3d7Q1MIOjZeYp
 Q2HRv8txTkOHASkXQ/ZQE/HZXEO8I9MMRYqUhdpKr2sg39qBlPm9dFa0KK8oE8NH5jf5
 zs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hDH5WQTFX9jEpHPioCKl/b7JzkjPBXsyHzkmCwrz99E=;
 b=qm1iSwmfca7OX/USu245GOGz6TOB8owZQ67gRdfQc/0C0TIs073f9qFlo0xjz0hA5f
 1FpqWN21gDwd1T4XBfETTtPfs0efV71UJ9T688MaQiliIwTLBoM9vke84dKpBWXyisjQ
 3wDQyZ3G5spIyIkwx2/YIhJsqXHey0kBwDily5CqlgsJ3NqVrYs2I1mfajvuAmwfzKE0
 Kl0/Tu2dWIRPEqkjlN1YwnYtsPcldwpdztxZ4/ynnyYh8uRYp1xZFqt3B+RdfvdvRCWn
 jArH2OLuT47IBBYUvfCy0wBBMRfXdoquOVE/WRQm6pmBAz+4yI3hhVCoiSCdpmOkaRS5
 CPOw==
X-Gm-Message-State: AOAM532OZxVB0kY0LEOvlf7qPoKOBxxzp/fvLUADCjde5YGttdEsnYR0
 Mye7sDERkC+mOBr/MGVrJ0j8T6UzFEs=
X-Google-Smtp-Source: ABdhPJx6yflE1MN8AG5oj1R79Caaf9d2fcX6ZggZPkJLxglIK/Y1nr6RJHMSE+OongC+w+f9ic/btQ==
X-Received: by 2002:a0c:cb0c:: with SMTP id o12mr26072792qvk.54.1617037723763; 
 Mon, 29 Mar 2021 10:08:43 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id i6sm13553981qkf.96.2021.03.29.10.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 10:08:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 8/8] hw/riscv: microchip_pfsoc: Support direct kernel boot
Date: Tue, 30 Mar 2021 01:08:18 +0800
Message-Id: <20210329170818.23139-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329170818.23139-1-bmeng.cn@gmail.com>
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2e.google.com
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
X-List-Received-Date: Mon, 29 Mar 2021 17:08:50 -0000

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
---

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


