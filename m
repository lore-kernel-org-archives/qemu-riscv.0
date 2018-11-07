Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKVf3-0004jf-ED
	for mharc-qemu-riscv@gnu.org; Wed, 07 Nov 2018 16:46:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gKVf0-0004hj-RW
	for qemu-riscv@nongnu.org; Wed, 07 Nov 2018 16:46:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gKVez-0006y5-C0
	for qemu-riscv@nongnu.org; Wed, 07 Nov 2018 16:46:50 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:37470)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gKVeq-0006cp-ER; Wed, 07 Nov 2018 16:46:41 -0500
Received: by mail-lj1-x241.google.com with SMTP id e5-v6so12013347lja.4;
	Wed, 07 Nov 2018 13:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R8r4d1/nmlvF08SE3CnSRDWcTBQFCbvg13byBw7gIbw=;
	b=B+GP0faIKDMdl/Bzb8+p+U3pUzzFeBKRpd7y+WVmVeNFapVjVtNWEOHNVYGEPsnW15
	5oaFByDFk6TuVumkA7qTTL4JRuq6N3qcCnRDjQ14k8wK14CxBmZM3JYFsyPYQbYCrtQ8
	u5EkRAFeD2ltV8lqoWO9Wa8/XvJO0+cQhTUfWUT2pU4qUjGpSbsafA+cmCFeKdrIE5Vs
	tNlRuOr2eu14Y4WzY8BzOQPh5H1ZNZjMYLH2A4HWkZIsOC0uRn1iZpD0mSv4+2aXCDka
	c3mLLNQrI7gOR/OJbJ5ekjGMWk9PdJ4iEAS1jLyMbYZL1FnjF2n4FRSgZZNDl/rvWkPh
	uR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R8r4d1/nmlvF08SE3CnSRDWcTBQFCbvg13byBw7gIbw=;
	b=RAHESbqDE6de8+U6PJeSPsCZ3yS0zM8eiJrEObwjCkO1ABda/MXBhUxqEe/0XHsrm5
	bRXvImkVEEgK0ecOv8porGGn0LnxT2sqqx75pggcg8xJ0AeP/wE9OYqi0fYq0s9x7o+i
	IYHW+H3D218JHG1gaSIRDBYMUQSjBLNglemk2wYlKPdKL7v6lpcMr03bEQ45hBmRPrZI
	YLd0o1psva6OzbZ9c/sYIDhzVyIVoEaHDgWOTovLfzifHRfxf9g+fDEVUnArbqhQEgO2
	VqJ1IXfCq5KEMu57ndR6e8NMPGRyDHZ78F551QHfpYY7jDOnVS1kolpxMnkANQ4KicaI
	TKoQ==
X-Gm-Message-State: AGRZ1gJGMolVKnsBBkf2gw+pWa5xSLCinlZhhvtSbE5hWWF9f98h/NGx
	EGgWEyn0fUjApyR2Swrk4Y90W3SoaEZ8aHNYqsU=
X-Google-Smtp-Source: AJdET5eJaomQXKmqVRgW92BINzY3x7YPRVJ0f/UGInv9bGCRx4dBYwnL6w62kF94wDYFrZoZK1s7iVYH/fZwG2RY2Jo=
X-Received: by 2002:a2e:8605:: with SMTP id a5-v6mr353169lji.145.1541627193401;
	Wed, 07 Nov 2018 13:46:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1540937826.git.alistair.francis@wdc.com>
	<546aa18b75a04a281e82706ea41ee9a4a9f3e2bc.1540937826.git.alistair.francis@wdc.com>
	<CAEUhbmVsCMLAJK3tyhuo0UGocfYOHLb-+v0z4FYyXSQi7SLsYg@mail.gmail.com>
	<CAKmqyKNJqsAWkwrPW17iz9MgGEm2d+8szNRKWoHyuoxWebfx=g@mail.gmail.com>
	<CAEUhbmXSx0yz9Osqc-o2TbqQTAzF+LPwb7-A5FruYv-UZnU0+w@mail.gmail.com>
In-Reply-To: <CAEUhbmXSx0yz9Osqc-o2TbqQTAzF+LPwb7-A5FruYv-UZnU0+w@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Nov 2018 13:46:05 -0800
Message-ID: <CAKmqyKP43PaNZ41y6T5Txaoyrv1xZNcKY96q0-iD5-8mK9Fe7Q@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
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
X-List-Received-Date: Wed, 07 Nov 2018 21:46:52 -0000

