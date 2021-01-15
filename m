Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0Y5B-0000Bb-Pl
	for mharc-qemu-riscv@gnu.org; Fri, 15 Jan 2021 18:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6423a20e6=alistair.francis@wdc.com>)
 id 1l0Y56-0000AQ-6K; Fri, 15 Jan 2021 18:00:36 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:60096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6423a20e6=alistair.francis@wdc.com>)
 id 1l0Y53-0001A9-FS; Fri, 15 Jan 2021 18:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610751633; x=1642287633;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mAvGZcioxUXJpnzyTRFjCTFzCm7YJnsTEwO9BnNi268=;
 b=aPmDmf1Gpxbx+6D2xLV//DaXXmEtdfROKjxinaiT1HJKFp9pVbwhlu41
 vWFMZJE1fKbFfnGHzpD2hwTUMLPsb0DWK7DOV4ljMtWMWk7yY3oUo2PlO
 lU8Wskalq4imghIp1yBdydrwkM+Lwc9p/KnstbrBCZOEgKGqotlaovNKp
 7aGPhZofh4+42FEvtl/nbpc/0E8oICIVAkrD6roszxC24hAVP4h9/ZKND
 jv+nCPKXef1+qhUBcblcuxiHvOHTqhk5WQ25YLB5ZxgrynCISyAZaLc51
 cvz7Nr+by3n7PoaI9La5EW0DlOD896d1yDWm3z+BZr9tms2mpIi0fgeri A==;
IronPort-SDR: nXRGsW3B+HQTnO2DfJN4McgcwvxvW5oqgSuF1cr992oe9mmh3meRc+ES25m9xCRFVKSt0HF4xj
 8oc2fRjWgPGM8+TQLnq2ZWcUWv3Ik78hy9xxlfPXTx5XH7SUbuZ32VhjveHnElhwfYAio7SVbd
 ZdOfaQ67LLlB8r3QVDXpCNZPCZ3XoEKU3Xbun9EYNpmuVz40ee74UHfGTWncbHcYHgNiSZaeU8
 IxTxJjVYKGFjErdERkJHOcKEjBDq1sQ7GNYSQh4BW6ACoGJI/+4311SXqClgsoApFIuD+Ngp+Q
 oLQ=
X-IronPort-AV: E=Sophos;i="5.79,350,1602518400"; d="scan'208";a="157552778"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Jan 2021 07:00:29 +0800
IronPort-SDR: YTqTHbSxQuVz6gpDyRw5CAEgyJTFLBqu2rNAbg6x+/f97kh261ehNkfOJ7chCy1k1DLg2oYYOD
 HI7S922Z34rVUCozhqwiYXImYVZOanxaatiguKMsL2rcGoqcoq1uNORuudInZa7Fu9VEP6a7fK
 hYOzP7OHxV7GpqatzILJeHT2axw4XBOyx7FwXOm3C2/cCAfeRQghrdSwfFhQa0oIoQQJ9fWLhM
 G1X2KzWkiiMGY7M3I3KqFA3IVV9N6Xfv+VjKi2xH8oS3hNvVjJTExw9a6K2xW/9Xn43TRtqVKX
 G+A2fh4VQlzMLq1Hm4ikle71
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 14:45:10 -0800
IronPort-SDR: aVmXF4TdbCEVdlQKtC6//mrhBn3a7rVjuZRMbScmv8ADdgRN61T07pY2i94ub58Pnv99CDoGFF
 TiePZA7EsxOycHFMmRESc1czWfpdg3MYPogm7nLSb5ijC7i624NhpmmiZLMCOCFZlmU7ICl9S7
 BNHst/Y2jBFTl8WE1gllpfLSQuxyZM4vJvSwZIL/0zIqFDq+VcZi4zRIQPZtXBnlTLXo8CcT7e
 D0mrFOtTGUHy77xEIz50TXNI2uiUnN4pcVhtpUprTehwrUD/YH5YNm5nWPg4iCUmX/jxXvG/4V
 TOA=
WDCIronportException: Internal
Received: from cnf007776.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.249])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jan 2021 15:00:29 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/1] riscv: Pass RISCVHartArrayState by pointer
Date: Fri, 15 Jan 2021 15:00:27 -0800
Message-Id: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=6423a20e6=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Fri, 15 Jan 2021 23:00:39 -0000

We were accidently passing RISCVHartArrayState by value instead of
pointer. The type is 824 bytes long so let's correct that and pass it by
pointer instead.

Fixes: Coverity CID 1438099
Fixes: Coverity CID 1438100
Fixes: Coverity CID 1438101
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h |  6 +++---
 hw/riscv/boot.c         |  8 ++++----
 hw/riscv/sifive_u.c     | 10 +++++-----
 hw/riscv/spike.c        |  8 ++++----
 hw/riscv/virt.c         |  8 ++++----
 5 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 20ff5fe5e5..11a21dd584 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -24,9 +24,9 @@
 #include "hw/loader.h"
 #include "hw/riscv/riscv_hart.h"
 
-bool riscv_is_32bit(RISCVHartArrayState harts);
+bool riscv_is_32bit(RISCVHartArrayState *harts);
 
