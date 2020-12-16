Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbSD-00062r-Qb
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbSB-00060R-VA; Wed, 16 Dec 2020 13:23:11 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:16695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbS9-0000NO-Jk; Wed, 16 Dec 2020 13:23:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608142989; x=1639678989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DIrQe7U4xe7SrMyGD37KWuxupguIicZkWBuMb2MoS6s=;
 b=mfG+IlKadWJjHK+8e1XHitMN6lAt8EdIoTX2aqXx5sGeJQmxKYlsNdcJ
 ALRv0xB1TVhDS9ApWj52z1CeXpOqq86stjQHRm7CdRqxmHv/3ePtJ5b56
 GPpbXE7L1D85BJP4j4xeDxqA1I2UtXhmEL+kQb/mWDhxiVG2cM9QDhrDB
 0747i10O3yy5d9CFWwbusV9ZWVuKQCgs/hbw/DfGxmSkO8PDENq8ihAK6
 ZrtJ4i+NP9yCCASrA4mDmx8rtj6+IQMIuMI8dTTGtpcwVPzYBacE14/AX
 d5iosOmiapHCBFiHh3zRGkMRptRACHdjJ2iwYIJ+1YPAt63PDnVDzAz9v A==;
IronPort-SDR: n4p7f9GpDyCEAoK8o5y0oNyoYeTdn4qRhYKTKlw0H9K+fSANv2eXYKMNd9660No0wZ9c6FiJak
 LhFpuYC0JNQM5WGudWMbu538hlv97l+0b75uEdPYrJOQyH2PPKHh8KFAthx10zE5qdwEHmAE0U
 U9W53P7T+FL+LAy5J/dSQnkjiZtUTxACJYzqj+RBLkUXjQx5U/0oU4kjga0LzPlKuFYqM3z7nN
 Y92LByqoKcQXS1Af77U94NANQlpvV5kepJ80Lwu6T4OPx+Y+67ngQLPcP3VGarMujpY5l4qMRn
 f/E=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="265507651"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:23:08 +0800
IronPort-SDR: 2wXQEhQGdbeMTam7c0/EbTvIF78mEIhSXBWfLyovm4mYEVX27zkTPrflYsnIt/QKYpmnL+zTvB
 60Kkuki6Uv+WDhww3yJiVlkKPaBv0ZH7rS2d/6VcTy3dwoq2YoYIH46DS3a9YnEEp+J84FKWDs
 fDZKLWjLH6ktwLFveuEUp/tO+Vo9ymQis22FdZBsEH6bncTgwFgpzR6L8FH5DHoPKsDd/rYp0L
 WEGl6CDBBXTGxgNONBb0wy1o1bDu5h2cuNtMBDI7dk7Wc+mJr+26n07XkCkdQHawMJqH4lN0mR
 h84Dnr3r6VK72jVQjopzO0oE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:06:43 -0800
IronPort-SDR: EcSepHHwXlrUrqlJ+M7+LizRESM9zN53f7f/3ariTugUQR8jgud6Wc3WkwGSMHbW6OWwmOoD2S
 jblQpHKaGGlPj5yml3Z+c3d+uFW0pG88ZRK1VEBKloGl0QuYm3nydbv/E3EZMcpGEE0CR/aB12
 VaYTuq2kBpNEd7dh99TgTxiBd6mNqZOj63VC2PtkXpq210furotr5S+D4W7v2L1bms6oTkUPzp
 GvhbLCJU0/Pgjq8YwDI0CSnxVadmWS1XQOTKKEdNR6o5++eotn/ShMfABS6ZpS+IeP0mbG0oAD
 1x4=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Dec 2020 10:23:08 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 16/16] hw/riscv: Use the CPU to determine if 32-bit
Date: Wed, 16 Dec 2020 10:23:08 -0800
Message-Id: <8ab7614e5df93ab5267788b73dcd75f9f5615e82.1608142916.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608142916.git.alistair.francis@wdc.com>
References: <cover.1608142916.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=612374860=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 16 Dec 2020 18:23:12 -0000

Instead of using string compares to determine if a RISC-V machine is
using 32-bit or 64-bit CPUs we can use the initalised CPUs. This avoids
us having to maintain a list of CPU names to compare against.

