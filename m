Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIaSv-0002Sf-IR
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 14:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIaSk-0002LJ-Uc
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 14:20:38 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIaSg-0007Vj-9L
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 14:20:37 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1433ef3b61fso3686344fac.10
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 11:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3iN7pH8FpnPzR6PDGgcInVMCnnKy9xhplc7eVJyMBgc=;
 b=GAYGpWEibJtoLm7RmpBlSdSnv0RDxCS3VmPrgCQhBDO/y7WoH2NW6BBD1nUYlALcYX
 kktWw2duBLfYh7ZjfrgAvORYI3YaNaG/nB+8PIU9SXwX2dCG3qS1KECY0ty11Osp5zzz
 pHiccBn1iVr9i2EtrBSdFT+8sEh9LJ7WfmilPl1a/NxhHVaPnP2n59LEE6dGJYsCv1CE
 EFFb6WnY70ekPF5fVzZaAfHmyqlzCWSS7tFqD5KCb7pXeFNQrYkTBgCwpXbvxWMIV3sJ
 ayyWSoHM+dPThRsTyhCcdKUAD5dWf1WcVsiyK/8HeKEX/ty7pGImhHWM40U3Y/ADRrhi
 OCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3iN7pH8FpnPzR6PDGgcInVMCnnKy9xhplc7eVJyMBgc=;
 b=YcQBT//kgzfpM2ukg2F3vItSTCZ6KYjQWswt09+l1kJTRDYvH9xmlSserVl0Zwo8ST
 eMDi/8PpO9J02tpweB1MRp3vwWObYn3MtXXsYAkYjqXMLQZnGBCbU6YeFxXiJwOl3zk8
 EPPHQxgZEwo9GhRXNU7CKDwcB3DiQaKshqBB9QocFclautgfiZTchOLa2kSQcM9CXtXq
 jvSi47GZ90sIYqPamzF27cFSagRKSLo+DgF1LKkeZ1qZR3KJ9Rl4PXZCuCS65fUgxUv9
 G848mbXc1yW94Vyb+/9fxIKvyBlM6CpGokvuyvepGQEm4nRF0k+LXW0SE4V4kg5CLLZo
 mkYA==
X-Gm-Message-State: AFqh2koUqh2HYS92x0RED2+obpOT+Pge7f0gErTALOI2/yKqXlv1nXvB
 i9tH9oK6Clu1v+RQxEtQCFjUObKYBPdcFY6ZqVM=
X-Google-Smtp-Source: AMrXdXvQr8vE7zEYDCbqww1ZZfhruBWdGzBwylaC/j/UM7giksx4USr7H1BEc1jmNl0zBpwrFIDLbg==
X-Received: by 2002:a05:6870:bf17:b0:158:57f7:b047 with SMTP id
 qh23-20020a056870bf1700b0015857f7b047mr5916442oab.0.1674156032861; 
 Thu, 19 Jan 2023 11:20:32 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a056870f20900b0015f193c86d2sm9001128oao.6.2023.01.19.11.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 11:20:32 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 2/7] hw/riscv: split fdt address calculation from fdt load
Date: Thu, 19 Jan 2023 16:17:23 -0300
Message-Id: <20230119191728.622081-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119191728.622081-1-dbarboza@ventanamicro.com>
References: <20230119191728.622081-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 19:20:39 -0000

A common trend in other archs is to calculate the fdt address, which is
usually straightforward, and then calling a function that loads the
fdt/dtb by using that address.

riscv_load_fdt() is doing a bit too much in comparison. It's calculating
the fdt address via an elaborated heuristic to put the FDT at the bottom
of DRAM, and "bottom of DRAM" will vary across boards and
configurations, then it's actually loading the fdt, and finally it's
returning the fdt address used to the caller.

Reduce the existing complexity of riscv_load_fdt() by splitting its code
into a new function, riscv_compute_fdt_addr(), that will take care of
all fdt address logic. riscv_load_fdt() can then be a simple function
that just loads a fdt at the given fdt address.