-target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState harts,
+target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
                                           target_ulong firmware_end_addr);
 target_ulong riscv_find_and_load_firmware(MachineState *machine,
                                           const char *default_machine_firmware,
@@ -42,7 +42,7 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
                          uint64_t kernel_entry, hwaddr *start);
 uint32_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
-void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState harts,
+void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 83586aef41..acf77675b2 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -33,14 +33,14 @@
 
 #include <libfdt.h>
 
-bool riscv_is_32bit(RISCVHartArrayState harts)
+bool riscv_is_32bit(RISCVHartArrayState *harts)
 {
-    RISCVCPU hart = harts.harts[0];
+    RISCVCPU hart = harts->harts[0];
 
     return riscv_cpu_is_32bit(&hart.env);
 }
 
-target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState harts,
+target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
                                           target_ulong firmware_end_addr) {
     if (riscv_is_32bit(harts)) {
         return QEMU_ALIGN_UP(firmware_end_addr, 4 * MiB);
@@ -247,7 +247,7 @@ void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
                            &address_space_memory);
 }
 
-void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState harts,
+void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr start_addr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index f5c400dd44..d23f349b4e 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -466,7 +466,7 @@ static void sifive_u_machine_init(MachineState *machine)
 
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(s->soc.u_cpus));
+               riscv_is_32bit(&s->soc.u_cpus));
 
     if (s->start_in_flash) {
         /*
@@ -495,7 +495,7 @@ static void sifive_u_machine_init(MachineState *machine)
         break;
     }
 
-    if (riscv_is_32bit(s->soc.u_cpus)) {
+    if (riscv_is_32bit(&s->soc.u_cpus)) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
                                     "opensbi-riscv32-generic-fw_dynamic.bin",
                                     start_addr, NULL);
@@ -506,7 +506,7 @@ static void sifive_u_machine_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        kernel_start_addr = riscv_calc_kernel_start_addr(s->soc.u_cpus,
+        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine->kernel_filename,
@@ -533,7 +533,7 @@ static void sifive_u_machine_init(MachineState *machine)
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DEV_DRAM].base,
                                    machine->ram_size, s->fdt);
-    if (!riscv_is_32bit(s->soc.u_cpus)) {
+    if (!riscv_is_32bit(&s->soc.u_cpus)) {
         start_addr_hi32 = (uint64_t)start_addr >> 32;
     }
 
@@ -552,7 +552,7 @@ static void sifive_u_machine_init(MachineState *machine)
         0x00000000,
                                        /* fw_dyn: */
     };
-    if (riscv_is_32bit(s->soc.u_cpus)) {
+    if (riscv_is_32bit(&s->soc.u_cpus)) {
         reset_vec[4] = 0x0202a583;     /*     lw     a1, 32(t0) */
         reset_vec[5] = 0x0182a283;     /*     lw     t0, 24(t0) */
     } else {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index e723ca0ac9..56986ecfe0 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -244,7 +244,7 @@ static void spike_board_init(MachineState *machine)
 
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(s->soc[0]));
+               riscv_is_32bit(&s->soc[0]));
 
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv.spike.mrom",
@@ -257,7 +257,7 @@ static void spike_board_init(MachineState *machine)
      * keeping ELF files here was intentional because BIN files don't work
      * for the Spike machine as HTIF emulation depends on ELF parsing.
      */
-    if (riscv_is_32bit(s->soc[0])) {
+    if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
                                     "opensbi-riscv32-generic-fw_dynamic.elf",
                                     memmap[SPIKE_DRAM].base,
@@ -270,7 +270,7 @@ static void spike_board_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        kernel_start_addr = riscv_calc_kernel_start_addr(s->soc[0],
+        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine->kernel_filename,
@@ -299,7 +299,7 @@ static void spike_board_init(MachineState *machine)
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, s->fdt);
     /* load the reset vector */
-    riscv_setup_rom_reset_vec(machine, s->soc[0], memmap[SPIKE_DRAM].base,
+    riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
                               memmap[SPIKE_MROM].base,
                               memmap[SPIKE_MROM].size, kernel_entry,
                               fdt_load_addr, s->fdt);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8de4c35c9d..2299b3a6be 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -601,7 +601,7 @@ static void virt_machine_init(MachineState *machine)
 
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(s->soc[0]));
+               riscv_is_32bit(&s->soc[0]));
 
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
@@ -609,7 +609,7 @@ static void virt_machine_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
                                 mask_rom);
 
-    if (riscv_is_32bit(s->soc[0])) {
+    if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
                                     "opensbi-riscv32-generic-fw_dynamic.bin",
                                     start_addr, NULL);
@@ -620,7 +620,7 @@ static void virt_machine_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        kernel_start_addr = riscv_calc_kernel_start_addr(s->soc[0],
+        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine->kernel_filename,
@@ -656,7 +656,7 @@ static void virt_machine_init(MachineState *machine)
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, s->fdt);
     /* load the reset vector */
-    riscv_setup_rom_reset_vec(machine, s->soc[0], start_addr,
+    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
                               virt_memmap[VIRT_MROM].base,
                               virt_memmap[VIRT_MROM].size, kernel_entry,
                               fdt_load_addr, s->fdt);
-- 
2.29.2


