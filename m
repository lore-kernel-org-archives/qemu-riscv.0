Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pL2g7-0003e2-PQ
	for mharc-qemu-riscv@gnu.org; Thu, 26 Jan 2023 08:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pL2g5-0003cm-1K
 for qemu-riscv@nongnu.org; Thu, 26 Jan 2023 08:52:33 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pL2g2-00043z-Ud
 for qemu-riscv@nongnu.org; Thu, 26 Jan 2023 08:52:32 -0500
Received: by mail-oi1-x232.google.com with SMTP id i9so1426429oif.4
 for <qemu-riscv@nongnu.org>; Thu, 26 Jan 2023 05:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J7bp6OWxKmqGSF5SEiZBAGPU/QdVvSpCmmITMPl8D0o=;
 b=A3GD4qNst3zaCM83QgWFYix9P0svsdTKPmsLQda1l2A0BUp4oh9URMUY97crsS6c2X
 4GU83PFNonO2DlHOoaaT/LId7cRxblEuziOXNKCBm2oxpmeEDujdvdmMm6Eggs0inESZ
 ARrVhOGykRAVvgEyanKZ9fu/0ZiDaKC2yYNOgmrkvZbTs4LJivs4TqIjjtRa1Pq+Q6/V
 R1fUZxIhMVKWvrrT8gb66WGuY9dLjlA5/HOEWcLN33M9WCWM1thoZBPsFZXEentVaii7
 LdmkIBgMFBxVRBMNDifruXv0VyX/DWckj4y0Bl8kfIckkq7s53Yg5Xsbwx2d8OKoN6Kj
 heyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J7bp6OWxKmqGSF5SEiZBAGPU/QdVvSpCmmITMPl8D0o=;
 b=Sc7YuRfeTFwwgI9SK8tPVs16HAGdcugpZTQW4xd2UPucdsWGEsLMFMWbH/G1ZfmTCC
 WouEoBQDFXAAzea5L46+CKvJRVSuv5FKkINoZlTDKHVjnVyRAMqAYz8mdUgbzoz5C+dg
 EzC95sFEZKTF5gde830s8kxLUhvQT+Yg0ydIN75dzRcLHAwnbYwlNQXuOvkoGc3I+QSg
 dFiv/rMud7EdB/AHXfMNGANki6Kl/l3SkcaWw28dL7C2pJTiU+gS3Lt+Uy9r5X3e5uo+
 Az6DPQJ4Q+bdSdTR2OiL94Y3+Ps4nEBgx97xjO76GkkQCBk3cqy93VezBMbWLdTcDh34
 vz2w==
X-Gm-Message-State: AFqh2krCaQdiz9nNcVXmW2yTgbQD4o3fSY+s5YYl+SpVph3g1cZNbGWt
 XWjSNXoYmBVJ2x581mpHUzgf6w==
X-Google-Smtp-Source: AMrXdXvt6pffvoqelaHZVawGGcMmL3SdAa+ScoInhgFypDphwdebx62VyQkYslawKHdevQrcm4goUQ==
X-Received: by 2002:a54:4195:0:b0:35e:1a0f:7dc0 with SMTP id
 21-20020a544195000000b0035e1a0f7dc0mr14207849oiy.8.1674741149532; 
 Thu, 26 Jan 2023 05:52:29 -0800 (PST)
Received: from grind.dc1.ventanamicro.com (200-148-13-157.dsl.telesp.net.br.
 [200.148.13.157]) by smtp.gmail.com with ESMTPSA id
 w19-20020a9d77d3000000b00661b46cc26bsm496323otl.9.2023.01.26.05.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 05:52:29 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 2/3] hw/riscv: split fdt address calculation from fdt load
Date: Thu, 26 Jan 2023 10:52:18 -0300
Message-Id: <20230126135219.1054658-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126135219.1054658-1-dbarboza@ventanamicro.com>
References: <20230126135219.1054658-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
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
X-List-Received-Date: Thu, 26 Jan 2023 13:52:33 -0000

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
assumptions made by these functions. riscv_load_fdt() is now receiving a
hwaddr as fdt_addr because there is no restriction of having to load the
fdt in higher addresses that doesn't fit in an uint32_t.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 33 +++++++++++++++++++++++++--------
 hw/riscv/microchip_pfsoc.c |  6 ++++--
 hw/riscv/sifive_u.c        |  7 ++++---
 hw/riscv/spike.c           |  6 +++---
 hw/riscv/virt.c            |  7 ++++---
 include/hw/riscv/boot.h    |  4 +++-
 6 files changed, 43 insertions(+), 20 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index a563b7482a..a6f7b8ae8e 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -283,9 +283,21 @@ out:
     return kernel_entry;
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
@@ -306,11 +318,18 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
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
 
@@ -318,8 +337,6 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
                           &address_space_memory);
     qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                         rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
-
-    return fdt_addr;
 }
 
 void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index b7e171b605..a30203db85 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -633,8 +633,10 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                          kernel_start_addr, true, NULL);
 
         /* Compute the fdt load address in dram */
-        fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
-                                       machine->ram_size, machine->fdt);
+        fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
+                                               machine->ram_size, machine->fdt);
+        riscv_load_fdt(fdt_load_addr, machine->fdt);
+
         /* Load the reset vector */
         riscv_setup_rom_reset_vec(machine, &s->soc.u_cpus, firmware_load_addr,
                                   memmap[MICROCHIP_PFSOC_ENVM_DATA].base,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b0b3e6f03a..6bbdbe5fb7 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -608,9 +608,10 @@ static void sifive_u_machine_init(MachineState *machine)
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
index 483581e05f..ceebe34c5f 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -316,9 +316,9 @@ static void spike_board_init(MachineState *machine)
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
index 48326406fd..43fca597f0 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1292,9 +1292,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
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
index bc9faed397..7babd669c7 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -48,7 +48,9 @@ target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                bool load_initrd,
                                symbol_fn_t sym_cb);
-uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
+uint32_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
+                                void *fdt);
+void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
                                hwaddr rom_base, hwaddr rom_size,
-- 
2.39.1


