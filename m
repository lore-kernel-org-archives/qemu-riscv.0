Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPXol-0006Tk-RO
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 14:05:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gPXog-0006Rl-Sk
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:05:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gPXof-00045C-1J
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:05:38 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:37652)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gPXoe-00043l-MX; Wed, 21 Nov 2018 14:05:36 -0500
Received: by mail-pl1-x642.google.com with SMTP id b5so6800328plr.4;
	Wed, 21 Nov 2018 11:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=YEI2N+m5BKiZFlfPG2KBJm2LvByTQGGMdeShGWdvqqQ=;
	b=RTZkoq2CdfqnQkasxImq5k3JmHtOwqOeHkhj3EoQJ7VoXV1irQWv/YRF3lujTXAXsG
	aCET4rqwhykjoiDlzp7Dy6K5PJ3+FFgLbQGOoKDBQG1wHRhdv3xwlL2tZASOMQGBpogC
	ObH8joBtS0unCCuWN3y5JBkPBXVrVDhRO3VsDISaIMLWSPjAqKswBSRVixE3oIgE/+pq
	DW0MVrmmAGTP0Js9bgGnbkDMM2GXbUS7crRzkiohCE8/TiTA4gQdB7CWAq6hobM7ul/+
	vp1nCBuxA8RkvDuBvHZSwRz9I7AG74L4CDG6+DWuTe8hplwMMH+5l899raYvaB3cb+7M
	CQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=YEI2N+m5BKiZFlfPG2KBJm2LvByTQGGMdeShGWdvqqQ=;
	b=cnWao8FneRaOK3MSEPeERFHj04ikVv09hhvYvJxfBL5R58a6WYbhjcten/tgnegw7R
	y2XY5CS7CcIKKISa9kNOMe1XK3VXa9AnHTmlf2UbC+nDW3fWlqJLSqHrd0w7ZR05AF36
	X1BDBBetimZlHaOjZNGHe0+1xO20yIdq8W9IXFHtRddl6mZyiNWoYvW5UjTSvBRGdGYj
	S4iy7EDaPnka0V65qTL8xZTqz+8ZihOBm6RekTBKOrRw9ljJi54OBmjvbAkQRGV+lj4V
	HtUFvn6Ws/6FroChSqYHtz2ZG8lFQxDvD8MMJxAi39HHjDF3/AIEzx8TAIsZ4ZJjHVNa
	awew==
X-Gm-Message-State: AA+aEWZtydbJKVgYiEr5LijDMcsS4WpcVaJeDZ3kW9ivlzQyQL0FT0P8
	LU3SZj1eh3J9cQEOy7hGJgI=
X-Google-Smtp-Source: AFSGD/W1ZgEjO+HaVbfMtR9PsYlpisp1Nm+60f30XjRYzVpiq0VcyzoFQsZcfjGtYMobIuxtMmgujA==
X-Received: by 2002:a63:594d:: with SMTP id j13mr7078370pgm.210.1542827135479; 
	Wed, 21 Nov 2018 11:05:35 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	u19-v6sm55095875pfh.153.2018.11.21.11.05.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 11:05:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 21 Nov 2018 11:05:34 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, paul.walmsley@sifive.com
Message-ID: <20181121190533.GB9571@roeck-us.net>
References: <1542754831-25567-1-git-send-email-linux@roeck-us.net>
	<CAKmqyKNNAkBY6o06=jokZcMipmtdFyX5zq9W-cQvx96R=RzzRg@mail.gmail.com>
	<4f96372a-0750-4a4d-c1b1-284402d0468f@roeck-us.net>
	<CAKmqyKNiEZAxBs1azxvEgvfwqzuxUKu2k75rT-ass2a=wWyHXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKNiEZAxBs1azxvEgvfwqzuxUKu2k75rT-ass2a=wWyHXg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-List-Received-Date: Wed, 21 Nov 2018 19:05:40 -0000

