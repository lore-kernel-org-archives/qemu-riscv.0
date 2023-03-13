Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pbXlt-00088F-Rw
	for mharc-qemu-riscv@gnu.org; Sun, 12 Mar 2023 22:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuhang@eswincomputing.com>)
 id 1pbXls-000880-JT; Sun, 12 Mar 2023 22:18:44 -0400
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net ([206.189.79.184])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xuhang@eswincomputing.com>)
 id 1pbXlq-0003XP-KO; Sun, 12 Mar 2023 22:18:44 -0400
Received: from localhost.localdomain (unknown [10.12.130.32])
 by app1 (Coremail) with SMTP id EwgMCgD3YZX3hw5kDZYFAA--.16518S5;
 Mon, 13 Mar 2023 10:18:37 +0800 (CST)
From: Hang Xu <xuhang@eswincomputing.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, palmer@rivosinc.com, dbarboza@ventanamicro.com,
 alistair.francis@wdc.com, Hang Xu <xuhang@eswincomputing.com>
Subject: [PATCH v3 1/1] hw/riscv: Fix max size limit when put initrd to RAM
Date: Mon, 13 Mar 2023 02:18:26 +0000
Message-Id: <20230313021826.6898-2-xuhang@eswincomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230313021826.6898-1-xuhang@eswincomputing.com>
References: <20230313021826.6898-1-xuhang@eswincomputing.com>
X-CM-TRANSID: EwgMCgD3YZX3hw5kDZYFAA--.16518S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr18Cr45tw4kCryUury8Krg_yoWxXryDpF
 WfGrs7Zr4rtrZ3ZasrKr4UWryUJws5Way5GFy8Ar4ktF4vgry8JrsFq34Iv3yqyF4kJ3Z0
 9FWvkrySy3WYvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j6rxdM2
 8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVCm-wCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
 CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUlPfdUUUUU=
X-CM-SenderInfo: p0xkt03j6h245lqf0zpsxwx03jof0z/
Received-SPF: pass client-ip=206.189.79.184;
 envelope-from=xuhang@eswincomputing.com;
 helo=zg8tmja2lje4os43os4xodqa.icoremail.net
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 13 Mar 2023 02:18:44 -0000

Because the starting address of ram is not necessarily 0,
the remaining free space in ram is
ram_size - (start - ram_base) instead of ram_size-start.

Signed-off-by: Hang Xu <xuhang@eswincomputing.com>
---
 hw/riscv/boot.c            | 19 +++++++++++++------
 hw/riscv/microchip_pfsoc.c |  5 ++++-
 hw/riscv/opentitan.c       |  2 +-
 hw/riscv/sifive_e.c        |  2 +-
 hw/riscv/sifive_u.c        |  5 ++++-
 hw/riscv/spike.c           |  5 ++++-
 hw/riscv/virt.c            |  5 ++++-
 include/hw/riscv/boot.h    |  2 ++
 8 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 52bf8e67de..cfbc376a82 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -173,13 +173,14 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
     exit(1);
 }
 
-static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
+static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry,
+                              uint64_t ram_base, uint64_t ram_size)
 {
     const char *filename = machine->initrd_filename;
-    uint64_t mem_size = machine->ram_size;
     void *fdt = machine->fdt;
     hwaddr start, end;
     ssize_t size;
+    uint64_t max_initrd;
 
     g_assert(filename != NULL);
 
@@ -193,12 +194,16 @@ static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
      * So for boards with less  than 256MB of RAM we put the initrd
      * halfway into RAM, and for boards with 256MB of RAM or more we put
      * the initrd at 128MB.
+     * A ram_size == 0, usually from a MemMapEntry[].size element,
+     * means that the RAM block goes all the way to ms->ram_size.
      */
-    start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
+    ram_size = ram_size ? MIN(machine->ram_size, ram_size) : machine->ram_size;
+    start = kernel_entry + MIN(ram_size / 2, 128 * MiB);
+    max_initrd = ram_size - (start - ram_base);
 
-    size = load_ramdisk(filename, start, mem_size - start);
+    size = load_ramdisk(filename, start, max_initrd);
     if (size == -1) {
-        size = load_image_targphys(filename, start, mem_size - start);
+        size = load_image_targphys(filename, start, max_initrd);
         if (size == -1) {
             error_report("could not load ramdisk '%s'", filename);
             exit(1);
@@ -217,6 +222,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
                                RISCVHartArrayState *harts,
                                target_ulong kernel_start_addr,
                                bool load_initrd,
+                               uint64_t ram_base,
+                               uint64_t ram_size,
                                symbol_fn_t sym_cb)
 {
     const char *kernel_filename = machine->kernel_filename;
@@ -263,7 +270,7 @@ out:
     }
 
     if (load_initrd && machine->initrd_filename) {
-        riscv_load_initrd(machine, kernel_entry);
+        riscv_load_initrd(machine, kernel_entry, ram_base, ram_size);
     }
 
     if (fdt && machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index e81bbd12df..b42d90b89e 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -630,7 +630,10 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
-                                         kernel_start_addr, true, NULL);
+                                         kernel_start_addr, true,
+                                         memmap[MICROCHIP_PFSOC_DRAM_LO].base,
+                                         memmap[MICROCHIP_PFSOC_DRAM_LO].size,
+                                         NULL);
 
         /* Compute the fdt load address in dram */
         fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index b06944d382..bb663523d5 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -103,7 +103,7 @@ static void opentitan_board_init(MachineState *machine)
     if (machine->kernel_filename) {
         riscv_load_kernel(machine, &s->soc.cpus,
                           memmap[IBEX_DEV_RAM].base,
-                          false, NULL);
+                          false, 0, 0, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 04939b60c3..5b47d539a6 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -116,7 +116,7 @@ static void sifive_e_machine_init(MachineState *machine)
     if (machine->kernel_filename) {
         riscv_load_kernel(machine, &s->soc.cpus,
                           memmap[SIFIVE_E_DEV_DTIM].base,
-                          false, NULL);
+                          false, 0, 0, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 35a335b8d0..b45fdc968c 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -599,7 +599,10 @@ static void sifive_u_machine_init(MachineState *machine)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
-                                         kernel_start_addr, true, NULL);
+                                         kernel_start_addr, true,
+                                         memmap[SIFIVE_U_DEV_DRAM].base,
+                                         memmap[SIFIVE_U_DEV_DRAM].size,
+                                         NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index a584d5b3a2..e322ed8506 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -307,7 +307,10 @@ static void spike_board_init(MachineState *machine)
 
         kernel_entry = riscv_load_kernel(machine, &s->soc[0],
                                          kernel_start_addr,
-                                         true, htif_symbol_callback);
+                                         true,
+                                         memmap[SPIKE_DRAM].base,
+                                         memmap[SPIKE_DRAM].size,
+                                         htif_symbol_callback);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4e3efbee16..11f26b0dc0 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1287,7 +1287,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, &s->soc[0],
-                                         kernel_start_addr, true, NULL);
+                                         kernel_start_addr, true,
+                                         memmap[VIRT_DRAM].base,
+                                         memmap[VIRT_DRAM].size,
+                                         NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index a2e4ae9cb0..987e1add38 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -47,6 +47,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
                                RISCVHartArrayState *harts,
                                target_ulong firmware_end_addr,
                                bool load_initrd,
+                               uint64_t ram_base,
+                               uint64_t ram_size,
                                symbol_fn_t sym_cb);
 uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
                                 MachineState *ms);
-- 
2.17.1


