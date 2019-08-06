Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hunAS-0002bL-SZ
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 20:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34887)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hunAQ-0002Xl-OM
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 20:17:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hunAP-0002bS-CH
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 20:17:30 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:32806)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hunAM-0002aY-2v; Mon, 05 Aug 2019 20:17:26 -0400
Received: by mail-lf1-x143.google.com with SMTP id x3so59576445lfc.0;
 Mon, 05 Aug 2019 17:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yAQSj5Iokdg7g1WDptbTEJIpm9PFpyjRtQ69Bi7Np9o=;
 b=bmg0Z0rdX6EMKVQLPZIxU1cHy362A5wmejS8I7INnYFCGshXAMFmFql480SPBIYXMS
 920/Xgbq6oxTXboU0vb8ByoU+jubwJ6EE42OMcVQPDUe5C7FzpD0F0yU2LQKj8RhfNJf
 P16UIElDGYOnIhCkihQ8LU7gsSfqLAYrAWmRYLSDz+ZpG9gKrojgz4LmaHLGyM+Iqaza
 Aw6NISWQdC6rjKxiKhXU7recE+iZ6TY0ko47tpfBIw7y6PVWcaCYV86NcEVm7LOTyvon
 GUG5ASyjoNqVz0XLHKl2x7/d9zkotKQ4PuESKllbHse5uexuurnEHbQJgcgHeGtrp5tH
 5DLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yAQSj5Iokdg7g1WDptbTEJIpm9PFpyjRtQ69Bi7Np9o=;
 b=L7BL3KS1pLwhV2fOPDJ93nic2ci0gqbAhuFHPGCVyDI//6cv7czIO/4Gg7XwPF2Y44
 4lTePWLtFlkZtuyJG4v5HxggqAkAKHKQUbsMgqbv68+Vlr83+9H3BxyEmfp2NiixnyEJ
 MZHooVJ3ucTL/LBgfmwc/lHV3hr6GJm74yhu5FfNO3EMPeoE2COvzk2V+O4xHWZC7LCb
 9N1kPTu12qGiZA1fzaH+kUGxaRkI65jz5IO4BlWIHikT/Ls9ngkS/UGEjY5IxbwWDALN
 vhtQEWvCBWfAsfvFwEmyL8BgAC9QGAcY8ZzfEHhFZHE53lfZ7GQP1s5iuENUwtwYdsuj
 ClIw==
X-Gm-Message-State: APjAAAWfbrMjCun2GgaJPDiPfdfhj9nXbYxvbclkuSsS32WQwUMiF9W2
 VKkpZMMb0lePlu81w9knm7WuamSrmf0HK9tuY8M=
X-Google-Smtp-Source: APXvYqxKKpb7+fSvzTe1tOWWTBApbTuE+tig13Io9xwWbQn25J+artVWBq9zyvlpFFso4G/oTL48VTqwZjlaPYZwYGY=
X-Received: by 2002:a19:7709:: with SMTP id s9mr229782lfc.86.1565050644662;
 Mon, 05 Aug 2019 17:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
 <1565020823-24223-3-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565020823-24223-3-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Aug 2019 17:13:45 -0700
Message-ID: <CAKmqyKNXhavXv=sbhpaV3+XvvRpFcF5HD+=1mW3TZGdsuZcMTA@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 02/28] riscv: hw: Use
 qemu_fdt_setprop_cell() for property with only 1 cell
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
X-List-Received-Date: Tue, 06 Aug 2019 00:17:32 -0000

