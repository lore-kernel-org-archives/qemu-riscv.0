Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVdJs-0001l1-PM
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 14:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJm-0001gx-5b
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 14:01:18 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJe-0002ds-OA
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 14:01:17 -0500
Received: by mail-pl1-x62c.google.com with SMTP id ko13so426832plb.13
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 11:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677265262;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qM65WvJmtqBdo7YXUq2tCaQm5DhPxT8kHRMe5UdjLts=;
 b=Q/AkXsdU3wDvZAfI9erC0ztd7cJ/QkDZQL1yfYb0ZG/tU2XVGSulqgIQTEoBTpLHq4
 8ydgdffu4zcFTxbjYq6mWQZj2BbLqGawL+9oo3KWQqPdsQX3IbFSfqu37J0zsvPsuD1x
 ElkgfJiAUprj/f3lJU6ZN5TERcMeaFPhWSDa9JMsgm5f4SKEOmmDiTO7jJDWRJEdq18W
 tJT6Fo+Mp+Xj99ae8zpKVF4sHPW/hdqR0YsLt4YZKl5TWO2l9qk+yCcuWqVrMe4il1vS
 UcAMA4vK+YOrmMcm/UlH7oV+PWKaKMqmmMwfxd9Y8dKUlDDpmaT3uQ1aa+bPNUHHTknk
 ZBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677265262;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qM65WvJmtqBdo7YXUq2tCaQm5DhPxT8kHRMe5UdjLts=;
 b=3sWNnsGm2qfDyS8hFMYaCR8IxA9Z58EHwT+LoOStuBGbfAESU6eHq0FRY6wkLO0Uqp
 95tXYvAO0CIq2OCkLTJv16q6M2lekynZ4xsTVD7T7fQctqAQLLWVCaKoLLV8tXUeYevQ
 9yJHb3oadKmHu71GtGAxlVIgkYtQo4jEczXsxqt1U3i8KnyL740UdIDkH3iP23GDn7rF
 atSb6ZGl+r0aQdIuMdhzDr7TQnTQ5O9cCVA6JTCZ7E15g60mxA7PTPS7dPXyQ1XxqQO7
 aMqMVbtVugkhgRWDm5YUI4+5ctzHzTJoBRelnZZcdP3/JyHEk5TDmXYvuV7I0qaAWOgO
 1Qww==
X-Gm-Message-State: AO0yUKWrNWjqd3WfRS8NgReeVx7AN95wN5TdiEp418Bkp0pQ9VVxz4n8
 jJYsiMkERQmL7D74/Znzo3F/NSPx9lQbA6AF
X-Google-Smtp-Source: AK7set/HWuufL5EUCLSZKl1leDjywxnBHFxPG22V9NgYB/j9shq9ro5oQR+u8JMLKHLPC5mdgsIU7g==
X-Received: by 2002:a17:902:bd05:b0:199:190c:3c0a with SMTP id
 p5-20020a170902bd0500b00199190c3c0amr6846334pls.31.1677265262090; 
 Fri, 24 Feb 2023 11:01:02 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 i3-20020a170902c28300b0019a83f2c99bsm3896741pld.28.2023.02.24.11.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 11:01:01 -0800 (PST)
Subject: [PULL 2/8] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Date: Fri, 24 Feb 2023 10:59:03 -0800
Message-Id: <20230224185908.32706-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230224185908.32706-1-palmer@rivosinc.com>
References: <20230224185908.32706-1-palmer@rivosinc.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 24 Feb 2023 19:01:18 -0000

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


