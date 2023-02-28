Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWuhP-0007Mo-0R
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 02:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWuhG-0007LS-Hs; Tue, 28 Feb 2023 02:46:51 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWuhD-0000Ji-UM; Tue, 28 Feb 2023 02:46:49 -0500
X-QQ-mid: bizesmtp66t1677570391tlvb54im
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 28 Feb 2023 15:46:29 +0800 (CST)
X-QQ-SSF: 01200000000000D0E000000A0000000
X-QQ-FEAT: 86xnumbl2QyMeHDDFnFKwrOMi9WaprPMZ6E96eVNHm5gijbPNxE5x/OqHAAe1
 Y2eWE20Hf418RyKRbT+uMN9pMklku09E9KJwBCLwTBjDGpEf+FwpG7L1dOSoUqdD7qYI2pv
 NWcSOAjQYfkIb4RXDgQ7b5bdpOjPhxIXz6VNit0pV7VyV2B0yv9NjnfPHqEsYis9Ho+dk4G
 425V1VnpWGkvDO/liJcvYyO70lVtcXSDKqDRS5UJHbjWfkbDqTzPlIOIQvVj0Km7otAU6zA
 iA/+kVhZc6TFBhpOSJW9TtCUdcgod7m1ZGv23tveAUj25HZ+YmuKpCCHyy783qupfjcD1+9
 uyAeBupgynOoptY8Im3pBM69nmskxd4n7r+jgPICl/+zLiiEy8=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 2/2] hw/riscv: Move the dtb load bits outside of
 create_fdt()
Date: Tue, 28 Feb 2023 15:45:22 +0800
Message-Id: <20230228074522.1845007-2-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230228074522.1845007-1-bmeng@tinylab.org>
References: <20230228074522.1845007-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Feb 2023 07:46:57 -0000

Move the dtb load bits outside of create_fdt(), and put it explicitly
in sifive_u_machine_init() and virt_machine_init(). With such change
create_fdt() does exactly what its function name tells us.

Suggested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

Changes in v2:
- new patch: Move the dtb load bits outside of create_fdt()

 include/hw/riscv/sifive_u.h |  1 +
 hw/riscv/sifive_u.c         | 31 +++++++++++++++----------------
 hw/riscv/virt.c             | 29 ++++++++++++++---------------
 3 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 65af306963..0696f85942 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -68,6 +68,7 @@ typedef struct SiFiveUState {
 
     /*< public >*/
     SiFiveUSoCState soc;
+    int fdt_size;
 
     bool start_in_flash;
     uint32_t msel;
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 76db5ed3dd..35a335b8d0 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -99,7 +99,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     MachineState *ms = MACHINE(s);
     uint64_t mem_size = ms->ram_size;
     void *fdt;
-    int cpu, fdt_size;
+    int cpu;
     uint32_t *cells;
     char *nodename;
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
@@ -112,19 +112,10 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         "sifive,plic-1.0.0", "riscv,plic0"
     };
 
-    if (ms->dtb) {
-        fdt = ms->fdt = load_device_tree(ms->dtb, &fdt_size);
-        if (!fdt) {
-            error_report("load_device_tree() failed");
-            exit(1);
-        }
-        return;
-    } else {
-        fdt = ms->fdt = create_device_tree(&fdt_size);
-        if (!fdt) {
-            error_report("create_device_tree() failed");
-            exit(1);
-        }
+    fdt = ms->fdt = create_device_tree(&s->fdt_size);
+    if (!fdt) {
+        error_report("create_device_tree() failed");
+        exit(1);
     }
 
     qemu_fdt_setprop_string(fdt, "/", "model", "SiFive HiFive Unleashed A00");
@@ -561,8 +552,16 @@ static void sifive_u_machine_init(MachineState *machine)
     qdev_connect_gpio_out(DEVICE(&(s->soc.gpio)), 10,
                           qemu_allocate_irq(sifive_u_machine_reset, NULL, 0));
 
-    /* create device tree */
-    create_fdt(s, memmap, riscv_is_32bit(&s->soc.u_cpus));
+    /* load/create device tree */
+    if (machine->dtb) {
+        machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
+        if (!machine->fdt) {
+            error_report("load_device_tree() failed");
+            exit(1);
+        }
+    } else {
+        create_fdt(s, memmap, riscv_is_32bit(&s->soc.u_cpus));
+    }
 
     if (s->start_in_flash) {
         /*
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 0c7b4a1e46..53ed2e8369 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1008,19 +1008,10 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
     uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
     uint8_t rng_seed[32];
 
-    if (ms->dtb) {
-        ms->fdt = load_device_tree(ms->dtb, &s->fdt_size);
-        if (!ms->fdt) {
-            error_report("load_device_tree() failed");
-            exit(1);
-        }
-        return;
-    } else {
-        ms->fdt = create_device_tree(&s->fdt_size);
-        if (!ms->fdt) {
-            error_report("create_device_tree() failed");
-            exit(1);
-        }
+    ms->fdt = create_device_tree(&s->fdt_size);
+    if (!ms->fdt) {
+        error_report("create_device_tree() failed");
+        exit(1);
     }
 
     qemu_fdt_setprop_string(ms->fdt, "/", "model", "riscv-virtio,qemu");
@@ -1505,8 +1496,16 @@ static void virt_machine_init(MachineState *machine)
     }
     virt_flash_map(s, system_memory);
 
-    /* create device tree */
-    create_fdt(s, memmap);
+    /* load/create device tree */
+    if (machine->dtb) {
+        machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
+        if (!machine->fdt) {
+            error_report("load_device_tree() failed");
+            exit(1);
+        }
+    } else {
+        create_fdt(s, memmap);
+    }
 
     s->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&s->machine_done);
-- 
2.25.1


