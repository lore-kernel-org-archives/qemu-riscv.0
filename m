Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAVmg-0005T7-Sv
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 07:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVmE-0005LY-KY
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:43:25 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVmC-00084q-9p
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:43:21 -0500
Received: by mail-oi1-x22f.google.com with SMTP id e205so14719166oif.11
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 04:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vAGWQkc74vw2nrcwm/gM7/u4ZlurQlOmwk5WGdjxiyE=;
 b=I6CoeqjnCX2elylXU08IqCyFlUt5M0xtJVuiEy64jBt+roR+qnHM0bDmfmNLzrBgPR
 E9GshsK1BsbBdxhjFaXLrzvBTWbnimmU1skYWUIg2jnfKww1JknNNIKYJ7QeHi5zLW00
 SJ0PZOtTdvYvW51501d/sar41tlPqnfPzr1tue7LJxeA67y/78Y+eLvuIiPHy7rqzmRn
 QodVy7gfGwis0lesusm+DEILszESdiDsQ9Rtzb/h2KUoiIpEdkR0K6QT8OqnGcd0JIgl
 CYPczq/YvxtbkDEkdIyLyOb5ZcL0BBToHPShO8pvuS7koEeZpmPl4ph/OwCR/4xQpX9p
 fF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vAGWQkc74vw2nrcwm/gM7/u4ZlurQlOmwk5WGdjxiyE=;
 b=jpoOPvWVytBOORPJaVDH5ub2A2zL4/3pLb72pUpktfQhpfF98o7tfeoY6gTTk0nc09
 MvT7Spd4nMOUhZ3j/b9PfN/68jxsNUL9L681LPZBc0JX7Mm/QM2p1X1znszjlyZnmeLy
 WQrY8e56OEA53yozfi5sFEUAC+u9WcpaCLgHjS9NZ/p4i+XQskXZObGnA9J2151P24wL
 zs/OsynTjxvaAIVLxJaXBA049n0Wx+JXDSRFjDB37Uy24RRUXdbjKBfkbUD7MPEOvtRJ
 Wt24J84UhwRevWvbwu9+dPCO4E92UENMYAk2adak93mzXaK75OdRcXcmvwXqqqRo6l3U
 CMmw==
X-Gm-Message-State: AFqh2kopZZkBSJqoC86jEVGPYP0CXnmJPFqfAJjUXbs3+Ltw2bKoFx2O
 HK8jVXfio397RzimjMKulpgYbQ==
X-Google-Smtp-Source: AMrXdXuIsJbrPoB4ISd9W91cfPWyFtSIfXEU/0mQSnPBsZ2dDLINayKJM952egHkJGx7eHly9JXlbw==
X-Received: by 2002:a05:6808:1394:b0:35e:4620:ee8b with SMTP id
 c20-20020a056808139400b0035e4620ee8bmr17657864oiw.33.1672231398520; 
 Wed, 28 Dec 2022 04:43:18 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 cj5-20020a056830640500b0066f09567827sm7689333otb.78.2022.12.28.04.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 04:43:18 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v2 09/10] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Date: Wed, 28 Dec 2022 09:42:41 -0300
Message-Id: <20221228124242.184784-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228124242.184784-1-dbarboza@ventanamicro.com>
References: <20221228124242.184784-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 12:43:25 -0000

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
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/boot.c            | 21 ++++++++++++++++++---
 hw/riscv/microchip_pfsoc.c |  9 ---------
 hw/riscv/sifive_u.c        |  9 ---------
 hw/riscv/spike.c           |  9 ---------
 hw/riscv/virt.c            |  9 ---------
 5 files changed, 18 insertions(+), 39 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index cd9c989edb..95f780a228 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -177,6 +177,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
 {
     const char *kernel_filename = machine->kernel_filename;
     uint64_t kernel_load_base, kernel_entry;
+    void *fdt = machine->fdt;
 
     /*
      * NB: Use low address not ELF entry point to ensure that the fw_dynamic
@@ -188,21 +189,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
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
index 0bba5c1640..48d004802b 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -304,15 +304,6 @@ static void spike_board_init(MachineState *machine)
 
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


