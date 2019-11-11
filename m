Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iUBcC-0006Xh-3q
	for mharc-qemu-riscv@gnu.org; Mon, 11 Nov 2019 10:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iUBc9-0006Ux-99
 for qemu-riscv@nongnu.org; Mon, 11 Nov 2019 10:28:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iUBc7-0002FO-Rr
 for qemu-riscv@nongnu.org; Mon, 11 Nov 2019 10:28:25 -0500
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:44234)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iUBc5-0002CU-5s; Mon, 11 Nov 2019 10:28:21 -0500
Received: by mail-yb1-xb42.google.com with SMTP id g38so6313139ybe.11;
 Mon, 11 Nov 2019 07:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TMToojQjb4LkQHlyZn7r98q377dW+PcJDMvYM+oBKcU=;
 b=MjjIgdjlEv9gLe8d7DhqcAID7MxoTXXtw0tDhiMSoynixVhGgGRNTxdM0T4fwqg0yY
 DEhFtCJDRPZ0tG7OZensTTA2cRqS+FxE8zcCi9CP0gqjCqW5mcbpgyvuu4vuAWHcX+gk
 s+W5fiRKzUXxmaQqk0Le/qh4G7H23Da65lEKFOuR1glCXrJuv76CCO3wUzliN2ghNHE+
 2WDiH2epkR3V7RJYDllhPaGKVhTkbV4H4E9mDje/qWVQQa5WJqKGRXS1Lt2x/aTKETW1
 IGXbsqXMutJ4FiVvchD3NDo4p/vNvTLjQEtp3TInwUWpfxH3B1u754cypE0UKwzJBBll
 mKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TMToojQjb4LkQHlyZn7r98q377dW+PcJDMvYM+oBKcU=;
 b=NWhbKwcV9X5zl6dHnisJDXYBYKIs6W+EkklWmEcqZ7YXnXW/RDhBTF6G/y7+cdDjGH
 nkJpRBkHmqBHDwhsjIzehdxaSVg9xcGsD25t0G2Gs6I6OjZb/RzPlHBjgwYf9muI2oLe
 gvE0/NgP+xXGEDxfSKlznxl2wEDdTmC4NbK4m/1oYZKDiuUgV7jG6hLIJJK61z/e3/aA
 cKt8h343G0wf/aqe+6ow4ZFvqeW2YdiKtBruyzru+woORGEKSq30tLahEc6ehfeFThOj
 tteYM0i6ZnxjkuxaMy7JGl4LnbRqFkdWl2jRRXtO4KUFY7O1VyoT1Ygu2QXz4FHY2CgH
 wzEg==
X-Gm-Message-State: APjAAAUUtlhLlOE0B+7UQ8WFz7fjVMttH68RE8IjEZlDPn6mpGOTN44m
 Sx9G1T7t3fcpiYQ8KLwEFLDgJvRrasu7VDl5nQw=
X-Google-Smtp-Source: APXvYqxH+NylZgUAdZZ4urnINrmISZPDqSVccdgJGOVL7knRVM31R7jzn3yGZi1ervUPtYGqYMyFaDP36tPxK5bkqX4=
X-Received: by 2002:a25:42d6:: with SMTP id p205mr11713997yba.65.1573486100092; 
 Mon, 11 Nov 2019 07:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20191111133804.14454-1-anup.patel@wdc.com>
 <MN2PR04MB60618CCC891177DC612532E98D740@MN2PR04MB6061.namprd04.prod.outlook.com>
In-Reply-To: <MN2PR04MB60618CCC891177DC612532E98D740@MN2PR04MB6061.namprd04.prod.outlook.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 11 Nov 2019 23:28:08 +0800
Message-ID: <CAEUhbmVCjFHD6HbA1LS2xbbUGjL5goo3dZat_ZXWiTV=50LvTA@mail.gmail.com>
Subject: Re: [PATCH] riscv/virt: Add syscon reboot and poweroff DT nodes
To: Anup Patel <Anup.Patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Atish Patra <Atish.Patra@wdc.com>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, Christoph Hellwig <hch@lst.de>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
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
X-List-Received-Date: Mon, 11 Nov 2019 15:28:26 -0000

