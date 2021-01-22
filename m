Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l2vaO-0005HM-Rx
	for mharc-qemu-riscv@gnu.org; Fri, 22 Jan 2021 07:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2vaF-0005G1-EA; Fri, 22 Jan 2021 07:30:37 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:50877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2va4-0003Xf-Ik; Fri, 22 Jan 2021 07:30:35 -0500
Received: by mail-pj1-x102a.google.com with SMTP id md11so3638073pjb.0;
 Fri, 22 Jan 2021 04:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zeMcL6viZY0Q1V/44xjgl0g19gB3FC4XI78gwryCkmc=;
 b=YuEN/lqMLFVf0qJUTN1K8QbnF1SqH/+DModJoUl9PlZcn1qGMIdWtojUXERKVeO6b4
 JWWX6M7xPwDSgcgQIJ9tEK9xr4yLz8HRbSAugCDjaWuT2vHbxC1L7QiL3ipkZHWRkDMm
 Nz85Vu/UZrtkgXHTcO5W+u2z++hT0F0ke3Qt6+5WfYRVvItffCBvMaKYTsq5ifFJiXbv
 080hCmF6yQWGrQYY6eiFsLONliM+9vFTh8/Lz68RI1/oreQYuXTtoCBDtEBYeoL6bRmW
 y1Q/6Yec76F+JGsWBK8TxN4XT5+PMWME/tMl4g06shVNVBNuJhWntlVREG6CTJJavC2N
 p6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zeMcL6viZY0Q1V/44xjgl0g19gB3FC4XI78gwryCkmc=;
 b=NqMsLQd6NnauX08174tM+uy6ivz098E1TSLr1wEkQCNTfcda2xaPNkJf+Yc6d+7F4D
 24P+ev8x4uE+fKiuGlbpNSuQ55cxkuMZbJUa33xVTWWHhCl96PKjUTLwKuk5Q4R+HrFN
 LuUL7QJuoFUAcRI1PJ2lwr/9HAJiEJhNyDFAIgs7UPxbSzanqo/m1vI6cA9r5AfYSAmz
 pz1C2CQExVwFlEZzE2WJ+t4Fqrgb2a5kgJzqxXAhG/RYKJkEfDT+LJU6BGeAkZ/vkl71
 c+fP8td+/0YPb8/VkRn5EvOXhvf01X/75fvvCEdio7Hss+6U/CzdSemAi/j6CeDnlGIL
 +/Mw==
X-Gm-Message-State: AOAM533+Did1LD0DFlzhMNgqp8qla+Iu6YcdAJYzAQYexoaV/+eNG0lt
 L6V3ZnRUe6Tg1i4mUr6z6bU=
X-Google-Smtp-Source: ABdhPJyHW2ZSTnpCVuH2P7bEfRGUHydq/krTFsDewtP3J2opZ0ZA1k3cFUr3XvqXa0EEwBtVfB2fag==
X-Received: by 2002:a17:90a:ce97:: with SMTP id
 g23mr5167568pju.224.1611318620113; 
 Fri, 22 Jan 2021 04:30:20 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id 6sm7894996pfd.212.2021.01.22.04.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 04:30:19 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 4/4] hw/riscv: virt: Map high mmio for PCIe
Date: Fri, 22 Jan 2021 20:29:58 +0800
Message-Id: <20210122122958.12311-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210122122958.12311-1-bmeng.cn@gmail.com>
References: <20210122122958.12311-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Fri, 22 Jan 2021 12:30:39 -0000

From: Bin Meng <bin.meng@windriver.com>

Some peripherals require 64-bit PCI address, so let's map the high
mmio space for PCIe.

For RV32, the address is hardcoded to below 4 GiB from the highest
accessible physical address. For RV64, the base address depends on
top of RAM and is aligned to its size which is using 16 GiB for now.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

 hw/riscv/virt.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4f44509360..4ab3b35cc7 100644
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
@@ -601,6 +623,14 @@ static void virt_machine_init(MachineState *machine)
             machine->ram_size = 10 * GiB;
             error_report("Limitting RAM size to 10 GiB");
         }
+
+        virt_high_pcie_memmap.base = VIRT32_HIGH_PCIE_MMIO_BASE;
+        virt_high_pcie_memmap.size = VIRT32_HIGH_PCIE_MMIO_SIZE;
+    } else {
+        virt_high_pcie_memmap.size = VIRT64_HIGH_PCIE_MMIO_SIZE;
+        virt_high_pcie_memmap.base = memmap[VIRT_DRAM].base + machine->ram_size;
+        virt_high_pcie_memmap.base =
+            ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
     }
 
     /* register system main memory (actual RAM) */
@@ -686,6 +716,8 @@ static void virt_machine_init(MachineState *machine)
                    memmap[VIRT_PCIE_ECAM].size,
                    memmap[VIRT_PCIE_MMIO].base,
                    memmap[VIRT_PCIE_MMIO].size,
+                   virt_high_pcie_memmap.base,
+                   virt_high_pcie_memmap.size,
                    memmap[VIRT_PCIE_PIO].base,
                    DEVICE(pcie_plic));
 
-- 
2.25.1


