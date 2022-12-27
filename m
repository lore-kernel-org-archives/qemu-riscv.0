Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pA3lq-0006LY-Rf
	for mharc-qemu-riscv@gnu.org; Tue, 27 Dec 2022 01:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pA3ln-0006JV-46; Tue, 27 Dec 2022 01:49:03 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pA3lk-0006lP-4A; Tue, 27 Dec 2022 01:49:02 -0500
X-QQ-mid: bizesmtp64t1672123724tizfdk7x
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 27 Dec 2022 14:48:43 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
X-QQ-FEAT: MXlqd2LDbCLtNq8MaXTNl3hV2L0BICu1Y80D/kmr2t9v4cqPfR3vRhE3AJTJ9
 OH6YUSJs1Kk8nkaD3t3aUXM3gDsxCre0ry9VdO9wy2EZXW5o7XWtLAkb8/72HorwXyuVmN3
 4EOvH1PJMNYVQ/JbrU/JAWKjzqFLAnAaa0EpjFsLltOJ9cIkN+A3ExSTIgvj3SrzJKIL2tb
 ijHIv5XaADGaldTXan2gN6rASbKy2N0g0SThPxbIF7H3UdbCF3B/fPcxKk+D+gTdn1Qufhn
 lRqY8RJRw5Lg7tv3uYx9A/oOreqPDFLpi/iJWbhzk4F28vIOs71WeYnepym4N4Km2XlinvD
 7v/UlU2jqfHF/qgbc7dAUPiCkk+BcmM75rBdyiN7OHQf1ZnkVc=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Subject: [PATCH 10/12] hw/riscv/boot.c: introduce riscv_default_firmware_name()
Date: Tue, 27 Dec 2022 14:48:10 +0800
Message-Id: <20221227064812.1903326-11-bmeng@tinylab.org>
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
X-List-Received-Date: Tue, 27 Dec 2022 06:49:04 -0000

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Some boards are duplicating the 'riscv_find_and_load_firmware' call
because the 32 and 64 bits images have different names. Create
a function to handle this detail instead of hardcoding it in the boards.

Ideally we would bake this logic inside riscv_find_and_load_firmware(),
or even create a riscv_load_default_firmware(), but at this moment we
cannot infer whether the machine is running 32 or 64 bits without
accessing RISCVHartArrayState, which in turn can't be accessed via the
common code from boot.c. In the end we would exchange 'firmware_name'
for a flag with riscv_is_32bit(), which isn't much better than what we
already have today.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Message-Id: <20221221182300.307900-6-dbarboza@ventanamicro.com>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 include/hw/riscv/boot.h |  1 +
 hw/riscv/boot.c         |  9 +++++++++
 hw/riscv/sifive_u.c     | 11 ++++-------
 hw/riscv/spike.c        | 14 +++++---------
 hw/riscv/virt.c         | 10 +++-------
 5 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index c03e4e74c5..60cf320c88 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -37,6 +37,7 @@ target_ulong riscv_find_and_load_firmware(MachineState *machine,
                                           const char *default_machine_firmware,
                                           hwaddr firmware_load_addr,
                                           symbol_fn_t sym_cb);
+const char *riscv_default_firmware_name(RISCVHartArrayState *harts);
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 7361d5c0d8..e1a544b1d9 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -75,6 +75,15 @@ target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
     }
 }
 
+const char *riscv_default_firmware_name(RISCVHartArrayState *harts)
+{
+    if (riscv_is_32bit(harts)) {
+        return RISCV32_BIOS_BIN;
+    }
+
+    return RISCV64_BIOS_BIN;
+}
+
 static char *riscv_find_firmware(const char *firmware_filename)
 {
     char *filename;
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b139824aab..662ddf366d 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -532,6 +532,7 @@ static void sifive_u_machine_init(MachineState *machine)
     MemoryRegion *flash0 = g_new(MemoryRegion, 1);
     target_ulong start_addr = memmap[SIFIVE_U_DEV_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
+    const char *firmware_name;
     uint32_t start_addr_hi32 = 0x00000000;
     int i;
     uint32_t fdt_load_addr;
@@ -594,13 +595,9 @@ static void sifive_u_machine_init(MachineState *machine)
         break;
     }
 
-    if (riscv_is_32bit(&s->soc.u_cpus)) {
-        firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV32_BIOS_BIN, start_addr, NULL);
-    } else {
-        firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV64_BIOS_BIN, start_addr, NULL);
-    }
+    firmware_name = riscv_default_firmware_name(&s->soc.u_cpus);
+    firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
+                                                     start_addr, NULL);
 
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index ab0a945f8b..810a18f283 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -191,6 +191,7 @@ static void spike_board_init(MachineState *machine)
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     target_ulong firmware_end_addr, kernel_start_addr;
+    const char *firmware_name;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
     char *soc_name;
@@ -256,15 +257,10 @@ static void spike_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
                                 mask_rom);
 
-    if (riscv_is_32bit(&s->soc[0])) {
-        firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV32_BIOS_BIN, memmap[SPIKE_DRAM].base,
-                                    htif_symbol_callback);
-    } else {
-        firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV64_BIOS_BIN, memmap[SPIKE_DRAM].base,
-                                    htif_symbol_callback);
-    }
+    firmware_name = riscv_default_firmware_name(&s->soc[0]);
+    firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
+                                                     memmap[SPIKE_DRAM].base,
+                                                     htif_symbol_callback);
 
     /* Load kernel */
     if (machine->kernel_filename) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b4..d8cf6385b5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1240,6 +1240,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
     MachineState *machine = MACHINE(s);
     target_ulong start_addr = memmap[VIRT_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
+    const char *firmware_name = riscv_default_firmware_name(&s->soc[0]);
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
 
@@ -1259,13 +1260,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
         }
     }
 
-    if (riscv_is_32bit(&s->soc[0])) {
-        firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV32_BIOS_BIN, start_addr, NULL);
-    } else {
-        firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV64_BIOS_BIN, start_addr, NULL);
-    }
+    firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
+                                                     start_addr, NULL);
 
     /*
      * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
-- 
2.34.1


