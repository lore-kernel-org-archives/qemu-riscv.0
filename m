Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtL40-0002Up-Tp
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jul 2020 21:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jtL3y-0002RB-Vl; Wed, 08 Jul 2020 21:09:22 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:40809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jtL3x-0004dI-BR; Wed, 08 Jul 2020 21:09:22 -0400
Received: by mail-pg1-x542.google.com with SMTP id e18so197233pgn.7;
 Wed, 08 Jul 2020 18:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Rzogyha5+VyEqgQmO+ZRoX1hNxug0G55gpp60N51A2g=;
 b=HuvdCf5mupCxLouSVELAzwxOzDS+IOoSP5XOZ+bbVv2TQf79YrJCcFJU9p4+h6O+IC
 oFxwlW3gC4WskXx5lBcxYScbuqhmtHL4B3FKtNE7/WCPxJEqYfmRDRDMluXiUjuhTnY8
 aAnVOaSHFxyb6VbfkRwQM/ZsiPaPUZTDZK5shORog1yLFtmRpF3HNRt3yMsDPAb9qFuL
 SkdWU0DaUY0LbyXksasOzXRIqxeapkhRRXaHL8hknbR+14n4uP6K3IV/9jxLu88bt1To
 NwzM3rvhzBqOmoywIciYs0xJOITaHbP2iu8QWhvgs/KUtzWb6OHmLLZxZr5IXfgyEi+R
 9KHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Rzogyha5+VyEqgQmO+ZRoX1hNxug0G55gpp60N51A2g=;
 b=JBi2JEtCvihyaMmbJfKbLmrFyqOsFoH9ka+JtNO3iExCEYrwnHgpgeoCwv9FyTesVw
 H5WRRllQOgnHyCSCb9SMyPdfvXZH5ogaFWmwL39J8iKnc3dIR5uXZkuE4mVsRi4AUuki
 2Njxzwiriu1aQBJakgQe+7K50h2/meRVxCZdHckg8LvxFs2MBO0VoLOcAw1ZM6VJSEIj
 e9dzPVGWluDUIXxsX5+2Z4Wt6oV320gfmWNiSuWZ3rSDBRFQ06Og79hS8n4vdzTqBTwA
 vSF+aukJCgmoTovFE7r41nu718n/8apjZeRgWU+I1jt+p4GMv615ralPHQFtvVGgWUVo
 3S+Q==
X-Gm-Message-State: AOAM531w++eZg7VMzD4iYog7e8nbTve/quXJEQkvQjebznaVF5TdhFda
 ovjjkAaRYKzIBdY0SMNrxe8=
X-Google-Smtp-Source: ABdhPJzM3uqH/WcRXsh3ULzNcsnNoMk1vn57MQExIlMUvQ1p9I/8ZWj9ggAnEgXbnf7qndHoS5RLzA==
X-Received: by 2002:a63:9d45:: with SMTP id i66mr52891860pgd.25.1594256959522; 
 Wed, 08 Jul 2020 18:09:19 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id g3sm868071pfq.19.2020.07.08.18.09.18
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 08 Jul 2020 18:09:19 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 2/2] hw/riscv: sifive_u: Provide a reliable way for bootloader
 to detect whether it is running in QEMU
Date: Wed,  8 Jul 2020 18:09:05 -0700
Message-Id: <1594256945-21744-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1594256945-21744-1-git-send-email-bmeng.cn@gmail.com>
References: <1594256945-21744-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 09 Jul 2020 01:09:23 -0000

From: Bin Meng <bin.meng@windriver.com>

The reset vector codes are subject to change, e.g.: with recent
fw_dynamic type image support, it breaks oreboot again.

Add a subregion in the MROM, with the size of machine RAM stored,
so that we can provide a reliable way for bootloader to detect
whether it is running in QEMU.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/sifive_u.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 3413369..6d714a2 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -88,6 +88,7 @@ static const struct MemmapEntry {
 
 #define OTP_SERIAL          1
 #define GEM_REVISION        0x10070109
+#define MROM_RAMSIZE_OFFSET 0xf8
 
 static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     uint64_t mem_size, const char *cmdline)
@@ -382,6 +383,7 @@ static void sifive_u_machine_init(MachineState *machine)
     int i;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
+    ram_addr_t ram_size = machine->ram_size;
 
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_U_SOC);
@@ -391,7 +393,7 @@ static void sifive_u_machine_init(MachineState *machine)
 
     /* register RAM */
     memory_region_init_ram(main_mem, NULL, "riscv.sifive.u.ram",
-                           machine->ram_size, &error_fatal);
+                           ram_size, &error_fatal);
     memory_region_add_subregion(system_memory, memmap[SIFIVE_U_DRAM].base,
                                 main_mem);
 
@@ -406,7 +408,7 @@ static void sifive_u_machine_init(MachineState *machine)
                           qemu_allocate_irq(sifive_u_machine_reset, NULL, 0));
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
+    create_fdt(s, memmap, ram_size, machine->kernel_cmdline);
 
     if (s->start_in_flash) {
         /*
@@ -443,7 +445,7 @@ static void sifive_u_machine_init(MachineState *machine)
         if (machine->initrd_filename) {
             hwaddr start;
             hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_entry,
+                                           ram_size, kernel_entry,
                                            &start);
             qemu_fdt_setprop_cell(s->fdt, "/chosen",
                                   "linux,initrd-start", start);
@@ -460,7 +462,7 @@ static void sifive_u_machine_init(MachineState *machine)
 
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DRAM].base,
-                                   machine->ram_size, s->fdt);
+                                   ram_size, s->fdt);
     #if defined(TARGET_RISCV64)
     start_addr_hi32 = start_addr >> 32;
     #endif
@@ -496,6 +498,17 @@ static void sifive_u_machine_init(MachineState *machine)
     riscv_rom_copy_firmware_info(memmap[SIFIVE_U_MROM].base,
                                  memmap[SIFIVE_U_MROM].size,
                                  sizeof(reset_vec), kernel_entry);
+
+    /*
+     * Tell guest the machine ram size at MROM_RAMSIZE_OFFSET.
+     * On real hardware, the 64-bit value from MROM_RAMSIZE_OFFSET is zero.
+     * QEMU aware bootloader (e.g.: oreboot, U-Boot) can check value stored
+     * here to determine whether it is running in QEMU.
+     */
+    ram_size = cpu_to_le32(ram_size);
+    rom_add_blob_fixed_as("mrom.ram_size", &ram_size, sizeof(ram_size),
+                          memmap[SIFIVE_U_MROM].base + MROM_RAMSIZE_OFFSET,
+                          &address_space_memory);
 }
 
 static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
-- 
2.7.4


