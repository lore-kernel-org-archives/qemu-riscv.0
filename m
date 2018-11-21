Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPGhy-0000sf-Dv
	for mharc-qemu-riscv@gnu.org; Tue, 20 Nov 2018 19:49:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPGhv-0000sX-Up
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 19:49:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPGhu-0007pw-Q3
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 19:49:31 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:41609)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPGhu-0007o9-HY; Tue, 20 Nov 2018 19:49:30 -0500
Received: by mail-lf1-x142.google.com with SMTP id c16so2697600lfj.8;
	Tue, 20 Nov 2018 16:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9sf2xjbkvYMXw0I2lp5Da5kLwJ1rTZ78xWbdBCf6Hq0=;
	b=Nax1DyfI2d4QdbmjffkcI1kH84jMdfSz8fhFCtK4Pct8nmmA3fZEv3Qojz4rVc0J1S
	8llJm1oQquwd/WQL1ia0uJJADd/PthDbuzmCU3hz8H+vSvXiTXcnTy29ZS/9l8FjGA48
	1VwbP5rpcqKnsn3NbpGhpirFRE3HD77TWUl3ELh8WgDaZVJ7I2TGArxmEGDEO6UaaukG
	KUanNTscvvunSP9RdwrfYPuUxeJwAUJTvYAl5i00luPDHy7hkUu+F7EhQw6zAYCNSAqk
	zi9oDoLsRseUxXMVBGzMLsthnIyhkVcNd9fPWgrkWq5C2442lxHnLX58u4CbGQb8DDaI
	DbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9sf2xjbkvYMXw0I2lp5Da5kLwJ1rTZ78xWbdBCf6Hq0=;
	b=AGW3vuXpavMceRcn4lTOSSC0/SL4OKZ9zs/RqntwTOg6KrCdFBD1w7aPhaou0BCKJi
	ecD3d0nwidEzP/SzHD0gMLTXd1TrM2wlmDfacQDDrreMVBZ1VBK5qYemro2ezCWLJ4Yk
	G3pKJysQJ2f2TSVHLJCmTfBo1kVWo6HCQynKNdYXsf5ro0AOvAjVoPH/HXNPS1EAS/P1
	xApyh7ABOUeuXvsIb3cM5uXRnCVhtISTztfwjg15c9Q8npb0gSSkvSZlavdVuOyjDST+
	CMNnjY6nZOQqvjL7PrG3KHXHOLAIHVUVg3IAcPm0JX7LBvZdBOBUDeznZ1Q8+/6WInTx
	yrfg==
X-Gm-Message-State: AGRZ1gKSabiSgX6IK4u8duuzrsyc8Rqz8vgNrDibjAaG7opY9rz6Nbeh
	pybbRfNHOCUV7Nu+ntBWHFQ+0xhOKbzUkLqqyoo=
X-Google-Smtp-Source: AJdET5dS+QkirSigLFshxSve9BaDf+QhGRqBBGfY1Dxd2v44fgxwbh3TD2FoOw6w3Cb+IzBLJOkIlOh3L9hlPol5WSw=
X-Received: by 2002:a19:4e59:: with SMTP id c86mr2501003lfb.132.1542761369110; 
	Tue, 20 Nov 2018 16:49:29 -0800 (PST)
MIME-Version: 1.0
References: <1542754831-25567-1-git-send-email-linux@roeck-us.net>
	<1542754831-25567-2-git-send-email-linux@roeck-us.net>
In-Reply-To: <1542754831-25567-2-git-send-email-linux@roeck-us.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Nov 2018 16:49:01 -0800
Message-ID: <CAKmqyKMWq7gpTJg4ZPWEcKPzP7-NzAtY+QZZiHK1jP5a+DNGDA@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, paul.walmsley@sifive.com,
	Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 2/2] riscv: virt: Fix
 interrupt mapping
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
X-List-Received-Date: Wed, 21 Nov 2018 00:49:33 -0000

On Tue, Nov 20, 2018 at 3:01 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> - Interrupt map width is 6, not 7
>         address (3), pci interrupt (1), controller phandle (1), irq (1)
> - Since the interrupt map is the default pci interrupt map, we can not
>   omit devfn from the mapping function.
> - It is not necessary to specify "interrupt-parent" and "interrupts"
>   since both are part of interrupt-map.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Hey Gunter,

Thanks again for the patch!

Also unfortunately Logan Gunthorpe had already sent me fixes for the
interrupt mappings as well. You can see his tree here:
https://github.com/lsgunth/qemu/commits/riscv_pci

If you have comments on that implementation just let me know.
Hopefully I will be able to send out a new version tomorrow.

I really appreciate your help! It's always good to have multiple
people working and looking over everything.

Alistair

> ---
>  hw/riscv/virt.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 675899d..fb3a492 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -65,35 +65,37 @@ static const struct MemmapEntry {
>      [VIRT_PCIE_ECAM] = { 0x30000000, 0x10000000 },
>  };
>
> -#define INTERREUPT_MAP_WIDTH 7
> +#define INTERRUPT_MAP_WIDTH 6
>
>  static void create_pcie_irq_map(void *fdt, char *nodename,
>                                  uint32_t plic_phandle)
>  {
> -    int pin;
> -    uint32_t full_irq_map[GPEX_NUM_IRQS * INTERREUPT_MAP_WIDTH] = { 0 };
> +    int devfn, pin;
> +    uint32_t full_irq_map[GPEX_NUM_IRQS * 4 * INTERRUPT_MAP_WIDTH] = { 0 };
>      uint32_t *irq_map = full_irq_map;
>
> +    for (devfn = 0; devfn <= 0x18; devfn += 0x8) {
>          for (pin = 0; pin < GPEX_NUM_IRQS; pin++) {
> -            int irq_nr = PCIE_IRQ + (pin % PCI_NUM_PINS);
> +            int irq_nr = PCIE_IRQ + ((pin + PCI_SLOT(devfn)) % PCI_NUM_PINS);
>              int i;
>
> -            uint32_t map[] = {
> -                0, 0, 0,
> -                pin + 1, plic_phandle, 0, irq_nr};
> +            uint32_t map[INTERRUPT_MAP_WIDTH] = {
> +                devfn << 8, 0, 0,
> +                pin + 1, plic_phandle, irq_nr};
>
>              /* Convert map to big endian */
> -            for (i = 0; i < INTERREUPT_MAP_WIDTH; i++) {
> +            for (i = 0; i < INTERRUPT_MAP_WIDTH; i++) {
>                  irq_map[i] = cpu_to_be32(map[i]);
>              }
> -            irq_map += INTERREUPT_MAP_WIDTH;
> +            irq_map += INTERRUPT_MAP_WIDTH;
>          }
> +    }
>
>      qemu_fdt_setprop(fdt, nodename, "interrupt-map",
>                       full_irq_map, sizeof(full_irq_map));
>
>      qemu_fdt_setprop_cells(fdt, nodename, "interrupt-map-mask",
> -                           0, 0, 0, 0x7);
> +                           0x1800, 0, 0, 0x7);
>  }
>
>  static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
> @@ -261,8 +263,6 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>                                   2, memmap[VIRT_PCIE_MMIO_HIGH].base,
>                                   2, memmap[VIRT_PCIE_MMIO_HIGH].size);
>
> -    qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
> -    qemu_fdt_setprop_cells(fdt, nodename, "interrupts", PCIE_IRQ);
>      create_pcie_irq_map(fdt, nodename, plic_phandle);
>
>      nodename = g_strdup_printf("/test@%lx",
> --
> 2.7.4
>
>

