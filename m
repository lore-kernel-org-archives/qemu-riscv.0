Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJs8F-0004pH-Tc
	for mharc-qemu-riscv@gnu.org; Wed, 10 Mar 2021 01:15:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJs8E-0004my-29; Wed, 10 Mar 2021 01:15:42 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:33841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJs8A-0006Lz-Gi; Wed, 10 Mar 2021 01:15:41 -0500
Received: by mail-yb1-xb32.google.com with SMTP id d9so16684473ybq.1;
 Tue, 09 Mar 2021 22:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fy6ANLfYv8qXwH6M1HJKXDPE631ITXO9dWg2e9GXh3c=;
 b=XPe50AY89Ho6TE2vPBaawovk6LW8eKAr9INtOe5yOEe/TqEXHO7Bb7JfmVdXc2NbNq
 umuOp7QW2wXR7nh4wogTBeUV4CXOL1AD7eEEvOoRiztVcgxUuf6NPXTAxvkGc3ejxMJD
 zOY7ioq5STQJKsu+g+drlC1CuPXf/b1RM+awezdDz/hh/7PQ62B+PuUho48r1brFubgj
 pfnqghf3C/QFH4R5PMEu9PsgXlubqM5qkBP1EpQBZa9rzynTqu+trTY+5s+AvaHOkdf3
 ZfEWpJ9ehLiOKnAeC01+LabvLWGgPuHUUqprMFbKmp439e8KUxCPgE1RrTgQWr76hzb8
 ErtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fy6ANLfYv8qXwH6M1HJKXDPE631ITXO9dWg2e9GXh3c=;
 b=hgkBHjZPNrtTi1ZWiDqQcT2WEYplVP+TGlg3YJTxomBiTQmccXSw4LgsHDoFy6d/wk
 02VoF80+PREJhfzlQqLc9wDe8/CgjcmCZe+/DQUHAa/BHtoj0Sd+L1yy0/hvoBM0/R3w
 ndnIJhCjevj6Gk0+Qv2dPxVpnwxJCLaANl+I11q1wD6nQyoT+Qr1JF9+lNmIJLG9h5J2
 CilL6KiVOVSDzE2cxZBG06PYCtu2SGCopvrRxFy6GhMPMRI+0Pa3iliuNev3F1yMwBQ1
 pMdFr1cZoKD/rFYFRaHdBjqTZM5uVZzyhXgoYv1tYrA3QVVwsq4DCooopSa/aTIxgoT7
 AQNQ==
X-Gm-Message-State: AOAM532EL4pz5lZNW4sM/NbbzI4MbD3MUZ255EWk2ww0c+1j2GoaTa6b
 NOTfTIYJq6mm2I1XIdFpliuZVMl5pWlHHnI9xFI=
X-Google-Smtp-Source: ABdhPJx5BSknlnPpfGTLu0JBSshbLyWcrk+UetQKLe1ewayCz9InIQgedWvEhDyxysXIb0z0QSq/8G7tmCt9W3RqXi0=
X-Received: by 2002:a25:d28b:: with SMTP id j133mr1911816ybg.517.1615356937206; 
 Tue, 09 Mar 2021 22:15:37 -0800 (PST)
MIME-Version: 1.0
References: <20210310033358.30499-1-dylan@andestech.com>
 <20210310033358.30499-4-dylan@andestech.com>
In-Reply-To: <20210310033358.30499-4-dylan@andestech.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Mar 2021 14:15:25 +0800
Message-ID: <CAEUhbmWAfYLuEOD_epjA=4d27JDV+iVdACOmj2B6PSR0Dg1wdQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] Andes AE350 RISC-V Machine
To: Dylan Jhong <dylan@andestech.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, ruinland@andestech.com, 
 Alan Kao <alankao@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
X-List-Received-Date: Wed, 10 Mar 2021 06:15:42 -0000

On Wed, Mar 10, 2021 at 11:36 AM Dylan Jhong <dylan@andestech.com> wrote:
>
> This provides a RISC-V Board based on Andes's AE350 specification.
> The following machine is implemented:
>
> - 'andes_ae350'; PLIC, PLICSW, PLMT, 16550a UART, VirtIO MMIO, device-tree

Is this a virtual target because virtio is added? Or does the hardware
provide the virtio programming interface?

