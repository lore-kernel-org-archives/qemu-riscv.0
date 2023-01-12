Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pG69z-00008r-G3
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 17:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pG69y-00008H-5V
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 17:34:58 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pG69v-0008IS-L2
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 17:34:57 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-142b72a728fso20482262fac.9
 for <qemu-riscv@nongnu.org>; Thu, 12 Jan 2023 14:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qUktm9MRkM4oFfoZsjTS+V+n1+HkAj9zGJHLXb9PJx8=;
 b=NDUoN7nFbRbnru84cwipGwI4ksQfqacU8UmVBT8gyP26yWNhwxdxcue+ssvYC/Nm+i
 tkgk3noQ0mGKbjD59pXMqRoKHYesMrALv3tZ+qNOdTOt10/gr+v1qWsJL2/YLCqYfSXK
 pRM2gj75Eu6N4wpHvvwRXW+hYsHRbdRQ5iigraYpVNDhB6FTL9jxNw5RC6JApRvBIMuX
 Jwm/bRqMJqPNQWq8ULuSa0ro21/3j6wxzqnfOm1zPIXGPUUZK06uOvYLaaAF5RbjIvEI
 3+LuKgIvg3gGwLM6dOzIKgIliohsA1YDD6b172JVvaIiAWk3E6rg1tJVmmJODxXhXjwD
 +N5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qUktm9MRkM4oFfoZsjTS+V+n1+HkAj9zGJHLXb9PJx8=;
 b=KmFEmL+sj2E99g7f8hvWpGWxejrQRBs8SdwQTd2MAesWqx9wa9oFtFxMuLhBL0GqVs
 jVTEAO69QglrDUjcjmdcPpLnSjiEAfSvB16PwG9nF4keGwZu+MbsiC9IdMAM/vxyGiEZ
 WGhms+USsoWXwfiW75Pk1qXn/4Y4sfoNu12KgXVphCusJs8WznmBM0yoItjor2lAlM+E
 P1GpeyZ9irLCYLdixu1Xw5lkVey42BHV8LRZFpkzfD+H7l78kFt8e1zIw6CulMivO3M3
 ceo1iiMUSDbRYq/SR8O0o8xhT41t5W6LlucYKwQIa3/HilTzTbHKyx1tUv9vgeA2AjNj
 KbnA==
X-Gm-Message-State: AFqh2kpO+NfrnYnV0zqJiz3sVWeAH/+ckueBL6lMV0n2lgEhu6i3PX8s
 BwKyi4VO9V4W1qyIGe8Fw78Efw==
X-Google-Smtp-Source: AMrXdXvPr78a9iy8MIo1ApCbWxaGDJDVzkXkXYU9Aw6HH3FIqO/FC1OF6/tyfWia7a4OEDltUZL1kw==
X-Received: by 2002:a05:6870:c985:b0:15e:ceb9:9b67 with SMTP id
 hi5-20020a056870c98500b0015eceb99b67mr1637885oab.52.1673562894027; 
 Thu, 12 Jan 2023 14:34:54 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 h4-20020a4a9404000000b004a532a32408sm8946830ooi.16.2023.01.12.14.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 14:34:53 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v6 1/2] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Date: Thu, 12 Jan 2023 19:34:43 -0300
Message-Id: <20230112223444.484879-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112223444.484879-1-dbarboza@ventanamicro.com>
References: <20230112223444.484879-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 12 Jan 2023 22:34:58 -0000

The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
the same steps when '-kernel' is used:

- execute load_kernel()
- load init_rd()
- write kernel_cmdline

Let's fold everything inside riscv_load_kernel() to avoid code
repetition. To not change the behavior of boards that aren't calling
riscv_load_initrd(), add an 'load_initrd' flag to riscv_load_kernel()
and allow these boards to opt out from initrd loading.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 30 +++++++++++++++++++++++++++---
 hw/riscv/microchip_pfsoc.c | 12 ++----------
 hw/riscv/opentitan.c       |  3 ++-
 hw/riscv/sifive_e.c        |  4 +++-
 hw/riscv/sifive_u.c        | 13 +++----------
 hw/riscv/spike.c           | 10 +---------
 hw/riscv/virt.c            | 13 +++----------
 include/hw/riscv/boot.h    |  2 ++
 8 files changed, 43 insertions(+), 44 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 2594276223..e8e8b8517c 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -175,10 +175,12 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 
 target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong kernel_start_addr,
+                               bool load_initrd, bool is_32bits,
                                symbol_fn_t sym_cb)
 {
     const char *kernel_filename = machine->kernel_filename;
     uint64_t kernel_load_base, kernel_entry;
+    void *fdt = machine->fdt;
 
     g_assert(kernel_filename != NULL);
 
@@ -192,21 +194,43 @@ target_ulong riscv_load_kernel(MachineState *machine,
     if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
                          NULL, &kernel_load_base, NULL, NULL, 0,
                          EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
-        return kernel_load_base;
+        kernel_entry = kernel_load_base;
+        /*
+         * kernel_load_base is sign-extended for 32 bits and can
+         * be padded with '1's. Do an uint32_t cast to avoid the
+         * padding if we're running a 32 bit CPU.
+         */
+        if (is_32bits) {
+            kernel_entry = (uint32_t)kernel_load_base;
+        }
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
+    if (load_initrd && machine->initrd_filename) {
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
index 82ae5e7023..cb9e126827 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -629,16 +629,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen",
-                                    "bootargs", machine->kernel_cmdline);
-        }
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
+                                         true, false, NULL);
 
         /* Compute the fdt load address in dram */
         fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 64d5d435b9..05f2cfde32 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -101,7 +101,8 @@ static void opentitan_board_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
+        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base,
+                          false, true, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 3e3f4b0088..5969ae8131 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -114,7 +114,9 @@ static void sifive_e_machine_init(MachineState *machine)
                           memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL);
+        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base,
+                          false, riscv_is_32bit(&s->soc.cpus),
+                          NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index bac394c959..44f5a2ba27 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -598,16 +598,9 @@ static void sifive_u_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
+                                         true, riscv_is_32bit(&s->soc.u_cpus),
+                                         NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index bff9475686..4766152429 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -308,16 +308,8 @@ static void spike_board_init(MachineState *machine)
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
+                                         true, riscv_is_32bit(&s->soc[0]),
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
index c8e35f861e..91f6b02983 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1281,16 +1281,9 @@ static void virt_machine_done(Notifier *notifier, void *data)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
-        }
-
-        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
-            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
-                                    machine->kernel_cmdline);
-        }
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
+                                         true, riscv_is_32bit(&s->soc[0]),
+                                         NULL);
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index f94653a09b..d34f61e280 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -45,6 +45,8 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
                                  symbol_fn_t sym_cb);
 target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
+                               bool load_initrd,
+                               bool is_32bits,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
-- 
2.39.0


