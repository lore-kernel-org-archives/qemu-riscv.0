Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kouY4-0001MZ-PQ
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouY2-0001HF-Ou; Mon, 14 Dec 2020 15:34:22 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:60603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouY0-0007uP-Tw; Mon, 14 Dec 2020 15:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607978060; x=1639514060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BD2w1JzPAhFnuG/0+v+zaFrsidkLC94J1KLJCbCeLEM=;
 b=dSua5GwOrl+2/8lLdVO+VKGzWOt5LMj+pPhp2kEFs68Nizbxw/evmh1t
 BM+nAx9jnqbqeP/CDHCY1Yd2iV28kIsOqZqeQxY5iep6o1WP5cKaamCE8
 6EqAoJE4Hi/RSVZHwFnNKFa1gNzO2d9aUwY+74daD3Cx725mUZsx3WiDP
 WXMQtYEYC5kHb7A2lWF5Lh7ASfb2eMBuAqksSydWvUDneQX7lYzBDvt/K
 WdLkQ3v5mDvJj60XY/81OUB0JpekGSfr0wdk7MnzK+/BseDNTECUlxvxt
 UeP9YCfVaCQEMSeXWcrAmDn8W+0Tok1WDHNVtIdy9oZr7Wjb0/l5ipVz/ w==;
IronPort-SDR: FDslF37ku3pdxsbF5xaqwtrQ+ayV9K6HSZBTZFvDnOAw6rfK3DmXHTxaQbkXkBismzNpllk3mF
 Fuv/yOjqTpp2COWtgiAp8oKgLhPmViEhKVRgyKbqWrf5o6pllArJzqB7Q4Gg5ApBkcBlGwdbzv
 Ot/1merCi0yWlZNZCLhJ/o7qmCVUNHN3/aRhVS8F615PISNbAFCNKDy5oTzX9/lTr3luaHJ2B2
 XydxziqEaqs5NTS+0U2iyO3BzOxmiPVTQJ2QMBV5nPaDob7VqR/rjSLQP3jH5UY2YTqs/yrM4b
 v2U=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="159585997"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 04:34:18 +0800
IronPort-SDR: Dt5vcyZhhlArEnADSqfWpmd4hCy3VSM9AnH2CqbZeTPW59bUosvUcRGHpP0eM/DFGgeSJTohuN
 51a+EwpFlUa6nd6cQz6Ftv8qbURqFwBALvTTD7ATqvzk4VUEN8exoERM0QV6nmYnTcZV6SLjoe
 g7Bm9JVhGCXu0oveKWhqRJia/eGkfIc43D3rXQ0i4MifvwR9w10KkIN2BpC2rWAs3tBY+48UOL
 FA1TvAoVCft+dNm8XbFqZdBMaqJ1yvZCXvdDCB4Tzkhnu3OJ0e7S8vbI7cwmUtmTlR506UsEme
 sEge7BoSvIGkB4CFrZIlNflX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 12:18:02 -0800
IronPort-SDR: kcuEgAA9d9aWLij9a/yYj7gSAER69UhvvNbXdq9xsd+okITssNv7QdT8T4Mo9g3EtUx52LlwSh
 jJCMYnowrW/tHECBCQHKZ5RzobrfWkHivlf543iV7zYhG6/i3abXTkImnWY9PcuB41LCLn3C7j
 eXsMYSpjjEpeOS+U3g+Wb1lHPqZvu/dfRAQkXe2GiyBEj6JTqBCA3ym6pFr7SaOGCMaTuZfvcz
 2ra2IDrS7+EcM4bUriElzmMUNIwa3CtJMM+StnYu3xg7qsF8aK3WUkzeZ3Jbm0FmzYstQgrROP
 sU8=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.52])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Dec 2020 12:34:18 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 08/15] hw/riscv: sifive_u: Remove compile time XLEN checks
Date: Mon, 14 Dec 2020 12:34:18 -0800
Message-Id: <b86408181948129347f6bef37b734add89a2f480.1607967113.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607967113.git.alistair.francis@wdc.com>
References: <cover.1607967113.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=61015ee87=alistair.francis@wdc.com;
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
X-List-Received-Date: Mon, 14 Dec 2020 20:34:23 -0000

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


