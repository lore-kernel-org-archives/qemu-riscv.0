Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hRlHS-00053U-NQ
	for mharc-qemu-riscv@gnu.org; Fri, 17 May 2019 18:24:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39650)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from
	<bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
	id 1hRlHQ-000523-BM
	for qemu-riscv@nongnu.org; Fri, 17 May 2019 18:24:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from
	<bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
	id 1hRlHO-0005H7-Dk
	for qemu-riscv@nongnu.org; Fri, 17 May 2019 18:24:44 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:13165)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from
	<bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
	id 1hRlHM-00057I-F9
	for qemu-riscv@nongnu.org; Fri, 17 May 2019 18:24:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
	s=pic; 
	t=1558131880; h=Content-Transfer-Encoding: MIME-Version: References:
	In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
	bh=iohKwGufi59hXWHsbHK+51hcgAi38+IJdNnY6To9p50=;
	b=lMvYKFxS1cUV9T7cLM/mr+0zNU8gHf24HiyX3vL7qceJbbjKFv/4MQ+KAuymV3WK/SHhzMXW
	U4nzPJXAGhqksrOEYFEvVpl+L/qtT5ISXIv+ccUSF7h9mUWdC0YYMjKkMSOP+2c2OJ5ui5i0
	d66Cz1uJMgh9yaXzM7ooje5AXtYq8Nc/ZL22ZkB4+dMbyYLOYtC9xrJkZTVApmdt42mRxRwB
	KyBPDxjEBCRUG2VMQ6GFcvNIsi7X8PIkBJIyBsK+L/cCPSIy6D1YEYgkiSVTSDZk7d8v0skd
	4vKd/VZQu/OQ+WI51UKimWGR1gBqOk8Vs/tJ75BGS0e2DIxlkg4Q5w==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from jonathan-ThinkPad-X1-Carbon.csail.mit.edu
	(30-9-187.wireless.csail.mit.edu [128.30.9.187])
	by mxa.mailgun.org with ESMTP id 5cdf34a7.7ff77a124cb0-smtp-out-n01;
	Fri, 17 May 2019 22:24:39 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jonathan Behrens <fintelia@gmail.com>, Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Jonathan Behrens <jonathan@fintelia.io>
Date: Fri, 17 May 2019 18:23:41 -0400
Message-Id: <20190517222342.26394-2-jonathan@fintelia.io>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190517222342.26394-1-jonathan@fintelia.io>
References: <20190517222342.26394-1-jonathan@fintelia.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Subject: [Qemu-riscv] [PATCH for-4.1 1/2] target/riscv: virt machine
 shouldn't assume ELF entry is DRAM base
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
X-List-Received-Date: Fri, 17 May 2019 22:24:45 -0000

There are two components of this:

* The reset vector now uses the ELF entry point instead of the DRAM base
  address.
* Initrd now uses the DRAM base address to figure out the half way point of
  RAM. This is more in line with the comment in load_initrd, but an alternative
  strategy would be to somehow use the kernel_high address in that computation
  instead.

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
---
 hw/riscv/virt.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index fc4c6b306e..87cc08016b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -64,10 +64,10 @@ static const struct MemmapEntry {
 
 static target_ulong load_kernel(const char *kernel_filename)
 {
-    uint64_t kernel_entry, kernel_high;
+    uint64_t kernel_entry;
 
     if (load_elf(kernel_filename, NULL, NULL, NULL,
-                 &kernel_entry, NULL, &kernel_high,
+                 &kernel_entry, NULL, NULL,
                  0, EM_RISCV, 1, 0) < 0) {
         error_report("could not load kernel '%s'", kernel_filename);
         exit(1);
@@ -75,8 +75,8 @@ static target_ulong load_kernel(const char *kernel_filename)
     return kernel_entry;
 }
 
-static hwaddr load_initrd(const char *filename, uint64_t mem_size,
-                          uint64_t kernel_entry, hwaddr *start)
+static uint64_t load_initrd(const char *filename, uint64_t mem_base,
+                            uint64_t mem_size, uint64_t *start)
 {
     int size;
 
@@ -85,12 +85,12 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
      * on boards without much RAM we must ensure that we still leave
      * enough room for a decent sized initrd, and on boards with large
      * amounts of RAM we must avoid the initrd being so far up in RAM
-     * that it is outside lowmem and inaccessible to the kernel.
-     * So for boards with less  than 256MB of RAM we put the initrd
-     * halfway into RAM, and for boards with 256MB of RAM or more we put
-     * the initrd at 128MB.
+     * that it is outside lowmem and inaccessible to the kernel. So
+     * for boards with less than 256MB of RAM we put the initrd
+     * halfway into RAM, and for boards with 256MB of RAM or more we
+     * put the initrd at 128MB.
      */
-    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
+    *start = mem_base + MIN(mem_size / 2, 128 * MiB);
 
     size = load_ramdisk(filename, *start, mem_size - *start);
     if (size == -1) {
@@ -422,14 +422,15 @@ static void riscv_virt_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
                                 mask_rom);
 
+    uint64_t entry = memmap[VIRT_DRAM].base;
     if (machine->kernel_filename) {
-        uint64_t kernel_entry = load_kernel(machine->kernel_filename);
+        entry = load_kernel(machine->kernel_filename);
 
         if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end = load_initrd(machine->initrd_filename,
-                                     machine->ram_size, kernel_entry,
-                                     &start);
+            uint64_t start;
+            uint64_t end = load_initrd(machine->initrd_filename,
+                                       memmap[VIRT_DRAM].base, machine->ram_size,
+                                       &start);
             qemu_fdt_setprop_cell(fdt, "/chosen",
                                   "linux,initrd-start", start);
             qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
@@ -449,8 +450,8 @@ static void riscv_virt_board_init(MachineState *machine)
 #endif
         0x00028067,                  /*     jr     t0 */
         0x00000000,
-        memmap[VIRT_DRAM].base,      /* start: .dword memmap[VIRT_DRAM].base */
-        0x00000000,
+        entry & 0xffffffff,          /* start: .qword entry */
+        entry >> 32,
                                      /* dtb: */
     };
 
-- 
2.20.1