On Mon, Nov 11, 2019 at 9:42 PM Anup Patel <Anup.Patel@wdc.com> wrote:
>
> Correct Palmer's email address.
>
> > -----Original Message-----
> > From: Anup Patel
> > Sent: Monday, November 11, 2019 7:08 PM
> > To: Peter Maydell <peter.maydell@linaro.org>; Palmer Dabbelt
> > <palmer@sifive.com>; Alistair Francis <Alistair.Francis@wdc.com>; Sagar
> > Karandikar <sagark@eecs.berkeley.edu>
> > Cc: Atish Patra <Atish.Patra@wdc.com>; Christoph Hellwig <hch@lst.de>;
> > Anup Patel <anup@brainfault.org>; qemu-riscv@nongnu.org; qemu-
> > devel@nongnu.org; Anup Patel <Anup.Patel@wdc.com>
> > Subject: [PATCH] riscv/virt: Add syscon reboot and poweroff DT nodes
> >
> > The SiFive test device found on virt machine can be used by generic syscon
> > reboot and poweroff drivers available in Linux kernel.
> >
> > This patch updates FDT generation in virt machine so that Linux kernel can
> > probe and use generic syscon drivers.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  hw/riscv/virt.c | 28 ++++++++++++++++++++++++----
> >  1 file changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c index cc8f311e6b..fdfa359713
> > 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -182,11 +182,11 @@ static void create_fdt(RISCVVirtState *s, const
> > struct MemmapEntry *memmap,
> >      uint64_t mem_size, const char *cmdline)  {
> >      void *fdt;
> > -    int cpu;
> > +    int cpu, i;
> >      uint32_t *cells;
> >      char *nodename;
> > -    uint32_t plic_phandle, phandle = 1;
> > -    int i;
> > +    const char test_compat[] = "sifive,test0\0syscon";
> > +    uint32_t plic_phandle, test_phandle, phandle = 1;
> >      hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
> >      hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
> >
> > @@ -356,13 +356,33 @@ static void create_fdt(RISCVVirtState *s, const
> > struct MemmapEntry *memmap,
> >      create_pcie_irq_map(fdt, nodename, plic_phandle);
> >      g_free(nodename);
> >
> > +    test_phandle = phandle++;
> >      nodename = g_strdup_printf("/test@%lx",
> >          (long)memmap[VIRT_TEST].base);
> >      qemu_fdt_add_subnode(fdt, nodename);
> > -    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,test0");
> > +    qemu_fdt_setprop(fdt, nodename, "compatible",
> > +                     test_compat, sizeof(test_compat));
> >      qemu_fdt_setprop_cells(fdt, nodename, "reg",
> >          0x0, memmap[VIRT_TEST].base,
> >          0x0, memmap[VIRT_TEST].size);
> > +    qemu_fdt_setprop_cell(fdt, nodename, "phandle", test_phandle);
> > +    test_phandle = qemu_fdt_get_phandle(fdt, nodename);

Is this necessary?

> > +    g_free(nodename);
> > +
> > +    nodename = g_strdup_printf("/reboot");
> > +    qemu_fdt_add_subnode(fdt, nodename);
> > +    qemu_fdt_setprop_string(fdt, nodename, "compatible", "syscon-
> > reboot");
> > +    qemu_fdt_setprop_cell(fdt, nodename, "regmap", test_phandle);
> > +    qemu_fdt_setprop_cell(fdt, nodename, "offset", 0x0);
> > +    qemu_fdt_setprop_cell(fdt, nodename, "value", FINISHER_RESET);
> > +    g_free(nodename);
> > +
> > +    nodename = g_strdup_printf("/poweroff");
> > +    qemu_fdt_add_subnode(fdt, nodename);
> > +    qemu_fdt_setprop_string(fdt, nodename, "compatible", "syscon-
> > poweroff");
> > +    qemu_fdt_setprop_cell(fdt, nodename, "regmap", test_phandle);
> > +    qemu_fdt_setprop_cell(fdt, nodename, "offset", 0x0);
> > +    qemu_fdt_setprop_cell(fdt, nodename, "value", FINISHER_PASS);
> >      g_free(nodename);
> >
> >      nodename = g_strdup_printf("/uart@%lx",
> > --

Regards,
Bin

