Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p83kb-00089C-Q6
	for mharc-qemu-riscv@gnu.org; Wed, 21 Dec 2022 13:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kb-00088p-3K
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:33 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kZ-0007qH-9v
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:32 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-14449b7814bso20154533fac.3
 for <qemu-riscv@nongnu.org>; Wed, 21 Dec 2022 10:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nAtAM5x8S/ZPGivdQ7BsLDTU3Z8ReHOtMwCvIqWKh0Y=;
 b=HBlwcVDu9iVFKTK4tBYWOyBFAzl4mCuCo4VjFvK4Ej7pIgqYlQePhGSTysiOhU1Q80
 8mU/8Rl1okoeSJGkJw8zyIOv1iNaI1qgAMFY2MN9EYUzL/9Fu9kuS62Odq67YkhbPgGS
 sI0Lg/xBjfSk0pndkctCqzeFgmdU9MkEZDcQR0PQtIPNhjBV+DGNf8rqNw7qcbyiFFb/
 Cl9Qwol99kErlqOrMQHIWT8cGpU0oCr4LQELAgOICuWiHJLkEcyCLWeBkoS5zkDUIUQO
 UpOBk8Aneh1Bgufhd3HWbmdCMoA1cJIECfIDgyht0dWzojWlYa3jYDLvjEc5pZE4NnWh
 +EGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nAtAM5x8S/ZPGivdQ7BsLDTU3Z8ReHOtMwCvIqWKh0Y=;
 b=4lF8ZMdoo7c+0XzBuLI0DDF7LyQvzozYOb2fuwF2ajAJ2qL7lSNXLHLcOQlAHj9hYY
 FmgdUSxiur9AUHFE8HXt4n/6LbKTGkj7Rt6Zx97cSEZ+fz22Z3HOWomkPH8YPs+zFIFP
 vhN6gcPydflP+mnBgCtKWJ7eQwzrRVRz0GeU0zZ5LkojToCBBwhVb7cktO8p2bztxMOO
 y3+daYkufJcN6pW7SsJ9AaJgs5QsoHv4y6438UtHZQG3Sbr00jYCyXDCgTX0HlF5Hc3o
 qEZz321q4QAhEIiYXpASHWL2y5Jqy/8siycD8n4uyGzDDz/NR90s+URrtYJqt7CMQYHF
 OXhQ==
X-Gm-Message-State: AFqh2krmCJI9Kn5CE6rlzz1Z4+3IjbED9BulJ5lSdoG340fJ1L62GsS2
 9mbhwxVlbzGkz9gIOEDNBgO+YQ==
X-Google-Smtp-Source: AMrXdXuvfgsL9oFlrVso2wugD5+Ec2rd4GgEgZPhkgYnPuyyxL00s43vD2mkFmrHtmM3LNVpK8PNVg==
X-Received: by 2002:a05:6871:468f:b0:144:870e:5859 with SMTP id
 ni15-20020a056871468f00b00144870e5859mr6715908oab.57.1671647010563; 
 Wed, 21 Dec 2022 10:23:30 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:30 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 07/15] hw/riscv: write initrd 'chosen' FDT inside
 riscv_load_initrd()
Date: Wed, 21 Dec 2022 15:22:52 -0300
Message-Id: <20221221182300.307900-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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
X-List-Received-Date: Wed, 21 Dec 2022 18:23:33 -0000

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
---
 hw/riscv/boot.c            | 18 ++++++++++++------
 hw/riscv/microchip_pfsoc.c | 10 ++--------
 hw/riscv/sifive_u.c        | 10 ++--------
 hw/riscv/spike.c           | 10 ++--------
 hw/riscv/virt.c            | 10 ++--------
 include/hw/riscv/boot.h    |  4 ++--
 6 files changed, 22 insertions(+), 40 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index e1a544b1d9..8aed803d8c 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -193,9 +193,10 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
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
@@ -209,18 +210,23 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
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
index f37a9bebbf..e08de61205 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -281,14 +281,8 @@ static void spike_board_init(MachineState *machine)
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
index 60cf320c88..6f4c606edc 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -44,8 +44,8 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
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


