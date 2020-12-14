Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kouY1-0001FC-Hs
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXz-0001BD-PZ; Mon, 14 Dec 2020 15:34:19 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:42382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXw-0007rg-Qj; Mon, 14 Dec 2020 15:34:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607978057; x=1639514057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eANmSz4V+BEHTBhleAxmLkZ/PJSqoSJqjipx+t7A4H8=;
 b=rDzH3p3zD2i15bZV+/MaPV1YzXh5Me2PgmppdrMwrFL/Ms2S4S9z53MT
 u41xHr3JjcU2oNh45GxSJPnmcv/bZ5ziMkPNTsggIdJS4VouLJkRY28XA
 YKt265NefAQ2s/674mexE4bf4yl+fiHKY/2hQ8fGpHAR8741NUqiZO16W
 PHJOwznmn9CeiCTgwXVzfxArmzAJzf2DUqgFfJG+jqkQXbejyv35+tZwk
 utRIojVBisAgs250N0tGIbyDxeYNag3wP0tFB73vdsjAl9fT8cNo8eT6R
 1EHO0yhe0wehPhtiN/dm+xxzIGTTk1AxRZw+PaRDESTkk8pJO0FZNnrAY Q==;
IronPort-SDR: ilnUOKX2hw/GWyqcC/WJ/Fb70kp5c/uamtJuW2jDnBxhtLNl3P+DO/N8KyXulbLwweprfdRO7x
 HBj9gvoPb2YUzFKHYdz7ZoYLMiiWCZzs7ygyc77oU53xsiWu6JJ5TJQGfdW7NrYRYC8mPkjvDI
 Ha/me7ZsmjYCOkqBVdivUi4m/Z4yxn0gvIX1vWqoKUiAWgq07ehSDPrVX3rSodQGOJMttN96CR
 d/6rBmDUtYO43AqFvg4L9Z2M6lsjXC02XTePWpk/TArtHUDGPcvrQRW5n7vWaVsWFaiGMtQUfQ
 Bpk=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="156338144"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 04:34:16 +0800
IronPort-SDR: Covx25gJg5QT60vwRuPo860RhHUnwN029dDpYB9tvh8Y0TjJUjdxndgavjxAuLiRWKzg+udk03
 eNUmx/hIyA87hr+JmmtYFbkEdYd6JI8B4mgkQy3rcAQ1Bcm2DhJKyxzRxrg+cgJgoyXmWPZoay
 ZSEOs4DZBPkoO5BKpa/SnlYarNZJJ01lpWqfiM07b4E+d4YgwLbJRzEyp+Db1WqAkQH9501oHQ
 +7OK3H+v1vmbsxMjtYWulef7OEHzx4QPCZ8H0R/EPtrP0ohy+UzyiHHkRTchorwhKMiTu9TkRT
 jRNsx7FH7UrKOUpwFOW346xm
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 12:19:35 -0800
IronPort-SDR: VZXYa1FHQmmFuXrfRNr5EGp+XPC1ACQyjgf7dNCvKHMWVzL9QO5Btnlg+04ZXnJhjUUxfTZSFE
 yfMO2/YNXWPk3fmWyu1e5lK5I1ZmwjcYFS8ZZ1nhU4amD1qBMA0BUe+rrm5VTdV/WGe7XjN7iZ
 Cyyac2z7FO47g3h2Tj+S/UctCpl+S9I45iZJDXs4rrYx4+Fdfsb/smb4uREQfXw8Nbu181OEK7
 LmAnXeoQUfdA2CX94AbjWpAbgMvPDOJ8wdOvmQo07FQFaL5FOsuWHhrIDSCf7P/Tm9XOONJSR/
 WpA=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.52])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Dec 2020 12:34:16 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 07/15] hw/riscv: spike: Remove compile time XLEN checks
Date: Mon, 14 Dec 2020 12:34:15 -0800
Message-Id: <cad9da10c3462df78a6fcb8aab19639e6fc8d0f2.1607967113.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607967113.git.alistair.francis@wdc.com>
References: <cover.1607967113.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=61015ee87=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 14 Dec 2020 20:34:20 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
---
 hw/riscv/spike.c | 45 ++++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 875f371f0f..3e47e4579d 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -43,17 +43,6 @@
 #include "sysemu/qtest.h"
 #include "sysemu/sysemu.h"
 
-/*
- * Not like other RISC-V machines that use plain binary bios images,
- * keeping ELF files here was intentional because BIN files don't work
- * for the Spike machine as HTIF emulation depends on ELF parsing.
- */
-#if defined(TARGET_RISCV32)
-# define BIOS_FILENAME "opensbi-riscv32-generic-fw_dynamic.elf"
-#else
-# define BIOS_FILENAME "opensbi-riscv64-generic-fw_dynamic.elf"
-#endif
-
 static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
@@ -64,7 +53,7 @@ static const struct MemmapEntry {
 };
 
 static void create_fdt(SpikeState *s, const struct MemmapEntry *memmap,
-    uint64_t mem_size, const char *cmdline)
+                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     void *fdt;
     uint64_t addr, size;
@@ -115,11 +104,11 @@ static void create_fdt(SpikeState *s, const struct MemmapEntry *memmap,
             cpu_name = g_strdup_printf("/cpus/cpu@%d",
                 s->soc[socket].hartid_base + cpu);
             qemu_fdt_add_subnode(fdt, cpu_name);
-#if defined(TARGET_RISCV32)
-            qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv32");
-#else
-            qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv48");
-#endif
+            if (is_32_bit) {
+                qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv32");
+            } else {
+                qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv48");
+            }
             name = riscv_isa_string(&s->soc[socket].harts[cpu]);
             qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", name);
             g_free(name);
@@ -254,7 +243,8 @@ static void spike_board_init(MachineState *machine)
         main_mem);
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32_bit(machine));
 
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv.spike.mrom",
@@ -262,9 +252,22 @@ static void spike_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
                                 mask_rom);
 
-    firmware_end_addr = riscv_find_and_load_firmware(machine, BIOS_FILENAME,
-                                                     memmap[SPIKE_DRAM].base,
-                                                     htif_symbol_callback);
+    /*
+     * Not like other RISC-V machines that use plain binary bios images,
+     * keeping ELF files here was intentional because BIN files don't work
+     * for the Spike machine as HTIF emulation depends on ELF parsing.
+     */
+    if (riscv_is_32_bit(machine)) {
+        firmware_end_addr = riscv_find_and_load_firmware(machine,
+                                    "opensbi-riscv32-generic-fw_dynamic.elf",
+                                    memmap[SPIKE_DRAM].base,
+                                    htif_symbol_callback);
+    } else {
+        firmware_end_addr = riscv_find_and_load_firmware(machine,
+                                    "opensbi-riscv64-generic-fw_dynamic.elf",
+                                    memmap[SPIKE_DRAM].base,
+                                    htif_symbol_callback);
+    }
 
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(machine,
-- 
2.29.2