>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> ---
>  default-configs/devices/riscv32-softmmu.mak |   1 +
>  default-configs/devices/riscv64-softmmu.mak |   1 +
>  hw/riscv/Kconfig                            |   7 +
>  hw/riscv/andes_ae350.c                      | 501 ++++++++++++++++++++
>  hw/riscv/meson.build                        |   1 +
>  include/hw/riscv/andes_ae350.h              |  93 ++++
>  6 files changed, 604 insertions(+)
>  create mode 100644 hw/riscv/andes_ae350.c
>  create mode 100644 include/hw/riscv/andes_ae350.h
>
> diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
> index d847bd5692..a268007e72 100644
> --- a/default-configs/devices/riscv32-softmmu.mak
> +++ b/default-configs/devices/riscv32-softmmu.mak
> @@ -8,6 +8,7 @@ CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>
>  # Boards:
>  #
> +CONFIG_ANDES_AE350=y
>  CONFIG_SPIKE=y
>  CONFIG_SIFIVE_E=y
>  CONFIG_SIFIVE_U=y
> diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
> index d5eec75f05..9a37dfd8c0 100644
> --- a/default-configs/devices/riscv64-softmmu.mak
> +++ b/default-configs/devices/riscv64-softmmu.mak
> @@ -8,6 +8,7 @@ CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>
>  # Boards:
>  #
> +CONFIG_ANDES_AE350=y
>  CONFIG_SPIKE=y
>  CONFIG_SIFIVE_E=y
>  CONFIG_SIFIVE_U=y
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index d139074b02..04f6369ab7 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -1,6 +1,13 @@
>  config IBEX
>      bool
>
> +config ANDES_AE350

This needs to be sorted in alphabetical order

