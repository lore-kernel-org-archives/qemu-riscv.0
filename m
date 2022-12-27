Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pA3m0-0006Op-0B
	for mharc-qemu-riscv@gnu.org; Tue, 27 Dec 2022 01:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pA3ly-0006OC-9j; Tue, 27 Dec 2022 01:49:14 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pA3lu-0006mt-LA; Tue, 27 Dec 2022 01:49:12 -0500
X-QQ-mid: bizesmtp64t1672123730thbmf8sy
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 27 Dec 2022 14:48:49 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
X-QQ-FEAT: QityeSR92A2um1S4Mab87ad/VsX4JK425Fjq+3d64L7JKihVjgle2NjMUqakc
 +zskger8P/Caszaf1QK6gxckdI6k0JhYqoPSkGwFGcwRMsHF36jY7tkv4aVeCnArcKQsHBJ
 xfL5DABbMp4RxzhIwGZHNV6tR5iOT/TZH7Nb62HYpMq4fcCMlVYi0krjR01Q1rEyupKqamf
 dLJTy/VSyjL5hLV700+3M8fg2cPk9sNAW6Z99TTHRnMVDXRosnkUmC4g4MtMnQ/tYfGFVhL
 75i2hJlD0jucndVBS9lgkDIp9oUgCV2hpXtN2dk/yyCOUGioLPWUoCO5Gy6TwZS+88gp9t7
 610DaT2fzZEYylLosB5svlxN1mjE7Hi/sW7qT88
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 12/12] hw/riscv: spike: Decouple create_fdt() dependency to
 ELF loading
Date: Tue, 27 Dec 2022 14:48:12 +0800
Message-Id: <20221227064812.1903326-13-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227064812.1903326-1-bmeng@tinylab.org>
References: <20221227064812.1903326-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 27 Dec 2022 06:49:14 -0000

At present create_fdt() calls htif_uses_elf_symbols() to determine
whether to insert a <reg> property for the HTIF. This unfortunately
creates a hidden dependency to riscv_load_{firmware,kernel} that
create_fdt() must be called after the ELF {firmware,kernel} image
has been loaded.

Decouple such dependency be adding a new parameter to create_fdt(),
whether custom HTIF base address is used. The flag will be set if
non ELF {firmware,kernel} image is given by user.

Signed-off-by: Bin Meng <bmeng@tinylab.org>

---

 include/hw/char/riscv_htif.h |  5 +---
 hw/char/riscv_htif.c         | 17 +++++-------
 hw/riscv/spike.c             | 54 ++++++++++++++++++++++++++++++------
 3 files changed, 53 insertions(+), 23 deletions(-)

diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index 9e8ebbe017..5958c5b986 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -44,11 +44,8 @@ typedef struct HTIFState {
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
     uint64_t st_size);
 
-/* Check if HTIF uses ELF symbols */
-bool htif_uses_elf_symbols(void);
-
 /* legacy pre qom */
 HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
-                        uint64_t nonelf_base);
+                        uint64_t nonelf_base, bool custom_base);
 
 #endif
diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 1477fc0090..098de50e35 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -52,20 +52,17 @@
 #define PK_SYS_WRITE            64
 
 static uint64_t fromhost_addr, tohost_addr;
