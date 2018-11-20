Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPFKo-0002nv-Qm
	for mharc-qemu-riscv@gnu.org; Tue, 20 Nov 2018 18:21:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gPF0n-00034p-Hr
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 18:00:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gPF0m-0005KV-3g
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 18:00:53 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41187)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gPF0g-0004vZ-FJ; Tue, 20 Nov 2018 18:00:46 -0500
Received: by mail-pl1-x642.google.com with SMTP id u6so2459157plm.8;
	Tue, 20 Nov 2018 15:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=hlfLU5OlFUO3prijejcYnnCxM5J4bILOF8+8cao5iGc=;
	b=KzyItEcDLDeV8MyZz5ijmOToZ8c8/HpX8y3lCnwrkxdTGXqGPAloNYHX6pLshIXIMe
	xI08YuAJbmcxp3dtMSiZpTarfRGmAwHvA9G2DQhhnxM0lPH/h5gWpwbaea9Cwf4Nt+3e
	aS0aIRWrXTITL7VO3lX6lcgp9Q2RPh+qNz6VU2cJXc3BdOuIOGYShe+Lqmb6al7wZZ8z
	1l/Wkj65zLeG1v1DKwjmTnLOrHXmbtFFCFx7cJEauV8VLMJj5cHRQk/fpZxsOyZo1mIg
	9VV1A3gyBhylBLzsZtk9kHsl3ZwBSluq8mtcoeCn9JUYCO9kOyaAVfcl82UqKCIPeOQV
	P6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=hlfLU5OlFUO3prijejcYnnCxM5J4bILOF8+8cao5iGc=;
	b=oG1j4fFIVrwKftrZVcj8m1pMmlXyYLfCNriZeE1H1X7vcE1iZ91EsDxWKslG0mE0/k
	XWbPZJkPgPMvJvfmSwA/lQ6keY50AiS8BYJnYHjjYr6lEmfcImRG1azT8cLiCJMKXm5m
	vV+Od4f0F6aB0+EElI23R5nNuUbPEcx7keX48vZMZEosJgGJjGZetrO8My262lwmwYen
	aXQIZSZzojJ/dTEbCz7vDX920fmEXnDE+AEQn7uN9toElkFcVY3pLey13f3j2NVjlMKS
	6gQeaoF4llZ6kfp+GQiKqucZ4xsIg1zA82JrfXOZgitBKvaaYXRIHt5BPuLhTFLrNMRp
	q5Vg==
X-Gm-Message-State: AGRZ1gJbmz5f1qpCZQ6g3FNh/FGy2IqbgiKgcmV5Xk6kgo6lfE2/T4V2
	7hc6j6V3YOTVuE8jxEp6Pec=
X-Google-Smtp-Source: AJdET5cstHUCGhrRqt4RPO9xu1s908+TTAkjZdKTobjEyz/CSirxwtAmo1NXqJ2jNoUxKEnIy+Lyqg==
X-Received: by 2002:a62:9402:: with SMTP id m2mr4182146pfe.34.1542754836773;
	Tue, 20 Nov 2018 15:00:36 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	k24sm40966770pfj.13.2018.11.20.15.00.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 15:00:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrea Bolognani <abologna@redhat.com>, Guenter Roeck <linux@roeck-us.net>
Date: Tue, 20 Nov 2018 15:00:30 -0800
Message-Id: <1542754831-25567-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
X-Mailman-Approved-At: Tue, 20 Nov 2018 18:21:33 -0500
Subject: [Qemu-riscv] [PATCH 1/2] riscv: virt: Fix pcie memory ranges
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
X-List-Received-Date: Tue, 20 Nov 2018 23:00:55 -0000

- Provide separate maps for VIRT_PCIE_MMIO (32 bit) and
  VIRT_PCIE_MMIO_HIGH (64 bit)