> +    bool
> +    select SERIAL
> +    select VIRTIO_MMIO
> +    select ANDES_PLIC
> +    select ANDES_PLMT
> +
>  config MICROCHIP_PFSOC
>      bool
>      select CADENCE_SDHCI
> diff --git a/hw/riscv/andes_ae350.c b/hw/riscv/andes_ae350.c
> new file mode 100644
> index 0000000000..ed5f9701ad
> --- /dev/null
> +++ b/hw/riscv/andes_ae350.c
> @@ -0,0 +1,501 @@
> +/*
> + * Andes RISC-V AE350 Board
> + *
> + * Copyright (c) 2021 Andes Tech. Corp.
> + *
> + * Andes AE350 Board supports ns16550a UART and VirtIO MMIO.
> + * The interrupt controllers are andes PLIC and andes PLICSW.
> + * Timer is Andes PLMT.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "qemu/log.h"
> +#include "qemu/error-report.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/loader.h"
> +#include "hw/sysbus.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/char/serial.h"
> +#include "target/riscv/cpu.h"
> +#include "hw/riscv/riscv_hart.h"
> +#include "hw/riscv/boot.h"
> +#include "hw/riscv/numa.h"
> +#include "chardev/char.h"
> +#include "sysemu/arch_init.h"
> +#include "sysemu/device_tree.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci-host/gpex.h"
> +
> +#include "hw/intc/andes_plic.h"
> +#include "hw/timer/andes_plmt.h"
> +#include "hw/riscv/andes_ae350.h"
> +
> +# define BIOS_FILENAME ""
> +
> +static const struct MemmapEntry {
> +    hwaddr base;
> +    hwaddr size;
> +} andes_ae350_memmap[] = {
> +    [ANDES_AE350_DEBUG]     = { 0x00000000,      0x100 },
> +    [ANDES_AE350_DRAM]      = { 0x00000000, 0x80000000 },
> +    [ANDES_AE350_MROM]      = { 0xb0000000,   0x100000 },
> +    [ANDES_AE350_MAC]       = { 0xe0100000,   0x100000 },
> +    [ANDES_AE350_GEM]       = { 0xe0200000,   0x100000 },
> +    [ANDES_AE350_PLIC]      = { 0xe4000000,   0x400000 },
> +    [ANDES_AE350_PLMT]      = { 0xe6000000,   0x100000 },
> +    [ANDES_AE350_PLICSW]    = { 0xe6400000,   0x400000 },
> +    [ANDES_AE350_UART1]     = { 0xf0200000,      0x100 },
> +    [ANDES_AE350_UART2]     = { 0xf0300000,      0x100 },
> +    [ANDES_AE350_PIT]       = { 0xf0400000,   0x100000 },
> +    [ANDES_AE350_SDC]       = { 0xf0e00000,   0x100000 },
> +    [ANDES_AE350_VIRTIO]    = { 0xfe000000,     0x1000 },
> +};
> +
> +static void
> +create_fdt(AndesAe350BoardState *bs, const struct MemmapEntry *memmap,
> +    uint64_t mem_size, const char *cmdline)
> +{
> +    AndesAe350SocState *s = &bs->soc;
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    void *fdt;
> +    int cpu, i;
> +    uint64_t mem_addr;
> +    uint32_t *plic_irq_ext, *plicsw_irq_ext, *plmt_irq_ext;
> +    unsigned long plic_addr, plicsw_addr, plmt_addr;
> +    char *plic_name, *plicsw_name, *plmt_name;
> +    uint32_t intc_phandle = 0, plic_phandle = 0;
> +    uint32_t phandle = 1;
> +    char *isa_name, *mem_name, *cpu_name, *intc_name, *uart_name, *virtio_name;
> +
> +    if (ms->dtb) {
> +        fdt = bs->fdt = load_device_tree(ms->dtb, &bs->fdt_size);
> +        if (!fdt) {
> +            error_report("load_device_tree() failed");
> +            exit(1);
> +        }
> +        goto update_bootargs;
> +    } else {
> +        fdt = bs->fdt = create_device_tree(&bs->fdt_size);
> +        if (!fdt) {
> +            error_report("create_device_tree() failed");
> +            exit(1);
> +        }
> +    }
> +
> +    qemu_fdt_setprop_string(fdt, "/", "model", "Andes AE350 Board");
> +    qemu_fdt_setprop_string(fdt, "/", "compatible", "andestech,ae350");
> +    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
> +    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
> +
> +    qemu_fdt_add_subnode(fdt, "/soc");
> +    qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
> +    qemu_fdt_setprop_string(fdt, "/soc", "compatible", "simple-bus");
> +    qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
> +    qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
> +
> +    qemu_fdt_add_subnode(fdt, "/cpus");
> +    qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> +                          ANDES_PLMT_TIMEBASE_FREQ);
> +    qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> +    qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> +    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
> +
> +    plic_irq_ext = g_new0(uint32_t, s->cpus.num_harts * 4);
> +    plicsw_irq_ext = g_new0(uint32_t, s->cpus.num_harts * 2);
> +    plmt_irq_ext = g_new0(uint32_t, s->cpus.num_harts * 2);
> +
> +    for (cpu = 0; cpu < s->cpus.num_harts; cpu++) {
> +        intc_phandle = phandle++;
> +
> +        cpu_name = g_strdup_printf("/cpus/cpu@%d",
> +            s->cpus.hartid_base + cpu);
> +        qemu_fdt_add_subnode(fdt, cpu_name);
> +#if defined(TARGET_RISCV32)
> +        qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv32");
> +#else
> +        qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv39");
> +#endif
> +        isa_name = riscv_isa_string(&s->cpus.harts[cpu]);
> +        qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", isa_name);
> +        g_free(isa_name);
> +        qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv");
> +        qemu_fdt_setprop_string(fdt, cpu_name, "status", "okay");
> +        qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
> +            s->cpus.hartid_base + cpu);
> +        qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu");
> +
> +        intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
> +        qemu_fdt_add_subnode(fdt, intc_name);
> +        qemu_fdt_setprop_cell(fdt, intc_name, "phandle", intc_phandle);
> +        qemu_fdt_setprop_string(fdt, intc_name, "compatible",
> +            "riscv,cpu-intc");
> +        qemu_fdt_setprop(fdt, intc_name, "interrupt-controller", NULL, 0);
> +        qemu_fdt_setprop_cell(fdt, intc_name, "#interrupt-cells", 1);
> +
> +        plic_irq_ext[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
> +        plic_irq_ext[cpu * 4 + 1] = cpu_to_be32(IRQ_M_EXT);
> +        plic_irq_ext[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
> +        plic_irq_ext[cpu * 4 + 3] = cpu_to_be32(IRQ_S_EXT);
> +
> +        plicsw_irq_ext[cpu * 2 + 0] = cpu_to_be32(intc_phandle);
> +        plicsw_irq_ext[cpu * 2 + 1] = cpu_to_be32(IRQ_M_SOFT);
> +
> +        plmt_irq_ext[cpu * 2 + 0] = cpu_to_be32(intc_phandle);
> +        plmt_irq_ext[cpu * 2 + 1] = cpu_to_be32(IRQ_M_TIMER);
> +
> +        g_free(intc_name);
> +    }
> +
> +    mem_addr = memmap[ANDES_AE350_DRAM].base;
> +    mem_name = g_strdup_printf("/memory@%lx", (long)mem_addr);
> +    qemu_fdt_add_subnode(fdt, mem_name);
> +    qemu_fdt_setprop_cells(fdt, mem_name, "reg",
> +        mem_addr >> 32, mem_addr, mem_size >> 32, mem_size);
> +    qemu_fdt_setprop_string(fdt, mem_name, "device_type", "memory");
> +    g_free(mem_name);
> +
> +    /* create plic */
> +    plic_phandle = phandle++;
> +    plic_addr = memmap[ANDES_AE350_PLIC].base;
> +    plic_name = g_strdup_printf("/soc/interrupt-controller@%lx", plic_addr);
> +    qemu_fdt_add_subnode(fdt, plic_name);
> +    qemu_fdt_setprop_cell(fdt, plic_name,
> +        "#address-cells", 0x2);
> +    qemu_fdt_setprop_cell(fdt, plic_name,
> +        "#interrupt-cells", 0x2);
> +    qemu_fdt_setprop_string(fdt, plic_name, "compatible", "riscv,plic0");

