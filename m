Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPGcD-0007YT-Qz
	for mharc-qemu-riscv@gnu.org; Tue, 20 Nov 2018 19:43:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPGcB-0007YL-T4
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 19:43:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPGcA-0000Yj-Fi
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 19:43:35 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:45515)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPGc8-0000Pn-74; Tue, 20 Nov 2018 19:43:33 -0500
Received: by mail-lf1-x143.google.com with SMTP id b20so2682062lfa.12;
	Tue, 20 Nov 2018 16:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6DkfHIuZLbe4VevEH9dmNeeE5DXqQP1jiZ7rg+sJtuM=;
	b=JLPucHfhHUP13ITVQDy70jgYJxsvZ+fLlmjRbw/ZeBe3H51s8zjv/vzaGsg6xXlULY
	RD5svKgLK96haCBCs34SyPBtGlgGfuVXusgoY1bynF5bpvRs/p2N3Sx8mLzFZOzYqNRF
	gOa1JkvPwJreaM2wLx6YG4AyE2iOrsVWfdRv122/x8b8HzHP9xXUPjdpgIR9PNB2UXHB
	OHiM7dxwlAnSZJZFHe2i6ObaNXTp1XjFwojntoUDzuFt+m/1nosMdTwKvB5O1dJFfLOa
	BuvUQKi0iMi0mg8bZChYM1jn5guSwj3fkpjZMTt+VO2r6nx6j7dUr1PbXrknbGOpSuJM
	pdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6DkfHIuZLbe4VevEH9dmNeeE5DXqQP1jiZ7rg+sJtuM=;
	b=jHHnHDSimxUHUoYq7CaRKu9ppdKPwSf3vj10THANWSeuXI58WefTeez9Ljch7u3R8o
	ZAlW3KFMO/8uA1TLV/slJumTEm/nQbAlXYWxEkt9E+31seNvQE95S1pgh1AZT0IfndUX
	hxgY2OmBYmg6KfZmkNFOSC7QGzIZmrXEiDFp1X2JFkg9moj82sybVp4teli324ieHnvQ
	Y+LIHAOYclt6bS5QAh/7qPTMr7kWR0wFVGSYoepGUypZ7ecPvLYVHzM408mYXnh2+L0t
	Urz/ZWHAhkPYGgprDFt8wA6xfqktzgjXwqFmHnAZNflGFhDSG2sHwodvEfUYyN1I4XGB
	KXjw==
X-Gm-Message-State: AGRZ1gLl/3zzTgMKGoeJZiMT10kpYcwuWfULC/cp6uU0YLSTqTlP/zfU
	RhHaB6TicKWPXMebbYfXfvn6rW5x4uOv60XP9GM=
X-Google-Smtp-Source: AJdET5ellM6trd1HqR0EsGidLYIgvxKJ2DtoHdYd7kY/QCVAmL/EF+VZe++BCsPIr3hzCZcdQFUQi5v4Hj3miAb6UR0=
X-Received: by 2002:a19:c18d:: with SMTP id r135mr2213755lff.59.1542761008333; 
	Tue, 20 Nov 2018 16:43:28 -0800 (PST)
MIME-Version: 1.0
References: <1542754831-25567-1-git-send-email-linux@roeck-us.net>
In-Reply-To: <1542754831-25567-1-git-send-email-linux@roeck-us.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Nov 2018 16:43:01 -0800
Message-ID: <CAKmqyKNNAkBY6o06=jokZcMipmtdFyX5zq9W-cQvx96R=RzzRg@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, paul.walmsley@sifive.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 1/2] riscv: virt: Fix pcie
 memory ranges
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
X-List-Received-Date: Wed, 21 Nov 2018 00:43:37 -0000

On Tue, Nov 20, 2018 at 3:01 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> - Provide separate maps for VIRT_PCIE_MMIO (32 bit) and
>   VIRT_PCIE_MMIO_HIGH (64 bit)
> - VIRT_PCIE_PIO is for IO ports, not for the physical address
> - VIRT_PCIE_ECAM size reduced to size needed to cover 256 ports
> - Use memmap[VIRT_PCIE_ECAM].size instead of memmap[VIRT_PCIE_ECAM].base
>   to calculate the bus number range
> - Use qemu_fdt_setprop_sized_cells() to create reg and ranges entries
> - Fix parameters for gpex_pcie_init()
>   (ECAM and MMIO addresses were swapped)
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Hey Gunter,

