Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHTNR-0006Ux-R4
	for mharc-qemu-riscv@gnu.org; Mon, 16 Jan 2023 12:34:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHTNR-0006Uh-77
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 12:34:33 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHTNP-0004nx-7P
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 12:34:32 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-15b9c93848dso21249562fac.1
 for <qemu-riscv@nongnu.org>; Mon, 16 Jan 2023 09:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=huCIRm4fE2nXe/svvkMVa8+PPFhI8IrQIUTuoYZHTXw=;
 b=JYjDjzV4uXKC4s6VOuEK0dQS4BByh96eviDf3ur7jbJwOeJAuhree8vhiTdbM9wvD8
 R/in0u/HezWDleEsjSuTg24jXCOeIMZLfhdOm2VfyF03mLtYAheYGYriDBF5n7ZisusX
 rHV5Z4rjdBLv9B5objEndiRSjPfQT4nAiTju1BUhJi3YP1A+EfnTT7LpMD7UvyAYKLhC
 G1B4uj0yQ3Fs3614uX8zIHrB/OZ/0gFPu71mlKro4kFM4PDyU1fS/OiqgtGmp+1Kb5YZ
 YWS42fX4IVBh+cJOI32dDuNKetbk1LCPK/YWWH6NWIOQB2VtJjzm3m2400Ks1+GJRTa8
 qlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=huCIRm4fE2nXe/svvkMVa8+PPFhI8IrQIUTuoYZHTXw=;
 b=rDGpwyw/xxMCqufTeZE09Hv490Vxd5F4QCDyF7o80cG1K5vkRf1iaGLBfNfYS7YRgc
 g/8GEEHIt7cpOyVZJx0NtcJWK6JqbJhYkFKACbgG79EXMlcQxV9uuc4+NMyJyScxfVjj
 nksYvAv6VmR8bJ1Td8ugm1woZ8ZifIunQdxCVwPl/FqhQLbbwdQe0cbiqrTn9OwgWntx
 LkYC/BFRiS2mpbx0LiI4Dg8wGW2vOd4KN7M1UpN5BLLI5tbdkgHtlYAl5lU/korXpT8d
 e3Jm//P022KXu3F8LsrnjcD5b3OUDM1j/cKTMnG9xrUYXnSrGwwZldzXNHzG0LFOdfMX
 upXg==
X-Gm-Message-State: AFqh2krwWmD6DWpXmeW4BmRtDJz5DP9O8+fzsggqYNjQXVjIcrHmClob
 sL8hSltqwCJt1EdgRRm4fS9PPuLl34nPlsUFuzY=
X-Google-Smtp-Source: AMrXdXsLLBtVJH/ZJ6W6mep69I0j/nRsIAzf/m/jyF6VUvdG0XLjbq0ErhokQUQyIlQdc4W3ax0GCQ==
X-Received: by 2002:a05:6870:80cf:b0:150:3588:3359 with SMTP id
 r15-20020a05687080cf00b0015035883359mr12835714oab.2.1673890470045; 
 Mon, 16 Jan 2023 09:34:30 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 f23-20020a4ae617000000b0049fd5c02d25sm1353802oot.12.2023.01.16.09.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 09:34:29 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 2/6] hw/riscv: split fdt address calculation from fdt load
Date: Mon, 16 Jan 2023 14:34:16 -0300
Message-Id: <20230116173420.1146808-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
References: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 17:34:33 -0000

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

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 24 ++++++++++++++++--------
 hw/riscv/microchip_pfsoc.c |  6 ++++--
 hw/riscv/sifive_u.c        |  7 ++++---
 hw/riscv/spike.c           |  6 +++---
 hw/riscv/virt.c            |  7 ++++---
 include/hw/riscv/boot.h    |  3 ++-
 6 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index dc14d8cd14..b213a32157 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -249,9 +249,16 @@ void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
     }
 }
 
-uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
+/*
+ * The FDT should be put at the farthest point possible to
+ * avoid overwriting it with the kernel/initrd.
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
@@ -272,11 +279,14 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
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
+void riscv_load_fdt(uint32_t fdt_addr, void *fdt)
+{
+    uint32_t fdtsize = fdt_totalsize(fdt);
+
     /* copy in the device tree */
     qemu_fdt_dumpdtb(fdt, fdtsize);
 
@@ -284,8 +294,6 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
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
index e6d4f06e8d..839dfaa125 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1307,9 +1307,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
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
index f94653a09b..9aea7b9c46 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -47,7 +47,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
-uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
+uint32_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size, void *fdt);
+void riscv_load_fdt(uint32_t fdt_addr, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
                                hwaddr rom_base, hwaddr rom_size,
-- 
2.39.0


