Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngmYv-0003Lr-55
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 08:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1ngmYs-0003L6-P8; Tue, 19 Apr 2022 08:02:26 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:40256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1ngmYp-0002J5-Bz; Tue, 19 Apr 2022 08:02:25 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 23JC26CV019232;
 Tue, 19 Apr 2022 20:02:06 +0800 (+08)
 (envelope-from dylan@andestech.com)
Received: from atctrx.andestech.com (10.0.12.164) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Tue, 19 Apr 2022
 20:02:02 +0800
From: Dylan Jhong <dylan@andestech.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>, <bin.meng@windriver.com>,
 <alistair.francis@wdc.com>, <palmer@dabbelt.com>
CC: <alankao@andestech.com>, <locus84@andestech.com>, <x5710999x@gmail.com>,
 Dylan Jhong <dylan@andestech.com>
Subject: [PATCH] hw/riscv: boot: Support 64bit fdt address.
Date: Tue, 19 Apr 2022 19:59:45 +0800
Message-ID: <20220419115945.37945-1-dylan@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.12.164]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 23JC26CV019232
Received-SPF: pass client-ip=60.248.187.195; envelope-from=dylan@andestech.com;
 helo=Atcsqr.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Apr 2022 12:02:27 -0000

The current riscv_load_fdt() forces fdt_load_addr to be placed at a dram address within 3GB,
but not all platforms have dram_base within 3GB.

This patch adds an exception for dram base not within 3GB,
which will place fdt at dram_end align 16MB.

riscv_setup_rom_reset_vec() also needs to be modified

Signed-off-by: Dylan Jhong <dylan@andestech.com>
---
 hw/riscv/boot.c         | 12 +++++++-----
 include/hw/riscv/boot.h |  4 ++--
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 519fa455a1..852aa92bbe 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -203,9 +203,9 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
     return *start + size;
 }
 
-uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
+uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
 {
-    uint32_t temp, fdt_addr;
+    uint64_t temp, fdt_addr;
     hwaddr dram_end = dram_base + mem_size;
     int ret, fdtsize = fdt_totalsize(fdt);
 
@@ -220,7 +220,7 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
      * Thus, put it at an 16MB aligned address that less than fdt size from the
      * end of dram or 3GB whichever is lesser.
      */
-    temp = MIN(dram_end, 3072 * MiB);
+    temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
     fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
 
     ret = fdt_pack(fdt);
@@ -276,13 +276,15 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
                                hwaddr start_addr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
-                               uint32_t fdt_load_addr, void *fdt)
+                               uint64_t fdt_load_addr, void *fdt)
 {
     int i;
     uint32_t start_addr_hi32 = 0x00000000;
+    uint32_t fdt_load_addr_hi32 = 0x00000000;
 
     if (!riscv_is_32bit(harts)) {
         start_addr_hi32 = start_addr >> 32;
+        fdt_load_addr_hi32 = fdt_load_addr >> 32;
     }
     /* reset vector */
     uint32_t reset_vec[10] = {
@@ -295,7 +297,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
         start_addr,                  /* start: .dword */
         start_addr_hi32,
         fdt_load_addr,               /* fdt_laddr: .dword */
-        0x00000000,
+        fdt_load_addr_hi32,
                                      /* fw_dyn: */
     };
     if (riscv_is_32bit(harts)) {
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index baff11dd8a..346441e369 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -48,12 +48,12 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
                                symbol_fn_t sym_cb);
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
                          uint64_t kernel_entry, hwaddr *start);
-uint32_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
+uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
-                               uint32_t fdt_load_addr, void *fdt);
+                               uint64_t fdt_load_addr, void *fdt);
 void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
                                   hwaddr rom_size,
                                   uint32_t reset_vec_size,
-- 
2.34.1


