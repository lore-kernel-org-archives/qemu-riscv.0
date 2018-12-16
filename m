Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gYfaj-00044X-G3
	for mharc-qemu-riscv@gnu.org; Sun, 16 Dec 2018 18:12:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sorear2@gmail.com>) id 1gYfae-0003qX-W8
	for qemu-riscv@nongnu.org; Sun, 16 Dec 2018 18:12:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sorear2@gmail.com>) id 1gYfad-0006AG-Dz
	for qemu-riscv@nongnu.org; Sun, 16 Dec 2018 18:12:52 -0500
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:45880)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sorear2@gmail.com>) id 1gYfad-00069w-8P
	for qemu-riscv@nongnu.org; Sun, 16 Dec 2018 18:12:51 -0500
Received: by mail-qt1-x843.google.com with SMTP id e5so12189828qtr.12
	for <qemu-riscv@nongnu.org>; Sun, 16 Dec 2018 15:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Mipw0kGmb8ChZPyL8/cZvbwPDpQ0q2C9nuzEmBMkHlc=;
	b=WORrw88H3e0fvySNPsVWz0/DcqpaxP0jUiBvjKStP8l7en8HIJfL5W7y/35iOeRp/w
	Ha7ZT8k4TT0k0qUmFGrgOc4KFwfmd0pAVUCUok5YHHzPngxO4+mREvsoTPSHPzqc+LK6
	mVgeUySzrAqBNC4pXxSH3jiJLBdumB3hU3eQdf1tQWDA3a7duW+I6zokWR6rc7+LWXAL
	vrMruiozClKRrzet95yJhjCYwn+hieV8H/sx488VPwq/gqvcIhJVtPHxEgbJwnDntFpH
	056TAYwkziT9c+MlBydKq8BA8HDm92f/nIY0Fa8wrhMwxqi0U3E+7ME4LsT/RzqzmeNr
	rHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Mipw0kGmb8ChZPyL8/cZvbwPDpQ0q2C9nuzEmBMkHlc=;
	b=Y7BlKf8Wwanq3RiQAH5Cete15FPtWnnE4LD+3Cd87vOZBmNHwCNmggb2thEQTyhasQ
	ToRUIpTbv5cS+MwU3icXCu7Otk5hESVbmWnpq4QwaEkYBsk1AqBUN7mYs0Un+7HmSshw
	uvygWyjRjjpQmG34tEPEzskfrLnAtVI7+1EVx0I2TEEFdKFkh/LWgTqzog3uXCLOokGC
	2WwpC366VOv5DhtY8qS9uJF6aYq9+L0l4PEE4olKq8T0Xqm+2xlkaqDNvreDncndst0b
	PIOKtOfsHWOiREh9z4VVB4iM/YcoDaBm0cnT11nHs+wVghJAWh2mpvL63vYxiDI2adDG
	tOCA==
X-Gm-Message-State: AA+aEWZkL3FZFBFUBRjeMBqqJhjNbmf6XYdulvLzoBSh3k7bgo3HFnUL
	Mjffz4ybu/lzTcQwkQ+6fs6qr0SUIqQ=
X-Google-Smtp-Source: AFSGD/W3IYOPLFGqE6YDW3oA498i7B8V+WrHfyzst0LPnpy+nL4YUNblpjzGHsoN9usLF1FH5WFUNw==
X-Received: by 2002:ac8:2bd4:: with SMTP id n20mr11244293qtn.172.1545001970576;
	Sun, 16 Dec 2018 15:12:50 -0800 (PST)
Received: from localhost.localdomain
	(209-6-78-127.s3965.c3-0.abr-cbr1.sbo-abr.ma.cable.rcncustomer.com.
	[209.6.78.127]) by smtp.gmail.com with ESMTPSA id
	e186sm5713451qkb.32.2018.12.16.15.12.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 16 Dec 2018 15:12:50 -0800 (PST)
From: Stefan O'Rear <sorear2@gmail.com>
To: qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan O'Rear <sorear2@gmail.com>
Date: Sun, 16 Dec 2018 18:12:24 -0500
Message-Id: <1545001947-29444-2-git-send-email-sorear2@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1545001947-29444-1-git-send-email-sorear2@gmail.com>
References: <1545001947-29444-1-git-send-email-sorear2@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::843
Subject: [Qemu-riscv] [PATCH v2 1/4] RISC-V: Move firmware loading logic to
 a separate file
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Dec 2018 23:12:56 -0000

Signed-off-by: Stefan O'Rear <sorear2@gmail.com>
---
 hw/riscv/Makefile.objs  |  1 +
 hw/riscv/boot.c         | 85 +++++++++++++++++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c         | 58 ++-------------------------------
 include/hw/riscv/boot.h | 24 ++++++++++++++
 4 files changed, 112 insertions(+), 56 deletions(-)
 create mode 100644 hw/riscv/boot.c
 create mode 100644 include/hw/riscv/boot.h

diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
index 1dde01d..d36b004 100644
--- a/hw/riscv/Makefile.objs
+++ b/hw/riscv/Makefile.objs
@@ -1,3 +1,4 @@
+obj-y += boot.o
 obj-y += riscv_htif.o
 obj-y += riscv_hart.o
 obj-y += sifive_e.o
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
new file mode 100644
index 0000000..1e4d017
--- /dev/null
+++ b/hw/riscv/boot.c
@@ -0,0 +1,85 @@
+/*
+ * QEMU RISCV firmware and kernel loader
+ *
+ * Copyright (c) 2017-2018 SiFive, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/error-report.h"
+#include "hw/loader.h"
+#include "hw/boards.h"
+#include "sysemu/device_tree.h"
+#include "elf.h"
+#include "hw/riscv/boot.h"
+
+static uint64_t load_kernel(const char *kernel_filename)
+{
+    uint64_t kernel_entry, kernel_high;
+
+    if (load_elf(kernel_filename, NULL, NULL,
+                 &kernel_entry, NULL, &kernel_high,
+                 0, EM_RISCV, 1, 0) < 0) {
+        error_report("could not load kernel '%s'", kernel_filename);
+        exit(1);
+    }
+    return kernel_entry;
+}
+
+static hwaddr load_initrd(const char *filename, uint64_t mem_size,
+                          uint64_t kernel_entry, hwaddr *start)
+{
+    int size;
+
+    /* We want to put the initrd far enough into RAM that when the
+     * kernel is uncompressed it will not clobber the initrd. However
+     * on boards without much RAM we must ensure that we still leave
+     * enough room for a decent sized initrd, and on boards with large
+     * amounts of RAM we must avoid the initrd being so far up in RAM
+     * that it is outside lowmem and inaccessible to the kernel.
+     * So for boards with less  than 256MB of RAM we put the initrd
+     * halfway into RAM, and for boards with 256MB of RAM or more we put
+     * the initrd at 128MB.
+     */
+    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
+
+    size = load_ramdisk(filename, *start, mem_size - *start);
+    if (size == -1) {
+        size = load_image_targphys(filename, *start, mem_size - *start);
+        if (size == -1) {
+            error_report("could not load ramdisk '%s'", filename);
+            exit(1);
+        }
+    }
+    return *start + size;
+}
+
+void riscv_load_firmware_kernel_initrd(MachineState *machine, void *fdt)
+{
+    if (machine->kernel_filename) {
+        uint64_t kernel_entry = load_kernel(machine->kernel_filename);
+
+        if (machine->initrd_filename) {
+            hwaddr start;
+            hwaddr end = load_initrd(machine->initrd_filename,
+                                     machine->ram_size, kernel_entry,
+                                     &start);
+            qemu_fdt_setprop_cell(fdt, "/chosen",
+                                  "linux,initrd-start", start);
+            qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
+                                  end);
+        }
+    }
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2b38f89..4c2e894 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -34,6 +34,7 @@
 #include "hw/riscv/sifive_plic.h"
 #include "hw/riscv/sifive_clint.h"
 #include "hw/riscv/sifive_test.h"
+#include "hw/riscv/boot.h"
 #include "hw/riscv/virt.h"
 #include "chardev/char.h"
 #include "sysemu/arch_init.h"
@@ -57,47 +58,6 @@ static const struct MemmapEntry {
     [VIRT_DRAM] =     { 0x80000000,        0x0 },
 };
 
-static uint64_t load_kernel(const char *kernel_filename)
-{
-    uint64_t kernel_entry, kernel_high;
-
-    if (load_elf(kernel_filename, NULL, NULL,
-                 &kernel_entry, NULL, &kernel_high,
-                 0, EM_RISCV, 1, 0) < 0) {
-        error_report("could not load kernel '%s'", kernel_filename);
-        exit(1);
-    }
-    return kernel_entry;
-}
-
-static hwaddr load_initrd(const char *filename, uint64_t mem_size,
-                          uint64_t kernel_entry, hwaddr *start)
-{
-    int size;
-
-    /* We want to put the initrd far enough into RAM that when the
-     * kernel is uncompressed it will not clobber the initrd. However
-     * on boards without much RAM we must ensure that we still leave
-     * enough room for a decent sized initrd, and on boards with large
-     * amounts of RAM we must avoid the initrd being so far up in RAM
-     * that it is outside lowmem and inaccessible to the kernel.
-     * So for boards with less  than 256MB of RAM we put the initrd
-     * halfway into RAM, and for boards with 256MB of RAM or more we put
-     * the initrd at 128MB.
-     */
-    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
-
-    size = load_ramdisk(filename, *start, mem_size - *start);
-    if (size == -1) {
-        size = load_image_targphys(filename, *start, mem_size - *start);
-        if (size == -1) {
-            error_report("could not load ramdisk '%s'", filename);
-            exit(1);
-        }
-    }
-    return *start + size;
-}
-
 static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     uint64_t mem_size, const char *cmdline)
 {
@@ -301,21 +261,7 @@ static void riscv_virt_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
                                 mask_rom);
 
-    if (machine->kernel_filename) {
-        uint64_t kernel_entry = load_kernel(machine->kernel_filename);
-
-        if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end = load_initrd(machine->initrd_filename,
-                                     machine->ram_size, kernel_entry,
-                                     &start);
-            qemu_fdt_setprop_cell(fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
-                                  end);
-        }
-    }
-
+    riscv_load_firmware_kernel_initrd(machine, fdt);
     /* reset vector */
     uint32_t reset_vec[8] = {
         0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) */
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
new file mode 100644
index 0000000..92948f3
--- /dev/null
+++ b/include/hw/riscv/boot.h
@@ -0,0 +1,24 @@
+/*
+ * QEMU RISCV firmware and kernel loader interface
+ *
+ * Copyright (c) 2017-2018 SiFive, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_RISCV_BOOT_H
+#define HW_RISCV_BOOT_H
+
+void riscv_load_firmware_kernel_initrd(MachineState *machine, void *fdt);
+
+#endif
-- 
2.8.0


