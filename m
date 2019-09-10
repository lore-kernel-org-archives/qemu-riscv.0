Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xvf-0007Kp-Ja
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvb-0007H7-Bk
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xva-0006LK-1U
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:39 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38073)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xvZ-0006L4-Rp
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:37 -0400
Received: by mail-wm1-f68.google.com with SMTP id o184so2375295wme.3
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=zWVv+FnKPyvG+WsnOHKMyhnpYZDoazGS6r9S2S4QveY=;
 b=JNuCvh7Z/fGGUMYJ4i7V0nTpjlfdwPyB/YidPJskgie7GyE0E8oqkpfdjTEFWYGR4N
 xHigZCLCdhfh0QA1S46TuMg7hNKGT2mSVwh2MvkakRG+XVols9PxvPO+DMVTmzv7tYgc
 mGaGT5wG4iNA3Q5e2VAIOn5q4lsLe6L0gOg57cbATi3qIY5tpg7X6tdcIBzc+Vrm/YGw
 9UKLf/WRvCoYfOEO5Z2unsoU6oIhq7QNs+fWVM2PWsO5xqY7NC9jm+veyuYskndwg69P
 wIHNQwmc7E881zd+6DLMlgRlZCJHCq0LTclRRRf8SRsSi9MFEaVQ5PXhszQRrGQ7Q29n
 zwxg==
X-Gm-Message-State: APjAAAXyNSwvv7sjZHguw0eqFXe1GdwpIAf7twUhavt5SX3/PNKwWJmE
 Piw/PTxwZrtBPL3r6DQDBPTYrXW+QwKjWg==
X-Google-Smtp-Source: APXvYqyvPPe8kEilSGxg/CqleuUCjQd9Y6GdhVqqdD96rOm0YdOCZLpLxNdrb2PGjGHI3pf6kCRODQ==
X-Received: by 2002:a1c:80c6:: with SMTP id b189mr3034042wmd.34.1568190276455; 
 Wed, 11 Sep 2019 01:24:36 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id d28sm24347828wrb.95.2019.09.11.01.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:24:35 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:27 -0700
Message-Id: <20190910190513.21160-2-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: [Qemu-riscv] [PULL 01/47] riscv: sifive_u: Add support for loading
 initrd
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
X-List-Received-Date: Wed, 11 Sep 2019 08:24:40 -0000

From: Guenter Roeck <linux@roeck-us.net>

Add support for loading initrd with "-initrd <filename>"
to the sifive_u machine. This lets us boot into Linux without
disk drive.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 9910fa6708..32167d05a1 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -67,7 +67,7 @@ static const struct MemmapEntry {
 
 #define GEM_REVISION        0x10070109
 
-static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
+static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     uint64_t mem_size, const char *cmdline)
 {
     void *fdt;
@@ -244,11 +244,14 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
     g_free(nodename);
+
+    return fdt;
 }
 
 static void riscv_sifive_u_init(MachineState *machine)
 {
     const struct MemmapEntry *memmap = sifive_u_memmap;
+    void *fdt;
 
     SiFiveUState *s = g_new0(SiFiveUState, 1);
     MemoryRegion *system_memory = get_system_memory();
@@ -269,13 +272,24 @@ static void riscv_sifive_u_init(MachineState *machine)
                                 main_mem);
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
+    fdt = create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
 
     riscv_find_and_load_firmware(machine, BIOS_FILENAME,
                                  memmap[SIFIVE_U_DRAM].base);
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine->kernel_filename);
+        uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename);
+
+        if (machine->initrd_filename) {
+            hwaddr start;
+            hwaddr end = riscv_load_initrd(machine->initrd_filename,
+                                           machine->ram_size, kernel_entry,
+                                           &start);
+            qemu_fdt_setprop_cell(fdt, "/chosen",
+                                  "linux,initrd-start", start);
+            qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
+                                  end);
+        }
     }
 
     /* reset vector */
-- 
2.21.0


