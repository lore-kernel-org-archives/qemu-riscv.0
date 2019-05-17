Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hRlHd-0005A5-FV
	for mharc-qemu-riscv@gnu.org; Fri, 17 May 2019 18:24:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39731)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from
	<bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
	id 1hRlHa-00057a-ON
	for qemu-riscv@nongnu.org; Fri, 17 May 2019 18:24:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from
	<bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
	id 1hRlHZ-0005NZ-IT
	for qemu-riscv@nongnu.org; Fri, 17 May 2019 18:24:54 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:13165)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from
	<bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
	id 1hRlHZ-00057I-1O
	for qemu-riscv@nongnu.org; Fri, 17 May 2019 18:24:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
	s=pic; 
	t=1558131893; h=Content-Transfer-Encoding: MIME-Version: References:
	In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
	bh=VH93TOUnG/HUHSJvTDoKgECjsrun7twRUpDzD4oM7xA=;
	b=he2HQCQwJcztcd9gCg5LalpARq35A5yDzU13bzPd4JZyfjpFOmKBzaVshUfcQQJD7kgwY+mu
	eoq7E1y77xylulghms0IzJwSjTvF8370o7acmeOFYnqpz6Kne4tW7R/0jFcVE5x/yG+HG/8G
	QCjGupDFsOoZ13D+tt5L9mebVYM4FBbYWZAJrYDWFuOfn25Illk/ZMuFDjO1wRcIqNXkn18I
	6xD+iSZ//mGVLWfYOr9EfPba8+3+aOTkgZI566hWx8iNlbQnjtj7VIRLL7pRjMn9NS7TPotJ
	jeonNx3qUjEFj+hKdAriyRzRjCHrpsELezEwJtXHEWFt/7xPsLsOiQ==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from jonathan-ThinkPad-X1-Carbon.csail.mit.edu
	(30-9-187.wireless.csail.mit.edu [128.30.9.187])
	by mxa.mailgun.org with ESMTP id 5cdf34b0.7ff77a124cb0-smtp-out-n01;
	Fri, 17 May 2019 22:24:48 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jonathan Behrens <fintelia@gmail.com>, Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Jonathan Behrens <jonathan@fintelia.io>
Date: Fri, 17 May 2019 18:23:42 -0400
Message-Id: <20190517222342.26394-3-jonathan@fintelia.io>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190517222342.26394-1-jonathan@fintelia.io>
References: <20190517222342.26394-1-jonathan@fintelia.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Subject: [Qemu-riscv] [PATCH for-4.1 2/2] target/riscv: Add support for
 -bios "firmware_filename" flag
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
X-List-Received-Date: Fri, 17 May 2019 22:24:56 -0000

QEMU does not have any default firmware for RISC-V. However, it isn't possible
to run a normal kernel binary without firmware. Thus it has previously been
necessary to compile the two together into a single binary to pass with the
-kernel flag. This patch allows passing separate firmware and kernel binaries by
passing both the -bios and -kernel flags.

This is based on a previously proposed patch by Michael Clark:
https://patchwork.kernel.org/patch/10419975/

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
---
 hw/riscv/virt.c | 66 ++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 55 insertions(+), 11 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 87cc08016b..d7b1792b58 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -62,6 +62,40 @@ static const struct MemmapEntry {
     [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
 };
 
+
+static target_ulong load_firmware_and_kernel(const char *firmware_filename,
+                                             const char *kernel_filename,
+                                             uint64_t mem_size,
+                                             uint64_t* kernel_start,
+                                             uint64_t* kernel_end)
+{
+    uint64_t firmware_entry, firmware_end;
+    int size;
+
+    if (load_elf(firmware_filename, NULL, NULL, NULL,
+                 &firmware_entry, NULL, &firmware_end,
+                 0, EM_RISCV, 1, 0) < 0) {
+        error_report("could not load firmware '%s'", firmware_filename);
+        exit(1);
+    }
+
+    /* align kernel load address to the megapage after the firmware */
+#if defined(TARGET_RISCV32)
+    *kernel_start = (firmware_end + 0x3fffff) & ~0x3fffff;
+#else
+    *kernel_start = (firmware_end + 0x1fffff) & ~0x1fffff;
+#endif
+
+    size = load_image_targphys(kernel_filename, *kernel_start,
+                               mem_size - *kernel_start);
+    if (size == -1) {
+        error_report("could not load kernel '%s'", kernel_filename);
+        exit(1);
+    }
+    *kernel_end = *kernel_start + size;
+    return firmware_entry;
+}
+
 static target_ulong load_kernel(const char *kernel_filename)
 {
     uint64_t kernel_entry;
@@ -423,19 +457,29 @@ static void riscv_virt_board_init(MachineState *machine)
                                 mask_rom);
 
     uint64_t entry = memmap[VIRT_DRAM].base;
-    if (machine->kernel_filename) {
+    if (machine->firmware && machine->kernel_filename) {
+        uint64_t kernel_start, kernel_end;
+        entry = load_firmware_and_kernel(machine->firmware,
+                                         machine->kernel_filename,
+                                         machine->ram_size, &kernel_start,
+                                         &kernel_end);
+
+        qemu_fdt_setprop_cells(fdt, "/chosen", "riscv,kernel-end",
+                               kernel_end >> 32, kernel_end);
+        qemu_fdt_setprop_cells(fdt, "/chosen", "riscv,kernel-start",
+                               kernel_start >> 32, kernel_start);
+    } else if (machine->kernel_filename) {
         entry = load_kernel(machine->kernel_filename);
+    }
 
-        if (machine->initrd_filename) {
-            uint64_t start;
-            uint64_t end = load_initrd(machine->initrd_filename,
-                                       memmap[VIRT_DRAM].base, machine->ram_size,
-                                       &start);
-            qemu_fdt_setprop_cell(fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
-                                  end);
-        }
+    if (machine->kernel_filename && machine->initrd_filename) {
+        uint64_t start;
+        uint64_t end = load_initrd(machine->initrd_filename,
+                                   memmap[VIRT_DRAM].base, machine->ram_size,
+                                   &start);
+
+        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start", start);
+        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end", end);
     }
 
     /* reset vector */
-- 
2.20.1