This commit also fixes the name of the function to match the
riscv_cpu_is_32bit() function.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h |  8 +++++---
 hw/riscv/boot.c         | 31 ++++++++++---------------------
 hw/riscv/sifive_u.c     | 10 +++++-----
 hw/riscv/spike.c        |  8 ++++----
 hw/riscv/virt.c         |  9 +++++----
 5 files changed, 29 insertions(+), 37 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index b6d37a91d6..20ff5fe5e5 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -22,10 +22,11 @@
 
 #include "exec/cpu-defs.h"
 #include "hw/loader.h"
+#include "hw/riscv/riscv_hart.h"
 
-bool riscv_is_32_bit(MachineState *machine);
+bool riscv_is_32bit(RISCVHartArrayState harts);
 
-target_ulong riscv_calc_kernel_start_addr(MachineState *machine,
+target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState harts,
                                           target_ulong firmware_end_addr);
 target_ulong riscv_find_and_load_firmware(MachineState *machine,
                                           const char *default_machine_firmware,
@@ -41,7 +42,8 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
                          uint64_t kernel_entry, hwaddr *start);
 uint32_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
-void riscv_setup_rom_reset_vec(MachineState *machine, hwaddr saddr,
+void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState harts,
+                               hwaddr saddr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
                                uint32_t fdt_load_addr, void *fdt);
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 6bce6fb485..83586aef41 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -33,28 +33,16 @@
 
 #include <libfdt.h>
 
-bool riscv_is_32_bit(MachineState *machine)
+bool riscv_is_32bit(RISCVHartArrayState harts)
 {
-    /*
-     * To determine if the CPU is 32-bit we need to check a few different CPUs.
-     *
-     * If the CPU starts with rv32
-     * If the CPU is a sifive 3 seriries CPU (E31, U34)
-     * If it's the Ibex CPU
-     */
-    if (!strncmp(machine->cpu_type, "rv32", 4) ||
-        (!strncmp(machine->cpu_type, "sifive", 6) &&
-            machine->cpu_type[8] == '3') ||
-        !strncmp(machine->cpu_type, "lowrisc-ibex", 12)) {
-        return true;
-    } else {
-        return false;
-    }
+    RISCVCPU hart = harts.harts[0];
+
+    return riscv_cpu_is_32bit(&hart.env);
 }
 
