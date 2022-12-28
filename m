Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAVmC-0005Jm-PT
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 07:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVm2-00059A-U6
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:43:11 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVlz-0007f5-CE
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:43:09 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 x25-20020a056830115900b00670932eff32so9808970otq.3
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 04:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oikBKkKahhZEdm4ld5dwcA6luVTj35JLzUpMpaRato4=;
 b=dqQqwxEvnvsZs/t/upjdEtcqCKvzbZow44P4ATJ5elYRajV2/zAAis+waJvFbdxujp
 rQm2GN1jSdAPDkFz/Jg3IoMy7kzxkpcqd0R5TdD3iQV+TaQoagaCmve5bW9zyAWeKd9h
 5K/sBtKyWTSKm6l0UivTyKIOZi4R1LCzxGC/cfIFQSx34WShl+Z8icIrMenVo7x7iiUR
 Pc753H0Ht4yB+jj0L4NytNNnGBEvFwRE0HEcrysZRJ0mm4zjHnriEAJVPsy2Isc1GxsR
 HQ2SBNxqsaZfx7/2Lk2OvkVXJsrtXxxVn+EXeLDoeMblzHCaM30kuK9ksEbE0elYNxVS
 Q2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oikBKkKahhZEdm4ld5dwcA6luVTj35JLzUpMpaRato4=;
 b=Jk9GBviWe5aC9fsY1j9dYr+AxWMmznaI7HtAYsNMuuwTwvow13ZP5mewPAYiOw+cOP
 aWOmMqX2eZ4Bi1HOj8ibmEG6boAdxVOksdIrhlaMZoj35OS/TngFHRUN0uCmOKP0sINM
 iJ6UgJsTwpg0lkMSx44OH6zgo4JImA6Lz/F/mp5GpF3gXK1y4TUBGZ6q4hDayTxuszkM
 QoVPOFQFkorXg3QYQTuKojl/NCnoBMBvPPCIR677DdSmWSY6h7QG22mlAUAHyySwXyuf
 zTb6iY4pwAqNTLcF5lYAPYhlY6gzuqSLGZB6MbDenvAEA2dv6Gxq8QvfIAt+kuOfg1xb
 NukQ==
X-Gm-Message-State: AFqh2kp74MLL+KO1wItg6Wcl0mmh/o5SIdcjBcRbancgHPEZOsftdCx5
 jUa9r0okp/U1ieC0otNmYWdXECee3DAMlSwB
X-Google-Smtp-Source: AMrXdXs4GkppRt3XW8NM2KITOL8uq7/lYeEesN6kMMrDLepr/yOngPWAziCKRA1D8soQZJf1m9mTBQ==
X-Received: by 2002:a05:6830:3358:b0:67a:a7ad:29ee with SMTP id
 l24-20020a056830335800b0067aa7ad29eemr11517468ott.18.1672231386573; 
 Wed, 28 Dec 2022 04:43:06 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 cj5-20020a056830640500b0066f09567827sm7689333otb.78.2022.12.28.04.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 04:43:06 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v2 05/10] hw/riscv: write initrd 'chosen' FDT inside
 riscv_load_initrd()
Date: Wed, 28 Dec 2022 09:42:37 -0300
Message-Id: <20221228124242.184784-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228124242.184784-1-dbarboza@ventanamicro.com>
References: <20221228124242.184784-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 28 Dec 2022 12:43:11 -0000

riscv_load_initrd() returns the initrd end addr while also writing a
'start' var to mark the addr start. These informations are being used
just to write the initrd FDT node. Every existing caller of
riscv_load_initrd() is writing the FDT in the same manner.

We can simplify things by writing the FDT inside riscv_load_initrd(),
sparing callers from having to manage start/end addrs to write the FDT
themselves.

An 'if (fdt)' check is already inserted at the end of the function
because we'll end up using it later on with other boards that doesn´t
have a FDT.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/boot.c            | 18 ++++++++++++------
 hw/riscv/microchip_pfsoc.c | 10 ++--------
 hw/riscv/sifive_u.c        | 10 ++--------
 hw/riscv/spike.c           | 10 ++--------
 hw/riscv/virt.c            | 10 ++--------
 include/hw/riscv/boot.h    |  4 ++--
 6 files changed, 22 insertions(+), 40 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 98b80af51b..d3c71b3f0b 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -204,9 +204,10 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
     exit(1);
 }
 
-hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
-                         uint64_t kernel_entry, hwaddr *start)
+void riscv_load_initrd(const char *filename, uint64_t mem_size,
+                       uint64_t kernel_entry, void *fdt)
 {
+    hwaddr start, end;
     ssize_t size;
 
     /*
@@ -220,18 +221,23 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
      * halfway into RAM, and for boards with 256MB of RAM or more we put
      * the initrd at 128MB.
      */
-    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
+    start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
 
-    size = load_ramdisk(filename, *start, mem_size - *start);
+    size = load_ramdisk(filename, start, mem_size - start);
     if (size == -1) {
-        size = load_image_targphys(filename, *start, mem_size - *start);
+        size = load_image_targphys(filename, start, mem_size - start);
         if (size == -1) {
             error_report("could not load ramdisk '%s'", filename);
             exit(1);
         }
     }
 
-    return *start + size;
+    /* Some RISC-V machines (e.g. opentitan) don't have a fdt. */
+    if (fdt) {
+        end = start + size;
+        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start", start);
+        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end", end);
+    }
 }
 
 uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index b10321b564..593a799549 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -633,14 +633,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                          kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_entry,
-                                           &start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                                  "linux,initrd-end", end);
+            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
+                              kernel_entry, machine->fdt);
         }
 
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ddceb750ea..37f5087172 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -608,14 +608,8 @@ static void sifive_u_machine_init(MachineState *machine)
                                          kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_entry,
-                                           &start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
-                                  end);
+            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
+                              kernel_entry, machine->fdt);
         }
     } else {
        /*
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 0d2feea930..360bf83564 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -311,14 +311,8 @@ static void spike_board_init(MachineState *machine)
                                          htif_symbol_callback);
 
         if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_entry,
-                                           &start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
-                                  end);
+            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
+                              kernel_entry, machine->fdt);
         }
     } else {
        /*
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 408f7a2256..5967b136b4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1291,14 +1291,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
                                          kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_entry,
-                                           &start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
-                                  end);
+            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
+                              kernel_entry, machine->fdt);
         }
     } else {
        /*
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index b273ab22f7..e37e1d1238 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,8 +46,8 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel(const char *kernel_filename,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
-hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
-                         uint64_t kernel_entry, hwaddr *start);
+void riscv_load_initrd(const char *filename, uint64_t mem_size,
+                       uint64_t kernel_entry, void *fdt);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
-- 
2.38.1


