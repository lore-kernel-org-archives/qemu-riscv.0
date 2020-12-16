Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbRt-0005ij-AX
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRq-0005fm-PJ; Wed, 16 Dec 2020 13:22:50 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:39413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRo-0000M7-87; Wed, 16 Dec 2020 13:22:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608142968; x=1639678968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a8qfRt40LCf1BxwHJa2hSQSCSjRfNAKPcMpT/IOw8Lw=;
 b=Dun3ViQDo7jr7Coh8Clp9BtjdMB2bHRdZ+b+1tRdwajvuKANuJ74VZR3
 ZzdA578t6YgT1tegAG/YVNGr58q0JmN1W0uXgyxxRTLeVOJZLqTORpgM3
 d/ic2SpYu8O6VJE22jELbDYtdaKXeQ/TXHI2l9xNpQmFDFnea0fRqGqf7
 1CzKtfyM9xupkNRGPRxrsxTeBOY4PZAv3CHeMvQRzt62dAZk6Vq6TPk7c
 q5mKOHRcM4T0eaD5HWjR5Z5RIv9UB5d/PlQwv2ANSD8x6Uu9d+iZFLEc4
 Lnd5Vdgs84EFcxkyKGsTauZrzalbeEWlu0LkUcx/kpEfh/phHeKk7cbhh w==;
IronPort-SDR: 1b6LEX9VP6voOnm87rwKHBX16U6CHyf+MMq77AZyaMezbHtvDg/fEwkmALoVxKBPR6Tu8yq3TB
 zEdKpYHp2dxOy5w49O6IcRvOgtVIPbxHAXWlzcZ7mnfK4iOP9q5OUCPx+ROG3ZHzoqeHttONV5
 un84tKsCXGY/0OsdOZiLeVDLpbVMpn8sq6hVcNg6khGb93dsFFM5eFRbAsplr1DYUoEGVbBKPV
 bD1tSdrh3qVDFPLZSTzFKmK51KlTjcyCWo68an1Nv3QC0gNmhjQNNTrZeIH6ouPY/Vm8NoMsLQ
 OD8=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="156514501"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:22:46 +0800
IronPort-SDR: 2NFH6SdFWRGWbqD9CPG8vIJ6saCD9tr2S3UfY3zarJ1J0S97sbuNlGxHDk5KM5Ortr9fhn7P9K
 0nTlLM46voMLt2ssBA/k1C7o01e4DtO6NrIaLEwMtD2BPV4bo+goxEYgN0AzBlvtAuVZ1lq+61
 epUM4rypO6arpm7KgyRDQSQtqoquxdPbHgSi75yXAZnDjVhNWUWJ/mrXjUGkosf4+UzGpXtaJu
 NqXrjdf2j83jrYuqku9L7LPAMcaEr5Pyy8QCFJ4khyTJxd0zqKHl28E7tNJMgmlM8ZaS5lq/eI
 0EG7PqQBDU2GuFRucYTwzLxL
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:08:03 -0800
IronPort-SDR: 1GW91h4GSMJBXoIb++f2tZlIhcF67PFN/Uujr4R0sgA3L0g2QrJrdTYbNoHFAQUKjWd5giN9hK
 l9KrpOUqkrg3FvQr9iEcxRGQL5nX2fbIHi6ZcolZamjhTwxY8VNg3yKEz8elksoWxflMi7voGY
 UbxXdB5zt+apdR4s+7CIBOXbSubkEA619XuHIMhL9EOMG00Qhah9Y0FySFtksDnLPCZwp3qNgf
 OB8d90187OKl9oj/FWt71jDXdv+7dmV6icvovOuJYoR2Ml20lisUI/RCewYu1/L/AudvsdzHNW
 Qng=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip01.wdc.com with ESMTP; 16 Dec 2020 10:22:47 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 08/16] hw/riscv: sifive_u: Remove compile time XLEN checks
Date: Wed, 16 Dec 2020 10:22:45 -0800
Message-Id: <40d6df4dd05302c566e419be3a1fef7799e57c2e.1608142916.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608142916.git.alistair.francis@wdc.com>
References: <cover.1608142916.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=612374860=alistair.francis@wdc.com;
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
X-List-Received-Date: Wed, 16 Dec 2020 18:22:52 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
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