-target_ulong riscv_calc_kernel_start_addr(MachineState *machine,
+target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState harts,
                                           target_ulong firmware_end_addr) {
-    if (riscv_is_32_bit(machine)) {
+    if (riscv_is_32bit(harts)) {
         return QEMU_ALIGN_UP(firmware_end_addr, 4 * MiB);
     } else {
         return QEMU_ALIGN_UP(firmware_end_addr, 2 * MiB);
@@ -259,7 +247,8 @@ void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
                            &address_space_memory);
 }
 
-void riscv_setup_rom_reset_vec(MachineState *machine, hwaddr start_addr,
+void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState harts,
+                               hwaddr start_addr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
                                uint32_t fdt_load_addr, void *fdt)
@@ -267,7 +256,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, hwaddr start_addr,
     int i;
     uint32_t start_addr_hi32 = 0x00000000;
 
-    if (!riscv_is_32_bit(machine)) {
+    if (!riscv_is_32bit(harts)) {
         start_addr_hi32 = start_addr >> 32;
     }
     /* reset vector */
@@ -284,7 +273,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, hwaddr start_addr,
         0x00000000,
                                      /* fw_dyn: */
     };
-    if (riscv_is_32_bit(machine)) {
+    if (riscv_is_32bit(harts)) {
         reset_vec[3] = 0x0202a583;   /*     lw     a1, 32(t0) */
         reset_vec[4] = 0x0182a283;   /*     lw     t0, 24(t0) */
     } else {
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7216329237..62750007a5 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -453,7 +453,7 @@ static void sifive_u_machine_init(MachineState *machine)
 
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32_bit(machine));
+               riscv_is_32bit(s->soc.u_cpus));
 
     if (s->start_in_flash) {
         /*
@@ -482,7 +482,7 @@ static void sifive_u_machine_init(MachineState *machine)
         break;
     }
 
-    if (riscv_is_32_bit(machine)) {
+    if (riscv_is_32bit(s->soc.u_cpus)) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
                                     "opensbi-riscv32-generic-fw_dynamic.bin",
                                     start_addr, NULL);
@@ -493,7 +493,7 @@ static void sifive_u_machine_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        kernel_start_addr = riscv_calc_kernel_start_addr(machine,
+        kernel_start_addr = riscv_calc_kernel_start_addr(s->soc.u_cpus,
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine->kernel_filename,
@@ -520,7 +520,7 @@ static void sifive_u_machine_init(MachineState *machine)
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DEV_DRAM].base,
                                    machine->ram_size, s->fdt);
-    if (!riscv_is_32_bit(machine)) {
+    if (!riscv_is_32bit(s->soc.u_cpus)) {
         start_addr_hi32 = (uint64_t)start_addr >> 32;
     }
 
@@ -539,7 +539,7 @@ static void sifive_u_machine_init(MachineState *machine)
         0x00000000,
                                        /* fw_dyn: */
     };
-    if (riscv_is_32_bit(machine)) {
+    if (riscv_is_32bit(s->soc.u_cpus)) {
         reset_vec[4] = 0x0202a583;     /*     lw     a1, 32(t0) */
         reset_vec[5] = 0x0182a283;     /*     lw     t0, 24(t0) */
     } else {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 3e47e4579d..e723ca0ac9 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -244,7 +244,7 @@ static void spike_board_init(MachineState *machine)
 
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32_bit(machine));
+               riscv_is_32bit(s->soc[0]));
 
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv.spike.mrom",
@@ -257,7 +257,7 @@ static void spike_board_init(MachineState *machine)
      * keeping ELF files here was intentional because BIN files don't work
      * for the Spike machine as HTIF emulation depends on ELF parsing.
      */
-    if (riscv_is_32_bit(machine)) {
+    if (riscv_is_32bit(s->soc[0])) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
                                     "opensbi-riscv32-generic-fw_dynamic.elf",
                                     memmap[SPIKE_DRAM].base,
@@ -270,7 +270,7 @@ static void spike_board_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        kernel_start_addr = riscv_calc_kernel_start_addr(machine,
+        kernel_start_addr = riscv_calc_kernel_start_addr(s->soc[0],
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine->kernel_filename,
@@ -299,7 +299,7 @@ static void spike_board_init(MachineState *machine)
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, s->fdt);
     /* load the reset vector */
-    riscv_setup_rom_reset_vec(machine, memmap[SPIKE_DRAM].base,
+    riscv_setup_rom_reset_vec(machine, s->soc[0], memmap[SPIKE_DRAM].base,
                               memmap[SPIKE_MROM].base,
                               memmap[SPIKE_MROM].size, kernel_entry,
                               fdt_load_addr, s->fdt);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 915e9ae216..485a410da7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -603,7 +603,7 @@ static void virt_machine_init(MachineState *machine)
 
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32_bit(machine));
+               riscv_is_32bit(s->soc[0]));
 
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
@@ -611,7 +611,7 @@ static void virt_machine_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
                                 mask_rom);
 
-    if (riscv_is_32_bit(machine)) {
+    if (riscv_is_32bit(s->soc[0])) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
                                     "opensbi-riscv32-generic-fw_dynamic.bin",
                                     start_addr, NULL);
@@ -622,7 +622,7 @@ static void virt_machine_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        kernel_start_addr = riscv_calc_kernel_start_addr(machine,
+        kernel_start_addr = riscv_calc_kernel_start_addr(s->soc[0],
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine->kernel_filename,
@@ -658,7 +658,8 @@ static void virt_machine_init(MachineState *machine)
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, s->fdt);
     /* load the reset vector */
-    riscv_setup_rom_reset_vec(machine, start_addr, virt_memmap[VIRT_MROM].base,
+    riscv_setup_rom_reset_vec(machine, s->soc[0], start_addr,
+                              virt_memmap[VIRT_MROM].base,
                               virt_memmap[VIRT_MROM].size, kernel_entry,
                               fdt_load_addr, s->fdt);
 
-- 
2.29.2


