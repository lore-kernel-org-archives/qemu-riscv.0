Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lD7sl-0000Pj-Km
	for mharc-qemu-riscv@gnu.org; Fri, 19 Feb 2021 10:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lD7sh-0000Lq-DS; Fri, 19 Feb 2021 10:39:47 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lD7se-0008Qq-JM; Fri, 19 Feb 2021 10:39:47 -0500
Received: by mail-ej1-x62f.google.com with SMTP id g5so14239307ejt.2;
 Fri, 19 Feb 2021 07:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5sgojbwknwegM5rdWeI9P72ym0q49TeKTS3uF5AnARY=;
 b=RFXWheITJ3vdxNIzb4mVYDefidGoKiJmrzEu9BnStGFOSEi9I+3yhYK8XqOSUxA9/H
 GjuS6ZeBRgOuJCkyND1+VB0AKGk20YNKDizC8Q+zPB/Sm6T8d0eFsga4TSznM+fO/o86
 PIXvVxoFiX68/xq4epnTnl+v38TVvUra07SB0QI6XCOt4HUqECtSWuqtDIR0PaHhr1Vu
 RPC0KTLpEzh/SWaBivzDVllAx1cpvET207lyg4UO91Gn/XXWfNohwKN4HjtVSe6cAMrs
 THeo92HUZ/pM+eIY1ntYv6ifcj+VGSHbHsWFX7snZl4xqqwefKRMQHcy2ZSfHWLIigbA
 EAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5sgojbwknwegM5rdWeI9P72ym0q49TeKTS3uF5AnARY=;
 b=Yn7WyySec1hbSg4Wh2bub17ABUKtsoKEmrsFnomquf72cNUzZqpDqoxGUjVvwDhWYc
 6l1rEaI9xtmmjhDF7QFIjlmnrvd8chZbF/taANVOpa4R+2fjFvyA2L57ScCqhkycWJlU
 q4kHAcUtvdn6wyxt173Qimr8hLuqrP2CQWNQrCWkLAr45uvm64gyxH9kQH8IkHDIaYt3
 v82svmOVEaybGJSj/psjgN90HAffDNycDp34x2Tc6cI/vzZ1RHuzcu0v95JZmT3lvkYB
 mJ2CizbflNIA9rWsHsaCnSbzkbA023RkwWvFCXYou1a9jG/eR6ftUlso/wFgiV7vI5Ah
 PQWw==
X-Gm-Message-State: AOAM531mT4EBpg9Yw3ax1mvnu6EeDJbMUcB6NTzHprXbbrkEnlEXgpw5
 FdZPee1PS9dZwfnBgIhsDcREhqzaLFQ=
X-Google-Smtp-Source: ABdhPJwGgrt8PZuuwijNy+3+voYilP3EDkqgn7Wt5EuSaXl2Xgm4eZqFvarlAXr90YZY0hPYewJREw==
X-Received: by 2002:a17:906:f0c3:: with SMTP id
 dk3mr9207844ejb.540.1613749182159; 
 Fri, 19 Feb 2021 07:39:42 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id t9sm4580314ejc.51.2021.02.19.07.39.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 07:39:41 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 4/4] hw/riscv: virt: Map high mmio for PCIe
Date: Fri, 19 Feb 2021 23:39:15 +0800
Message-Id: <1613749155-84250-5-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613749155-84250-1-git-send-email-bmeng.cn@gmail.com>
References: <1613749155-84250-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 19 Feb 2021 15:39:47 -0000

From: Bin Meng <bin.meng@windriver.com>

Some peripherals require 64-bit PCI address, so let's map the high
mmio space for PCIe.

For RV32, the address is hardcoded to below 4 GiB from the highest
accessible physical address. For RV64, the base address depends on
top of RAM and is aligned to its size which is using 16 GiB for now.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

(no changes since v1)

 hw/riscv/virt.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index fc90bc8..972cdc2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -59,6 +59,15 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_DRAM] =        { 0x80000000,           0x0 },
 };
 
