Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmluT-0008B3-Sk
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:56:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluN-00086G-FM; Tue, 08 Dec 2020 17:56:37 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:31153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluK-0004FJ-RL; Tue, 08 Dec 2020 17:56:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468192; x=1639004192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BD2w1JzPAhFnuG/0+v+zaFrsidkLC94J1KLJCbCeLEM=;
 b=G9CB6W6DO+jWeGVmqIPfdf5eeatBUr2HRN2PFSWIv8TZbSEX8DhmUS+D
 8Zw3a0+0NsKfD5hwW4Q30oTxA9tSxIPBkuJ388IUyDgEVxZSPA0MISOaz
 Qsii7dXjO/b0vNds5aVSRZfj9ANUNktPsovH2j6tUYCSTiehItXUJ7czN
 b/nycCE+SlF2z+A+k67MNc6DX+sY55pL98NYnnb9QanfYuDqhP0u6kDIK
 3664gvtNL1zzW0FqbrMz7QQRaTm4VU34KyRMVTqqJAxu42qpy27yoUpcR
 jtmwN6YO3U2buemuKqpuiIetY9l4jEEKkvf+KuC1EE0q9+7QR9Ja8Vt6F g==;
IronPort-SDR: Mk8mC3hLTAiS9o9Hai4oi8t2hc7GHXJMuRl4IX/VVDOdxXtrvTVxm5QGAbq4qqMg1fzPU+9iX8
 MdkKhGBsBFv4teDHhJNjXkIjcspV6MAkhqKsJ3muYo393ET9GRNO6WyV9wGRM1n2e5dTgBWuZs
 fi4AkZcZrFT3H9WcXgu5uE3PA4+LHxyY5BAFIfTGY1lOUm/zqJIPzAo1wdZQyXAauc2Mk9UrUw
 Ytmm3/j5svaE8VAUGKz3QZQlID7jFM1Q5V0HYbUJ1q21EcNUCX/1STvfQXnSPHniRc5X+Piq57
 lsY=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="154713817"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:31 +0800
IronPort-SDR: Wb/YQ2bvDCzHgwYYKbt2CJ3L4Wh7CEF+wTKVPqe+BEnWOnMf5tyuBVU6s+mWqyJMZWGq8YTgpB
 QqnvfRkLPjjvwG1X8AZ3OncwEulXe14Eo=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:41:58 -0800
IronPort-SDR: fLmzfHyr/bkjcg2p9HYRsb7jpd8Q3lXGf3nQ+eBmEolZzdkFhcEdzUGyse+qldKgFK166OSIOR
 jL1XjedHN4MA==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 14:56:31 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 08/15] hw/riscv: sifive_u: Remove compile time XLEN checks
Date: Tue,  8 Dec 2020 14:56:30 -0800
Message-Id: <6b07e125cf1eed82f78dc4723dd33d3cff18ac71.1607467819.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Tue, 08 Dec 2020 22:56:38 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 55 ++++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index d550befadb..7216329237 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -60,12 +60,6 @@
 
 #include <libfdt.h>
 
-#if defined(TARGET_RISCV32)
-# define BIOS_FILENAME "opensbi-riscv32-generic-fw_dynamic.bin"
-#else
-# define BIOS_FILENAME "opensbi-riscv64-generic-fw_dynamic.bin"
-#endif
-
 static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
@@ -93,7 +87,7 @@ static const struct MemmapEntry {
 #define GEM_REVISION        0x10070109
 
 static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
-    uint64_t mem_size, const char *cmdline)
+                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     void *fdt;
@@ -178,11 +172,11 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         qemu_fdt_add_subnode(fdt, nodename);
         /* cpu 0 is the management hart that does not have mmu */
         if (cpu != 0) {
-#if defined(TARGET_RISCV32)
-            qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
-#else
-            qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
-#endif
+            if (is_32_bit) {
+                qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
+            } else {
+                qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
+            }
             isa = riscv_isa_string(&s->soc.u_cpus.harts[cpu - 1]);
         } else {
             isa = riscv_isa_string(&s->soc.e_cpus.harts[0]);
@@ -458,7 +452,8 @@ static void sifive_u_machine_init(MachineState *machine)
                           qemu_allocate_irq(sifive_u_machine_reset, NULL, 0));
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32_bit(machine));
 
     if (s->start_in_flash) {
         /*
@@ -487,8 +482,15 @@ static void sifive_u_machine_init(MachineState *machine)
         break;
     }
 
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
@@ -518,9 +520,9 @@ static void sifive_u_machine_init(MachineState *machine)
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DEV_DRAM].base,
                                    machine->ram_size, s->fdt);
-    #if defined(TARGET_RISCV64)
-    start_addr_hi32 = start_addr >> 32;
-    #endif
+    if (!riscv_is_32_bit(machine)) {
+        start_addr_hi32 = (uint64_t)start_addr >> 32;
+    }
 
     /* reset vector */
     uint32_t reset_vec[11] = {
@@ -528,13 +530,8 @@ static void sifive_u_machine_init(MachineState *machine)
         0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
         0x02828613,                    /*     addi   a2, t0, %pcrel_lo(1b) */
         0xf1402573,                    /*     csrr   a0, mhartid  */
-#if defined(TARGET_RISCV32)
-        0x0202a583,                    /*     lw     a1, 32(t0) */
-        0x0182a283,                    /*     lw     t0, 24(t0) */
-#elif defined(TARGET_RISCV64)
-        0x0202b583,                    /*     ld     a1, 32(t0) */
-        0x0182b283,                    /*     ld     t0, 24(t0) */
-#endif
+        0,
+        0,
         0x00028067,                    /*     jr     t0 */
         start_addr,                    /* start: .dword */
         start_addr_hi32,
@@ -542,6 +539,14 @@ static void sifive_u_machine_init(MachineState *machine)
         0x00000000,
                                        /* fw_dyn: */
     };
+    if (riscv_is_32_bit(machine)) {
+        reset_vec[4] = 0x0202a583;     /*     lw     a1, 32(t0) */
+        reset_vec[5] = 0x0182a283;     /*     lw     t0, 24(t0) */
+    } else {
+        reset_vec[4] = 0x0202b583;     /*     ld     a1, 32(t0) */
+        reset_vec[5] = 0x0182b283;     /*     ld     t0, 24(t0) */
+    }
+
 
     /* copy in the reset vector in little_endian byte order */
     for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
-- 
2.29.2


