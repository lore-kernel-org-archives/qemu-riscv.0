Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p83km-0008KV-O5
	for mharc-qemu-riscv@gnu.org; Wed, 21 Dec 2022 13:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kk-0008IK-OH
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:42 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kj-0007og-1D
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:42 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-12c8312131fso20142381fac.4
 for <qemu-riscv@nongnu.org>; Wed, 21 Dec 2022 10:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R5/g+vsti7lSiZsONctWIYs7IL7csCnpYe9T5na6ABg=;
 b=pDWPuhUOwiwYEEKPle1SfOnDyv2BbQJXP+mg5kZe9uQwgzr2m/bXb1HzDqIpw1Vhq4
 v0bq/DgVmDk6taXFBm2TiSk+CblReg9p6YSyeeTF4tJV+FAGnMFYiLFFgl9vSrLiKaqg
 7TaS8+m+wJpONK3GFnjruvSXJ0QHxA1lssd4Mu3DwYVJ6CdyEjLaQZ2IIu7NjgGTjYJW
 UUG6CsevUlM1XuNNj+G7o2q8cSkrnL2L9TmyfHXHG7iOE/KqtFpNYyeaMgQ7D2pw3tvq
 b0FWY59uZaRhBJxHTlcZkrDJ7pgwwNkC6bjHLZAXfO/wUB5XhbPxo2ka3g3LAJPvnyFr
 JK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R5/g+vsti7lSiZsONctWIYs7IL7csCnpYe9T5na6ABg=;
 b=eNm9mxcrWJEXGj/qxFTurBduBhjjGbYrWjNe9QlLEcPvY6FgPCJiFMOfMPxlRZtMpH
 7E1jgdTh+a1g6zlguMS3xKiLxV+e8ZIAf05qS6QX8U3ZJYgvExptTqyYVbPUViZ/pPBY
 rPwGgUSdrvbXmA+IoHvrCjxWP3fkYk0EcKdkM5coEH987YKMwtRlfIjCWkHAvXTynhgv
 gMSIdAQtRJRgf+fKq55CrPHP0vLZv7buW1aVH+Y2b62OCngsVsVgt5UeZ7+zlMuGbCjF
 3Y6odulFASQvrqNtWHcVFq3tHBpNVVMx1ZRd67RZHDpBbFhxSh14NwmfJerqaJKx272R
 3reQ==
X-Gm-Message-State: AFqh2kpOmTFGrI1LEgYH9OvaEmf0yX8Z5Rh8y/46EUcTicDKtkPiq5AL
 qVmN1wDgvS0cTxFwLJz2udnv4g==
X-Google-Smtp-Source: AMrXdXsiTRF39pcr4kud/TzJUwgxBq6nvrr7YvTjseSCSuX1Y8rSW8RD38OkZBjMSMTJ0eJqxsnNdQ==
X-Received: by 2002:a05:6871:8a6:b0:144:863a:8039 with SMTP id
 r38-20020a05687108a600b00144863a8039mr1582023oaq.21.1671647020396; 
 Wed, 21 Dec 2022 10:23:40 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:40 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 11/15] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Date: Wed, 21 Dec 2022 15:22:56 -0300
Message-Id: <20221221182300.307900-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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
X-List-Received-Date: Wed, 21 Dec 2022 18:23:42 -0000

The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
the same steps when '-kernel' is used:

- execute load_kernel()
- load init_rd()
- write kernel_cmdline

Let's fold everything inside riscv_load_kernel() to avoid code
repetition. Every other board that uses riscv_load_kernel() will have
this same behavior, including boards that doesn't have a valid FDT, so
we need to take care to not do FDT operations without checking it first.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 21 ++++++++++++++++++---
 hw/riscv/microchip_pfsoc.c |  9 ---------
 hw/riscv/sifive_u.c        |  9 ---------
 hw/riscv/spike.c           |  9 ---------
 hw/riscv/virt.c            |  9 ---------
 5 files changed, 18 insertions(+), 39 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index c79a08e6fe..afe5bae03d 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -166,6 +166,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
 {
     const char *kernel_filename = machine->kernel_filename;
     uint64_t kernel_load_base, kernel_entry;
+    void *fdt = machine->fdt;
 
     /*
      * NB: Use low address not ELF entry point to ensure that the fw_dynamic
@@ -177,21 +178,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
     if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
                          NULL, &kernel_load_base, NULL, NULL, 0,
                          EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
-        return kernel_load_base;
+        kernel_entry = kernel_load_base;
+        goto out;
     }
 
     if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
                        NULL, NULL, NULL) > 0) {
-        return kernel_entry;
+        goto out;
     }
 
     if (load_image_targphys_as(kernel_filename, kernel_start_addr,
                                current_machine->ram_size, NULL) > 0) {
-        return kernel_start_addr;
+        kernel_entry = kernel_start_addr;
+        goto out;
     }
 
     error_report("could not load kernel '%s'", kernel_filename);
     exit(1);
+
+out:
+    if (machine->initrd_filename) {
+        riscv_load_initrd(machine, kernel_entry);
+    }
+
+    if (fdt && machine->kernel_cmdline && *machine->kernel_cmdline) {
+        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
+                                machine->kernel_cmdline);
+    }
+
+    return kernel_entry;
 }
 
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 82ae5e7023..57fd6739a5 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -631,15 +631,6 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
 
         kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
 
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen",
-                                    "bootargs", machine->kernel_cmdline);
-        }
-
         /* Compute the fdt load address in dram */
         fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
                                        machine->ram_size, machine->fdt);
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index bac394c959..0c9bf7fe6a 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -599,15 +599,6 @@ static void sifive_u_machine_init(MachineState *machine)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index c9c69f92fc..2b9af5689e 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -274,15 +274,6 @@ static void spike_board_init(MachineState *machine)
 
         kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
                                          htif_symbol_callback);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c8e35f861e..11c903a212 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1282,15 +1282,6 @@ static void virt_machine_done(Notifier *notifier, void *data)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
-- 
2.38.1