Thanks for the patch! This was causing me all kinds of headaches.
Unfortunately I had managed to figure out the memory addresses thanks
to Bin Meng's help.

You can see the new tree here:
https://github.com/alistair23/qemu/tree/mainline/alistair/sifive_pcie.next

If you have anything you wan to add to that branch just let me know.

Alistair

> ---
> This series applies on top of
>         https://patchwork.kernel.org/cover/10661699/
>
> Tested with mmc:
>     qemu-system-riscv64 -M virt -m 512M -no-reboot \
>         -bios riscv64/bbl -kernel vmlinux \
>         -netdev user,id=net0 -device virtio-net-device,netdev=net0 \
>         -snapshot -device sdhci-pci -device sd-card,drive=d0 \
>         -drive file=rootfs.ext2,format=raw,if=none,id=d0 \
>         -append 'root=/dev/mmcblk0 rw rootwait panic=-1 console=ttyS0,115200' \
>         -nographic -monitor none
>
> and nvme:
>     qemu-system-riscv64 -M virt -m 512M -no-reboot \
>         -bios riscv64/bbl -kernel vmlinux \
>         -netdev user,id=net0 -device virtio-net-device,netdev=net0 \
>         -snapshot -device nvme,serial=foo,drive=d0 \
>         -drive file=rootfs.ext2,if=none,format=raw,id=d0 \
>         -append 'root=/dev/nvme0n1 rw rootwait panic=-1 console=ttyS0,115200' \
>         -nographic -monitor none
>
>  hw/riscv/virt.c         | 51 ++++++++++++++++++++++++++++++++-----------------
>  include/hw/riscv/virt.h |  1 +
>  2 files changed, 35 insertions(+), 17 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 1aac5ca..675899d 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -59,10 +59,10 @@ static const struct MemmapEntry {
>      [VIRT_UART0] =    { 0x10000000,      0x100 },
>      [VIRT_VIRTIO] =   { 0x10001000,     0x1000 },
>      [VIRT_DRAM] =     { 0x80000000,        0x0 },
> -    [VIRT_PCIE_MMIO] = { 0x2000000000, 0x4000000 },
> -    [VIRT_PCIE_PIO] = { 0x2010000, 0x40000000 },
> -    [VIRT_PCIE_ECAM] = { 0x40000000, 0x20000000 },
> -
> +    [VIRT_PCIE_MMIO] = { 0x40000000, 0x40000000 },
> +    [VIRT_PCIE_MMIO_HIGH] = { 0x2000000000, 0x4000000000 },
> +    [VIRT_PCIE_PIO] =  { 0x10002000,     0x1000 },
> +    [VIRT_PCIE_ECAM] = { 0x30000000, 0x10000000 },
>  };
>
>  #define INTERREUPT_MAP_WIDTH 7
> @@ -231,8 +231,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>          g_free(nodename);
>      }
>
> -    nodename = g_strdup_printf("/pci@%lx",
> -        (long) memmap[VIRT_PCIE_MMIO].base);
> +    nodename = g_strdup_printf("/pcie@%" PRIx64, memmap[VIRT_PCIE_MMIO].base);
>      qemu_fdt_add_subnode(fdt, nodename);
>      qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 0x3);
>      qemu_fdt_setprop_cells(fdt, nodename, "#interrupt-cells", 0x1);
> @@ -242,16 +241,26 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>      qemu_fdt_setprop_string(fdt, nodename, "device_type", "pci");
>      qemu_fdt_setprop_cell(fdt, nodename, "linux,pci-domain", 0);
>      qemu_fdt_setprop_cells(fdt, nodename, "bus-range", 0,
> -                           memmap[VIRT_PCIE_ECAM].base /
> +                           memmap[VIRT_PCIE_ECAM].size /
>                                 PCIE_MMCFG_SIZE_MIN - 1);
>      qemu_fdt_setprop(fdt, nodename, "dma-coherent", NULL, 0);
> -    qemu_fdt_setprop_cells(fdt, nodename, "reg", 0x20, 0,
> -                           0, memmap[VIRT_PCIE_ECAM].size);
> -    qemu_fdt_setprop_cells(fdt, nodename, "ranges",
> -                           memmap[VIRT_PCIE_PIO].base,
> -                               0, memmap[VIRT_PCIE_PIO].size,
> -                           0, memmap[VIRT_PCIE_MMIO].base,
> -                               0, memmap[VIRT_PCIE_MMIO].size);
> +    qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
> +                                 2, memmap[VIRT_PCIE_ECAM].base,
> +                                 2, memmap[VIRT_PCIE_ECAM].size);
> +
> +    qemu_fdt_setprop_sized_cells(fdt, nodename, "ranges",
> +                                 1, FDT_PCI_RANGE_IOPORT, 2, 0,
> +                                 2, memmap[VIRT_PCIE_PIO].base,
> +                                 2, memmap[VIRT_PCIE_PIO].size,
> +                                 1, FDT_PCI_RANGE_MMIO,
> +                                 2, memmap[VIRT_PCIE_MMIO].base,
> +                                 2, memmap[VIRT_PCIE_MMIO].base,
> +                                 2, memmap[VIRT_PCIE_MMIO].size,
> +                                 1, FDT_PCI_RANGE_MMIO_64BIT,
> +                                 2, memmap[VIRT_PCIE_MMIO_HIGH].base,
> +                                 2, memmap[VIRT_PCIE_MMIO_HIGH].base,
> +                                 2, memmap[VIRT_PCIE_MMIO_HIGH].size);
> +
>      qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
>      qemu_fdt_setprop_cells(fdt, nodename, "interrupts", PCIE_IRQ);
>      create_pcie_irq_map(fdt, nodename, plic_phandle);
> @@ -289,12 +298,13 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>  static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>                                            hwaddr ecam_base, hwaddr ecam_size,
>                                            hwaddr mmio_base, hwaddr mmio_size,
> +                                          hwaddr mmio_hbase, hwaddr mmio_hsize,
>                                            hwaddr pio_base,
>                                            DeviceState *plic, bool link_up)
>  {
>      DeviceState *dev;
>      MemoryRegion *ecam_alias, *ecam_reg;
> -    MemoryRegion *mmio_alias, *mmio_reg;
> +    MemoryRegion *mmio_alias, *mmio_halias, *mmio_reg;
>      qemu_irq irq;
>      int i;
>
> @@ -314,6 +324,11 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>                               mmio_reg, mmio_base, mmio_size);
>      memory_region_add_subregion(get_system_memory(), mmio_base, mmio_alias);
>
> +    mmio_halias = g_new0(MemoryRegion, 1);
> +    memory_region_init_alias(mmio_halias, OBJECT(dev), "pcie-mmio-high",
> +                             mmio_reg, mmio_hbase, mmio_hsize);
> +    memory_region_add_subregion(get_system_memory(), mmio_hbase, mmio_halias);
> +
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, pio_base);
>
>      for (i = 0; i < GPEX_NUM_IRQS; i++) {
> @@ -444,10 +459,12 @@ static void riscv_virt_board_init(MachineState *machine)
>      }
>
>      dev = gpex_pcie_init(system_memory,
> -                         memmap[VIRT_PCIE_MMIO].base,
> -                         memmap[VIRT_PCIE_MMIO].size,
>                           memmap[VIRT_PCIE_ECAM].base,
>                           memmap[VIRT_PCIE_ECAM].size,
> +                         memmap[VIRT_PCIE_MMIO].base,
> +                         memmap[VIRT_PCIE_MMIO].size,
> +                         memmap[VIRT_PCIE_MMIO_HIGH].base,
> +                         memmap[VIRT_PCIE_MMIO_HIGH].size,
>                           memmap[VIRT_PCIE_PIO].base,
>                           DEVICE(s->plic), true);
>      pci_bus = PCI_HOST_BRIDGE(dev)->bus;
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index dd4fedd..99caf09 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -40,6 +40,7 @@ enum {
>      VIRT_VIRTIO,
>      VIRT_DRAM,
>      VIRT_PCIE_MMIO,
> +    VIRT_PCIE_MMIO_HIGH,
>      VIRT_PCIE_PIO,
>      VIRT_PCIE_ECAM
>  };
> --
> 2.7.4
>
>

