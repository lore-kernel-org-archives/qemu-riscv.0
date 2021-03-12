Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKWHn-00048Q-P6
	for mharc-qemu-riscv@gnu.org; Thu, 11 Mar 2021 20:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKWHm-00042G-5j; Thu, 11 Mar 2021 20:08:14 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:43630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKWHj-00025z-7h; Thu, 11 Mar 2021 20:08:13 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id u75so23643362ybi.10;
 Thu, 11 Mar 2021 17:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HS0XhVstu4xXlZNqhDaAiK/bQ4Zzee8sNJeIiQEhU5A=;
 b=q/epgEOftjgdkM8HrL/Dt/3DibSYfE3IS9GJd536lOifhOt+Z/ZOk+zgmuNJj2GgX7
 TqnU42i3dGA8aIx3UxguZHgc6m/h6QVTuHCIfIF6Y3pZ9I5GP5F77K5LUSkTAa/GXgLF
 I+hFQ3CySyTdKl0cWMOoQWKKO0MqH2xeTLI6XdZTPcn1LGDOa2R7n3pBOAtX7x/8eMl3
 +hB1ncMm7aCgD14vGEdQbuWNRC+IvSOWTNmE69C2/r06mWTeqG708CCImAkDPQ3h7kkk
 QEb4EtKspFsv2bYgKpKFOXrRsQf93RM2U7xbrabzrjAlcmzmdXaNDo80J0u9dJwK+GZJ
 Orog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HS0XhVstu4xXlZNqhDaAiK/bQ4Zzee8sNJeIiQEhU5A=;
 b=aeaxIrl8IeccMOZ+onLLHRjp2QPqtCGahej4aWpW/HpxmUIgYhYts5CGWpDUsSPIZF
 W3Lo8Fa4B+5FgN2AAQMfjBV665RvE04MCr+BkkX2YZ2Sz/c/Zob6QFdvZQ+V19ZVJhA9
 MaOMZb+sKjW5nLHCUBGPaNN6aCYtkcDhvvlujffbkS1MAN0twB1S2/6aUCX28N1Y9Y0u
 Xcyv0s+1niqhW7qTwxoojvrxBV1ehRYkIj2+Bb+U4H+FrrddMoPjfGDTeEZaPBxLvVw+
 IWP5G+MAUdQJTUddmOtwq9e0jHOGWNsBljFuQr7S7dhaJ3HtSrrwHKTDq4rtwYO33SjK
 gY6Q==
X-Gm-Message-State: AOAM533GcfIFV567Q8mWpkNRpYaT6drTFRrCpZrtkcGaJA+C3yjvcKp3
 +inOh7xBQyqq+5NM7JxNswz+ggW0smEhnd22ycA=
X-Google-Smtp-Source: ABdhPJwM1dsh+tVYUvlq+pvIU8SQGwuLkyPQaqD2jzA60p/PfX40poIFM9O/pxjmqbqGCz7bkmNLuV/Oan1G8Xvzpis=
X-Received: by 2002:a25:d08d:: with SMTP id
 h135mr15809478ybg.122.1615511289654; 
 Thu, 11 Mar 2021 17:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20210310033358.30499-1-dylan@andestech.com>
 <20210310033358.30499-4-dylan@andestech.com>
 <CAEUhbmWAfYLuEOD_epjA=4d27JDV+iVdACOmj2B6PSR0Dg1wdQ@mail.gmail.com>
 <20210311065037.GA469@atcfdc88>
 <CAKmqyKPdyEjMdp36PjD-zP6LvnAzAi-00+4zASi3bRyRp=+k2A@mail.gmail.com>
In-Reply-To: <CAKmqyKPdyEjMdp36PjD-zP6LvnAzAi-00+4zASi3bRyRp=+k2A@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 12 Mar 2021 09:07:58 +0800
Message-ID: <CAEUhbmXkf3k6XN2JNYahA+TvoeQgp034mNFAQmJd+A++nkO+RQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] Andes AE350 RISC-V Machine
To: Alistair Francis <alistair23@gmail.com>
Cc: Dylan Jhong <dylan@andestech.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "Ruinland Chuan-Tzu Tsa(((((((((()" <ruinland@andestech.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
X-List-Received-Date: Fri, 12 Mar 2021 01:08:14 -0000

