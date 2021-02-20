Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lDTYn-0007HN-65
	for mharc-qemu-riscv@gnu.org; Sat, 20 Feb 2021 09:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDTYk-0007CO-Sc; Sat, 20 Feb 2021 09:48:38 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDTYj-0003cR-1m; Sat, 20 Feb 2021 09:48:38 -0500
Received: by mail-pj1-x1033.google.com with SMTP id my11so5174810pjb.1;
 Sat, 20 Feb 2021 06:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PhZTMUwjoq80zLn5T9J9Vyn2H21mn4uZhhWc8FpCttQ=;
 b=bXf5u/Yzo67BYVbTkuhFAzmRhCXsEN+DshFeeX0q3NEUUm1WesY1ry3ifYAO1uOWI9
 CFqWbEuSbELBOUzDMOQ5HCo3Ezqg1Rx2KxTvTAt8W8Trcco6kg1QaQdq1ALkBRtlv5ug
 sTf01JLjdPPluNSFZOozDV8Lsgwg3jCxzWkS5tMqrWQtDblH77dApqLlj3xlIBzALltK
 83qAkmZuO37MNx8pII6aUatxT2PG+KnIdHJDHz8ZESo8upHbTzSlhCEiHCjz1Q7TvjBw
 6j6J86cr4ihpe+9sbfgEFp/hLyoU1scR7nb0WNq0KQZdLyu/pV4NyFbg+trkVBikTI28
 mTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PhZTMUwjoq80zLn5T9J9Vyn2H21mn4uZhhWc8FpCttQ=;
 b=Dd33O1+DX+9k0AZC6nVNBlvUEh8FfTkbPfWzNIe/aO9WVlZ2dZNaKh15jGghlgGhW0
 ybipkz9D1PJgrrlwResedRC9PHNqEbxAVmlj/qX7MgUSmmGkUzC4W3vUlWczD+2jMxEJ
 cpY5XDtl4Lq7uuqLs29C7ZP1+Iwnz2SHLIG9AVJQgzR/IaVGbq/VNAQyhsuD+RxYgUKk
 H9qZUHx5d1xV3Zmr2kZXkkHDuLVYob3YQITWgNglN/J1WJDSIP1DuJTtz4KqHz1IYsDJ
 bix8GLkhiIoeR8vlFYLOlKd+lL52YVMBO7W5CXmvukPtvBpJNXcuzpGY3HubbkmkYDCL
 sRvw==
X-Gm-Message-State: AOAM53354dznzStadLygzV1hjVXufc4rKsftZTOgUntKJJgYxdDD1AQ0
 uV6JAtVuliQdUG0uNvJa0cM=
X-Google-Smtp-Source: ABdhPJwQAgOMlKvOCJoQaBlaUjgxDqdnxj83a3eY2zxIdCgExCPAk8Q1toLza/BNvHhPjsgoC1tyWQ==
X-Received: by 2002:a17:90a:420c:: with SMTP id
 o12mr14512685pjg.193.1613832513368; 
 Sat, 20 Feb 2021 06:48:33 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d16sm3100480pgb.12.2021.02.20.06.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 06:48:33 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 4/4] hw/riscv: virt: Map high mmio for PCIe
Date: Sat, 20 Feb 2021 22:48:07 +0800
Message-Id: <20210220144807.819-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210220144807.819-1-bmeng.cn@gmail.com>
References: <20210220144807.819-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Sat, 20 Feb 2021 14:48:39 -0000

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
index c4b8f455f8..4f0c2fbca0 100644
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
             error_report("Limiting RAM size to 10 GiB");
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
2.25.1