-static int address_symbol_set;
 
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
                           uint64_t st_size)
 {
     if (strcmp("fromhost", st_name) == 0) {
-        address_symbol_set |= 1;
         fromhost_addr = st_value;
         if (st_size != 8) {
             error_report("HTIF fromhost must be 8 bytes");
             exit(1);
         }
     } else if (strcmp("tohost", st_name) == 0) {
-        address_symbol_set |= 2;
         tohost_addr = st_value;
         if (st_size != 8) {
             error_report("HTIF tohost must be 8 bytes");
@@ -275,19 +272,19 @@ static const MemoryRegionOps htif_mm_ops = {
     .write = htif_mm_write,
 };
 
-bool htif_uses_elf_symbols(void)
-{
-    return (address_symbol_set == 3) ? true : false;
-}
-
 HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
-                        uint64_t nonelf_base)
+                        uint64_t nonelf_base, bool custom_base)
 {
     uint64_t base, size, tohost_offset, fromhost_offset;
 
-    if (!htif_uses_elf_symbols()) {
+    if (custom_base) {
         fromhost_addr = nonelf_base;
         tohost_addr = nonelf_base + 8;
+    } else {
+        if (!fromhost_addr || !tohost_addr) {
+            error_report("Invalid HTIF fromhost or tohost address");
+            exit(1);
+        }
     }
 
     base = MIN(tohost_addr, fromhost_addr);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 810a18f283..90f9e581e4 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -50,7 +50,8 @@ static const MemMapEntry spike_memmap[] = {
 };
 
 static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
+                       uint64_t mem_size, const char *cmdline,
+                       bool is_32_bit, bool htif_custom_base)
 {
     void *fdt;
     uint64_t addr, size;
@@ -78,7 +79,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/htif");
     qemu_fdt_setprop_string(fdt, "/htif", "compatible", "ucb,htif0");
-    if (!htif_uses_elf_symbols()) {
+    if (htif_custom_base) {
         qemu_fdt_setprop_cells(fdt, "/htif", "reg",
             0x0, memmap[SPIKE_HTIF].base, 0x0, memmap[SPIKE_HTIF].size);
     }
@@ -184,6 +185,21 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     }
 }
 
+static bool spike_test_elf_image(char *filename)
+{
+    Error *err = NULL;
+
+    if (filename) {
+        load_elf_hdr(filename, NULL, NULL, &err);
+        if (err) {
+            error_free(err);
+            return false;
+        }
+    }
+
+    return true;
+}
+
 static void spike_board_init(MachineState *machine)
 {
     const MemMapEntry *memmap = spike_memmap;
@@ -191,11 +207,12 @@ static void spike_board_init(MachineState *machine)
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     target_ulong firmware_end_addr, kernel_start_addr;
-    const char *firmware_name;
+    char *firmware_name;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
     char *soc_name;
     int i, base_hartid, hart_count;
+    bool htif_custom_base;
 
     /* Check socket count limit */
     if (SPIKE_SOCKETS_MAX < riscv_socket_count(machine)) {
@@ -257,10 +274,28 @@ static void spike_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
                                 mask_rom);
 
-    firmware_name = riscv_default_firmware_name(&s->soc[0]);
-    firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
-                                                     memmap[SPIKE_DRAM].base,
-                                                     htif_symbol_callback);
+    /* Find firmware */
+    firmware_name = riscv_find_firmware(machine->firmware,
+                        riscv_default_firmware_name(&s->soc[0]));
+
+    /*
+     * Test the given firmware or kernel file to see if it is an ELF image.
+     * If it is an ELF, we assume it contains the symbols required for
+     * the HTIF console, otherwise we fall back to use the custom base
+     * passed from device tree for the HTIF console.
+     */
+    htif_custom_base = !spike_test_elf_image(firmware_name);
+    if (!htif_custom_base) {
+        htif_custom_base = !spike_test_elf_image(machine->kernel_filename);
+    }
+
+    /* Load firmware */
+    if (firmware_name) {
+        firmware_end_addr = riscv_load_firmware(firmware_name,
+                                                memmap[SPIKE_DRAM].base,
+                                                htif_symbol_callback);
+        g_free(firmware_name);
+    }
 
     /* Load kernel */
     if (machine->kernel_filename) {
@@ -280,7 +315,7 @@ static void spike_board_init(MachineState *machine)
 
     /* Create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
+               riscv_is_32bit(&s->soc[0]), htif_custom_base);
 
     /* Load initrd */
     if (machine->kernel_filename && machine->initrd_filename) {
@@ -308,7 +343,8 @@ static void spike_board_init(MachineState *machine)
                               fdt_load_addr);
 
     /* initialize HTIF using symbols found in load_kernel */
-    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base);
+    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base,
+                 htif_custom_base);
 }
 
 static void spike_machine_instance_init(Object *obj)
-- 
2.34.1


