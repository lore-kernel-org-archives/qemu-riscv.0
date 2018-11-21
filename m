Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPHjD-0002AI-Gb
	for mharc-qemu-riscv@gnu.org; Tue, 20 Nov 2018 20:54:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gPHjA-00028c-8m
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 20:54:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gPHj8-0000EF-Vq
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 20:54:52 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:44473)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gPHj5-00008l-Qc; Tue, 20 Nov 2018 20:54:48 -0500
Received: by mail-pl1-x642.google.com with SMTP id s5-v6so3023116plq.11;
	Tue, 20 Nov 2018 17:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=HPYQzX6cRBfhqVoaAjS9t76ZEYXCl4FaGdvuo9Brvok=;
	b=ILxTuJMz4Jx66fPdlKb0HYX5JgvGE1DMjwQfF8BcEVm89tWoWIeHa7VOVnrj5gFbcA
	B9HvLJVh3q6G1hPdh7sh3lkFKC1BZFzjhZ24FyOJ7as8v8phS2MF58XHBvjcM8wB4FqU
	RIGnsyFE9lAw+QqHy3Txhq82Yl6wB6hI93DoIM9JytNpSoD6ZEwsH7Xqgv+vqtmaZaGt
	8M+/eCeFAQJ5fFLvgP+2i0OJ33FgyfnwY9is3EdX6KPqm22YqZ5qfdXhGekbVd3y8VAb
	sHTQ9pjBg1IBcGIYXMbY8aHA79o51qoJRrwobJmBoQA1g9la2vZyXY6TjsU2VHEOHolo
	aa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HPYQzX6cRBfhqVoaAjS9t76ZEYXCl4FaGdvuo9Brvok=;
	b=SHyoeC+Z5zgc0iYJ8Pqos+/DHecRL2pmRB0mT8+hecsC2LuPO3vohz8vYEUl0Js7D1
	ywbOGRW0xH1eoLoQMkyuhlaPXLSqReaIe+EMbCFeohjD5uwId8MlJpUJfsWbqoyVeVs2
	y48RQWIJBsvjjgkP52yVIBJLMsWQugwzgm4Szsg0UMqxTxUImR8OkFheQn1gzzRf2J8H
	E4GfP76CLOi2FAMtSmamKCFGOLRt/Ww9b6Z72kKypJKLjcVwpeXSUybr8ACkYnXhKN0e
	Q1aQHhqTzosQHf9QoK3O4jExVFmhX9Spdg2VLoFTcH3WRlKmiUH8CGuWiluzd7BmnrMq
	bDOA==
X-Gm-Message-State: AGRZ1gKNz+KLLo8GCi1Tfh1YqpCDs+XL+Q/pRG0MmUyU3tYePrMxNb74
	dfIFnMpKZVKL8k52wG200m0=
X-Google-Smtp-Source: AJdET5dgAnx/f/1m3W0uQDBkRw1jdQcmwfa5dshBQmmvopH3Vx+WyYBALeFMGBjsqJTZXnzcTh6rFg==
X-Received: by 2002:a63:d904:: with SMTP id r4mr4169325pgg.207.1542765286689; 
	Tue, 20 Nov 2018 17:54:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	e65-v6sm58241517pfa.90.2018.11.20.17.54.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 17:54:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, paul.walmsley@sifive.com
References: <1542754831-25567-1-git-send-email-linux@roeck-us.net>
	<CAKmqyKNNAkBY6o06=jokZcMipmtdFyX5zq9W-cQvx96R=RzzRg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <4f96372a-0750-4a4d-c1b1-284402d0468f@roeck-us.net>
Date: Tue, 20 Nov 2018 17:54:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNNAkBY6o06=jokZcMipmtdFyX5zq9W-cQvx96R=RzzRg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 21 Nov 2018 01:54:53 -0000

Hi Alistair,

On 11/20/18 4:43 PM, Alistair Francis wrote:
> On Tue, Nov 20, 2018 at 3:01 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> - Provide separate maps for VIRT_PCIE_MMIO (32 bit) and
>>    VIRT_PCIE_MMIO_HIGH (64 bit)
>> - VIRT_PCIE_PIO is for IO ports, not for the physical address
>> - VIRT_PCIE_ECAM size reduced to size needed to cover 256 ports
>> - Use memmap[VIRT_PCIE_ECAM].size instead of memmap[VIRT_PCIE_ECAM].base
>>    to calculate the bus number range
>> - Use qemu_fdt_setprop_sized_cells() to create reg and ranges entries
>> - Fix parameters for gpex_pcie_init()
>>    (ECAM and MMIO addresses were swapped)
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Hey Gunter,
> 
> Thanks for the patch! This was causing me all kinds of headaches.
> Unfortunately I had managed to figure out the memory addresses thanks
> to Bin Meng's help.
> 
No worries. I am not married to this series. I'll give your tree a try,
hopefully tonight.

