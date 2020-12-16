Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbRo-0005dD-Bz
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRl-0005Z5-Q1; Wed, 16 Dec 2020 13:22:45 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:16660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRi-0000LR-U5; Wed, 16 Dec 2020 13:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608142962; x=1639678962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/nC7PAhAJaVY2Xe/jmmOCERLaZAjZkzXoGUEMzkzfig=;
 b=ieuKv968s2r1oiNfxvFgEJRIQgviOoIDMbYYopCao1gUESimEEYFnsVx
 PLCZRul7rWY2vxKsLkqgHR+wHUs1PG8kvODbBO2lXPqpbwbzHNrQ7Gq1w
 srYzCe2BgbAxMgBjoxKhoNhJwdwSEgFNPSQPxtRJvvjUqRGnkwiWJ2bN2
 JC3Qf41guTg9/8+BKr6KOPRJ4LdZZb4o19qw7ZX1nuzY8cftNOewMeV6D
 ekV/fINXufSrKoONWg340+uyDsL1p19paqQbqiIsgK8Ubp4og3l0L2MG+
 IE5LeJ4P6crsgrPIqYJei3BeYkWbs3McTQ1neOPIXWYv1V5YSBGkqVT/3 Q==;
IronPort-SDR: j7dMHFgpdUB/n+tDQN8RF8j2YTwbwDIaENEAzm8G2az+SWZXE09w6z/s9QNl7e+wRA9+w4qgx6
 RvzHCsgmvegzrbReOa4aXvo2kH3JFHEzQjv7SgDj3W77ZymrkVkayY53QCD26lVZRiW7sCqoXl
 iYLcP5NMG/huA5ip6aGuv1gxBXK49ZZ+3BS9QYNzccCjI/ak2g8N3rJSuRfEQOkqX5zVFxOW+5
 CP3JflwnUVZWx0GZMUma7b9cRQ9GC9wikOEk1HaJZ4RYdXs/+iVdicz4hrQGit2rs6phesQXmY
 uVk=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="265507617"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:22:40 +0800
IronPort-SDR: 80fO/ji/LVFoDcJKNQPRTefS5U6yGXo4TYXYOqkhAjwKfxUhx8gtfrWMbSX3JyKTvmslIegxGU
 BxfOW6RXoz/sW60Wr+Ajv6/a/Rw2PzNtx6pvr0WoFAdSSH32tZJfsfmLg6n68wQLOrlr0PtaYu
 iVhT2fvKchh1Z2/T/uGUTMSq+W0u4zN/ZOG0/an74y6TGN6ywyYb13PaUn+aPAnsnMlkx3qafm
 krzwaZIPfvTLckSkTnPwGnO1RT5Izg4n+ujIT6zn2TOL52rAtTFeJNxAIkpGsfpGy1/JYmGbMa
 nOcdxjornruORy5snv9FDmmw
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:07:58 -0800
IronPort-SDR: LghPFi81KCRxv/kA71JRwHzuybnuq0/AsOvTE+d+c9DNTfXXZ/gBozsP7OoASqHfL8HJUfGcq0
 id5xp5E2od7QMpK2+emQ2GSbZL0hbV5r5B5eyTOopukee1J5v9yzXcA1TNPPrlp4A6x0YUgNBU
 eE4dGJcdDj4ZnGNrqg8i/Q7+6oBMzSs2CJalo/2AMczRFSOG2pxiL+SMcjHB4JYlbiJvRLHm1h
 QSCRlLZ9Pajqz7ezrpfdHSw6bTvB/RCqF40oS7G7+PpyCXQlyv3RZ4ekgOu+q4sBBKo2VQBWRU
 eUs=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip01.wdc.com with ESMTP; 16 Dec 2020 10:22:41 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 06/16] hw/riscv: virt: Remove compile time XLEN checks
Date: Wed, 16 Dec 2020 10:22:40 -0800
Message-Id: <d7ca1aca672515e6a4aa0d41716238b055f3f25c.1608142916.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Wed, 16 Dec 2020 18:22:46 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
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


