Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsQ-00074v-9V
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49361)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsK-0006tJ-My
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsJ-0006jI-Bx
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:12 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37999)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsJ-0006ij-73
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:11 -0400
Received: by mail-pg1-f193.google.com with SMTP id x10so48058pgi.5
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=yvcVJnTBt6B5VF9gd6v6mXMT9cabSuA1ouyITUaMgek=;
 b=Qg4QCLkC1k39M17cPZl8qics6ZomvEYOK4ydnOAbPNoXHU/5fiEo2JOgJjMiPuL3yE
 REN71caCf7DeDAd0DqGFZ5tgsqsTsf6dI/3adkGHb8tU6u+pYeaTFz0wQE/rHPJuEIPS
 f3b4Y98AqPhGN0JQgiWtK8zwIQWdrJG0hhkC9MDhuTQoiVDvwdE8HiXT6yFqMhRJEuXK
 Wje48/v4arrKtgjPLsu7Cu0NcabBRqHlDtjGKcFU86025o9R+IiNOkYoF311NjI2zZmN
 7CbIoCxabo43duqe8iqw6eOSG6ScOTzJXp/LWpxOC+AF7R75nqYqRliPr+t5xgMCKznh
 Rjnw==
X-Gm-Message-State: APjAAAWw4P3pLNtpwm1NYHvp1w2DynsZLuyyZ+pxTcKToM+PdJtCcDXM
 I17Jbok5F/e3LNgl6EvQa7wLHhq+KTg=
X-Google-Smtp-Source: APXvYqzl96IIqbisgkeqr6h+V6tzGwOack9Gm+4BLt1LyLTMwfmLsv5YiXsD+B7HAG2XDSbGnY4Ehg==
X-Received: by 2002:a63:d741:: with SMTP id w1mr4391358pgi.155.1568820489661; 
 Wed, 18 Sep 2019 08:28:09 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id h8sm7070033pfo.64.2019.09.18.08.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:08 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:10 -0700
Message-Id: <20190918145640.17349-19-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Chih-Min Chao <chihmin.chao@sifive.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.193
Subject: [Qemu-riscv] [PULL 18/48] riscv: hw: Change create_fdt() to return
 void
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:16 -0000

From: Bin Meng <bmeng.cn@gmail.com>

There is no need to return fdt at the end of create_fdt() because
it's already saved in s->fdt.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 11 ++++-------
 hw/riscv/virt.c     | 11 ++++-------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e8acdd9b12..32d8cee335 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -67,7 +67,7 @@ static const struct MemmapEntry {
 
 #define GEM_REVISION        0x10070109
 
-static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
+static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     uint64_t mem_size, const char *cmdline)
 {
     void *fdt;
@@ -253,14 +253,11 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_string(fdt, "/aliases", "serial0", nodename);
 
     g_free(nodename);
-
-    return fdt;
 }
 
 static void riscv_sifive_u_init(MachineState *machine)
 {
     const struct MemmapEntry *memmap = sifive_u_memmap;
-    void *fdt;
 
     SiFiveUState *s = g_new0(SiFiveUState, 1);
     MemoryRegion *system_memory = get_system_memory();
@@ -281,7 +278,7 @@ static void riscv_sifive_u_init(MachineState *machine)
                                 main_mem);
 
     /* create device tree */
-    fdt = create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
 
     riscv_find_and_load_firmware(machine, BIOS_FILENAME,
                                  memmap[SIFIVE_U_DRAM].base);
@@ -294,9 +291,9 @@ static void riscv_sifive_u_init(MachineState *machine)
             hwaddr end = riscv_load_initrd(machine->initrd_filename,
                                            machine->ram_size, kernel_entry,
                                            &start);
-            qemu_fdt_setprop_cell(fdt, "/chosen",
+            qemu_fdt_setprop_cell(s->fdt, "/chosen",
                                   "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
+            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
                                   end);
         }
     }
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 090512be13..d36f5625ec 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -112,7 +112,7 @@ static void create_pcie_irq_map(void *fdt, char *nodename,
                            0x1800, 0, 0, 0x7);
 }
 
-static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
+static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     uint64_t mem_size, const char *cmdline)
 {
     void *fdt;
@@ -316,8 +316,6 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
     g_free(nodename);
-
-    return fdt;
 }
 
 
@@ -373,7 +371,6 @@ static void riscv_virt_board_init(MachineState *machine)
     size_t plic_hart_config_len;
     int i;
     unsigned int smp_cpus = machine->smp.cpus;
-    void *fdt;
 
     /* Initialize SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
@@ -392,7 +389,7 @@ static void riscv_virt_board_init(MachineState *machine)
         main_mem);
 
     /* create device tree */
-    fdt = create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
 
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
@@ -411,9 +408,9 @@ static void riscv_virt_board_init(MachineState *machine)
             hwaddr end = riscv_load_initrd(machine->initrd_filename,
                                            machine->ram_size, kernel_entry,
                                            &start);
-            qemu_fdt_setprop_cell(fdt, "/chosen",
+            qemu_fdt_setprop_cell(s->fdt, "/chosen",
                                   "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
+            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
                                   end);
         }
     }
-- 
2.21.0