We're also taken the opportunity to clarify the intentions and
assumptions made by these functions. riscv_load_fdt() is receiving a
hwaddr as fdt_addr because the Polarfire SoC will have an exclusive
compute fdt address function that can return 64 bit addresses.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 33 +++++++++++++++++++++++++--------
 hw/riscv/microchip_pfsoc.c |  6 ++++--
 hw/riscv/sifive_u.c        |  7 ++++---
 hw/riscv/spike.c           |  6 +++---
 hw/riscv/virt.c            |  7 ++++---
 include/hw/riscv/boot.h    |  3 ++-
 6 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index dc14d8cd14..13b5ce2d49 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -249,9 +249,21 @@ void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
     }
 }
 
-uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
+/*
+ * The FDT should be put at the farthest point possible to
+ * avoid overwriting it with the kernel/initrd.
+ *
+ * This function makes an assumption that the DRAM is
+ * contiguous. It also cares about 32-bit systems and
+ * will limit fdt_addr to be addressable by them even for
+ * 64-bit CPUs.
+ *
+ * The FDT is fdt_packed() during the calculation.
+ */
+uint32_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
+                                void *fdt)
 {
-    uint64_t temp, fdt_addr;
+    uint64_t temp;
     hwaddr dram_end = dram_base + mem_size;
     int ret = fdt_pack(fdt);
     int fdtsize;
@@ -272,11 +284,18 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
      * end of dram or 3GB whichever is lesser.
      */
     temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
-    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
 
-    ret = fdt_pack(fdt);
-    /* Should only fail if we've built a corrupted tree */
-    g_assert(ret == 0);
+    return QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
+}
+
+/*
+ * 'fdt_addr' is received as hwaddr because boards might put
+ * the FDT beyond 32-bit addressing boundary.
+ */
+void riscv_load_fdt(hwaddr fdt_addr, void *fdt)
+{
+    uint32_t fdtsize = fdt_totalsize(fdt);
+
     /* copy in the device tree */
     qemu_fdt_dumpdtb(fdt, fdtsize);
 
@@ -284,8 +303,6 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
                           &address_space_memory);
     qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                         rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
-
-    return fdt_addr;
 }
 
 void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 82ae5e7023..dcdbc2cac3 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -641,8 +641,10 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         }
 
         /* Compute the fdt load address in dram */
-        fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
-                                       machine->ram_size, machine->fdt);
+        fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
+                                              machine->ram_size, machine->fdt);
+        riscv_load_fdt(fdt_load_addr, machine->fdt);
+
         /* Load the reset vector */
         riscv_setup_rom_reset_vec(machine, &s->soc.u_cpus, firmware_load_addr,
                                   memmap[MICROCHIP_PFSOC_ENVM_DATA].base,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 2fb6ee231f..626d4dc2f3 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -616,9 +616,10 @@ static void sifive_u_machine_init(MachineState *machine)
         kernel_entry = 0;
     }
 
-    /* Compute the fdt load address in dram */
-    fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DEV_DRAM].base,
-                                   machine->ram_size, machine->fdt);
+    fdt_load_addr = riscv_compute_fdt_addr(memmap[SIFIVE_U_DEV_DRAM].base,
+                                           machine->ram_size, machine->fdt);
+    riscv_load_fdt(fdt_load_addr, machine->fdt);
+
     if (!riscv_is_32bit(&s->soc.u_cpus)) {
         start_addr_hi32 = (uint64_t)start_addr >> 32;
     }
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index badc11ec43..88b9fdfc36 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -324,9 +324,9 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = 0;
     }
 
-    /* Compute the fdt load address in dram */
-    fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
-                                   machine->ram_size, machine->fdt);
+    fdt_load_addr = riscv_compute_fdt_addr(memmap[SPIKE_DRAM].base,
+                                           machine->ram_size, machine->fdt);
+    riscv_load_fdt(fdt_load_addr, machine->fdt);
 
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4a11b4b010..67c8a01e1d 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1300,9 +1300,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
-    /* Compute the fdt load address in dram */
-    fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
-                                   machine->ram_size, machine->fdt);
+    fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
+                                           machine->ram_size, machine->fdt);
+    riscv_load_fdt(fdt_load_addr, machine->fdt);
+
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
                               virt_memmap[VIRT_MROM].base,
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index f94653a09b..c529ed2129 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -47,7 +47,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
-uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
+uint32_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size, void *fdt);
+void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
                                hwaddr rom_base, hwaddr rom_size,
-- 
2.39.0