On Thu, Mar 11, 2021 at 11:47 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Mar 11, 2021 at 2:03 AM Dylan Jhong <dylan@andestech.com> wrote:
> >
> > On Wed, Mar 10, 2021 at 02:15:25PM +0800, Bin Meng wrote:
> > > On Wed, Mar 10, 2021 at 11:36 AM Dylan Jhong <dylan@andestech.com> wrote:
> > > >
> > > > This provides a RISC-V Board based on Andes's AE350 specification.
> > > > The following machine is implemented:
> > > >
> > > > - 'andes_ae350'; PLIC, PLICSW, PLMT, 16550a UART, VirtIO MMIO, device-tree
> > >
> > > Is this a virtual target because virtio is added? Or does the hardware
> > > provide the virtio programming interface?
> >
> > Andes ae350 is an FPGA evaluation board with many Andes's peripheral devices,
> > but we only provide the most basic functions in the qemu version of ae350.
> > Because we hope that customers can quickly develop and evaluate before getting the real ae350 board,
> > so we use virtio to replace some peripheral devices.
>
> I don't think that's a good idea. The QEMU model should match the
> hardware device.
>

Agree. It is very confusing to add a virtio to a machine that has a
real world board.

> >
> > >
> > > >
> > > > Signed-off-by: Dylan Jhong <dylan@andestech.com>
> > > > Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> > > > ---
> > > >  default-configs/devices/riscv32-softmmu.mak |   1 +
> > > >  default-configs/devices/riscv64-softmmu.mak |   1 +
> > > >  hw/riscv/Kconfig                            |   7 +
> > > >  hw/riscv/andes_ae350.c                      | 501 ++++++++++++++++++++
> > > >  hw/riscv/meson.build                        |   1 +
> > > >  include/hw/riscv/andes_ae350.h              |  93 ++++
> > > >  6 files changed, 604 insertions(+)
> > > >  create mode 100644 hw/riscv/andes_ae350.c
> > > >  create mode 100644 include/hw/riscv/andes_ae350.h
> > > >
> > > > diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
> > > > index d847bd5692..a268007e72 100644
> > > > --- a/default-configs/devices/riscv32-softmmu.mak
> > > > +++ b/default-configs/devices/riscv32-softmmu.mak
> > > > @@ -8,6 +8,7 @@ CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> > > >
> > > >  # Boards:
> > > >  #
> > > > +CONFIG_ANDES_AE350=y
> > > >  CONFIG_SPIKE=y
> > > >  CONFIG_SIFIVE_E=y
> > > >  CONFIG_SIFIVE_U=y
> > > > diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
> > > > index d5eec75f05..9a37dfd8c0 100644
> > > > --- a/default-configs/devices/riscv64-softmmu.mak
> > > > +++ b/default-configs/devices/riscv64-softmmu.mak
> > > > @@ -8,6 +8,7 @@ CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> > > >
> > > >  # Boards:
> > > >  #
> > > > +CONFIG_ANDES_AE350=y
> > > >  CONFIG_SPIKE=y
> > > >  CONFIG_SIFIVE_E=y
> > > >  CONFIG_SIFIVE_U=y
> > > > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> > > > index d139074b02..04f6369ab7 100644
> > > > --- a/hw/riscv/Kconfig
> > > > +++ b/hw/riscv/Kconfig
> > > > @@ -1,6 +1,13 @@
> > > >  config IBEX
> > > >      bool
> > > >
> > > > +config ANDES_AE350
> > >
> > > This needs to be sorted in alphabetical order
> > >
> >
> > Thanks, this will be fixed in V2.
> >
> > > > +    bool
> > > > +    select SERIAL
> > > > +    select VIRTIO_MMIO
> > > > +    select ANDES_PLIC
> > > > +    select ANDES_PLMT
> > > > +
> > > >  config MICROCHIP_PFSOC
> > > >      bool
> > > >      select CADENCE_SDHCI
> > > > diff --git a/hw/riscv/andes_ae350.c b/hw/riscv/andes_ae350.c
> > > > new file mode 100644
> > > > index 0000000000..ed5f9701ad
> > > > --- /dev/null
> > > > +++ b/hw/riscv/andes_ae350.c
> > > > @@ -0,0 +1,501 @@
> > > > +/*
> > > > + * Andes RISC-V AE350 Board
> > > > + *
> > > > + * Copyright (c) 2021 Andes Tech. Corp.
> > > > + *
> > > > + * Andes AE350 Board supports ns16550a UART and VirtIO MMIO.
> > > > + * The interrupt controllers are andes PLIC and andes PLICSW.
> > > > + * Timer is Andes PLMT.
> > > > + *
> > > > + * This program is free software; you can redistribute it and/or modify it
> > > > + * under the terms and conditions of the GNU General Public License,
> > > > + * version 2 or later, as published by the Free Software Foundation.
> > > > + *
> > > > + * This program is distributed in the hope it will be useful, but WITHOUT
> > > > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > > > + * more details.
> > > > + *
> > > > + * You should have received a copy of the GNU General Public License along with
> > > > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > > > + */
> > > > +
> > > > +#include "qemu/osdep.h"
> > > > +#include "qemu/units.h"
> > > > +#include "qemu/log.h"
> > > > +#include "qemu/error-report.h"
> > > > +#include "qapi/error.h"
> > > > +#include "hw/boards.h"
> > > > +#include "hw/loader.h"
> > > > +#include "hw/sysbus.h"
> > > > +#include "hw/qdev-properties.h"
> > > > +#include "hw/char/serial.h"
> > > > +#include "target/riscv/cpu.h"
> > > > +#include "hw/riscv/riscv_hart.h"
> > > > +#include "hw/riscv/boot.h"
> > > > +#include "hw/riscv/numa.h"
> > > > +#include "chardev/char.h"
> > > > +#include "sysemu/arch_init.h"
> > > > +#include "sysemu/device_tree.h"
> > > > +#include "sysemu/sysemu.h"
> > > > +#include "hw/pci/pci.h"
> > > > +#include "hw/pci-host/gpex.h"
> > > > +
> > > > +#include "hw/intc/andes_plic.h"
> > > > +#include "hw/timer/andes_plmt.h"
> > > > +#include "hw/riscv/andes_ae350.h"
> > > > +
> > > > +# define BIOS_FILENAME ""
> > > > +
> > > > +static const struct MemmapEntry {
> > > > +    hwaddr base;
> > > > +    hwaddr size;
> > > > +} andes_ae350_memmap[] = {
> > > > +    [ANDES_AE350_DEBUG]     = { 0x00000000,      0x100 },
> > > > +    [ANDES_AE350_DRAM]      = { 0x00000000, 0x80000000 },
> > > > +    [ANDES_AE350_MROM]      = { 0xb0000000,   0x100000 },
> > > > +    [ANDES_AE350_MAC]       = { 0xe0100000,   0x100000 },
> > > > +    [ANDES_AE350_GEM]       = { 0xe0200000,   0x100000 },
> > > > +    [ANDES_AE350_PLIC]      = { 0xe4000000,   0x400000 },
> > > > +    [ANDES_AE350_PLMT]      = { 0xe6000000,   0x100000 },
> > > > +    [ANDES_AE350_PLICSW]    = { 0xe6400000,   0x400000 },
> > > > +    [ANDES_AE350_UART1]     = { 0xf0200000,      0x100 },
> > > > +    [ANDES_AE350_UART2]     = { 0xf0300000,      0x100 },
> > > > +    [ANDES_AE350_PIT]       = { 0xf0400000,   0x100000 },
> > > > +    [ANDES_AE350_SDC]       = { 0xf0e00000,   0x100000 },
> > > > +    [ANDES_AE350_VIRTIO]    = { 0xfe000000,     0x1000 },
> > > > +};
> > > > +
> > > > +static void
> > > > +create_fdt(AndesAe350BoardState *bs, const struct MemmapEntry *memmap,
> > > > +    uint64_t mem_size, const char *cmdline)
> > > > +{
> > > > +    AndesAe350SocState *s = &bs->soc;
> > > > +    MachineState *ms = MACHINE(qdev_get_machine());
> > > > +    void *fdt;
> > > > +    int cpu, i;
> > > > +    uint64_t mem_addr;
> > > > +    uint32_t *plic_irq_ext, *plicsw_irq_ext, *plmt_irq_ext;
> > > > +    unsigned long plic_addr, plicsw_addr, plmt_addr;
> > > > +    char *plic_name, *plicsw_name, *plmt_name;
> > > > +    uint32_t intc_phandle = 0, plic_phandle = 0;
> > > > +    uint32_t phandle = 1;
> > > > +    char *isa_name, *mem_name, *cpu_name, *intc_name, *uart_name, *virtio_name;
> > > > +
> > > > +    if (ms->dtb) {
> > > > +        fdt = bs->fdt = load_device_tree(ms->dtb, &bs->fdt_size);
> > > > +        if (!fdt) {
> > > > +            error_report("load_device_tree() failed");
> > > > +            exit(1);
> > > > +        }
> > > > +        goto update_bootargs;
> > > > +    } else {
> > > > +        fdt = bs->fdt = create_device_tree(&bs->fdt_size);
> > > > +        if (!fdt) {
> > > > +            error_report("create_device_tree() failed");
> > > > +            exit(1);
> > > > +        }
> > > > +    }
> > > > +
> > > > +    qemu_fdt_setprop_string(fdt, "/", "model", "Andes AE350 Board");
> > > > +    qemu_fdt_setprop_string(fdt, "/", "compatible", "andestech,ae350");
> > > > +    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
> > > > +    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
> > > > +
> > > > +    qemu_fdt_add_subnode(fdt, "/soc");
> > > > +    qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
> > > > +    qemu_fdt_setprop_string(fdt, "/soc", "compatible", "simple-bus");
> > > > +    qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
> > > > +    qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
> > > > +
> > > > +    qemu_fdt_add_subnode(fdt, "/cpus");
> > > > +    qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> > > > +                          ANDES_PLMT_TIMEBASE_FREQ);
> > > > +    qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> > > > +    qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> > > > +    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
> > > > +
> > > > +    plic_irq_ext = g_new0(uint32_t, s->cpus.num_harts * 4);
> > > > +    plicsw_irq_ext = g_new0(uint32_t, s->cpus.num_harts * 2);
> > > > +    plmt_irq_ext = g_new0(uint32_t, s->cpus.num_harts * 2);
> > > > +
> > > > +    for (cpu = 0; cpu < s->cpus.num_harts; cpu++) {
> > > > +        intc_phandle = phandle++;
> > > > +
> > > > +        cpu_name = g_strdup_printf("/cpus/cpu@%d",
> > > > +            s->cpus.hartid_base + cpu);
> > > > +        qemu_fdt_add_subnode(fdt, cpu_name);
> > > > +#if defined(TARGET_RISCV32)
> > > > +        qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv32");
> > > > +#else
> > > > +        qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv39");
> > > > +#endif
> > > > +        isa_name = riscv_isa_string(&s->cpus.harts[cpu]);
> > > > +        qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", isa_name);
> > > > +        g_free(isa_name);
> > > > +        qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv");
> > > > +        qemu_fdt_setprop_string(fdt, cpu_name, "status", "okay");
> > > > +        qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
> > > > +            s->cpus.hartid_base + cpu);
> > > > +        qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu");
> > > > +
> > > > +        intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
> > > > +        qemu_fdt_add_subnode(fdt, intc_name);
> > > > +        qemu_fdt_setprop_cell(fdt, intc_name, "phandle", intc_phandle);
> > > > +        qemu_fdt_setprop_string(fdt, intc_name, "compatible",
> > > > +            "riscv,cpu-intc");
> > > > +        qemu_fdt_setprop(fdt, intc_name, "interrupt-controller", NULL, 0);
> > > > +        qemu_fdt_setprop_cell(fdt, intc_name, "#interrupt-cells", 1);
> > > > +
> > > > +        plic_irq_ext[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
> > > > +        plic_irq_ext[cpu * 4 + 1] = cpu_to_be32(IRQ_M_EXT);
> > > > +        plic_irq_ext[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
> > > > +        plic_irq_ext[cpu * 4 + 3] = cpu_to_be32(IRQ_S_EXT);
> > > > +
> > > > +        plicsw_irq_ext[cpu * 2 + 0] = cpu_to_be32(intc_phandle);
> > > > +        plicsw_irq_ext[cpu * 2 + 1] = cpu_to_be32(IRQ_M_SOFT);
> > > > +
> > > > +        plmt_irq_ext[cpu * 2 + 0] = cpu_to_be32(intc_phandle);
> > > > +        plmt_irq_ext[cpu * 2 + 1] = cpu_to_be32(IRQ_M_TIMER);
> > > > +
> > > > +        g_free(intc_name);
> > > > +    }
> > > > +
> > > > +    mem_addr = memmap[ANDES_AE350_DRAM].base;
> > > > +    mem_name = g_strdup_printf("/memory@%lx", (long)mem_addr);
> > > > +    qemu_fdt_add_subnode(fdt, mem_name);
> > > > +    qemu_fdt_setprop_cells(fdt, mem_name, "reg",
> > > > +        mem_addr >> 32, mem_addr, mem_size >> 32, mem_size);
> > > > +    qemu_fdt_setprop_string(fdt, mem_name, "device_type", "memory");
> > > > +    g_free(mem_name);
> > > > +
> > > > +    /* create plic */
> > > > +    plic_phandle = phandle++;
> > > > +    plic_addr = memmap[ANDES_AE350_PLIC].base;
> > > > +    plic_name = g_strdup_printf("/soc/interrupt-controller@%lx", plic_addr);
> > > > +    qemu_fdt_add_subnode(fdt, plic_name);
> > > > +    qemu_fdt_setprop_cell(fdt, plic_name,
> > > > +        "#address-cells", 0x2);
> > > > +    qemu_fdt_setprop_cell(fdt, plic_name,
> > > > +        "#interrupt-cells", 0x2);
> > > > +    qemu_fdt_setprop_string(fdt, plic_name, "compatible", "riscv,plic0");
> > >
> > > This suggests PLIC is the same as the SiFive one. So why do we have a
> > > different implementation of the PLIC model?
> > >
> >
> > The difference of these two PLICs, please refer to my reply of "[PATCH 1/3] Andes RISC-V PLIC"
> >
> > > > +    qemu_fdt_setprop(fdt, plic_name, "interrupt-controller", NULL, 0);
> > > > +    qemu_fdt_setprop(fdt, plic_name, "interrupts-extended",
> > > > +        plic_irq_ext, s->cpus.num_harts * sizeof(uint32_t) * 4);
> > > > +    qemu_fdt_setprop_cells(fdt, plic_name, "reg",
> > > > +        0x0, plic_addr, 0x0, memmap[ANDES_AE350_PLIC].size);
> > > > +    qemu_fdt_setprop_cell(fdt, plic_name, "riscv,ndev", 0x47);
> > > > +    qemu_fdt_setprop_cell(fdt, plic_name, "phandle", plic_phandle);
> > > > +    g_free(plic_name);
> > > > +    g_free(plic_irq_ext);
> > > > +
> > > > +    /* create plicsw */
> > > > +    plicsw_addr = memmap[ANDES_AE350_PLICSW].base;
> > > > +    plicsw_name = g_strdup_printf("/soc/interrupt-controller@%lx", plicsw_addr);
> > > > +    qemu_fdt_add_subnode(fdt, plicsw_name);
> > > > +    qemu_fdt_setprop_cell(fdt, plicsw_name,
> > > > +        "#address-cells", 0x2);
> > > > +    qemu_fdt_setprop_cell(fdt, plicsw_name,
> > > > +        "#interrupt-cells", 0x2);
> > > > +    qemu_fdt_setprop_string(fdt, plicsw_name, "compatible", "riscv,plic1");
> > >
> > > Is this bindings in the Linux kernel upstream? I can't find any
> > > reference in the kernel tree.
> > >
> >
> > Currently only supports andes Linux BSP,
> > we have plans to push to linux upstream in the future.
>
> This raises a good question about device tree bindings being generated
> from QEMU.
>
> Do we want QEMU to generate a DT that doesn't have matching bindings?

I'd prefer new bindings are sent to kernel upstream to get it reviewed
there first. It might not just be the compatible string, but some
other properties that may change.

>
> I guess if the bindings change during the upstream process we can just
> add a second compatible string.
>
> Also if there is no upstream support how can I test the board?
>

Regards,
Bin