- VIRT_PCIE_PIO is for IO ports, not for the physical address
- VIRT_PCIE_ECAM size reduced to size needed to cover 256 ports
- Use memmap[VIRT_PCIE_ECAM].size instead of memmap[VIRT_PCIE_ECAM].base
  to calculate the bus number range
- Use qemu_fdt_setprop_sized_cells() to create reg and ranges entries
- Fix parameters for gpex_pcie_init()
  (ECAM and MMIO addresses were swapped)

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
This series applies on top of 
	https://patchwork.kernel.org/cover/10661699/

Tested with mmc:
    qemu-system-riscv64 -M virt -m 512M -no-reboot \
	-bios riscv64/bbl -kernel vmlinux \
	-netdev user,id=net0 -device virtio-net-device,netdev=net0 \
	-snapshot -device sdhci-pci -device sd-card,drive=d0 \
	-drive file=rootfs.ext2,format=raw,if=none,id=d0 \
	-append 'root=/dev/mmcblk0 rw rootwait panic=-1 console=ttyS0,115200' \
	-nographic -monitor none

and nvme:
    qemu-system-riscv64 -M virt -m 512M -no-reboot \
	-bios riscv64/bbl -kernel vmlinux \
	-netdev user,id=net0 -device virtio-net-device,netdev=net0 \
	-snapshot -device nvme,serial=foo,drive=d0 \
	-drive file=rootfs.ext2,if=none,format=raw,id=d0 \
	-append 'root=/dev/nvme0n1 rw rootwait panic=-1 console=ttyS0,115200' \
	-nographic -monitor none

 hw/riscv/virt.c         | 51 ++++++++++++++++++++++++++++++++-----------------
 include/hw/riscv/virt.h |  1 +
 2 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1aac5ca..675899d 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -59,10 +59,10 @@ static const struct MemmapEntry {
     [VIRT_UART0] =    { 0x10000000,      0x100 },
     [VIRT_VIRTIO] =   { 0x10001000,     0x1000 },
     [VIRT_DRAM] =     { 0x80000000,        0x0 },
-    [VIRT_PCIE_MMIO] = { 0x2000000000, 0x4000000 },
-    [VIRT_PCIE_PIO] = { 0x2010000, 0x40000000 },
-    [VIRT_PCIE_ECAM] = { 0x40000000, 0x20000000 },
-
+    [VIRT_PCIE_MMIO] = { 0x40000000, 0x40000000 },
+    [VIRT_PCIE_MMIO_HIGH] = { 0x2000000000, 0x4000000000 },
+    [VIRT_PCIE_PIO] =  { 0x10002000,     0x1000 },
+    [VIRT_PCIE_ECAM] = { 0x30000000, 0x10000000 },
 };
 
 #define INTERREUPT_MAP_WIDTH 7
@@ -231,8 +231,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
         g_free(nodename);
     }
 
-    nodename = g_strdup_printf("/pci@%lx",
-        (long) memmap[VIRT_PCIE_MMIO].base);
+    nodename = g_strdup_printf("/pcie@%" PRIx64, memmap[VIRT_PCIE_MMIO].base);
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 0x3);
     qemu_fdt_setprop_cells(fdt, nodename, "#interrupt-cells", 0x1);
@@ -242,16 +241,26 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_string(fdt, nodename, "device_type", "pci");
     qemu_fdt_setprop_cell(fdt, nodename, "linux,pci-domain", 0);
     qemu_fdt_setprop_cells(fdt, nodename, "bus-range", 0,
-                           memmap[VIRT_PCIE_ECAM].base /
+                           memmap[VIRT_PCIE_ECAM].size /
                                PCIE_MMCFG_SIZE_MIN - 1);
     qemu_fdt_setprop(fdt, nodename, "dma-coherent", NULL, 0);
