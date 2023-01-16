Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHH7D-0007aQ-UF
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 23:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHH7B-0007a8-Vg; Sun, 15 Jan 2023 23:28:58 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHH79-0006CY-UJ; Sun, 15 Jan 2023 23:28:57 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id v127so23521397vsb.12;
 Sun, 15 Jan 2023 20:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zdQ7QV40m4r9rjVUwWGc4kb796wJ+CG1Nz0RJ97Bz9o=;
 b=bfJcAITOUvLM8G2JI0rnSkdWbQLhXmJEV/j6YJIPg7wbdOqoMnHxkeI+zU3iipvd0H
 BgGmh7v6PBxpkoLKagtNUpL16aXzA5KOx0k12tMsyllVhaXZDktWltGmTnlPJ+ki0vSO
 uhCaOYpV+unLh2DT5oPYFRyVM45yF2rHhp14/6pNujlfJi6O314WUlXu/GnEErB/ck9U
 uPJMHiwRBmom+L2Yx5HupBKpXDffavZ8cBvK/qwSKbnSgGgfPNB+gGUe95/Z5S3haoAP
 f1U3Edpda0ECvqP2S2YqjJ3YeefxiR2LaLKLLCKPe8btVROk+nSFW+lDEpuh9gHDXZDf
 4qyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zdQ7QV40m4r9rjVUwWGc4kb796wJ+CG1Nz0RJ97Bz9o=;
 b=xaQ1AB1hCmwpIIcV/NCjYsLvM+ecSijp+FtDSD6egIC0Ib9tXF73QLi5FrcY/+DTDk
 9pr16esaWrquqU8ZbedVCMxM2QbKHPlCy5tbhbCuGGuPuapBLjedbLaRgdz2IIKdr9kQ
 063d/VN6KBMYPPgxRfSQmDewHoVAkfkEX3oGVzWtp/llotyoCgh7Ljp13MgoeMDT1cpK
 jfKUB+SVsGFblNrGCUcucN8/eu3Vf4vU4HgE61RDFrWuBqJxmML8d3ZP7zsN+DXurepE
 xQa61D9b7iHhv5wE5O7lhFXlyRaYs0dSMZaWWTRktGAstoEvsWXlVJFm0oacVhawlQrn
 9jXw==
X-Gm-Message-State: AFqh2kqOvZVO0wMFZ4SvmeJqUAGXTpPbRnj/vEdi2ENLWuEFMXmIjFoI
 uNX1fUMQ5zQ/VefEAJsOe86sauPPVcsaIPhQXbE=
X-Google-Smtp-Source: AMrXdXs/VZ2E4G2CF+Jbu/i2pfaY5dZcLxpEhTQSZUkzxr/ORt6XpjFQGqdb+ySGrwJRN6T0s2Pbx+VjPaefzwbp6tU=
X-Received: by 2002:a67:c508:0:b0:3d3:c7d9:7b62 with SMTP id
 e8-20020a67c508000000b003d3c7d97b62mr449597vsk.72.1673843334533; Sun, 15 Jan
 2023 20:28:54 -0800 (PST)
MIME-Version: 1.0
References: <20230113171805.470252-1-dbarboza@ventanamicro.com>
 <20230113171805.470252-4-dbarboza@ventanamicro.com>
 <CAEUhbmUKEHX5bQ2=7GfgjPY1YVFs-5MqzkbwEy_SgG43WdeAfg@mail.gmail.com>
In-Reply-To: <CAEUhbmUKEHX5bQ2=7GfgjPY1YVFs-5MqzkbwEy_SgG43WdeAfg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 14:28:28 +1000
Message-ID: <CAKmqyKOGrdcoVWBzhuUpdDVwHdK6PREsLO1MypMQyggWdcHjJA@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] hw/riscv: clear kernel_entry higher bits in
 load_elf_ram_sym()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jan 2023 04:28:58 -0000

