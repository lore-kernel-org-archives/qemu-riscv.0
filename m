Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbRq-0005fx-W0
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRn-0005cA-Qr; Wed, 16 Dec 2020 13:22:47 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:19121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRm-0000Lf-1C; Wed, 16 Dec 2020 13:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608142965; x=1639678965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jgAaj3YJCkNIm/yFLjdSK9i+A93xcJKp0ArRJQcFbUo=;
 b=Hjn3a0xqOTCQAWR5DQ345mEhzLR9f9PV2t7CKavk3H7CAwOEskQcSB+8
 0Bj9Pj2T0vzcQhiEn7V5FafAstHQqrn04cE4aDRIJdmAUrHfD/et6gvs9
 LQBxuzfcf/64t/vqczt9jaZZPEShlJMRvsL8ldSqa0I4uyu4tAuXnAd8o
 3KeIBrvhVwP3dy31UNCy7qwjWmCjvQZGFbikegxvxWVMVUHOIuYFag+R2
 21GtqTcyNi59Um4t3pVXDEl1egxDtXW+YVKEqeUpzVe1n9Exs6xVN5N/P
 is3QSGwPbkef5RzL/dltsH7VxrQDNQnCCNAp9u7bzFBVfsLgb1/bM9kyT A==;
IronPort-SDR: BvaBjwpFbrlEIS7vhz0EQRotX7dOTqjvQIpuFH7xmacMeUEwajRXK22WzH1OY1JFiMEDJbO3nb
 ql2OrIg4NYhbC3M/WGSQaaCv/2Cb9+Vd+TeChvwZzqdZPO9aUtfxH4ZV8lYgLKZ/jb+tHrPEC8
 rQUPqa/8WMbB8nbzzaJdSyUMSCh+QmHFqdD2L8KN4O/NtoCz8aUh0a9celo0YyLOSevQyS5zlK
 ypYk7sl0N+J+LBeOuwA/nSMULVOD1mZZHzfPhjQXNkVU9wyM+JgBBM2WPR6ecoHfBWEpSHlpkL
 xYU=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="159755918"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:22:43 +0800
IronPort-SDR: pZeCCJDHlyd8LEf4sJFZMcsHhATf3q1qYf8cg0LCD8T6EZJZ/g6tEy+C+zIl0EJiHt3t6Xwa8O
 e08ld7tjAu7+8jCgFHNOw/ckxEyn5AgGKnRSRFC30IVVv/edlGPCF/E3qOhjAthQknYjxZGmgG
 1eFNGP1NJvG761abBPcWYEmLxHI0kZMqDRfbUseZQF0PlUzMyMMZUYg6egkQtALPN+fAUBp0HH
 J4J2IjD+OzOgRQMgGEqS4nYWO8WC1PK4eeRbq6BeE+BYVFz63XVAJnLpfY5pZtEHPvQk2UNcxd
 lGzXoRYRCWMxfNdjKQBD/rcN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:06:18 -0800
IronPort-SDR: mkaJRPvUw0nXYFTaqyTtI6XDSgzrcpI+6LUxv+kT8FvBRONxqE06JTU8WGxOdeqYtCDg9oEFGO
 PNOqRaNzwAYE/RPHxfqpZvvLTv2jccRmoGZYQl+Fiy6Vekq2R5c/vkfoDM5cA3yVG2qJ2OdLTb
 Up7Xxmtnh0FBk32pk9LEpzPbCr/RNEzc5k4I5ntgH9X95UY7iGnvv4nPw6jSjuNnwqaOtlwF+6
 eGj1qh1vxU3ljANyYb2DeWgKyZC6viPlrjVs8NJ5y4BzMg6KURV6tTuqlynm7ofVAMrKj99qDl
 6/I=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Dec 2020 10:22:43 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 07/16] hw/riscv: spike: Remove compile time XLEN checks
Date: Wed, 16 Dec 2020 10:22:43 -0800
Message-Id: <ac75037dd58061486de421a0fcd9ac8a92014607.1608142916.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608142916.git.alistair.francis@wdc.com>
References: <cover.1608142916.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=612374860=alistair.francis@wdc.com;
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
X-List-Received-Date: Wed, 16 Dec 2020 18:22:48 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
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