> You can see the new tree here:
> https://github.com/alistair23/qemu/tree/mainline/alistair/sifive_pcie.next
> 
> If you have anything you wan to add to that branch just let me know.
> 

One possible addition might be a 64 bit address range. I don't know
if that is needed for some pcie devices. I do see that nvme instantiates
from the 64 bit region, but I don't know if that is mandatory or just the
preference.

I would also suggest to add "include usb.mak" to the defconfig file. With this,
it is possible to support the full range of usb devices. I am using it for
various boot tests.

Thanks,
Guenter

> Alistair
> 
>> ---
>> This series applies on top of
>>          https://patchwork.kernel.org/cover/10661699/
>>
>> Tested with mmc:
>>      qemu-system-riscv64 -M virt -m 512M -no-reboot \
>>          -bios riscv64/bbl -kernel vmlinux \
>>          -netdev user,id=net0 -device virtio-net-device,netdev=net0 \
>>          -snapshot -device sdhci-pci -device sd-card,drive=d0 \
>>          -drive file=rootfs.ext2,format=raw,if=none,id=d0 \
>>          -append 'root=/dev/mmcblk0 rw rootwait panic=-1 console=ttyS0,115200' \
>>          -nographic -monitor none
>>
>> and nvme:
>>      qemu-system-riscv64 -M virt -m 512M -no-reboot \
>>          -bios riscv64/bbl -kernel vmlinux \
>>          -netdev user,id=net0 -device virtio-net-device,netdev=net0 \
>>          -snapshot -device nvme,serial=foo,drive=d0 \
>>          -drive file=rootfs.ext2,if=none,format=raw,id=d0 \
>>          -append 'root=/dev/nvme0n1 rw rootwait panic=-1 console=ttyS0,115200' \
>>          -nographic -monitor none
>>
>>   hw/riscv/virt.c         | 51 ++++++++++++++++++++++++++++++++-----------------
>>   include/hw/riscv/virt.h |  1 +
>>   2 files changed, 35 insertions(+), 17 deletions(-)
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index 1aac5ca..675899d 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -59,10 +59,10 @@ static const struct MemmapEntry {
>>       [VIRT_UART0] =    { 0x10000000,      0x100 },
>>       [VIRT_VIRTIO] =   { 0x10001000,     0x1000 },
>>       [VIRT_DRAM] =     { 0x80000000,        0x0 },
>> -    [VIRT_PCIE_MMIO] = { 0x2000000000, 0x4000000 },
>> -    [VIRT_PCIE_PIO] = { 0x2010000, 0x40000000 },
>> -    [VIRT_PCIE_ECAM] = { 0x40000000, 0x20000000 },
>> -
>> +    [VIRT_PCIE_MMIO] = { 0x40000000, 0x40000000 },
>> +    [VIRT_PCIE_MMIO_HIGH] = { 0x2000000000, 0x4000000000 },
>> +    [VIRT_PCIE_PIO] =  { 0x10002000,     0x1000 },
>> +    [VIRT_PCIE_ECAM] = { 0x30000000, 0x10000000 },
>>   };
>>
>>   #define INTERREUPT_MAP_WIDTH 7
>> @@ -231,8 +231,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>>           g_free(nodename);
>>       }
>>
>> -    nodename = g_strdup_printf("/pci@%lx",
>> -        (long) memmap[VIRT_PCIE_MMIO].base);
>> +    nodename = g_strdup_printf("/pcie@%" PRIx64, memmap[VIRT_PCIE_MMIO].base);
>>       qemu_fdt_add_subnode(fdt, nodename);
>>       qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 0x3);
>>       qemu_fdt_setprop_cells(fdt, nodename, "#interrupt-cells", 0x1);
>> @@ -242,16 +241,26 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>>       qemu_fdt_setprop_string(fdt, nodename, "device_type", "pci");
>>       qemu_fdt_setprop_cell(fdt, nodename, "linux,pci-domain", 0);
>>       qemu_fdt_setprop_cells(fdt, nodename, "bus-range", 0,
>> -                           memmap[VIRT_PCIE_ECAM].base /
>> +                           memmap[VIRT_PCIE_ECAM].size /
>>                                  PCIE_MMCFG_SIZE_MIN - 1);
>>       qemu_fdt_setprop(fdt, nodename, "dma-coherent", NULL, 0);
>> -    qemu_fdt_setprop_cells(fdt, nodename, "reg", 0x20, 0,
>> -                           0, memmap[VIRT_PCIE_ECAM].size);
>> -    qemu_fdt_setprop_cells(fdt, nodename, "ranges",
>> -                           memmap[VIRT_PCIE_PIO].base,
>> -                               0, memmap[VIRT_PCIE_PIO].size,
>> -                           0, memmap[VIRT_PCIE_MMIO].base,
>> -                               0, memmap[VIRT_PCIE_MMIO].size);
>> +    qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
>> +                                 2, memmap[VIRT_PCIE_ECAM].base,
>> +                                 2, memmap[VIRT_PCIE_ECAM].size);
>> +
>> +    qemu_fdt_setprop_sized_cells(fdt, nodename, "ranges",
>> +                                 1, FDT_PCI_RANGE_IOPORT, 2, 0,
>> +                                 2, memmap[VIRT_PCIE_PIO].base,
>> +                                 2, memmap[VIRT_PCIE_PIO].size,
>> +                                 1, FDT_PCI_RANGE_MMIO,
>> +                                 2, memmap[VIRT_PCIE_MMIO].base,
>> +                                 2, memmap[VIRT_PCIE_MMIO].base,
>> +                                 2, memmap[VIRT_PCIE_MMIO].size,
>> +                                 1, FDT_PCI_RANGE_MMIO_64BIT,
>> +                                 2, memmap[VIRT_PCIE_MMIO_HIGH].base,
>> +                                 2, memmap[VIRT_PCIE_MMIO_HIGH].base,
>> +                                 2, memmap[VIRT_PCIE_MMIO_HIGH].size);
>> +
>>       qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
>>       qemu_fdt_setprop_cells(fdt, nodename, "interrupts", PCIE_IRQ);
>>       create_pcie_irq_map(fdt, nodename, plic_phandle);
>> @@ -289,12 +298,13 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>>   static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>>                                             hwaddr ecam_base, hwaddr ecam_size,
>>                                             hwaddr mmio_base, hwaddr mmio_size,
>> +                                          hwaddr mmio_hbase, hwaddr mmio_hsize,
>>                                             hwaddr pio_base,
>>                                             DeviceState *plic, bool link_up)
>>   {
>>       DeviceState *dev;
>>       MemoryRegion *ecam_alias, *ecam_reg;
>> -    MemoryRegion *mmio_alias, *mmio_reg;
>> +    MemoryRegion *mmio_alias, *mmio_halias, *mmio_reg;
>>       qemu_irq irq;
>>       int i;
>>
>> @@ -314,6 +324,11 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>>                                mmio_reg, mmio_base, mmio_size);
>>       memory_region_add_subregion(get_system_memory(), mmio_base, mmio_alias);
>>
>> +    mmio_halias = g_new0(MemoryRegion, 1);
>> +    memory_region_init_alias(mmio_halias, OBJECT(dev), "pcie-mmio-high",
>> +                             mmio_reg, mmio_hbase, mmio_hsize);
>> +    memory_region_add_subregion(get_system_memory(), mmio_hbase, mmio_halias);
>> +
>>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, pio_base);
>>
>>       for (i = 0; i < GPEX_NUM_IRQS; i++) {
>> @@ -444,10 +459,12 @@ static void riscv_virt_board_init(MachineState *machine)
>>       }
>>
>>       dev = gpex_pcie_init(system_memory,
>> -                         memmap[VIRT_PCIE_MMIO].base,
>> -                         memmap[VIRT_PCIE_MMIO].size,
>>                            memmap[VIRT_PCIE_ECAM].base,
>>                            memmap[VIRT_PCIE_ECAM].size,
>> +                         memmap[VIRT_PCIE_MMIO].base,
>> +                         memmap[VIRT_PCIE_MMIO].size,
>> +                         memmap[VIRT_PCIE_MMIO_HIGH].base,
>> +                         memmap[VIRT_PCIE_MMIO_HIGH].size,
>>                            memmap[VIRT_PCIE_PIO].base,
>>                            DEVICE(s->plic), true);
>>       pci_bus = PCI_HOST_BRIDGE(dev)->bus;
>> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
>> index dd4fedd..99caf09 100644
>> --- a/include/hw/riscv/virt.h
>> +++ b/include/hw/riscv/virt.h
>> @@ -40,6 +40,7 @@ enum {
>>       VIRT_VIRTIO,
>>       VIRT_DRAM,
>>       VIRT_PCIE_MMIO,
>> +    VIRT_PCIE_MMIO_HIGH,
>>       VIRT_PCIE_PIO,
>>       VIRT_PCIE_ECAM
>>   };
>> --
>> 2.7.4
>>
>>
> 