On Sat, Jan 14, 2023 at 11:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Jan 14, 2023 at 1:18 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
> >
> > Recent hw/risc/boot.c changes caused a regression in an use case with
> > the Xvisor hypervisor. Running a 32 bit QEMU guest with '-kernel'
> > stopped working. The reason seems to be that Xvisor is using 64 bit to
> > encode the 32 bit addresses from the guest, and load_elf_ram_sym() is
> > sign-extending the result with '1's [1].
>
> I would say it's not a regression of QEMU but something weird happened
> to Alistair's 32-bit Xvisor image.

I don't think it's a Xvisor issue.

>
> I just built a 32-bit Xvisor image from the latest Xvisor head
> following the instructions provided in its source tree. With the
> mainline QEMU only BIN file boots, but ELF does not. My 32-bit Xvisor
> image has an address of 0x10000000. Apparently this address is not
> correct, and the issue I saw is different from Alistair's. Alistair,
> could you investigate why your 32-bit Xvisor ELF image has an address
> of 0xffffffff80000000 set to kernel_load_base?

Looking in load_elf() in include/hw/elf_ops.h at this line:

    if (lowaddr)
        *lowaddr =3D (uint64_t)(elf_sword)low;

I can see that `low` is 0x80000000 but lowaddr is set to
0xffffffff80000000. So the address is being sign extended with 1s.

This patch seems to be the correct fix.

Alistair

