Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n8P5E-00034d-Mf
	for mharc-qemu-riscv@gnu.org; Fri, 14 Jan 2022 11:05:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n8P5C-00032f-77
 for qemu-riscv@nongnu.org; Fri, 14 Jan 2022 11:05:43 -0500
Received: from [2a00:1450:4864:20::42d] (port=45850
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n8P5A-0005B0-E7
 for qemu-riscv@nongnu.org; Fri, 14 Jan 2022 11:05:41 -0500
Received: by mail-wr1-x42d.google.com with SMTP id q8so16337273wra.12
 for <qemu-riscv@nongnu.org>; Fri, 14 Jan 2022 08:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UEOWKaapMQWby2pbmZQ8/gs6L+TngnjZlU1N0pqplkk=;
 b=CiffvXDePpEhZxlL74J1hcDdqt6VoX69xxky+qTRRYFSco07jx4NDw7F8hT5KyBXz1
 IelFkaY9hRgnAWZvOpVu9fvGzYk6t5qhD0E5RyZNHzdVkrGKwSE+jpJgU0w3hDzNpzaI
 e209tV5icdtIkgKbq4yx2840VhFe3zV4Zc+qoyRkfnIPQLiNNLQ+1wn5hDrJlVUmIWPa
 iW3A3iUsRX1+2OuN2GQLJeltYl9nfUNfQZQbpZP5K+7bSsY6HHbzV8c5j5R9siiQr7ZP
 B3GojEGUfapNVfd8mSsPcQwraZMFPGjjM28FT7b/TxNew34MFgMTMG0Qn6FlStSq8LD7
 NS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UEOWKaapMQWby2pbmZQ8/gs6L+TngnjZlU1N0pqplkk=;
 b=gFHVhCgcnP0VEMOZvKw9z5v0lZpQViWA5wWNt7YgseieEAZqkTyprXCi0K7fTqXBHN
 MOPUC7NlELJaRzppZ7NCgGAW97K84rMulzQG0wbpCCk8ed6BmzZoBJJ6aYDOP8akYlSc
 s9yuM39Z/3BIGP9ONx6xjMq186w86TBxE2/waVEAi4YN9VsTqABvTmCri37BwNTAazDX
 khHsSPkyS+1p67zjS/EBgTR8uPsSNAKqpSP9clk3WQcr82qR5GFgEA/gX22qBT5ke7DD
 Y9H3/HoIIV7sw4vt8lG0YuZNSQrK/Xrp6IP6tnG0HQ75bpYH1z6b9lfKmq2ht686SMoZ
 vhWw==
X-Gm-Message-State: AOAM533E0EWkFuKVtaWRpM9gY76ev4ONnGMSX6FeZ5YDDuoUBxdd07EH
 qeiZSBrasHDvxnu2+Lb5uZTixA==
X-Google-Smtp-Source: ABdhPJyJ4fQ4+byw4ty3AK1UPsxwzZkmwO3ZJKmrn2efE20ifJveRRntakJTX5eiBQ2H+7hdZZ8txQ==
X-Received: by 2002:a5d:678c:: with SMTP id v12mr9219017wru.603.1642176334048; 
 Fri, 14 Jan 2022 08:05:34 -0800 (PST)
Received: from localhost.localdomain ([122.179.78.147])
 by smtp.gmail.com with ESMTPSA id n3sm1521215wri.98.2022.01.14.08.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 08:05:33 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] hw/riscv: spike: Allow using binary firmware as bios
Date: Fri, 14 Jan 2022 21:34:57 +0530
Message-Id: <20220114160457.70134-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=apatel@ventanamicro.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 14 Jan 2022 16:05:44 -0000

Currently, we have to use OpenSBI firmware ELF as bios for the spike
machine because the HTIF console requires ELF for parsing "fromhost"
and "tohost" symbols.