On Wed, Nov 21, 2018 at 08:00:08AM -0800, Alistair Francis wrote:
> On Tue, Nov 20, 2018 at 5:54 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > Hi Alistair,
> >
> > On 11/20/18 4:43 PM, Alistair Francis wrote:
> > > On Tue, Nov 20, 2018 at 3:01 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > >>
> > >> - Provide separate maps for VIRT_PCIE_MMIO (32 bit) and
> > >>    VIRT_PCIE_MMIO_HIGH (64 bit)
> > >> - VIRT_PCIE_PIO is for IO ports, not for the physical address
> > >> - VIRT_PCIE_ECAM size reduced to size needed to cover 256 ports
> > >> - Use memmap[VIRT_PCIE_ECAM].size instead of memmap[VIRT_PCIE_ECAM].base
> > >>    to calculate the bus number range
> > >> - Use qemu_fdt_setprop_sized_cells() to create reg and ranges entries
> > >> - Fix parameters for gpex_pcie_init()
> > >>    (ECAM and MMIO addresses were swapped)
> > >>
> > >> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > >
> > > Hey Gunter,
> > >
> > > Thanks for the patch! This was causing me all kinds of headaches.
> > > Unfortunately I had managed to figure out the memory addresses thanks
> > > to Bin Meng's help.
> > >
> > No worries. I am not married to this series. I'll give your tree a try,
> > hopefully tonight.
> >
> > > You can see the new tree here:
> > > https://github.com/alistair23/qemu/tree/mainline/alistair/sifive_pcie.next
> > >
> > > If you have anything you wan to add to that branch just let me know.
> > >
> >
> > One possible addition might be a 64 bit address range. I don't know
> > if that is needed for some pcie devices. I do see that nvme instantiates
> > from the 64 bit region, but I don't know if that is mandatory or just the
> > preference.
> >
> > I would also suggest to add "include usb.mak" to the defconfig file. With this,
> > it is possible to support the full range of usb devices. I am using it for
> > various boot tests.
> 
> I agree that both of these would be nice. At the moment I am going to
> leave them out as I just want this series merged and I suspect adding
> more patches will slow the process down even more. Once it's in we can
> look at 64-bit address ranges and adding USB support (something I am
> also interested in).
> 
Makes sense.

Thanks,
Guenter