On Mon, Nov 5, 2018 at 10:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Tue, Nov 6, 2018 at 3:47 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Mon, Nov 5, 2018 at 5:24 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Oct 31, 2018 at 6:22 AM Alistair Francis
> > > <Alistair.Francis@wdc.com> wrote:
> > > >
> > > > Connect the gpex PCIe device based on the device tree included in the
> > > > HiFive Unleashed ROM.
> > > >
> > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >  default-configs/riscv32-softmmu.mak |   6 +-
> > > >  default-configs/riscv64-softmmu.mak |   6 +-
> > > >  hw/riscv/virt.c                     | 111 ++++++++++++++++++++++++++++
> > > >  include/hw/riscv/virt.h             |   8 +-
> > > >  4 files changed, 127 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-softmmu.mak
> > > > index 7937c69e22..3e3d195f37 100644
> > > > --- a/default-configs/riscv32-softmmu.mak
> > > > +++ b/default-configs/riscv32-softmmu.mak
> > > > @@ -1,7 +1,11 @@
> > > >  # Default configuration for riscv-softmmu
> > > >
> > > > +include pci.mak
> > > > +
> > > >  CONFIG_SERIAL=y
> > > >  CONFIG_VIRTIO_MMIO=y
> > > > -include virtio.mak
> > > >
> > > >  CONFIG_CADENCE=y
> > > > +
> > > > +CONFIG_PCI_GENERIC=y
> > > > +CONFIG_PCI_XILINX=y
> > > > diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-softmmu.mak
> > > > index 7937c69e22..3e3d195f37 100644
> > > > --- a/default-configs/riscv64-softmmu.mak
> > > > +++ b/default-configs/riscv64-softmmu.mak
> > > > @@ -1,7 +1,11 @@
> > > >  # Default configuration for riscv-softmmu
> > > >
> > > > +include pci.mak
> > > > +
> > > >  CONFIG_SERIAL=y
> > > >  CONFIG_VIRTIO_MMIO=y
> > > > -include virtio.mak
> > > >
> > > >  CONFIG_CADENCE=y
> > > > +
> > > > +CONFIG_PCI_GENERIC=y
> > > > +CONFIG_PCI_XILINX=y
> > > > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > > > index 4a137a503c..2fbe58ba4b 100644
> > > > --- a/hw/riscv/virt.c
> > > > +++ b/hw/riscv/virt.c
> > > > @@ -39,6 +39,8 @@
> > > >  #include "sysemu/arch_init.h"
> > > >  #include "sysemu/device_tree.h"
> > > >  #include "exec/address-spaces.h"
> > > > +#include "hw/pci/pci.h"
> > > > +#include "hw/pci-host/gpex.h"
> > > >  #include "elf.h"
> > > >
> > > >  #include <libfdt.h>
> > > > @@ -55,6 +57,10 @@ static const struct MemmapEntry {
> > > >      [VIRT_UART0] =    { 0x10000000,      0x100 },
> > > >      [VIRT_VIRTIO] =   { 0x10001000,     0x1000 },
> > > >      [VIRT_DRAM] =     { 0x80000000,        0x0 },
> > > > +    [VIRT_PCIE_MMIO] = { 0x2000000000, 0x4000000 },
> > >
> > > Does this work with RV32?
> >
> > That's a good point, probably not. This is based on the HiFive
> > unleashed values to be as similar as possible.
> >
>
> Please specifying a 32-bit address to make it work for both 32-bit and 64-bit.

Fixed.

>
> > >
> > > > +    [VIRT_PCIE_PIO] = { 0x2010000, 0x40000000 },
> > > > +    [VIRT_PCIE_ECAM] = { 0x40000000, 0x20000000 },
>
> Forgot to mention: the maximum size of ECAM is 0x10000000 by spec.

Fixed

>
> > > > +
> > > >  };
> > > >
> > > >  static uint64_t load_kernel(const char *kernel_filename)
> > > > @@ -98,6 +104,37 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
> > > >      return *start + size;
> > > >  }
> > > >
> > > > +#define INTERREUPT_MAP_WIDTH 7
> > > > +
> > > > +static void create_pcie_irq_map(void *fdt, char *nodename,
> > > > +                                uint32_t plic_phandle)
> > > > +{
> > > > +    int pin;
> > > > +    uint32_t full_irq_map[GPEX_NUM_IRQS * INTERREUPT_MAP_WIDTH] = { 0 };
> > > > +    uint32_t *irq_map = full_irq_map;
> > > > +
> > > > +        for (pin = 0; pin < GPEX_NUM_IRQS; pin++) {
> > > > +            int irq_nr = PCIE_IRQ + (pin % PCI_NUM_PINS);
> > > > +            int i;
> > > > +
> > > > +            uint32_t map[] = {
> > > > +                0, 0, 0,
> > > > +                pin + 1, plic_phandle, 0, irq_nr};
> > > > +
> > > > +            /* Convert map to big endian */
> > > > +            for (i = 0; i < INTERREUPT_MAP_WIDTH; i++) {
> > > > +                irq_map[i] = cpu_to_be32(map[i]);
> > > > +            }
> > > > +            irq_map += INTERREUPT_MAP_WIDTH;
> > > > +        }
> > > > +
> > > > +    qemu_fdt_setprop(fdt, nodename, "interrupt-map",
> > > > +                     full_irq_map, sizeof(full_irq_map));
> > > > +
> > > > +    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-map-mask",
> > > > +                           0, 0, 0, 0x7);
> > > > +}
> > > > +
> > > >  static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
> > > >      uint64_t mem_size, const char *cmdline)
> > > >  {
> > > > @@ -233,6 +270,31 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
> > > >          g_free(nodename);
> > > >      }
> > > >
> > > > +    nodename = g_strdup_printf("/pci@%lx",
> > > > +        (long) memmap[VIRT_PCIE_MMIO].base);
> > > > +    qemu_fdt_add_subnode(fdt, nodename);
> > > > +    qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 0x3);
> > > > +    qemu_fdt_setprop_cells(fdt, nodename, "#interrupt-cells", 0x1);
> > > > +    qemu_fdt_setprop_cells(fdt, nodename, "#size-cells", 0x2);
> > > > +    qemu_fdt_setprop_string(fdt, nodename, "compatible",
> > > > +                            "pci-host-ecam-generic");
> > > > +    qemu_fdt_setprop_string(fdt, nodename, "device_type", "pci");
> > > > +    qemu_fdt_setprop_cell(fdt, nodename, "linux,pci-domain", 0);
> > > > +    qemu_fdt_setprop_cells(fdt, nodename, "bus-range", 0,
> > > > +                           memmap[VIRT_PCIE_ECAM].base /
> > > > +                               PCIE_MMCFG_SIZE_MIN - 1);
> > > > +    qemu_fdt_setprop(fdt, nodename, "dma-coherent", NULL, 0);
> > > > +    qemu_fdt_setprop_cells(fdt, nodename, "reg", 0x20, 0,
> > > > +                           0, memmap[VIRT_PCIE_ECAM].size);
> > > > +    qemu_fdt_setprop_cells(fdt, nodename, "ranges",
> > > > +                           memmap[VIRT_PCIE_PIO].base,
> > > > +                               0, memmap[VIRT_PCIE_PIO].size,
> > > > +                           0, memmap[VIRT_PCIE_MMIO].base,
> > > > +                               0, memmap[VIRT_PCIE_MMIO].size);
> > >
> > > This does not conform with the PCI bus ranges encoding.
> >
> > Do you know what should?
> >
> > I have tried so many different combinations here and nothing seems to work.
> >
>
>     qemu_fdt_setprop_sized_cells(fdt, nodename, "ranges",
>         1, FDT_PCI_RANGE_IOPORT, 2, 0,
>         2, memmap[VIRT_PCIE_PIO].base, 2, memmap[VIRT_PCIE_PIO].size,
>         1, FDT_PCI_RANGE_MMIO_64BIT,
>         2, memmap[VIRT_PCIE_MMIO].base,
>         2, memmap[VIRT_PCIE_MMIO].base, 2, memmap[VIRT_PCIE_MMIO].size);

I'm sure I tried this (based on the ARM virt implementation) and it
didn't work, but it's working now. Thanks for the help! It looks like
memory accesses are fully working, interrupts still aren't though.

Alistair

>
> Note if we are using 32-bit address for the MMIO,
> FDT_PCI_RANGE_MMIO_64BIT should be FDT_PCI_RANGE_MMIO.
>
> Regards,
> Bin