This suggests PLIC is the same as the SiFive one. So why do we have a
different implementation of the PLIC model?

> +    qemu_fdt_setprop(fdt, plic_name, "interrupt-controller", NULL, 0);
> +    qemu_fdt_setprop(fdt, plic_name, "interrupts-extended",
> +        plic_irq_ext, s->cpus.num_harts * sizeof(uint32_t) * 4);
> +    qemu_fdt_setprop_cells(fdt, plic_name, "reg",
> +        0x0, plic_addr, 0x0, memmap[ANDES_AE350_PLIC].size);
> +    qemu_fdt_setprop_cell(fdt, plic_name, "riscv,ndev", 0x47);
> +    qemu_fdt_setprop_cell(fdt, plic_name, "phandle", plic_phandle);
> +    g_free(plic_name);
> +    g_free(plic_irq_ext);
> +
> +    /* create plicsw */
> +    plicsw_addr = memmap[ANDES_AE350_PLICSW].base;
> +    plicsw_name = g_strdup_printf("/soc/interrupt-controller@%lx", plicsw_addr);
> +    qemu_fdt_add_subnode(fdt, plicsw_name);
> +    qemu_fdt_setprop_cell(fdt, plicsw_name,
> +        "#address-cells", 0x2);
> +    qemu_fdt_setprop_cell(fdt, plicsw_name,
> +        "#interrupt-cells", 0x2);
> +    qemu_fdt_setprop_string(fdt, plicsw_name, "compatible", "riscv,plic1");

Is this bindings in the Linux kernel upstream? I can't find any
reference in the kernel tree.

> +    qemu_fdt_setprop(fdt, plicsw_name, "interrupt-controller", NULL, 0);
> +    qemu_fdt_setprop(fdt, plicsw_name, "interrupts-extended",
> +        plicsw_irq_ext, s->cpus.num_harts * sizeof(uint32_t) * 2);
> +    qemu_fdt_setprop_cells(fdt, plicsw_name, "reg",
> +        0x0, plicsw_addr, 0x0, memmap[ANDES_AE350_PLIC].size);
> +    qemu_fdt_setprop_cell(fdt, plicsw_name, "riscv,ndev", 0x1);
> +    g_free(plicsw_name);
> +    g_free(plicsw_irq_ext);
> +
> +    /* create plmt */
> +    plmt_addr = memmap[ANDES_AE350_PLMT].base;
> +    plmt_name = g_strdup_printf("/soc/plmt0@%lx", plmt_addr);
> +    qemu_fdt_add_subnode(fdt, plmt_name);
> +    qemu_fdt_setprop_string(fdt, plmt_name, "compatible", "riscv,plmt0");

The same here.