On Mon, Aug 5, 2019 at 9:04 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Some of the properties only have 1 cell so we should use
> qemu_fdt_setprop_cell() instead of qemu_fdt_setprop_cells().
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 16 ++++++++--------
>  hw/riscv/virt.c     | 24 ++++++++++++------------
>  2 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ef36948..623ee64 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -182,7 +182,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      qemu_fdt_setprop_string(fdt, nodename, "reg-names", "control");
>      qemu_fdt_setprop_cell(fdt, nodename, "riscv,max-priority", 7);
>      qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", 0x35);
> -    qemu_fdt_setprop_cells(fdt, nodename, "phandle", plic_phandle);
> +    qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
>      plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
>      g_free(cells);
>      g_free(nodename);
> @@ -207,20 +207,20 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>          0x0, memmap[SIFIVE_U_GEM].size);
>      qemu_fdt_setprop_string(fdt, nodename, "reg-names", "control");
>      qemu_fdt_setprop_string(fdt, nodename, "phy-mode", "gmii");
> -    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
> -    qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
> +    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> +    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
>      qemu_fdt_setprop_cells(fdt, nodename, "clocks",
>          ethclk_phandle, ethclk_phandle, ethclk_phandle);
>      qemu_fdt_setprop(fdt, nodename, "clocks-names", ethclk_names,
>          sizeof(ethclk_names));
> -    qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 1);
> -    qemu_fdt_setprop_cells(fdt, nodename, "#size-cells", 0);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 0);
>      g_free(nodename);
>
>      nodename = g_strdup_printf("/soc/ethernet@%lx/ethernet-phy@0",
>          (long)memmap[SIFIVE_U_GEM].base);
>      qemu_fdt_add_subnode(fdt, nodename);
> -    qemu_fdt_setprop_cells(fdt, nodename, "reg", 0x0);
> +    qemu_fdt_setprop_cell(fdt, nodename, "reg", 0x0);
>      g_free(nodename);
>
>      nodename = g_strdup_printf("/soc/uart@%lx",
> @@ -232,8 +232,8 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>          0x0, memmap[SIFIVE_U_UART0].size);
>      qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
>                            SIFIVE_U_CLOCK_FREQ / 2);
> -    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
> -    qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_UART0_IRQ);
> +    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> +    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_UART0_IRQ);
>
>      qemu_fdt_add_subnode(fdt, "/chosen");
>      qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 00be05a..127f005 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -233,8 +233,8 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>      nodename = g_strdup_printf("/soc/interrupt-controller@%lx",
>          (long)memmap[VIRT_PLIC].base);
>      qemu_fdt_add_subnode(fdt, nodename);
> -    qemu_fdt_setprop_cells(fdt, nodename, "#address-cells",
> -                           FDT_PLIC_ADDR_CELLS);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells",
> +                          FDT_PLIC_ADDR_CELLS);
>      qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells",
>                            FDT_PLIC_INT_CELLS);
>      qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv,plic0");
> @@ -247,7 +247,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>      qemu_fdt_setprop_string(fdt, nodename, "reg-names", "control");
>      qemu_fdt_setprop_cell(fdt, nodename, "riscv,max-priority", 7);
>      qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", VIRTIO_NDEV);
> -    qemu_fdt_setprop_cells(fdt, nodename, "phandle", plic_phandle);
> +    qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
>      plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
>      g_free(cells);
>      g_free(nodename);
> @@ -260,19 +260,19 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>          qemu_fdt_setprop_cells(fdt, nodename, "reg",
>              0x0, memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size,
>              0x0, memmap[VIRT_VIRTIO].size);
> -        qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
> -        qemu_fdt_setprop_cells(fdt, nodename, "interrupts", VIRTIO_IRQ + i);
> +        qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> +        qemu_fdt_setprop_cell(fdt, nodename, "interrupts", VIRTIO_IRQ + i);
>          g_free(nodename);
>      }
>
>      nodename = g_strdup_printf("/soc/pci@%lx",
>          (long) memmap[VIRT_PCIE_ECAM].base);
>      qemu_fdt_add_subnode(fdt, nodename);
> -    qemu_fdt_setprop_cells(fdt, nodename, "#address-cells",
> -                           FDT_PCI_ADDR_CELLS);
> -    qemu_fdt_setprop_cells(fdt, nodename, "#interrupt-cells",
> -                           FDT_PCI_INT_CELLS);
> -    qemu_fdt_setprop_cells(fdt, nodename, "#size-cells", 0x2);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells",
> +                          FDT_PCI_ADDR_CELLS);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells",
> +                          FDT_PCI_INT_CELLS);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 0x2);
>      qemu_fdt_setprop_string(fdt, nodename, "compatible",
>                              "pci-host-ecam-generic");
>      qemu_fdt_setprop_string(fdt, nodename, "device_type", "pci");
> @@ -309,8 +309,8 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>          0x0, memmap[VIRT_UART0].base,
>          0x0, memmap[VIRT_UART0].size);
>      qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency", 3686400);
> -        qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
> -        qemu_fdt_setprop_cells(fdt, nodename, "interrupts", UART0_IRQ);
> +    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> +    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", UART0_IRQ);
>
>      qemu_fdt_add_subnode(fdt, "/chosen");
>      qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
> --
> 2.7.4
>
>

