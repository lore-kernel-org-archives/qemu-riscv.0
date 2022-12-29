Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAxNu-00071Q-38
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 13:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNs-0006zf-6i
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:12:04 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNq-0003dk-A5
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:12:03 -0500
Received: by mail-oi1-x230.google.com with SMTP id o66so17711980oia.6
 for <qemu-riscv@nongnu.org>; Thu, 29 Dec 2022 10:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xKrPLfR8CdL8keoz4VKkIBDx1nSCuRcleqcccyYj8Rs=;
 b=OBZF8zhAv2tz6w5JSH7FMPTbSOhItrytMj/PLmR8yafSKDIovsrm1wsIwQw7GWcxtH
 o+CtLrpQyIdOhf/UzOBOnuuUP6tVQVD81PmlOsaNhii0OTWZmpZfpMRnTNb/sI1pGnSY
 bLUpFZVoSPuJMz2dPu/jMwZ3awsJFFBijABsAg5R3l9lLfUWV2NBhwNOBJATKGPZTO2O
 XejYr6NF8JELZMt5fjYmADQqIONgkQ+3CGGptaMM/9m2vEDDjYFtDw7asLNZjrw367QX
 790ENSOGiTyBp5PJjN5j7cKPFs/irjqlnxdvwdljKmj+ZSMxQc4oFO1tQTbh0iZbOPZO
 Ax/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xKrPLfR8CdL8keoz4VKkIBDx1nSCuRcleqcccyYj8Rs=;
 b=6XAN2psy4vhZNhIixiAYqy8W0liwKJhdtX3oF8nIOMVJMOUuqc1Y8BHKoxmG9Y9r1Z
 E7xSgUaf88lKgl5iWk7bit4YFuTLZWapp4k1KSI4AqvCY9x0wIM2Lyc1yr/iWu0JpYel
 pbGRFd0nkX0TWX78vIVOmjmD8zlba9LvhHyLQaGt7gSBhnuWItHYWrW7Y0YBpFBpelu8
 3hghEVtM0OFyPujjplV0oIL/+OQUh7bSIckn7tgAFUuoAp/c9jIsEqSpcC/PLxN+4oUJ
 8lcAt/PnZMtpkfqokN1iVUr9BN4bDJoPu/qg0rQkCdKBS1yLArYX281vHjimXSxShoQ9
 uJtA==
X-Gm-Message-State: AFqh2koTWTq+gW9nq0hL40d4ffHYqQ17V9ARsU4cjBbnlCwMks0fo9yG
 Q/upHYUecmtfqMt1aw2iiB0+5sIEnmQ+9gzu
X-Google-Smtp-Source: AMrXdXu59UwVOfKTNjdXJvSQE95xfc2uo0fyr114k62UMeFEdd9+agL3ORddD1AIKrUVeBte3L7FnA==
X-Received: by 2002:a05:6808:30a8:b0:35e:728d:6de4 with SMTP id
 bl40-20020a05680830a800b0035e728d6de4mr17938838oib.2.1672337521607; 
 Thu, 29 Dec 2022 10:12:01 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b0066db09fb1b5sm9267205otq.66.2022.12.29.10.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 10:12:00 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v4 06/11] hw/riscv: write initrd 'chosen' FDT inside
 riscv_load_initrd()
Date: Thu, 29 Dec 2022 15:11:30 -0300
Message-Id: <20221229181135.270661-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229181135.270661-1-dbarboza@ventanamicro.com>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
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
X-List-Received-Date: Thu, 29 Dec 2022 18:12:04 -0000

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
index ad196f0fe4..8583732e4e 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -206,9 +206,10 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
     exit(1);
 }
 
-hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
-                         uint64_t kernel_entry, hwaddr *start)
+void riscv_load_initrd(const char *filename, uint64_t mem_size,
+                       uint64_t kernel_entry, void *fdt)
 {
+    hwaddr start, end;
     ssize_t size;
 
     g_assert(filename != NULL);
@@ -224,18 +225,23 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
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
index 004dfb2d5b..5668fe0694 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -316,14 +316,8 @@ static void spike_board_init(MachineState *machine)
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


