Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNGey-0006e6-3q
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 12:12:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNGeo-0006bK-Vo
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 12:12:27 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNGem-0004JV-CJ
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 12:12:26 -0500
Received: by mail-oi1-x22a.google.com with SMTP id o66so16296925oia.6
 for <qemu-riscv@nongnu.org>; Wed, 01 Feb 2023 09:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Upg3n6UXcqzGiqp/8YrNQfPE1Y/A4TRC8HGgGpV9Gu0=;
 b=i+y8PuxYPo2Xkyqe74+MkYUMvR4/cM4OmjCz1avViblKGQgavDHMGtG88Sy6SRU8YJ
 65tG7W/gnFkNgKntHnqqgIavMd8iKMZ/AF6w+KxeOzqnW58BLK43/RzWaDHe6FuCWHyN
 ZSORx9gPJJC4xNKVNDwHMijXmBGEFWvTFVRVOakrUFABHA5VDqwrdlAaNVMWSreKKrG9
 OiYzpVOCCBA951/gIGWXwtVVX6JjpvvVI2nHgeh2UyUzNuxoXORGXmrcHjf80XF+e2bQ
 8CYhL6AQFsCLtHHnZatumat1TapYs4KB+O9mJ7CEdEGwvqYe1CqMEEbZa8VCClfTYl1g
 Xm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Upg3n6UXcqzGiqp/8YrNQfPE1Y/A4TRC8HGgGpV9Gu0=;
 b=eXTgNZHRHO6c5tv0P9RNzu+MMRzAYeQHudmkGbLik7iIwIUgFZZ8bKp29m7bmo5udy
 K0LvJ9tr1tSeFCBxEh2ZzlZlaFAUWf27o1b8Bupl5QSCihKZ43ZB6jfN47IV2jh1x2TO
 tyWQT3loB9ku9mk7tuGu3np8sx8PZqdicnZXFZh0DuvPnj46mD899ItHoqhyDagraef9
 4/qrJfjNf2yhx9xjvC2TorztgmNiFLGtR2NgxJNPhyuIe3UJGWSLsmmzoRYYu+YsJJxr
 uXhn1xiVdXYbrxQgl9wbX+TBRuA1m5+cnbPceLfKWzS02TmGMWadwD4kSzAXheVSluzO
 gK7Q==
X-Gm-Message-State: AO0yUKWH/IHfcHYA4Weadibd4REwSIzOPdptEKGtvFHFHn4KNI2U/MBo
 TXLV9PGcN+71m6d4yjNhDTRI6g==
X-Google-Smtp-Source: AK7set/xAILLBukjOBVhMhCmgAHgQR+LlQ3Bin78BKbRk6UvKmxXDShgEDA3PA4Se0EIKqPIj0X7MA==
X-Received: by 2002:a54:4e8f:0:b0:36a:d348:26d8 with SMTP id
 c15-20020a544e8f000000b0036ad34826d8mr1272472oiy.52.1675271543202; 
 Wed, 01 Feb 2023 09:12:23 -0800 (PST)
Received: from grind.. ([177.102.69.207]) by smtp.gmail.com with ESMTPSA id
 k12-20020a056808068c00b003749e231db7sm7100627oig.30.2023.02.01.09.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 09:12:22 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 2/3] hw/riscv: split fdt address calculation from fdt load
Date: Wed,  1 Feb 2023 14:12:11 -0300
Message-Id: <20230201171212.1219375-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201171212.1219375-1-dbarboza@ventanamicro.com>
References: <20230201171212.1219375-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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
X-List-Received-Date: Wed, 01 Feb 2023 17:12:27 -0000

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
 hw/riscv/boot.c            | 30 +++++++++++++++++++++++++-----
 hw/riscv/microchip_pfsoc.c |  6 ++++--
 hw/riscv/sifive_u.c        |  7 ++++---
 hw/riscv/spike.c           |  6 +++---
 hw/riscv/virt.c            |  7 ++++---
 include/hw/riscv/boot.h    |  4 +++-
 6 files changed, 43 insertions(+), 17 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 2d03a9a921..2e53494b08 100644
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
+uint64_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
+                                void *fdt)
 {
-    uint64_t temp, fdt_addr;
+    uint64_t temp;
     hwaddr dram_end = dram_base + mem_size;
     int ret = fdt_pack(fdt);
     int fdtsize;
@@ -272,7 +284,17 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
      * end of dram or 3GB whichever is lesser.
      */
     temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
-    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
+
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
 
     /* copy in the device tree */
     qemu_fdt_dumpdtb(fdt, fdtsize);
@@ -281,8 +303,6 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
                           &address_space_memory);
     qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                         rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
-
-    return fdt_addr;
 }
 
 void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 82ae5e7023..17499d4152 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -641,8 +641,10 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         }
 
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
index 04d236296b..f1114f2c71 100644
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
index e420254de2..2e0a0cdb17 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1303,9 +1303,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
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
index f94653a09b..46de4ec46b 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -47,7 +47,9 @@ target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
-uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
+uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
+                                void *fdt);
+void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
                                hwaddr rom_base, hwaddr rom_size,
-- 
2.39.1


