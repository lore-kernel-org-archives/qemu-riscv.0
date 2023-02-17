Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pT4vS-00058e-Jo
	for mharc-qemu-riscv@gnu.org; Fri, 17 Feb 2023 12:53:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vR-000580-Oo
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 12:53:37 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vP-0000ss-Ls
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 12:53:37 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 i10-20020a17090a7e0a00b002341a2656e5so1950927pjl.1
 for <qemu-riscv@nongnu.org>; Fri, 17 Feb 2023 09:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qM65WvJmtqBdo7YXUq2tCaQm5DhPxT8kHRMe5UdjLts=;
 b=AmZRywyvZwm92t7Tr97heVhWXNZJbSeE7fNiofc5UeZY9BqubaIccHMmqg1kfNgA2L
 cVqKkmAUtNOLIRQPeYy9KnGQDhN/BGPPjGtkvnzPPQkOx+4AmOBEWQU9gPwryOvEgFmH
 76022UU9s4HGlgbHz3hJsAc94p1d8gfX11YXtpJetfm+H+yL90QfUTWxIej9nKQmRkU3
 o/uB6RwOBn+1WwprOuaz8yAVuRL6AGo22Rt6Ma9Rs8u84CdemRG0VFUL5m4GsEWefyRu
 6Goc3kV/bD6jEfW6iWn6XahkXqVZAMD5ILEgEwAOHlpBWx6z28C0xKrhwpGEIcUePYZn
 +QNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qM65WvJmtqBdo7YXUq2tCaQm5DhPxT8kHRMe5UdjLts=;
 b=1W0Mjc6zD8oUYGrHurMeBqjc6/Re0P6+f06yFMEXIXnIPuliiwgz+GxafGkpePSrjH
 EdBC75HdWjY5IsmVaJCFYaqFORElEO118X53vSj/J8HI83DO9thTQR2ir4HnqD3SHc+v
 fN3dqH8nbmgRmdd7TQo0qENBH7O9dFYtf2+3pADGcPSStawa4Nylzy7bd2xZhWPfUj0w
 LXlIuwqp5bEOtQ0tizmL0BWy4wABW/xG+zE1NXHzraTBJbT4rSKOrbql+6+QkizI6jA4
 NSv/0mbVXc/2Tnyc5xB1fRT1pdyMqsox6SKPoKQOHG7GP7j3PNr2qcLsL0t5r1Y25y9R
 CFlw==
X-Gm-Message-State: AO0yUKX0Sfz3SJdGer2KZwIRjy8YGJ66g2M5QvBiMPskA3ZSpL5FY7m1
 A2IoI3Bd9GMEFqkFY7js1zoSmLarNlK2D7bp
X-Google-Smtp-Source: AK7set/Nxbx5dbFqe+Z8dCiOfvbhANtjLgTLu4SlYo/VRxTClpx8+/Hngxz8n0KjRbkknd11pD8IeQ==
X-Received: by 2002:a17:90b:b01:b0:236:75d3:fedc with SMTP id
 bf1-20020a17090b0b0100b0023675d3fedcmr2635626pjb.8.1676656413791; 
 Fri, 17 Feb 2023 09:53:33 -0800 (PST)
Received: from localhost ([135.180.226.51]) by smtp.gmail.com with ESMTPSA id
 q6-20020a17090a304600b002341c0ff245sm1040707pjl.19.2023.02.17.09.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 09:53:33 -0800 (PST)
Subject: [PULL 2/9] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Date: Fri, 17 Feb 2023 09:51:56 -0800
Message-Id: <20230217175203.19510-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217175203.19510-1-palmer@rivosinc.com>
References: <20230217175203.19510-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng@tinylab.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 17:53:38 -0000

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
the same steps when '-kernel' is used:

- execute load_kernel()
- load init_rd()
- write kernel_cmdline

Let's fold everything inside riscv_load_kernel() to avoid code
repetition. To not change the behavior of boards that aren't calling
riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
allow these boards to opt out from initrd loading.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230206140022.2748401-3-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 hw/riscv/boot.c            | 11 +++++++++++
 hw/riscv/microchip_pfsoc.c | 11 +----------
 hw/riscv/opentitan.c       |  3 ++-
 hw/riscv/sifive_e.c        |  3 ++-
 hw/riscv/sifive_u.c        | 11 +----------
 hw/riscv/spike.c           | 11 +----------
 hw/riscv/virt.c            | 11 +----------
 include/hw/riscv/boot.h    |  1 +
 8 files changed, 20 insertions(+), 42 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index df6b4a1fba..4954bb9d4b 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -176,10 +176,12 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel(MachineState *machine,
                                RISCVHartArrayState *harts,
                                target_ulong kernel_start_addr,
+                               bool load_initrd,
                                symbol_fn_t sym_cb)
 {
     const char *kernel_filename = machine->kernel_filename;
     uint64_t kernel_load_base, kernel_entry;
+    void *fdt = machine->fdt;
 
     g_assert(kernel_filename != NULL);
 
@@ -220,6 +222,15 @@ out:
         kernel_entry = extract64(kernel_entry, 0, 32);
     }
 
+    if (load_initrd && machine->initrd_filename) {
+        riscv_load_initrd(machine, kernel_entry);
+    }
+
+    if (fdt && machine->kernel_cmdline && *machine->kernel_cmdline) {
+        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
+                                machine->kernel_cmdline);
+    }
+
     return kernel_entry;
 }
 
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 712625d2a4..e81bbd12df 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -630,16 +630,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
-                                         kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen",
-                                    "bootargs", machine->kernel_cmdline);
-        }
+                                         kernel_start_addr, true, NULL);
 
         /* Compute the fdt load address in dram */
         fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 7fe4fb5628..b06944d382 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -102,7 +102,8 @@ static void opentitan_board_init(MachineState *machine)
 
     if (machine->kernel_filename) {
         riscv_load_kernel(machine, &s->soc.cpus,
-                          memmap[IBEX_DEV_RAM].base, NULL);
+                          memmap[IBEX_DEV_RAM].base,
+                          false, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 1a7d381514..04939b60c3 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -115,7 +115,8 @@ static void sifive_e_machine_init(MachineState *machine)
 
     if (machine->kernel_filename) {
         riscv_load_kernel(machine, &s->soc.cpus,
-                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
+                          memmap[SIFIVE_E_DEV_DTIM].base,
+                          false, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 71be442a50..ad3bb35b34 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -599,16 +599,7 @@ static void sifive_u_machine_init(MachineState *machine)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
-                                         kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
+                                         kernel_start_addr, true, NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 1fa91167ab..a584d5b3a2 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -307,16 +307,7 @@ static void spike_board_init(MachineState *machine)
 
         kernel_entry = riscv_load_kernel(machine, &s->soc[0],
                                          kernel_start_addr,
-                                         htif_symbol_callback);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
+                                         true, htif_symbol_callback);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 797c6084b6..86c4adc0c9 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1278,16 +1278,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, &s->soc[0],
-                                         kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
+                                         kernel_start_addr, true, NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 6295316afb..ea1de8b020 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,6 +46,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel(MachineState *machine,
                                RISCVHartArrayState *harts,
                                target_ulong firmware_end_addr,
+                               bool load_initrd,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
-- 
2.39.0


