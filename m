Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNa6Z-0006Kn-4q
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 08:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNa6W-0006Jr-Vn
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:58:21 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNa6U-0008Sa-OF
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:58:20 -0500
Received: by mail-oi1-x243.google.com with SMTP id r9so1445018oig.12
 for <qemu-riscv@nongnu.org>; Thu, 02 Feb 2023 05:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l8MFiuXQ/g3MbPgHOjlwsj1LmKvLQxTFmOdqR/jzwkI=;
 b=pQvGp3hJ/WNJG5npiLPnN2qBz3NYNtM632h6J+kLl5HEBwKFbO8cIUAnA2KNnbJ0fL
 NN4C9PKsFSZ4DefKxiuHu+1+b3nTtII0DGYGU2g/AF0yenUa64ZdIJgNwe0437dmD6tI
 bv32F4Jt96wBiNPhgFeIizXVNa17+GGsic0WiTlqwY2em3Cx1L9NTjRVqY1tXh0BLkKx
 Gai/3iWRQ9B6qTEVvgeXnL/KE/A0she/kJvI9nkbyckswcuAz6OltsvNt9f8epFdSfgm
 oOicp0OR2onGRBWiT/kvrReemfBM7aOM9FvjcW5XVX0edUk7j1nPKtgLKJPd1AY05/qO
 EnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l8MFiuXQ/g3MbPgHOjlwsj1LmKvLQxTFmOdqR/jzwkI=;
 b=JyIOywyv8TIymgOrWdUKYDMfjOVEJ2xI4CPJClbfJDxaoSoPNwRmeB9XGux4RhI2hA
 fDqHxgh30aHSg78ZyLe5GhEzrSWABO8prrMj9NyqqD9f0a2ukwxm3vU4yyOWePa9IwdZ
 nuN/mC9QdKz4ffD51qTriSgHkIWuTf4H6K7LYoRwPAhr8DWzPdquNP4AezvSaVOcrpB2
 hqXFh7ozjRXD9wboUwbcAASdVSuWpg0AwklJwGKqScvgdnQQqWOH53Zb1mtxAkFYtBkm
 Ovc+fVHlOag1VA65thRAm/XajFugyy3U9opBl8K3fbOma8tXr00iUVajja8x872jVsnH
 TDmw==
X-Gm-Message-State: AO0yUKUlY4YYtYMCEkJzapmWKe5BrrfHkxRjejsj1pKola0WO+5bhTNo
 yUmT6BKyNN8XTOYz6/b4OjdmoCh4tOWqe9nisjw=
X-Google-Smtp-Source: AK7set/tOehMwcAwEYYEwgCJfgeFx6TXOQXukXrLNT0WDgw60km7qA6QnVKbsqZ935mqeSER4VdTww==
X-Received: by 2002:a05:6808:d50:b0:378:9f53:b331 with SMTP id
 w16-20020a0568080d5000b003789f53b331mr3729832oik.0.1675346297624; 
 Thu, 02 Feb 2023 05:58:17 -0800 (PST)
Received: from grind.. ([177.102.69.207]) by smtp.gmail.com with ESMTPSA id
 m24-20020a05680806d800b00377fae9d36csm6707382oih.52.2023.02.02.05.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:58:17 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 1/3] hw/riscv: handle 32 bit CPUs kernel_addr in
 riscv_load_kernel()
Date: Thu,  2 Feb 2023 10:58:08 -0300
Message-Id: <20230202135810.1657792-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202135810.1657792-1-dbarboza@ventanamicro.com>
References: <20230202135810.1657792-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x243.google.com
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
X-List-Received-Date: Thu, 02 Feb 2023 13:58:21 -0000

load_elf_ram_sym() will sign-extend 32 bit addresses. If a 32 bit QEMU
guest happens to be running in a hypervisor that are using 64 bits to
encode its address, kernel_entry can be padded with '1's and create
problems [1].

Using a translate_fn() callback in load_elf_ram_sym() to filter the
padding from the address doesn't work. A more detailed explanation can
be found in [2]. The short version is that glue(load_elf, SZ), from
include/hw/elf_ops.h, will calculate 'pentry' (mapped into the
'kernel_load_base' var in riscv_load_Kernel()) before using
translate_fn(), and will not recalculate it after executing it. This
means that the callback does not prevent the padding from
kernel_load_base to appear.

Let's instead use a kernel_low var to capture the 'lowaddr' value from
load_elf_ram_sim(), and return it when we're dealing with 32 bit CPUs.

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg00099.html

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 15 +++++++++++----
 hw/riscv/microchip_pfsoc.c |  3 ++-
 hw/riscv/opentitan.c       |  3 ++-
 hw/riscv/sifive_e.c        |  3 ++-
 hw/riscv/sifive_u.c        |  3 ++-
 hw/riscv/spike.c           |  3 ++-
 hw/riscv/virt.c            |  3 ++-
 include/hw/riscv/boot.h    |  1 +
 8 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index c7e0e50bd8..5ec6d32165 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -174,11 +174,12 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 }
 
 target_ulong riscv_load_kernel(MachineState *machine,
+                               RISCVHartArrayState *harts,
                                target_ulong kernel_start_addr,
                                symbol_fn_t sym_cb)
 {
     const char *kernel_filename = machine->kernel_filename;
-    uint64_t kernel_load_base, kernel_entry;
+    uint64_t kernel_load_base, kernel_entry, kernel_low;
 
     g_assert(kernel_filename != NULL);
 
@@ -189,10 +190,16 @@ target_ulong riscv_load_kernel(MachineState *machine,
      * the (expected) load address load address. This allows kernels to have
      * separate SBI and ELF entry points (used by FreeBSD, for example).
      */
-    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
-                         NULL, &kernel_load_base, NULL, NULL, 0,
+    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL, NULL,
+                         &kernel_load_base, &kernel_low, NULL, 0,
                          EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
-        return kernel_load_base;
+        kernel_entry = kernel_load_base;
+
+        if (riscv_is_32bit(harts)) {
+            kernel_entry = kernel_low;
+        }
+
+        return kernel_entry;
     }
 
     if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 2b91e49561..712625d2a4 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -629,7 +629,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
+                                         kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 353f030d80..7fe4fb5628 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -101,7 +101,8 @@ static void opentitan_board_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
+        riscv_load_kernel(machine, &s->soc.cpus,
+                          memmap[IBEX_DEV_RAM].base, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 3e3f4b0088..1a7d381514 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *machine)
                           memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL);
+        riscv_load_kernel(machine, &s->soc.cpus,
+                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index d3ab7a9cda..71be442a50 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -598,7 +598,8 @@ static void sifive_u_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, &s->soc.u_cpus,
+                                         kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index cc3f6dac17..1fa91167ab 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -305,7 +305,8 @@ static void spike_board_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
+        kernel_entry = riscv_load_kernel(machine, &s->soc[0],
+                                         kernel_start_addr,
                                          htif_symbol_callback);
 
         if (machine->initrd_filename) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a061151a6f..d0531cc641 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1277,7 +1277,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, &s->soc[0],
+                                         kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 511390f60e..6295316afb 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -44,6 +44,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
 target_ulong riscv_load_kernel(MachineState *machine,
+                               RISCVHartArrayState *harts,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
-- 
2.39.1


