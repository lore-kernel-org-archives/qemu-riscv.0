Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWVP5-0000nq-09
	for mharc-qemu-riscv@gnu.org; Sun, 26 Feb 2023 23:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuhang@eswincomputing.com>)
 id 1pWTQq-0007CF-NM
 for qemu-riscv@nongnu.org; Sun, 26 Feb 2023 21:40:06 -0500
Received: from azure-sdnproxy.icoremail.net ([20.232.28.96])
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <xuhang@eswincomputing.com>) id 1pWTQi-0000lr-Td
 for qemu-riscv@nongnu.org; Sun, 26 Feb 2023 21:40:04 -0500
Received: from localhost.localdomain (unknown [10.12.130.32])
 by app2 (Coremail) with SMTP id EggMCgC3szbgF_xjMBkBAA--.127S4;
 Mon, 27 Feb 2023 10:39:29 +0800 (CST)
From: Hang Xu <xuhang@eswincomputing.com>
To: qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bmeng@tinylab.org, philmd@linaro.org,
 Hang Xu <xuhang@eswincomputing.com>
Subject: [PATCH] hw/riscv: Fix the bug of maximum size limit when put initrd
 to RAM
Date: Mon, 27 Feb 2023 02:39:16 +0000
Message-Id: <20230227023916.7374-1-xuhang@eswincomputing.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EggMCgC3szbgF_xjMBkBAA--.127S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGrWxXw4rJryDAr4kJFy7Wrg_yoWrZry8pF
 ZxCr4DZr1Fvrs3A3srKF1UurykXwn5Way5GF1xArsYgFs2gr48Jrs8X3WIv3yqyF4DAwn8
 ZFyqkryay3WFvrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAI
 w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
 4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
 rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
 CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
 z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: p0xkt03j6h245lqf0zpsxwx03jof0z/
Received-SPF: pass client-ip=20.232.28.96;
 envelope-from=xuhang@eswincomputing.com; helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 26 Feb 2023 23:46:22 -0500
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
X-List-Received-Date: Mon, 27 Feb 2023 02:40:06 -0000

The space available for initrd is "ram_size + ram_base - start"
instead of "ram_size - start"

Signed-off-by: Hang Xu <xuhang@eswincomputing.com>
---
 hw/riscv/boot.c            | 8 +++++---
 hw/riscv/microchip_pfsoc.c | 2 +-
 hw/riscv/sifive_u.c        | 2 +-
 hw/riscv/spike.c           | 2 +-
 hw/riscv/virt.c            | 2 +-
 include/hw/riscv/boot.h    | 3 ++-
 6 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index c7e0e50bd8..749dba5360 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -209,7 +209,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
     exit(1);
 }
 
-void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
+void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry,
+                       uint64_t mem_base)
 {
     const char *filename = machine->initrd_filename;
     uint64_t mem_size = machine->ram_size;
@@ -231,10 +232,11 @@ void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
      * the initrd at 128MB.
      */
     start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
+    uint64_t max_size = mem_size + mem_base - start;
 
-    size = load_ramdisk(filename, start, mem_size - start);
+    size = load_ramdisk(filename, start, max_size);
     if (size == -1) {
-        size = load_image_targphys(filename, start, mem_size - start);
+        size = load_image_targphys(filename, start, max_size);
         if (size == -1) {
             error_report("could not load ramdisk '%s'", filename);
             exit(1);
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 2b91e49561..965d155fd3 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -632,7 +632,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
+            riscv_load_initrd(machine, kernel_entry, memmap[MICROCHIP_PFSOC_DRAM_LO].base);
         }
 
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index d3ab7a9cda..aa5d5bc610 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -601,7 +601,7 @@ static void sifive_u_machine_init(MachineState *machine)
         kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
+            riscv_load_initrd(machine, kernel_entry, memmap[SIFIVE_U_DEV_DRAM].base);
         }
 
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index cc3f6dac17..729f6f91fd 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -309,7 +309,7 @@ static void spike_board_init(MachineState *machine)
                                          htif_symbol_callback);
 
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
+            riscv_load_initrd(machine, kernel_entry, memmap[SPIKE_DRAM].base);
         }
 
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b81081c70b..2342de646e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1280,7 +1280,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
         kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine, kernel_entry);
+            riscv_load_initrd(machine, kernel_entry, memmap[VIRT_DRAM].base);
         }
 
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 511390f60e..14db53ef13 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,7 +46,8 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
-void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
+void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry,
+                       uint64_t mem_base);
 uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
                                 MachineState *ms);
 void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
-- 
2.17.1