-    qemu_fdt_setprop_cells(fdt, nodename, "reg", 0x20, 0,
-                           0, memmap[VIRT_PCIE_ECAM].size);
-    qemu_fdt_setprop_cells(fdt, nodename, "ranges",
-                           memmap[VIRT_PCIE_PIO].base,
-                               0, memmap[VIRT_PCIE_PIO].size,
-                           0, memmap[VIRT_PCIE_MMIO].base,
-                               0, memmap[VIRT_PCIE_MMIO].size);
+    qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
+                                 2, memmap[VIRT_PCIE_ECAM].base,
+                                 2, memmap[VIRT_PCIE_ECAM].size);
+
+    qemu_fdt_setprop_sized_cells(fdt, nodename, "ranges",
+                                 1, FDT_PCI_RANGE_IOPORT, 2, 0,
+                                 2, memmap[VIRT_PCIE_PIO].base,
+                                 2, memmap[VIRT_PCIE_PIO].size,
+                                 1, FDT_PCI_RANGE_MMIO,
+                                 2, memmap[VIRT_PCIE_MMIO].base,
+                                 2, memmap[VIRT_PCIE_MMIO].base,
+                                 2, memmap[VIRT_PCIE_MMIO].size,
+                                 1, FDT_PCI_RANGE_MMIO_64BIT,
+                                 2, memmap[VIRT_PCIE_MMIO_HIGH].base,
+                                 2, memmap[VIRT_PCIE_MMIO_HIGH].base,
+                                 2, memmap[VIRT_PCIE_MMIO_HIGH].size);
+
     qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupts", PCIE_IRQ);
     create_pcie_irq_map(fdt, nodename, plic_phandle);
@@ -289,12 +298,13 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
 static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                                           hwaddr ecam_base, hwaddr ecam_size,
                                           hwaddr mmio_base, hwaddr mmio_size,
+                                          hwaddr mmio_hbase, hwaddr mmio_hsize,
                                           hwaddr pio_base,
                                           DeviceState *plic, bool link_up)
 {
     DeviceState *dev;
     MemoryRegion *ecam_alias, *ecam_reg;
-    MemoryRegion *mmio_alias, *mmio_reg;
+    MemoryRegion *mmio_alias, *mmio_halias, *mmio_reg;
     qemu_irq irq;
     int i;
 
@@ -314,6 +324,11 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                              mmio_reg, mmio_base, mmio_size);
     memory_region_add_subregion(get_system_memory(), mmio_base, mmio_alias);
 
+    mmio_halias = g_new0(MemoryRegion, 1);
+    memory_region_init_alias(mmio_halias, OBJECT(dev), "pcie-mmio-high",
+                             mmio_reg, mmio_hbase, mmio_hsize);
+    memory_region_add_subregion(get_system_memory(), mmio_hbase, mmio_halias);
+
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, pio_base);
 
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
@@ -444,10 +459,12 @@ static void riscv_virt_board_init(MachineState *machine)
     }
 
     dev = gpex_pcie_init(system_memory,
-                         memmap[VIRT_PCIE_MMIO].base,
-                         memmap[VIRT_PCIE_MMIO].size,
                          memmap[VIRT_PCIE_ECAM].base,
                          memmap[VIRT_PCIE_ECAM].size,
+                         memmap[VIRT_PCIE_MMIO].base,
+                         memmap[VIRT_PCIE_MMIO].size,
+                         memmap[VIRT_PCIE_MMIO_HIGH].base,
+                         memmap[VIRT_PCIE_MMIO_HIGH].size,
                          memmap[VIRT_PCIE_PIO].base,
                          DEVICE(s->plic), true);
     pci_bus = PCI_HOST_BRIDGE(dev)->bus;
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index dd4fedd..99caf09 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -40,6 +40,7 @@ enum {
     VIRT_VIRTIO,
     VIRT_DRAM,
     VIRT_PCIE_MMIO,
+    VIRT_PCIE_MMIO_HIGH,
     VIRT_PCIE_PIO,
     VIRT_PCIE_ECAM
 };
-- 
2.7.4