>
> >
> > This can very well be an issue with Xvisor, but since it's not hard to
> > amend it in our side we're going for it. Use a translate_fn() callback
> > to be called by load_elf_ram_sym() and clear the higher bits of the
> > result if we're running a 32 bit CPU.
> >
> > [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html
> >
> > Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Suggested-by: Bin Meng <bmeng.cn@gmail.com>
> > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks for the patch. This should be the first patch of the series
though, so that we never break guest loading.

> > ---
> >  hw/riscv/boot.c            | 23 ++++++++++++++++++++++-
> >  hw/riscv/microchip_pfsoc.c |  4 ++--
> >  hw/riscv/opentitan.c       |  3 ++-
> >  hw/riscv/sifive_e.c        |  3 ++-
> >  hw/riscv/sifive_u.c        |  4 ++--
> >  hw/riscv/spike.c           |  2 +-
> >  hw/riscv/virt.c            |  4 ++--
> >  include/hw/riscv/boot.h    |  1 +
> >  8 files changed, 34 insertions(+), 10 deletions(-)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index e868fb6ade..7f8295bf5e 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -213,7 +213,27 @@ static void riscv_load_initrd(MachineState *machin=
e, uint64_t kernel_entry)
> >      }
> >  }
> >
> > +static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
> > +{
> > +    RISCVHartArrayState *harts =3D opaque;
> > +
> > +    /*
> > +     * For 32 bit CPUs, kernel_load_base is sign-extended (i.e.
> > +     * it can be padded with '1's) if the hypervisor, for some
> > +     * reason, is using 64 bit addresses with 32 bit guests.
> > +     *
> > +     * Clear the higher bits to avoid the padding if we're
> > +     * running a 32 bit CPU.
> > +     */
> > +    if (riscv_is_32bit(harts)) {
> > +        return addr & 0x0fffffff;
> > +    }
> > +
> > +    return addr;
> > +}
> > +
> >  target_ulong riscv_load_kernel(MachineState *machine,
> > +                               RISCVHartArrayState *harts,
> >                                 target_ulong kernel_start_addr,
> >                                 bool load_initrd,
> >                                 symbol_fn_t sym_cb)
> > @@ -231,7 +251,8 @@ target_ulong riscv_load_kernel(MachineState *machin=
e,
> >       * the (expected) load address load address. This allows kernels t=
o have
> >       * separate SBI and ELF entry points (used by FreeBSD, for example=
).
> >       */
> > -    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
> > +    if (load_elf_ram_sym(kernel_filename, NULL,
> > +                         translate_kernel_address, NULL,
> >                           NULL, &kernel_load_base, NULL, NULL, 0,
> >                           EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> >          kernel_entry =3D kernel_load_base;
> > diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> > index c45023a2b1..b7e171b605 100644
> > --- a/hw/riscv/microchip_pfsoc.c
> > +++ b/hw/riscv/microchip_pfsoc.c
> > @@ -629,8 +629,8 @@ static void microchip_icicle_kit_machine_init(Machi=
neState *machine)
> >          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u_c=
pus,
> >                                                           firmware_end_=
addr);
> >
> > -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr,
> > -                                         true, NULL);
> > +        kernel_entry =3D riscv_load_kernel(machine, &s->soc.u_cpus,
> > +                                         kernel_start_addr, true, NULL=
);
> >
> >          /* Compute the fdt load address in dram */
> >          fdt_load_addr =3D riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_L=
O].base,
> > diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> > index f6fd9725a5..1404a52da0 100644
> > --- a/hw/riscv/opentitan.c
> > +++ b/hw/riscv/opentitan.c
> > @@ -101,7 +101,8 @@ static void opentitan_board_init(MachineState *mach=
ine)
> >      }
> >
> >      if (machine->kernel_filename) {
> > -        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, false, N=
ULL);
> > +        riscv_load_kernel(machine, &s->soc.cpus,
> > +                          memmap[IBEX_DEV_RAM].base, false, NULL);
> >      }
> >  }
> >
> > diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> > index 6835d1c807..04939b60c3 100644
> > --- a/hw/riscv/sifive_e.c
> > +++ b/hw/riscv/sifive_e.c
> > @@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *mac=
hine)
> >                            memmap[SIFIVE_E_DEV_MROM].base, &address_spa=
ce_memory);
> >
> >      if (machine->kernel_filename) {
> > -        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base,
> > +        riscv_load_kernel(machine, &s->soc.cpus,
> > +                          memmap[SIFIVE_E_DEV_DTIM].base,
> >                            false, NULL);
> >      }
> >  }
> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > index 9a75d4aa62..214430d40c 100644
> > --- a/hw/riscv/sifive_u.c
> > +++ b/hw/riscv/sifive_u.c
> > @@ -598,8 +598,8 @@ static void sifive_u_machine_init(MachineState *mac=
hine)
> >          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u_c=
pus,
> >                                                           firmware_end_=
addr);
> >
> > -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr,
> > -                                         true, NULL);
> > +        kernel_entry =3D riscv_load_kernel(machine, &s->soc.u_cpus,
> > +                                         kernel_start_addr, true, NULL=
);
> >      } else {
> >         /*
> >          * If dynamic firmware is used, it doesn't know where is the ne=
xt mode
> > diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> > index c517885e6e..b3aac2178b 100644
> > --- a/hw/riscv/spike.c
> > +++ b/hw/riscv/spike.c
> > @@ -307,7 +307,7 @@ static void spike_board_init(MachineState *machine)
> >          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
> >                                                           firmware_end_=
addr);
> >
> > -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr,
> > +        kernel_entry =3D riscv_load_kernel(machine, &s->soc[0], kernel=
_start_addr,
> >                                           true, htif_symbol_callback);
> >      } else {
> >         /*
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index a931ed05ab..60c8729b5f 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -1281,8 +1281,8 @@ static void virt_machine_done(Notifier *notifier,=
 void *data)
> >          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
> >                                                           firmware_end_=
addr);
> >
> > -        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr,
> > -                                         true, NULL);
> > +        kernel_entry =3D riscv_load_kernel(machine, &s->soc[0],
> > +                                         kernel_start_addr, true, NULL=
);
> >      } else {
> >         /*
> >          * If dynamic firmware is used, it doesn't know where is the ne=
xt mode
> > diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> > index cbd131bad7..bc9faed397 100644
> > --- a/include/hw/riscv/boot.h
> > +++ b/include/hw/riscv/boot.h
> > @@ -44,6 +44,7 @@ target_ulong riscv_load_firmware(const char *firmware=
_filename,
> >                                   hwaddr firmware_load_addr,
> >                                   symbol_fn_t sym_cb);
> >  target_ulong riscv_load_kernel(MachineState *machine,
> > +                               RISCVHartArrayState *harts,
> >                                 target_ulong firmware_end_addr,
> >                                 bool load_initrd,
> >                                 symbol_fn_t sym_cb);
>
> Regards,
> Bin
>

