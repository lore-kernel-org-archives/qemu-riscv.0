Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbrq-0006D0-3H
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48875)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbrm-000699-Qf
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbrl-0006H2-J2
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:38 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42701)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbrl-0006GY-Dk
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:27:37 -0400
Received: by mail-pg1-f194.google.com with SMTP id z12so32545pgp.9
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=zWVv+FnKPyvG+WsnOHKMyhnpYZDoazGS6r9S2S4QveY=;
 b=Jm9Xbw6jLC9jfr5ZG+YZZoF2L/ZxsPJutY/1VYxlREquwTi2gJomrwLk0OUZN+OTJC
 Xj3yQpHO+sUZ1byrJv7rSEHAj/MbW9scHW/prQfqdcxi7QCV4m5n9nqweLGt/46JVaOB
 0bW1knuIgnRF3cX5mhsPymp/a39YK7qtBg5nyYLLX+0lJ5b7HSuzzih+dER0mbGh8Mo9
 Byvo2ruLwEcmFAuHZQhn/2M5Y3opneAbwSNLDiBFRszLSP6xlhevC4Oh4eoRpqGSf5TQ
 i36fsHeWJQWld/0j1c0uHYvAXGisHTeGz5QK5C3GURlDwIkh3w7t/VW/kSGjGExOaxbF
 HdQQ==
X-Gm-Message-State: APjAAAXV54IuFSp4ol+HgZAnQpnjpmIr6zWF8xmW+iBn+c9ZSPB3GoZB
 iDQi87dwdcDzI6/R4pVneguFj175OU8=
X-Google-Smtp-Source: APXvYqwutMHb/TsL3I7YFQdKWiY6FMLhd3l2gh1FG7WsfYHkIEh8Lcw2K5s9LtfQvpJQyuC5a39h+A==
X-Received: by 2002:a63:3f46:: with SMTP id m67mr4604917pga.146.1568820455927; 
 Wed, 18 Sep 2019 08:27:35 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id p88sm2711233pjp.22.2019.09.18.08.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:27:35 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:55:53 -0700
Message-Id: <20190918145640.17349-2-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.194
Subject: [Qemu-riscv] [PULL 01/48] riscv: sifive_u: Add support for loading
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
X-List-Received-Date: Wed, 18 Sep 2019 15:27:40 -0000

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


