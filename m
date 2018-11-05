Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gJkql-0004Sv-AY
	for mharc-qemu-riscv@gnu.org; Mon, 05 Nov 2018 14:47:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gJkqj-0004Ka-DW
	for qemu-riscv@nongnu.org; Mon, 05 Nov 2018 14:47:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gJkqi-0003ye-4R
	for qemu-riscv@nongnu.org; Mon, 05 Nov 2018 14:47:49 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:39339)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gJkqf-0003uc-Im; Mon, 05 Nov 2018 14:47:45 -0500
Received: by mail-lj1-x241.google.com with SMTP id t9-v6so6017312ljh.6;
	Mon, 05 Nov 2018 11:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3fYA+eiUIR8V68K7ZiNz1UcJGfO6KXtV6llewdY+2Fo=;
	b=DEQCELMwbZMP6tuePtiyJhFv1X8VMwn545Mwdfm8jVOvaNestZ57sOUkF9smxci9xx
	+OovoC0fuGXkCxuE3+VrVq5HL6EaYy3YRNwKjar27zuQ4U7EnoykHN/IuH6trV7zbPQc
	Uz1eMt7zuHN/GXcA+vqh9M91DA/ZwChciZ0VtZsT2QTyaz7TZvmw9VVfO5Fhnq4O7PER
	fXorJusIoOEf3Mc8AtViTjqldPUbcm9IbMbf+mm8s9vwI5Jb7oBbXFJan23Vqc8tlpDa
	o1rQkbnkJf6bM4zh14/CwHLuleG5p79/AcZlJXS9Aw0RygTQwyHqy7QQ2LfD9qrVddCs
	L2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3fYA+eiUIR8V68K7ZiNz1UcJGfO6KXtV6llewdY+2Fo=;
	b=pie6nsYV4DRyb8s3SwgGmXygsWZGfMZ3BVXUDWLEIZqhHNr74ZvqtGMN8no7IahMaK
	ZuNqEnWWfW5rcTUmjgyfWscc7MEYzKGXIZz3+V1VGPbXfoSD8eKAX77EEENpRWLG2Xdt
	4uGDjOkTotVK+RYxEyfZ7S3PTneeOI4hJpP6pNg9hOyF94meYUuekdaRUxYRE5vvaeaV
	/GOfvYCGZ4rIgmoxZ+PFzhULnV08dRInzsZ1ksfBPg0Y1Sh7EEPi7wuMcqg/Azvibcw6
	irihnGgWKnGQPgZ5RmAHjZjVLnbg9Ls9mKfiZdh+hIGtZLhDiiSvCbA7diiqmGweRVkK
	ODOw==
X-Gm-Message-State: AGRZ1gLMtmKgnUcK8xjFpAnI4gN8fEf704GvANgA0xvcnyDB7LM7JLVp
	T9T50HNU7IJD/y6J7G0TIIcdubA9YrA+Lpwz3Mk=
X-Google-Smtp-Source: AJdET5f4gBIkwK/sFXrhzaphNrvzReZKHWMYEeJhSBlzkdv9CJO1Pw23u/k99Xdh0unZRtrJqfBHoodYrfDCbrYoUV8=
X-Received: by 2002:a2e:4218:: with SMTP id
	p24-v6mr15093395lja.58.1541447264002; 
	Mon, 05 Nov 2018 11:47:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1540937826.git.alistair.francis@wdc.com>
	<546aa18b75a04a281e82706ea41ee9a4a9f3e2bc.1540937826.git.alistair.francis@wdc.com>
	<CAEUhbmVsCMLAJK3tyhuo0UGocfYOHLb-+v0z4FYyXSQi7SLsYg@mail.gmail.com>
In-Reply-To: <CAEUhbmVsCMLAJK3tyhuo0UGocfYOHLb-+v0z4FYyXSQi7SLsYg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Nov 2018 11:47:17 -0800
Message-ID: <CAKmqyKNJqsAWkwrPW17iz9MgGEm2d+8szNRKWoHyuoxWebfx=g@mail.gmail.com>
To: bmeng.cn@gmail.com
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 2/5] hw/riscv/virt: Connect
 the gpex PCIe
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
X-List-Received-Date: Mon, 05 Nov 2018 19:47:50 -0000

