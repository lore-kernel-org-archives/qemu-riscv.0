Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kouXy-00019g-BU
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXw-00015G-Jn; Mon, 14 Dec 2020 15:34:16 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:42393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXu-0007tb-9i; Mon, 14 Dec 2020 15:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607978054; x=1639514054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rhxC5s7FEiT7qUcYdHgm5fREwabA4h1JV+t2QXCVcM4=;
 b=lje0RVUrJ+USIR7mi5QjaJYgh267x2EEVrSpsDKdrvbW7Jdp71GrDMGH
 pNSj+S1q8xkskMr7TiOAI95jTiLKgoogwDoqDnGjclbK94jrDqxHhwEE/
 /aiRTB+3zBenc5oUF/HGJ314yb8HKOnbUQtTQqXYPHoA9mEGXz8/xKcFC
 m3s5RvcqTfWXH4IQK9dRYlryyBUDyLtxmbf+eUx2WekKM2fa7FU/Q1BSH
 Vifotmydd8ZRQB70Dmm175wTWwmTapa2fygF9lIR02+Mb89FNapMAlEGg
 iYcMDzXAc6j0ZpK4dCdyldFISnnr+7AIK6To7vIws3CXiCiCj4GHHE5do w==;
IronPort-SDR: J54hBeHEkbJ1xwtUrObdfL7wqM/b9SHf4wpn5hsqDLjKqkMHRoFBtka/Uw0UzVjep2ux0xWWHJ
 54x8jK7QKt+iFrP7uDru6lA0sdUQu1n3XeilxKqO7tO50VA5pvkfmOw4Giwkqg3sDw0HOvF9Dp
 ayDDlU8RGZmvzp7kP89NVzuJ3b0mj2PIKynJaPd7A7U2IhaCF33BP/J6ac4qodRap4QZe5D2wy
 H/1iFsZq7asUOSpSadx7rSSiNylaiOt7BpR5GbbTY6JAXnZyIhY0JJ2BRLbyYk/B86oy5CvvYS
 WCY=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="156338135"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 04:34:13 +0800
IronPort-SDR: u3hQZYh5u2dgFLuq959SfXumskBWJdHNMyopsmpH6X+lyvsSTpZ8T+Iaw0i1ZBuyH8/XTy+VQd
 Dn5JUpnNJ+z4FA6VB3pwQp+ZipKSABlYAtaBuy2+AIZ7SHzG69Jx4YoUzNzFkHgPn1bBL+ZB0U
 +W8quPDqCX0bIpQViLxLJuD0FriblOOf2TVb96aBJ98s1B56yAQKdzQ8hBwX2TGeTiVsSs6jOV
 EYtzi1/rsqab8g4wYvm8jqUnrTwW2EmPsNCTRusS1Ch8Z0wTyou5jhYvDephhZkk1Pc+tStVh0
 77FGleY5T7aQCTDWnWl0GA3p
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 12:19:32 -0800
IronPort-SDR: dUXolgSAUMl2wKluNrueTRtaNYW39jdjq/vDkhPCzPdgtJhKlYj3WRLbq9JLN+kX3YFDVBV4SE
 TR8fxB1AjQyiFP7xYuHsrkzvYvpopjA709jB9ZKdE9NXjbJ+Rq1EW80yKQzqhvaA70UNm66wwL
 Dphdheajd76WdBsNTMk8YxT23NYdtR9ctjXZAZ0Dliea1CXu+reFvv7dKG3Dxj02fCgu/6oVG7
 Wl0h1J6hnjW+dBcGjlVicfyzVdG2bBqdBrcBrTxeYKTct5T/NiFjdoVbEEoK+GYxGg9XstAsFD
 AYY=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.52])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Dec 2020 12:34:13 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 06/15] hw/riscv: virt: Remove compile time XLEN checks
Date: Mon, 14 Dec 2020 12:34:12 -0800
Message-Id: <62ef0848f1a7e0ca59bacb86c2ca12306b56846b.1607967113.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Mon, 14 Dec 2020 20:34:17 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
---
 hw/riscv/virt.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index f8c5509f13..915e9ae216 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -43,12 +43,6 @@
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 
-#if defined(TARGET_RISCV32)
-# define BIOS_FILENAME "opensbi-riscv32-generic-fw_dynamic.bin"
-#else
-# define BIOS_FILENAME "opensbi-riscv64-generic-fw_dynamic.bin"
-#endif
-
 static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
@@ -177,7 +171,7 @@ static void create_pcie_irq_map(void *fdt, char *nodename,
 }
 
 static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
-    uint64_t mem_size, const char *cmdline)
+                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     void *fdt;
     int i, cpu, socket;
@@ -242,11 +236,11 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
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
@@ -608,7 +602,8 @@ static void virt_machine_init(MachineState *machine)
         main_mem);
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32_bit(machine));
 
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
@@ -616,8 +611,15 @@ static void virt_machine_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
                                 mask_rom);
 
-    firmware_end_addr = riscv_find_and_load_firmware(machine, BIOS_FILENAME,
-                                                     start_addr, NULL);
+    if (riscv_is_32_bit(machine)) {
+        firmware_end_addr = riscv_find_and_load_firmware(machine,
+                                    "opensbi-riscv32-generic-fw_dynamic.bin",
+                                    start_addr, NULL);
+    } else {
+        firmware_end_addr = riscv_find_and_load_firmware(machine,
+                                    "opensbi-riscv64-generic-fw_dynamic.bin",
+                                    start_addr, NULL);
+    }
 
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(machine,
-- 
2.29.2


