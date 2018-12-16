Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gYfak-00044s-Jb
	for mharc-qemu-riscv@gnu.org; Sun, 16 Dec 2018 18:12:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sorear2@gmail.com>) id 1gYfai-00040v-BT
	for qemu-riscv@nongnu.org; Sun, 16 Dec 2018 18:12:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sorear2@gmail.com>) id 1gYfag-0006Bf-3I
	for qemu-riscv@nongnu.org; Sun, 16 Dec 2018 18:12:56 -0500
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:39021)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sorear2@gmail.com>) id 1gYfaf-0006BO-Sw
	for qemu-riscv@nongnu.org; Sun, 16 Dec 2018 18:12:53 -0500
Received: by mail-qt1-x843.google.com with SMTP id n21so12221509qtl.6
	for <qemu-riscv@nongnu.org>; Sun, 16 Dec 2018 15:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fsau2DafEfpES9G0XEux74EJjtpOC9tfH/7v1nt6d0s=;
	b=nxHZBDlLGt+uDaqQjFX5U0WxXalqGF0jPtiSbmBFteSvd5wDR7JpNn6rQSWC6Q37DW
	rNpGh7+r5ve8TevHhAcTjPM63JDd8sonbNOzcK6e8IiHZOXWN+D8lOqX/Olkf6qaRVg9
	3mBNwXH2LWejzQUhpsTxbmP7x3GlrIEgqsXXF/QPkIuex8jQLXZVyWAO4I8qhEU6aE7Q
	PFx8ll0Wb3oMrOLu4XrWatHx+rvIeRP0l3NLiZW6SVr8JB8T6TtbGTTLtoA6YRED2qUQ
	KDpk4oszVk1O2WNPm2muOc8TmX1cmPtsXqftBM1ExdX4SkNGo58/wNJq69CaefL9nTnj
	Mv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fsau2DafEfpES9G0XEux74EJjtpOC9tfH/7v1nt6d0s=;
	b=SSIT0EGiZkmn4FHQm1lsxWmbAGbQLjaIxvkUPJd5yQoj208r0XU81yTdkXjKwymq/0
	fQpm/KPsIjpErvGtzRwuAGZncLhVoo4H2BBxR2aLr7WjvHpxTHTEaNUSHGAcLReOSgFI
	/UhiSyare3+MTcx0I+Y7PhzWNYtsLerINbUkJ4R/6pUG11sKs5GCzWcu1AWBPCp94r7b
	xdQtGSvI4wgExL92zxBOFDuquZDHImczsKVzafX9pw5lCw6YnrQoUlhl765IhyB7v2N6
	rD/XCNBJOXm7fZqbj4c4JyqS7GRYojwNPKSVt/MxAnSmcxh4sCg52liNfdOvGUsIlPS1
	hFTA==
X-Gm-Message-State: AA+aEWbo4aGVEpZAcTXBFNZNaDs7+RkmnZpImewqfF0HRjsUzZuVz4i8
	ckAb+/aHT8EpFKlVO1O6fuCTb21I1hQ=
X-Google-Smtp-Source: AFSGD/UtucsMxioBzaJabgWZZsp2MvaYadc+JTmp0te7BGw6zDVwe8CmojhsiBM2Uad6I26OrWAHHA==
X-Received: by 2002:ac8:7950:: with SMTP id r16mr4828358qtt.12.1545001973347; 
	Sun, 16 Dec 2018 15:12:53 -0800 (PST)
Received: from localhost.localdomain
	(209-6-78-127.s3965.c3-0.abr-cbr1.sbo-abr.ma.cable.rcncustomer.com.
	[209.6.78.127]) by smtp.gmail.com with ESMTPSA id
	e186sm5713451qkb.32.2018.12.16.15.12.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 16 Dec 2018 15:12:52 -0800 (PST)
From: Stefan O'Rear <sorear2@gmail.com>
To: qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan O'Rear <sorear2@gmail.com>, Michael Clark <mjc@sifive.com>
Date: Sun, 16 Dec 2018 18:12:25 -0500
Message-Id: <1545001947-29444-3-git-send-email-sorear2@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1545001947-29444-1-git-send-email-sorear2@gmail.com>
References: <1545001947-29444-1-git-send-email-sorear2@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::843
Subject: [Qemu-riscv] [PATCH v2 2/4] RISC-V: refactor initrd loading
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
X-List-Received-Date: Sun, 16 Dec 2018 23:12:57 -0000

Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Stefan O'Rear <sorear2@gmail.com>
---
 hw/riscv/boot.c | 48 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 1e4d017..54e3139 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -25,6 +25,13 @@
 #include "elf.h"
 #include "hw/riscv/boot.h"
 
+#define RISCV_BOOT_DEBUG 0
+
+#define boot_debug(fs, ...) \
+    if (RISCV_BOOT_DEBUG) { \
+        fprintf(stderr, "boot: %s: "fs, __func__, ##__VA_ARGS__); \
+    }
+
 static uint64_t load_kernel(const char *kernel_filename)
 {
     uint64_t kernel_entry, kernel_high;
@@ -38,10 +45,10 @@ static uint64_t load_kernel(const char *kernel_filename)
     return kernel_entry;
 }
 
-static hwaddr load_initrd(const char *filename, uint64_t mem_size,
-                          uint64_t kernel_entry, hwaddr *start)
+static void riscv_load_initrd(const char *filename, uint64_t mem_size,
+                              hwaddr firmware_entry, void *fdt)
 {
-    int size;
+    uint64_t start, size;
 
     /* We want to put the initrd far enough into RAM that when the
      * kernel is uncompressed it will not clobber the initrd. However
@@ -53,33 +60,42 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
      * halfway into RAM, and for boards with 256MB of RAM or more we put
      * the initrd at 128MB.
      */
-    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
+    start = firmware_entry + MIN(mem_size / 2, 128 * MiB);
 
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
+
+    boot_debug("start=0x" TARGET_FMT_plx " end=0x" TARGET_FMT_plx "\n",
+               start, start + size);
+
+    /*
+     * pass initrd load address via device-tree to kernel
+     *
+     * linux-kernel reads the initrd address from device-tree
+     */
+    if (fdt) {
+        qemu_fdt_setprop_cells(fdt, "/chosen", "linux,initrd-end",
+                               (start + size) >> 32, start + size);
+        qemu_fdt_setprop_cells(fdt, "/chosen", "linux,initrd-start",
+                               start >> 32, start);
+    }
 }
 
 void riscv_load_firmware_kernel_initrd(MachineState *machine, void *fdt)
 {
     if (machine->kernel_filename) {
-        uint64_t kernel_entry = load_kernel(machine->kernel_filename);
+        uint64_t firmware_entry = load_kernel(machine->kernel_filename);
 
         if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end = load_initrd(machine->initrd_filename,
-                                     machine->ram_size, kernel_entry,
-                                     &start);
-            qemu_fdt_setprop_cell(fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
-                                  end);
+            /* load separate initrd */
+            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
+                              firmware_entry, fdt);
         }
     }
 }
-- 
2.8.0