On Mon, Nov 5, 2018 at 5:24 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi,
>
> On Wed, Oct 31, 2018 at 6:22 AM Alistair Francis
> <Alistair.Francis@wdc.com> wrote:
> >
> > Connect the gpex PCIe device based on the device tree included in the
> > HiFive Unleashed ROM.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  default-configs/riscv32-softmmu.mak |   6 +-
> >  default-configs/riscv64-softmmu.mak |   6 +-
> >  hw/riscv/virt.c                     | 111 ++++++++++++++++++++++++++++
> >  include/hw/riscv/virt.h             |   8 +-
> >  4 files changed, 127 insertions(+), 4 deletions(-)
> >
> > diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-softmmu.mak
> > index 7937c69e22..3e3d195f37 100644
> > --- a/default-configs/riscv32-softmmu.mak
> > +++ b/default-configs/riscv32-softmmu.mak
> > @@ -1,7 +1,11 @@
> >  # Default configuration for riscv-softmmu
> >
> > +include pci.mak
> > +
> >  CONFIG_SERIAL=y
> >  CONFIG_VIRTIO_MMIO=y
> > -include virtio.mak
> >
> >  CONFIG_CADENCE=y
> > +
> > +CONFIG_PCI_GENERIC=y
> > +CONFIG_PCI_XILINX=y
> > diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-softmmu.mak
> > index 7937c69e22..3e3d195f37 100644
> > --- a/default-configs/riscv64-softmmu.mak
> > +++ b/default-configs/riscv64-softmmu.mak
> > @@ -1,7 +1,11 @@
> >  # Default configuration for riscv-softmmu
> >
> > +include pci.mak
> > +
> >  CONFIG_SERIAL=y
> >  CONFIG_VIRTIO_MMIO=y
> > -include virtio.mak
> >
> >  CONFIG_CADENCE=y
> > +
> > +CONFIG_PCI_GENERIC=y
> > +CONFIG_PCI_XILINX=y
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 4a137a503c..2fbe58ba4b 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -39,6 +39,8 @@
> >  #include "sysemu/arch_init.h"
> >  #include "sysemu/device_tree.h"
> >  #include "exec/address-spaces.h"
> > +#include "hw/pci/pci.h"
> > +#include "hw/pci-host/gpex.h"
> >  #include "elf.h"
> >
> >  #include <libfdt.h>
> > @@ -55,6 +57,10 @@ static const struct MemmapEntry {
> >      [VIRT_UART0] =    { 0x10000000,      0x100 },
> >      [VIRT_VIRTIO] =   { 0x10001000,     0x1000 },
> >      [VIRT_DRAM] =     { 0x80000000,        0x0 },
> > +    [VIRT_PCIE_MMIO] = { 0x2000000000, 0x4000000 },
>
> Does this work with RV32?

That's a good point, probably not. This is based on the HiFive
unleashed values to be as similar as possible.

>
> > +    [VIRT_PCIE_PIO] = { 0x2010000, 0x40000000 },
> > +    [VIRT_PCIE_ECAM] = { 0x40000000, 0x20000000 },
> > +
> >  };
> >
> >  static uint64_t load_kernel(const char *kernel_filename)
> > @@ -98,6 +104,37 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
> >      return *start + size;
> >  }
> >
> > +#define INTERREUPT_MAP_WIDTH 7
> > +
> > +static void create_pcie_irq_map(void *fdt, char *nodename,
> > +                                uint32_t plic_phandle)
> > +{
> > +    int pin;
> > +    uint32_t full_irq_map[GPEX_NUM_IRQS * INTERREUPT_MAP_WIDTH] = { 0 };
> > +    uint32_t *irq_map = full_irq_map;
> > +
> > +        for (pin = 0; pin < GPEX_NUM_IRQS; pin++) {
> > +            int irq_nr = PCIE_IRQ + (pin % PCI_NUM_PINS);
> > +            int i;
> > +
> > +            uint32_t map[] = {
> > +                0, 0, 0,
> > +                pin + 1, plic_phandle, 0, irq_nr};
> > +
> > +            /* Convert map to big endian */
> > +            for (i = 0; i < INTERREUPT_MAP_WIDTH; i++) {
> > +                irq_map[i] = cpu_to_be32(map[i]);
> > +            }
> > +            irq_map += INTERREUPT_MAP_WIDTH;
> > +        }
> > +
> > +    qemu_fdt_setprop(fdt, nodename, "interrupt-map",
> > +                     full_irq_map, sizeof(full_irq_map));
> > +
> > +    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-map-mask",
> > +                           0, 0, 0, 0x7);
> > +}
> > +
> >  static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
> >      uint64_t mem_size, const char *cmdline)
> >  {
> > @@ -233,6 +270,31 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
> >          g_free(nodename);
> >      }
> >
> > +    nodename = g_strdup_printf("/pci@%lx",
> > +        (long) memmap[VIRT_PCIE_MMIO].base);
> > +    qemu_fdt_add_subnode(fdt, nodename);
> > +    qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 0x3);
> > +    qemu_fdt_setprop_cells(fdt, nodename, "#interrupt-cells", 0x1);
> > +    qemu_fdt_setprop_cells(fdt, nodename, "#size-cells", 0x2);
> > +    qemu_fdt_setprop_string(fdt, nodename, "compatible",
> > +                            "pci-host-ecam-generic");
> > +    qemu_fdt_setprop_string(fdt, nodename, "device_type", "pci");
> > +    qemu_fdt_setprop_cell(fdt, nodename, "linux,pci-domain", 0);
> > +    qemu_fdt_setprop_cells(fdt, nodename, "bus-range", 0,
> > +                           memmap[VIRT_PCIE_ECAM].base /
> > +                               PCIE_MMCFG_SIZE_MIN - 1);
> > +    qemu_fdt_setprop(fdt, nodename, "dma-coherent", NULL, 0);
> > +    qemu_fdt_setprop_cells(fdt, nodename, "reg", 0x20, 0,
> > +                           0, memmap[VIRT_PCIE_ECAM].size);
> > +    qemu_fdt_setprop_cells(fdt, nodename, "ranges",
> > +                           memmap[VIRT_PCIE_PIO].base,
> > +                               0, memmap[VIRT_PCIE_PIO].size,
> > +                           0, memmap[VIRT_PCIE_MMIO].base,
> > +                               0, memmap[VIRT_PCIE_MMIO].size);
>
> This does not conform with the PCI bus ranges encoding.

Do you know what should?

I have tried so many different combinations here and nothing seems to work.

Alistair

>
> > +    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
> > +    qemu_fdt_setprop_cells(fdt, nodename, "interrupts", PCIE_IRQ);
> > +    create_pcie_irq_map(fdt, nodename, plic_phandle);
> > +
> >      nodename = g_strdup_printf("/test@%lx",
> >          (long)memmap[VIRT_TEST].base);
> >      qemu_fdt_add_subnode(fdt, nodename);
> > @@ -262,6 +324,47 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
> >      return fdt;
> >  }
> >
>
> [snip]
>
> Regards,
> Bin

