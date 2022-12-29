Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAqCm-0002ih-AN
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 05:32:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pAqCf-0002ht-AY; Thu, 29 Dec 2022 05:32:02 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pAqCc-0002zY-10; Thu, 29 Dec 2022 05:32:00 -0500
X-QQ-mid: bizesmtp68t1672309885tkagd37c
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 29 Dec 2022 18:31:23 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
X-QQ-FEAT: Q4gfBD3K7t/l+oESJeR1EnVCLOIPbWW3sdpVOf7dYbNihRHf3rD2CfWvtaprd
 fIE3DNf2o/WFM0e3nUBF8EEe1pkB9RFbJv7NEl0XSyFhs0aOfFQtj0/yA/5OmeQ4dxpiTbn
 apKC6wx2z3dqrXMQaN7i0BY3kWxZhXC6aO5LLB/RVu1w1IhwzJEUd0+t3iAoNiQLoyhwJqB
 RZ0Uo0dKIxUhJr/4Yp6aISZwO78mmiC+k+wM1/lmYRCsoiKGz73JMkF/dJOmiGEThbd53un
 UVafl11B8Fua9aagM74cLo3HqHoq9aiFto732dVKxWzuJd6SQkyklnBE326vBbt+EhphO09
 QqUaBHBBblr0M6P8Dsv3sm5DJDs8JccR7UKpuJp9x1Ng+Pw6yE=
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
Subject: [PATCH v2 12/12] hw/riscv: spike: Decouple create_fdt() dependency to
 ELF loading
Date: Thu, 29 Dec 2022 18:31:23 +0800
Message-Id: <20221229091828.1945072-13-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229091828.1945072-1-bmeng@tinylab.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
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
X-List-Received-Date: Thu, 29 Dec 2022 10:32:04 -0000

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

Changes in v2:
- initialize firmware_end_addr to memmap[SPIKE_DRAM].base
- rework the htif_custom_base detection logic

 include/hw/char/riscv_htif.h |  5 +--
 hw/char/riscv_htif.c         | 17 +++++-----
 hw/riscv/spike.c             | 61 ++++++++++++++++++++++++++++++------
 3 files changed, 59 insertions(+), 24 deletions(-)

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
index 810a18f283..dd5f912e3d 100644
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
@@ -184,18 +185,33 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     }
 }
 
+static bool spike_test_elf_image(char *filename)
+{
+    Error *err = NULL;
+
+    load_elf_hdr(filename, NULL, NULL, &err);
+    if (err) {
+        error_free(err);
+        return false;
+    } else {
+        return true;
+    }
+}
+
 static void spike_board_init(MachineState *machine)
 {
     const MemMapEntry *memmap = spike_memmap;
     SpikeState *s = SPIKE_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
-    target_ulong firmware_end_addr, kernel_start_addr;
-    const char *firmware_name;
+    target_ulong firmware_end_addr = memmap[SPIKE_DRAM].base;
+    target_ulong kernel_start_addr;
+    char *firmware_name;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
     char *soc_name;
     int i, base_hartid, hart_count;
+    bool htif_custom_base = false;
 
     /* Check socket count limit */
     if (SPIKE_SOCKETS_MAX < riscv_socket_count(machine)) {
@@ -257,10 +273,34 @@ static void spike_board_init(MachineState *machine)
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
+    if (!firmware_name && !machine->kernel_filename) {
+        htif_custom_base = true;
+    } else {
+        if (firmware_name) {
+            htif_custom_base = !spike_test_elf_image(firmware_name);
+        }
+        if (!htif_custom_base && machine->kernel_filename) {
+            htif_custom_base = !spike_test_elf_image(machine->kernel_filename);
+        }
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
@@ -280,7 +320,7 @@ static void spike_board_init(MachineState *machine)
 
     /* Create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
+               riscv_is_32bit(&s->soc[0]), htif_custom_base);
 
     /* Load initrd */
     if (machine->kernel_filename && machine->initrd_filename) {
@@ -308,7 +348,8 @@ static void spike_board_init(MachineState *machine)
                               fdt_load_addr);
 
     /* initialize HTIF using symbols found in load_kernel */
-    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base);
+    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base,
+                 htif_custom_base);
 }
 
 static void spike_machine_instance_init(Object *obj)
-- 
2.34.1


