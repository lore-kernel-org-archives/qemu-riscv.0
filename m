Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EF7CD6E4A
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:01:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUfZb-0003xP-Ds; Wed, 03 Jun 2026 02:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wUfZa-0003x7-HR
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2026 02:59:30 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wUfZY-000690-Ce
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2026 02:59:30 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-c85c9e8b7e4so794976a12.1
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 23:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780469967; x=1781074767; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mWc8A4TqVkAR/+Fnqj0pUfdlDJzAYb4yBHB9wwTpj7I=;
 b=XfowDSX+ziVBMXjvdQIWpQjLBESYfC+VhhZWnEA65y1mBxuTuxVTMhXH5elwofHu1j
 2RPWzFhEeGltI35gS5tYbHvif38mhoGB4StwZNf5Wx+OoGAJBik9dpfkZ+VLA3JIJpAq
 yAOvBx7yz7FfAu0W5z9koIcFsRr6F7bKrATn29CbqPoH35Hw+lUYGrTH0FNZSD0Hg4yh
 bXQ1CamYhBPPz1Y/jgCTGt/Eyg80m6xnSBwT5UFEkjGkms7CGBurn8nYyWxNZ2qai/7t
 5ilLEY7XJ8IjeiWQv7vzr5TGtbOi7kPXzWjq0BxtPLrM7M5a5gl6vkoSnfZFLupzLG79
 HthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780469967; x=1781074767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mWc8A4TqVkAR/+Fnqj0pUfdlDJzAYb4yBHB9wwTpj7I=;
 b=Ezbg8luZsNe0sCBLUmG0//+cxq9u3F8+GPBaxmmESr56uJclrdmAVJ63eBnBh3PUfG
 Ofc4baq6GnD/4XUNV3zJ6RUheyaU0onku1sltPSH+C4xGl7YAaqQxFY+xf8BtgTVJNJK
 DOUFUSUPpbghsNeuksmyBUiGLk1d/Boxmsdq76ebj1t5eCcdfofWktZjhF03iMt6qdQz
 4IVWyhjGY+ZJ66UKmGFHG0b461VanqfEUgdsSxYJ6cfPl57dc7LJ4jeDLvFev2VJKekh
 IZzu/jDYLqKJrHaZE10O1yUhLYPGLt3T5389BFRJicno+p41HDV4L/U5xJx/LJxn3DQN
 c2qA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/PST7Asj4BoWqrXb+RQyM+XYkpjKoogVPP3zeXxGscZKS0rz8f7lWOJj11C+fafK690gQHAKxB8UG4@nongnu.org
X-Gm-Message-State: AOJu0YwOuFWGlrvkwzsWqjYSos/KFPOIR1OOMAPB4X53M7+vM0NeLoqm
 JKQ7HxjAD0D7ieJscQDb8Vam1S9ELMAIkq7Wcksd/rv87rUZ1OFYZh8t
X-Gm-Gg: Acq92OGoxIdw3rILf+g+IpZiZZDlsMIwwBs1w+iC5wI9c3xOtoCSo5+xPA/TKMvPui1
 y/nTAiKu+FsDc0/kPgMwxYp1+PDDmpMjkA6JSo3uAo8z8vP6S4eiTl5CVzVj+gnj1G9CuDIjFOV
 KW1jeUsUlLExRCmOp5v/+977TPBWozlAS4qU+HIl4AhI0nxPOJa+zVCRy79JTdseDkbHLHAi3zl
 3QA+FltNnkjpStiug2t3K/vMlyStizpgtBIUPP6nCf74pasKQeti25P2Tf/LiQzWoVQDSGCsxZN
 3uvryeQErcOrVun84eolnDhOaBUpxxShCxqUCR/7VcGxYAUlkR+2hjnLht95EdX1dYZXsYpFLQt
 +FL27TRbPy+wyA/Ia+OspKEFqroXhPn2U+SCWpVmnBd18hN9VkxTw4FgAtQ4OSoSufBUIQaoe4i
 w/TuvYi2GSnwoqqi3oBNRb4veXA3lgH/VzIeB6ai2rECKp36smGJc59daFc8eD+0FKtHcjf2sH2
 kW+F/sKL0/TMu+Cx+FC1JxRW9+wqlyf/vD/bCj9XlSEXJxTiR4CX5TfiW+ZJY0SNDqSqLGq6ZM=
