Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmluL-00084U-Og
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluH-00080i-S6; Tue, 08 Dec 2020 17:56:29 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:57377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluF-0004Cc-I4; Tue, 08 Dec 2020 17:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468187; x=1639004187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rhxC5s7FEiT7qUcYdHgm5fREwabA4h1JV+t2QXCVcM4=;
 b=CfpOsouAtsbsz5ypq3YU+pTDsJ5eig+7f3YiINjbsId/jVdyuRzcJQ9T
 hFWRKdei2VNPKGIqIF/dVmT/IkUc1Np8UWcL47NP31EIRlWY2Dldp0qyK
 GtO3/UmZAjrh70koaE+9owHImRbpHqTcJlpgCqU0mBQmUMS/obwBIiaxv
 lLMA5eYuoA/2ybwSxMS1rJCY/PP0ftmK6HefcCljvDEuDB3sSpi5+MaRh
 /xKoKLzZSGGglrIMlTliU6aW/CrIoH6Ou9JdaOMQpJEFDLjz060ML8EyR
 dgukswv5UUBtbT/pJ7brUTgET/Ja9uKAb4FZnbjwbLXcw3HgyipRhvsXI Q==;
IronPort-SDR: tnKFnyJqLKKQKexQLi55C6lNe1PSjAhnekW1fO2XQpQCkBQauHL5GAMSNXekPb2Ae9M4g5ps5m
 lkG1TO+znC7ekuUiH+YCp/ipLvhTgc/d+96VkiMG2wqYIEDG2VM518HDLfgOHI4fCr6Yf6cLjy
 fDzX1r6UJxu3EfA/jfTLXtGcI97+yC5pLOhYnHeUw06YBRWOv/vOjQit2ciRtwq10kqV9eDUbt
 GiuhmPp3lt8HW8FFNFkukkL1VKhhudV62VHahkMauyI6OcDlXWXuTZrOcrlFtpjPuB0B8xH19x
 le4=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="159184110"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:25 +0800
IronPort-SDR: yGybmHsqaRop+y4gPYePKvrNmQhTXXWNbTdNJIQoKlqUWQF1qOyS9Ods5boK1YwOz/oFSjsJMa
 LFKhEpr7dVsCHVmbGBZMtZBkjLe8lLS/o=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:40:26 -0800
IronPort-SDR: oXRlFldmIAYujH7md7IQYhpe6Pify62sWaHNVnQQdF0s3QsLbmx6XmALS+iNr25Y6T5WyAIWRW
 Ov1frgK19NxA==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Dec 2020 14:56:25 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 06/15] hw/riscv: virt: Remove compile time XLEN checks
Date: Tue,  8 Dec 2020 14:56:25 -0800
Message-Id: <41d9d8c526f7153557e49bbe8e0f9a6845310ae8.1607467819.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607467819.git.alistair.francis@wdc.com>
References: <cover.1607467819.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=6040d5def=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 08 Dec 2020 22:56:30 -0000

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