> +    qemu_fdt_setprop(fdt, plmt_name, "interrupts-extended",
> +        plmt_irq_ext, s->cpus.num_harts * sizeof(uint32_t) * 2);
> +    qemu_fdt_setprop_cells(fdt, plmt_name, "reg",
> +        0x0, plmt_addr, 0x0, memmap[ANDES_AE350_PLMT].size);
> +    g_free(plmt_name);
> +    g_free(plmt_irq_ext);
> +
> +    uart_name = g_strdup_printf("/serial@%lx", memmap[ANDES_AE350_UART1].base);
> +    qemu_fdt_add_subnode(fdt, uart_name);
> +    qemu_fdt_setprop_string(fdt, uart_name, "compatible", "ns16550a");
> +    qemu_fdt_setprop_cells(fdt, uart_name, "reg",
> +        0x0, memmap[ANDES_AE350_UART1].base,
> +        0x0, memmap[ANDES_AE350_UART1].size);
> +    qemu_fdt_setprop_cell(fdt, uart_name, "clock-frequency", 3686400);
> +    qemu_fdt_setprop_cell(fdt, uart_name, "reg-shift", ANDES_UART_REG_SHIFT);
> +    qemu_fdt_setprop_cell(fdt, uart_name, "reg-offset", ANDES_UART_REG_OFFSET);
> +    qemu_fdt_setprop_cell(fdt, uart_name, "interrupt-parent", plic_phandle);
> +    qemu_fdt_setprop_cells(fdt, uart_name, "interrupts", ANDES_AE350_UART1_IRQ, 0x4);
> +
> +    uart_name = g_strdup_printf("/serial@%lx", memmap[ANDES_AE350_UART2].base);
> +    qemu_fdt_add_subnode(fdt, uart_name);
> +    qemu_fdt_setprop_string(fdt, uart_name, "compatible", "ns16550a");
> +    qemu_fdt_setprop_cells(fdt, uart_name, "reg",
> +        0x0, memmap[ANDES_AE350_UART2].base,
> +        0x0, memmap[ANDES_AE350_UART2].size);
> +    qemu_fdt_setprop_cell(fdt, uart_name, "reg-shift", ANDES_UART_REG_SHIFT);
> +    qemu_fdt_setprop_cell(fdt, uart_name, "reg-offset", ANDES_UART_REG_OFFSET);
> +    qemu_fdt_setprop_cell(fdt, uart_name, "clock-frequency", 3686400);
> +    qemu_fdt_setprop_cell(fdt, uart_name, "interrupt-parent", plic_phandle);
> +    qemu_fdt_setprop_cells(fdt, uart_name, "interrupts", ANDES_AE350_UART2_IRQ, 0x4);
> +
> +    qemu_fdt_add_subnode(fdt, "/chosen");
> +    qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
> +            "console=ttyS0,38400n8 earlycon=sbi debug loglevel=7");
> +    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", uart_name);
> +    g_free(uart_name);
> +
> +    for (i = 0; i < ANDES_AE350_VIRTIO_COUNT; i++) {
> +        virtio_name = g_strdup_printf("/virtio_mmio@%lx",
> +            (memmap[ANDES_AE350_VIRTIO].base + i * memmap[ANDES_AE350_VIRTIO].size));
> +        qemu_fdt_add_subnode(fdt, virtio_name);
> +        qemu_fdt_setprop_string(fdt, virtio_name, "compatible", "virtio,mmio");
> +        qemu_fdt_setprop_cells(fdt, virtio_name, "reg",
> +            0x0, memmap[ANDES_AE350_VIRTIO].base + i * memmap[ANDES_AE350_VIRTIO].size,
> +            0x0, memmap[ANDES_AE350_VIRTIO].size);
> +        qemu_fdt_setprop_cell(fdt, virtio_name, "interrupt-parent",
> +                                plic_phandle);
> +        qemu_fdt_setprop_cells(fdt, virtio_name, "interrupts",
> +                                ANDES_AE350_VIRTIO_IRQ + i, 0x4);
> +        g_free(virtio_name);
> +    }
> +
> +update_bootargs:
> +    if (cmdline && cmdline[0] != '\0') {
> +        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
> +    }
> +}
> +
> +static char *init_hart_config(const char *hart_config, int num_harts)
> +{
> +    int length = 0, i = 0;
> +    char *result;
> +
> +    length = (strlen(hart_config) + 1) * num_harts;
> +    result = g_malloc0(length);
> +    for (i = 0; i < num_harts; i++) {
> +        if (i != 0) {
> +            strncat(result, ",", length);
> +        }
> +        strncat(result, hart_config, length);
> +        length -= (strlen(hart_config) + 1);
> +    }
> +
> +    return result;
> +}
> +
> +static void andes_ae350_soc_realize(DeviceState *dev_soc, Error **errp)
> +{
> +    const struct MemmapEntry *memmap = andes_ae350_memmap;
> +    MachineState *machine = MACHINE(qdev_get_machine());
> +    MemoryRegion *system_memory = get_system_memory();
> +    AndesAe350SocState *s = ANDES_AE350_SOC(dev_soc);
> +    char *plic_hart_config, *plicsw_hart_config;
> +
> +    plicsw_hart_config =
> +        init_hart_config(ANDES_AE350_PLICSW_HART_CONFIG, machine->smp.cpus);
> +
> +    /* Per-socket SW-PLIC */
> +    s->plic_sw = andes_plicsw_create(
> +        memmap[ANDES_AE350_PLICSW].base,
> +        ANDES_AE350_PLICSW_NAME,
> +        plicsw_hart_config,
> +        ANDES_AE350_PLICSW_NUM_SOURCES,
> +        ANDES_AE350_PLICSW_NUM_PRIORITIES,
> +        ANDES_AE350_PLICSW_PRIORITY_BASE,
> +        ANDES_AE350_PLICSW_PENDING_BASE,
> +        ANDES_AE350_PLICSW_ENABLE_BASE,
> +        ANDES_AE350_PLICSW_ENABLE_STRIDE,
> +        ANDES_AE350_PLICSW_THRESHOLD_BASE,
> +        ANDES_AE350_PLICSW_THRESHOLD_STRIDE,
> +        memmap[ANDES_AE350_PLICSW].size);
> +
> +    g_free(plicsw_hart_config);
> +
> +    andes_plmt_create(memmap[ANDES_AE350_PLMT].base,
> +                memmap[ANDES_AE350_PLMT].size,
> +                machine->smp.cpus, ANDES_PLMT_TIME_BASE, ANDES_PLMT_TIMECMP_BASE);
> +
> +    plic_hart_config =
> +        init_hart_config(ANDES_AE350_PLIC_HART_CONFIG, machine->smp.cpus);
> +
> +    /* Per-socket PLIC */
> +    s->plic = andes_plic_create(
> +        memmap[ANDES_AE350_PLIC].base,
> +        ANDES_AE350_PLIC_NAME,
> +        plic_hart_config,
> +        ANDES_AE350_PLIC_NUM_SOURCES,
> +        ANDES_AE350_PLIC_NUM_PRIORITIES,
> +        ANDES_AE350_PLIC_PRIORITY_BASE,
> +        ANDES_AE350_PLIC_PENDING_BASE,
> +        ANDES_AE350_PLIC_ENABLE_BASE,
> +        ANDES_AE350_PLIC_ENABLE_STRIDE,
> +        ANDES_AE350_PLIC_THRESHOLD_BASE,
> +        ANDES_AE350_PLIC_THRESHOLD_STRIDE,
> +        memmap[ANDES_AE350_PLIC].size);
> +
> +    g_free(plic_hart_config);
> +
> +    /* VIRTIO */
> +    for (int i = 0; i < ANDES_AE350_VIRTIO_COUNT; i++) {
> +        sysbus_create_simple("virtio-mmio",
> +            memmap[ANDES_AE350_VIRTIO].base + i * memmap[ANDES_AE350_VIRTIO].size,
> +            qdev_get_gpio_in(DEVICE(s->plic), (ANDES_AE350_VIRTIO_IRQ + i)));
> +    }
> +
> +    serial_mm_init(system_memory,
> +        memmap[ANDES_AE350_UART1].base + ANDES_UART_REG_OFFSET,
> +        ANDES_UART_REG_SHIFT,
> +        qdev_get_gpio_in(DEVICE(s->plic), ANDES_AE350_UART1_IRQ),
> +        38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +
> +    serial_mm_init(system_memory,
> +        memmap[ANDES_AE350_UART2].base + ANDES_UART_REG_OFFSET,
> +        ANDES_UART_REG_SHIFT,
> +        qdev_get_gpio_in(DEVICE(s->plic), ANDES_AE350_UART2_IRQ),
> +        38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +}
> +
> +static void andes_ae350_soc_instance_init(Object *obj)
> +{
> +    const struct MemmapEntry *memmap = andes_ae350_memmap;
> +    MachineState *machine = MACHINE(qdev_get_machine());
> +    AndesAe350SocState *s = ANDES_AE350_SOC(obj);
> +
> +    object_initialize_child(obj, "cpus", &s->cpus, TYPE_RISCV_HART_ARRAY);
> +    object_property_set_str(OBJECT(&s->cpus), "cpu-type",
> +                            machine->cpu_type, &error_abort);
> +    object_property_set_int(OBJECT(&s->cpus), "num-harts",
> +                            machine->smp.cpus, &error_abort);
> +    qdev_prop_set_uint64(DEVICE(&s->cpus), "resetvec",
> +                            memmap[ANDES_AE350_MROM].base);
> +    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
> +}
> +
> +static void andes_ae350_machine_init(MachineState *machine)
> +{
> +    const struct MemmapEntry *memmap = andes_ae350_memmap;
> +
> +    AndesAe350BoardState *bs = ANDES_AE350_MACHINE(machine);
> +    MemoryRegion *system_memory = get_system_memory();
> +    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
> +    MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
> +    target_ulong start_addr = memmap[ANDES_AE350_DRAM].base;
> +    target_ulong firmware_end_addr, kernel_start_addr;
> +    uint32_t fdt_load_addr;
> +    uint64_t kernel_entry;
> +
> +    /* Initialize SoC */
> +    object_initialize_child(OBJECT(machine), "soc",
> +                    &bs->soc, TYPE_ANDES_AE350_SOC);
> +    qdev_realize(DEVICE(&bs->soc), NULL, &error_abort);
> +
> +    /* register system main memory (actual RAM) */
> +    memory_region_init_ram(main_mem, NULL, "riscv.andes.ae350.ram",
> +                           machine->ram_size, &error_fatal);
> +    memory_region_add_subregion(system_memory, memmap[ANDES_AE350_DRAM].base,
> +        main_mem);
> +
> +    /* create device tree */
> +    create_fdt(bs, memmap, machine->ram_size, machine->kernel_cmdline);
> +
> +    /* boot rom */
> +    memory_region_init_rom(mask_rom, NULL, "riscv.andes.ae350.mrom",
> +                           memmap[ANDES_AE350_MROM].size, &error_fatal);
> +    memory_region_add_subregion(system_memory, memmap[ANDES_AE350_MROM].base,
> +                                mask_rom);
> +
> +    firmware_end_addr = riscv_find_and_load_firmware(machine, BIOS_FILENAME,
> +                                                     start_addr, NULL);
> +    if (machine->kernel_filename) {
> +        kernel_start_addr = riscv_calc_kernel_start_addr(&bs->soc.cpus,
> +                                                         firmware_end_addr);
> +
> +        kernel_entry = riscv_load_kernel(machine->kernel_filename,
> +                                         kernel_start_addr, NULL);
> +
> +        if (machine->initrd_filename) {
> +            hwaddr start;
> +            hwaddr end = riscv_load_initrd(machine->initrd_filename,
> +                                           machine->ram_size, kernel_entry,
> +                                           &start);
> +            qemu_fdt_setprop_cell(bs->fdt, "/chosen",
> +                                  "linux,initrd-start", start);
> +            qemu_fdt_setprop_cell(bs->fdt, "/chosen", "linux,initrd-end",
> +                                  end);
> +        }
> +    } else {
> +       /*
> +        * If dynamic firmware is used, it doesn't know where is the next mode
> +        * if kernel argument is not set.
> +        */
> +        kernel_entry = 0;
> +    }
> +
> +    /* Compute the fdt load address in dram */
> +    fdt_load_addr = riscv_load_fdt(memmap[ANDES_AE350_DRAM].base,
> +                                   machine->ram_size, bs->fdt);
> +
> +    /* load the reset vector */
> +    riscv_setup_rom_reset_vec(machine, &bs->soc.cpus, start_addr,
> +                andes_ae350_memmap[ANDES_AE350_MROM].base,
> +                andes_ae350_memmap[ANDES_AE350_MROM].size, kernel_entry,
> +                fdt_load_addr, bs->fdt);
> +}
> +
> +static void andes_ae350_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->desc = "RISC-V Board compatible with Andes AE350";
> +    mc->init = andes_ae350_machine_init;
> +    mc->max_cpus = ANDES_CPUS_MAX;
> +    mc->default_cpu_type = VIRT_CPU;
> +}
> +
> +static void andes_ae350_machine_instance_init(Object *obj)
> +{
> +
> +}
> +
> +static const TypeInfo andes_ae350_machine_typeinfo = {
> +    .name       = MACHINE_TYPE_NAME("andes_ae350"),
> +    .parent     = TYPE_MACHINE,
> +    .class_init = andes_ae350_machine_class_init,
> +    .instance_init = andes_ae350_machine_instance_init,
> +    .instance_size = sizeof(AndesAe350BoardState),
> +};
> +
> +static void andes_ae350_machine_init_register_types(void)
> +{
> +    type_register_static(&andes_ae350_machine_typeinfo);
> +}
> +
> +type_init(andes_ae350_machine_init_register_types)
> +
> +static void andes_ae350_soc_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = andes_ae350_soc_realize;
> +    dc->user_creatable = false;
> +}
> +
> +static const TypeInfo andes_ae350_soc_type_info = {
> +    .name       = TYPE_ANDES_AE350_SOC,
> +    .parent     = TYPE_DEVICE,
> +    .instance_init = andes_ae350_soc_instance_init,
> +    .instance_size = sizeof(AndesAe350SocState),
> +    .class_init = andes_ae350_soc_class_init,
> +};
> +
> +static void andes_ae350_soc_init_register_types(void)
> +{
> +    type_register_static(&andes_ae350_soc_type_info);
> +}
> +
> +type_init(andes_ae350_soc_init_register_types)
> diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
> index 275c0f7eb7..dc0f2cb98b 100644
> --- a/hw/riscv/meson.build
> +++ b/hw/riscv/meson.build
> @@ -2,6 +2,7 @@ riscv_ss = ss.source_set()
>  riscv_ss.add(files('boot.c'), fdt)
>  riscv_ss.add(files('numa.c'))
>  riscv_ss.add(files('riscv_hart.c'))
> +riscv_ss.add(when: 'CONFIG_ANDES_AE350', if_true: files('andes_ae350.c'))
>  riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
>  riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
>  riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
> diff --git a/include/hw/riscv/andes_ae350.h b/include/hw/riscv/andes_ae350.h
> new file mode 100644
> index 0000000000..fb1a15e8cc
> --- /dev/null
> +++ b/include/hw/riscv/andes_ae350.h
> @@ -0,0 +1,93 @@
> +/*
> + * Andes RISC-V AE350 Board
> + *
> + * Copyright (c) 2021 Andes Tech. Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_RISCV_ANDES_AE350_H
> +#define HW_RISCV_ANDES_AE350_H
> +
> +#include "hw/riscv/riscv_hart.h"
> +#include "hw/sysbus.h"
> +#include "hw/block/flash.h"
> +#include "qom/object.h"
> +
> +#define ANDES_CPUS_MAX 4
> +
> +#define TYPE_ANDES_AE350_SOC "riscv.andes.ae350.soc"
> +#define ANDES_AE350_SOC(obj) \
> +    OBJECT_CHECK(AndesAe350SocState, (obj), TYPE_ANDES_AE350_SOC)
> +
> +typedef struct AndesAe350SocState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    RISCVHartArrayState cpus;
> +    DeviceState *plic;
> +    DeviceState *plic_sw;
> +} AndesAe350SocState;
> +
> +#define TYPE_ANDES_AE350_MACHINE MACHINE_TYPE_NAME("andes_ae350")
> +#define ANDES_AE350_MACHINE(obj) \
> +    OBJECT_CHECK(AndesAe350BoardState, (obj), TYPE_ANDES_AE350_MACHINE)
> +
> +typedef struct AndesAe350BoardState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    AndesAe350SocState soc;
> +    void *fdt;
> +    int fdt_size;
> +} AndesAe350BoardState;
> +
> +enum {
> +    ANDES_AE350_DEBUG,
> +    ANDES_AE350_MROM,
> +    ANDES_AE350_PLMT,
> +    ANDES_AE350_PLICSW,
> +    ANDES_AE350_PLIC,
> +    ANDES_AE350_UART1,
> +    ANDES_AE350_UART2,
> +    ANDES_AE350_DRAM,
> +    ANDES_AE350_GEM,
> +    ANDES_AE350_PIT,
> +    ANDES_AE350_SDC,
> +    ANDES_AE350_MAC,
> +    ANDES_AE350_VIRTIO,
> +};
> +
> +enum {
> +    ANDES_AE350_PIT_IRQ = 3,
> +    ANDES_AE350_UART1_IRQ = 8,
> +    ANDES_AE350_UART2_IRQ = 9,
> +    ANDES_AE350_SDC_IRQ = 18,
> +    ANDES_AE350_MAC_IRQ = 19,
> +    ANDES_AE350_GEM_IRQ = 0x35,
> +    ANDES_AE350_VIRTIO_COUNT = 8,
> +    ANDES_AE350_VIRTIO_IRQ = 16, /* 16 to 23 */
> +};
> +
> +#define ANDES_UART_REG_SHIFT    0x2
> +#define ANDES_UART_REG_OFFSET   0x20
> +
> +#if defined(TARGET_RISCV32)
> +#define VIRT_CPU TYPE_RISCV_CPU_BASE32
> +#elif defined(TARGET_RISCV64)
> +#define VIRT_CPU TYPE_RISCV_CPU_BASE64
> +#endif
> +
> +#endif /* HW_RISCV_ANDES_AE350_H */
> --

Please add a target guide in docs/system/riscv for this new board.
Does it support running upstream U-Boot?

Regards,
Bin

