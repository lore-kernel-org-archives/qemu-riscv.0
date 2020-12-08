Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmluU-0008D0-LO
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluL-000843-Jt; Tue, 08 Dec 2020 17:56:33 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:31149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluI-0004Ed-5y; Tue, 08 Dec 2020 17:56:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468190; x=1639004190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eANmSz4V+BEHTBhleAxmLkZ/PJSqoSJqjipx+t7A4H8=;
 b=aAk4wr2RPdZrUIDzTi7c/WRmZOnFTxtjvsdGyjjHuulubs2lcGU5H9cB
 Fvjx7AGbxy4Ee6EwZ4k8HMwhJ5+pfBNbYcHvjsNIKRJw8FCEVssPPC0q7
 5r49xPYsHCZ9kZyFCluw9odbU4D1cII1bxk9H66bq42tAsVvDz9qvDmiC
 KD+xMDMjz/4VcumlYgCKeHpKrmGKtxdMpr9LryIeRqW3NNd2uMV1S0NR0
 C1IPC7ab9Drg5KQ78+3KqDLBijzGJQ8pHSLFYgp7vu4X9wwwzEu32r78G
 bI3pbjPq6rscqfxjvLSQYGFKk+9xk6ewWIlBiYy/vOdIrcmNxd+Sf7nVT w==;
IronPort-SDR: VRNspE4aXC8KxX21Odx/S+CNbHKYZh8AG6OGXCx2Lum8akrxcA4P47uFTnFutr2JkvsM/VQjLI
 Q0SFvKshL6oGl7k7w3v3Ff5k3pBxEGOqDdc1vsMGZb1u2iAhPTsrlyeVa6QpP7a5qnj4ghjkAq
 64ECnCtdULLYFcHPd4q3potIjzzgDzX7Ta/lw88pGZpcQOFqiwmIvx27aa4yVDl2vNaBQ+7AEf
 di/kpxh1C89g4q8FVrYZ8KNr5/inWPFnVWKHP0u2lzd3G2UKy5NNnYcf3XvgMR4WFxN39PEfec
 OMM=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="154713812"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:28 +0800
IronPort-SDR: UxanTJ9TAQt9KE8/i1s2/KwIZJOqt0VsQ0jVntokCpeENIZQNLG+7XjI5IxIuI3phFxn689uv0
 c4YiYJWX6PiqPu+rl56JnnxD6CxbZPilI=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:41:55 -0800
IronPort-SDR: hK28RSEyV4ehUYypT8WlXIJByyIIdXcW516EV/XzYtbWGNYSbHkj1lnG96froEy9HYj5hLmMXF
 ogDPJY/L/WNA==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 14:56:29 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 07/15] hw/riscv: spike: Remove compile time XLEN checks
Date: Tue,  8 Dec 2020 14:56:28 -0800
Message-Id: <8a7bcb8cb5e5ec1e90544b86a2ec280fdd2fec37.1607467819.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607467819.git.alistair.francis@wdc.com>
References: <cover.1607467819.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=6040d5def=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Tue, 08 Dec 2020 22:56:35 -0000

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