+/* PCIe high mmio is fixed for RV32 */
+#define VIRT32_HIGH_PCIE_MMIO_BASE  0x300000000ULL
+#define VIRT32_HIGH_PCIE_MMIO_SIZE  (4 * GiB)
+
+/* PCIe high mmio for RV64, size is fixed but base depends on top of RAM */
+#define VIRT64_HIGH_PCIE_MMIO_SIZE  (16 * GiB)
+
+static MemMapEntry virt_high_pcie_memmap;
+
 #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
 
 static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
@@ -371,7 +380,11 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
         2, memmap[VIRT_PCIE_PIO].base, 2, memmap[VIRT_PCIE_PIO].size,
         1, FDT_PCI_RANGE_MMIO,
         2, memmap[VIRT_PCIE_MMIO].base,
-        2, memmap[VIRT_PCIE_MMIO].base, 2, memmap[VIRT_PCIE_MMIO].size);
+        2, memmap[VIRT_PCIE_MMIO].base, 2, memmap[VIRT_PCIE_MMIO].size,
+        1, FDT_PCI_RANGE_MMIO_64BIT,
+        2, virt_high_pcie_memmap.base,
+        2, virt_high_pcie_memmap.base, 2, virt_high_pcie_memmap.size);
+
     create_pcie_irq_map(fdt, name, plic_pcie_phandle);
     g_free(name);
 
@@ -448,12 +461,14 @@ update_bootargs:
 static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                                           hwaddr ecam_base, hwaddr ecam_size,
                                           hwaddr mmio_base, hwaddr mmio_size,
+                                          hwaddr high_mmio_base,
+                                          hwaddr high_mmio_size,
                                           hwaddr pio_base,
                                           DeviceState *plic)
 {
     DeviceState *dev;
     MemoryRegion *ecam_alias, *ecam_reg;
-    MemoryRegion *mmio_alias, *mmio_reg;
+    MemoryRegion *mmio_alias, *high_mmio_alias, *mmio_reg;
     qemu_irq irq;
     int i;
 
@@ -473,6 +488,13 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                              mmio_reg, mmio_base, mmio_size);
     memory_region_add_subregion(get_system_memory(), mmio_base, mmio_alias);
 
+    /* Map high MMIO space */
+    high_mmio_alias = g_new0(MemoryRegion, 1);
+    memory_region_init_alias(high_mmio_alias, OBJECT(dev), "pcie-mmio-high",
+                             mmio_reg, high_mmio_base, high_mmio_size);
+    memory_region_add_subregion(get_system_memory(), high_mmio_base,
+                                high_mmio_alias);
+
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, pio_base);
 
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
@@ -598,6 +620,13 @@ static void virt_machine_init(MachineState *machine)
             error_report("Limitting RAM size to 10 GiB");
         }
 #endif
+        virt_high_pcie_memmap.base = VIRT32_HIGH_PCIE_MMIO_BASE;
+        virt_high_pcie_memmap.size = VIRT32_HIGH_PCIE_MMIO_SIZE;
+    } else {
+        virt_high_pcie_memmap.size = VIRT64_HIGH_PCIE_MMIO_SIZE;
+        virt_high_pcie_memmap.base = memmap[VIRT_DRAM].base + machine->ram_size;
+        virt_high_pcie_memmap.base =
+            ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
     }
 
     /* register system main memory (actual RAM) */
@@ -683,6 +712,8 @@ static void virt_machine_init(MachineState *machine)
                    memmap[VIRT_PCIE_ECAM].size,
                    memmap[VIRT_PCIE_MMIO].base,
                    memmap[VIRT_PCIE_MMIO].size,
+                   virt_high_pcie_memmap.base,
+                   virt_high_pcie_memmap.size,
                    memmap[VIRT_PCIE_PIO].base,
                    DEVICE(pcie_plic));
 
-- 
2.7.4