The latest OpenSBI can now optionally pick-up HTIF register address
from HTIF DT node so using this feature spike machine can now use
OpenSBI firmware BIN as bios.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 hw/char/riscv_htif.c         | 33 +++++++++++++++++++----------
 hw/riscv/spike.c             | 41 ++++++++++++++++++++++--------------
 include/hw/char/riscv_htif.h |  5 ++++-
 include/hw/riscv/spike.h     |  1 +
 4 files changed, 52 insertions(+), 28 deletions(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index ddae738d56..b59d321fb7 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -228,13 +228,25 @@ static const MemoryRegionOps htif_mm_ops = {
     .write = htif_mm_write,
 };
 
+bool htif_uses_elf_symbols(void)
+{
+    return (address_symbol_set == 3) ? true : false;
+}
+
 HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
-    CPURISCVState *env, Chardev *chr)
+    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base)
 {
-    uint64_t base = MIN(tohost_addr, fromhost_addr);
-    uint64_t size = MAX(tohost_addr + 8, fromhost_addr + 8) - base;
-    uint64_t tohost_offset = tohost_addr - base;
-    uint64_t fromhost_offset = fromhost_addr - base;
+    uint64_t base, size, tohost_offset, fromhost_offset;
+
+    if (address_symbol_set != 3) {
+        fromhost_addr = nonelf_base;
+        tohost_addr = nonelf_base + 8;
+    }
+
+    base = MIN(tohost_addr, fromhost_addr);
+    size = MAX(tohost_addr + 8, fromhost_addr + 8) - base;
+    tohost_offset = tohost_addr - base;
+    fromhost_offset = fromhost_addr - base;
 
     HTIFState *s = g_malloc0(sizeof(HTIFState));
     s->address_space = address_space;
@@ -249,12 +261,11 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
     qemu_chr_fe_set_handlers(&s->chr, htif_can_recv, htif_recv, htif_event,
         htif_be_change, s, NULL, true);
-    if (address_symbol_set == 3) {
-        memory_region_init_io(&s->mmio, NULL, &htif_mm_ops, s,
-                              TYPE_HTIF_UART, size);
-        memory_region_add_subregion_overlap(address_space, base,
-                                            &s->mmio, 1);
-    }
+
+    memory_region_init_io(&s->mmio, NULL, &htif_mm_ops, s,
+                          TYPE_HTIF_UART, size);
+    memory_region_add_subregion_overlap(address_space, base,
+                                        &s->mmio, 1);
 
     return s;
 }
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 288d69cd9f..597df4c288 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -42,6 +42,7 @@
 
 static const MemMapEntry spike_memmap[] = {
     [SPIKE_MROM] =     {     0x1000,     0xf000 },
+    [SPIKE_HTIF] =     {  0x1000000,     0x1000 },
     [SPIKE_CLINT] =    {  0x2000000,    0x10000 },
     [SPIKE_DRAM] =     { 0x80000000,        0x0 },
 };
@@ -75,6 +76,10 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/htif");
     qemu_fdt_setprop_string(fdt, "/htif", "compatible", "ucb,htif0");
+    if (!htif_uses_elf_symbols()) {
+        qemu_fdt_setprop_cells(fdt, "/htif", "reg",
+            0x0, memmap[SPIKE_HTIF].base, 0x0, memmap[SPIKE_HTIF].size);
+    }
 
     qemu_fdt_add_subnode(fdt, "/soc");
     qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
@@ -172,6 +177,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     if (cmdline) {
         qemu_fdt_add_subnode(fdt, "/chosen");
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
+        qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
     }
 }
 
@@ -241,10 +247,6 @@ static void spike_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[SPIKE_DRAM].base,
         machine->ram);
 
-    /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
-
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv.spike.mrom",
                            memmap[SPIKE_MROM].size, &error_fatal);
@@ -266,6 +268,7 @@ static void spike_board_init(MachineState *machine)
                                     htif_symbol_callback);
     }
 
+    /* Load kernel */
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
@@ -273,17 +276,6 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = riscv_load_kernel(machine->kernel_filename,
                                          kernel_start_addr,
                                          htif_symbol_callback);
-
-        if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_entry,
-                                           &start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
-                                  end);
-        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
@@ -292,6 +284,22 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = 0;
     }
 
+    /* Create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32bit(&s->soc[0]));
+
+    /* Load initrd */
+    if (machine->kernel_filename && machine->initrd_filename) {
+        hwaddr start;
+        hwaddr end = riscv_load_initrd(machine->initrd_filename,
+                                       machine->ram_size, kernel_entry,
+                                       &start);
+        qemu_fdt_setprop_cell(s->fdt, "/chosen",
+                              "linux,initrd-start", start);
+        qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
+                              end);
+    }
+
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, s->fdt);
@@ -303,7 +311,8 @@ static void spike_board_init(MachineState *machine)
 
     /* initialize HTIF using symbols found in load_kernel */
     htif_mm_init(system_memory, mask_rom,
-                 &s->soc[0].harts[0].env, serial_hd(0));
+                 &s->soc[0].harts[0].env, serial_hd(0),
+                 memmap[SPIKE_HTIF].base);
 }
 
 static void spike_machine_instance_init(Object *obj)
diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index fb9452cf51..f888ac1b30 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -52,8 +52,11 @@ extern const MemoryRegionOps htif_io_ops;
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
     uint64_t st_size);
 
+/* Check if HTIF uses ELF symbols */
+bool htif_uses_elf_symbols(void);
+
 /* legacy pre qom */
 HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
-    CPURISCVState *env, Chardev *chr);
+    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base);
 
 #endif
diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
index cdd1a13011..73d69234de 100644
--- a/include/hw/riscv/spike.h
+++ b/include/hw/riscv/spike.h
@@ -43,6 +43,7 @@ struct SpikeState {
 
 enum {
     SPIKE_MROM,
+    SPIKE_HTIF,
     SPIKE_CLINT,
     SPIKE_DRAM
 };
-- 
2.25.1