> Alistair
> 
> >
> > Thanks,
> > Guenter
> >
> > > Alistair
> > >
> > >> ---
> > >> This series applies on top of
> > >>          https://patchwork.kernel.org/cover/10661699/
> > >>
> > >> Tested with mmc:
> > >>      qemu-system-riscv64 -M virt -m 512M -no-reboot \
> > >>          -bios riscv64/bbl -kernel vmlinux \
> > >>          -netdev user,id=net0 -device virtio-net-device,netdev=net0 \
> > >>          -snapshot -device sdhci-pci -device sd-card,drive=d0 \
> > >>          -drive file=rootfs.ext2,format=raw,if=none,id=d0 \
> > >>          -append 'root=/dev/mmcblk0 rw rootwait panic=-1 console=ttyS0,115200' \
> > >>          -nographic -monitor none
> > >>
> > >> and nvme:
> > >>      qemu-system-riscv64 -M virt -m 512M -no-reboot \
> > >>          -bios riscv64/bbl -kernel vmlinux \
> > >>          -netdev user,id=net0 -device virtio-net-device,netdev=net0 \
> > >>          -snapshot -device nvme,serial=foo,drive=d0 \
> > >>          -drive file=rootfs.ext2,if=none,format=raw,id=d0 \
> > >>          -append 'root=/dev/nvme0n1 rw rootwait panic=-1 console=ttyS0,115200' \
> > >>          -nographic -monitor none
> > >>
> > >>   hw/riscv/virt.c         | 51 ++++++++++++++++++++++++++++++++-----------------
> > >>   include/hw/riscv/virt.h |  1 +
> > >>   2 files changed, 35 insertions(+), 17 deletions(-)
> > >>
> > >> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > >> index 1aac5ca..675899d 100644
> > >> --- a/hw/riscv/virt.c
> > >> +++ b/hw/riscv/virt.c
> > >> @@ -59,10 +59,10 @@ static const struct MemmapEntry {
> > >>       [VIRT_UART0] =    { 0x10000000,      0x100 },
> > >>       [VIRT_VIRTIO] =   { 0x10001000,     0x1000 },
> > >>       [VIRT_DRAM] =     { 0x80000000,        0x0 },
> > >> -    [VIRT_PCIE_MMIO] = { 0x2000000000, 0x4000000 },
> > >> -    [VIRT_PCIE_PIO] = { 0x2010000, 0x40000000 },
> > >> -    [VIRT_PCIE_ECAM] = { 0x40000000, 0x20000000 },
> > >> -
> > >> +    [VIRT_PCIE_MMIO] = { 0x40000000, 0x40000000 },
> > >> +    [VIRT_PCIE_MMIO_HIGH] = { 0x2000000000, 0x4000000000 },
> > >> +    [VIRT_PCIE_PIO] =  { 0x10002000,     0x1000 },
> > >> +    [VIRT_PCIE_ECAM] = { 0x30000000, 0x10000000 },
> > >>   };
> > >>
> > >>   #define INTERREUPT_MAP_WIDTH 7
> > >> @@ -231,8 +231,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
> > >>           g_free(nodename);
> > >>       }
> > >>
> > >> -    nodename = g_strdup_printf("/pci@%lx",
> > >> -        (long) memmap[VIRT_PCIE_MMIO].base);
> > >> +    nodename = g_strdup_printf("/pcie@%" PRIx64, memmap[VIRT_PCIE_MMIO].base);
> > >>       qemu_fdt_add_subnode(fdt, nodename);
> > >>       qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 0x3);
> > >>       qemu_fdt_setprop_cells(fdt, nodename, "#interrupt-cells", 0x1);
> > >> @@ -242,16 +241,26 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
> > >>       qemu_fdt_setprop_string(fdt, nodename, "device_type", "pci");
> > >>       qemu_fdt_setprop_cell(fdt, nodename, "linux,pci-domain", 0);
> > >>       qemu_fdt_setprop_cells(fdt, nodename, "bus-range", 0,
> > >> -                           memmap[VIRT_PCIE_ECAM].base /
> > >> +                           memmap[VIRT_PCIE_ECAM].size /
> > >>                                  PCIE_MMCFG_SIZE_MIN - 1);
> > >>       qemu_fdt_setprop(fdt, nodename, "dma-coherent", NULL, 0);
> > >> -    qemu_fdt_setprop_cells(fdt, nodename, "reg", 0x20, 0,
> > >> -                           0, memmap[VIRT_PCIE_ECAM].size);
> > >> -    qemu_fdt_setprop_cells(fdt, nodename, "ranges",
> > >> -                           memmap[VIRT_PCIE_PIO].base,
> > >> -                               0, memmap[VIRT_PCIE_PIO].size,
> > >> -                           0, memmap[VIRT_PCIE_MMIO].base,
> > >> -                               0, memmap[VIRT_PCIE_MMIO].size);
> > >> +    qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
> > >> +                                 2, memmap[VIRT_PCIE_ECAM].base,
> > >> +                                 2, memmap[VIRT_PCIE_ECAM].size);
> > >> +
> > >> +    qemu_fdt_setprop_sized_cells(fdt, nodename, "ranges",
> > >> +                                 1, FDT_PCI_RANGE_IOPORT, 2, 0,
> > >> +                                 2, memmap[VIRT_PCIE_PIO].base,
> > >> +                                 2, memmap[VIRT_PCIE_PIO].size,
> > >> +                                 1, FDT_PCI_RANGE_MMIO,
> > >> +                                 2, memmap[VIRT_PCIE_MMIO].base,
> > >> +                                 2, memmap[VIRT_PCIE_MMIO].base,
> > >> +                                 2, memmap[VIRT_PCIE_MMIO].size,
> > >> +                                 1, FDT_PCI_RANGE_MMIO_64BIT,
> > >> +                                 2, memmap[VIRT_PCIE_MMIO_HIGH].base,
> > >> +                                 2, memmap[VIRT_PCIE_MMIO_HIGH].base,
> > >> +                                 2, memmap[VIRT_PCIE_MMIO_HIGH].size);
> > >> +
> > >>       qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
> > >>       qemu_fdt_setprop_cells(fdt, nodename, "interrupts", PCIE_IRQ);
> > >>       create_pcie_irq_map(fdt, nodename, plic_phandle);
> > >> @@ -289,12 +298,13 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
> > >>   static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
> > >>                                             hwaddr ecam_base, hwaddr ecam_size,
> > >>                                             hwaddr mmio_base, hwaddr mmio_size,
> > >> +                                          hwaddr mmio_hbase, hwaddr mmio_hsize,
> > >>                                             hwaddr pio_base,
> > >>                                             DeviceState *plic, bool link_up)
> > >>   {
> > >>       DeviceState *dev;
> > >>       MemoryRegion *ecam_alias, *ecam_reg;
> > >> -    MemoryRegion *mmio_alias, *mmio_reg;
> > >> +    MemoryRegion *mmio_alias, *mmio_halias, *mmio_reg;
> > >>       qemu_irq irq;
> > >>       int i;
> > >>
> > >> @@ -314,6 +324,11 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
> > >>                                mmio_reg, mmio_base, mmio_size);
> > >>       memory_region_add_subregion(get_system_memory(), mmio_base, mmio_alias);
> > >>
> > >> +    mmio_halias = g_new0(MemoryRegion, 1);
> > >> +    memory_region_init_alias(mmio_halias, OBJECT(dev), "pcie-mmio-high",
> > >> +                             mmio_reg, mmio_hbase, mmio_hsize);
> > >> +    memory_region_add_subregion(get_system_memory(), mmio_hbase, mmio_halias);
> > >> +
> > >>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, pio_base);
> > >>
> > >>       for (i = 0; i < GPEX_NUM_IRQS; i++) {
> > >> @@ -444,10 +459,12 @@ static void riscv_virt_board_init(MachineState *machine)
> > >>       }
> > >>
> > >>       dev = gpex_pcie_init(system_memory,
> > >> -                         memmap[VIRT_PCIE_MMIO].base,
> > >> -                         memmap[VIRT_PCIE_MMIO].size,
> > >>                            memmap[VIRT_PCIE_ECAM].base,
> > >>                            memmap[VIRT_PCIE_ECAM].size,
> > >> +                         memmap[VIRT_PCIE_MMIO].base,
> > >> +                         memmap[VIRT_PCIE_MMIO].size,
> > >> +                         memmap[VIRT_PCIE_MMIO_HIGH].base,
> > >> +                         memmap[VIRT_PCIE_MMIO_HIGH].size,
> > >>                            memmap[VIRT_PCIE_PIO].base,
> > >>                            DEVICE(s->plic), true);
> > >>       pci_bus = PCI_HOST_BRIDGE(dev)->bus;
> > >> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> > >> index dd4fedd..99caf09 100644
> > >> --- a/include/hw/riscv/virt.h
> > >> +++ b/include/hw/riscv/virt.h
> > >> @@ -40,6 +40,7 @@ enum {
> > >>       VIRT_VIRTIO,
> > >>       VIRT_DRAM,
> > >>       VIRT_PCIE_MMIO,
> > >> +    VIRT_PCIE_MMIO_HIGH,
> > >>       VIRT_PCIE_PIO,
> > >>       VIRT_PCIE_ECAM
> > >>   };
> > >> --
> > >> 2.7.4
> > >>
> > >>
> > >
> >