X-Received: by 2002:a05:6a21:6f11:b0:3b3:2703:115 with SMTP id
 adf61e73a8af0-3b497557144mr2428290637.16.1780469966977; 
 Tue, 02 Jun 2026 23:59:26 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85df033887sm1283261a12.2.2026.06.02.23.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 23:59:26 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v8 02/12] hw/riscv/boot: Account for discontiguous memory when
 loading firmware
Date: Wed,  3 Jun 2026 16:28:46 +0930
Message-ID: <20260603065859.592063-3-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603065859.592063-1-joel@jms.id.au>
References: <20260603065859.592063-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Nicholas Piggin <npiggin@gmail.com>

This loads firmware into the first (low) memory range,
accounting for machines having discontiguous memory regions.

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/riscv/boot.h    |  5 ++++-
 hw/riscv/boot.c            | 18 ++++++++++++------
 hw/riscv/microchip_pfsoc.c |  8 ++++++--
 hw/riscv/opentitan.c       |  6 ++++--
 hw/riscv/shakti_c.c        |  6 +++++-
 hw/riscv/sifive_u.c        |  6 ++++--
 hw/riscv/spike.c           |  6 ++++--
 hw/riscv/virt.c            |  7 ++++---
 hw/riscv/xiangshan_kmh.c   |  6 +++++-
 9 files changed, 48 insertions(+), 20 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 69c99a149613..4e7bd9a225ef 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -53,13 +53,16 @@ void riscv_boot_info_init_discontig_mem(RISCVBootInfo *info,
 vaddr riscv_calc_kernel_start_addr(RISCVBootInfo *info,
                                    hwaddr firmware_end_addr);
 hwaddr riscv_find_and_load_firmware(MachineState *machine,
+                                    RISCVBootInfo *info,
                                     const char *default_machine_firmware,
                                     hwaddr *firmware_load_addr,
                                     symbol_fn_t sym_cb);
 const char *riscv_default_firmware_name(RISCVHartArrayState *harts);
 char *riscv_find_firmware(const char *firmware_filename,
                           const char *default_machine_firmware);
-hwaddr riscv_load_firmware(const char *firmware_filename,
+hwaddr riscv_load_firmware(MachineState *machine,
+                           const RISCVBootInfo *info,
+                           const char *firmware_filename,
                            hwaddr *firmware_load_addr,
                            symbol_fn_t sym_cb);
 void riscv_load_kernel(MachineState *machine,
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index b1a020b58aed..b0a2e384b1ae 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -150,6 +150,7 @@ char *riscv_find_firmware(const char *firmware_filename,
 }
 
 hwaddr riscv_find_and_load_firmware(MachineState *machine,
+                                    RISCVBootInfo *info,
                                     const char *default_machine_firmware,
                                     hwaddr *firmware_load_addr,
                                     symbol_fn_t sym_cb)
@@ -162,7 +163,8 @@ hwaddr riscv_find_and_load_firmware(MachineState *machine,
 
     if (firmware_filename) {
         /* If not "none" load the firmware */
-        firmware_end_addr = riscv_load_firmware(firmware_filename,
+        firmware_end_addr = riscv_load_firmware(machine, info,
+                                                firmware_filename,
                                                 firmware_load_addr, sym_cb);
         g_free(firmware_filename);
     }
@@ -170,10 +172,13 @@ hwaddr riscv_find_and_load_firmware(MachineState *machine,
     return firmware_end_addr;
 }
 
-hwaddr riscv_load_firmware(const char *firmware_filename,
+hwaddr riscv_load_firmware(MachineState *machine,
+                           const RISCVBootInfo *info,
+                           const char *firmware_filename,
                            hwaddr *firmware_load_addr,
                            symbol_fn_t sym_cb)
 {
+    uint64_t mem_size = info->ram_low_size ?: machine->ram_size;
     uint64_t firmware_entry, firmware_end;
     ssize_t firmware_size;
 
@@ -202,7 +207,7 @@ hwaddr riscv_load_firmware(const char *firmware_filename,
 
     firmware_size = load_image_targphys_as(firmware_filename,
                                            *firmware_load_addr,
-                                           current_machine->ram_size, NULL,
+                                           mem_size, NULL,
                                            NULL);
 
     if (firmware_size > 0) {
@@ -217,7 +222,7 @@ hwaddr riscv_load_firmware(const char *firmware_filename,
 static void riscv_load_initrd(MachineState *machine, RISCVBootInfo *info)
 {
     const char *filename = machine->initrd_filename;
-    uint64_t mem_size = machine->ram_size;
+    uint64_t mem_size = info->ram_low_size ?: machine->ram_size;
     void *fdt = machine->fdt;
     hwaddr start, end;
     ssize_t size;
@@ -263,6 +268,7 @@ void riscv_load_kernel(MachineState *machine,
                        bool load_initrd,
                        symbol_fn_t sym_cb)
 {
+    uint64_t mem_size = info->ram_low_size ?: machine->ram_size;
     const char *kernel_filename = machine->kernel_filename;
     ssize_t kernel_size;
     void *fdt = machine->fdt;
@@ -294,7 +300,7 @@ void riscv_load_kernel(MachineState *machine,
     }
 
     kernel_size = load_image_targphys_as(kernel_filename, kernel_start_addr,
-                                         current_machine->ram_size, NULL, NULL);
+                                         mem_size, NULL, NULL);
     if (kernel_size > 0) {
         info->kernel_size = kernel_size;
         info->image_low_addr = kernel_start_addr;
@@ -390,7 +396,7 @@ uint64_t riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
     dtb_start = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
 
     if (dtb_start_limit && (dtb_start < dtb_start_limit)) {
-        error_report("No enough memory to place DTB after kernel/initrd");
+        error_report("Not enough memory to place DTB after kernel/initrd");
         exit(1);
     }
 
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 5e48a2970838..4017129c8304 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -619,18 +619,22 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         firmware_load_addr = RESET_VECTOR;
     }
 
+    riscv_boot_info_init_discontig_mem(&boot_info, &s->soc.u_cpus,
+                                       memmap[MICROCHIP_PFSOC_DRAM_LO].base,
+                                       mem_low_size);
+
     /* Load the firmware if necessary */
     firmware_end_addr = firmware_load_addr;
     if (firmware_name) {
         char *filename = riscv_find_firmware(firmware_name, NULL);
         if (filename) {
-            firmware_end_addr = riscv_load_firmware(filename,
+            firmware_end_addr = riscv_load_firmware(machine, &boot_info,
+                                                    filename,
                                                     &firmware_load_addr, NULL);
             g_free(filename);
         }
     }
 
-    riscv_boot_info_init(&boot_info, &s->soc.u_cpus);
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&boot_info,
                                                          firmware_end_addr);
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index c8b2f028f237..5b2f33d5acac 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -100,12 +100,14 @@ static void opentitan_machine_init(MachineState *machine)
     memory_region_add_subregion(sys_mem,
         memmap[IBEX_DEV_RAM].base, machine->ram);
 
+    riscv_boot_info_init(&boot_info, &s->soc.cpus);
+
     if (machine->firmware) {
         hwaddr firmware_load_addr = memmap[IBEX_DEV_RAM].base;
-        riscv_load_firmware(machine->firmware, &firmware_load_addr, NULL);
+        riscv_load_firmware(machine, &boot_info, machine->firmware,
+                            &firmware_load_addr, NULL);
     }
 
-    riscv_boot_info_init(&boot_info, &s->soc.cpus);
     if (machine->kernel_filename) {
         riscv_load_kernel(machine, &boot_info,
                           memmap[IBEX_DEV_RAM].base,
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index b1823a312508..835b1f879b7f 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -46,6 +46,7 @@ static void shakti_c_machine_state_init(MachineState *mstate)
 {
     ShaktiCMachineState *sms = RISCV_SHAKTI_MACHINE(mstate);
     MemoryRegion *system_memory = get_system_memory();
+    RISCVBootInfo boot_info;
     hwaddr firmware_load_addr = shakti_c_memmap[SHAKTI_C_RAM].base;
 
     /* Initialize SoC */
@@ -58,8 +59,11 @@ static void shakti_c_machine_state_init(MachineState *mstate)
                                 shakti_c_memmap[SHAKTI_C_RAM].base,
                                 mstate->ram);
 
+    riscv_boot_info_init(&boot_info, &sms->soc.cpus);
+
     if (mstate->firmware) {
-        riscv_load_firmware(mstate->firmware, &firmware_load_addr, NULL);
+        riscv_load_firmware(mstate, &boot_info, mstate->firmware,
+                            &firmware_load_addr, NULL);
     }
 
     /* ROM reset vector */
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 6a637e3b86c4..3b2763de1684 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -590,11 +590,13 @@ static void sifive_u_machine_init(MachineState *machine)
         break;
     }
 
+    riscv_boot_info_init(&boot_info, &s->soc.u_cpus);
+
     firmware_name = riscv_default_firmware_name(&s->soc.u_cpus);
-    firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
+    firmware_end_addr = riscv_find_and_load_firmware(machine, &boot_info,
+                                                     firmware_name,
                                                      &start_addr, NULL);
 
-    riscv_boot_info_init(&boot_info, &s->soc.u_cpus);
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&boot_info,
                                                          firmware_end_addr);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index f9d00e0d5c48..8d68b4e235dd 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -282,9 +282,12 @@ static void spike_board_init(MachineState *machine)
         }
     }
 
+    riscv_boot_info_init(&boot_info, &s->soc[0]);
+
     /* Load firmware */
     if (firmware_name) {
-        firmware_end_addr = riscv_load_firmware(firmware_name,
+        firmware_end_addr = riscv_load_firmware(machine, &boot_info,
+                                                firmware_name,
                                                 &firmware_load_addr,
                                                 htif_symbol_callback);
         g_free(firmware_name);
@@ -294,7 +297,6 @@ static void spike_board_init(MachineState *machine)
     create_fdt(s, memmap, riscv_is_32bit(&s->soc[0]), htif_custom_base);
 
     /* Load kernel */
-    riscv_boot_info_init(&boot_info, &s->soc[0]);
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&boot_info,
                                                          firmware_end_addr);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ce64eaaef7d9..febf49d5f149 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1458,7 +1458,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
         }
     }
 
-    firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
+    riscv_boot_info_init(&boot_info, &s->soc[0]);
+
+    firmware_end_addr = riscv_find_and_load_firmware(machine, &boot_info,
+                                                     firmware_name,
                                                      &start_addr, NULL);
 
     pflash_blk0 = pflash_cfi01_get_blk(s->flash[0]);
@@ -1481,8 +1484,6 @@ static void virt_machine_done(Notifier *notifier, void *data)
         }
     }
 
-    riscv_boot_info_init(&boot_info, &s->soc[0]);
-
     if (machine->kernel_filename && !kernel_entry) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&boot_info,
                                                          firmware_end_addr);
diff --git a/hw/riscv/xiangshan_kmh.c b/hw/riscv/xiangshan_kmh.c
index 76417ba7aba1..384624d69ad5 100644
--- a/hw/riscv/xiangshan_kmh.c
+++ b/hw/riscv/xiangshan_kmh.c
@@ -167,6 +167,7 @@ static void xiangshan_kmh_machine_init(MachineState *machine)
     const MemMapEntry *memmap = xiangshan_kmh_memmap;
     MemoryRegion *system_memory = get_system_memory();
     hwaddr start_addr = memmap[XIANGSHAN_KMH_DRAM].base;
+    RISCVBootInfo boot_info;
 
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc,
@@ -178,13 +179,16 @@ static void xiangshan_kmh_machine_init(MachineState *machine)
                                 memmap[XIANGSHAN_KMH_DRAM].base,
                                 machine->ram);
 
+    riscv_boot_info_init(&boot_info, &s->soc.cpus);
+
     /* ROM reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc.cpus,
                               start_addr,
                               memmap[XIANGSHAN_KMH_ROM].base,
                               memmap[XIANGSHAN_KMH_ROM].size, 0, 0);
     if (machine->firmware) {
-        riscv_load_firmware(machine->firmware, &start_addr, NULL);
+        riscv_load_firmware(machine, &boot_info, machine->firmware,
+                            &start_addr, NULL);
     }
 
     /* Note: dtb has been integrated into firmware(OpenSBI) when compiling */
-- 
2.47.3


